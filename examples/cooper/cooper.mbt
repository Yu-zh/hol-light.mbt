// Translated from upstream Examples/cooper.ml; edit this file directly.

///|
/// Examples/cooper.ml:5
fn step_1() -> Unit raise {
  @int.prioritize_int(())
}

///|
/// dest_mul
fn step_2() -> Unit raise {
  let t1 = @term_syntax.parse_term("int_mul")
  dest_mul_v1_c.set((x2 : @kernel.Term) => @basics.dest_binop(t1, x2))
}

///|
let dest_mul_v1_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_mul")

///|
/// `dest_mul`
pub fn dest_mul_v1(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_mul_v1_c.get())(x)
}

///|
/// dest_add
fn step_3() -> Unit raise {
  let t3 = @term_syntax.parse_term("int_add")
  dest_add_v1_c.set((x4 : @kernel.Term) => @basics.dest_binop(t3, x4))
}

///|
let dest_add_v1_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_add")

///|
/// `dest_add`
pub fn dest_add_v1(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_add_v1_c.get())(x)
}

///|
/// Examples/cooper.ml:18
fn step_4() -> Unit raise {
  @printer.parse_as_infix("divides", (12L, "right"))
}

///|
/// divides
fn step_5() -> Unit raise {
  divides_c.set(@pair.new_definition(@term_syntax.parse_term("divides((a : Int), (b : Int)) == (∃ x : Int, b == a * x)")))
}

///|
let divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divides")

///|
/// `divides`
pub fn divides() -> @kernel.Thm {
  divides_c.get()
}

///|
/// INT_DOWN2
fn step_6() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([@int.int_le_total(), @int.int_let_trans()]))
  int_down2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ c : Int, ∀ x : Int, x < c → x < a && x < b"), t5))
}

///|
let int_down2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DOWN2")

///|
/// `INT_DOWN2`
pub fn int_down2() -> @kernel.Thm {
  int_down2_c.get()
}

///|
/// DIVIDES_ADD
fn step_7() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([divides(), @int.int_add_ldistrib()]))
  divides_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, b) → divides(d, a + b)"), t6))
}

///|
let divides_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ADD")

///|
/// `DIVIDES_ADD`
pub fn divides_add() -> @kernel.Thm {
  divides_add_c.get()
}

///|
/// DIVIDES_SUB
fn step_8() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([divides(), @int.int_sub_ldistrib()]))
  divides_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, b) → divides(d, a - b)"), t7))
}

///|
let divides_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_SUB")

///|
/// `DIVIDES_SUB`
pub fn divides_sub() -> @kernel.Thm {
  divides_sub_c.get()
}

///|
/// DIVIDES_ADD_REVR
fn step_9() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([divides_sub(), @int.int_arith(@term_syntax.parse_term("(a : Int) + (b : Int) - a == b"))]))
  divides_add_revr_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, a) && divides(d, a + b) → divides(d, b)"), t8))
}

///|
let divides_add_revr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ADD_REVR")

///|
/// `DIVIDES_ADD_REVR`
pub fn divides_add_revr() -> @kernel.Thm {
  divides_add_revr_c.get()
}

///|
/// DIVIDES_ADD_REVL
fn step_10() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([divides_sub(), @int.int_arith(@term_syntax.parse_term("(a : Int) + (b : Int) - b == a"))]))
  divides_add_revl_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, b) && divides(d, a + b) → divides(d, a)"), t9))
}

///|
let divides_add_revl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ADD_REVL")

///|
/// `DIVIDES_ADD_REVL`
pub fn divides_add_revl() -> @kernel.Thm {
  divides_add_revl_c.get()
}

///|
/// DIVIDES_LMUL
fn step_11() -> Unit raise {
  let t10 = @meson.asm_meson_tac(@list.List([divides(), @int.int_arith(@term_syntax.parse_term("(a : Int) * ((b : Int) * (c : Int)) == b * (a * c)"))]))
  divides_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ x : Int, divides(d, a) → divides(d, x * a)"), t10))
}

///|
let divides_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LMUL")

///|
/// `DIVIDES_LMUL`
pub fn divides_lmul() -> @kernel.Thm {
  divides_lmul_c.get()
}

///|
/// DIVIDES_RNEG
fn step_12() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([@int.int_mul_rneg(), @int.int_neg_neg()]))
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([divides()])), t11)
  divides_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, divides(d, -a) == divides(d, a)"), t12))
}

///|
let divides_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_RNEG")

///|
/// `DIVIDES_RNEG`
pub fn divides_rneg() -> @kernel.Thm {
  divides_rneg_c.get()
}

///|
/// DIVIDES_LNEG
fn step_13() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([@int.int_mul_rneg(), @int.int_mul_lneg(), @int.int_neg_neg()]))
  let t14 = @tactics.then_tac(@simp.rewrite_tac(@list.List([divides()])), t13)
  divides_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ a : Int, divides(-d, a) == divides(d, a)"), t14))
}

///|
let divides_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LNEG")

///|
/// `DIVIDES_LNEG`
pub fn divides_lneg() -> @kernel.Thm {
  divides_lneg_c.get()
}

///|
/// INT_DOWN_MUL_LT
fn step_14() -> Unit raise {
  let t15 = @meson.meson_tac(@list.List([@int.int_arch(), @int.int_lt_refl(), @int.int_arith(@term_syntax.parse_term("((x : Int) - (y : Int) < (c : Int) * (d : Int)) == (x + -c * d < y)"))]))
  int_down_mul_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ d : Int, int_of_num(0) < d → (∃ c : Int, x + c * d < y)"), t15))
}

///|
let int_down_mul_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DOWN_MUL_LT")

///|
/// `INT_DOWN_MUL_LT`
pub fn int_down_mul_lt() -> @kernel.Thm {
  int_down_mul_lt_c.get()
}

///|
/// INT_MOD_LEMMA
fn step_15() -> Unit raise {
  let t71 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_suc()), @arith.lt()])), @int.int_arith_tac)
  let t70 = @tactics.pop_assum_list(fn(x69 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s66 = @tactics.mp_tac(x65)
      fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s66(x67)
      }
    })(((x68 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x68))(x69))
  })
  let t72 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.sub_0(), @arith.lt_refl(), @int.int_add_rid()])), t70), @int.int_arith_tac), t71])
  let t64 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) - 1 == n"))]))
  let t62 = @term_syntax.parse_term("(n : Num)")
  let t63 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t62)
  let t61 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(1) <= (x : Int) + ((c0 : Int) + int_of_num((n : Num))) * (d : Int)"))
  let t57 = @term_syntax.parse_term("(n : Num) - 1")
  let t60 = @tactics.first_x_assum(fn(x59 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s55 = @tactics.mp_tac(x54)
      fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s55(x56)
      }
    })(((x58 : @kernel.Thm) => @bool.spec(t57, x58))(x59))
  })
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.exists_tac(@term_syntax.parse_term("(c0 : Int) + int_of_num((n : Num))"))
  let t51 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(@tactics.strip_assume_tac))
  let t50 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(-((x : Int) + (a : Int) * (d : Int)) < (b : Int) * d) == (int_of_num(1) <= x + (a + b) * d)"))]))
  let t49 = @simp.gen_rewrite_tac(fn(x46 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s47 = @equal.land_conv(x46)
    fn(x48 : @kernel.Term) -> @kernel.Thm raise {
      s47(x48)
    }
  }, @list.List([@arith.num_wop()]))
  let t45 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t44 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_forall_pos())]))
  let t42 = @equal.gsym(@class.not_forall_thm())
  let t43 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool)) == !(a → !b)")), t42]))
  let t40 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.int_mul_lneg()), @int.int_lt_mul()]))
  let t39 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("(int_of_num(0) < -(c1 : Int) → int_of_num(0) < -(cd : Int)) && (xcod : Int) < int_of_num(0) → -xcod < cd → int_of_num(0) <= c1")))
  let t38 = @simp.simp_tac(@list.List([]))
  let t37 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t36 = @list.List([@meson.asm_meson_tac(@list.List([@int.int_arch(), @int.int_arith(@term_syntax.parse_term("int_of_num(0) < (d : Int) → !(d == int_of_num(0))"))])), @tactics.all_tac])
  let t41 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ c1 : Int, -((x : Int) + (c0 : Int) * (d : Int)) < c1 * d"), fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.mp_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }), t36), t37), @tactics.gen_tac), t38), t39), t40), @tactics.all_tac])
  let t32 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c1 : Int, int_of_num(0) <= c1 && -((x : Int) + (c0 : Int) * (d : Int)) < c1 * d"), fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s30 = @tactics.mp_tac(x29)
    fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s30(x31)
    }
  })
  let t26 = @term_syntax.parse_term("(c0 : Int)")
  let t28 = @tactics.disch_then((x27 : @kernel.Thm) => @tactics.x_choose_tac(t26, x27))
  let t23 = @drule.match_mp(int_down_mul_lt())
  let t19 = @term_syntax.parse_term("int_of_num(0)")
  let t20 = @list.List([@term_syntax.parse_term("(x : Int)"), t19])
  let t25 = @tactics.first_assum(fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s17 = @tactics.mp_tac(x16)
        fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s17(x18)
        }
      })(((x21 : @kernel.Thm) => @bool.specl(t20, x21))(x22))
    })(t23(x24))
  })
  let t73 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t25), t28), t32), t41), t43), t44), t45), t49), t50), t51), t52), t53), t60), t61), t63), @nums.induct_tac), t64), t72)
  int_mod_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ x : Int, int_of_num(0) < d → (∃ c : Int, int_of_num(1) <= x + c * d && x + c * d <= d)"), t73))
}

///|
let int_mod_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MOD_LEMMA")

///|
/// `INT_MOD_LEMMA`
pub fn int_mod_lemma() -> @kernel.Thm {
  int_mod_lemma_c.get()
}

///|
let cform_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cform_INDUCT")

///|
/// `cform_INDUCT`
pub fn cform_induct() -> @kernel.Thm {
  cform_induct_c.get()
}

///|
let cform_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cform_RECURSION")

///|
/// `cform_RECURSION`
pub fn cform_recursion() -> @kernel.Thm {
  cform_recursion_c.get()
}

///|
/// cform_INDUCT, cform_RECURSION
fn step_16() -> Unit raise {
  let (cform_induct, cform_recursion) = @ind_types.define_type("enum Cform { Lt(Int); Gt(Int); Eq(Int); Ne(Int); Divides(Int, Int); Ndivides(Int, Int); And(Cform, Cform); Or(Cform, Cform); Nox(Bool) }")
  cform_induct_c.set(cform_induct)
  cform_recursion_c.set(cform_recursion)
}

///|
/// interp
fn step_17() -> Unit raise {
  let t74 = @term_syntax.parse_term("(interp : (Int, Cform) -> Bool)((x : Int), Lt((e : Int))) == (x + e < int_of_num(0)) && interp(x, Gt(e)) == (x + e > int_of_num(0)) && interp(x, Eq(e)) == (x + e == int_of_num(0)) && interp(x, Ne(e)) == !(x + e == int_of_num(0)) && interp(x, Divides((c : Int), e)) == divides(c, x + e) && interp(x, Ndivides(c, e)) == !divides(c, x + e) && interp(x, And((p : Cform), (q : Cform))) == (interp(x, p) && interp(x, q)) && interp(x, Or(p, q)) == (interp(x, p) || interp(x, q)) && interp(x, Nox((P : Bool))) == P")
  interp_c.set(@recursion.new_recursive_definition(cform_recursion())(t74))
}

///|
let interp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interp")

///|
/// `interp`
pub fn interp() -> @kernel.Thm {
  interp_c.get()
}

///|
/// minusinf
fn step_18() -> Unit raise {
  let t75 = @term_syntax.parse_term("(minusinf : (Cform) -> Cform)(Lt((e : Int))) == Nox(true) && minusinf(Gt(e)) == Nox(false) && minusinf(Eq(e)) == Nox(false) && minusinf(Ne(e)) == Nox(true) && minusinf(Divides((c : Int), e)) == Divides(c, e) && minusinf(Ndivides(c, e)) == Ndivides(c, e) && minusinf(And((p : Cform), (q : Cform))) == And(minusinf(p), minusinf(q)) && minusinf(Or(p, q)) == Or(minusinf(p), minusinf(q)) && minusinf(Nox((P : Bool))) == Nox(P)")
  minusinf_c.set(@recursion.new_recursive_definition(cform_recursion())(t75))
}

///|
let minusinf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("minusinf")

///|
/// `minusinf`
pub fn minusinf() -> @kernel.Thm {
  minusinf_c.get()
}

///|
/// plusinf
fn step_19() -> Unit raise {
  let t76 = @term_syntax.parse_term("(plusinf : (Cform) -> Cform)(Lt((e : Int))) == Nox(false) && plusinf(Gt(e)) == Nox(true) && plusinf(Eq(e)) == Nox(false) && plusinf(Ne(e)) == Nox(true) && plusinf(Divides((c : Int), e)) == Divides(c, e) && plusinf(Ndivides(c, e)) == Ndivides(c, e) && plusinf(And((p : Cform), (q : Cform))) == And(plusinf(p), plusinf(q)) && plusinf(Or(p, q)) == Or(plusinf(p), plusinf(q)) && plusinf(Nox((P : Bool))) == Nox(P)")
  plusinf_c.set(@recursion.new_recursive_definition(cform_recursion())(t76))
}

///|
let plusinf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("plusinf")

///|
/// `plusinf`
pub fn plusinf() -> @kernel.Thm {
  plusinf_c.get()
}

///|
/// alldivide
fn step_20() -> Unit raise {
  let t77 = @term_syntax.parse_term("(alldivide : (Int, Cform) -> Bool)((d : Int), Lt((e : Int))) == true && alldivide(d, Gt(e)) == true && alldivide(d, Eq(e)) == true && alldivide(d, Ne(e)) == true && alldivide(d, Divides((c : Int), e)) == divides(c, d) && alldivide(d, Ndivides(c, e)) == divides(c, d) && alldivide(d, And((p : Cform), (q : Cform))) == (alldivide(d, p) && alldivide(d, q)) && alldivide(d, Or(p, q)) == (alldivide(d, p) && alldivide(d, q)) && alldivide(d, Nox((P : Bool))) == true")
  alldivide_c.set(@recursion.new_recursive_definition(cform_recursion())(t77))
}

///|
let alldivide_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("alldivide")

///|
/// `alldivide`
pub fn alldivide() -> @kernel.Thm {
  alldivide_c.get()
}

///|
/// aset
fn step_21() -> Unit raise {
  let t78 = @term_syntax.parse_term("(aset : (Cform, Int) -> Bool)(Lt((e : Int))) == {-e} && aset(Gt(e)) == {} && aset(Eq(e)) == {-e + int_of_num(1)} && aset(Ne(e)) == {-e} && aset(Divides((c : Int), e)) == {} && aset(Ndivides(c, e)) == {} && aset(And((p : Cform), (q : Cform))) == UNION(aset(p), aset(q)) && aset(Or(p, q)) == UNION(aset(p), aset(q)) && aset(Nox((P : Bool))) == {}")
  aset_c.set(@recursion.new_recursive_definition(cform_recursion())(t78))
}

///|
let aset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aset")

///|
/// `aset`
pub fn aset() -> @kernel.Thm {
  aset_c.get()
}

///|
/// bset
fn step_22() -> Unit raise {
  let t79 = @term_syntax.parse_term("(bset : (Cform, Int) -> Bool)(Lt((e : Int))) == {} && bset(Gt(e)) == {-e} && bset(Eq(e)) == {-(e + int_of_num(1))} && bset(Ne(e)) == {-e} && bset(Divides((c : Int), e)) == {} && bset(Ndivides(c, e)) == {} && bset(And((p : Cform), (q : Cform))) == UNION(bset(p), bset(q)) && bset(Or(p, q)) == UNION(bset(p), bset(q)) && bset(Nox((P : Bool))) == {}")
  bset_c.set(@recursion.new_recursive_definition(cform_recursion())(t79))
}

///|
let bset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bset")

///|
/// `bset`
pub fn bset() -> @kernel.Thm {
  bset_c.get()
}

///|
/// INT_EXISTS_CASES
fn step_23() -> Unit raise {
  let t102 = @meson.asm_meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(z : Int) < (y : Int) && y < (x : Int) - int_of_num((n : Num)) → z < x - (int_of_num(n) + int_of_num(1))"))]))
  let t101 = @simp.rewrite_tac(@list.List([@int.int_sub_rzero(), @equal.gsym(@int.int_of_num_suc())]))
  let t99 = @simp.asm_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) - (x - (y : Int)) == y"))]))
  let t95 = @term_syntax.parse_term("(x : Int) - (y : Int)")
  let t98 = @tactics.disch_then(fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s93 = @tactics.mp_tac(x92)
      fn(x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s93(x94)
      }
    })(((x96 : @kernel.Thm) => @bool.spec(t95, x96))(x97))
  })
  let t100 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_forall_pos()])), t98), t99)])
  let t91 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∃ y : Int, y < (x : Int) - int_of_num(n) && (P : (Int) -> Bool)(y)"), fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s89 = @tactics.mp_tac(x88)
    fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s89(x90)
    }
  })
  let t87 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t86 = @tactics.disj_cases_tac(@int.int_arith(@term_syntax.parse_term("(x : Int) < (y : Int) || int_of_num(0) <= x - y")))
  let t85 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Int)"))
  let t84 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)")), @class.not_forall_thm(), @class.not_imp()]))
  let t83 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(b : Bool) → (a : Bool)) → a || b")))
  let t80 = @term_syntax.parse_term("(x : Int)")
  let t82 = @tactics.disch_then((x81 : @kernel.Thm) => @tactics.x_choose_tac(t80, x81))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])), t82), t83), t84), @tactics.strip_tac), t85), t86), t87), t91), t100), @nums.induct_tac), t101), t102)
  int_exists_cases_c.set(@tactics.prove(@term_syntax.parse_term("(∃ x : Int, (P : (Int) -> Bool)(x)) == ((∀ y : Int, ∃ x : Int, x < y && P(x)) || (∃ x : Int, P(x) && (∀ y : Int, y < x → !P(y))))"), t103))
}

///|
let int_exists_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EXISTS_CASES")

///|
/// `INT_EXISTS_CASES`
pub fn int_exists_cases() -> @kernel.Thm {
  int_exists_cases_c.get()
}

///|
/// MINUSINF_LEMMA
fn step_24() -> Unit raise {
  let t114 = @simp.asm_simp_tac(@list.List([]))
  let t113 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t111 = @term_syntax.parse_term("(b : Int)")
  let t112 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Int)"), t111]), int_down2()))
  let t109 = @term_syntax.parse_term("(b : Int)")
  let t110 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Int)"), t109]))
  let t108 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t107 = @tactics.repeat_tac(@tactics.gen_tac)
  let t106 = @list.List([@meson.meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) < -(a : Int) → x + a < int_of_num(0)")), @int.int_gt_v1(), @int.int_lt_antisym(), @int.int_lt_refl()])), @tactics.all_tac])
  let t105 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) && (e : Bool) && (f : Bool) → a && b && c && d && e && f")))
  let t104 = @simp.rewrite_tac(@list.List([interp(), minusinf()]))
  let t115 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t104), t105), @tactics.conj_tac), t106), @tactics.conj_tac), t107), t108), t110), @tactics.strip_tac), t112), t113), t114)
  minusinf_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∃ y : Int, ∀ x : Int, x < y → interp(x, p) == interp(x, minusinf(p))"), t115))
}

///|
let minusinf_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINUSINF_LEMMA")

///|
/// `MINUSINF_LEMMA`
pub fn minusinf_lemma() -> @kernel.Thm {
  minusinf_lemma_c.get()
}

///|
/// MINUSINF_REPEATS
fn step_25() -> Unit raise {
  let t119 = @meson.meson_tac(@list.List([divides_lmul(), divides_add_revl(), divides_add()]))
  let t118 = @simp.once_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) + (d : Int) + (y : Int) == x + y + d"))]))
  let t117 = @simp.simp_tac(@list.List([interp(), minusinf(), alldivide()]))
  let t116 = @tactics.match_mp_tac(cform_induct())
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv)), t116), t117), t118), t119)
  minusinf_repeats_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ c : Int, ∀ d : Int, ∀ x : Int, alldivide(d, p) → interp(x, minusinf(p)) == interp(x + c * d, minusinf(p))"), t120))
}

///|
let minusinf_repeats_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINUSINF_REPEATS")

///|
/// `MINUSINF_REPEATS`
pub fn minusinf_repeats() -> @kernel.Thm {
  minusinf_repeats_c.get()
}

///|
/// NOMINIMAL_EQUIV
fn step_26() -> Unit raise {
  let t121 = @meson.asm_meson_tac(@list.List([minusinf_lemma(), minusinf_repeats(), int_down_mul_lt(), int_down2(), int_mod_lemma()]))
  nominimal_equiv_c.set(@tactics.prove(@term_syntax.parse_term("alldivide((d : Int), (p : Cform)) && int_of_num(0) < d → (∀ y : Int, ∃ x : Int, x < y && interp(x, p)) == (∃ j : Int, int_of_num(1) <= j && j <= d && interp(j, minusinf(p)))"), t121))
}

///|
let nominimal_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOMINIMAL_EQUIV")

///|
/// `NOMINIMAL_EQUIV`
pub fn nominimal_equiv() -> @kernel.Thm {
  nominimal_equiv_c.get()
}

///|
/// BDISJ_REPEATS_LEMMA
fn step_27() -> Unit raise {
  let t155 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t154 = @tactics.pop_assum_list(fn(x153 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s150 = @tactics.mp_tac(x149)
      fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s150(x151)
      }
    })(((x152 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x152))(x153))
  })
  let t143 = @int.int_arith(@term_syntax.parse_term("(x : Int) - (y : Int) + y == x"))
  let t144 = @meson.asm_meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) - (y : Int) + (z : Int) == x + z - y")), t143, divides_add()]))
  let t145 = @meson.asm_meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) - (y : Int) + (z : Int) == x + z - y")), divides_sub()]))
  let t142 = @term_syntax.parse_term("-(a : Int)")
  let t146 = @tactics.map_every(fn(x139 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s140 = @tactics.exists_tac(x139)
    fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s140(x141)
    }
  }, @list.List([@term_syntax.parse_term("(d : Int)"), t142]))
  let t138 = @term_syntax.parse_term("-(a : Int) - int_of_num(1)")
  let t147 = @tactics.map_every(fn(x135 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s136 = @tactics.exists_tac(x135)
    fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s136(x137)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(1)"), t138]))
  let t134 = @term_syntax.parse_term("-(a : Int)")
  let t148 = @list.List([@tactics.all_tac, @tactics.map_every(fn(x131 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s132 = @tactics.exists_tac(x131)
    fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s132(x133)
    }
  }, @list.List([@term_syntax.parse_term("(x : Int) + (a : Int)"), t134])), t147, t146, t145, t144])
  let t130 = @tactics.repeat_tac(@tactics.strip_tac)
  let t126 = @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))
  let t127 = @class.taut(@term_syntax.parse_term("((a : Bool) && ((b : Bool) || (c : Bool))) == (a && b || a && c)"))
  let t128 = @class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))
  let t129 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("!(a : Bool) || a")), t128, t127, t126, @class.de_morgan_thm(), @sets.in_union(), @theorems.exists_or_thm(), @theorems.forall_and_thm()]))])
  let t125 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool) && (f : Bool)) && (g : Bool) && (h : Bool) → a && b && c && d && e && f && g && h")))
  let t124 = @simp.rewrite_tac(@list.List([interp(), alldivide(), bset(), @sets.not_in_empty()]))
  let t123 = @tactics.match_mp_tac(cform_induct())
  let t122 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t156 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (b → a → c)"))]))), t122), @tactics.disch_tac), t123), t124), t125), @tactics.conj_tac), t129), t130), t148), t154), t155), @int.int_arith_tac)
  bdisj_repeats_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ p : Cform, alldivide(d, p) && int_of_num(0) < d → (∀ x : Int, interp(x, p) && !interp(x - d, p) → (∃ j : Int, ∃ b : Int, int_of_num(1) <= j && j <= d && IN(b, bset(p)) && x == b + j))"), t156))
}

///|
let bdisj_repeats_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BDISJ_REPEATS_LEMMA")

///|
/// `BDISJ_REPEATS_LEMMA`
pub fn bdisj_repeats_lemma() -> @kernel.Thm {
  bdisj_repeats_lemma_c.get()
}

///|
/// MAINTHM_B
fn step_28() -> Unit raise {
  let t187 = @meson.asm_meson_tac(@list.List([]))
  let t183 = @term_syntax.parse_term("(x : Int)")
  let t186 = @tactics.disch_then(fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s181 = @tactics.mp_tac(x180)
      fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s181(x182)
      }
    })(((x184 : @kernel.Thm) => @bool.spec(t183, x184))(x185))
  })
  let t179 = @simp.asm_rewrite_tac(@list.List([]))
  let t177 = @term_syntax.parse_term("(p : Cform)")
  let t178 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Int)"), t177]), bdisj_repeats_lemma()))
  let t176 = @simp.asm_simp_tac(@list.List([@int.int_arith(@term_syntax.parse_term("int_of_num(0) < (d : Int) → (x : Int) - d < x"))]))
  let t171 = @term_syntax.parse_term("(x : Int) - (d : Int)")
  let t174 = @tactics.conjuncts_then2(fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s166 = @tactics.assume_tac(x165)
    fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s166(x167)
    }
  }, fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s169 = @tactics.mp_tac(x168)
      fn(x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s169(x170)
      }
    })(((x172 : @kernel.Thm) => @bool.spec(t171, x172))(x173))
  })
  let t175 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Int)"))(t174))
  let t162 = @meson.meson_tac(@list.List([]))
  let t163 = @meson.asm_meson_tac(@list.List([nominimal_equiv()]))
  let t164 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(int_exists_cases())])), t163, @tactics.all_tac, t162])
  let t161 = @tactics.repeat_tac(@tactics.conj_tac)
  let t160 = @tactics.exists_tac(@term_syntax.parse_term("∃ x : Int, interp(x, (p : Cform)) && (∀ y : Int, y < x → !interp(y, p))"))
  let t159 = @tactics.exists_tac(@term_syntax.parse_term("∀ y : Int, ∃ x : Int, x < y && interp(x, (p : Cform))"))
  let t158 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ a1 : Bool, ∀ a2 : Bool, (a : Bool) == (a1 || a2) && a1 == (b : Bool) && (a2 → (c : Bool)) && (c → a) → a == (b || c)")))
  let t157 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && ((b : Bool) || (c : Bool))) == (a && b || a && c)")), @theorems.exists_or_thm()]))
  let t188 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t157), t158), t159), t160), t161), t164), t175), t176), @tactics.disch_tac), t178), t179), t186), t187)
  mainthm_b_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ d : Int, alldivide(d, p) && int_of_num(0) < d → (∃ x : Int, interp(x, p)) == (∃ j : Int, int_of_num(1) <= j && j <= d && (interp(j, minusinf(p)) || (∃ b : Int, IN(b, bset(p)) && interp(b + j, p))))"), t188))
}

///|
let mainthm_b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAINTHM_B")

///|
/// `MAINTHM_B`
pub fn mainthm_b() -> @kernel.Thm {
  mainthm_b_c.get()
}

///|
/// mirror
fn step_29() -> Unit raise {
  let t189 = @term_syntax.parse_term("(mirror : (Cform) -> Cform)(Lt((e : Int))) == Gt(-e) && mirror(Gt(e)) == Lt(-e) && mirror(Eq(e)) == Eq(-e) && mirror(Ne(e)) == Ne(-e) && mirror(Divides((c : Int), e)) == Divides(c, -e) && mirror(Ndivides(c, e)) == Ndivides(c, -e) && mirror(And((p : Cform), (q : Cform))) == And(mirror(p), mirror(q)) && mirror(Or(p, q)) == Or(mirror(p), mirror(q)) && mirror(Nox((P : Bool))) == Nox(P)")
  mirror_c.set(@recursion.new_recursive_definition(cform_recursion())(t189))
}

///|
let mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mirror")

///|
/// `mirror`
pub fn mirror() -> @kernel.Thm {
  mirror_c.get()
}

///|
/// INTERP_MIRROR_LEMMA
fn step_30() -> Unit raise {
  let t191 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_neg_add()), divides_rneg()]))
  let t190 = @simp.simp_tac(@list.List([mirror(), interp()]))
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t190), t191), @int.int_arith_tac)
  interp_mirror_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ x : Int, interp(-x, mirror(p)) == interp(x, p)"), t192))
}

///|
let interp_mirror_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERP_MIRROR_LEMMA")

///|
/// `INTERP_MIRROR_LEMMA`
pub fn interp_mirror_lemma() -> @kernel.Thm {
  interp_mirror_lemma_c.get()
}

///|
/// INTERP_MIRROR
fn step_31() -> Unit raise {
  let t193 = @meson.meson_tac(@list.List([interp_mirror_lemma(), @int.int_neg_neg()]))
  interp_mirror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ x : Int, interp(x, mirror(p)) == interp(-x, p)"), t193))
}

///|
let interp_mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERP_MIRROR")

///|
/// `INTERP_MIRROR`
pub fn interp_mirror() -> @kernel.Thm {
  interp_mirror_c.get()
}

///|
/// BSET_MIRROR
fn step_32() -> Unit raise {
  let t196 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing()]))
  let t195 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @sets.image_union()]))
  let t194 = @simp.simp_tac(@list.List([mirror(), aset(), bset()]))
  let t197 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t194), t195), t196), @int.int_arith_tac)
  bset_mirror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, bset(mirror(p)) == IMAGE(op_minus_minus, aset(p))"), t197))
}

///|
let bset_mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BSET_MIRROR")

///|
/// `BSET_MIRROR`
pub fn bset_mirror() -> @kernel.Thm {
  bset_mirror_c.get()
}

///|
/// MINUSINF_MIRROR
fn step_33() -> Unit raise {
  let t198 = @simp.simp_tac(@list.List([plusinf(), minusinf(), mirror()]))
  let t199 = @tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t198)
  minusinf_mirror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, minusinf(mirror(p)) == mirror(plusinf(p))"), t199))
}

///|
let minusinf_mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINUSINF_MIRROR")

///|
/// `MINUSINF_MIRROR`
pub fn minusinf_mirror() -> @kernel.Thm {
  minusinf_mirror_c.get()
}

///|
/// PLUSINF_MIRROR
fn step_34() -> Unit raise {
  let t200 = @simp.simp_tac(@list.List([plusinf(), minusinf(), mirror(), @int.int_neg_neg()]))
  let t201 = @tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t200)
  plusinf_mirror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, plusinf(p) == mirror(minusinf(mirror(p)))"), t201))
}

///|
let plusinf_mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLUSINF_MIRROR")

///|
/// `PLUSINF_MIRROR`
pub fn plusinf_mirror() -> @kernel.Thm {
  plusinf_mirror_c.get()
}

///|
/// ALLDIVIDE_MIRROR
fn step_35() -> Unit raise {
  let t202 = @simp.simp_tac(@list.List([mirror(), alldivide()]))
  let t203 = @tactics.then_tac(@tactics.match_mp_tac(cform_induct()), t202)
  alldivide_mirror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ d : Int, alldivide(d, mirror(p)) == alldivide(d, p)"), t203))
}

///|
let alldivide_mirror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLDIVIDE_MIRROR")

///|
/// `ALLDIVIDE_MIRROR`
pub fn alldivide_mirror() -> @kernel.Thm {
  alldivide_mirror_c.get()
}

///|
/// EXISTS_NEG
fn step_36() -> Unit raise {
  let t204 = @meson.meson_tac(@list.List([@int.int_neg_neg()]))
  exists_neg_c.set(@tactics.prove(@term_syntax.parse_term("(∃ x : Int, (P : (Int) -> Bool)(-x)) == (∃ x : Int, P(x))"), t204))
}

///|
let exists_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_NEG")

///|
/// `EXISTS_NEG`
pub fn exists_neg() -> @kernel.Thm {
  exists_neg_c.get()
}

///|
/// FORALL_NEG
fn step_37() -> Unit raise {
  let t205 = @meson.meson_tac(@list.List([@int.int_neg_neg()]))
  forall_neg_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Int, (P : (Int) -> Bool)(-x)) == (∀ x : Int, P(x))"), t205))
}

///|
let forall_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_NEG")

///|
/// `FORALL_NEG`
pub fn forall_neg() -> @kernel.Thm {
  forall_neg_c.get()
}

///|
/// EXISTS_MOD_IMP
fn step_38() -> Unit raise {
  let t229 = @term_syntax.parse_term("!((d : Int) == (j : Int))")
  let t230 = @term_syntax.parse_term("(j : Int) <= (d : Int)")
  let t231 = @tactics.map_every(fn(x226 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s227 = @tactics.undisch_tac(x226)
    fn(x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s227(x228)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(1) <= (j : Int)"), t230, t229]))
  let t225 = @simp.asm_rewrite_tac(@list.List([]))
  let t224 = @tactics.exists_tac(@term_syntax.parse_term("(d : Int) - (j : Int)"))
  let t223 = @simp.asm_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-(j : Int) + int_of_num(1) * (d : Int) == d - j"))]))
  let t219 = @term_syntax.parse_term("-(j : Int)")
  let t220 = @list.List([@term_syntax.parse_term("int_of_num(1)"), t219])
  let t232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s217 = @tactics.mp_tac(x216)
      fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s217(x218)
      }
    })(((x221 : @kernel.Thm) => @bool.specl(t220, x221))(x222))
  }), t223), @tactics.disch_tac), t224), t225), t231), @int.int_arith_tac)
  let t215 = @meson.asm_meson_tac(@list.List([@int.int_le_refl()]))
  let t214 = @simp.asm_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(d : Int) + -int_of_num(2) * d == -d"))]))
  let t210 = @term_syntax.parse_term("(d : Int)")
  let t211 = @list.List([@term_syntax.parse_term("-int_of_num(2)"), t210])
  let t233 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s208 = @tactics.mp_tac(x207)
      fn(x209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s208(x209)
      }
    })(((x212 : @kernel.Thm) => @bool.specl(t211, x212))(x213))
  }), t214), t215), t232])
  let t206 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Int) == (j : Int)"))
  let t234 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t206), t233)
  exists_mod_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ d : Int, (∀ c : Int, ∀ x : Int, P(x + c * d) == P(x)) && (∃ j : Int, int_of_num(1) <= j && j <= d && P(-j)) → (∃ j : Int, int_of_num(1) <= j && j <= d && P(j))"), t234))
}

///|
let exists_mod_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MOD_IMP")

///|
/// `EXISTS_MOD_IMP`
pub fn exists_mod_imp() -> @kernel.Thm {
  exists_mod_imp_c.get()
}

///|
/// EXISTS_MOD_EQ
fn step_39() -> Unit raise {
  let t246 = @meson.meson_tac(@list.List([]))
  let t245 = @simp.asm_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-((x : Int) + (c : Int) * (d : Int)) == -x + -c * d")), forall_neg()]))
  let t244 = @simp.asm_rewrite_tac(@list.List([@int.int_neg_neg()]))
  let t240 = @term_syntax.parse_term("(d : Int)")
  let t243 = @tactics.disch_then(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s238 = @tactics.mp_tac(x237)
      fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s238(x239)
      }
    })(((x241 : @kernel.Thm) => @bool.spec(t240, x241))(x242))
  })
  let t235 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Int) => (P : (Int) -> Bool)(-x)"), exists_mod_imp()))
  let t236 = @list.List([@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(P : (Int) -> Bool)"), exists_mod_imp())), t235])
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t236), t243), t244), t245), t246)
  exists_mod_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ d : Int, (∀ c : Int, ∀ x : Int, P(x + c * d) == P(x)) → (∃ j : Int, int_of_num(1) <= j && j <= d && P(-j)) == (∃ j : Int, int_of_num(1) <= j && j <= d && P(j))"), t247))
}

///|
let exists_mod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MOD_EQ")

///|
/// `EXISTS_MOD_EQ`
pub fn exists_mod_eq() -> @kernel.Thm {
  exists_mod_eq_c.get()
}

///|
/// MAINTHM_A
fn step_40() -> Unit raise {
  let t278 = @simp.asm_simp_tac(@list.List([@equal.gsym(minusinf_repeats())]))
  let t277 = @tactics.match_mp_tac(@equal.gsym(exists_mod_eq()))
  let t276 = @tactics.repeat_tac(@tactics.strip_tac)
  let t275 = @simp.rewrite_tac(@list.List([interp_mirror()]))
  let t273 = @term_syntax.parse_term("(q : Cform)")
  let t274 = @tactics.spec_tac(@term_syntax.parse_term("mirror((p : Cform))"), t273)
  let t270 = @simp.gen_rewrite_rule(fn(x269 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x269
  }, @list.List([@equal.gsym(alldivide_mirror())]))
  let t272 = @tactics.first_assum(fn(x271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s267 = @tactics.mp_tac(x266)
      fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s267(x268)
      }
    })(t270(x271))
  })
  let t265 = @simp.rewrite_tac(@list.List([plusinf_mirror()]))
  let t263 = @meson.meson_tac(@list.List([@int.int_neg_neg()]))
  let t262 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-((b : Int) + (j : Int)) == -b - j")), @sets.in_image()]))
  let t264 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([interp_mirror(), minusinf_mirror(), bset_mirror()])), t262), t263)])
  let t260 = @class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))
  let t261 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && ((b : Bool) || (c : Bool))) == (a && b || a && c)")), t260, @theorems.exists_or_thm()]))
  let t259 = @tactics.disch_then(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s257 = @tactics.subst1_tac(x256)
    fn(x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s257(x258)
    }
  })
  let t255 = @simp.asm_rewrite_tac(@list.List([alldivide_mirror()]))
  let t253 = @term_syntax.parse_term("(d : Int)")
  let t254 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("mirror((p : Cform))"), t253]), mainthm_b()))
  let t252 = @simp.rewrite_tac(@list.List([@equal.gsym(interp_mirror())]))
  let t251 = @simp.gen_rewrite_tac(fn(x248 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s249 = @equal.land_conv(x248)
    fn(x250 : @kernel.Term) -> @kernel.Thm raise {
      s249(x250)
    }
  }, @list.List([@equal.gsym(exists_neg())]))
  let t279 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t251), t252), t254), t255), t259), t261), @tactics.binop_tac), t264), t265), t272), t274), t275), t276), t277), t278)
  mainthm_a_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cform, ∀ d : Int, alldivide(d, p) && int_of_num(0) < d → (∃ x : Int, interp(x, p)) == (∃ j : Int, int_of_num(1) <= j && j <= d && (interp(j, plusinf(p)) || (∃ a : Int, IN(a, aset(p)) && interp(a - j, p))))"), t279))
}

///|
let mainthm_a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAINTHM_A")

///|
/// `MAINTHM_A`
pub fn mainthm_a() -> @kernel.Thm {
  mainthm_a_c.get()
}

///|
/// EXISTS_MULTIPLE_THM_1
fn step_41() -> Unit raise {
  let t280 = @simp.rewrite_tac(@list.List([@int.int_mul_lid()]))
  exists_multiple_thm_1_c.set(@tactics.prove(@term_syntax.parse_term("(∃ x : Int, (P : (Int) -> Bool)(int_of_num(1) * x)) == (∃ x : Int, P(x))"), t280))
}

///|
let exists_multiple_thm_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MULTIPLE_THM_1")

///|
/// `EXISTS_MULTIPLE_THM_1`
pub fn exists_multiple_thm_1() -> @kernel.Thm {
  exists_multiple_thm_1_c.get()
}

///|
/// EXISTS_MULTIPLE_THM
fn step_42() -> Unit raise {
  let t281 = @meson.meson_tac(@list.List([divides()]))
  exists_multiple_thm_c.set(@tactics.prove(@term_syntax.parse_term("(∃ x : Int, (P : (Int) -> Bool)((c : Int) * x)) == (∃ x : Int, divides(c, x) && P(x))"), t281))
}

///|
let exists_multiple_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_MULTIPLE_THM")

///|
/// `EXISTS_MULTIPLE_THM`
pub fn exists_multiple_thm() -> @kernel.Thm {
  exists_multiple_thm_c.get()
}

///|
/// `earlier`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] earlier(x282 : @list.List[TA], x283 : TA, x284 : TA) -> Bool raise {
  let vars = x282
  let x = x283
  let y = x284
  match vars {
    More(z, tail=ovs) => {
      if (z == y) {
        false
      } else {
        if (z == x) {
          true
        } else {
          earlier(ovs, x, y)
        }
      }
    }
    Empty => (@lib.compare(x, y) < 0)
  }
}

///|
/// is_num_const
fn step_43() -> Unit raise {
  let ptm = @term_syntax.parse_term("int_of_num")
  is_num_const_c.set(fn(x285 : @kernel.Term) -> Bool raise {
    let tm = x285
    try {
      let (l, r) = @kernel.dest_comb(tm)
      ((l == ptm) && @nums.is_numeral(r))
    } catch {
      Failure(_) => false
      e => raise e
    }
  })
}

///|
let is_num_const_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_num_const")

///|
/// `is_num_const`
pub fn is_num_const(x : @kernel.Term) -> Bool raise {
  (is_num_const_c.get())(x)
}

///|
let mk_num_const_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_num_const")

///|
/// `mk_num_const`
pub fn mk_num_const(x : @num.Num) -> @kernel.Term raise {
  (mk_num_const_c.get())(x)
}

///|
let dest_num_const_c : @lib.Cell[(@kernel.Term) -> @num.Num raise] = @lib.Cell::new("dest_num_const")

///|
/// `dest_num_const`
pub fn dest_num_const(x : @kernel.Term) -> @num.Num raise {
  (dest_num_const_c.get())(x)
}

///|
/// mk_num_const, dest_num_const
fn step_44() -> Unit raise {
  let ptm = @term_syntax.parse_term("int_of_num")
  let (mk_num_const, dest_num_const) = (fn(x286 : @num.Num) -> @kernel.Term raise {
    let n = x286
    @kernel.mk_comb(ptm, @nums.mk_numeral(n))
  }, fn(x287 : @kernel.Term) -> @num.Num raise {
    let tm = x287
    let (l, r) = @kernel.dest_comb(tm)
    if (l == ptm) {
      @basics.dest_numeral(r)
    } else {
      raise Failure("dest_num_const")
    }
  })
  mk_num_const_c.set(mk_num_const)
  dest_num_const_c.set(dest_num_const)
}

///|
/// is_int_const
fn step_45() -> Unit raise {
  let ptm = @term_syntax.parse_term("op_minus_minus")
  is_int_const_c.set(fn(x288 : @kernel.Term) -> Bool raise {
    let tm = x288
    (is_num_const(tm) || (try {
      let (l, r) = @kernel.dest_comb(tm)
      ((l == ptm) && is_num_const(r))
    } catch {
      Failure(_) => false
      e => raise e
    }))
  })
}

///|
let is_int_const_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_int_const")

///|
/// `is_int_const`
pub fn is_int_const(x : @kernel.Term) -> Bool raise {
  (is_int_const_c.get())(x)
}

///|
let mk_int_const_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_int_const")

///|
/// `mk_int_const`
pub fn mk_int_const(x : @num.Num) -> @kernel.Term raise {
  (mk_int_const_c.get())(x)
}

///|
let dest_int_const_c : @lib.Cell[(@kernel.Term) -> @num.Num raise] = @lib.Cell::new("dest_int_const")

///|
/// `dest_int_const`
pub fn dest_int_const(x : @kernel.Term) -> @num.Num raise {
  (dest_int_const_c.get())(x)
}

///|
/// mk_int_const, dest_int_const
fn step_46() -> Unit raise {
  let ptm = @term_syntax.parse_term("op_minus_minus")
  let (mk_int_const, dest_int_const) = (fn(x289 : @num.Num) -> @kernel.Term raise {
    let n = x289
    if @num.lt_num(n, @num.num_of_int64(0L)) {
      @kernel.mk_comb(ptm, mk_num_const(@num.minus_num(n)))
    } else {
      mk_num_const(n)
    }
  }, fn(x290 : @kernel.Term) -> @num.Num raise {
    let tm = x290
    if (try {
      (@kernel.rator(tm) == ptm)
    } catch {
      Failure(_) => false
      e => raise e
    }) {
      @num.minus_num(dest_num_const(@kernel.rand(tm)))
    } else {
      dest_num_const(tm)
    }
  })
  mk_int_const_c.set(mk_int_const)
  dest_int_const_c.set(dest_int_const)
}

///|
let int_le_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_LE_CONV")

///|
/// `INT_LE_CONV`
pub fn int_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_le_conv_c.get())(x)
}

///|
let int_lt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_LT_CONV")

///|
/// `INT_LT_CONV`
pub fn int_lt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_lt_conv_c.get())(x)
}

///|
let int_ge_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_GE_CONV")

///|
/// `INT_GE_CONV`
pub fn int_ge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_ge_conv_c.get())(x)
}

///|
let int_gt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_GT_CONV")

///|
/// `INT_GT_CONV`
pub fn int_gt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_gt_conv_c.get())(x)
}

///|
let int_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_EQ_CONV")

///|
/// `INT_EQ_CONV`
pub fn int_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_eq_conv_c.get())(x)
}

///|
/// INT_LE_CONV, INT_LT_CONV, INT_GE_CONV, INT_GT_CONV, INT_EQ_CONV
fn step_47() -> Unit raise {
  let tth = @class.taut(@term_syntax.parse_term("(false && false) == false && (false && true) == false && (true && false) == false && (true && true) == true"))
  let nth = @class.taut(@term_syntax.parse_term("!true == false && !false == true"))
  let t292 = @simp.gen_rewrite_conv(fn(x291 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x291
  }, @list.List([tth]))
  let num2_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.comb2_conv(@equal.rand_conv(@calc_num.num_eq_conv), @calc_num.num_eq_conv), t292)
  let t294 = @simp.gen_rewrite_conv(fn(x293 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x293
  }, @list.List([nth]))
  let num2_ne_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.rand_conv(num2_eq_conv), t294)
  let t298 = @simp.rewrite_tac(@list.List([@arith.le(), @arith.add_eq_0()]))
  let t297 = @simp.rewrite_tac(@list.List([@int.int_of_num_add(), @int.int_of_num_le(), @arith.le_0()]))
  let t296 = @simp.rewrite_tac(@list.List([@int.int_le_lneg(), @int.int_le_rneg()]))
  let t299 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_le_neg2()])), t296), t297), t298)
  let t300 = (@term_syntax.parse_term("(-int_of_num((m : Num)) <= int_of_num((n : Num))) == true && (int_of_num(m) <= int_of_num(n)) == (m <= n) && (-int_of_num(m) <= -int_of_num(n)) == (n <= m) && (int_of_num(m) <= -int_of_num(n)) == (m == 0 && n == 0)"), t299)
  let (int_le_conv_1, int_lt_conv_1, int_ge_conv_1, int_gt_conv_1, int_eq_conv_1) = match @bool.conjuncts_rule((fn(x295 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x295.0, x295.1)
  })(t300)) {
    More(pth_le1, tail=More(pth_le2a, tail=More(pth_le2b, tail=More(pth_le3, tail=Empty)))) => {
      let t304 = @equal.thenc(@simp.gen_rewrite_conv(fn(x303 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x303
      }, @list.List([pth_le3])), num2_eq_conv)
      let t305 = @equal.thenc(@simp.gen_rewrite_conv(fn(x302 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x302
      }, @list.List([pth_le2a, pth_le2b])), @calc_num.num_le_conv)
      let int_le_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(@list.List([@simp.gen_rewrite_conv(fn(x301 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x301
      }, @list.List([pth_le1])), t305, t304]))
      let t308 = @tactics.conv_tac(@class.taut)
      let t307 = @equal.gsym(@int.int_not_le())
      let t309 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pth_le1, pth_le2a, pth_le2b, pth_le3, @equal.gsym(@arith.not_le()), t307])), t308)
      let t310 = (@term_syntax.parse_term("(int_of_num((m : Num)) < -int_of_num((n : Num))) == false && (int_of_num(m) < int_of_num(n)) == (m < n) && (-int_of_num(m) < -int_of_num(n)) == (n < m) && (-int_of_num(m) < int_of_num(n)) == !(m == 0 && n == 0)"), t309)
      match @bool.conjuncts_rule((fn(x306 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
        @tactics.prove(x306.0, x306.1)
      })(t310)) {
        More(pth_lt1, tail=More(pth_lt2a, tail=More(pth_lt2b, tail=More(pth_lt3, tail=Empty)))) => {
          let t314 = @equal.thenc(@simp.gen_rewrite_conv(fn(x313 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x313
          }, @list.List([pth_lt3])), num2_ne_conv)
          let t315 = @equal.thenc(@simp.gen_rewrite_conv(fn(x312 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x312
          }, @list.List([pth_lt2a, pth_lt2b])), @calc_num.num_lt_conv)
          let int_lt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(@list.List([@simp.gen_rewrite_conv(fn(x311 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x311
          }, @list.List([pth_lt1])), t315, t314]))
          let t317 = @tactics.conv_tac(@class.taut)
          let t318 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pth_le1, pth_le2a, pth_le2b, pth_le3, @int.int_ge_v1()])), t317)
          let t319 = (@term_syntax.parse_term("(int_of_num((m : Num)) >= -int_of_num((n : Num))) == true && (int_of_num(m) >= int_of_num(n)) == (n <= m) && (-int_of_num(m) >= -int_of_num(n)) == (m <= n) && (-int_of_num(m) >= int_of_num(n)) == (m == 0 && n == 0)"), t318)
          match @bool.conjuncts_rule((fn(x316 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
            @tactics.prove(x316.0, x316.1)
          })(t319)) {
            More(pth_ge1, tail=More(pth_ge2a, tail=More(pth_ge2b, tail=More(pth_ge3, tail=Empty)))) => {
              let t323 = @equal.thenc(@simp.gen_rewrite_conv(fn(x322 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x322
              }, @list.List([pth_ge3])), num2_eq_conv)
              let t324 = @equal.thenc(@simp.gen_rewrite_conv(fn(x321 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x321
              }, @list.List([pth_ge2a, pth_ge2b])), @calc_num.num_le_conv)
              let int_ge_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(@list.List([@simp.gen_rewrite_conv(fn(x320 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x320
              }, @list.List([pth_ge1])), t324, t323]))
              let t326 = @tactics.conv_tac(@class.taut)
              let t327 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pth_lt1, pth_lt2a, pth_lt2b, pth_lt3, @int.int_gt_v1()])), t326)
              let t328 = (@term_syntax.parse_term("(-int_of_num((m : Num)) > int_of_num((n : Num))) == false && (int_of_num(m) > int_of_num(n)) == (n < m) && (-int_of_num(m) > -int_of_num(n)) == (m < n) && (int_of_num(m) > -int_of_num(n)) == !(m == 0 && n == 0)"), t327)
              match @bool.conjuncts_rule((fn(x325 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
                @tactics.prove(x325.0, x325.1)
              })(t328)) {
                More(pth_gt1, tail=More(pth_gt2a, tail=More(pth_gt2b, tail=More(pth_gt3, tail=Empty)))) => {
                  let t332 = @equal.thenc(@simp.gen_rewrite_conv(fn(x331 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x331
                  }, @list.List([pth_gt3])), num2_ne_conv)
                  let t333 = @equal.thenc(@simp.gen_rewrite_conv(fn(x330 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x330
                  }, @list.List([pth_gt2a, pth_gt2b])), @calc_num.num_lt_conv)
                  let int_gt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(@list.List([@simp.gen_rewrite_conv(fn(x329 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x329
                  }, @list.List([pth_gt1])), t333, t332]))
                  let t337 = @tactics.conv_tac(@class.taut)
                  let t336 = @simp.rewrite_tac(@list.List([pth_le1, pth_le2a, pth_le2b, pth_le3, @arith.le(), @arith.le_0()]))
                  let t335 = @equal.gsym(@arith.le_antisym())
                  let t338 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_le_antisym()), t335])), t336), t337)
                  let t339 = (@term_syntax.parse_term("(int_of_num((m : Num)) == int_of_num((n : Num))) == (m == n) && (-int_of_num(m) == -int_of_num(n)) == (m == n) && (-int_of_num(m) == int_of_num(n)) == (m == 0 && n == 0) && (int_of_num(m) == -int_of_num(n)) == (m == 0 && n == 0)"), t338)
                  match @bool.conjuncts_rule((fn(x334 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
                    @tactics.prove(x334.0, x334.1)
                  })(t339)) {
                    More(pth_eq1a, tail=More(pth_eq1b, tail=More(pth_eq2a, tail=More(pth_eq2b, tail=Empty)))) => {
                      let t342 = @equal.thenc(@simp.gen_rewrite_conv(fn(x341 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x341
                      }, @list.List([pth_eq2a, pth_eq2b])), num2_eq_conv)
                      let int_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(@list.List([@equal.thenc(@simp.gen_rewrite_conv(fn(x340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x340
                      }, @list.List([pth_eq1a, pth_eq1b])), @calc_num.num_eq_conv), t342]))
                      (int_le_conv, int_lt_conv, int_ge_conv, int_gt_conv, int_eq_conv)
                    }
                    _ => raise @lib.MatchFailure("tscript.ml:527")
                  }
                }
                _ => raise @lib.MatchFailure("tscript.ml:516")
              }
            }
            _ => raise @lib.MatchFailure("tscript.ml:505")
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:493")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:480")
  }
  int_le_conv_c.set(int_le_conv_1)
  int_lt_conv_c.set(int_lt_conv_1)
  int_ge_conv_c.set(int_ge_conv_1)
  int_gt_conv_c.set(int_gt_conv_1)
  int_eq_conv_c.set(int_eq_conv_1)
}

///|
/// INT_NEG_CONV
fn step_48() -> Unit raise {
  let t343 = @simp.rewrite_tac(@list.List([@int.int_neg_neg(), @int.int_neg_0()]))
  let pth = @tactics.prove(@term_syntax.parse_term("-int_of_num(0) == int_of_num(0) && --int_of_num((x : Num)) == int_of_num(x)"), t343)
  int_neg_conv_c.set(@simp.gen_rewrite_conv(fn(x344 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x344
  }, @list.List([pth])))
}

///|
let int_neg_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_NEG_CONV")

///|
/// `INT_NEG_CONV`
pub fn int_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_neg_conv_c.get())(x)
}

///|
/// INT_MUL_CONV
fn step_49() -> Unit raise {
  let t345 = @simp.rewrite_tac(@list.List([@int.int_mul_lzero(), @int.int_mul_rzero()]))
  let pth0 = @tactics.prove(@term_syntax.parse_term("int_of_num(0) * int_of_num((x : Num)) == int_of_num(0) && int_of_num(0) * -int_of_num(x) == int_of_num(0) && int_of_num(x) * int_of_num(0) == int_of_num(0) && -int_of_num(x) * int_of_num(0) == int_of_num(0)"), t345)
  let t347 = @simp.rewrite_tac(@list.List([@int.int_of_num_mul()]))
  let t348 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_mul_lneg(), @int.int_mul_rneg(), @int.int_neg_neg()])), t347)
  let t349 = (@term_syntax.parse_term("(int_of_num((m : Num)) * int_of_num((n : Num)) == int_of_num(m * n) && -int_of_num(m) * -int_of_num(n) == int_of_num(m * n)) && -int_of_num(m) * int_of_num(n) == -int_of_num(m * n) && int_of_num(m) * -int_of_num(n) == -int_of_num(m * n)"), t348)
  let (pth1, pth2) = @bool.conj_pair((fn(x346 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x346.0, x346.1)
  })(t349))
  let t354 = @equal.rand_conv(@equal.rand_conv(@calc_num.num_mult_conv))
  let t355 = @equal.thenc(@simp.gen_rewrite_conv(fn(x353 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x353
  }, @list.List([pth2])), t354)
  let t352 = @equal.rand_conv(@calc_num.num_mult_conv)
  let t356 = @equal.thenc(@simp.gen_rewrite_conv(fn(x351 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x351
  }, @list.List([pth1])), t352)
  int_mul_conv_c.set(@equal.first_conv(@list.List([@simp.gen_rewrite_conv(fn(x350 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x350
  }, @list.List([pth0])), t356, t355])))
}

///|
let int_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_MUL_CONV")

///|
/// `INT_MUL_CONV`
pub fn int_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_mul_conv_c.get())(x)
}

///|
/// INT_ADD_CONV
fn step_50() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let amp_tm = @term_syntax.parse_term("int_of_num")
  let add_tm = @term_syntax.parse_term("int_add")
  let t357 = @term_syntax.parse_term("int_add")
  let dest : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x358 : @kernel.Term) => @basics.dest_binop(t357, x358)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let t359 = @simp.rewrite_tac(@list.List([@int.int_add_linv(), @int.int_add_rinv()]))
  let pth0 = @tactics.prove(@term_syntax.parse_term("-int_of_num((m : Num)) + int_of_num(m) == int_of_num(0) && int_of_num(m) + -int_of_num(m) == int_of_num(0)"), t359)
  let t365 = @simp.rewrite_tac(@list.List([@int.int_add_rinv(), @int.int_add_lid()]))
  let t364 = @simp.rewrite_tac(@list.List([@int.int_add_assoc(), @int.int_add_linv(), @int.int_add_lid()]))
  let t363 = @simp.once_rewrite_tac(@list.List([@int.int_add_sym()]))
  let t362 = @simp.rewrite_tac(@list.List([@int.int_add_rinv(), @int.int_add_lid()]))
  let t361 = @simp.rewrite_tac(@list.List([@int.int_add_assoc(), @int.int_add_linv(), @int.int_add_lid()]))
  let t366 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_add()), @int.int_neg_add()])), t361), t362), t363), t364), t365)
  let t367 = (@term_syntax.parse_term("-int_of_num((m : Num)) + -int_of_num((n : Num)) == -int_of_num(m + n) && -int_of_num(m) + int_of_num(m + n) == int_of_num(n) && -int_of_num(m + n) + int_of_num(m) == -int_of_num(n) && int_of_num(m + n) + -int_of_num(m) == int_of_num(n) && int_of_num(m) + -int_of_num(m + n) == -int_of_num(n) && int_of_num(m) + int_of_num(n) == int_of_num(m + n)"), t366)
  int_add_conv_c.set(match @bool.conjuncts_rule((fn(x360 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x360.0, x360.1)
  })(t367)) {
    More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=Empty)))))) => @equal.orelsec(@simp.gen_rewrite_conv(fn(x368 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x368
    }, @list.List([pth0])), fn(x369 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x369
      try {
        let (l, r) = dest(tm)
        if (@kernel.rator(l) == neg_tm) {
          if (@kernel.rator(r) == neg_tm) {
            let t370 = (@kernel.rand(@kernel.rand(r)), n_tm)
            let th1 = @kernel.inst_rule(@list.List([(@kernel.rand(@kernel.rand(l)), m_tm), t370]), pth1)
            let tm1 = @kernel.rand(@kernel.rand(@kernel.rand(@kernel.concl(th1))))
            let th2 = @equal.ap_term(neg_tm, @equal.ap_term(amp_tm, @calc_num.num_add_conv(tm1)))
            @kernel.trans(th1, th2)
          } else {
            let m = @kernel.rand(@kernel.rand(l))
            let n = @kernel.rand(r)
            let m_p = @basics.dest_numeral(m)
            let n_p = @basics.dest_numeral(n)
            if @num.le_num(m_p, n_p) {
              let p = @nums.mk_numeral(@num.sub_num(n_p, m_p))
              let th1_1 = @kernel.inst_rule(@list.List([(m, m_tm), (p, n_tm)]), pth2)
              let th2_1 = @calc_num.num_add_conv(@kernel.rand(@kernel.rand(@equal.lhand(@kernel.concl(th1_1)))))
              let t371 = @equal.ap_term(amp_tm, @equal.sym(th2_1))
              let th3 = @equal.ap_term(@kernel.rator(tm), t371)
              @kernel.trans(th3, th1_1)
            } else {
              let p_1 = @nums.mk_numeral(@num.sub_num(m_p, n_p))
              let th1_2 = @kernel.inst_rule(@list.List([(n, m_tm), (p_1, n_tm)]), pth3)
              let th2_2 = @calc_num.num_add_conv(@kernel.rand(@kernel.rand(@equal.lhand(@equal.lhand(@kernel.concl(th1_2))))))
              let th3_1 = @equal.ap_term(neg_tm, @equal.ap_term(amp_tm, @equal.sym(th2_2)))
              let t372 = @kernel.rand(tm)
              let th4 = @equal.ap_thm(@equal.ap_term(add_tm, th3_1), t372)
              @kernel.trans(th4, th1_2)
            }
          }
        } else {
          if (@kernel.rator(r) == neg_tm) {
            let m_1 = @kernel.rand(l)
            let n_1 = @kernel.rand(@kernel.rand(r))
            let m_p_1 = @basics.dest_numeral(m_1)
            let n_p_1 = @basics.dest_numeral(n_1)
            if @num.le_num(n_p_1, m_p_1) {
              let p_2 = @nums.mk_numeral(@num.sub_num(m_p_1, n_p_1))
              let th1_3 = @kernel.inst_rule(@list.List([(n_1, m_tm), (p_2, n_tm)]), pth4)
              let th2_3 = @calc_num.num_add_conv(@kernel.rand(@equal.lhand(@equal.lhand(@kernel.concl(th1_3)))))
              let th3_2 = @equal.ap_term(add_tm, @equal.ap_term(amp_tm, @equal.sym(th2_3)))
              let th4_1 = @equal.ap_thm(th3_2, @kernel.rand(tm))
              @kernel.trans(th4_1, th1_3)
            } else {
              let p_3 = @nums.mk_numeral(@num.sub_num(n_p_1, m_p_1))
              let th1_4 = @kernel.inst_rule(@list.List([(m_1, m_tm), (p_3, n_tm)]), pth5)
              let th2_4 = @calc_num.num_add_conv(@kernel.rand(@kernel.rand(@kernel.rand(@equal.lhand(@kernel.concl(th1_4))))))
              let th3_3 = @equal.ap_term(neg_tm, @equal.ap_term(amp_tm, @equal.sym(th2_4)))
              let th4_2 = @equal.ap_term(@kernel.rator(tm), th3_3)
              @kernel.trans(th4_2, th1_4)
            }
          } else {
            let t373 = (@kernel.rand(r), n_tm)
            let th1_5 = @kernel.inst_rule(@list.List([(@kernel.rand(l), m_tm), t373]), pth6)
            let tm1_1 = @kernel.rand(@kernel.rand(@kernel.concl(th1_5)))
            let th2_5 = @equal.ap_term(amp_tm, @calc_num.num_add_conv(tm1_1))
            @kernel.trans(th1_5, th2_5)
          }
        }
      } catch {
        Failure(_) => raise Failure("INT_ADD_CONV")
        e => raise e
      }
    })
    _ => raise @lib.MatchFailure("tscript.ml:577")
  })
}

///|
let int_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_ADD_CONV")

///|
/// `INT_ADD_CONV`
pub fn int_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_add_conv_c.get())(x)
}

///|
/// INT_SUB_CONV
fn step_51() -> Unit raise {
  let t375 = @equal.try_conv(@equal.rand_conv(int_neg_conv))
  int_sub_conv_c.set(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x374 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x374
  }, @list.List([@int.int_sub_v1()])), t375), int_add_conv))
}

///|
let int_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_SUB_CONV")

///|
/// `INT_SUB_CONV`
pub fn int_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_sub_conv_c.get())(x)
}

///|
/// INT_POW_CONV
fn step_52() -> Unit raise {
  let n = @term_syntax.parse_term("(n : Num)")
  let x = @term_syntax.parse_term("(x : Num)")
  let t377 = @simp.rewrite_tac(@list.List([@int.int_of_num_pow(), @int.int_pow_neg()]))
  let t378 = (@term_syntax.parse_term("pow(int_of_num((x : Num)), (n : Num)) == int_of_num(EXP(x, n)) && pow(-int_of_num(x), n) == (if EVEN(n) { int_of_num(EXP(x, n)) } else { -int_of_num(EXP(x, n)) })"), t377)
  let (pth1, pth2) = @bool.conj_pair((fn(x376 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x376.0, x376.1)
  })(t378))
  let t379 = @simp.rewrite_tac(@list.List([]))
  let tth = @tactics.prove(@term_syntax.parse_term("(if true { (x : Int) } else { (y : Int) }) == x && (if false { x } else { y }) == y"), t379)
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let t385 = @simp.gen_rewrite_conv(fn(x384 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x384
  }, @list.List([tth]))
  let t383 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(@calc_num.num_even_conv)))
  let t387 = @equal.thenc(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x382 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x382
  }, @list.List([pth2])), t383), t385), fn(x386 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x386
    if (@kernel.rator(tm) == neg_tm) {
      @equal.rand_conv(@equal.rand_conv(@calc_num.num_exp_conv))(tm)
    } else {
      @equal.rand_conv(@calc_num.num_exp_conv)(tm)
    }
  })
  let t381 = @equal.rand_conv(@calc_num.num_exp_conv)
  int_pow_conv_c.set(@equal.orelsec(@equal.thenc(@simp.gen_rewrite_conv(fn(x380 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x380
  }, @list.List([pth1])), t381), t387))
}

///|
let int_pow_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_POW_CONV")

///|
/// `INT_POW_CONV`
pub fn int_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_pow_conv_c.get())(x)
}

///|
/// dest_add
fn step_53() -> Unit raise {
  let t388 = @term_syntax.parse_term("int_add")
  dest_add_c.set((x389 : @kernel.Term) => @basics.dest_binop(t388, x389))
}

///|
let dest_add_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_add")

///|
/// `dest_add`
pub fn dest_add(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_add_c.get())(x)
}

///|
/// dest_mul
fn step_54() -> Unit raise {
  let t390 = @term_syntax.parse_term("int_mul")
  dest_mul_c.set((x391 : @kernel.Term) => @basics.dest_binop(t390, x391))
}

///|
let dest_mul_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_mul")

///|
/// `dest_mul`
pub fn dest_mul(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_mul_c.get())(x)
}

///|
/// dest_pow
fn step_55() -> Unit raise {
  let t392 = @term_syntax.parse_term("pow")
  dest_pow_c.set((x393 : @kernel.Term) => @basics.dest_binop(t392, x393))
}

///|
let dest_pow_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_pow")

///|
/// `dest_pow`
pub fn dest_pow(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_pow_c.get())(x)
}

///|
/// dest_sub
fn step_56() -> Unit raise {
  let t394 = @term_syntax.parse_term("int_sub")
  dest_sub_c.set((x395 : @kernel.Term) => @basics.dest_binop(t394, x395))
}

///|
let dest_sub_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_sub")

///|
/// `dest_sub`
pub fn dest_sub(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (dest_sub_c.get())(x)
}

///|
/// is_add
fn step_57() -> Unit raise {
  let t396 = @term_syntax.parse_term("int_add")
  is_add_c.set(fn(x398 : @kernel.Term) -> Bool raise {
    ((x397 : @kernel.Term) => @basics.is_binop(t396, x397))(x398)
  })
}

///|
let is_add_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_add")

///|
/// `is_add`
pub fn is_add(x : @kernel.Term) -> Bool raise {
  (is_add_c.get())(x)
}

///|
/// is_mul
fn step_58() -> Unit raise {
  let t399 = @term_syntax.parse_term("int_mul")
  is_mul_c.set(fn(x401 : @kernel.Term) -> Bool raise {
    ((x400 : @kernel.Term) => @basics.is_binop(t399, x400))(x401)
  })
}

///|
let is_mul_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_mul")

///|
/// `is_mul`
pub fn is_mul(x : @kernel.Term) -> Bool raise {
  (is_mul_c.get())(x)
}

///|
/// is_pow
fn step_59() -> Unit raise {
  let t402 = @term_syntax.parse_term("pow")
  is_pow_c.set(fn(x404 : @kernel.Term) -> Bool raise {
    ((x403 : @kernel.Term) => @basics.is_binop(t402, x403))(x404)
  })
}

///|
let is_pow_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_pow")

///|
/// `is_pow`
pub fn is_pow(x : @kernel.Term) -> Bool raise {
  (is_pow_c.get())(x)
}

///|
/// is_sub
fn step_60() -> Unit raise {
  let t405 = @term_syntax.parse_term("int_sub")
  is_sub_c.set(fn(x407 : @kernel.Term) -> Bool raise {
    ((x406 : @kernel.Term) => @basics.is_binop(t405, x406))(x407)
  })
}

///|
let is_sub_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_sub")

///|
/// `is_sub`
pub fn is_sub(x : @kernel.Term) -> Bool raise {
  (is_sub_c.get())(x)
}

///|
/// POLYNOMIAL_NORMALIZERS
fn step_61() -> Unit raise {
  let t408 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_pow_v1()])), @int.int_arith_tac)
  let sth = @tactics.prove(@term_syntax.parse_term("(∀ x : Int, ∀ y : Int, ∀ z : Int, x + (y + z) == x + y + z) && (∀ x : Int, ∀ y : Int, x + y == y + x) && (∀ x : Int, int_of_num(0) + x == x) && (∀ x : Int, ∀ y : Int, ∀ z : Int, x * (y * z) == x * y * z) && (∀ x : Int, ∀ y : Int, x * y == y * x) && (∀ x : Int, int_of_num(1) * x == x) && (∀ x : Int, int_of_num(0) * x == int_of_num(0)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, x * (y + z) == x * y + x * z) && (∀ x : Int, pow(x, 0) == int_of_num(1)) && (∀ x : Int, ∀ n : Num, pow(x, SUC(n)) == x * pow(x, n))"), t408)
  let rth = @tactics.prove(@term_syntax.parse_term("(∀ x : Int, -x == -int_of_num(1) * x) && (∀ x : Int, ∀ y : Int, x - y == x + -int_of_num(1) * y)"), @int.int_arith_tac)
  let is_semiring_constant : (@kernel.Term) -> Bool raise = is_int_const
  let semiring_add_conv : (@kernel.Term) -> @kernel.Thm raise = int_add_conv
  let semiring_mul_conv : (@kernel.Term) -> @kernel.Thm raise = int_mul_conv
  let semiring_pow_conv : (@kernel.Term) -> @kernel.Thm raise = int_pow_conv
  let normalizers : ((@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise) -> ((@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise) raise = @normalizer.semiring_normalizers_conv(sth)(rth)((is_semiring_constant, semiring_add_conv, semiring_mul_conv, semiring_pow_conv))
  polynomial_normalizers_c.set(fn(x409 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x409
    normalizers(fn(x412 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
      fn(x413 : @kernel.Term) -> Bool raise {
        ((x410 : @kernel.Term, x411 : @kernel.Term) => earlier(vars, x410, x411))(x412, x413)
      }
    })
  })
}

///|
let polynomial_normalizers_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("POLYNOMIAL_NORMALIZERS")

///|
/// `POLYNOMIAL_NORMALIZERS`
pub fn polynomial_normalizers(x : @list.List[@kernel.Term]) -> (((@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise, (@kernel.Term) -> @kernel.Thm raise)) raise {
  (polynomial_normalizers_c.get())(x)
}

///|
/// `POLYNOMIAL_NEG_CONV`
pub fn polynomial_neg_conv(x414 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x414
  let (cnv, _, _, _, _, _) = polynomial_normalizers(vars)
  cnv
}

///|
/// `POLYNOMIAL_ADD_CONV`
pub fn polynomial_add_conv(x416 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x416
  let (_, cnv, _, _, _, _) = polynomial_normalizers(vars)
  cnv
}

///|
/// `POLYNOMIAL_SUB_CONV`
pub fn polynomial_sub_conv(x418 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x418
  let (_, _, cnv, _, _, _) = polynomial_normalizers(vars)
  cnv
}

///|
/// `POLYNOMIAL_MUL_CONV`
pub fn polynomial_mul_conv(x420 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x420
  let (_, _, _, cnv, _, _) = polynomial_normalizers(vars)
  cnv
}

///|
/// `POLYNOMIAL_POW_CONV`
pub fn polynomial_pow_conv(x422 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x422
  let (_, _, _, _, cnv, _) = polynomial_normalizers(vars)
  cnv
}

///|
/// `POLYNOMIAL_CONV`
pub fn polynomial_conv(x424 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let vars = x424
  let (_, _, _, _, _, cnv) = polynomial_normalizers(vars)
  cnv
}

///|
/// LINEAR_CMUL
fn step_62() -> Unit raise {
  let mul_tm = @term_syntax.parse_term("int_mul")
  linear_cmul_c.set(fn(x426 : @list.List[@kernel.Term]) -> ((@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let vars = x426
    fn(x427 : @num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let n = x427
      fn(x428 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x428
        let t429 = @kernel.mk_comb(@kernel.mk_comb(mul_tm, mk_int_const(n)), tm)
        polynomial_mul_conv(vars)(t429)
      }
    }
  })
}

///|
let linear_cmul_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("LINEAR_CMUL")

///|
/// `LINEAR_CMUL`
pub fn linear_cmul(x : @list.List[@kernel.Term]) -> ((@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (linear_cmul_c.get())(x)
}

///|
/// LINEARIZE_CONV
fn step_63() -> Unit raise {
  let t431 = @int.int_arith(@term_syntax.parse_term("((s : Int) < (t : Int)) == (int_of_num(0) < t - s) && !(s < t) == (int_of_num(0) < s + int_of_num(1) - t) && (s > t) == (int_of_num(0) < s - t) && !(s > t) == (int_of_num(0) < t + int_of_num(1) - s) && (s <= t) == (int_of_num(0) < t + int_of_num(1) - s) && !(s <= t) == (int_of_num(0) < s - t) && (s >= t) == (int_of_num(0) < s + int_of_num(1) - t) && !(s >= t) == (int_of_num(0) < t - s) && (s == t) == (int_of_num(0) == s - t)"))
  let rew_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x430 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x430
  }, @list.List([@bool.conj(@kernel.refl(@term_syntax.parse_term("divides((c : Int), (e : Int))")), t431)]))
  let true_tm = @term_syntax.parse_term("true")
  let false_tm = @term_syntax.parse_term("false")
  fn conv(x432 : @list.List[@kernel.Term], x433 : @kernel.Term) -> @kernel.Thm raise {
    let vars = x432
    let tm = x433
    try {
      @equal.thenc(rew_conv, @equal.rand_conv(polynomial_conv(vars)))(tm)
    } catch {
      Failure(_) => {
        if (@basics.is_exists(tm) || @basics.is_forall(tm)) {
          let x = @basics.bndvar(@kernel.rand(tm))
          @equal.binder_conv((x434 : @kernel.Term) => conv(vars.prepend(x), x434))(tm)
        } else {
          if @basics.is_neg(tm) {
            @equal.rand_conv((x435 : @kernel.Term) => conv(vars, x435))(tm)
          } else {
            if (@basics.is_conj(tm) || (@basics.is_disj(tm) || (@basics.is_imp(tm) || @bool.is_iff(tm)))) {
              @equal.binop_conv((x436 : @kernel.Term) => conv(vars, x436))(tm)
            } else {
              if ((tm == true_tm) || (tm == false_tm)) {
                @kernel.refl(tm)
              } else {
                raise Failure("LINEARIZE_CONV: Unexpected term type")
              }
            }
          }
        }
      }
      e => raise e
    }
  }
  linearize_conv_c.set(fn(x437 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x438 : @kernel.Term) -> @kernel.Thm raise {
      conv(x437, x438)
    }
  })
}

///|
let linearize_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("LINEARIZE_CONV")

///|
/// `LINEARIZE_CONV`
pub fn linearize_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (linearize_conv_c.get())(x)
}

///|
/// `coefficient`
pub fn coefficient(x439 : @kernel.Term, x440 : @kernel.Term) -> @num.Num raise {
  let x = x439
  let tm = x440
  try {
    let (l, r) = dest_add(tm)
    if (l == x) {
      @num.num_of_int64(1L)
    } else {
      let (c, y) = dest_mul(l)
      if (y == x) {
        dest_int_const(c)
      } else {
        @num.num_of_int64(0L)
      }
    }
  } catch {
    Failure(_) => {
      try {
        let (c_1, y_1) = dest_mul(tm)
        if (y_1 == x) {
          dest_int_const(c_1)
        } else {
          @num.num_of_int64(0L)
        }
      } catch {
        Failure(_) => @num.num_of_int64(1L)
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `lcm_num`
pub fn lcm_num(x441 : @num.Num, x442 : @num.Num) -> @num.Num raise {
  let x = x441
  let y = x442
  let t443 = @num.gcd_num(x, y)
  @num.abs_num(@num.div_num(@num.mult_num(x, y), t443))
}

///|
/// `formlcm`
pub fn formlcm(x444 : @kernel.Term, x445 : @kernel.Term) -> @num.Num raise {
  let x = x444
  let tm = x445
  if @basics.is_neg(tm) {
    formlcm(x, @kernel.rand(tm))
  } else {
    if (@basics.is_conj(tm) || (@basics.is_disj(tm) || (@basics.is_imp(tm) || @bool.is_iff(tm)))) {
      let t446 = formlcm(x, @kernel.rand(tm))
      lcm_num(formlcm(x, @equal.lhand(tm)), t446)
    } else {
      if (@basics.is_forall(tm) || @basics.is_exists(tm)) {
        formlcm(x, @basics.body(@kernel.rand(tm)))
      } else {
        if !@lib.mem(x, @kernel.frees(tm)) {
          @num.num_of_int64(1L)
        } else {
          let c = coefficient(x, @kernel.rand(tm))
          if @num.eq_num(c, @num.num_of_int64(0L)) {
            @num.num_of_int64(1L)
          } else {
            c
          }
        }
      }
    }
  }
}

///|
/// MULTIPLY_1_CONV
fn step_64() -> Unit raise {
  let conv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@int.int_arith(@term_syntax.parse_term("(x : Int) == int_of_num(1) * x")))
  let conv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@int.int_arith(@term_syntax.parse_term("(x : Int) + (a : Int) == int_of_num(1) * x + a")))
  multiply_1_conv_c.set(fn(x447 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x447
    fn(x448 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x448
      let x = @lib.hd(vars)
      if (tm == x) {
        conv_0(tm)
      } else {
        if (is_add(tm) && (@equal.lhand(tm) == x)) {
          conv_1(tm)
        } else {
          @kernel.refl(tm)
        }
      }
    }
  })
}

///|
let multiply_1_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("MULTIPLY_1_CONV")

///|
/// `MULTIPLY_1_CONV`
pub fn multiply_1_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (multiply_1_conv_c.get())(x)
}

///|
/// ADJUSTCOEFF_CONV
fn step_65() -> Unit raise {
  let op_eq = @term_syntax.parse_term("(op_eq : (Int, Int) -> Bool)")
  let op_lt = @term_syntax.parse_term("int_lt")
  let op_gt = @term_syntax.parse_term("int_gt")
  let op_divides = @term_syntax.parse_term("int_divides")
  let c_tm = @term_syntax.parse_term("(c : Int)")
  let d_tm = @term_syntax.parse_term("(d : Int)")
  let e_tm = @term_syntax.parse_term("(e : Int)")
  let t449 = @simp.simp_tac(@list.List([divides(), @equal.gsym(@int.int_mul_assoc()), @int.int_eq_mul_lcancel()]))
  let pth_divides = @tactics.prove(@term_syntax.parse_term("!((d : Int) == int_of_num(0)) → divides((c : Int), (e : Int)) == divides(d * c, d * e)"), t449)
  let t450 = @simp.asm_rewrite_tac(@list.List([@int.int_entire()]))
  let t451 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.conv_tac(@equal.binop_conv(@equal.sym_conv))), t450)
  let pth_eq = @tactics.prove(@term_syntax.parse_term("!((d : Int) == int_of_num(0)) → (int_of_num(0) == (e : Int)) == (int_of_num(0) == d * e)"), t451)
  let t455 = @simp.rewrite_tac(@list.List([@int.int_mul_rzero()]))
  let t456 = @list.List([@simp.asm_simp_tac(@list.List([@int.int_lt_lmul_eq()])), t455])
  let t457 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("(int_of_num(0) < (e : Int)) == ((d : Int) * int_of_num(0) < d * e)"), fn(x452 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s453 = @tactics.subst1_tac(x452)
    fn(x454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s453(x454)
    }
  })), t456)
  let pth_lt_pos = @tactics.prove(@term_syntax.parse_term("int_of_num(0) < (d : Int) → (int_of_num(0) < (e : Int)) == (int_of_num(0) < d * e)"), t457)
  let t462 = @simp.rewrite_tac(@list.List([@int.int_mul_rzero()]))
  let t463 = @list.List([@simp.asm_simp_tac(@list.List([@int.int_lt_lmul_eq()])), t462])
  let t461 = @tactics.subgoal_then(@term_syntax.parse_term("((e : Int) < int_of_num(0)) == ((d : Int) * e < d * int_of_num(0))"), fn(x458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s459 = @tactics.subst1_tac(x458)
    fn(x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s459(x460)
    }
  })
  let t464 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@int.int_gt_v1()]))), t461), t463)
  let pth_gt_pos = @tactics.prove(@term_syntax.parse_term("int_of_num(0) < (d : Int) → (int_of_num(0) > (e : Int)) == (int_of_num(0) > d * e)"), t464)
  let true_tm = @term_syntax.parse_term("true")
  let false_tm = @term_syntax.parse_term("false")
  let t465 = @int.int_arith(@term_syntax.parse_term("((d : Int) < int_of_num(0)) == (int_of_num(0) < -d)"))
  let t466 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(int_of_num(0) > (d : Int) * (e : Int)) == (int_of_num(0) < -d * e)")), t465, pth_lt_pos]))
  let pth_lt_neg = @tactics.prove(@term_syntax.parse_term("(d : Int) < int_of_num(0) → (int_of_num(0) < (e : Int)) == (int_of_num(0) > d * e)"), t466)
  let t467 = @int.int_arith(@term_syntax.parse_term("((d : Int) < int_of_num(0)) == (int_of_num(0) < -d)"))
  let t468 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(int_of_num(0) < (d : Int) * (e : Int)) == (int_of_num(0) > -d * e)")), t467, pth_gt_pos]))
  let pth_gt_neg = @tactics.prove(@term_syntax.parse_term("(d : Int) < int_of_num(0) → (int_of_num(0) > (e : Int)) == (int_of_num(0) < d * e)"), t468)
  fn adjustcoeff_conv_1(x469 : @list.List[@kernel.Term], x470 : @num.Num, x471 : @kernel.Term) -> @kernel.Thm raise {
    let vars = x469
    let l = x470
    let tm = x471
    if ((tm == true_tm) || (tm == false_tm)) {
      @kernel.refl(tm)
    } else {
      if (@basics.is_exists(tm) || @basics.is_forall(tm)) {
        @equal.binder_conv((x472 : @kernel.Term) => adjustcoeff_conv_1(vars, l, x472))(tm)
      } else {
        if @basics.is_neg(tm) {
          @equal.rand_conv((x473 : @kernel.Term) => adjustcoeff_conv_1(vars, l, x473))(tm)
        } else {
          if (@basics.is_conj(tm) || (@basics.is_disj(tm) || (@basics.is_imp(tm) || @bool.is_iff(tm)))) {
            @equal.binop_conv((x474 : @kernel.Term) => adjustcoeff_conv_1(vars, l, x474))(tm)
          } else {
            let (lop, t) = @kernel.dest_comb(tm)
            let (op, z) = @kernel.dest_comb(lop)
            let c = coefficient(@lib.hd(vars), t)
            if @num.eq_num(c, @num.num_of_int64(0L)) {
              @kernel.refl(tm)
            } else {
              let th1_1 = if @num.eq_num(c, l) {
                @kernel.refl(tm)
              } else {
                let m = @num.div_num(l, c)
                let th0 = if (op == op_eq) {
                  pth_eq
                } else {
                  if (op == op_divides) {
                    pth_divides
                  } else {
                    if (op == op_lt) {
                      if @num.gt_num(m, @num.num_of_int64(0L)) {
                        pth_lt_pos
                      } else {
                        pth_lt_neg
                      }
                    } else {
                      if (op == op_gt) {
                        if @num.gt_num(m, @num.num_of_int64(0L)) {
                          pth_gt_pos
                        } else {
                          pth_gt_neg
                        }
                      } else {
                        raise Failure("ADJUSTCOEFF_CONV: unknown predicate")
                      }
                    }
                  }
                }
                let th1 = @kernel.inst_rule(@list.List([(mk_int_const(m), d_tm), (z, c_tm), (t, e_tm)]), th0)
                let tm1 = @equal.lhand(@kernel.concl(th1))
                let th2 = if @basics.is_neg(tm1) {
                  @bool.eqf_elim(int_eq_conv(@kernel.rand(tm1)))
                } else {
                  @bool.eqt_elim(int_lt_conv(tm1))
                }
                let th3 = @bool.mp(th1, th2)
                if (op == op_divides) {
                  let th3_1 = @bool.mp(th1, th2)
                  let tm2 = @kernel.rand(@kernel.concl(th3_1))
                  let (l_1, r) = @kernel.dest_comb(tm2)
                  let t475 = int_mul_conv(@kernel.rand(l_1))
                  let th4 = @equal.ap_term(@kernel.rator(l_1), t475)
                  let th5 = @equal.ap_thm(th4, r)
                  let tm3 = @kernel.rator(@kernel.rand(@kernel.concl(th5)))
                  let th6 = @kernel.trans(th5, @equal.ap_term(tm3, linear_cmul(vars)(m)(t)))
                  @kernel.trans(th3_1, th6)
                } else {
                  let tm2_1 = @kernel.rator(@kernel.rand(@kernel.concl(th3)))
                  @kernel.trans(th3, @equal.ap_term(tm2_1, linear_cmul(vars)(m)(t)))
                }
              }
              if @num.eq_num(l, @num.num_of_int64(1L)) {
                @equal.conv_rule(@lib.funpow(2, fn(x476 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s477 = @equal.rand_conv(x476)
                  fn(x478 : @kernel.Term) -> @kernel.Thm raise {
                    s477(x478)
                  }
                }, multiply_1_conv(vars)), th1_1)
              } else {
                th1_1
              }
            }
          }
        }
      }
    }
  }
  adjustcoeff_conv_c.set(fn(x479 : @list.List[@kernel.Term]) -> ((@num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    fn(x480 : @num.Num) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      fn(x481 : @kernel.Term) -> @kernel.Thm raise {
        adjustcoeff_conv_1(x479, x480, x481)
      }
    }
  })
}

///|
let adjustcoeff_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@num.Num) -> @equal.Conv raise) raise] = @lib.Cell::new("ADJUSTCOEFF_CONV")

///|
/// `ADJUSTCOEFF_CONV`
pub fn adjustcoeff_conv(x : @list.List[@kernel.Term]) -> ((@num.Num) -> @equal.Conv raise) raise {
  (adjustcoeff_conv_c.get())(x)
}

///|
/// NORMALIZE_COEFF_CONV
fn step_66() -> Unit raise {
  let c_tm = @term_syntax.parse_term("(c : Int)")
  let t482 = @simp.rewrite_tac(@list.List([@equal.gsym(exists_multiple_thm())]))
  let pth = @tactics.prove(@term_syntax.parse_term("(∃ x : Int, (P : (Int) -> Bool)((c : Int) * x)) == (∃ x : Int, divides(c, x) && P(x))"), t482)
  let normalize_coeff_conv_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x483 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x483
    fn(x484 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x484
      let (x, bod) = @basics.dest_exists(tm)
      let l = formlcm(x, tm)
      let th1 = adjustcoeff_conv(vars.prepend(x))(l)(tm)
      let th2 = if @num.eq_num(l, @num.num_of_int64(1L)) {
        exists_multiple_thm_1()
      } else {
        @kernel.inst_rule(@list.List([(mk_int_const(l), c_tm)]), pth)
      }
      let t485 = @kernel.rand(@kernel.concl(th1))
      @kernel.trans(th1, @simp.rewr_conv(th2)(t485))
    }
  }
  normalize_coeff_conv_c.set(normalize_coeff_conv_1)
}

///|
let normalize_coeff_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("NORMALIZE_COEFF_CONV")

///|
/// `NORMALIZE_COEFF_CONV`
pub fn normalize_coeff_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (normalize_coeff_conv_c.get())(x)
}

///|
/// SHADOW_CONV
fn step_67() -> Unit raise {
  let t486 = @simp.rewrite_tac(@list.List([interp()]))
  let pth_trivial = @tactics.prove(@term_syntax.parse_term("(P : Bool) == interp((x : Int), Nox(P))"), t486)
  let t487 = @simp.rewrite_tac(@list.List([interp()]))
  let pth_composite = @tactics.prove(@term_syntax.parse_term("(interp((x : Int), (p : Cform)) && interp(x, (q : Cform))) == interp(x, And(p, q)) && (interp(x, p) || interp(x, q)) == interp(x, Or(p, q))"), t487)
  let t488 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interp(), @int.int_add_rid()])), @int.int_arith_tac)
  let pth_literal_nontrivial = @tactics.prove(@term_syntax.parse_term("(int_of_num(0) > (x : Int) + (e : Int)) == interp(x, Lt(e)) && (int_of_num(0) < x + e) == interp(x, Gt(e)) && (int_of_num(0) == x + e) == interp(x, Eq(e)) && !(int_of_num(0) == x + e) == interp(x, Ne(e)) && divides((c : Int), x + e) == interp(x, Divides(c, e)) && !divides(c, x + e) == interp(x, Ndivides(c, e))"), t488)
  let t489 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interp(), @int.int_add_rid()])), @int.int_arith_tac)
  let pth_literal_trivial = @tactics.prove(@term_syntax.parse_term("(int_of_num(0) > (x : Int)) == interp(x, Lt(int_of_num(0))) && (int_of_num(0) < x) == interp(x, Gt(int_of_num(0))) && (int_of_num(0) == x) == interp(x, Eq(int_of_num(0))) && !(int_of_num(0) == x) == interp(x, Ne(int_of_num(0))) && divides((c : Int), x) == interp(x, Divides(c, int_of_num(0))) && !divides(c, x) == interp(x, Ndivides(c, int_of_num(0)))"), t489)
  let rewr_composite : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x490 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x490
  }, @list.List([pth_composite]))
  let t493 = @simp.gen_rewrite_conv(fn(x492 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x492
  }, @list.List([pth_literal_trivial]))
  let rewr_literal : (@kernel.Term) -> @kernel.Thm raise = @equal.orelsec(@simp.gen_rewrite_conv(fn(x491 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x491
  }, @list.List([pth_literal_nontrivial])), t493)
  let x_tm = @term_syntax.parse_term("(x : Int)")
  let p_tm = @term_syntax.parse_term("(P : Bool)")
  fn shadow_conv_1(x494 : @kernel.Term, x495 : @kernel.Term) -> @kernel.Thm raise {
    let x = x494
    let tm = x495
    if !@lib.mem(x, @kernel.frees(tm)) {
      @kernel.inst_rule(@list.List([(tm, p_tm), (x, x_tm)]), pth_trivial)
    } else {
      if (@basics.is_conj(tm) || @basics.is_disj(tm)) {
        let (l, r) = try {
          @basics.dest_conj(tm)
        } catch {
          Failure(_) => @basics.dest_disj(tm)
          e => raise e
        }
        let thl = shadow_conv_1(x, l)
        let thr = shadow_conv_1(x, r)
        let th1 = @kernel.mk_comb_rule(@equal.ap_term(@kernel.rator(@kernel.rator(tm)), thl), thr)
        @kernel.trans(th1, rewr_composite(@kernel.rand(@kernel.concl(th1))))
      } else {
        rewr_literal(tm)
      }
    }
  }
  shadow_conv_c.set(fn(x496 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x496
    let (x_1, bod) = @basics.dest_exists(tm_1)
    @drule.mk_exists_rule(x_1, shadow_conv_1(x_1, bod))
  })
}

///|
let shadow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("SHADOW_CONV")

///|
/// `SHADOW_CONV`
pub fn shadow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (shadow_conv_c.get())(x)
}

///|
/// dplcm
fn step_68() -> Unit raise {
  let divides_tm = @term_syntax.parse_term("Divides")
  let ndivides_tm = @term_syntax.parse_term("Ndivides")
  let and_tm = @term_syntax.parse_term("And")
  let or_tm = @term_syntax.parse_term("Or")
  fn dplcm_1(x497 : @kernel.Term) -> @num.Num raise {
    let tm = x497
    let (hop, args) = @basics.strip_comb(tm)
    if ((hop == divides_tm) || (hop == ndivides_tm)) {
      dest_int_const(@lib.hd(args))
    } else {
      if ((hop == and_tm) || (hop == or_tm)) {
        @lib.end_itlist(lcm_num, @lib.map(dplcm_1, args))
      } else {
        @num.num_of_int64(1L)
      }
    }
  }
  dplcm_c.set(dplcm_1)
}

///|
let dplcm_c : @lib.Cell[(@kernel.Term) -> @num.Num raise] = @lib.Cell::new("dplcm")

///|
/// `dplcm`
pub fn dplcm(x : @kernel.Term) -> @num.Num raise {
  (dplcm_c.get())(x)
}

///|
/// PROVE_DIVIDES_CONV_POS
fn step_69() -> Unit raise {
  let t504 = @simp.rewrite_tac(@list.List([@int.int_of_num_mul()]))
  let t503 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num((m : Num))"))
  let t502 = @simp.rewrite_tac(@list.List([divides()]))
  let t505 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s499 = @tactics.subst1_tac(x498)
      fn(x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s499(x500)
      }
    })(@equal.sym(x501))
  }), t502), t503), t504)
  let pth = @tactics.prove(@term_syntax.parse_term("(p : Num) * (m : Num) == (n : Num) → divides(int_of_num(p), int_of_num(n))"), t505)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let p_tm = @term_syntax.parse_term("(p : Num)")
  prove_divides_conv_pos_c.set(fn(x506 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x506
    let n = @kernel.rand(@kernel.rand(tm))
    let p = @kernel.rand(@equal.lhand(tm))
    let t507 = @basics.dest_numeral(p)
    let m = @nums.mk_numeral(@num.div_num(@basics.dest_numeral(n), t507))
    let th1 = @kernel.inst_rule(@list.List([(m, m_tm), (n, n_tm), (p, p_tm)]), pth)
    @bool.eqt_intro(@bool.mp(th1, @calc_num.num_mult_conv(@equal.lhand(@equal.lhand(@kernel.concl(th1))))))
  })
}

///|
let prove_divides_conv_pos_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("PROVE_DIVIDES_CONV_POS")

///|
/// `PROVE_DIVIDES_CONV_POS`
pub fn prove_divides_conv_pos(x : @kernel.Term) -> @kernel.Thm raise {
  (prove_divides_conv_pos_c.get())(x)
}

///|
/// PROVE_DIVIDES_CONV
fn step_70() -> Unit raise {
  prove_divides_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x508 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s509 = @equal.repeatc(x508)
    fn(x510 : @kernel.Term) -> @kernel.Thm raise {
      s509(x510)
    }
  }, @list.List([divides_lneg(), divides_rneg()])), prove_divides_conv_pos))
}

///|
let prove_divides_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("PROVE_DIVIDES_CONV")

///|
/// `PROVE_DIVIDES_CONV`
pub fn prove_divides_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (prove_divides_conv_c.get())(x)
}

///|
/// INT_DIVIDES_NUM
fn step_71() -> Unit raise {
  let t529 = @meson.meson_tac(@list.List([@int.int_of_num_mul()]))
  let t528 = @meson.meson_tac(@list.List([]))
  let t527 = @simp.rewrite_tac(@list.List([@int.int_of_num_mul(), @int.int_of_num_eq()]))
  let t526 = @simp.rewrite_tac(@list.List([@int.int_abs_mul(), @int.int_abs_num(), @int.int_abs_neg()]))
  let t522 = @term_syntax.parse_term("abs")
  let t525 = @tactics.disch_then(fn(x524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s520 = @tactics.mp_tac(x519)
      fn(x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s520(x521)
      }
    })(((x523 : @kernel.Thm) => @equal.ap_term(t522, x523))(x524))
  })
  let t517 = @bool.spec(@term_syntax.parse_term("(x : Int)"), @int.int_image())
  let t518 = @tactics.disj_cases_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s515 = @tactics.subst1_tac(x514)
    fn(x516 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s515(x516)
    }
  }))(t517)
  let t530 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Int)"))(fn(x511 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s512 = @tactics.mp_tac(x511)
    fn(x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s512(x513)
    }
  })), t518), t525), t526), t527), t528), t529])
  let t531 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([divides()])), @tactics.eq_tac), t530)
  int_divides_num_c.set(@tactics.prove(@term_syntax.parse_term("divides(int_of_num((p : Num)), int_of_num((n : Num))) == (∃ m : Num, n == p * m)"), t531))
}

///|
let int_divides_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVIDES_NUM")

///|
/// `INT_DIVIDES_NUM`
pub fn int_divides_num() -> @kernel.Thm {
  int_divides_num_c.get()
}

///|
/// INT_DIVIDES_POS_CONV
fn step_72() -> Unit raise {
  let t543 = @meson.meson_tac(@list.List([@arith.mult_sym()]))
  let t542 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t540 = @drule.match_mp(@arith.division())
  let t537 = @term_syntax.parse_term("(n : Num)")
  let t544 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.first_assum(fn(x541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s535 = @tactics.mp_tac(x534)
        fn(x536 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s535(x536)
        }
      })(((x538 : @kernel.Thm) => @bool.spec(t537, x538))(x539))
    })(t540(x541))
  })), t542), t543)
  let t545 = @list.List([@meson.asm_meson_tac(@list.List([@arith.mod_mult()])), t544])
  let t533 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t532 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t546 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([int_divides_num()])), t532), t533), @tactics.eq_tac), t545)
  let pth = @tactics.prove(@term_syntax.parse_term("divides(int_of_num((p : Num)), int_of_num((n : Num))) == (p == 0 && n == 0 || !(p == 0) && MOD(n, p) == 0)"), t546)
  int_divides_pos_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x547 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x547
  }, @list.List([pth])), @calc_num.num_reduce_conv))
}

///|
let int_divides_pos_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_DIVIDES_POS_CONV")

///|
/// `INT_DIVIDES_POS_CONV`
pub fn int_divides_pos_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_divides_pos_conv_c.get())(x)
}

///|
/// INT_DIVIDES_CONV
fn step_73() -> Unit raise {
  int_divides_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x548 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s549 = @equal.repeatc(x548)
    fn(x550 : @kernel.Term) -> @kernel.Thm raise {
      s549(x550)
    }
  }, @list.List([divides_lneg(), divides_rneg()])), int_divides_pos_conv))
}

///|
let int_divides_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_DIVIDES_CONV")

///|
/// `INT_DIVIDES_CONV`
pub fn int_divides_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (int_divides_conv_c.get())(x)
}

///|
/// ALLDIVIDE_CONV
fn step_74() -> Unit raise {
  let t551 = @simp.rewrite_tac(@list.List([alldivide()]))
  let pth_atom = @tactics.prove(@term_syntax.parse_term("alldivide((d : Int), Lt((e : Int))) == true && alldivide(d, Gt(e)) == true && alldivide(d, Eq(e)) == true && alldivide(d, Ne(e)) == true && alldivide(d, Nox((P : Bool))) == true"), t551)
  let t552 = @simp.rewrite_tac(@list.List([alldivide()]))
  let pth_div = @tactics.prove(@term_syntax.parse_term("alldivide((d : Int), Divides((c : Int), (e : Int))) == divides(c, d) && alldivide(d, Ndivides(c, e)) == divides(c, d)"), t552)
  let t553 = @simp.rewrite_tac(@list.List([alldivide()]))
  let pth_comp = @tactics.prove(@term_syntax.parse_term("alldivide((d : Int), And((p : Cform), (q : Cform))) == (alldivide(d, p) && alldivide(d, q)) && alldivide(d, Or(p, q)) == (alldivide(d, p) && alldivide(d, q))"), t553)
  let pth_taut = @class.taut(@term_syntax.parse_term("(true && true) == true"))
  let t566 = @lib.itlist(fn(x560 : @kernel.Thm, x561 : @nets.Net[(@kernel.Term) -> @kernel.Thm raise]) -> @nets.Net[(@kernel.Term) -> @kernel.Thm raise] raise {
    let th_1 = x560
    let t562 = @equal.thenc(@simp.rewr_conv(th_1), prove_divides_conv)
    let t563 = @equal.lhand(@kernel.concl(th_1))
    (fn(x565 : @nets.Net[(@kernel.Term) -> @kernel.Thm raise]) -> @nets.Net[(@kernel.Term) -> @kernel.Thm raise] raise {
      (x564 => @nets.enter_fn(@list.List([]), t563, t562, x564))(x565)
    })(x561)
  }, @bool.conjuncts_rule(pth_div), @nets.empty_net())
  let basnet = @lib.itlist(fn(x554 : @kernel.Thm, x555 : @nets.Net[(@kernel.Term) -> @kernel.Thm raise]) -> @nets.Net[(@kernel.Term) -> @kernel.Thm raise] raise {
    let th = x554
    let t556 = @simp.rewr_conv(th)
    let t557 = @equal.lhand(@kernel.concl(th))
    (fn(x559 : @nets.Net[(@kernel.Term) -> @kernel.Thm raise]) -> @nets.Net[(@kernel.Term) -> @kernel.Thm raise] raise {
      (x558 => @nets.enter_fn(@list.List([]), t557, t556, x558))(x559)
    })(x555)
  }, @bool.conjuncts_rule(pth_atom), t566)
  let comp_rewr : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x567 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x567
  }, @list.List([pth_comp]))
  fn alldivide_conv_1(x568 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x568
    try {
      @lib.tryfind(fn(x569 : (@kernel.Term) -> @kernel.Thm raise) -> @kernel.Thm raise {
        let f = x569
        f(tm)
      }, @nets.lookup(tm, basnet))
    } catch {
      Failure(_) => {
        let th_2 = @equal.thenc(comp_rewr, @equal.binop_conv(alldivide_conv_1))(tm)
        @kernel.trans(th_2, pth_taut)
      }
      e => raise e
    }
  }
  alldivide_conv_c.set(alldivide_conv_1)
}

///|
let alldivide_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("ALLDIVIDE_CONV")

///|
/// `ALLDIVIDE_CONV`
pub fn alldivide_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (alldivide_conv_c.get())(x)
}

///|
/// EXISTS_IN_BSET_CONV
fn step_75() -> Unit raise {
  let t570 = @simp.rewrite_tac(@list.List([bset(), @sets.not_in_empty()]))
  let pth_false = @tactics.prove(@term_syntax.parse_term("(∃ b : Int, IN(b, bset(Lt((e : Int)))) && (P : (Int) -> Bool)(b)) == false && (∃ b : Int, IN(b, bset(Divides((c : Int), e))) && P(b)) == false && (∃ b : Int, IN(b, bset(Ndivides(c, e))) && P(b)) == false && (∃ b : Int, IN(b, bset(Nox((Q : Bool)))) && P(b)) == false"), t570)
  let t571 = @simp.rewrite_tac(@list.List([bset(), @sets.in_sing(), @int.int_mul_lid(), @theorems.unwind_thm2()]))
  let pth_neg = @tactics.prove(@term_syntax.parse_term("(∃ b : Int, IN(b, bset(Gt((e : Int)))) && (P : (Int) -> Bool)(b)) == P(-e) && (∃ b : Int, IN(b, bset(Ne(e))) && P(b)) == P(-e)"), t571)
  let t572 = @simp.rewrite_tac(@list.List([bset(), @sets.in_sing(), @int.int_mul_lid(), @theorems.unwind_thm2()]))
  let pth_add = @tactics.prove(@term_syntax.parse_term("(∃ b : Int, IN(b, bset(Eq((e : Int)))) && (P : (Int) -> Bool)(b)) == P(-(e + int_of_num(1)))"), t572)
  let t573 = @meson.meson_tac(@list.List([]))
  let t574 = @tactics.then_tac(@simp.rewrite_tac(@list.List([bset(), @sets.in_union()])), t573)
  let pth_comp = @tactics.prove(@term_syntax.parse_term("(∃ b : Int, IN(b, bset(And((p : Cform), (q : Cform)))) && (P : (Int) -> Bool)(b)) == ((∃ b : Int, IN(b, bset(p)) && P(b)) || (∃ b : Int, IN(b, bset(q)) && P(b))) && (∃ b : Int, IN(b, bset(Or(p, q))) && P(b)) == ((∃ b : Int, IN(b, bset(p)) && P(b)) || (∃ b : Int, IN(b, bset(q)) && P(b)))"), t574)
  let taut = @class.taut(@term_syntax.parse_term("(false || (P : Bool)) == P && (P || false) == P"))
  let conv_neg : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x575 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x575
    @equal.land_conv(@equal.land_conv(polynomial_neg_conv(vars)))
  }
  let conv_add : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x577 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars_1 = x577
    let t579 = polynomial_neg_conv(vars_1)
    @equal.land_conv(@equal.land_conv(@equal.thenc(@equal.rand_conv(polynomial_add_conv(vars_1)), t579)))
  }
  let conv_comp : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x580 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x580
  }, @list.List([pth_comp]))
  let net1 = @lib.itlist(fn(x581 : @kernel.Thm, x582 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
    let th = x581
    let t583 = @simp.rewr_conv(th)
    let t585 = @equal.lhand(@kernel.concl(th))
    (fn(x587 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
      (x586 => @nets.enter_fn(@list.List([]), t585, fn(x584 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        t583
      }, x586))(x587)
    })(x582)
  }, @bool.conjuncts_rule(pth_false), @nets.empty_net())
  let net2 = @lib.itlist(fn(x588 : @kernel.Thm, x589 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
    let th_1 = x588
    let t590 = @simp.rewr_conv(th_1)
    let cnv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x591 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      t590
    }
    let t595 = @equal.lhand(@kernel.concl(th_1))
    (fn(x597 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
      (x596 => @nets.enter_fn(@list.List([]), t595, fn(x592 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v = x592
        let t594 = conv_neg(v)
        @equal.thenc(cnv(v), t594)
      }, x596))(x597)
    })(x589)
  }, @bool.conjuncts_rule(pth_neg), net1)
  let t598 = @simp.rewr_conv(pth_add)
  let cnv_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x599 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    t598
  }
  let basnet = @nets.enter_fn(@list.List([]), @equal.lhand(@kernel.concl(pth_add)), fn(x600 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let v_1 = x600
    let t602 = conv_add(v_1)
    @equal.thenc(cnv_1(v_1), t602)
  }, net2)
  fn baseconv(x603 : @list.List[@kernel.Term], x604 : @kernel.Term) -> @kernel.Thm raise {
    let vars_2 = x603
    let tm = x604
    try {
      @lib.tryfind(fn(x605 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
        let f = x605
        f(vars_2)(tm)
      }, @nets.lookup(tm, basnet))
    } catch {
      Failure(_) => @equal.thenc(conv_comp, @equal.binop_conv((x606 : @kernel.Term) => baseconv(vars_2, x606)))(tm)
      e => raise e
    }
  }
  let t610 = @simp.pure_rewrite_conv(@list.List([@theorems.disj_aci()]))
  let finconv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.gen_rewrite_conv(fn(x607 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s608 = @equal.depth_conv(x607)
    fn(x609 : @kernel.Term) -> @kernel.Thm raise {
      s608(x609)
    }
  }, @list.List([taut])), t610)
  exists_in_bset_conv_c.set(fn(x611 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars_3 = x611
    fn(x612 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x612
      @equal.thenc((x613 : @kernel.Term) => baseconv(vars_3, x613), finconv)(tm_1)
    }
  })
}

///|
let exists_in_bset_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("EXISTS_IN_BSET_CONV")

///|
/// `EXISTS_IN_BSET_CONV`
pub fn exists_in_bset_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (exists_in_bset_conv_c.get())(x)
}

///|
/// MINUSINF_CONV
fn step_76() -> Unit raise {
  minusinf_conv_c.set(@simp.gen_rewrite_conv(fn(x614 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s615 = @equal.top_sweep_conv(x614)
    fn(x616 : @kernel.Term) -> @kernel.Thm raise {
      s615(x616)
    }
  }, @list.List([minusinf()])))
}

///|
let minusinf_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("MINUSINF_CONV")

///|
/// `MINUSINF_CONV`
pub fn minusinf_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (minusinf_conv_c.get())(x)
}

///|
/// INTERP_CONV
fn step_77() -> Unit raise {
  let t617 = @simp.rewrite_tac(@list.List([interp()]))
  let pth_trivial = @tactics.prove(@term_syntax.parse_term("interp((x : Int), Nox((P : Bool))) == P"), t617)
  let t618 = @simp.rewrite_tac(@list.List([interp()]))
  let pth_comp = @tactics.prove(@term_syntax.parse_term("interp((x : Int), And((p : Cform), (q : Cform))) == (interp(x, p) && interp(x, q)) && interp(x, Or(p, q)) == (interp(x, p) || interp(x, q))"), t618)
  let t620 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interp()])), @int.int_arith_tac)
  let t621 = (@term_syntax.parse_term("(interp((x : Int), Lt((e : Int))) == (int_of_num(0) > x + e) && interp(x, Gt(e)) == (int_of_num(0) < x + e) && interp(x, Eq(e)) == (int_of_num(0) == x + e) && interp(x, Divides((c : Int), e)) == divides(c, x + e)) && interp(x, Ne(e)) == !(int_of_num(0) == x + e) && interp(x, Ndivides(c, e)) == !divides(c, x + e)"), t620)
  let (pth_pos, pth_neg) = @bool.conj_pair((fn(x619 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x619.0, x619.1)
  })(t621))
  let conv_pos : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x622 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x622
    @equal.rand_conv(polynomial_add_conv(vars))
  }
  let conv_neg : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x624 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars_1 = x624
    @equal.rand_conv(@equal.rand_conv(polynomial_add_conv(vars_1)))
  }
  let conv_comp : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x626
  }, @list.List([pth_comp]))
  let net1 = @lib.itlist(fn(x627 : @kernel.Thm, x628 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
    let th = x627
    let t629 = @simp.rewr_conv(th)
    let t631 = @equal.lhand(@kernel.concl(th))
    (fn(x633 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
      (x632 => @nets.enter_fn(@list.List([]), t631, fn(x630 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        t629
      }, x632))(x633)
    })(x628)
  }, @bool.conjuncts_rule(pth_trivial), @nets.empty_net())
  let net2 = @lib.itlist(fn(x634 : @kernel.Thm, x635 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
    let th_1 = x634
    let t636 = @simp.rewr_conv(th_1)
    let cnv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x637 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      t636
    }
    let t641 = @equal.lhand(@kernel.concl(th_1))
    (fn(x643 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
      (x642 => @nets.enter_fn(@list.List([]), t641, fn(x638 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v = x638
        let t640 = conv_pos(v)
        @equal.thenc(cnv(v), t640)
      }, x642))(x643)
    })(x635)
  }, @bool.conjuncts_rule(pth_pos), net1)
  let basnet = @lib.itlist(fn(x644 : @kernel.Thm, x645 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
    let th_2 = x644
    let t646 = @simp.rewr_conv(th_2)
    let cnv_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x647 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      t646
    }
    let t651 = @equal.lhand(@kernel.concl(th_2))
    (fn(x653 : @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise]) -> @nets.Net[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] raise {
      (x652 => @nets.enter_fn(@list.List([]), t651, fn(x648 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_1 = x648
        let t650 = conv_neg(v_1)
        @equal.thenc(cnv_1(v_1), t650)
      }, x652))(x653)
    })(x645)
  }, @bool.conjuncts_rule(pth_neg), net2)
  fn baseconv(x654 : @list.List[@kernel.Term], x655 : @kernel.Term) -> @kernel.Thm raise {
    let vars_2 = x654
    let tm = x655
    try {
      @lib.tryfind(fn(x656 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
        let f = x656
        f(vars_2)(tm)
      }, @nets.lookup(tm, basnet))
    } catch {
      Failure(_) => @equal.thenc(conv_comp, @equal.binop_conv((x657 : @kernel.Term) => baseconv(vars_2, x657)))(tm)
      e => raise e
    }
  }
  interp_conv_c.set(fn(x658 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x659 : @kernel.Term) -> @kernel.Thm raise {
      baseconv(x658, x659)
    }
  })
}

///|
let interp_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("INTERP_CONV")

///|
/// `INTERP_CONV`
pub fn interp_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (interp_conv_c.get())(x)
}

///|
/// EXPAND_INT_CASES_CONV
fn step_78() -> Unit raise {
  let t660 = @meson.meson_tac(@list.List([@int.int_le_antisym()]))
  let pth_base = @tactics.prove(@term_syntax.parse_term("(∃ j : Int, (n : Int) <= j && j <= n && (P : (Int) -> Bool)(j)) == P(n)"), t660)
  let t663 = @meson.meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("int_of_num(0) <= (x : Int) → int_of_num(1) <= x + int_of_num(1)")), @int.int_pos(), @int.int_le_refl()]))
  let t662 = @simp.rewrite_tac(@list.List([@int.int_lt_discrete(), @int.int_le_radd()]))
  let t661 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("((x : Int) <= (y : Int) + int_of_num(1)) == (x == y + int_of_num(1) || x < y + int_of_num(1))"))]))
  let t664 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_suc())])), t661), t662), t663)
  let pth_step = @tactics.prove(@term_syntax.parse_term("(∃ j : Int, int_of_num(1) <= j && j <= int_of_num(SUC((n : Num))) && (P : (Int) -> Bool)(j)) == ((∃ j : Int, int_of_num(1) <= j && j <= int_of_num(n) && P(j)) || P(int_of_num(SUC(n))))"), t664)
  let base_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth_base)
  let t669 = @equal.rand_conv(@equal.once_depth_conv(@calc_num.num_suc_conv))
  let t668 = @simp.rewr_conv(pth_step)
  let step_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.binder_conv(@equal.rand_conv(@equal.land_conv(@lib.funpow(2, fn(x665 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s666 = @equal.rand_conv(x665)
    fn(x667 : @kernel.Term) -> @kernel.Thm raise {
      s666(x667)
    }
  }, @calc_num.num_conv)))), t668), t669)
  fn conv(x670 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x670
    try {
      base_conv(tm)
    } catch {
      Failure(_) => @equal.thenc(step_conv, @equal.land_conv(conv))(tm)
      e => raise e
    }
  }
  expand_int_cases_conv_c.set(conv)
}

///|
let expand_int_cases_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EXPAND_INT_CASES_CONV")

///|
/// `EXPAND_INT_CASES_CONV`
pub fn expand_int_cases_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (expand_int_cases_conv_c.get())(x)
}

///|
/// CANON_INTERP_ADD
fn step_79() -> Unit raise {
  let pat = @term_syntax.parse_term("interp((t : Int) + (c : Int), (P : Cform))")
  canon_interp_add_c.set(fn(x671 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x671
    let net = @simp.net_of_conv(pat, @equal.land_conv(polynomial_add_conv(vars)), @nets.empty_net())
    @equal.once_depth_conv(@simp.rewrites_conv(net))
  })
}

///|
let canon_interp_add_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("CANON_INTERP_ADD")

///|
/// `CANON_INTERP_ADD`
pub fn canon_interp_add(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (canon_interp_add_c.get())(x)
}

///|
/// EVAL_CONSTANT_CONV
fn step_80() -> Unit raise {
  let t684 = @term_syntax.parse_term("false || (a : Bool)")
  let t685 = @term_syntax.parse_term("(a : Bool) || false")
  let t686 = @term_syntax.parse_term("true || (a : Bool)")
  let t687 = @term_syntax.parse_term("(a : Bool) || true")
  let t688 = @term_syntax.parse_term("false && (a : Bool)")
  let t689 = @term_syntax.parse_term("(a : Bool) && false")
  let t690 = @term_syntax.parse_term("true && (a : Bool)")
  let t691 = @term_syntax.parse_term("(a : Bool) && true")
  let t692 = @term_syntax.parse_term("!true")
  let t693 = @lib.map(fn(x683 : @kernel.Term) -> (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise) raise {
    let t = x683
    (t, @simp.rewr_conv(@simp.rewrite_conv(@list.List([]))(t)))
  }, @list.List([@term_syntax.parse_term("!false"), t692, t691, t690, t689, t688, t687, t686, t685, t684]))
  let t680 = (@term_syntax.parse_term("divides((x : Int), (y : Int))"), int_divides_conv)
  let t681 = (@term_syntax.parse_term("(x : Int) == (y : Int)"), int_eq_conv)
  let t682 = (@term_syntax.parse_term("(x : Int) > (y : Int)"), int_gt_conv)
  let net = @lib.itlist(fn(x677 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x678 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s679 = ((x676 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => @lib.uncurry(fn(x673 : @kernel.Term, x674 : (@kernel.Term) -> @kernel.Thm raise) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x675 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        @simp.net_of_conv(x673, x674, x675)
      }
    }, x676))(x677)
    s679(x678)
  }, (@list.List([(@term_syntax.parse_term("(x : Int) < (y : Int)"), int_lt_conv), t682, t681, t680])).concat(t693), @nets.empty_net())
  eval_constant_conv_c.set(@equal.depth_conv(@simp.rewrites_conv(net)))
}

///|
let eval_constant_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EVAL_CONSTANT_CONV")

///|
/// `EVAL_CONSTANT_CONV`
pub fn eval_constant_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (eval_constant_conv_c.get())(x)
}

///|
/// BASIC_COOPER_CONV
fn step_81() -> Unit raise {
  let p_tm = @term_syntax.parse_term("(p : Cform)")
  let d_tm = @term_syntax.parse_term("(d : Int)")
  let pth_b = @bool.specl(@list.List([p_tm, d_tm]), mainthm_b())
  basic_cooper_conv_c.set(fn(x694 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x694
    fn(x695 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x695
      let (x, bod) = @basics.dest_exists(tm)
      let th1 = @equal.thenc(normalize_coeff_conv(vars), shadow_conv)(tm)
      let p = @kernel.rand(@basics.dest_exists(@kernel.rand(@kernel.concl(th1))).1)
      let th2 = @kernel.inst_rule(@list.List([(p, p_tm), (mk_int_const(dplcm(p)), d_tm)]), pth_b)
      let (tm2a, tm2b) = @basics.dest_conj(@equal.lhand(@kernel.concl(th2)))
      let t696 = @bool.eqt_elim(int_lt_conv(tm2b))
      let th3 = @bool.conj(@bool.eqt_elim(alldivide_conv(tm2a)), t696)
      let th4 = @kernel.trans(th1, @bool.mp(th2, th3))
      let th5 = @equal.conv_rule(@equal.rand_conv(@equal.binder_conv(@lib.funpow(2, fn(x697 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s698 = @equal.rand_conv(x697)
        fn(x699 : @kernel.Term) -> @kernel.Thm raise {
          s698(x699)
        }
      }, @equal.land_conv(minusinf_conv)))), th4)
      let th6 = @equal.conv_rule(@equal.rand_conv(@equal.binder_conv(@lib.funpow(3, fn(x700 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s701 = @equal.rand_conv(x700)
        fn(x702 : @kernel.Term) -> @kernel.Thm raise {
          s701(x702)
        }
      }, exists_in_bset_conv(vars)))), th5)
      let th7 = @equal.conv_rule(@equal.rand_conv(expand_int_cases_conv), th6)
      let th8 = @equal.conv_rule(@equal.rand_conv(canon_interp_add(vars)), th7)
      let th9 = @equal.conv_rule(@equal.rand_conv(@equal.once_depth_conv(interp_conv(vars))), th8)
      @equal.conv_rule(@equal.rand_conv(eval_constant_conv), th9)
    }
  })
}

///|
let basic_cooper_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("BASIC_COOPER_CONV")

///|
/// `BASIC_COOPER_CONV`
pub fn basic_cooper_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (basic_cooper_conv_c.get())(x)
}

///|
/// NNF_POSINEQ_CONV
fn step_82() -> Unit raise {
  let t703 = @simp.rewrite_tac(@list.List([@int.int_lt_discrete(), @int.int_gt_discrete()]))
  let t704 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_not_lt(), @int.int_gt_v1()])), t703), @int.int_arith_tac)
  let pth = @tactics.prove(@term_syntax.parse_term("!(int_of_num(0) < (x : Int)) == (int_of_num(0) < int_of_num(1) - x) && !(int_of_num(0) > x) == (int_of_num(0) < int_of_num(1) + x)"), t704)
  let conv1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x705 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x705
    let t707 = @equal.rand_conv(polynomial_sub_conv(vars))
    @equal.thenc(@simp.rewr_conv(@bool.conjunct1(pth)), t707)
  }
  let conv2 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x708 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars_1 = x708
    let t710 = @equal.rand_conv(polynomial_add_conv(vars_1))
    @equal.thenc(@simp.rewr_conv(@bool.conjunct2(pth)), t710)
  }
  let pat1 = @term_syntax.parse_term("!(int_of_num(0) < (x : Int))")
  let pat2 = @term_syntax.parse_term("!(int_of_num(0) > (x : Int))")
  let t717 = @term_syntax.parse_term("!((p : Bool) || (q : Bool)) == (!p && !q)")
  let t718 = @term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (!p || !q)")
  let net = @lib.itlist(fn(x711 : @kernel.Term, x712 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let t = x711
    let t713 = @simp.rewr_conv(@class.taut(t))
    let t714 = @equal.lhand(t)
    (fn(x716 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      ((x715 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) => @simp.net_of_conv(t714, t713, x715))(x716)
    })(x712)
  }, @list.List([@term_syntax.parse_term("!!(p : Bool) == p"), t718, t717]), @nets.empty_net())
  nnf_posineq_conv_c.set(fn(x719 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars_2 = x719
    let t721 = @simp.net_of_conv(pat2, conv2(vars_2), net)
    let net_p = @simp.net_of_conv(pat1, conv1(vars_2), t721)
    @equal.top_sweep_conv(@simp.rewrites_conv(net_p))
  })
}

///|
let nnf_posineq_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("NNF_POSINEQ_CONV")

///|
/// `NNF_POSINEQ_CONV`
pub fn nnf_posineq_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (nnf_posineq_conv_c.get())(x)
}

///|
/// COOPER_CONV
fn step_83() -> Unit raise {
  let t723 = @meson.meson_tac(@list.List([]))
  let forall_elim_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x722 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x722
  }, @list.List([@tactics.prove(@term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x)) == !(∃ x : _, !P(x))"), t723)]))
  let not_tm = @term_syntax.parse_term("op_tilde")
  fn conv(x724 : @list.List[@kernel.Term], x725 : @kernel.Term) -> @kernel.Thm raise {
    let vars = x724
    let tm = x725
    if (@basics.is_conj(tm) || @basics.is_disj(tm)) {
      let (lop, r) = @kernel.dest_comb(tm)
      let (op, l) = @kernel.dest_comb(lop)
      let t726 = conv(vars, r)
      @kernel.mk_comb_rule(@equal.ap_term(op, conv(vars, l)), t726)
    } else {
      if @basics.is_neg(tm) {
        let (l_1, r_1) = @kernel.dest_comb(tm)
        @equal.ap_term(l_1, conv(vars, r_1))
      } else {
        if @basics.is_exists(tm) {
          let (x, bod) = @basics.dest_exists(tm)
          let th1 = @drule.mk_exists_rule(x, conv(vars.prepend(x), bod))
          let t727 = @kernel.rand(@kernel.concl(th1))
          @kernel.trans(th1, basic_cooper_conv(vars)(t727))
        } else {
          if @basics.is_forall(tm) {
            let (x_1, bod_1) = @basics.dest_forall(tm)
            let th1_1 = @equal.ap_term(not_tm, conv(vars.prepend(x_1), bod_1))
            let th2 = @equal.conv_rule(@equal.rand_conv(nnf_posineq_conv(vars.prepend(x_1))), th1_1)
            let th3 = @drule.mk_exists_rule(x_1, th2)
            let th4 = @equal.conv_rule(@equal.rand_conv(basic_cooper_conv(vars)), th3)
            let t728 = @equal.ap_term(not_tm, th4)
            let th5 = @equal.conv_rule(@equal.rand_conv(nnf_posineq_conv(vars.prepend(x_1))), t728)
            @kernel.trans(forall_elim_conv(tm), th5)
          } else {
            @kernel.refl(tm)
          }
        }
      }
    }
  }
  let t732 = @int.int_arith(@term_syntax.parse_term("min((m : Int), (n : Int)) == (if m <= n { m } else { n })"))
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@canon.presimp_conv, @simp.gen_rewrite_conv(fn(x729 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s730 = @equal.once_depth_conv(x729)
    fn(x731 : @kernel.Term) -> @kernel.Thm raise {
      s730(x731)
    }
  }, @list.List([@int.int_abs_v1(), @int.int_arith(@term_syntax.parse_term("max((m : Int), (n : Int)) == (if m <= n { n } else { m })")), t732]))), @canon.conds_elim_conv), @canon.nnf_conv)
  cooper_conv_c.set(fn(x733 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x733
    let vars_1 = @kernel.frees(tm_1)
    let th1_2 = @equal.thenc(init_conv, linearize_conv(vars_1))(tm_1)
    let th2_1 = @kernel.trans(th1_2, conv(vars_1, @kernel.rand(@kernel.concl(th1_2))))
    @kernel.trans(th2_1, eval_constant_conv(@kernel.rand(@kernel.concl(th2_1))))
  })
}

///|
let cooper_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COOPER_CONV")

///|
/// `COOPER_CONV`
pub fn cooper_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cooper_conv_c.get())(x)
}

///|
/// Examples/cooper.ml:1302
fn step_84() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, x < y → int_of_num(2) * x + int_of_num(1) < int_of_num(2) * y")))
}

///|
/// Examples/cooper.ml:1304
fn step_85() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !(int_of_num(2) * x + int_of_num(1) == int_of_num(2) * y)")))
}

///|
/// Examples/cooper.ml:1306
fn step_86() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, x > int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x - int_of_num(5) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1309
fn step_87() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, ∃ z : _, int_of_num(4) * x - int_of_num(6) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1311
fn step_88() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (b : Int) < x → (a : Int) <= x")))
}

///|
/// Examples/cooper.ml:1313
fn step_89() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (a : Int) < int_of_num(3) * x → (b : Int) < int_of_num(3) * x")))
}

///|
/// Examples/cooper.ml:1315
fn step_90() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, x <= y → int_of_num(2) * x + int_of_num(1) < int_of_num(2) * y")))
}

///|
/// Examples/cooper.ml:1317
fn step_91() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("(∃ d : Int, (y : Int) == int_of_num(65) * d) → (∃ d : Int, y == int_of_num(5) * d)")))
}

///|
/// Examples/cooper.ml:1319
fn step_92() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ y : Int, (∃ d : Int, y == int_of_num(65) * d) → (∃ d : Int, y == int_of_num(5) * d)")))
}

///|
/// Examples/cooper.ml:1321
fn step_93() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !(int_of_num(2) * x + int_of_num(1) == int_of_num(2) * y)")))
}

///|
/// Examples/cooper.ml:1323
fn step_94() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, int_of_num(2) * x + int_of_num(1) == int_of_num(2) * y → x + (y + z) > int_of_num(129)")))
}

///|
/// Examples/cooper.ml:1325
fn step_95() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (a : Int) < x → (b : Int) < x")))
}

///|
/// Examples/cooper.ml:1327
fn step_96() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (a : Int) <= x → (b : Int) < x")))
}

///|
/// Examples/cooper.ml:1333
fn step_97() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ x : Int, a < int_of_num(20) * x && int_of_num(20) * x < b")))
}

///|
/// Examples/cooper.ml:1335
fn step_98() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, (a : Int) < int_of_num(20) * x && int_of_num(20) * x < (b : Int)")))
}

///|
/// Examples/cooper.ml:1337
fn step_99() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ b : Int, ∃ x : Int, (a : Int) < int_of_num(20) * x && int_of_num(20) * x < b")))
}

///|
/// Examples/cooper.ml:1339
fn step_100() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ a : Int, ∃ b : Int, a < int_of_num(4) * b + int_of_num(3) * a || !(a < b) && a > b + int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1341
fn step_101() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ y : Int, ∀ x : Int, x + int_of_num(5) * y > int_of_num(1) && int_of_num(13) * x - y > int_of_num(1) && x + int_of_num(2) < int_of_num(0)")))
}

///|
/// Examples/cooper.ml:1347
fn step_102() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, x >= int_of_num(0) && y >= int_of_num(0) → int_of_num(12) * x - int_of_num(8) * y < int_of_num(0) || int_of_num(12) * x - int_of_num(8) * y > int_of_num(2)")))
}

///|
/// Examples/cooper.ml:1350
fn step_103() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, int_of_num(5) * x + int_of_num(3) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1352
fn step_104() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, int_of_num(5) * x + int_of_num(10) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1354
fn step_105() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(5) * x - int_of_num(6) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1356
fn step_106() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ w : Int, ∃ x : Int, ∃ y : Int, ∃ z : Int, int_of_num(2) * w + (int_of_num(3) * x + (int_of_num(4) * y + int_of_num(5) * z)) == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1358
fn step_107() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(5) * x - int_of_num(3) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1360
fn step_108() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x - int_of_num(5) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1362
fn step_109() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(6) * x - int_of_num(3) * y == int_of_num(1)")))
}

///|
/// Examples/cooper.ml:1364
fn step_110() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !(x == int_of_num(0)) → int_of_num(5) * y < int_of_num(6) * x || int_of_num(5) * y > int_of_num(6) * x")))
}

///|
/// Examples/cooper.ml:1366
fn step_111() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !divides(int_of_num(5), x) && !divides(int_of_num(6), y) → !(int_of_num(6) * x == int_of_num(5) * y)")))
}

///|
/// Examples/cooper.ml:1369
fn step_112() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !divides(int_of_num(5), x) → !(int_of_num(6) * x == int_of_num(5) * y)")))
}

///|
/// Examples/cooper.ml:1371
fn step_113() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, !(int_of_num(6) * x == int_of_num(5) * y)")))
}

///|
/// Examples/cooper.ml:1373
fn step_114() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_of_num(6) * x == int_of_num(5) * y → (∃ d : Int, y == int_of_num(3) * d)")))
}

///|
/// Examples/cooper.ml:1375
fn step_115() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("int_of_num(6) * (x : Int) == int_of_num(5) * (y : Int) → (∃ d : Int, y == int_of_num(3) * d)")))
}

///|
/// Examples/cooper.ml:1381
fn step_116() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ z : Int, z > int_of_num(7) → (∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x + int_of_num(5) * y == z)")))
}

///|
/// Examples/cooper.ml:1384
fn step_117() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ z : Int, z > int_of_num(2) → (∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x + int_of_num(5) * y == z)")))
}

///|
/// Examples/cooper.ml:1387
fn step_118() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ z : Int, z <= int_of_num(7) → (∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x + int_of_num(5) * y == z) == !(∃ x : Int, ∃ y : Int, x >= int_of_num(0) && y >= int_of_num(0) && int_of_num(3) * x + int_of_num(5) * y == int_of_num(7) - z)")))
}

///|
/// Examples/cooper.ml:1395
fn step_119() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (!divides(int_of_num(2), x) && divides(int_of_num(3), x - int_of_num(1))) == (divides(int_of_num(12), x - int_of_num(1)) || divides(int_of_num(12), x - int_of_num(7)))")))
}

///|
/// Examples/cooper.ml:1398
fn step_120() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, (!(∃ m : Int, x == int_of_num(2) * m) && (∃ m : Int, x == int_of_num(3) * m + int_of_num(1))) == ((∃ m : Int, x == int_of_num(12) * m + int_of_num(1)) || (∃ m : Int, x == int_of_num(12) * m + int_of_num(7)))")))
}

///|
/// Examples/cooper.ml:1405
fn step_121() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, !divides(int_of_num(2), x) → divides(int_of_num(4), x - int_of_num(1)) || divides(int_of_num(8), x - int_of_num(1)) || divides(int_of_num(8), x - int_of_num(3)) || divides(int_of_num(6), x - int_of_num(1)) || divides(int_of_num(14), x - int_of_num(1)) || divides(int_of_num(14), x - int_of_num(9)) || divides(int_of_num(14), x - int_of_num(11)) || divides(int_of_num(24), x - int_of_num(5)) || divides(int_of_num(24), x - int_of_num(11))")))
}

///|
/// Examples/cooper.ml:1421
fn step_122() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ v_1 : Int, ∀ v_2 : Int, ∀ v_3 : Int, a + int_of_num(2) == b && v_3 == b - a + int_of_num(1) && v_2 == b - int_of_num(2) && v_1 == int_of_num(3) → false")))
}

///|
/// Examples/cooper.ml:1429
fn step_123() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ a : Int, ∃ b : Int, !(a == int_of_num(1)) && (int_of_num(2) * b == a || int_of_num(2) * b == int_of_num(3) * a + int_of_num(1)) && a == b")))
}

///|
/// Examples/cooper.ml:1433
fn step_124() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ a : Int, ∃ b : Int, a > int_of_num(1) && b > int_of_num(1) && (int_of_num(2) * b == a || int_of_num(2) * b == int_of_num(3) * a + int_of_num(1)) && a == b")))
}

///|
/// Examples/cooper.ml:1438
fn step_125() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ b : Int, (a : Int) > int_of_num(1) && b > int_of_num(1) && (int_of_num(2) * b == a || int_of_num(2) * b == int_of_num(3) * a + int_of_num(1)) && (int_of_num(2) * a == b || int_of_num(2) * a == int_of_num(3) * b + int_of_num(1))")))
}

///|
/// Examples/cooper.ml:1472
fn step_126() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, int_of_num(5) * x + (x + x) < x || (y : Int) == int_of_num(7) - x && int_of_num(33) + (z : Int) < x && x + int_of_num(1) <= int_of_num(2) * y || divides(int_of_num(3), int_of_num(4) * x + z) && x + (y + z) == int_of_num(7) * z")))
}

///|
/// Examples/cooper.ml:1477
fn step_127() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, int_of_num(5) * x + (x + x) < x || (y : Int) == int_of_num(7) - x && int_of_num(33) + (z : Int) < x && x + int_of_num(1) <= int_of_num(2) * y || divides(int_of_num(3), int_of_num(4) * x + z) && x + (y + z) == int_of_num(7) * z")))
}

///|
/// Examples/cooper.ml:1485
fn step_128() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, int_of_num(5) * x + (x + x) < x || (y : Int) == int_of_num(7) - x && int_of_num(33) + (z : Int) < x && x + int_of_num(1) <= int_of_num(2) * y || divides(int_of_num(3), int_of_num(4) * x + z) && x + (y + z) == int_of_num(7) * z")))
}

///|
/// Examples/cooper.ml:1513
fn step_129() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, x + int_of_num(1) < int_of_num(2) * (y : Int) && divides(int_of_num(3), int_of_num(4) * x + (z : Int)) && int_of_num(6) * x + (y + z) == int_of_num(7) * z")))
}

///|
/// Examples/cooper.ml:1518
fn step_130() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∃ x : Int, int_of_num(5) * x + (x + x) < x || (y : Int) == int_of_num(7) - x && int_of_num(33) + (z : Int) < x && x + int_of_num(1) < int_of_num(2) * y || divides(int_of_num(3), int_of_num(4) * x + z) && x + (y + z) == int_of_num(7) * z")))
}

///|
/// Examples/cooper.ml:1530
fn step_131() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, x >= int_of_num(8) → (∃ u : Int, ∃ v : Int, u >= int_of_num(0) && v >= int_of_num(0) && x == int_of_num(3) * u + int_of_num(5) * v)")))
}

///|
/// Examples/cooper.ml:1533
fn step_132() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, x >= int_of_num(10) → (∃ u : Int, ∃ v : Int, u >= int_of_num(0) && v >= int_of_num(0) && x == int_of_num(3) * u + int_of_num(7) * v)")))
}

///|
/// Examples/cooper.ml:1536
fn step_133() -> Unit raise {
  ignore(@lib.time(cooper_conv, @term_syntax.parse_term("∀ x : Int, x >= int_of_num(30) → (∃ u : Int, ∃ v : Int, u >= int_of_num(0) && v >= int_of_num(0) && x == int_of_num(3) * u + int_of_num(7) * v)")))
}

///|
/// `INT_COOPER`
pub fn int_cooper(x734 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x734
  let fvs = @kernel.frees(tm)
  let tm_p = @bool.list_mk_forall(fvs, tm)
  @bool.specl(fvs, @bool.eqt_elim(cooper_conv(tm_p)))
}

///|
/// `COOPER_RULE`
pub fn cooper_rule(x735 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x735
  let fvs = @kernel.frees(tm)
  let tm_p = @bool.list_mk_forall(fvs, tm)
  let th = @equal.thenc(@int.num_to_int_conv, cooper_conv)(tm_p)
  @bool.specl(fvs, @bool.eqt_elim(th))
}

///|
/// Examples/cooper.ml:1560
fn step_134() -> Unit raise {
  ignore(@lib.time(int_cooper, @term_syntax.parse_term("abs((x : Int)) < int_of_num(1) → x == int_of_num(0)")))
}

///|
/// Examples/cooper.ml:1562
fn step_135() -> Unit raise {
  ignore(@lib.time(cooper_rule, @term_syntax.parse_term("ODD((n : Num)) → 2 * DIV(n, 2) < n")))
}

///|
/// Examples/cooper.ml:1564
fn step_136() -> Unit raise {
  ignore(@lib.time(cooper_rule, @term_syntax.parse_term("∀ n : Num, EVEN(n) → 2 * DIV(n, 2) == n")))
}

///|
/// Examples/cooper.ml:1566
fn step_137() -> Unit raise {
  ignore(@lib.time(cooper_rule, @term_syntax.parse_term("∀ n : Num, ODD(n) == (2 * DIV(n, 2) < n)")))
}

///|
/// Examples/cooper.ml:1576
fn step_138() -> Unit raise {
  ignore(@lib.time(cooper_rule, @term_syntax.parse_term("∀ n : Num, n >= 8 → (∃ a : Num, ∃ b : Num, n == 3 * a + 5 * b)")))
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
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
}
