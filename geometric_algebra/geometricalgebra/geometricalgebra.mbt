// Translated from upstream Geometric_Algebra/geometricalgebra.ml; edit this file directly.

///|
/// Geometric_Algebra/geometricalgebra.ml:12
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// GEOM_MBASIS_LID
fn step_2() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid(), @vectors.vector_mul_lid()]))
  let t3 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"))]))
  let t2 = @simp.simp_tac(@list.List([@clifford.geom_mbasis(), @sets.diff_empty(), @sets.empty_diff(), @sets.union_empty(), @sets.empty_subset()]))
  let t1 = @simp.simp_tac(@list.List([@clifford.geom_rmul(), @clifford.geom_radd()]))
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@clifford.mbasis_extension()), t1), t2), t3), t4)
  geom_mbasis_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[_]], mbasis({}) * x == x"), t5))
}

///|
let geom_mbasis_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS_LID")

///|
/// `GEOM_MBASIS_LID`
pub fn geom_mbasis_lid() -> @kernel.Thm {
  geom_mbasis_lid_c.get()
}

///|
/// GEOM_MBASIS_RID
fn step_3() -> Unit raise {
  let t9 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid(), @vectors.vector_mul_lid()]))
  let t8 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, (s : (Num) -> Bool)) && IN(j, {}) && i > j} == {}"))]))
  let t7 = @simp.simp_tac(@list.List([@clifford.geom_mbasis(), @sets.diff_empty(), @sets.empty_diff(), @sets.union_empty(), @sets.empty_subset()]))
  let t6 = @simp.simp_tac(@list.List([@clifford.geom_lmul(), @clifford.geom_ladd()]))
  let t10 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@clifford.mbasis_extension()), t6), t7), t8), t9)
  geom_mbasis_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Multivector[_]], x * mbasis({}) == x"), t10))
}

///|
let geom_mbasis_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS_RID")

///|
/// `GEOM_MBASIS_RID`
pub fn geom_mbasis_rid() -> @kernel.Thm {
  geom_mbasis_rid_c.get()
}

///|
/// GEOM_MBASIS_SKEWSYM
fn step_4() -> Unit raise {
  let t18 = @sets.set_tac(@list.List([]))
  let t17 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t16 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_neg(), @vectors.vector_neg_0()]))
  let t15 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t12 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → i < j && !(j < i) || j < i && !(i < j)")))
  let t14 = @tactics.first_assum(fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t12(x13))
  })
  let t11 = @simp.asm_rewrite_tac(@list.List([@clifford.geom_mbasis_sing()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t11), t14), t15), @class.cond_cases_tac), t16), t17), t18)
  geom_mbasis_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j}) == (if i == j { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i}) } else { -((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({j}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[_]])({i})) })"), t19))
}

///|
let geom_mbasis_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS_SKEWSYM")

///|
/// `GEOM_MBASIS_SKEWSYM`
pub fn geom_mbasis_skewsym() -> @kernel.Thm {
  geom_mbasis_skewsym_c.get()
}

///|
/// GEOM_MBASIS_REFL
fn step_5() -> Unit raise {
  let t20 = @tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@clifford.geom_mbasis_sing()])))
  geom_mbasis_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}) == (if IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({}) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) })"), t20))
}

///|
let geom_mbasis_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MBASIS_REFL")

///|
/// `GEOM_MBASIS_REFL`
pub fn geom_mbasis_refl() -> @kernel.Thm {
  geom_mbasis_refl_c.get()
}

///|
/// G_P_Q_R_WITH_G_N
fn step_6() -> Unit raise {
  let t101 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → 1 <= i - 2 && i - 2 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"))]))
  let t100 = @simp.rewrite_tac(@list.List([geom_mbasis_lid(), geom_mbasis_refl(), @iterate.in_numseg()]))
  let t99 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → 1 <= i - 1 && i - 1 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"))]))
  let t98 = @simp.rewrite_tac(@list.List([geom_mbasis_refl(), @iterate.in_numseg()]))
  let t97 = @simp.gen_rewrite_tac(fn(x96 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x92 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x86 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s87 = @equal.land_conv(x86)
        fn(x88 : @kernel.Term) -> @kernel.Thm raise {
          s87(x88)
        }
      })((fn(x89 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s90 = @equal.rand_conv(x89)
        fn(x91 : @kernel.Term) -> @kernel.Thm raise {
          s90(x91)
        }
      })(x92))
    })((fn(x93 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s94 = @equal.once_depth_conv(x93)
      fn(x95 : @kernel.Term) -> @kernel.Thm raise {
        s94(x95)
      }
    })(x96))
  }, @list.List([@clifford.geom_assoc()]))
  let t85 = @simp.rewrite_tac(@list.List([@clifford.geom_rneg(), @vectors.vector_neg_neg()]))
  let t84 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) → !(i - 2 == i - 1)"))]))
  let t83 = @simp.once_rewrite_tac(@list.List([geom_mbasis_skewsym()]))
  let t82 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) → 1 <= i")), geom_mbasis_lid()]))
  let t81 = @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg(), geom_mbasis_refl()]))
  let t80 = @simp.gen_rewrite_tac(fn(x79 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x75 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x71 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x67 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x61 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s62 = @equal.land_conv(x61)
            fn(x63 : @kernel.Term) -> @kernel.Thm raise {
              s62(x63)
            }
          })((fn(x64 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s65 = @equal.rand_conv(x64)
            fn(x66 : @kernel.Term) -> @kernel.Thm raise {
              s65(x66)
            }
          })(x67))
        })((fn(x68 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s69 = @equal.rand_conv(x68)
          fn(x70 : @kernel.Term) -> @kernel.Thm raise {
            s69(x70)
          }
        })(x71))
      })((fn(x72 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s73 = @equal.rand_conv(x72)
        fn(x74 : @kernel.Term) -> @kernel.Thm raise {
          s73(x74)
        }
      })(x75))
    })((fn(x76 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s77 = @equal.once_depth_conv(x76)
      fn(x78 : @kernel.Term) -> @kernel.Thm raise {
        s77(x78)
      }
    })(x79))
  }, @list.List([@clifford.geom_assoc()]))
  let t60 = @simp.rewrite_tac(@list.List([@clifford.geom_lneg(), @clifford.geom_rneg(), @equal.gsym(@clifford.geom_assoc())]))
  let t59 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) → !(i - 2 == i)"))]))
  let t58 = @simp.gen_rewrite_tac(fn(x57 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x47 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s48 = @equal.land_conv(x47)
        fn(x49 : @kernel.Term) -> @kernel.Thm raise {
          s48(x49)
        }
      })((fn(x50 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s51 = @equal.rand_conv(x50)
        fn(x52 : @kernel.Term) -> @kernel.Thm raise {
          s51(x52)
        }
      })(x53))
    })((fn(x54 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s55 = @equal.once_depth_conv(x54)
      fn(x56 : @kernel.Term) -> @kernel.Thm raise {
        s55(x56)
      }
    })(x57))
  }, @list.List([geom_mbasis_skewsym()]))
  let t46 = @simp.gen_rewrite_tac(fn(x45 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x41 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x35 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s36 = @equal.land_conv(x35)
        fn(x37 : @kernel.Term) -> @kernel.Thm raise {
          s36(x37)
        }
      })((fn(x38 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s39 = @equal.rand_conv(x38)
        fn(x40 : @kernel.Term) -> @kernel.Thm raise {
          s39(x40)
        }
      })(x41))
    })((fn(x42 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s43 = @equal.once_depth_conv(x42)
      fn(x44 : @kernel.Term) -> @kernel.Thm raise {
        s43(x44)
      }
    })(x45))
  }, @list.List([@clifford.geom_assoc()]))
  let t34 = @simp.rewrite_tac(@list.List([@clifford.geom_rneg()]))
  let t33 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 < (i : Num) → !(i - 1 == i)"))]))
  let t32 = @simp.gen_rewrite_tac(fn(x31 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x27 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x21 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s22 = @equal.land_conv(x21)
        fn(x23 : @kernel.Term) -> @kernel.Thm raise {
          s22(x23)
        }
      })((fn(x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s25 = @equal.rand_conv(x24)
        fn(x26 : @kernel.Term) -> @kernel.Thm raise {
          s25(x26)
        }
      })(x27))
    })((fn(x28 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s29 = @equal.once_depth_conv(x28)
      fn(x30 : @kernel.Term) -> @kernel.Thm raise {
        s29(x30)
      }
    })(x31))
  }, @list.List([geom_mbasis_skewsym()]))
  let t102 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t32), t33), t34), @tactics.ap_term_tac), t46), t58), t59), t60), t80), t81), t82), t83), t84), t85), t97), t98), t99), t100), t101)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ i : Num, 2 < i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i - 2}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i - 1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i})) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i - 2}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i - 1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}))) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({})"), t102)
  let t158 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) + ((q : Num) + 1) <= (i : Num) → !(4 * i - 3 * p - q - 1 == i - q)"))]))
  let t157 = @simp.gen_rewrite_tac(fn(x156 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x150 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s151 = @equal.land_conv(x150)
      fn(x152 : @kernel.Term) -> @kernel.Thm raise {
        s151(x152)
      }
    })((fn(x153 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s154 = @equal.once_depth_conv(x153)
      fn(x155 : @kernel.Term) -> @kernel.Thm raise {
        s154(x155)
      }
    })(x156))
  }, @list.List([geom_mbasis_skewsym()]))
  let t149 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@clifford.geom_rneg())]))
  let t148 = @simp.rewrite_tac(@list.List([@clifford.geom_lneg(), @equal.gsym(@clifford.geom_assoc())]))
  let t147 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) + ((q : Num) + 1) <= (i : Num) → !(4 * i - 3 * p - q - 2 == i - q)"))]))
  let t146 = @simp.gen_rewrite_tac(fn(x145 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x139 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s140 = @equal.rand_conv(x139)
      fn(x141 : @kernel.Term) -> @kernel.Thm raise {
        s140(x141)
      }
    })((fn(x142 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s143 = @equal.once_depth_conv(x142)
      fn(x144 : @kernel.Term) -> @kernel.Thm raise {
        s143(x144)
      }
    })(x145))
  }, @list.List([geom_mbasis_skewsym()]))
  let t138 = @simp.rewrite_tac(@list.List([@clifford.geom_assoc()]))
  let t137 = @simp.rewrite_tac(@list.List([@clifford.geom_rneg()]))
  let t136 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) + ((q : Num) + 1) <= (i : Num) → !(4 * i - 3 * p - q == i - q)"))]))
  let t135 = @simp.gen_rewrite_tac(fn(x134 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x128 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s129 = @equal.land_conv(x128)
      fn(x130 : @kernel.Term) -> @kernel.Thm raise {
        s129(x130)
      }
    })((fn(x131 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s132 = @equal.once_depth_conv(x131)
      fn(x133 : @kernel.Term) -> @kernel.Thm raise {
        s132(x133)
      }
    })(x134))
  }, @list.List([geom_mbasis_skewsym()]))
  let t127 = @simp.rewrite_tac(@list.List([@equal.gsym(@clifford.geom_assoc())]))
  let t125 = @simp.asm_simp_tac(@list.List([lemma]))
  let t124 = @tactics.subgoal_then(@term_syntax.parse_term("2 < 4 * (i : Num) - 3 * (p : Num) - (q : Num) && 4 * i - 3 * p - q <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s122 = @tactics.assume_tac(x121)
    fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s122(x123)
    }
  })
  let t126 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([geom_mbasis_refl(), @iterate.in_numseg()])), t124), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t125), @int.asm_arith_tac), @tactics.all_tac])
  let t120 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, _]) + (b : Cart[Real, _]) == vec(0)) == (b == -a)"))]))
  let t119 = @simp.gen_rewrite_tac(fn(x118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x112 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s113 = @equal.rand_conv(x112)
      fn(x114 : @kernel.Term) -> @kernel.Thm raise {
        s113(x114)
      }
    })((fn(x115 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s116 = @equal.once_depth_conv(x115)
      fn(x117 : @kernel.Term) -> @kernel.Thm raise {
        s116(x117)
      }
    })(x118))
  }, @list.List([@equal.gsym(@vectors.vector_add_lid())]))
  let t111 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + (b : Cart[Real, N]) + ((c : Cart[Real, N]) + (d : Cart[Real, N])) == a + d + (b + c)"))]))
  let t110 = @simp.rewrite_tac(@list.List([@clifford.geom_ladd(), @clifford.geom_radd(), @clifford.geom_rzero()]))
  let t109 = @simp.asm_rewrite_tac(@list.List([]))
  let t107 = @simp.asm_simp_tac(@list.List([lemma]))
  let t108 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("2 < 3 * (i : Num) - 2 * (p : Num) + (r : Num) && 3 * i - 2 * p + r <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s105 = @tactics.assume_tac(x104)
    fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s105(x106)
    }
  }), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t107), @tactics.all_tac])
  let t103 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([geom_mbasis_refl(), @iterate.in_numseg()])), @int.asm_arith_tac), @tactics.all_tac])
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t103), @class.cond_cases_tac), t108), t109), @class.cond_cases_tac), t110), t111), t119), @tactics.binop_tac), t120), t126), t127), t135), t136), t137), @tactics.ap_term_tac), t138), @tactics.ap_thm_tac), @tactics.ap_term_tac), t146), t147), t148), t149), @tactics.ap_term_tac), t157), t158)
  g_p_q_r_with_g_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ i : Num, ∀ e : (Num) -> Cart[Real, Multivector[N]], 1 <= p + (q + r) && p + (3 * q + 4 * r) <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && e(i) == (if 1 <= i && i <= p { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i}) } else { if p + 1 <= i && i <= p + q { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({3 * i - 2 * p + r - 2}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({3 * i - 2 * p + r - 1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({3 * i - 2 * p + r})) } else { if p + (q + 1) <= i && i <= p + (q + r) { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({i - q}) + (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({4 * i - 3 * p - q - 2}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({4 * i - 3 * p - q - 1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])({4 * i - 3 * p - q})) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) } } }) → e(i) * e(i) == (if 1 <= i && i <= p { (mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(({} : (Num) -> Bool)) } else { if p + 1 <= i && i <= p + q { -(mbasis : ((Num) -> Bool) -> Cart[Real, Multivector[N]])(({} : (Num) -> Bool)) } else { (vec : (Num) -> Cart[Real, Multivector[N]])(0) } })"), t159))
}

///|
let g_p_q_r_with_g_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("G_P_Q_R_WITH_G_N")

///|
/// `G_P_Q_R_WITH_G_N`
pub fn g_p_q_r_with_g_n() -> @kernel.Thm {
  g_p_q_r_with_g_n_c.get()
}

///|
/// FINITE_POWERSET_CART_SUBSET_LEMMA
fn step_7() -> Unit raise {
  let t163 = @simp.simp_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t162 = @simp.simp_tac(@list.List([@sets.subset(), @sets.finite_product(), @iterate.finite_numseg(), @sets.finite_powerset()]))
  let t161 = @tactics.exists_tac(@term_syntax.parse_term("{((i : (Num) -> Bool), (j : (Num) -> Bool)) | IN(i, {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (m : Num)))}) && IN(j, {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (n : Num)))})}"))
  let t160 = @tactics.match_mp_tac(@sets.finite_subset())
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t160), t161), t162), t163)
  finite_powerset_cart_subset_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((Num) -> Bool, (Num) -> Bool) -> Bool, ∀ m : Num, ∀ n : Num, FINITE({((i : (Num) -> Bool), (j : (Num) -> Bool)) | IN(i, {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, m))}) && IN(j, {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, n))}) && P(i, j)})"), t164))
}

///|
let finite_powerset_cart_subset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_POWERSET_CART_SUBSET_LEMMA")

///|
/// `FINITE_POWERSET_CART_SUBSET_LEMMA`
pub fn finite_powerset_cart_subset_lemma() -> @kernel.Thm {
  finite_powerset_cart_subset_lemma_c.get()
}

///|
/// FINITE_CART_SUBSET_LEMMA1
fn step_8() -> Unit raise {
  let t168 = @simp.simp_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t167 = @simp.simp_tac(@list.List([@sets.subset(), @sets.finite_product(), @iterate.finite_numseg()]))
  let t166 = @tactics.exists_tac(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, op_dot_dot((m : Num), (n : Num))) && IN(j, op_dot_dot((m' : Num), (n' : Num)))}"))
  let t165 = @tactics.match_mp_tac(@sets.finite_subset())
  let t169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t165), t166), t167), t168)
  finite_cart_subset_lemma1_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num, Num) -> Bool, ∀ m : Num, ∀ n : Num, ∀ m' : Num, ∀ n' : Num, FINITE({((i : Num), (j : Num)) | IN(i, op_dot_dot(m, n)) && IN(j, op_dot_dot(m', n')) && P(i, j)})"), t169))
}

///|
let finite_cart_subset_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CART_SUBSET_LEMMA1")

///|
/// `FINITE_CART_SUBSET_LEMMA1`
pub fn finite_cart_subset_lemma1() -> @kernel.Thm {
  finite_cart_subset_lemma1_c.get()
}

///|
/// pdimindex
fn step_9() -> Unit raise {
  pdimindex_c.set(@pair.new_definition(@term_syntax.parse_term("(pdimindex : ((A) -> Bool) -> Num)((s : (A) -> Bool)) == dimindex(s) - 1")))
}

///|
let pdimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pdimindex")

///|
/// `pdimindex`
pub fn pdimindex() -> @kernel.Thm {
  pdimindex_c.get()
}

///|
/// PDIMINDEX_SUC_DIMINDEX
fn step_10() -> Unit raise {
  let t170 = @simp.simp_tac(@list.List([pdimindex(), @cart.dimindex_ge_1(), @arith.sub_add()]))
  pdimindex_suc_dimindex_c.set(@tactics.prove(@term_syntax.parse_term("dimindex((s : (A) -> Bool)) == pdimindex(s) + 1"), t170))
}

///|
let pdimindex_suc_dimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_SUC_DIMINDEX")

///|
/// `PDIMINDEX_SUC_DIMINDEX`
pub fn pdimindex_suc_dimindex() -> @kernel.Thm {
  pdimindex_suc_dimindex_c.get()
}

///|
/// PDIMINDEX_LT_DIMINDEX
fn step_11() -> Unit raise {
  let t171 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pdimindex_suc_dimindex(), @arith.lt_add()])), @int.arith_tac)
  pdimindex_lt_dimindex_c.set(@tactics.prove(@term_syntax.parse_term("pdimindex((s : (A) -> Bool)) < dimindex(s)"), t171))
}

///|
let pdimindex_lt_dimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_LT_DIMINDEX")

///|
/// `PDIMINDEX_LT_DIMINDEX`
pub fn pdimindex_lt_dimindex() -> @kernel.Thm {
  pdimindex_lt_dimindex_c.get()
}

///|
/// PDIMINDEX_LE_IMP_DIMINDEX_LE
fn step_12() -> Unit raise {
  let t172 = @meson.meson_tac(@list.List([pdimindex_lt_dimindex(), @arith.let_trans(), @arith.lt_imp_le()]))
  pdimindex_le_imp_dimindex_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, x <= pdimindex((s : (_) -> Bool)) → x <= dimindex(s)"), t172))
}

///|
let pdimindex_le_imp_dimindex_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_LE_IMP_DIMINDEX_LE")

///|
/// `PDIMINDEX_LE_IMP_DIMINDEX_LE`
pub fn pdimindex_le_imp_dimindex_le() -> @kernel.Thm {
  pdimindex_le_imp_dimindex_le_c.get()
}

///|
/// PDIMINDEX_UNIQUE
fn step_13() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([@cart.dimindex(), @sets.has_size(), pdimindex(), @arith.add_sub()]))
  pdimindex_unique_c.set(@tactics.prove(@term_syntax.parse_term("(HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), (n : Num) + 1) → (pdimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == n"), t173))
}

///|
let pdimindex_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_UNIQUE")

///|
/// `PDIMINDEX_UNIQUE`
pub fn pdimindex_unique() -> @kernel.Thm {
  pdimindex_unique_c.get()
}

///|
/// define_pseudo_finite_type
fn step_14() -> Unit raise {
  let t174 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t175 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t174), @int.arith_tac)
  let lemma_pre = @tactics.prove(@term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, (n : Num) + 1))"), t175)
  let t182 = @meson.asm_meson_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t180 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t181 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_univ()])), t180])
  let t179 = @tactics.subgoal_then(@term_syntax.parse_term("UNIV == IMAGE((mk : (Num) -> A), op_dot_dot(1, (n : Num) + 1))"), fn(x176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s177 = @tactics.subst1_tac(x176)
    fn(x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s177(x178)
    }
  })
  let t183 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t179), t181), t182)
  let lemma_post = @tactics.prove(@term_syntax.parse_term("(∀ a : A, (mk : (Num) -> A)((dest : (A) -> Num)(a)) == a) && (∀ r : Num, (IN : (Num, (Num) -> Bool) -> Bool)(r, op_dot_dot(1, (n : Num) + 1)) == (dest(mk(r)) == r)) → (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), n + 1)"), t183)
  let post_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(lemma_post)
  let n_tm = @term_syntax.parse_term("(n : Num)")
  define_pseudo_finite_type_c.set(fn(x184 : Int64) -> @kernel.Thm raise {
    let n = x184
    // upstream defines 0 .. 4; a larger n keeps upstream's name
    let ns = if 0L <= n && n <= 4L {
      ["Zero", "One", "Two", "Three", "Four"][n.to_int()]
    } else {
      "'" + Int64::to_string(n)
    }
    let ns_p = ("auto_define_finite_type_" + ns)
    let th = @kernel.inst_rule(@list.List([(@nums.mk_small_numeral(n), n_tm)]), lemma_pre)
    let t185 = ("dest_" + ns_p)
    post_rule(@class.new_type_definition(ns, (("mk_" + ns_p), t185), th))
  })
}

///|
let define_pseudo_finite_type_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("define_pseudo_finite_type")

///|
/// `define_pseudo_finite_type`
pub fn define_pseudo_finite_type(x : Int64) -> @kernel.Thm raise {
  (define_pseudo_finite_type_c.get())(x)
}

///|
/// HAS_PSEUDO_SIZE_0
fn step_15() -> Unit raise {
  has_pseudo_size_0_c.set(define_pseudo_finite_type(0L))
}

///|
let has_pseudo_size_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PSEUDO_SIZE_0")

///|
/// `HAS_PSEUDO_SIZE_0`
pub fn has_pseudo_size_0() -> @kernel.Thm {
  has_pseudo_size_0_c.get()
}

///|
/// HAS_PSEUDO_SIZE_1
fn step_16() -> Unit raise {
  has_pseudo_size_1_c.set(define_pseudo_finite_type(1L))
}

///|
let has_pseudo_size_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PSEUDO_SIZE_1")

///|
/// `HAS_PSEUDO_SIZE_1`
pub fn has_pseudo_size_1() -> @kernel.Thm {
  has_pseudo_size_1_c.get()
}

///|
/// HAS_PSEUDO_SIZE_2
fn step_17() -> Unit raise {
  has_pseudo_size_2_c.set(define_pseudo_finite_type(2L))
}

///|
let has_pseudo_size_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PSEUDO_SIZE_2")

///|
/// `HAS_PSEUDO_SIZE_2`
pub fn has_pseudo_size_2() -> @kernel.Thm {
  has_pseudo_size_2_c.get()
}

///|
/// HAS_PSEUDO_SIZE_3
fn step_18() -> Unit raise {
  has_pseudo_size_3_c.set(define_pseudo_finite_type(3L))
}

///|
let has_pseudo_size_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PSEUDO_SIZE_3")

///|
/// `HAS_PSEUDO_SIZE_3`
pub fn has_pseudo_size_3() -> @kernel.Thm {
  has_pseudo_size_3_c.get()
}

///|
/// HAS_PSEUDO_SIZE_4
fn step_19() -> Unit raise {
  has_pseudo_size_4_c.set(define_pseudo_finite_type(4L))
}

///|
let has_pseudo_size_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PSEUDO_SIZE_4")

///|
/// `HAS_PSEUDO_SIZE_4`
pub fn has_pseudo_size_4() -> @kernel.Thm {
  has_pseudo_size_4_c.get()
}

///|
/// PDIMINDEX_0
fn step_20() -> Unit raise {
  pdimindex_0_c.set(@drule.match_mp(pdimindex_unique())(has_pseudo_size_0()))
}

///|
let pdimindex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_0")

///|
/// `PDIMINDEX_0`
pub fn pdimindex_0() -> @kernel.Thm {
  pdimindex_0_c.get()
}

///|
/// PDIMINDEX_1
fn step_21() -> Unit raise {
  pdimindex_1_c.set(@drule.match_mp(pdimindex_unique())(has_pseudo_size_1()))
}

///|
let pdimindex_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_1")

///|
/// `PDIMINDEX_1`
pub fn pdimindex_1() -> @kernel.Thm {
  pdimindex_1_c.get()
}

///|
/// PDIMINDEX_2
fn step_22() -> Unit raise {
  pdimindex_2_c.set(@drule.match_mp(pdimindex_unique())(has_pseudo_size_2()))
}

///|
let pdimindex_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_2")

///|
/// `PDIMINDEX_2`
pub fn pdimindex_2() -> @kernel.Thm {
  pdimindex_2_c.get()
}

///|
/// PDIMINDEX_3
fn step_23() -> Unit raise {
  pdimindex_3_c.set(@drule.match_mp(pdimindex_unique())(has_pseudo_size_3()))
}

///|
let pdimindex_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_3")

///|
/// `PDIMINDEX_3`
pub fn pdimindex_3() -> @kernel.Thm {
  pdimindex_3_c.get()
}

///|
/// PDIMINDEX_4
fn step_24() -> Unit raise {
  pdimindex_4_c.set(@drule.match_mp(pdimindex_unique())(has_pseudo_size_4()))
}

///|
let pdimindex_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PDIMINDEX_4")

///|
/// `PDIMINDEX_4`
pub fn pdimindex_4() -> @kernel.Thm {
  pdimindex_4_c.get()
}

///|
/// trip_fin_sum_tybij
fn step_25() -> Unit raise {
  let t186 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t187 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t186), @int.arith_tac)
  let th = @tactics.prove(@term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, if 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) { (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) } else { 1 }))"), t187)
  trip_fin_sum_tybij_c.set(@class.new_type_definition("trip_fin_sum", ("mk_trip_fin_sum", "dest_trip_fin_sum"), th))
}

///|
let trip_fin_sum_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trip_fin_sum_tybij")

///|
/// `trip_fin_sum_tybij`
pub fn trip_fin_sum_tybij() -> @kernel.Thm {
  trip_fin_sum_tybij_c.get()
}

///|
/// TRIPLE_FINITE_SUM_IMAGE
fn step_26() -> Unit raise {
  let t188 = @meson.meson_tac(@list.List([trip_fin_sum_tybij()]))
  let t189 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_image()])), t188)
  triple_finite_sum_image_c.set(@tactics.prove(@term_syntax.parse_term("(UNIV : (Trip_fin_sum[P, Q, R]) -> Bool) == (IMAGE : ((Num) -> Trip_fin_sum[P, Q, R], (Num) -> Bool, Trip_fin_sum[P, Q, R]) -> Bool)((mk_trip_fin_sum : (Num) -> Trip_fin_sum[P, Q, R]), op_dot_dot(1, if 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) { (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) } else { 1 }))"), t189))
}

///|
let triple_finite_sum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIPLE_FINITE_SUM_IMAGE")

///|
/// `TRIPLE_FINITE_SUM_IMAGE`
pub fn triple_finite_sum_image() -> @kernel.Thm {
  triple_finite_sum_image_c.get()
}

///|
/// DIMINDEX_HAS_SIZE_TRIPLE_FINITE_SUM
fn step_27() -> Unit raise {
  let t192 = @meson.meson_tac(@list.List([trip_fin_sum_tybij()]))
  let t191 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t190 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t193 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([triple_finite_sum_image()])), t190), t191), t192)
  dimindex_has_size_triple_finite_sum_c.set(@tactics.prove(@term_syntax.parse_term("(HAS_SIZE : ((Trip_fin_sum[P, Q, R]) -> Bool, Num) -> Bool)((UNIV : (Trip_fin_sum[P, Q, R]) -> Bool), if 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) { (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) } else { 1 })"), t193))
}

///|
let dimindex_has_size_triple_finite_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_HAS_SIZE_TRIPLE_FINITE_SUM")

///|
/// `DIMINDEX_HAS_SIZE_TRIPLE_FINITE_SUM`
pub fn dimindex_has_size_triple_finite_sum() -> @kernel.Thm {
  dimindex_has_size_triple_finite_sum_c.get()
}

///|
/// DIMINDEX_TRIPLE_FINITE_SUM
fn step_28() -> Unit raise {
  let t197 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@sets.has_size()]))(dimindex_has_size_triple_finite_sum())]))
  let t198 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x194 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s195 = @equal.land_conv(x194)
    fn(x196 : @kernel.Term) -> @kernel.Thm raise {
      s195(x196)
    }
  }, @list.List([@cart.dimindex()])), t197), @int.arith_tac)
  dimindex_triple_finite_sum_c.set(@tactics.prove(@term_syntax.parse_term("(dimindex : ((Trip_fin_sum[P, Q, R]) -> Bool) -> Num)((UNIV : (Trip_fin_sum[P, Q, R]) -> Bool)) == (if 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) { (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) } else { 1 })"), t198))
}

///|
let dimindex_triple_finite_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_TRIPLE_FINITE_SUM")

///|
/// `DIMINDEX_TRIPLE_FINITE_SUM`
pub fn dimindex_triple_finite_sum() -> @kernel.Thm {
  dimindex_triple_finite_sum_c.get()
}

///|
/// geomalg_tybij_th
fn step_29() -> Unit raise {
  let t199 = @meson.meson_tac(@list.List([@sets.empty_subset()]))
  geomalg_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"), t199))
}

///|
let geomalg_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("geomalg_tybij_th")

///|
/// `geomalg_tybij_th`
pub fn geomalg_tybij_th() -> @kernel.Thm {
  geomalg_tybij_th_c.get()
}

///|
/// geomalg_tybij
fn step_30() -> Unit raise {
  geomalg_tybij_c.set(@class.new_type_definition("geomalg", ("mk_geomalg", "dest_geomalg"), geomalg_tybij_th()))
}

///|
let geomalg_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("geomalg_tybij")

///|
/// `geomalg_tybij`
pub fn geomalg_tybij() -> @kernel.Thm {
  geomalg_tybij_c.get()
}

///|
/// GEOMALG_IMAGE
fn step_31() -> Unit raise {
  let t200 = @meson.meson_tac(@list.List([geomalg_tybij()]))
  let t201 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_image(), @sets.in_elim_thm()])), t200)
  geomalg_image_c.set(@tactics.prove(@term_syntax.parse_term("(UNIV : (Geomalg[P, Q, R]) -> Bool) == (IMAGE : (((Num) -> Bool) -> Geomalg[P, Q, R], ((Num) -> Bool) -> Bool, Geomalg[P, Q, R]) -> Bool)((mk_geomalg : ((Num) -> Bool) -> Geomalg[P, Q, R]), {(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))})"), t201))
}

///|
let geomalg_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_IMAGE")

///|
/// `GEOMALG_IMAGE`
pub fn geomalg_image() -> @kernel.Thm {
  geomalg_image_c.get()
}

///|
/// HAS_SIZE_GEOMALG
fn step_32() -> Unit raise {
  let t204 = @meson.meson_tac(@list.List([geomalg_tybij()]))
  let t203 = @simp.simp_tac(@list.List([@sets.has_size_powerset(), @iterate.has_size_numseg_1(), @sets.in_elim_thm()]))
  let t202 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t205 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([geomalg_image()])), t202), t203), t204)
  has_size_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("(HAS_SIZE : ((Geomalg[P, Q, R]) -> Bool, Num) -> Bool)((UNIV : (Geomalg[P, Q, R]) -> Bool), EXP(2, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"), t205))
}

///|
let has_size_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_GEOMALG")

///|
/// `HAS_SIZE_GEOMALG`
pub fn has_size_geomalg() -> @kernel.Thm {
  has_size_geomalg_c.get()
}

///|
/// FINITE_GEOMALG
fn step_33() -> Unit raise {
  let t206 = @meson.meson_tac(@list.List([@sets.has_size(), has_size_geomalg()]))
  finite_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("(FINITE : ((Geomalg[P, Q, R]) -> Bool) -> Bool)((UNIV : (Geomalg[P, Q, R]) -> Bool))"), t206))
}

///|
let finite_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_GEOMALG")

///|
/// `FINITE_GEOMALG`
pub fn finite_geomalg() -> @kernel.Thm {
  finite_geomalg_c.get()
}

///|
/// DIMINDEX_GEOMALG
fn step_34() -> Unit raise {
  let t207 = @meson.meson_tac(@list.List([@cart.dimindex_unique(), has_size_geomalg()]))
  dimindex_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("(dimindex : ((Geomalg[P, Q, R]) -> Bool) -> Num)((UNIV : (Geomalg[P, Q, R]) -> Bool)) == EXP(2, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))"), t207))
}

///|
let dimindex_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_GEOMALG")

///|
/// `DIMINDEX_GEOMALG`
pub fn dimindex_geomalg() -> @kernel.Thm {
  dimindex_geomalg_c.get()
}

///|
/// DEST_MK_GEOMALG
fn step_35() -> Unit raise {
  let t210 = @simp.asm_rewrite_tac(@list.List([]))
  let t209 = @simp.gen_rewrite_tac(fn(x208 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x208
  }, @list.List([@equal.gsym(geomalg_tybij())]))
  let t211 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t209), t210)
  dest_mk_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (dest_geomalg : (Geomalg[P, Q, R], Num) -> Bool)((mk_geomalg : ((Num) -> Bool) -> Geomalg[P, Q, R])(s)) == s"), t211))
}

///|
let dest_mk_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_MK_GEOMALG")

///|
/// `DEST_MK_GEOMALG`
pub fn dest_mk_geomalg() -> @kernel.Thm {
  dest_mk_geomalg_c.get()
}

///|
/// FORALL_GEOMALG
fn step_36() -> Unit raise {
  let t215 = @meson.asm_meson_tac(@list.List([]))
  let t214 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_image(), @pair.exists_pair_thm(), @sets.in_elim_thm()]))
  let t212 = @simp.rewrite_rule(@list.List([@sets.extension()]))(geomalg_image())
  let t213 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(m : Geomalg[P, Q, R])"), t212))
  let t216 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])), @tactics.disch_tac), @tactics.gen_tac), t213), t214), t215)
  forall_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (P : (Geomalg[P, Q, R]) -> Bool)((mk_geomalg : ((Num) -> Bool) -> Geomalg[P, Q, R])(s))) == (∀ m : Geomalg[P, Q, R], P(m))"), t216))
}

///|
let forall_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_GEOMALG")

///|
/// `FORALL_GEOMALG`
pub fn forall_geomalg() -> @kernel.Thm {
  forall_geomalg_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:266
fn step_37() -> Unit raise {
  @preterm.make_overloadable("$$", @term_syntax.parse_type("(Cart[Real, N], (Num) -> Bool) -> Real"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:267
fn step_38() -> Unit raise {
  @preterm.overload_interface("$$", @term_syntax.parse_term("(setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)"))
}

///|
/// setindex
fn step_39() -> Unit raise {
  setindex_c.set(@pair.new_definition(@term_syntax.parse_term("(setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((x : Cart[Real, Geomalg[P, Q, R]]), (s : (Num) -> Bool)) == op_dollar(x, setcode(s))")))
}

///|
let setindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setindex")

///|
/// `setindex`
pub fn setindex() -> @kernel.Thm {
  setindex_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:272
fn step_40() -> Unit raise {
  @preterm.make_overloadable("lambdas", @term_syntax.parse_type("(((Num) -> Bool) -> Real) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:273
fn step_41() -> Unit raise {
  @preterm.overload_interface("lambdas", @term_syntax.parse_term("(lambdaset : (((Num) -> Bool) -> Real) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// lambdaset
fn step_42() -> Unit raise {
  lambdaset_c.set(@pair.new_definition(@term_syntax.parse_term("(lambdaset : (((Num) -> Bool) -> Real) -> Cart[Real, Geomalg[P, Q, R]])((g : ((Num) -> Bool) -> Real)) == lambda((i : Num) => g(codeset(i)))")))
}

///|
let lambdaset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lambdaset")

///|
/// `lambdaset`
pub fn lambdaset() -> @kernel.Thm {
  lambdaset_c.get()
}

///|
/// GEOMALG_EQ
fn step_43() -> Unit raise {
  let t217 = @simp.simp_tac(@list.List([@cart.cart_eq(), setindex(), @clifford.forall_setcode(), @equal.gsym(@iterate.in_numseg()), dimindex_geomalg()]))
  geomalg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], (x == y) == (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s) == (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(y, s))"), t217))
}

///|
let geomalg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_EQ")

///|
/// `GEOMALG_EQ`
pub fn geomalg_eq() -> @kernel.Thm {
  geomalg_eq_c.get()
}

///|
/// GEOMALG_BETA
fn step_44() -> Unit raise {
  let t218 = @meson.meson_tac(@list.List([@clifford.codeset_setcode_bijections()]))
  let t219 = @tactics.then_tac(@simp.simp_tac(@list.List([setindex(), lambdaset(), @cart.lambda_beta(), @clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg())])), t218)
  geomalg_beta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((lambdaset : (((Num) -> Bool) -> Real) -> Cart[Real, Geomalg[P, Q, R]])((g : ((Num) -> Bool) -> Real)), s) == g(s)"), t219))
}

///|
let geomalg_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_BETA")

///|
/// `GEOMALG_BETA`
pub fn geomalg_beta() -> @kernel.Thm {
  geomalg_beta_c.get()
}

///|
/// GEOMALG_UNIQUE
fn step_45() -> Unit raise {
  let t220 = @meson.meson_tac(@list.List([]))
  let t221 = @tactics.then_tac(@simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta()])), t220)
  geomalg_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Cart[Real, Geomalg[P, Q, R]], ∀ g : ((Num) -> Bool) -> Real, (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(m, s) == g(s)) → (lambdaset : (((Num) -> Bool) -> Real) -> Cart[Real, Geomalg[P, Q, R]])(g) == m"), t221))
}

///|
let geomalg_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_UNIQUE")

///|
/// `GEOMALG_UNIQUE`
pub fn geomalg_unique() -> @kernel.Thm {
  geomalg_unique_c.get()
}

///|
/// GEOMALG_ETA
fn step_46() -> Unit raise {
  let t222 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta()]))
  geomalg_eta_c.set(@tactics.prove(@term_syntax.parse_term("lambdaset((s : (Num) -> Bool) => setindex((m : Cart[Real, Geomalg[_, _, _]]), s)) == m"), t222))
}

///|
let geomalg_eta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_ETA")

///|
/// `GEOMALG_ETA`
pub fn geomalg_eta() -> @kernel.Thm {
  geomalg_eta_c.get()
}

///|
/// GEOMALG_ADD_COMPONENT
fn step_47() -> Unit raise {
  let t223 = @simp.simp_tac(@list.List([setindex(), @clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg()), @vectors.vector_add_component()]))
  geomalg_add_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x + y, s) == (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s) + (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(y, s)"), t223))
}

///|
let geomalg_add_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_ADD_COMPONENT")

///|
/// `GEOMALG_ADD_COMPONENT`
pub fn geomalg_add_component() -> @kernel.Thm {
  geomalg_add_component_c.get()
}

///|
/// GEOMALG_MUL_COMPONENT
fn step_48() -> Unit raise {
  let t224 = @simp.simp_tac(@list.List([setindex(), @clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg()), @vectors.vector_mul_component()]))
  geomalg_mul_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(c, x), s) == c * (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s)"), t224))
}

///|
let geomalg_mul_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_MUL_COMPONENT")

///|
/// `GEOMALG_MUL_COMPONENT`
pub fn geomalg_mul_component() -> @kernel.Thm {
  geomalg_mul_component_c.get()
}

///|
/// GEOMALG_VEC_COMPONENT
fn step_49() -> Unit raise {
  let t225 = @simp.simp_tac(@list.List([setindex(), @clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg()), @vectors.vec_component()]))
  geomalg_vec_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(k), s) == real_of_num(k)"), t225))
}

///|
let geomalg_vec_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_VEC_COMPONENT")

///|
/// `GEOMALG_VEC_COMPONENT`
pub fn geomalg_vec_component() -> @kernel.Thm {
  geomalg_vec_component_c.get()
}

///|
/// GEOMALG_VSUM_COMPONENT
fn step_50() -> Unit raise {
  let t226 = @simp.simp_tac(@list.List([@vectors.vsum(), setindex(), @cart.lambda_beta(), @clifford.setcode_bounds(), @equal.gsym(@iterate.in_numseg()), dimindex_geomalg()]))
  geomalg_vsum_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, Geomalg[P, Q, R]], ∀ t : (A) -> Bool, ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((vsum : ((A) -> Bool, (A) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(t, f), s) == (sum : ((A) -> Bool, (A) -> Real) -> Real)(t, (x : A) => (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(f(x), s))"), t226))
}

///|
let geomalg_vsum_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_VSUM_COMPONENT")

///|
/// `GEOMALG_VSUM_COMPONENT`
pub fn geomalg_vsum_component() -> @kernel.Thm {
  geomalg_vsum_component_c.get()
}

///|
/// GEOMALG_VSUM
fn step_51() -> Unit raise {
  let t227 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta(), geomalg_vsum_component()]))
  geomalg_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (_) -> Bool, ∀ f : (_) -> Cart[Real, Geomalg[_, _, _]], vsum(t, f) == lambdaset((s : (Num) -> Bool) => sum(t, (x : _) => setindex(f(x), s)))"), t227))
}

///|
let geomalg_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_VSUM")

///|
/// `GEOMALG_VSUM`
pub fn geomalg_vsum() -> @kernel.Thm {
  geomalg_vsum_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:342
fn step_52() -> Unit raise {
  @preterm.make_overloadable("mbasis", @term_syntax.parse_type("((Num) -> Bool) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:343
fn step_53() -> Unit raise {
  @preterm.overload_interface("mbasis", @term_syntax.parse_term("(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// mvbasis
fn step_54() -> Unit raise {
  mvbasis_c.set(@pair.new_definition(@term_syntax.parse_term("(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])((i : (Num) -> Bool)) == lambdas((s : (Num) -> Bool) => if i == s { real_of_num(1) } else { real_of_num(0) })")))
}

///|
let mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mvbasis")

///|
/// `mvbasis`
pub fn mvbasis() -> @kernel.Thm {
  mvbasis_c.get()
}

///|
/// MVBASIS_COMPONENT
fn step_55() -> Unit raise {
  let t228 = @meson.meson_tac(@list.List([]))
  let t229 = @tactics.then_tac(@simp.simp_tac(@list.List([mvbasis(), @sets.in_elim_thm(), geomalg_beta()])), t228)
  mvbasis_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t), s) == (if s == t { real_of_num(1) } else { real_of_num(0) })"), t229))
}

///|
let mvbasis_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_COMPONENT")

///|
/// `MVBASIS_COMPONENT`
pub fn mvbasis_component() -> @kernel.Thm {
  mvbasis_component_c.get()
}

///|
/// MVBASIS_EQ_0
fn step_56() -> Unit raise {
  let t230 = @meson.meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(1) == real_of_num(0))"))]))
  let t231 = @tactics.then_tac(@simp.simp_tac(@list.List([geomalg_eq(), mvbasis_component(), geomalg_vec_component()])), t230)
  mvbasis_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) == (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0)) == !SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"), t231))
}

///|
let mvbasis_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_EQ_0")

///|
/// `MVBASIS_EQ_0`
pub fn mvbasis_eq_0() -> @kernel.Thm {
  mvbasis_eq_0_c.get()
}

///|
/// MVBASIS_NONZERO
fn step_57() -> Unit raise {
  let t232 = @simp.rewrite_tac(@list.List([mvbasis_eq_0()]))
  mvbasis_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → !((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) == (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0))"), t232))
}

///|
let mvbasis_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_NONZERO")

///|
/// `MVBASIS_NONZERO`
pub fn mvbasis_nonzero() -> @kernel.Thm {
  mvbasis_nonzero_c.get()
}

///|
/// MVBASIS_EXPANSION
fn step_58() -> Unit raise {
  let t242 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (if (p : Bool) { real_of_num(1) } else { real_of_num(0) }) == (if p { x } else { real_of_num(0) })")), @iterate.sum_delta(), @sets.in_elim_thm()]))
  let t241 = @simp.gen_rewrite_tac(fn(x240 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x234 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s235 = @equal.land_conv(x234)
      fn(x236 : @kernel.Term) -> @kernel.Thm raise {
        s235(x236)
      }
    })((fn(x237 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s238 = @equal.once_depth_conv(x237)
      fn(x239 : @kernel.Term) -> @kernel.Thm raise {
        s238(x239)
      }
    })(x240))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t233 = @tactics.repeat_tac(@tactics.strip_tac)
  let t243 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([geomalg_eq(), geomalg_vsum_component(), geomalg_mul_component(), mvbasis_component()])), t233), t241), t242)
  mvbasis_expansion_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (s : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s), (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s))) == x"), t243))
}

///|
let mvbasis_expansion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_EXPANSION")

///|
/// `MVBASIS_EXPANSION`
pub fn mvbasis_expansion() -> @kernel.Thm {
  mvbasis_expansion_c.get()
}

///|
/// SPAN_MVBASIS
fn step_59() -> Unit raise {
  let t255 = @meson.asm_meson_tac(@list.List([]))
  let t254 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t253 = @tactics.match_mp_tac(@vectors.span_superset())
  let t252 = @tactics.match_mp_tac(@vectors.span_mul())
  let t251 = @tactics.repeat_tac(@tactics.strip_tac)
  let t250 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_powerset(), @sets.in_elim_thm()]))
  let t249 = @tactics.match_mp_tac(@vectors.span_vsum())
  let t248 = @simp.gen_rewrite_tac(fn(x245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s246 = @equal.land_conv(x245)
    fn(x247 : @kernel.Term) -> @kernel.Thm raise {
      s246(x247)
    }
  }, @list.List([@equal.gsym(mvbasis_expansion())]))
  let t244 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Geomalg[P, Q, R]])"))
  let t256 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ()])), t244), t248), t249), t250), t251), t252), t253), t254), t255)
  span_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("(span : ((Cart[Real, Geomalg[P, Q, R]]) -> Bool, Cart[Real, Geomalg[P, Q, R]]) -> Bool)({(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}) == (UNIV : (Cart[Real, Geomalg[P, Q, R]]) -> Bool)"), t256))
}

///|
let span_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SPAN_MVBASIS")

///|
/// `SPAN_MVBASIS`
pub fn span_mvbasis() -> @kernel.Thm {
  span_mvbasis_c.get()
}

///|
/// MVBASIS_BASIS
fn step_60() -> Unit raise {
  let t259 = @meson.asm_meson_tac(@list.List([@clifford.codeset_setcode_bijections()]))
  let t257 = @equal.gsym(@clifford.forall_setcode())
  let t258 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.in_numseg()), dimindex_geomalg(), t257]))
  let t260 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([mvbasis(), @vectors.basis(), lambdaset(), @cart.cart_eq(), @cart.lambda_beta()])), t258), t259)
  mvbasis_basis_c.set(@tactics.prove(@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) == (basis : (Num) -> Cart[Real, Geomalg[P, Q, R]])(setcode(s))"), t260))
}

///|
let mvbasis_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_BASIS")

///|
/// `MVBASIS_BASIS`
pub fn mvbasis_basis() -> @kernel.Thm {
  mvbasis_basis_c.get()
}

///|
/// MVBASIS_INJ
fn step_61() -> Unit raise {
  let t270 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t269 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t265 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t268 = @tactics.first_x_assum(fn(x267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s263 = @tactics.mp_tac(x262)
      fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s263(x264)
      }
    })(((x266 : @kernel.Thm) => @bool.spec(t265, x266))(x267))
  })
  let t261 = @tactics.repeat_tac(@tactics.strip_tac)
  let t271 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([mvbasis(), geomalg_eq(), geomalg_beta()])), t261), t268), t269), t270)
  mvbasis_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) == (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) → s == t"), t271))
}

///|
let mvbasis_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_INJ")

///|
/// `MVBASIS_INJ`
pub fn mvbasis_inj() -> @kernel.Thm {
  mvbasis_inj_c.get()
}

///|
/// MVBASIS_INJ_SING
fn step_62() -> Unit raise {
  let t282 = @meson.asm_meson_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t281 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.extension(), @sets.in_sing()]))
  let t280 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t276 = @term_syntax.parse_term("{(i : Num)}")
  let t279 = @tactics.first_x_assum(fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s274 = @tactics.mp_tac(x273)
      fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s274(x275)
      }
    })(((x277 : @kernel.Thm) => @bool.spec(t276, x277))(x278))
  })
  let t272 = @tactics.repeat_tac(@tactics.strip_tac)
  let t283 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([mvbasis(), geomalg_eq(), geomalg_beta()])), t272), t279), t280), t281), t282)
  mvbasis_inj_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) == (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) → i == j"), t283))
}

///|
let mvbasis_inj_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_INJ_SING")

///|
/// `MVBASIS_INJ_SING`
pub fn mvbasis_inj_sing() -> @kernel.Thm {
  mvbasis_inj_sing_c.get()
}

///|
/// DOT_MVBASIS
fn step_63() -> Unit raise {
  let t286 = @simp.asm_simp_tac(@list.List([@clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg()), @vectors.dot_basis()]))
  let t285 = @simp.rewrite_tac(@list.List([setindex()]))
  let t284 = @simp.simp_tac(@list.List([mvbasis_basis()]))
  let t287 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t284), t285), t286)
  dot_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (dot : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Real)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), x) == (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s) && (dot : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Real)(x, (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s)"), t287))
}

///|
let dot_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_MVBASIS")

///|
/// `DOT_MVBASIS`
pub fn dot_mvbasis() -> @kernel.Thm {
  dot_mvbasis_c.get()
}

///|
/// DOT_MVBASIS_MVBASIS
fn step_64() -> Unit raise {
  let t288 = @simp.simp_tac(@list.List([dot_mvbasis(), mvbasis_component()]))
  dot_mvbasis_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (dot : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Real)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if s == t { real_of_num(1) } else { real_of_num(0) })"), t288))
}

///|
let dot_mvbasis_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_MVBASIS_MVBASIS")

///|
/// `DOT_MVBASIS_MVBASIS`
pub fn dot_mvbasis_mvbasis() -> @kernel.Thm {
  dot_mvbasis_mvbasis_c.get()
}

///|
/// DOT_MVBASIS_MVBASIS_UNEQUAL
fn step_65() -> Unit raise {
  let t294 = @meson.asm_meson_tac(@list.List([@iterate.sum_0(), @calc_int.real_mul_rzero(), @calc_int.real_mul_lzero(), @class.cond_id()]))
  let t293 = @tactics.repeat_tac(@tactics.strip_tac)
  let t292 = @simp.rewrite_tac(@list.List([]))
  let t291 = @tactics.match_mp_tac(@iterate.sum_eq_0())
  let t290 = @tactics.repeat_tac(@tactics.strip_tac)
  let t289 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t295 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([mvbasis(), @vectors.dot(), lambdaset(), @cart.lambda_beta()])), t289), t290), t291), t292), t293), t294)
  dot_mvbasis_mvbasis_unequal_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, !(s == t) → (dot : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Real)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(s), (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(t)) == real_of_num(0)"), t295))
}

///|
let dot_mvbasis_mvbasis_unequal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_MVBASIS_MVBASIS_UNEQUAL")

///|
/// `DOT_MVBASIS_MVBASIS_UNEQUAL`
pub fn dot_mvbasis_mvbasis_unequal() -> @kernel.Thm {
  dot_mvbasis_mvbasis_unequal_c.get()
}

///|
/// IN_SPAN_IMAGE_MVBASIS
fn step_66() -> Unit raise {
  let t330 = @meson.asm_meson_tac(@list.List([@realarith.real_mul_rid()]))
  let t329 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @calc_int.real_mul_rzero(), @sets.in_inter(), @sets.in_elim_thm(), dot_mvbasis()]))
  let t328 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(if (x : _) == (y : _) { (p : _) } else { (q : _) }) == (if y == x { p } else { q })"))]))
  let t327 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t326 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_vsum_component(), geomalg_mul_component(), mvbasis_component()]))
  let t325 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t324 = @tactics.disch_then(fn(x321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s322 = @tactics.subst1_tac(x321)
    fn(x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s322(x323)
    }
  })
  let t319 = @meson.meson_tac(@list.List([mvbasis_inj()]))
  let t318 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t320 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.finite_image(), @sets.finite_inter(), @iterate.finite_numseg(), @sets.finite_powerset()])), t318), t319), @tactics.all_tac])
  let t312 = @drule.part_match(fn(x311 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x311))
  }, @vectors.vsum_image())
  let t307 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, Geomalg[P, Q, R]]) => dot((x : Cart[Real, Geomalg[P, Q, R]]), v)"))
  let t306 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t305 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t304 = @simp.simp_tac(@list.List([@sets.finite_image(), @sets.finite_inter(), @iterate.finite_numseg(), @sets.finite_powerset()]))
  let t303 = @tactics.exists_tac(@term_syntax.parse_term("(IMAGE : (((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]], ((Num) -> Bool) -> Bool, Cart[Real, Geomalg[P, Q, R]]) -> Bool)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]), INTER({(t : (Num) -> Bool) | SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (s : ((Num) -> Bool) -> Bool)))"))
  let t302 = @simp.rewrite_tac(@list.List([@vectors.span_explicit(), @sets.in_elim_thm()]))
  let t300 = @meson.meson_tac(@list.List([]))
  let t299 = @simp.simp_tac(@list.List([@sets.forall_in_image(), mvbasis_component()]))
  let t298 = @simp.simp_tac(@list.List([@vectors.subspace(), @sets.in_elim_thm(), geomalg_vec_component(), geomalg_add_component(), geomalg_mul_component(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t297 = @tactics.match_mp_tac(@vectors.span_induct())
  let t296 = @term_syntax.parse_term("(x : Cart[Real, Geomalg[P, Q, R]])")
  let t301 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(x : Cart[Real, Geomalg[P, Q, R]])"), t296), t297), t298), t299), t300), @tactics.all_tac])
  let t331 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t301), @tactics.disch_tac), t302), t303), t304), t305), @tactics.conj_tac), t306), t307), fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x314 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x313 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s309 = @tactics.mp_tac(x308)
            fn(x310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s309(x310)
            }
          })(t312(x313))
        })(@equal.lhand(x314))
      })((fn(x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x315.1
      })(x316))
    })(x317)(x317)
  }), @tactics.ants_tac), t320), t324), t325), t326), t327), t328), t329), t330)
  in_span_image_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ s : ((Num) -> Bool) -> Bool, (IN : (Cart[Real, Geomalg[P, Q, R]], (Cart[Real, Geomalg[P, Q, R]]) -> Bool) -> Bool)(x, (span : ((Cart[Real, Geomalg[P, Q, R]]) -> Bool, Cart[Real, Geomalg[P, Q, R]]) -> Bool)((IMAGE : (((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]], ((Num) -> Bool) -> Bool, Cart[Real, Geomalg[P, Q, R]]) -> Bool)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]), s))) == (∀ t : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && !(IN : ((Num) -> Bool, ((Num) -> Bool) -> Bool) -> Bool)(t, s) → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, t) == real_of_num(0))"), t331))
}

///|
let in_span_image_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SPAN_IMAGE_MVBASIS")

///|
/// `IN_SPAN_IMAGE_MVBASIS`
pub fn in_span_image_mvbasis() -> @kernel.Thm {
  in_span_image_mvbasis_c.get()
}

///|
/// INDEPENDENT_STDMVBASIS
fn step_67() -> Unit raise {
  let t337 = @tactics.match_accept_tac(@vectors.independent_stdbasis())
  let t335 = @meson.meson_tac(@list.List([@clifford.codeset_setcode_bijections(), mvbasis_basis()]))
  let t336 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @equal.gsym(@iterate.in_numseg()), dimindex_geomalg()])), t335), @tactics.all_tac])
  let t338 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))} == {(basis : (Num) -> Cart[Real, Geomalg[P, Q, R]])((i : Num)) | 1 <= i && i <= (dimindex : ((Geomalg[P, Q, R]) -> Bool) -> Num)((UNIV : (Geomalg[P, Q, R]) -> Bool))}"), fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s333 = @tactics.subst1_tac(x332)
    fn(x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s333(x334)
    }
  }), t336), t337)
  independent_stdmvbasis_c.set(@tactics.prove(@term_syntax.parse_term("(independent : ((Cart[Real, Geomalg[P, Q, R]]) -> Bool) -> Bool)({(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))})"), t338))
}

///|
let independent_stdmvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEPENDENT_STDMVBASIS")

///|
/// `INDEPENDENT_STDMVBASIS`
pub fn independent_stdmvbasis() -> @kernel.Thm {
  independent_stdmvbasis_c.get()
}

///|
/// INDEPENDENT_STDMVBASIS_SING
fn step_68() -> Unit raise {
  let t349 = @meson.asm_meson_tac(@list.List([@sets.in_sing(), @iterate.in_numseg()]))
  let t348 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num)}"))
  let t347 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(fn(x344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s345 = @tactics.assume_tac(x344)
    fn(x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s345(x346)
    }
  }))
  let t343 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Geomalg[P, Q, R]])"))
  let t342 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()]))
  let t341 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | (P : (_) -> Bool)(x)} == IMAGE(f, {(x : _) | P(x)})"))]))
  let t340 = @simp.rewrite_tac(@list.List([independent_stdmvbasis()]))
  let t339 = @tactics.exists_tac(@term_syntax.parse_term("{(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}"))
  let t350 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.independent_mono()), t339), t340), t341), t342), t343), t347), t348), t349)
  independent_stdmvbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("(independent : ((Cart[Real, Geomalg[P, Q, R]]) -> Bool) -> Bool)({(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({(i : Num)}) | 1 <= i && i <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))})"), t350))
}

///|
let independent_stdmvbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEPENDENT_STDMVBASIS_SING")

///|
/// `INDEPENDENT_STDMVBASIS_SING`
pub fn independent_stdmvbasis_sing() -> @kernel.Thm {
  independent_stdmvbasis_sing_c.get()
}

///|
/// NORM_MVBASIS
fn step_69() -> Unit raise {
  let t360 = @simp.asm_simp_tac(@list.List([@clifford.setcode_bounds(), dimindex_geomalg(), @equal.gsym(@iterate.in_numseg()), @vectors.norm_basis()]))
  let t358 = @meson.asm_meson_tac(@list.List([@clifford.codeset_setcode_bijections()]))
  let t356 = @equal.gsym(@iterate.in_numseg())
  let t357 = @simp.simp_tac(@list.List([@equal.gsym(@clifford.forall_setcode()), dimindex_geomalg(), t356]))
  let t355 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @vectors.basis_component()]))
  let t359 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mvbasis(), lambdaset()])), t355), t357), t358), @tactics.all_tac])
  let t354 = @tactics.subgoal_then(@term_syntax.parse_term("(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) == (basis : (Num) -> Cart[Real, Geomalg[P, Q, R]])(setcode(s))"), fn(x351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s352 = @tactics.subst1_tac(x351)
    fn(x353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s352(x353)
    }
  })
  let t361 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t354), t359), t360)
  norm_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (norm : (Cart[Real, Geomalg[P, Q, R]]) -> Real)((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == real_of_num(1)"), t361))
}

///|
let norm_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_MVBASIS")

///|
/// `NORM_MVBASIS`
pub fn norm_mvbasis() -> @kernel.Thm {
  norm_mvbasis_c.get()
}

///|
/// LINEAR_EQ_MVBASIS
fn step_70() -> Unit raise {
  let t369 = @meson.asm_meson_tac(@list.List([]))
  let t368 = @simp.asm_rewrite_tac(@list.List([span_mvbasis(), @sets.subset_refl(), @sets.in_elim_thm()]))
  let t367 = @tactics.exists_tac(@term_syntax.parse_term("{(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}"))
  let t366 = @tactics.match_mp_tac(@vectors.linear_eq())
  let t365 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], IN(x, UNIV) → (f : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N])(x) == (g : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N])(x)"), fn(x362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x362
    let t364 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_univ()]))
    @tactics.then_tac(@tactics.mp_tac(th), t364)
  })
  let t370 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t365), t366), t367), t368), t369)
  linear_eq_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N], ∀ g : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N], ∀ b : _, ∀ s : _, (linear : ((Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N]) -> Bool)(f) && (linear : ((Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, N]) -> Bool)(g) && (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → f((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == g((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s))) → f == g"), t370))
}

///|
let linear_eq_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_EQ_MVBASIS")

///|
/// `LINEAR_EQ_MVBASIS`
pub fn linear_eq_mvbasis() -> @kernel.Thm {
  linear_eq_mvbasis_c.get()
}

///|
/// BILINEAR_EQ_MVBASIS
fn step_71() -> Unit raise {
  let t379 = @meson.asm_meson_tac(@list.List([]))
  let t378 = @simp.asm_rewrite_tac(@list.List([span_mvbasis(), @sets.subset_refl(), @sets.in_elim_thm()]))
  let t377 = @tactics.exists_tac(@term_syntax.parse_term("{(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P', Q', R']])((t : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (pdimindex : ((P') -> Bool) -> Num)((UNIV : (P') -> Bool)) + ((pdimindex : ((Q') -> Bool) -> Num)((UNIV : (Q') -> Bool)) + (pdimindex : ((R') -> Bool) -> Num)((UNIV : (R') -> Bool)))))}"))
  let t376 = @tactics.exists_tac(@term_syntax.parse_term("{(mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool)) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}"))
  let t375 = @tactics.match_mp_tac(@vectors.bilinear_eq())
  let t374 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P', Q', R']], IN(x, UNIV) && IN(y, UNIV) → (f : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N])(x, y) == (g : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N])(x, y)"), fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x371
    let t373 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_univ()]))
    @tactics.then_tac(@tactics.mp_tac(th), t373)
  })
  let t380 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t374), t375), t376), t377), t378), t379)
  bilinear_eq_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N], ∀ g : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N], ∀ b : _, ∀ s : _, (bilinear : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N]) -> Bool)(f) && (bilinear : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P', Q', R']]) -> Cart[Real, N]) -> Bool)(g) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, op_dot_dot(1, (pdimindex : ((P') -> Bool) -> Num)((UNIV : (P') -> Bool)) + ((pdimindex : ((Q') -> Bool) -> Num)((UNIV : (Q') -> Bool)) + (pdimindex : ((R') -> Bool) -> Num)((UNIV : (R') -> Bool))))) → f((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P', Q', R']])(t)) == g((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P', Q', R']])(t))) → f == g"), t380))
}

///|
let bilinear_eq_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_EQ_MVBASIS")

///|
/// `BILINEAR_EQ_MVBASIS`
pub fn bilinear_eq_mvbasis() -> @kernel.Thm {
  bilinear_eq_mvbasis_c.get()
}

///|
/// MVBASIS_EXTENSION
fn step_72() -> Unit raise {
  let t387 = @meson.asm_meson_tac(@list.List([@sets.empty_subset(), @vectors.vector_mul_lzero()]))
  let t386 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset(), @iterate.finite_numseg(), @sets.in_elim_thm()]))
  let t385 = @tactics.match_mp_tac(@simp.simp_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))(@clifford.linear_property()))
  let t384 = @simp.gen_rewrite_tac(fn(x381 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s382 = @equal.rand_conv(x381)
    fn(x383 : @kernel.Term) -> @kernel.Thm raise {
      s382(x383)
    }
  }, @list.List([@equal.gsym(mvbasis_expansion())]))
  let t388 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t384), t385), t386), t387)
  mvbasis_extension_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, Geomalg[P, Q, R]]) -> Bool, (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → P((mvbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s))) && (∀ c : Real, ∀ x : Cart[Real, Geomalg[P, Q, R]], P(x) → P((op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(c, x))) && (∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], P(x) && P(y) → P(x + y)) → (∀ x : Cart[Real, Geomalg[P, Q, R]], P(x))"), t388))
}

///|
let mvbasis_extension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_EXTENSION")

///|
/// `MVBASIS_EXTENSION`
pub fn mvbasis_extension() -> @kernel.Thm {
  mvbasis_extension_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:552
fn step_73() -> Unit raise {
  @preterm.make_overloadable("multivec", @term_syntax.parse_type("(Cart[Real, M]) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:553
fn step_74() -> Unit raise {
  @preterm.overload_interface("multivec", @term_syntax.parse_term("(multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// multivect
fn step_75() -> Unit raise {
  multivect_c.set(@pair.new_definition(@term_syntax.parse_term("(multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Trip_fin_sum[P, Q, R]])) == (vsum : ((Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (i : Num) => (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i})))")))
}

///|
let multivect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivect")

///|
/// `multivect`
pub fn multivect() -> @kernel.Thm {
  multivect_c.get()
}

///|
/// LINEAR_MULTIVECT
fn step_76() -> Unit raise {
  let t389 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @vectors.vsum_add(), @vectors.vsum_lmul()]))
  let t390 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), multivect(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_add_rdistrib(), @equal.gsym(@vectors.vector_mul_assoc())])), t389)
  linear_multivect_c.set(@tactics.prove(@term_syntax.parse_term("(linear : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]) -> Bool)((multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]))"), t390))
}

///|
let linear_multivect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_MULTIVECT")

///|
/// `LINEAR_MULTIVECT`
pub fn linear_multivect() -> @kernel.Thm {
  linear_multivect_c.get()
}

///|
/// MULTIVECT_ADD
fn step_77() -> Unit raise {
  let t391 = @bool.ispec(@term_syntax.parse_term("(multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), @vectors.linear())
  multivect_add_c.set(@bool.conjunct1(@simp.rewrite_rule(@list.List([linear_multivect()]))(t391)))
}

///|
let multivect_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_ADD")

///|
/// `MULTIVECT_ADD`
pub fn multivect_add() -> @kernel.Thm {
  multivect_add_c.get()
}

///|
/// MULTIVECT_MUL
fn step_78() -> Unit raise {
  let t392 = @bool.ispec(@term_syntax.parse_term("(multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), @vectors.linear())
  multivect_mul_c.set(@bool.conjunct2(@simp.rewrite_rule(@list.List([linear_multivect()]))(t392)))
}

///|
let multivect_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_MUL")

///|
/// `MULTIVECT_MUL`
pub fn multivect_mul() -> @kernel.Thm {
  multivect_mul_c.get()
}

///|
/// MULTIVECT_0
fn step_79() -> Unit raise {
  let t393 = @bool.spec(@term_syntax.parse_term("real_of_num(0)"), multivect_mul())
  multivect_0_c.set(@simp.rewrite_rule(@list.List([@vectors.vector_mul_lzero()]))(t393))
}

///|
let multivect_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_0")

///|
/// `MULTIVECT_0`
pub fn multivect_0() -> @kernel.Thm {
  multivect_0_c.get()
}

///|
/// MULTIVECT_BASIS
fn step_80() -> Unit raise {
  let t406 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lid(), @vectors.vector_mul_lzero()]))
  let t405 = @simp.asm_simp_tac(@list.List([dimindex_triple_finite_sum(), @vectors.basis_component()]))
  let t404 = @class.asm_cases_tac(@term_syntax.parse_term("1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))"))
  let t403 = @tactics.repeat_tac(@tactics.strip_tac)
  let t402 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t401 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t399 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t398 = @simp.rewrite_tac(@list.List([mvbasis_eq_0()]))
  let t400 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vsum_delta()])), @class.cond_cases_tac), t398), t399), @tactics.all_tac])
  let t397 = @tactics.subgoal_then(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({(i : Num)}) == (vsum : ((Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (i' : Num) => if i' == i { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s395 = @tactics.subst1_tac(x394)
    fn(x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s395(x396)
    }
  })
  let t407 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([multivect()]))), t397), t400), t401), t402), t403), t404), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t405), @class.cond_cases_tac), t406)
  multivect_basis_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((basis : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]])(i)) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i})"), t407))
}

///|
let multivect_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_BASIS")

///|
/// `MULTIVECT_BASIS`
pub fn multivect_basis() -> @kernel.Thm {
  multivect_basis_c.get()
}

///|
/// MULTIVECT_EQ_0
fn step_81() -> Unit raise {
  let t457 = @meson.asm_meson_tac(@list.List([@sets.in_image()]))
  let t456 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@iterate.in_numseg())]))
  let t455 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vec_component(), dimindex_triple_finite_sum()]))
  let t454 = @tactics.pop_assum(fn(x451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s452 = @tactics.mp_tac(x451)
    fn(x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s452(x453)
    }
  })
  let t449 = @meson.asm_meson_tac(@list.List([]))
  let t448 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t447 = @tactics.first_assum(fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s444 = @tactics.subst1_tac(x443)
      fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s444(x445)
      }
    })(@equal.sym(x446))
  })
  let t442 = @tactics.disch_then(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s440 = @tactics.subst1_tac(x439)
    fn(x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s440(x441)
    }
  })
  let t438 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), mvbasis_inj_sing(), @trivia.o_def()]))
  let t432 = @drule.part_match(fn(x431 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x431))
  }, @vectors.vsum_image())
  let t450 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x434 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x433 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s429 = @tactics.mp_tac(x428)
            fn(x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s429(x430)
            }
          })(t432(x433))
        })(@equal.lhand(x434))
      })((fn(x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x435.1
      })(x436))
    })(x437)(x437)
  }, t438), t442), t447), t448), t449), @tactics.all_tac])
  let t427 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, Geomalg[P, Q, R]]) => op_dollar((x : Cart[Real, Trip_fin_sum[P, Q, R]]), (g : (Cart[Real, Geomalg[P, Q, R]]) -> Num)(v))"))
  let t426 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) → (b : Bool)) == (a && !b)"))]))
  let t425 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t424 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t421 = @term_syntax.parse_term("(g : (Cart[Real, Geomalg[P, Q, R]]) -> Num)")
  let t423 = @tactics.disch_then((x422 : @kernel.Thm) => @tactics.x_choose_tac(t421, x422))
  let t418 = @simp.gen_rewrite_rule(fn(x417 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x417
  }, @list.List([@sets.injective_on_left_inverse()]))
  let t420 = @tactics.first_assum(fn(x419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s415 = @tactics.mp_tac(x414)
      fn(x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s415(x416)
      }
    })(t418(x419))
  })
  let t413 = @tactics.assume_tac(mvbasis_inj_sing())
  let t412 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_image()]))
  let t411 = @simp.rewrite_tac(@list.List([independent_stdmvbasis_sing(), @equal.gsym(@iterate.in_numseg()), @sets.simple_image()]))
  let t410 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({(i : Num)}) | 1 <= i && i <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))}"), @vectors.independent_explicit()))
  let t409 = @simp.rewrite_tac(@list.List([multivect()]))
  let t408 = @list.List([@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([multivect_0()]))), @tactics.all_tac])
  let t458 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t408), t409), t410), t411), t412), t413), t420), t423), t424), t425), t426), @tactics.strip_tac), t427), @tactics.conj_tac), t450), t454), t455), t456), t457)
  multivect_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) → (x == (vec : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]])(0)) == ((multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x) == (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0))"), t458))
}

///|
let multivect_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_EQ_0")

///|
/// `MULTIVECT_EQ_0`
pub fn multivect_eq_0() -> @kernel.Thm {
  multivect_eq_0_c.get()
}

///|
/// MULTIVECT_EQ
fn step_82() -> Unit raise {
  let t463 = @simp.asm_simp_tac(@list.List([multivect_eq_0()]))
  let t461 = @equal.gsym(@vectors.vector_sub_component())
  let t462 = @simp.simp_tac(@list.List([linear_multivect(), @equal.gsym(@vectors.linear_sub()), t461]))
  let t459 = @equal.gsym(@realarith.real_sub_0())
  let t460 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq()), t459]))
  let t464 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t460), t462), t463)
  multivect_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], ∀ y : Cart[Real, Trip_fin_sum[P, Q, R]], 1 <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))) → (x == y) == ((multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x) == (multivect : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(y))"), t464))
}

///|
let multivect_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIVECT_EQ")

///|
/// `MULTIVECT_EQ`
pub fn multivect_eq() -> @kernel.Thm {
  multivect_eq_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:615
fn step_83() -> Unit raise {
  @preterm.make_overloadable("multivector", @term_syntax.parse_type("(Num, Cart[Real, N]) -> Bool"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:616
fn step_84() -> Unit raise {
  @preterm.overload_interface("multivector", @term_syntax.parse_term("(multivectorga : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Bool)"))
}

///|
/// multivectorga
fn step_85() -> Unit raise {
  multivectorga_c.set(@pair.new_definition(@term_syntax.parse_term("(multivectorga : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Bool)((k : Num), (p : Cart[Real, Geomalg[P, Q, R]])) == (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && !((setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(p, s) == real_of_num(0)) → (HAS_SIZE : ((Num) -> Bool, Num) -> Bool)(s, k))")))
}

///|
let multivectorga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multivectorga")

///|
/// `multivectorga`
pub fn multivectorga() -> @kernel.Thm {
  multivectorga_c.get()
}

///|
/// FORALL_MULTIVECTORGA_VEC0
fn step_86() -> Unit raise {
  let t465 = @meson.meson_tac(@list.List([multivectorga(), geomalg_vec_component()]))
  forall_multivectorga_vec0_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, (multivectorga : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Bool)(k, (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0))"), t465))
}

///|
let forall_multivectorga_vec0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_MULTIVECTORGA_VEC0")

///|
/// `FORALL_MULTIVECTORGA_VEC0`
pub fn forall_multivectorga_vec0() -> @kernel.Thm {
  forall_multivectorga_vec0_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:631
fn step_87() -> Unit raise {
  @preterm.make_overloadable("grade", @term_syntax.parse_type("(Num, Cart[Real, N]) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:632
fn step_88() -> Unit raise {
  @preterm.overload_interface("grade", @term_syntax.parse_term("(grade_geomalg : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// grade_geomalg
fn step_89() -> Unit raise {
  grade_geomalg_c.set(@pair.new_definition(@term_syntax.parse_term("(grade_geomalg : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((k : Num), (p : Cart[Real, Geomalg[P, Q, R]])) == lambdas((s : (Num) -> Bool) => if HAS_SIZE(s, k) { setindex(p, s) } else { real_of_num(0) })")))
}

///|
let grade_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("grade_geomalg")

///|
/// `grade_geomalg`
pub fn grade_geomalg() -> @kernel.Thm {
  grade_geomalg_c.get()
}

///|
/// GEOMALG_GRADE
fn step_90() -> Unit raise {
  let t466 = @meson.meson_tac(@list.List([]))
  let t467 = @tactics.then_tac(@simp.simp_tac(@list.List([multivectorga(), grade_geomalg(), geomalg_beta(), @theorems.imp_conj()])), t466)
  geomalg_grade_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∀ x : Cart[Real, Geomalg[_, _, _]], multivector(k, grade_geomalg(k, x))"), t467))
}

///|
let geomalg_grade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMALG_GRADE")

///|
/// `GEOMALG_GRADE`
pub fn geomalg_grade() -> @kernel.Thm {
  geomalg_grade_c.get()
}

///|
/// GRADE_ADD_GEOMALG
fn step_91() -> Unit raise {
  let t468 = @tactics.then_tac(@simp.simp_tac(@list.List([grade_geomalg(), geomalg_eq(), geomalg_add_component(), geomalg_beta(), @vectors.cond_component()])), @calc_rat.real_arith_tac)
  grade_add_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], ∀ y : Cart[Real, Geomalg[_, _, _]], ∀ k : Num, grade_geomalg(k, x + y) == grade_geomalg(k, x) + grade_geomalg(k, y)"), t468))
}

///|
let grade_add_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GRADE_ADD_GEOMALG")

///|
/// `GRADE_ADD_GEOMALG`
pub fn grade_add_geomalg() -> @kernel.Thm {
  grade_add_geomalg_c.get()
}

///|
/// GRADE_CMUL_GEOMALG
fn step_92() -> Unit raise {
  let t469 = @tactics.then_tac(@simp.simp_tac(@list.List([grade_geomalg(), geomalg_eq(), geomalg_mul_component(), geomalg_beta(), @vectors.cond_component()])), @calc_rat.real_arith_tac)
  grade_cmul_geomalg_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, Geomalg[_, _, _]], ∀ k : Num, grade_geomalg(k, op_pct(c, x)) == op_pct(c, grade_geomalg(k, x))"), t469))
}

///|
let grade_cmul_geomalg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GRADE_CMUL_GEOMALG")

///|
/// `GRADE_CMUL_GEOMALG`
pub fn grade_cmul_geomalg() -> @kernel.Thm {
  grade_cmul_geomalg_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:659
fn step_93() -> Unit raise {
  @printer.parse_as_infix("SYMDIFF", (18L, "left"))
}

///|
/// SYMDIFF
fn step_94() -> Unit raise {
  symdiff_c.set(@pair.new_definition(@term_syntax.parse_term("(SYMDIFF : ((_) -> Bool, (_) -> Bool, _) -> Bool)((s : (_) -> Bool), (t : (_) -> Bool)) == UNION(DIFF(s, t), DIFF(t, s))")))
}

///|
let symdiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF")

///|
/// `SYMDIFF`
pub fn symdiff() -> @kernel.Thm {
  symdiff_c.get()
}

///|
/// SYMDIFF_EMPTY
fn step_95() -> Unit raise {
  let t470 = @simp.rewrite_tac(@list.List([symdiff(), @sets.diff_empty(), @sets.empty_diff(), @sets.union_empty()]))
  symdiff_empty_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (_) -> Bool, SYMDIFF(s, {}) == s) && (∀ s : (_) -> Bool, SYMDIFF({}, s) == s)"), t470))
}

///|
let symdiff_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF_EMPTY")

///|
/// `SYMDIFF_EMPTY`
pub fn symdiff_empty() -> @kernel.Thm {
  symdiff_empty_c.get()
}

///|
/// SYMDIFF_COMM
fn step_96() -> Unit raise {
  let t471 = @simp.rewrite_tac(@list.List([symdiff(), @sets.union_comm()]))
  symdiff_comm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SYMDIFF(s, t) == SYMDIFF(t, s)"), t471))
}

///|
let symdiff_comm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF_COMM")

///|
/// `SYMDIFF_COMM`
pub fn symdiff_comm() -> @kernel.Thm {
  symdiff_comm_c.get()
}

///|
/// SYMDIFF_SUBSET
fn step_97() -> Unit raise {
  let t472 = @sets.set_tac(@list.List([]))
  let t473 = @tactics.then_tac(@simp.rewrite_tac(@list.List([symdiff()])), t472)
  symdiff_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(s, u) && SUBSET(t, u) → SUBSET(SYMDIFF(s, t), u)"), t473))
}

///|
let symdiff_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF_SUBSET")

///|
/// `SYMDIFF_SUBSET`
pub fn symdiff_subset() -> @kernel.Thm {
  symdiff_subset_c.get()
}

///|
/// SYMDIFF_ASSOC
fn step_98() -> Unit raise {
  let t474 = @sets.set_tac(@list.List([]))
  let t475 = @tactics.then_tac(@simp.rewrite_tac(@list.List([symdiff()])), t474)
  symdiff_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SYMDIFF(s, SYMDIFF(t, u)) == SYMDIFF(SYMDIFF(s, t), u)"), t475))
}

///|
let symdiff_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMDIFF_ASSOC")

///|
/// `SYMDIFF_ASSOC`
pub fn symdiff_assoc() -> @kernel.Thm {
  symdiff_assoc_c.get()
}

///|
/// Productga_DEF
fn step_99() -> Unit raise {
  productga_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((sgn : ((Num) -> Bool, (Num) -> Bool) -> Real), (x : Cart[Real, Geomalg[P, Q, R]]), (y : Cart[Real, Geomalg[P, Q, R]])) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (s : (Num) -> Bool) => (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (t : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(sgn(s, t) * ((setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s) * (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(y, t)), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])((SYMDIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))))")))
}

///|
let productga_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Productga_DEF")

///|
/// `Productga_DEF`
pub fn productga_def() -> @kernel.Thm {
  productga_def_c.get()
}

///|
/// BILINEAR_PRODUCTGA
fn step_100() -> Unit raise {
  let t483 = @simp.asm_simp_tac(@list.List([geomalg_add_component()]))
  let t481 = @tactics.repeat_tac(@tactics.strip_tac)
  let t480 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t482 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_eq()), t480), t481))
  let t479 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_add()), @sets.finite_powerset(), @iterate.finite_numseg()]))
  let t478 = @tactics.repeat_tac(@tactics.strip_tac)
  let t477 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @real.real_mul_ac()]))
  let t476 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_lmul()), geomalg_mul_component()]))
  let t484 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.bilinear(), @vectors.linear(), productga_def()])), t476), t477), t478), t479), t482), t483), @vectors.vector_arith_tac)
  bilinear_productga_c.set(@tactics.prove(@term_syntax.parse_term("∀ sgn : ((Num) -> Bool, (Num) -> Bool) -> Real, (bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])(sgn))"), t484))
}

///|
let bilinear_productga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_PRODUCTGA")

///|
/// `BILINEAR_PRODUCTGA`
pub fn bilinear_productga() -> @kernel.Thm {
  bilinear_productga_c.get()
}

///|
/// PRODUCTGA_LADD
fn step_101() -> Unit raise {
  let t485 = @drule.match_mp(@vectors.bilinear_ladd())
  productga_ladd_c.set(t485(@bool.spec_all(bilinear_productga())))
}

///|
let productga_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_LADD")

///|
/// `PRODUCTGA_LADD`
pub fn productga_ladd() -> @kernel.Thm {
  productga_ladd_c.get()
}

///|
/// PRODUCTGA_RADD
fn step_102() -> Unit raise {
  let t486 = @drule.match_mp(@vectors.bilinear_radd())
  productga_radd_c.set(t486(@bool.spec_all(bilinear_productga())))
}

///|
let productga_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_RADD")

///|
/// `PRODUCTGA_RADD`
pub fn productga_radd() -> @kernel.Thm {
  productga_radd_c.get()
}

///|
/// PRODUCTGA_LMUL
fn step_103() -> Unit raise {
  let t487 = @drule.match_mp(@vectors.bilinear_lmul())
  productga_lmul_c.set(t487(@bool.spec_all(bilinear_productga())))
}

///|
let productga_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_LMUL")

///|
/// `PRODUCTGA_LMUL`
pub fn productga_lmul() -> @kernel.Thm {
  productga_lmul_c.get()
}

///|
/// PRODUCTGA_RMUL
fn step_104() -> Unit raise {
  let t488 = @drule.match_mp(@vectors.bilinear_rmul())
  productga_rmul_c.set(t488(@bool.spec_all(bilinear_productga())))
}

///|
let productga_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_RMUL")

///|
/// `PRODUCTGA_RMUL`
pub fn productga_rmul() -> @kernel.Thm {
  productga_rmul_c.get()
}

///|
/// PRODUCTGA_LNEG
fn step_105() -> Unit raise {
  let t489 = @drule.match_mp(@vectors.bilinear_lneg())
  productga_lneg_c.set(t489(@bool.spec_all(bilinear_productga())))
}

///|
let productga_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_LNEG")

///|
/// `PRODUCTGA_LNEG`
pub fn productga_lneg() -> @kernel.Thm {
  productga_lneg_c.get()
}

///|
/// PRODUCTGA_RNEG
fn step_106() -> Unit raise {
  let t490 = @drule.match_mp(@vectors.bilinear_rneg())
  productga_rneg_c.set(t490(@bool.spec_all(bilinear_productga())))
}

///|
let productga_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_RNEG")

///|
/// `PRODUCTGA_RNEG`
pub fn productga_rneg() -> @kernel.Thm {
  productga_rneg_c.get()
}

///|
/// PRODUCTGA_LZERO
fn step_107() -> Unit raise {
  let t491 = @drule.match_mp(@vectors.bilinear_lzero())
  productga_lzero_c.set(t491(@bool.spec_all(bilinear_productga())))
}

///|
let productga_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_LZERO")

///|
/// `PRODUCTGA_LZERO`
pub fn productga_lzero() -> @kernel.Thm {
  productga_lzero_c.get()
}

///|
/// PRODUCTGA_RZERO
fn step_108() -> Unit raise {
  let t492 = @drule.match_mp(@vectors.bilinear_rzero())
  productga_rzero_c.set(t492(@bool.spec_all(bilinear_productga())))
}

///|
let productga_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_RZERO")

///|
/// `PRODUCTGA_RZERO`
pub fn productga_rzero() -> @kernel.Thm {
  productga_rzero_c.get()
}

///|
/// PRODUCTGA_ASSOCIATIVE
fn step_109() -> Unit raise {
  let t495 = @bool.ispec(@term_syntax.parse_term("(f : ((Num) -> Bool, (Num) -> Bool) -> Real)"), @iterate.sum_swap())
  let t493 = @term_syntax.parse_term("{(s : (Num) -> Bool) | SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}")
  let t496 = @lib.repeat((x494 : @kernel.Thm) => @bool.spec(t493, x494), t495)
  let sum_swap_powerset = @simp.simp_rule(@list.List([@sets.finite_powerset(), @iterate.finite_numseg()]))(t496)
  let swap_tac : (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x497 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let cnv = x497
    fn(x498 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let n = x498
      let t506 = @simp.rewrite_tac(@list.List([]))
      let t503 = @lib.int63_to_int(n)
      @tactics.then_tac(@simp.gen_rewrite_tac(fn(x505 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        cnv(((x504 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(t503, fn(x500 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s501 = @equal.binder_conv(x500)
          fn(x502 : @kernel.Term) -> @kernel.Thm raise {
            s501(x502)
          }
        }, x504))(x505))
      }, @list.List([sum_swap_powerset])), t506)
    }
  }
  let swaps_tac : (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise = fn(x507 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
    let cnv_1 = x507
    fn(x508 : @list.List[Int64]) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      let ns = x508
      fn(x509 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let x = x509
        let t513 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
        let t512 = @tactics.x_gen_tac(x)
        let t511 = @tactics.match_mp_tac(@iterate.sum_eq())
        @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(swap_tac(cnv_1), ns), t511), t512), t513), @tactics.strip_tac)
      }
    }
  }
  let t550 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t549 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t548 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t547 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid(), @realarith.real_mul_rid()]))
  let t546 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), symdiff_subset(), symdiff_assoc()]))
  let t545 = @simp.simp_tac(@list.List([@iterate.sum_delta()]))
  let t542 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (if (p : Bool) { (b : Real) } else { real_of_num(0) }) == (if p { a * b } else { real_of_num(0) })"))
  let t543 = @calc_rat.real_arith(@term_syntax.parse_term("(if (p : Bool) { (a : Real) } else { real_of_num(0) }) * (b : Real) == (if p { a * b } else { real_of_num(0) })"))
  let t544 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t543, t542]))
  let t540 = @term_syntax.parse_term("(u : (Num) -> Bool)")
  let t541 = swaps_tac(fn(x537 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s538 = @equal.land_conv(x537)
    fn(x539 : @kernel.Term) -> @kernel.Thm raise {
      s538(x539)
    }
  })(@list.List([0L]))(t540)
  let t536 = swap_tac(fn(x533 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s534 = @equal.rand_conv(x533)
    fn(x535 : @kernel.Term) -> @kernel.Thm raise {
      s534(x535)
    }
  })(0L)
  let t531 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t532 = swaps_tac(fn(x528 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s529 = @equal.rand_conv(x528)
    fn(x530 : @kernel.Term) -> @kernel.Thm raise {
      s529(x530)
    }
  })(@list.List([1L, 0L]))(t531)
  let t527 = swap_tac(fn(x524 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s525 = @equal.land_conv(x524)
    fn(x526 : @kernel.Term) -> @kernel.Thm raise {
      s525(x526)
    }
  })(0L)
  let t522 = @term_syntax.parse_term("(s : (Num) -> Bool)")
  let t523 = swaps_tac(fn(x519 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s520 = @equal.rand_conv(x519)
    fn(x521 : @kernel.Term) -> @kernel.Thm raise {
      s520(x521)
    }
  })(@list.List([1L, 0L]))(t522)
  let t518 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (Num) -> Bool)"))
  let t516 = @equal.gsym(@iterate.sum_rmul())
  let t517 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t516]))
  let t515 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_vsum_component(), mvbasis_component(), geomalg_mul_component()]))
  let t514 = @tactics.repeat_tac(@tactics.strip_tac)
  let t551 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([productga_def()])), t514), t515), t517), t518), @tactics.strip_tac), t523), t527), t532), t536), t541), t544), t545), t546), @class.cond_cases_tac), t547), t548), t549), t550)
  productga_associative_c.set(@tactics.prove(@term_syntax.parse_term("∀ sgn1 : ((Num) -> Bool, (Num) -> Bool) -> Real, ∀ sgn2 : ((Num) -> Bool, (Num) -> Bool) -> Real, (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ u : (Num) -> Bool, sgn1(t, u) * sgn2(s, SYMDIFF(t, u)) == sgn2(s, t) * sgn1(SYMDIFF(s, t), u)) → (∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], Productga(sgn2, x, Productga(sgn1, y, z)) == Productga(sgn1, Productga(sgn2, x, y), z))"), t551))
}

///|
let productga_associative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_ASSOCIATIVE")

///|
/// `PRODUCTGA_ASSOCIATIVE`
pub fn productga_associative() -> @kernel.Thm {
  productga_associative_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:748
fn step_110() -> Unit raise {
  @preterm.overload_interface("*", @term_syntax.parse_term("(geomga_mul : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// geomga_mul
fn step_111() -> Unit raise {
  geomga_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(geomga_mul : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]]), (y : Cart[Real, Geomalg[P, Q, R]])) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) * (pow(-real_of_num(1), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) * pow(real_of_num(0), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t))))), x, y)")))
}

///|
let geomga_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("geomga_mul")

///|
/// `geomga_mul`
pub fn geomga_mul() -> @kernel.Thm {
  geomga_mul_c.get()
}

///|
/// BILINEAR_GEOMGA
fn step_112() -> Unit raise {
  let t552 = @tactics.match_accept_tac(bilinear_productga())
  let t553 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(geomga_mul())])), t552)
  bilinear_geomga_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((geomga_mul : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t553))
}

///|
let bilinear_geomga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_GEOMGA")

///|
/// `BILINEAR_GEOMGA`
pub fn bilinear_geomga() -> @kernel.Thm {
  bilinear_geomga_c.get()
}

///|
/// GEOMGA_LADD
fn step_113() -> Unit raise {
  let t554 = @drule.match_mp(@vectors.bilinear_ladd())
  geomga_ladd_c.set(t554(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_LADD")

///|
/// `GEOMGA_LADD`
pub fn geomga_ladd() -> @kernel.Thm {
  geomga_ladd_c.get()
}

///|
/// GEOMGA_RADD
fn step_114() -> Unit raise {
  let t555 = @drule.match_mp(@vectors.bilinear_radd())
  geomga_radd_c.set(t555(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_RADD")

///|
/// `GEOMGA_RADD`
pub fn geomga_radd() -> @kernel.Thm {
  geomga_radd_c.get()
}

///|
/// GEOMGA_LMUL
fn step_115() -> Unit raise {
  let t556 = @drule.match_mp(@vectors.bilinear_lmul())
  geomga_lmul_c.set(t556(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_LMUL")

///|
/// `GEOMGA_LMUL`
pub fn geomga_lmul() -> @kernel.Thm {
  geomga_lmul_c.get()
}

///|
/// GEOMGA_RMUL
fn step_116() -> Unit raise {
  let t557 = @drule.match_mp(@vectors.bilinear_rmul())
  geomga_rmul_c.set(t557(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_RMUL")

///|
/// `GEOMGA_RMUL`
pub fn geomga_rmul() -> @kernel.Thm {
  geomga_rmul_c.get()
}

///|
/// GEOMGA_LNEG
fn step_117() -> Unit raise {
  let t558 = @drule.match_mp(@vectors.bilinear_lneg())
  geomga_lneg_c.set(t558(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_LNEG")

///|
/// `GEOMGA_LNEG`
pub fn geomga_lneg() -> @kernel.Thm {
  geomga_lneg_c.get()
}

///|
/// GEOMGA_RNEG
fn step_118() -> Unit raise {
  let t559 = @drule.match_mp(@vectors.bilinear_rneg())
  geomga_rneg_c.set(t559(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_RNEG")

///|
/// `GEOMGA_RNEG`
pub fn geomga_rneg() -> @kernel.Thm {
  geomga_rneg_c.get()
}

///|
/// GEOMGA_LZERO
fn step_119() -> Unit raise {
  let t560 = @drule.match_mp(@vectors.bilinear_lzero())
  geomga_lzero_c.set(t560(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_LZERO")

///|
/// `GEOMGA_LZERO`
pub fn geomga_lzero() -> @kernel.Thm {
  geomga_lzero_c.get()
}

///|
/// GEOMGA_RZERO
fn step_120() -> Unit raise {
  let t561 = @drule.match_mp(@vectors.bilinear_rzero())
  geomga_rzero_c.set(t561(@bool.spec_all(bilinear_geomga())))
}

///|
let geomga_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_RZERO")

///|
/// `GEOMGA_RZERO`
pub fn geomga_rzero() -> @kernel.Thm {
  geomga_rzero_c.get()
}

///|
/// GEOMGA_ASSOC
fn step_121() -> Unit raise {
  let t588 = @tactics.conv_tac(@class.taut)
  let t587 = @simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_elim_thm(), @sets.in_union(), @sets.in_diff(), @sets.in_inter()]))
  let t586 = @simp.simp_tac(@list.List([finite_cart_subset_lemma1(), @iterate.finite_numseg(), @sets.finite_inter()]))
  let t585 = @tactics.match_mp_tac(@clifford.symdiff_parity_lemma())
  let t581 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv))
  let t582 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) == ((y : Bool) == (z : Bool)) → ((a : Bool) == x) == (y == (z == a))")))
  let t583 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv))
  let t584 = @list.List([@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) == ((y : Bool) == (z : Bool)) → ((a : Bool) == x) == (y == (z == a))"))), t583, t582, t581])
  let t571 = @simp.rewrite_tac(@list.List([@arith.even_add()]))
  let t570 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @real.real_pow_one()]))
  let t568 = @sets.set_tac(@list.List([]))
  let t567 = @simp.simp_tac(@list.List([@equal.gsym(@sets.empty_union())]))
  let t566 = @simp.simp_tac(@list.List([@arith.add_eq_0(), @iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t569 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.binop_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_zero()])), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t566), t567), @tactics.ap_thm_tac), @tactics.ap_term_tac), t568)]))])
  let t565 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), symdiff()]))
  let t564 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) * ((d : Real) * ((e : Real) * (f : Real))) == a * d * (b * e * (c * f))"))]))
  let t563 = @tactics.repeat_tac(@tactics.gen_tac)
  let t562 = @tactics.match_mp_tac(productga_associative())
  let t589 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([geomga_mul()])), t562), t563), t564), t565), @tactics.binop_tac), t569), t570), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t571), fn(x580 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x572
      let tu = @lib.funpow(2, @equal.lhand, w)
      let t574 = @term_syntax.parse_term("(t : (Num) -> Bool)")
      let su = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(s : (Num) -> Bool)"), t574)]), tu)
      let t575 = @term_syntax.parse_term("(u : (Num) -> Bool)")
      let st = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(t : (Num) -> Bool)"), t575)]), su)
      let t579 = @tactics.exists_tac(@lib.end_itlist((x577 : @kernel.Term, x578 : @kernel.Term) => @lib.curry(fn(x576 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @basics.mk_eq(x576.0, x576.1)
      }, x577, x578), @list.List([st, su, tu])))
      @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t579)
    })(x580)(x580)
  }), @tactics.conj_tac), t584), t585), t586), t587), t588)
  geomga_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], geomga_mul(x, geomga_mul(y, z)) == geomga_mul(geomga_mul(x, y), z)"), t589))
}

///|
let geomga_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOMGA_ASSOC")

///|
/// `GEOMGA_ASSOC`
pub fn geomga_assoc() -> @kernel.Thm {
  geomga_assoc_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:808
fn step_122() -> Unit raise {
  @preterm.make_overloadable("outer", @term_syntax.parse_type("(Cart[Real, N], Cart[Real, N]) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:809
fn step_123() -> Unit raise {
  @preterm.overload_interface("outer", @term_syntax.parse_term("(outerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// outerga
fn step_124() -> Unit raise {
  outerga_c.set(@pair.new_definition(@term_syntax.parse_term("(outerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]]), (y : Cart[Real, Geomalg[P, Q, R]])) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if !((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t) == ({} : (Num) -> Bool)) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) }, x, y)")))
}

///|
let outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outerga")

///|
/// `outerga`
pub fn outerga() -> @kernel.Thm {
  outerga_c.get()
}

///|
/// BILINEAR_OUTERGA
fn step_125() -> Unit raise {
  let t590 = @tactics.match_accept_tac(bilinear_productga())
  let t591 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(outerga())])), t590)
  bilinear_outerga_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((outerga : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t591))
}

///|
let bilinear_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_OUTERGA")

///|
/// `BILINEAR_OUTERGA`
pub fn bilinear_outerga() -> @kernel.Thm {
  bilinear_outerga_c.get()
}

///|
/// OUTERGA_LADD
fn step_126() -> Unit raise {
  let t592 = @drule.match_mp(@vectors.bilinear_ladd())
  outerga_ladd_c.set(t592(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_LADD")

///|
/// `OUTERGA_LADD`
pub fn outerga_ladd() -> @kernel.Thm {
  outerga_ladd_c.get()
}

///|
/// OUTERGA_RADD
fn step_127() -> Unit raise {
  let t593 = @drule.match_mp(@vectors.bilinear_radd())
  outerga_radd_c.set(t593(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_RADD")

///|
/// `OUTERGA_RADD`
pub fn outerga_radd() -> @kernel.Thm {
  outerga_radd_c.get()
}

///|
/// OUTERGA_LMUL
fn step_128() -> Unit raise {
  let t594 = @drule.match_mp(@vectors.bilinear_lmul())
  outerga_lmul_c.set(t594(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_LMUL")

///|
/// `OUTERGA_LMUL`
pub fn outerga_lmul() -> @kernel.Thm {
  outerga_lmul_c.get()
}

///|
/// OUTERGA_RMUL
fn step_129() -> Unit raise {
  let t595 = @drule.match_mp(@vectors.bilinear_rmul())
  outerga_rmul_c.set(t595(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_RMUL")

///|
/// `OUTERGA_RMUL`
pub fn outerga_rmul() -> @kernel.Thm {
  outerga_rmul_c.get()
}

///|
/// OUTERGA_LNEG
fn step_130() -> Unit raise {
  let t596 = @drule.match_mp(@vectors.bilinear_lneg())
  outerga_lneg_c.set(t596(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_LNEG")

///|
/// `OUTERGA_LNEG`
pub fn outerga_lneg() -> @kernel.Thm {
  outerga_lneg_c.get()
}

///|
/// OUTERGA_RNEG
fn step_131() -> Unit raise {
  let t597 = @drule.match_mp(@vectors.bilinear_rneg())
  outerga_rneg_c.set(t597(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_RNEG")

///|
/// `OUTERGA_RNEG`
pub fn outerga_rneg() -> @kernel.Thm {
  outerga_rneg_c.get()
}

///|
/// OUTERGA_LZERO
fn step_132() -> Unit raise {
  let t598 = @drule.match_mp(@vectors.bilinear_lzero())
  outerga_lzero_c.set(t598(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_LZERO")

///|
/// `OUTERGA_LZERO`
pub fn outerga_lzero() -> @kernel.Thm {
  outerga_lzero_c.get()
}

///|
/// OUTERGA_RZERO
fn step_133() -> Unit raise {
  let t599 = @drule.match_mp(@vectors.bilinear_rzero())
  outerga_rzero_c.set(t599(@bool.spec_all(bilinear_outerga())))
}

///|
let outerga_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_RZERO")

///|
/// `OUTERGA_RZERO`
pub fn outerga_rzero() -> @kernel.Thm {
  outerga_rzero_c.get()
}

///|
/// OUTERGA_ASSOC
fn step_134() -> Unit raise {
  let t615 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t614 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm()]))
  let t613 = @simp.simp_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.not_in_empty(), @sets.in_union(), @sets.in_inter()]))
  let t612 = @simp.rewrite_tac(@list.List([finite_cart_subset_lemma1()]))
  let t611 = @tactics.match_mp_tac(@clifford.card_union_lemma())
  let t610 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t609 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]))
  let t608 = @simp.rewrite_tac(@list.List([@sets.empty_union()]))
  let t605 = @sets.set_rule(@term_syntax.parse_term("INTER(UNION((t : (_) -> Bool), (u : (_) -> Bool)), (s : (_) -> Bool)) == UNION(INTER(t, s), INTER(u, s))"))
  let t606 = @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == UNION(INTER(s, t), INTER(s, u))"))
  let t607 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(DIFF(s, t), DIFF(t, s)) == UNION(s, t)")), t606, t605]))
  let t602 = @term_syntax.parse_term("INTER((t : (Num) -> Bool), (u : (Num) -> Bool)) == {}")
  let t603 = @term_syntax.parse_term("INTER((s : (Num) -> Bool), (u : (Num) -> Bool)) == {}")
  let t604 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"), t603, t602]))
  let t601 = @tactics.repeat_tac(@tactics.gen_tac)
  let t600 = @tactics.match_mp_tac(productga_associative())
  let t616 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outerga()])), t600), t601), t604), t607), t608), t609), t610), @tactics.ap_term_tac), t611), t612), t613), t614), t615)
  outerga_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], outerga(x, outerga(y, z)) == outerga(outerga(x, y), z)"), t616))
}

///|
let outerga_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_ASSOC")

///|
/// `OUTERGA_ASSOC`
pub fn outerga_assoc() -> @kernel.Thm {
  outerga_assoc_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:857
fn step_135() -> Unit raise {
  @preterm.make_overloadable("inner", @term_syntax.parse_type("(Cart[Real, N], Cart[Real, N]) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:858
fn step_136() -> Unit raise {
  @preterm.overload_interface("inner", @term_syntax.parse_term("(innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// innerga
fn step_137() -> Unit raise {
  innerga_c.set(@pair.new_definition(@term_syntax.parse_term("(innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]]), (y : Cart[Real, Geomalg[P, Q, R]])) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if s == ({} : (Num) -> Bool) || t == ({} : (Num) -> Bool) || !(SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, t) && !(SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, s) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) * (pow(-real_of_num(1), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) * pow(real_of_num(0), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t))))) }, x, y)")))
}

///|
let innerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("innerga")

///|
/// `innerga`
pub fn innerga() -> @kernel.Thm {
  innerga_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:872
fn step_138() -> Unit raise {
  @printer.parse_as_infix("lcinner", (20L, "right"))
}

///|
/// lcinner
fn step_139() -> Unit raise {
  lcinner_c.set(@pair.new_definition(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], (lcinner : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x, y) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if s == ({} : (Num) -> Bool) || t == ({} : (Num) -> Bool) || !(SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, t) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) * (pow(-real_of_num(1), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) * pow(real_of_num(0), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t))))) }, x, y)")))
}

///|
let lcinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lcinner")

///|
/// `lcinner`
pub fn lcinner() -> @kernel.Thm {
  lcinner_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:885
fn step_140() -> Unit raise {
  @printer.parse_as_infix("rcinner", (20L, "right"))
}

///|
/// rcinner
fn step_141() -> Unit raise {
  rcinner_c.set(@pair.new_definition(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], (rcinner : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x, y) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if s == ({} : (Num) -> Bool) || t == ({} : (Num) -> Bool) || !(SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(t, s) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : (((Num, Num)) -> Bool) -> Num)({((i : Num), (j : Num)) | (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (IN : (Num, (Num) -> Bool) -> Bool)(i, s) && (IN : (Num, (Num) -> Bool) -> Bool)(j, t) && i > j})) * (pow(-real_of_num(1), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) * pow(real_of_num(0), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t))))) }, x, y)")))
}

///|
let rcinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rcinner")

///|
/// `rcinner`
pub fn rcinner() -> @kernel.Thm {
  rcinner_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:900
fn step_142() -> Unit raise {
  @printer.parse_as_infix("scalarinner", (20L, "right"))
}

///|
/// scalarinner
fn step_143() -> Unit raise {
  scalarinner_c.set(@pair.new_definition(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], (scalarinner : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x, y) == (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => (t : (Num) -> Bool) => if s == ({} : (Num) -> Bool) || t == ({} : (Num) -> Bool) || !(s == t) { real_of_num(0) } else { pow(-real_of_num(1), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) * pow(real_of_num(0), (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, t)))) }, x, y)")))
}

///|
let scalarinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("scalarinner")

///|
/// `scalarinner`
pub fn scalarinner() -> @kernel.Thm {
  scalarinner_c.get()
}

///|
/// BILINEAR_INNERGA
fn step_144() -> Unit raise {
  let t617 = @tactics.match_accept_tac(bilinear_productga())
  let t618 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(innerga())])), t617)
  bilinear_innerga_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((innerga : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t618))
}

///|
let bilinear_innerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_INNERGA")

///|
/// `BILINEAR_INNERGA`
pub fn bilinear_innerga() -> @kernel.Thm {
  bilinear_innerga_c.get()
}

///|
/// INNERGA_LADD
fn step_145() -> Unit raise {
  let t619 = @drule.match_mp(@vectors.bilinear_ladd())
  innerga_ladd_c.set(t619(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_LADD")

///|
/// `INNERGA_LADD`
pub fn innerga_ladd() -> @kernel.Thm {
  innerga_ladd_c.get()
}

///|
/// INNERGA_RADD
fn step_146() -> Unit raise {
  let t620 = @drule.match_mp(@vectors.bilinear_radd())
  innerga_radd_c.set(t620(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_RADD")

///|
/// `INNERGA_RADD`
pub fn innerga_radd() -> @kernel.Thm {
  innerga_radd_c.get()
}

///|
/// INNERGA_LMUL
fn step_147() -> Unit raise {
  let t621 = @drule.match_mp(@vectors.bilinear_lmul())
  innerga_lmul_c.set(t621(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_LMUL")

///|
/// `INNERGA_LMUL`
pub fn innerga_lmul() -> @kernel.Thm {
  innerga_lmul_c.get()
}

///|
/// INNERGA_RMUL
fn step_148() -> Unit raise {
  let t622 = @drule.match_mp(@vectors.bilinear_rmul())
  innerga_rmul_c.set(t622(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_RMUL")

///|
/// `INNERGA_RMUL`
pub fn innerga_rmul() -> @kernel.Thm {
  innerga_rmul_c.get()
}

///|
/// INNERGA_LNEG
fn step_149() -> Unit raise {
  let t623 = @drule.match_mp(@vectors.bilinear_lneg())
  innerga_lneg_c.set(t623(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_LNEG")

///|
/// `INNERGA_LNEG`
pub fn innerga_lneg() -> @kernel.Thm {
  innerga_lneg_c.get()
}

///|
/// INNERGA_RNEG
fn step_150() -> Unit raise {
  let t624 = @drule.match_mp(@vectors.bilinear_rneg())
  innerga_rneg_c.set(t624(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_RNEG")

///|
/// `INNERGA_RNEG`
pub fn innerga_rneg() -> @kernel.Thm {
  innerga_rneg_c.get()
}

///|
/// INNERGA_LZERO
fn step_151() -> Unit raise {
  let t625 = @drule.match_mp(@vectors.bilinear_lzero())
  innerga_lzero_c.set(t625(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_LZERO")

///|
/// `INNERGA_LZERO`
pub fn innerga_lzero() -> @kernel.Thm {
  innerga_lzero_c.get()
}

///|
/// INNERGA_RZERO
fn step_152() -> Unit raise {
  let t626 = @drule.match_mp(@vectors.bilinear_rzero())
  innerga_rzero_c.set(t626(@bool.spec_all(bilinear_innerga())))
}

///|
let innerga_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNERGA_RZERO")

///|
/// `INNERGA_RZERO`
pub fn innerga_rzero() -> @kernel.Thm {
  innerga_rzero_c.get()
}

///|
/// BILINEAR_LCINNER
fn step_153() -> Unit raise {
  let t627 = @tactics.match_accept_tac(bilinear_productga())
  let t628 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(lcinner())])), t627)
  bilinear_lcinner_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((lcinner : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t628))
}

///|
let bilinear_lcinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_LCINNER")

///|
/// `BILINEAR_LCINNER`
pub fn bilinear_lcinner() -> @kernel.Thm {
  bilinear_lcinner_c.get()
}

///|
/// LCINNER_LADD
fn step_154() -> Unit raise {
  let t629 = @drule.match_mp(@vectors.bilinear_ladd())
  lcinner_ladd_c.set(t629(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_LADD")

///|
/// `LCINNER_LADD`
pub fn lcinner_ladd() -> @kernel.Thm {
  lcinner_ladd_c.get()
}

///|
/// LCINNER_RADD
fn step_155() -> Unit raise {
  let t630 = @drule.match_mp(@vectors.bilinear_radd())
  lcinner_radd_c.set(t630(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_RADD")

///|
/// `LCINNER_RADD`
pub fn lcinner_radd() -> @kernel.Thm {
  lcinner_radd_c.get()
}

///|
/// LCINNER_LMUL
fn step_156() -> Unit raise {
  let t631 = @drule.match_mp(@vectors.bilinear_lmul())
  lcinner_lmul_c.set(t631(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_LMUL")

///|
/// `LCINNER_LMUL`
pub fn lcinner_lmul() -> @kernel.Thm {
  lcinner_lmul_c.get()
}

///|
/// LCINNER_RMUL
fn step_157() -> Unit raise {
  let t632 = @drule.match_mp(@vectors.bilinear_rmul())
  lcinner_rmul_c.set(t632(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_RMUL")

///|
/// `LCINNER_RMUL`
pub fn lcinner_rmul() -> @kernel.Thm {
  lcinner_rmul_c.get()
}

///|
/// LCINNER_LNEG
fn step_158() -> Unit raise {
  let t633 = @drule.match_mp(@vectors.bilinear_lneg())
  lcinner_lneg_c.set(t633(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_LNEG")

///|
/// `LCINNER_LNEG`
pub fn lcinner_lneg() -> @kernel.Thm {
  lcinner_lneg_c.get()
}

///|
/// LCINNER_RNEG
fn step_159() -> Unit raise {
  let t634 = @drule.match_mp(@vectors.bilinear_rneg())
  lcinner_rneg_c.set(t634(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_RNEG")

///|
/// `LCINNER_RNEG`
pub fn lcinner_rneg() -> @kernel.Thm {
  lcinner_rneg_c.get()
}

///|
/// LCINNER_LZERO
fn step_160() -> Unit raise {
  let t635 = @drule.match_mp(@vectors.bilinear_lzero())
  lcinner_lzero_c.set(t635(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_LZERO")

///|
/// `LCINNER_LZERO`
pub fn lcinner_lzero() -> @kernel.Thm {
  lcinner_lzero_c.get()
}

///|
/// LCINNER_RZERO
fn step_161() -> Unit raise {
  let t636 = @drule.match_mp(@vectors.bilinear_rzero())
  lcinner_rzero_c.set(t636(@bool.spec_all(bilinear_lcinner())))
}

///|
let lcinner_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LCINNER_RZERO")

///|
/// `LCINNER_RZERO`
pub fn lcinner_rzero() -> @kernel.Thm {
  lcinner_rzero_c.get()
}

///|
/// BILINEAR_RCINNER
fn step_162() -> Unit raise {
  let t637 = @tactics.match_accept_tac(bilinear_productga())
  let t638 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(rcinner())])), t637)
  bilinear_rcinner_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((rcinner : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t638))
}

///|
let bilinear_rcinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_RCINNER")

///|
/// `BILINEAR_RCINNER`
pub fn bilinear_rcinner() -> @kernel.Thm {
  bilinear_rcinner_c.get()
}

///|
/// RCINNER_LADD
fn step_163() -> Unit raise {
  let t639 = @drule.match_mp(@vectors.bilinear_ladd())
  rcinner_ladd_c.set(t639(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_LADD")

///|
/// `RCINNER_LADD`
pub fn rcinner_ladd() -> @kernel.Thm {
  rcinner_ladd_c.get()
}

///|
/// RCINNER_RADD
fn step_164() -> Unit raise {
  let t640 = @drule.match_mp(@vectors.bilinear_radd())
  rcinner_radd_c.set(t640(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_RADD")

///|
/// `RCINNER_RADD`
pub fn rcinner_radd() -> @kernel.Thm {
  rcinner_radd_c.get()
}

///|
/// RCINNER_LMUL
fn step_165() -> Unit raise {
  let t641 = @drule.match_mp(@vectors.bilinear_lmul())
  rcinner_lmul_c.set(t641(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_LMUL")

///|
/// `RCINNER_LMUL`
pub fn rcinner_lmul() -> @kernel.Thm {
  rcinner_lmul_c.get()
}

///|
/// RCINNER_RMUL
fn step_166() -> Unit raise {
  let t642 = @drule.match_mp(@vectors.bilinear_rmul())
  rcinner_rmul_c.set(t642(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_RMUL")

///|
/// `RCINNER_RMUL`
pub fn rcinner_rmul() -> @kernel.Thm {
  rcinner_rmul_c.get()
}

///|
/// RCINNER_LNEG
fn step_167() -> Unit raise {
  let t643 = @drule.match_mp(@vectors.bilinear_lneg())
  rcinner_lneg_c.set(t643(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_LNEG")

///|
/// `RCINNER_LNEG`
pub fn rcinner_lneg() -> @kernel.Thm {
  rcinner_lneg_c.get()
}

///|
/// RCINNER_RNEG
fn step_168() -> Unit raise {
  let t644 = @drule.match_mp(@vectors.bilinear_rneg())
  rcinner_rneg_c.set(t644(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_RNEG")

///|
/// `RCINNER_RNEG`
pub fn rcinner_rneg() -> @kernel.Thm {
  rcinner_rneg_c.get()
}

///|
/// RCINNER_LZERO
fn step_169() -> Unit raise {
  let t645 = @drule.match_mp(@vectors.bilinear_lzero())
  rcinner_lzero_c.set(t645(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_LZERO")

///|
/// `RCINNER_LZERO`
pub fn rcinner_lzero() -> @kernel.Thm {
  rcinner_lzero_c.get()
}

///|
/// RCINNER_RZERO
fn step_170() -> Unit raise {
  let t646 = @drule.match_mp(@vectors.bilinear_rzero())
  rcinner_rzero_c.set(t646(@bool.spec_all(bilinear_rcinner())))
}

///|
let rcinner_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RCINNER_RZERO")

///|
/// `RCINNER_RZERO`
pub fn rcinner_rzero() -> @kernel.Thm {
  rcinner_rzero_c.get()
}

///|
/// BILINEAR_SCALARINNER
fn step_171() -> Unit raise {
  let t647 = @tactics.match_accept_tac(bilinear_productga())
  let t648 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(scalarinner())])), t647)
  bilinear_scalarinner_c.set(@tactics.prove(@term_syntax.parse_term("(bilinear : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Bool)((scalarinner : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]))"), t648))
}

///|
let bilinear_scalarinner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_SCALARINNER")

///|
/// `BILINEAR_SCALARINNER`
pub fn bilinear_scalarinner() -> @kernel.Thm {
  bilinear_scalarinner_c.get()
}

///|
/// SCALARINNER_LADD
fn step_172() -> Unit raise {
  let t649 = @drule.match_mp(@vectors.bilinear_ladd())
  scalarinner_ladd_c.set(t649(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_LADD")

///|
/// `SCALARINNER_LADD`
pub fn scalarinner_ladd() -> @kernel.Thm {
  scalarinner_ladd_c.get()
}

///|
/// SCALARINNER_RADD
fn step_173() -> Unit raise {
  let t650 = @drule.match_mp(@vectors.bilinear_radd())
  scalarinner_radd_c.set(t650(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_RADD")

///|
/// `SCALARINNER_RADD`
pub fn scalarinner_radd() -> @kernel.Thm {
  scalarinner_radd_c.get()
}

///|
/// SCALARINNER_LMUL
fn step_174() -> Unit raise {
  let t651 = @drule.match_mp(@vectors.bilinear_lmul())
  scalarinner_lmul_c.set(t651(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_LMUL")

///|
/// `SCALARINNER_LMUL`
pub fn scalarinner_lmul() -> @kernel.Thm {
  scalarinner_lmul_c.get()
}

///|
/// SCALARINNER_RMUL
fn step_175() -> Unit raise {
  let t652 = @drule.match_mp(@vectors.bilinear_rmul())
  scalarinner_rmul_c.set(t652(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_RMUL")

///|
/// `SCALARINNER_RMUL`
pub fn scalarinner_rmul() -> @kernel.Thm {
  scalarinner_rmul_c.get()
}

///|
/// SCALARINNER_LNEG
fn step_176() -> Unit raise {
  let t653 = @drule.match_mp(@vectors.bilinear_lneg())
  scalarinner_lneg_c.set(t653(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_LNEG")

///|
/// `SCALARINNER_LNEG`
pub fn scalarinner_lneg() -> @kernel.Thm {
  scalarinner_lneg_c.get()
}

///|
/// SCALARINNER_RNEG
fn step_177() -> Unit raise {
  let t654 = @drule.match_mp(@vectors.bilinear_rneg())
  scalarinner_rneg_c.set(t654(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_RNEG")

///|
/// `SCALARINNER_RNEG`
pub fn scalarinner_rneg() -> @kernel.Thm {
  scalarinner_rneg_c.get()
}

///|
/// SCALARINNER_LZERO
fn step_178() -> Unit raise {
  let t655 = @drule.match_mp(@vectors.bilinear_lzero())
  scalarinner_lzero_c.set(t655(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_LZERO")

///|
/// `SCALARINNER_LZERO`
pub fn scalarinner_lzero() -> @kernel.Thm {
  scalarinner_lzero_c.get()
}

///|
/// SCALARINNER_RZERO
fn step_179() -> Unit raise {
  let t656 = @drule.match_mp(@vectors.bilinear_rzero())
  scalarinner_rzero_c.set(t656(@bool.spec_all(bilinear_scalarinner())))
}

///|
let scalarinner_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALARINNER_RZERO")

///|
/// `SCALARINNER_RZERO`
pub fn scalarinner_rzero() -> @kernel.Thm {
  scalarinner_rzero_c.get()
}

///|
/// PRODUCTGA_MVBASIS
fn step_180() -> Unit raise {
  let t677 = @simp.asm_rewrite_tac(@list.List([]))
  let t676 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET((t : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"))
  let t675 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id(), @vectors.vsum_delta(), @sets.in_elim_thm(), @vectors.vsum_0()]))
  let t674 = @simp.gen_rewrite_tac(fn(x673 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x667 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s668 = @equal.land_conv(x667)
      fn(x669 : @kernel.Term) -> @kernel.Thm raise {
        s668(x669)
      }
    })((fn(x670 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s671 = @equal.once_depth_conv(x670)
      fn(x672 : @kernel.Term) -> @kernel.Thm raise {
        s671(x672)
      }
    })(x673))
  }, @list.List([@class.cond_rator()]))
  let t678 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x666 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x660 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s661 = @equal.land_conv(x660)
      fn(x662 : @kernel.Term) -> @kernel.Thm raise {
        s661(x662)
      }
    })((fn(x663 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s664 = @equal.once_depth_conv(x663)
      fn(x665 : @kernel.Term) -> @kernel.Thm raise {
        s664(x665)
      }
    })(x666))
  }, @list.List([@class.cond_rand()])), t674), t675), t676), t677))
  let t659 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * ((if (p : Bool) { real_of_num(1) } else { real_of_num(0) }) * (if (q : Bool) { real_of_num(1) } else { real_of_num(0) })) == (if q { if p { x } else { real_of_num(0) } } else { real_of_num(0) })"))]))
  let t658 = @simp.simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t657 = @simp.rewrite_tac(@list.List([productga_def()]))
  let t679 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t657), t658), t659), t678)
  productga_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((sgn : ((Num) -> Bool, (Num) -> Bool) -> Real), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(sgn(s, t), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(SYMDIFF(s, t))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t679))
}

///|
let productga_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_MVBASIS")

///|
/// `PRODUCTGA_MVBASIS`
pub fn productga_mvbasis() -> @kernel.Thm {
  productga_mvbasis_c.get()
}

///|
/// PRODUCTGA_MVBASIS_SING
fn step_181() -> Unit raise {
  let t680 = @simp.rewrite_tac(@list.List([productga_mvbasis(), @sets.set_rule(@term_syntax.parse_term("SUBSET({(x : _)}, (s : (_) -> Bool)) == IN(x, s)"))]))
  productga_mvbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (Productga : (((Num) -> Bool, (Num) -> Bool) -> Real, Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((sgn : ((Num) -> Bool, (Num) -> Bool) -> Real), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j})) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(sgn({i}, {j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(SYMDIFF({i}, {j}))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t680))
}

///|
let productga_mvbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCTGA_MVBASIS_SING")

///|
/// `PRODUCTGA_MVBASIS_SING`
pub fn productga_mvbasis_sing() -> @kernel.Thm {
  productga_mvbasis_sing_c.get()
}

///|
/// GEOM_MVBASIS
fn step_182() -> Unit raise {
  let t685 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t684 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))
  let t683 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac))
  let t682 = @simp.asm_rewrite_tac(@list.List([]))
  let t681 = @simp.rewrite_tac(@list.List([geomga_mul(), productga_mvbasis()]))
  let t686 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t681), @class.cond_cases_tac), t682), t683), @tactics.ap_term_tac), @tactics.ap_term_tac), t684), t685)
  geom_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) == (if SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(pow(-real_of_num(1), CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i > j})) * (pow(-real_of_num(1), CARD(INTER(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), INTER(s, t)))) * pow(real_of_num(0), CARD(INTER(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), INTER(s, t))))), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(SYMDIFF(s, t))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t686))
}

///|
let geom_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS")

///|
/// `GEOM_MVBASIS`
pub fn geom_mvbasis() -> @kernel.Thm {
  geom_mvbasis_c.get()
}

///|
/// INNER_MVBASIS
fn step_183() -> Unit raise {
  let t692 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t691 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))
  let t690 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac))
  let t689 = @simp.asm_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!((s : (_) -> Bool) == {}) && !((t : (_) -> Bool) == {}) && (SUBSET(s, t) || SUBSET(t, s))) == !(s == {} || t == {} || !SUBSET(s, t) && !SUBSET(t, s))")), @vectors.vector_mul_lzero()]))
  let t688 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t687 = @simp.rewrite_tac(@list.List([innerga(), productga_mvbasis()]))
  let t693 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t687), @class.cond_cases_tac), t688), @class.cond_cases_tac), t689), t690), @tactics.ap_term_tac), @tactics.ap_term_tac), t691), t692)
  inner_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && !(s == {}) && !(t == {}) && (SUBSET(s, t) || SUBSET(t, s)) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(pow(-real_of_num(1), CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i > j})) * (pow(-real_of_num(1), CARD(INTER(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), INTER(s, t)))) * pow(real_of_num(0), CARD(INTER(op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + 1), (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), INTER(s, t))))), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(SYMDIFF(s, t))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t693))
}

///|
let inner_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_MVBASIS")

///|
/// `INNER_MVBASIS`
pub fn inner_mvbasis() -> @kernel.Thm {
  inner_mvbasis_c.get()
}

///|
/// GEOM_MVBASIS_SING
fn step_184() -> Unit raise {
  let t885 = @meson.asm_meson_tac(@list.List([@arith.not_le(), @arith.lt_suc_le(), @arith.add1(), @arith.add_assoc(), @int.arith_rule(@term_syntax.parse_term("(j : Num) <= (p : Num) → j < p + ((q : Num) + 1)"))]))
  let t884 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.card_sing(), @iterate.in_numseg(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_sing()]))
  let t874 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t875 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t876 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t877 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t873 = @simp.rewrite_tac(@list.List([@sets.card_sing()]))
  let t878 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x872 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x866 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s867 = @equal.rand_conv(x866)
      fn(x868 : @kernel.Term) -> @kernel.Thm raise {
        s867(x868)
      }
    })((fn(x869 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s870 = @equal.once_depth_conv(x869)
      fn(x871 : @kernel.Term) -> @kernel.Thm raise {
        s870(x871)
      }
    })(x872))
  }, @list.List([@equal.gsym(@tactics.prove(@term_syntax.parse_term("CARD({(j : Num)}) == 1"), t873))])), @tactics.ap_term_tac)
  let t879 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t880 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t865 = @simp.rewrite_tac(@list.List([@sets.card_sing()]))
  let t881 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x864 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x858 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s859 = @equal.rand_conv(x858)
      fn(x860 : @kernel.Term) -> @kernel.Thm raise {
        s859(x860)
      }
    })((fn(x861 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s862 = @equal.once_depth_conv(x861)
      fn(x863 : @kernel.Term) -> @kernel.Thm raise {
        s862(x863)
      }
    })(x864))
  }, @list.List([@equal.gsym(@tactics.prove(@term_syntax.parse_term("CARD({(j : Num)}) == 1"), t865))])), @tactics.ap_term_tac)
  let t882 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t883 = @list.List([@simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()])), t882, t881, t880, t879, t878, t877, t876, t875, t874])
  let t848 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t849 = @simp.gen_rewrite_tac(fn(x847 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x841 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s842 = @equal.rand_conv(x841)
      fn(x843 : @kernel.Term) -> @kernel.Thm raise {
        s842(x843)
      }
    })((fn(x844 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s845 = @equal.once_depth_conv(x844)
      fn(x846 : @kernel.Term) -> @kernel.Thm raise {
        s845(x846)
      }
    })(x847))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))]))
  let t850 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t851 = @simp.gen_rewrite_tac(fn(x840 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x834 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s835 = @equal.rand_conv(x834)
      fn(x836 : @kernel.Term) -> @kernel.Thm raise {
        s835(x836)
      }
    })((fn(x837 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s838 = @equal.once_depth_conv(x837)
      fn(x839 : @kernel.Term) -> @kernel.Thm raise {
        s838(x839)
      }
    })(x840))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))]))
  let t852 = @simp.gen_rewrite_tac(fn(x833 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x827 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s828 = @equal.rand_conv(x827)
      fn(x829 : @kernel.Term) -> @kernel.Thm raise {
        s828(x829)
      }
    })((fn(x830 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s831 = @equal.once_depth_conv(x830)
      fn(x832 : @kernel.Term) -> @kernel.Thm raise {
        s831(x832)
      }
    })(x833))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 1) == real_of_num(0)")))]))
  let t853 = @simp.gen_rewrite_tac(fn(x826 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x820 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s821 = @equal.rand_conv(x820)
      fn(x822 : @kernel.Term) -> @kernel.Thm raise {
        s821(x822)
      }
    })((fn(x823 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s824 = @equal.once_depth_conv(x823)
      fn(x825 : @kernel.Term) -> @kernel.Thm raise {
        s824(x825)
      }
    })(x826))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))]))
  let t854 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t855 = @simp.gen_rewrite_tac(fn(x819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s814 = @equal.rand_conv(x813)
      fn(x815 : @kernel.Term) -> @kernel.Thm raise {
        s814(x815)
      }
    })((fn(x816 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s817 = @equal.once_depth_conv(x816)
      fn(x818 : @kernel.Term) -> @kernel.Thm raise {
        s817(x818)
      }
    })(x819))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 1) == -real_of_num(1)")))]))
  let t856 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t857 = @list.List([@simp.gen_rewrite_tac(fn(x812 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x806 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s807 = @equal.rand_conv(x806)
      fn(x808 : @kernel.Term) -> @kernel.Thm raise {
        s807(x808)
      }
    })((fn(x809 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s810 = @equal.once_depth_conv(x809)
      fn(x811 : @kernel.Term) -> @kernel.Thm raise {
        s810(x811)
      }
    })(x812))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))])), t856, t855, t854, t853, t852, t851, t850, t849, t848])
  let t800 = @simp.gen_rewrite_tac(fn(x799 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x793 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s794 = @equal.rand_conv(x793)
      fn(x795 : @kernel.Term) -> @kernel.Thm raise {
        s794(x795)
      }
    })((fn(x796 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s797 = @equal.once_depth_conv(x796)
      fn(x798 : @kernel.Term) -> @kernel.Thm raise {
        s797(x798)
      }
    })(x799))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t801 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x792 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x786 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s787 = @equal.rand_conv(x786)
      fn(x788 : @kernel.Term) -> @kernel.Thm raise {
        s787(x788)
      }
    })((fn(x789 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s790 = @equal.once_depth_conv(x789)
      fn(x791 : @kernel.Term) -> @kernel.Thm raise {
        s790(x791)
      }
    })(x792))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())])), @tactics.ap_term_tac), t800)
  let t802 = @simp.gen_rewrite_tac(fn(x785 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x779 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s780 = @equal.rand_conv(x779)
      fn(x781 : @kernel.Term) -> @kernel.Thm raise {
        s780(x781)
      }
    })((fn(x782 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s783 = @equal.once_depth_conv(x782)
      fn(x784 : @kernel.Term) -> @kernel.Thm raise {
        s783(x784)
      }
    })(x785))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t803 = @simp.gen_rewrite_tac(fn(x778 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x772 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s773 = @equal.rand_conv(x772)
      fn(x774 : @kernel.Term) -> @kernel.Thm raise {
        s773(x774)
      }
    })((fn(x775 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s776 = @equal.once_depth_conv(x775)
      fn(x777 : @kernel.Term) -> @kernel.Thm raise {
        s776(x777)
      }
    })(x778))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t804 = @simp.gen_rewrite_tac(fn(x771 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x765 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s766 = @equal.rand_conv(x765)
      fn(x767 : @kernel.Term) -> @kernel.Thm raise {
        s766(x767)
      }
    })((fn(x768 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s769 = @equal.once_depth_conv(x768)
      fn(x770 : @kernel.Term) -> @kernel.Thm raise {
        s769(x770)
      }
    })(x771))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t805 = @list.List([@simp.gen_rewrite_tac(fn(x764 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x758 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s759 = @equal.rand_conv(x758)
      fn(x760 : @kernel.Term) -> @kernel.Thm raise {
        s759(x760)
      }
    })((fn(x761 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s762 = @equal.once_depth_conv(x761)
      fn(x763 : @kernel.Term) -> @kernel.Thm raise {
        s762(x763)
      }
    })(x764))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())])), t804, t803, t802, t801])
  let t752 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rneg(), @equal.gsym(@vectors.vector_mul_lneg())]))
  let t753 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x751 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x745 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s746 = @equal.rand_conv(x745)
      fn(x747 : @kernel.Term) -> @kernel.Thm raise {
        s746(x747)
      }
    })((fn(x748 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s749 = @equal.once_depth_conv(x748)
      fn(x750 : @kernel.Term) -> @kernel.Thm raise {
        s749(x750)
      }
    })(x751))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())])), t752)
  let t754 = @simp.gen_rewrite_tac(fn(x744 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x738 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s739 = @equal.rand_conv(x738)
      fn(x740 : @kernel.Term) -> @kernel.Thm raise {
        s739(x740)
      }
    })((fn(x741 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s742 = @equal.once_depth_conv(x741)
      fn(x743 : @kernel.Term) -> @kernel.Thm raise {
        s742(x743)
      }
    })(x744))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())]))
  let t755 = @simp.gen_rewrite_tac(fn(x737 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x731 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s732 = @equal.rand_conv(x731)
      fn(x733 : @kernel.Term) -> @kernel.Thm raise {
        s732(x733)
      }
    })((fn(x734 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s735 = @equal.once_depth_conv(x734)
      fn(x736 : @kernel.Term) -> @kernel.Thm raise {
        s735(x736)
      }
    })(x737))
  }, @list.List([@equal.gsym(@bool.ispec(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({})"), @vectors.vector_mul_lzero()))]))
  let t730 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rneg(), @equal.gsym(@vectors.vector_mul_lneg())]))
  let t756 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x729 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x723 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s724 = @equal.rand_conv(x723)
      fn(x725 : @kernel.Term) -> @kernel.Thm raise {
        s724(x725)
      }
    })((fn(x726 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s727 = @equal.once_depth_conv(x726)
      fn(x728 : @kernel.Term) -> @kernel.Thm raise {
        s727(x728)
      }
    })(x729))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())])), t730)
  let t757 = @list.List([@simp.gen_rewrite_tac(fn(x722 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x716 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s717 = @equal.rand_conv(x716)
      fn(x718 : @kernel.Term) -> @kernel.Thm raise {
        s717(x718)
      }
    })((fn(x719 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s720 = @equal.once_depth_conv(x719)
      fn(x721 : @kernel.Term) -> @kernel.Thm raise {
        s720(x721)
      }
    })(x722))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())])), t756, t755, t754, t753])
  let t715 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.diff_eq_empty(), @sets.union_empty(), @sets.set_rule(@term_syntax.parse_term("!((i : _) == (j : _)) → UNION(DIFF({i}, {j}), DIFF({j}, {i})) == {i, j}"))]))
  let t714 = @list.List([@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @class.cond_cases_tac])), @tactics.all_tac, @tactics.all_tac])
  let t712 = @calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 1) == -real_of_num(1)"))
  let t713 = @simp.asm_rewrite_tac(@list.List([@sets.card_sing(), @equal.gsym(@arith.one()), @sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid(), t712]))
  let t710 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) < (j : Num)"))
  let t708 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → (j < i) == !(i < j)")))
  let t711 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.first_assum(fn(x709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s706 = @tactics.subst1_tac(x705)
      fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s706(x707)
      }
    })(t708(x709))
  }), t710)])
  let t704 = @simp.asm_rewrite_tac(@list.List([@arith.gt(), @arith.lt_refl()]))
  let t703 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t701 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t700 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @sets.not_in_empty(), @pair.pair_eq()]))
  let t702 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing()])), @class.cond_cases_tac), t700), t701), @tactics.all_tac])
  let t699 = @tactics.subgoal_then(@term_syntax.parse_term("{((i' : Num), (j' : Num)) | (1 <= i' && i' <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))) && (1 <= j' && j' <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))) && i' == (i : Num) && j' == (j : Num) && i' > j'} == (if i > j { {(i, j)} } else { {} })"), fn(x696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s697 = @tactics.subst1_tac(x696)
    fn(x698 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s697(x698)
    }
  })
  let t695 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing()]))
  let t694 = @simp.rewrite_tac(@list.List([geomga_mul(), productga_mvbasis_sing(), @iterate.in_numseg()]))
  let t886 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t694), @class.cond_cases_tac), t695), t699), t702), t703), t704), t711), t713), t714), t715), t757), @tactics.ap_thm_tac), @tactics.ap_term_tac), t805), @tactics.binop_tac), t857), @tactics.ap_term_tac), t883), t884), t885)
  geom_mvbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) { if i == j { if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { if IN(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } } } else { if i < j { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i, j}) } else { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i, j}) } } } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t886))
}

///|
let geom_mvbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS_SING")

///|
/// `GEOM_MVBASIS_SING`
pub fn geom_mvbasis_sing() -> @kernel.Thm {
  geom_mvbasis_sing_c.get()
}

///|
/// INNER_MVBASIS_SING
fn step_185() -> Unit raise {
  let t1006 = @meson.asm_meson_tac(@list.List([@arith.not_le(), @arith.lt_suc_le(), @arith.add1(), @arith.add_assoc(), @int.arith_rule(@term_syntax.parse_term("(j : Num) <= (p : Num) → j < p + ((q : Num) + 1)"))]))
  let t1005 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.card_sing(), @iterate.in_numseg(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_sing()]))
  let t998 = @simp.rewrite_tac(@list.List([@sets.card_sing()]))
  let t999 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x997 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x991 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s992 = @equal.rand_conv(x991)
      fn(x993 : @kernel.Term) -> @kernel.Thm raise {
        s992(x993)
      }
    })((fn(x994 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s995 = @equal.once_depth_conv(x994)
      fn(x996 : @kernel.Term) -> @kernel.Thm raise {
        s995(x996)
      }
    })(x997))
  }, @list.List([@equal.gsym(@tactics.prove(@term_syntax.parse_term("CARD({(j : Num)}) == 1"), t998))])), @tactics.ap_term_tac)
  let t1000 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t1001 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t990 = @simp.rewrite_tac(@list.List([@sets.card_sing()]))
  let t1002 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x989 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x983 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s984 = @equal.rand_conv(x983)
      fn(x985 : @kernel.Term) -> @kernel.Thm raise {
        s984(x985)
      }
    })((fn(x986 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s987 = @equal.once_depth_conv(x986)
      fn(x988 : @kernel.Term) -> @kernel.Thm raise {
        s987(x988)
      }
    })(x989))
  }, @list.List([@equal.gsym(@tactics.prove(@term_syntax.parse_term("CARD({(j : Num)}) == 1"), t990))])), @tactics.ap_term_tac)
  let t1003 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()]))
  let t1004 = @list.List([@simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_inter(), @sets.card_eq_0()])), t1003, t1002, t1001, t1000, t999])
  let t977 = @simp.gen_rewrite_tac(fn(x976 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x970 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s971 = @equal.rand_conv(x970)
      fn(x972 : @kernel.Term) -> @kernel.Thm raise {
        s971(x972)
      }
    })((fn(x973 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s974 = @equal.once_depth_conv(x973)
      fn(x975 : @kernel.Term) -> @kernel.Thm raise {
        s974(x975)
      }
    })(x976))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 1) == real_of_num(0)")))]))
  let t978 = @simp.gen_rewrite_tac(fn(x969 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x963 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s964 = @equal.rand_conv(x963)
      fn(x965 : @kernel.Term) -> @kernel.Thm raise {
        s964(x965)
      }
    })((fn(x966 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s967 = @equal.once_depth_conv(x966)
      fn(x968 : @kernel.Term) -> @kernel.Thm raise {
        s967(x968)
      }
    })(x969))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))]))
  let t979 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t980 = @simp.gen_rewrite_tac(fn(x962 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x956 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s957 = @equal.rand_conv(x956)
      fn(x958 : @kernel.Term) -> @kernel.Thm raise {
        s957(x958)
      }
    })((fn(x959 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s960 = @equal.once_depth_conv(x959)
      fn(x961 : @kernel.Term) -> @kernel.Thm raise {
        s960(x961)
      }
    })(x962))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 1) == -real_of_num(1)")))]))
  let t981 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(0), 0) == real_of_num(1)")))]))
  let t982 = @list.List([@simp.gen_rewrite_tac(fn(x955 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x949 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s950 = @equal.rand_conv(x949)
      fn(x951 : @kernel.Term) -> @kernel.Thm raise {
        s950(x951)
      }
    })((fn(x952 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s953 = @equal.once_depth_conv(x952)
      fn(x954 : @kernel.Term) -> @kernel.Thm raise {
        s953(x954)
      }
    })(x955))
  }, @list.List([@equal.gsym(@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 0) == real_of_num(1)")))])), t981, t980, t979, t978, t977])
  let t946 = @simp.gen_rewrite_tac(fn(x945 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x939 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s940 = @equal.rand_conv(x939)
      fn(x941 : @kernel.Term) -> @kernel.Thm raise {
        s940(x941)
      }
    })((fn(x942 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s943 = @equal.once_depth_conv(x942)
      fn(x944 : @kernel.Term) -> @kernel.Thm raise {
        s943(x944)
      }
    })(x945))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t947 = @simp.gen_rewrite_tac(fn(x938 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x932 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s933 = @equal.rand_conv(x932)
      fn(x934 : @kernel.Term) -> @kernel.Thm raise {
        s933(x934)
      }
    })((fn(x935 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s936 = @equal.once_depth_conv(x935)
      fn(x937 : @kernel.Term) -> @kernel.Thm raise {
        s936(x937)
      }
    })(x938))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t948 = @list.List([@simp.gen_rewrite_tac(fn(x931 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x925 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s926 = @equal.rand_conv(x925)
      fn(x927 : @kernel.Term) -> @kernel.Thm raise {
        s926(x927)
      }
    })((fn(x928 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s929 = @equal.once_depth_conv(x928)
      fn(x930 : @kernel.Term) -> @kernel.Thm raise {
        s929(x930)
      }
    })(x931))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())])), t947, t946])
  let t922 = @simp.gen_rewrite_tac(fn(x921 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x915 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s916 = @equal.rand_conv(x915)
      fn(x917 : @kernel.Term) -> @kernel.Thm raise {
        s916(x917)
      }
    })((fn(x918 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s919 = @equal.once_depth_conv(x918)
      fn(x920 : @kernel.Term) -> @kernel.Thm raise {
        s919(x920)
      }
    })(x921))
  }, @list.List([@equal.gsym(@bool.ispec(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({})"), @vectors.vector_mul_lzero()))]))
  let t914 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rneg(), @equal.gsym(@vectors.vector_mul_lneg())]))
  let t923 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x913 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x907 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s908 = @equal.rand_conv(x907)
      fn(x909 : @kernel.Term) -> @kernel.Thm raise {
        s908(x909)
      }
    })((fn(x910 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s911 = @equal.once_depth_conv(x910)
      fn(x912 : @kernel.Term) -> @kernel.Thm raise {
        s911(x912)
      }
    })(x913))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())])), t914)
  let t924 = @list.List([@simp.gen_rewrite_tac(fn(x906 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x900 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s901 = @equal.rand_conv(x900)
      fn(x902 : @kernel.Term) -> @kernel.Thm raise {
        s901(x902)
      }
    })((fn(x903 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s904 = @equal.once_depth_conv(x903)
      fn(x905 : @kernel.Term) -> @kernel.Thm raise {
        s904(x905)
      }
    })(x906))
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())])), t923, t922])
  let t899 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.diff_eq_empty(), @sets.union_empty()]))
  let t898 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl(), @sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid()]))
  let t896 = @meson.meson_tac(@list.List([@arith.gt(), @arith.lt_refl()]))
  let t895 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty(), @pair.pair_eq()]))
  let t897 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()])), t895), t896), @tactics.all_tac])
  let t894 = @tactics.subgoal_then(@term_syntax.parse_term("{((i' : Num), (j' : Num)) | (((((1 <= i' && i' <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))) && 1 <= j') && j' <= (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))) && i' == (i : Num)) && j' == (j : Num)) && i' > j'} == {}"), fn(x891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s892 = @tactics.subst1_tac(x891)
    fn(x893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s892(x893)
    }
  })
  let t890 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([@sets.sing_subset(), @sets.in_sing(), @vectors.vector_mul_lzero()]))])
  let t889 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t888 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc(), @theorems.and_clauses(), @sets.in_sing(), @sets.set_rule(@term_syntax.parse_term("!({(i : _)} == {})"))]))
  let t887 = @simp.rewrite_tac(@list.List([innerga(), productga_mvbasis_sing(), @iterate.in_numseg()]))
  let t1007 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t887), @class.cond_cases_tac), t888), t889), t890), t894), t897), t898), @class.cond_cases_tac), @list.List([@tactics.all_tac, @class.cond_cases_tac])), t899), t924), @tactics.ap_thm_tac), @tactics.ap_term_tac), t948), @tactics.binop_tac), t982), @tactics.ap_term_tac), t1004), t1005), t1006)
  inner_mvbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j})) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && i == j { if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { if IN(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } } } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t1007))
}

///|
let inner_mvbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_MVBASIS_SING")

///|
/// `INNER_MVBASIS_SING`
pub fn inner_mvbasis_sing() -> @kernel.Thm {
  inner_mvbasis_sing_c.get()
}

///|
/// OUTER_MVBASIS
fn step_186() -> Unit raise {
  let t1013 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t1012 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))
  let t1011 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(DIFF(s, t), DIFF(t, s)) == UNION(s, t)"))]))
  let t1010 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id()]))
  let t1009 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"))
  let t1008 = @simp.rewrite_tac(@list.List([outerga(), productga_mvbasis()]))
  let t1014 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1008), t1009), t1010), @class.cond_cases_tac), t1011), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1012), t1013)
  outer_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if SUBSET(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && SUBSET(t, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && INTER(s, t) == {} { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(pow(-real_of_num(1), CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i > j})), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(UNION(s, t))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t1014))
}

///|
let outer_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS")

///|
/// `OUTER_MVBASIS`
pub fn outer_mvbasis() -> @kernel.Thm {
  outer_mvbasis_c.get()
}

///|
/// OUTER_MVBASIS_SING
fn step_187() -> Unit raise {
  let t1036 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t1035 = @simp.asm_rewrite_tac(@list.List([]))
  let t1034 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) < (j : Num)"))
  let t1031 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → (j < i) == !(i < j)")))
  let t1033 = @tactics.first_assum(fn(x1032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1029 = @tactics.subst1_tac(x1028)
      fn(x1030 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1029(x1030)
      }
    })(t1031(x1032))
  })
  let t1027 = @simp.asm_simp_tac(@list.List([@arith.gt(), symdiff(), @sets.set_rule(@term_syntax.parse_term("!((i : _) == (j : _)) → UNION(DIFF({i}, {j}), DIFF({j}, {i})) == {i, j}"))]))
  let t1025 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t1024 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @sets.not_in_empty(), @pair.pair_eq()]))
  let t1026 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing()])), @class.cond_cases_tac), t1024), t1025), @tactics.all_tac])
  let t1023 = @tactics.subgoal_then(@term_syntax.parse_term("{((i' : Num), (j' : Num)) | IN(i', op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j', op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && i' == (i : Num) && j' == (j : Num) && i' > j'} == (if i > j { {(i, j)} } else { {} })"), fn(x1020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1021 = @tactics.subst1_tac(x1020)
    fn(x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1021(x1022)
    }
  })
  let t1019 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing()]))
  let t1018 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @class.cond_id()]))
  let t1017 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t1016 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER({(i : _)}, {(j : _)}) == {}) == !(i == j)"))]))
  let t1015 = @simp.rewrite_tac(@list.List([outerga(), productga_mvbasis_sing()]))
  let t1037 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1015), t1016), t1017), t1018), @class.cond_cases_tac), t1019), t1023), t1026), t1027), t1033), t1034), t1035), t1036), @vectors.vector_arith_tac)
  outer_mvbasis_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j})) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && !(i == j) { if i < j { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i, j}) } else { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i, j}) } } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t1037))
}

///|
let outer_mvbasis_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_SING")

///|
/// `OUTER_MVBASIS_SING`
pub fn outer_mvbasis_sing() -> @kernel.Thm {
  outer_mvbasis_sing_c.get()
}

///|
/// GEOM_OUTER_MVBASIS_EQ
fn step_188() -> Unit raise {
  let t1039 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(DIFF(s, t), DIFF(t, s)) == UNION(s, t)"))]))
  let t1038 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis(), outer_mvbasis(), @sets.inter_empty(), @sets.card_clauses(), @realax.real_pow(), @realarith.real_mul_rid()]))
  let t1040 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1038), t1039)
  geom_outer_mvbasis_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, INTER(s, t) == {} → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) == (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t))"), t1040))
}

///|
let geom_outer_mvbasis_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_OUTER_MVBASIS_EQ")

///|
/// `GEOM_OUTER_MVBASIS_EQ`
pub fn geom_outer_mvbasis_eq() -> @kernel.Thm {
  geom_outer_mvbasis_eq_c.get()
}

///|
/// MVBASIS_OUTER_GEOM
fn step_189() -> Unit raise {
  let t1042 = @simp.asm_simp_tac(@list.List([symdiff(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(DIFF(s, t), DIFF(t, s)) == UNION(s, t)"))]))
  let t1041 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis(), outer_mvbasis(), @sets.inter_empty(), @sets.card_clauses(), @realax.real_pow(), @realarith.real_mul_rid()]))
  let t1043 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t1041), t1042)
  mvbasis_outer_geom_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if INTER(s, t) == {} { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t1043))
}

///|
let mvbasis_outer_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_OUTER_GEOM")

///|
/// `MVBASIS_OUTER_GEOM`
pub fn mvbasis_outer_geom() -> @kernel.Thm {
  mvbasis_outer_geom_c.get()
}

///|
/// MVBASIS_INNER_GEOM
fn step_190() -> Unit raise {
  let t1045 = @meson.asm_meson_tac(@list.List([]))
  let t1044 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis(), inner_mvbasis()]))
  let t1046 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t1044), t1045)
  mvbasis_inner_geom_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) == (if !(s == {}) && !(t == {}) && (SUBSET(s, t) || SUBSET(t, s)) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t1046))
}

///|
let mvbasis_inner_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_INNER_GEOM")

///|
/// `MVBASIS_INNER_GEOM`
pub fn mvbasis_inner_geom() -> @kernel.Thm {
  mvbasis_inner_geom_c.get()
}

///|
/// OUTER_GEOM_MVBASIS_LASSOC
fn step_191() -> Unit raise {
  let t1082 = @tactics.asm_tac(@sets.set_tac)(@list.List([finite_cart_subset_lemma1()]))
  let t1081 = @tactics.exists_tac(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && i > j}"))
  let t1080 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1077 = @tactics.conv_tac(@class.taut)
  let t1078 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_union(), @sets.in_diff()])), t1077)]))
  let t1076 = @tactics.conv_tac(@class.taut)
  let t1079 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_union(), @sets.in_diff()])), t1076)])), @tactics.all_tac, t1078])
  let t1075 = @tactics.match_mp_tac(@clifford.symdiff_parity_lemma())
  let t1073 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv))
  let t1074 = @list.List([@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) == ((y : Bool) == (z : Bool)) → ((a : Bool) == x) == (y == (z == a))"))), t1073])
  let t1063 = @simp.rewrite_tac(@list.List([@arith.even_add()]))
  let t1062 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), @calc_int.real_pow_neg(), @real.real_pow_one()]))
  let t1059 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1060 = @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t1059)
  let t1058 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1061 = @list.List([@tactics.thenl(@tactics.binop_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t1058)])), t1060])
  let t1057 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((c : Real) * (d : Real)) * (b : Real) == a * (b * (c * d))")), @realax.real_mul_assoc(), symdiff()]))
  let t1055 = @equal.gsym(symdiff())
  let t1056 = @simp.asm_simp_tac(@list.List([symdiff_subset(), @sets.set_rule(@term_syntax.parse_term("INTER((t : (_) -> Bool), (u : (_) -> Bool)) == {} → UNION(t, u) == UNION(DIFF(t, u), DIFF(u, t))")), t1055, symdiff_assoc(), @vectors.vector_mul_assoc(), @vectors.vector_mul_rzero(), geomga_rzero(), outerga_lzero()]))
  let t1052 = @sets.set_tac(@list.List([]))
  let t1053 = @tactics.then_tac(@simp.rewrite_tac(@list.List([symdiff()])), t1052)
  let t1054 = @tactics.assume_tac(@tactics.prove(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (u : (_) -> Bool)) == {} → INTER((t : (_) -> Bool), u) == {} → INTER(SYMDIFF(s, t), u) == {}) && (INTER(s, u) == {} → !(INTER(t, u) == {}) → !(INTER(SYMDIFF(s, t), u) == {}))"), t1053))
  let t1051 = @simp.asm_rewrite_tac(@list.List([outer_mvbasis(), geom_mvbasis(), outerga_lmul(), geomga_rmul(), @sets.union_subset()]))
  let t1050 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((t : (Num) -> Bool), (u : (Num) -> Bool)) == {}"))
  let t1047 = @term_syntax.parse_term("SUBSET((u : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))")
  let t1048 = @term_syntax.parse_term("SUBSET((t : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))")
  let t1049 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"), t1048, t1047]))
  let t1083 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1049), t1050), t1051), t1054), t1056), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1057), @tactics.binop_tac), t1061), t1062), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1063), fn(x1072 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1064 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x1064
      let tu = @lib.funpow(2, @equal.lhand, w)
      let t1066 = @term_syntax.parse_term("(t : (Num) -> Bool)")
      let su = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(s : (Num) -> Bool)"), t1066)]), tu)
      let t1067 = @term_syntax.parse_term("(u : (Num) -> Bool)")
      let st = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(t : (Num) -> Bool)"), t1067)]), su)
      let t1071 = @tactics.exists_tac(@lib.end_itlist((x1069 : @kernel.Term, x1070 : @kernel.Term) => @lib.curry(fn(x1068 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @basics.mk_eq(x1068.0, x1068.1)
      }, x1069, x1070), @list.List([st, su, tu])))
      @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1071)
    })(x1072)(x1072)
  }), @tactics.conj_tac), t1074), t1075), @tactics.conj_tac), t1079), t1080), t1081), t1082)
  outer_geom_mvbasis_lassoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ u : (Num) -> Bool, INTER(s, u) == {} → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(u)) == (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(u))"), t1083))
}

///|
let outer_geom_mvbasis_lassoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_GEOM_MVBASIS_LASSOC")

///|
/// `OUTER_GEOM_MVBASIS_LASSOC`
pub fn outer_geom_mvbasis_lassoc() -> @kernel.Thm {
  outer_geom_mvbasis_lassoc_c.get()
}

///|
/// OUTER_GEOM_MVBASIS_RASSOC
fn step_192() -> Unit raise {
  let t1119 = @tactics.asm_tac(@sets.set_tac)(@list.List([finite_cart_subset_lemma1()]))
  let t1118 = @tactics.exists_tac(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && i > j}"))
  let t1117 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1114 = @tactics.conv_tac(@class.taut)
  let t1115 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_union(), @sets.in_diff()])), t1114)]))
  let t1113 = @tactics.conv_tac(@class.taut)
  let t1116 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_union(), @sets.in_diff()])), t1113)])), @tactics.all_tac, t1115])
  let t1112 = @tactics.match_mp_tac(@clifford.symdiff_parity_lemma())
  let t1110 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv))
  let t1111 = @list.List([@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) == ((y : Bool) == (z : Bool)) → ((a : Bool) == x) == (y == (z == a))"))), t1110])
  let t1100 = @simp.rewrite_tac(@list.List([@arith.even_add()]))
  let t1099 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), @calc_int.real_pow_neg(), @real.real_pow_one()]))
  let t1096 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1097 = @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t1096)
  let t1095 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1098 = @list.List([@tactics.thenl(@tactics.binop_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t1095)])), t1097])
  let t1094 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((c : Real) * (d : Real)) * (b : Real) == a * (b * (c * d))")), @realax.real_mul_assoc(), symdiff()]))
  let t1092 = @equal.gsym(symdiff())
  let t1093 = @simp.asm_simp_tac(@list.List([symdiff_subset(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → UNION(s, t) == UNION(DIFF(s, t), DIFF(t, s))")), t1092, symdiff_assoc(), @vectors.vector_mul_assoc(), @vectors.vector_mul_rzero(), geomga_lzero(), outerga_rzero()]))
  let t1089 = @sets.set_tac(@list.List([]))
  let t1090 = @tactics.then_tac(@simp.rewrite_tac(@list.List([symdiff()])), t1089)
  let t1091 = @tactics.assume_tac(@tactics.prove(@term_syntax.parse_term("(INTER((s : (_) -> Bool), (u : (_) -> Bool)) == {} → INTER(s, (t : (_) -> Bool)) == {} → INTER(s, SYMDIFF(t, u)) == {}) && (INTER(s, u) == {} → !(INTER(s, t) == {}) → !(INTER(s, SYMDIFF(t, u)) == {}))"), t1090))
  let t1088 = @simp.asm_rewrite_tac(@list.List([outer_mvbasis(), geom_mvbasis(), outerga_rmul(), geomga_lmul(), @sets.union_subset()]))
  let t1087 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((s : (Num) -> Bool), (t : (Num) -> Bool)) == {}"))
  let t1084 = @term_syntax.parse_term("SUBSET((u : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))")
  let t1085 = @term_syntax.parse_term("SUBSET((t : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))")
  let t1086 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))"), t1085, t1084]))
  let t1120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1086), t1087), t1088), t1091), t1093), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1094), @tactics.binop_tac), t1098), t1099), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1100), fn(x1109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x1101
      let st = @lib.funpow(2, @equal.lhand, w)
      let t1103 = @term_syntax.parse_term("(t : (Num) -> Bool)")
      let su = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(u : (Num) -> Bool)"), t1103)]), st)
      let t1104 = @term_syntax.parse_term("(s : (Num) -> Bool)")
      let tu = @kernel.vsubst(@list.List([(@term_syntax.parse_term("(t : (Num) -> Bool)"), t1104)]), su)
      let t1108 = @tactics.exists_tac(@lib.end_itlist((x1106 : @kernel.Term, x1107 : @kernel.Term) => @lib.curry(fn(x1105 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @basics.mk_eq(x1105.0, x1105.1)
      }, x1106, x1107), @list.List([tu, su, st])))
      @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1108)
    })(x1109)(x1109)
  }), @tactics.conj_tac), t1111), t1112), @tactics.conj_tac), t1116), t1117), t1118), t1119)
  outer_geom_mvbasis_rassoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ u : (Num) -> Bool, INTER(s, u) == {} → (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t)) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(u) == (outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(t) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(u))"), t1120))
}

///|
let outer_geom_mvbasis_rassoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_GEOM_MVBASIS_RASSOC")

///|
/// `OUTER_GEOM_MVBASIS_RASSOC`
pub fn outer_geom_mvbasis_rassoc() -> @kernel.Thm {
  outer_geom_mvbasis_rassoc_c.get()
}

///|
/// OUTER_MVBASIS_SKEWSYM
fn step_193() -> Unit raise {
  let t1130 = @sets.set_tac(@list.List([]))
  let t1129 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t1128 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_neg(), @vectors.vector_neg_0()]))
  let t1127 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t1124 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → i < j && !(j < i) || j < i && !(i < j)")))
  let t1126 = @tactics.first_assum(fn(x1125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1124(x1125))
  })
  let t1123 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_0()]))
  let t1122 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t1121 = @simp.rewrite_tac(@list.List([outer_mvbasis_sing()]))
  let t1131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1121), t1122), t1123), t1126), t1127), @class.cond_cases_tac), t1128), t1129), t1130)
  outer_mvbasis_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j})) == -(outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}))"), t1131))
}

///|
let outer_mvbasis_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_SKEWSYM")

///|
/// `OUTER_MVBASIS_SKEWSYM`
pub fn outer_mvbasis_skewsym() -> @kernel.Thm {
  outer_mvbasis_skewsym_c.get()
}

///|
/// OUTER_MVBASIS_REFL
fn step_194() -> Unit raise {
  let t1132 = @tactics.match_accept_tac(outer_mvbasis_skewsym())
  let t1133 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@vectors.vector_arith(@term_syntax.parse_term("∀ x : Cart[Real, N], x == -x → x == vec(0)")))), t1132)
  outer_mvbasis_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i})) == (vec : (Num) -> Cart[Real, Geomalg[_, _, _]])(0)"), t1133))
}

///|
let outer_mvbasis_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_REFL")

///|
/// `OUTER_MVBASIS_REFL`
pub fn outer_mvbasis_refl() -> @kernel.Thm {
  outer_mvbasis_refl_c.get()
}

///|
/// OUTER_MVBASIS_LSCALAR
fn step_195() -> Unit raise {
  let t1137 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  let t1136 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"))]))
  let t1135 = @simp.simp_tac(@list.List([outer_mvbasis(), @sets.empty_subset(), @sets.inter_empty(), @sets.union_empty()]))
  let t1134 = @simp.simp_tac(@list.List([outerga_rmul(), outerga_radd()]))
  let t1138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mvbasis_extension()), t1134), t1135), t1136), t1137)
  outer_mvbasis_lscalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], outer(mbasis({}), x) == x"), t1138))
}

///|
let outer_mvbasis_lscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_LSCALAR")

///|
/// `OUTER_MVBASIS_LSCALAR`
pub fn outer_mvbasis_lscalar() -> @kernel.Thm {
  outer_mvbasis_lscalar_c.get()
}

///|
/// OUTER_MVBASIS_RSCALAR
fn step_196() -> Unit raise {
  let t1142 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  let t1141 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, (s : (Num) -> Bool)) && IN(j, {}) && i > j} == {}"))]))
  let t1140 = @simp.simp_tac(@list.List([outer_mvbasis(), @sets.empty_subset(), @sets.inter_empty(), @sets.union_empty()]))
  let t1139 = @simp.simp_tac(@list.List([outerga_lmul(), outerga_ladd()]))
  let t1143 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mvbasis_extension()), t1139), t1140), t1141), t1142)
  outer_mvbasis_rscalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], outer(x, mbasis({})) == x"), t1143))
}

///|
let outer_mvbasis_rscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_RSCALAR")

///|
/// `OUTER_MVBASIS_RSCALAR`
pub fn outer_mvbasis_rscalar() -> @kernel.Thm {
  outer_mvbasis_rscalar_c.get()
}

///|
/// OUTER_MVBASIS_SING_EQ_0
fn step_197() -> Unit raise {
  let t1148 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t1147 = @tactics.match_mp_tac(mvbasis_nonzero())
  let t1146 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_eq_0()]))
  let t1145 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t1144 = @simp.rewrite_tac(@list.List([outer_mvbasis_sing()]))
  let t1149 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1144), t1145), t1146), t1147), t1148)
  outer_mvbasis_sing_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, ((outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j})) == (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0)) == !(IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && IN(j, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && !(i == j))"), t1149))
}

///|
let outer_mvbasis_sing_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_MVBASIS_SING_EQ_0")

///|
/// `OUTER_MVBASIS_SING_EQ_0`
pub fn outer_mvbasis_sing_eq_0() -> @kernel.Thm {
  outer_mvbasis_sing_eq_0_c.get()
}

///|
/// MVBASIS_SPLIT
fn step_198() -> Unit raise {
  let t1163 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) < (m : Num) && n > m)"))]))
  let t1162 = @simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_sing(), @sets.not_in_empty()]))
  let t1161 = @tactics.subgoal_then(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {(a : Num)}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"), fn(x1159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1159
    @simp.simp_tac(@list.List([th, @sets.card_clauses(), @realax.real_pow(), @vectors.vector_mul_lid()]))
  })
  let t1158 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION({(a : _)}, (s : (_) -> Bool)) == INSERT(a, s)"))]))
  let t1157 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([mvbasis_eq_0()]))])
  let t1156 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(SUBSET({(a : _)}, (t : (_) -> Bool)) && SUBSET((s : (_) -> Bool), t)) == SUBSET(INSERT(a, s), t)"))]))
  let t1155 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([@arith.lt_refl()])), @tactics.all_tac])
  let t1154 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(a : Num)}, (s : (Num) -> Bool)) == {}"), fn(x1151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1152 = @tactics.subst1_tac(x1151)
    fn(x1153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1152(x1153)
    }
  })
  let t1150 = @simp.rewrite_tac(@list.List([outer_mvbasis()]))
  let t1164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1150), t1154), t1155), t1156), @class.cond_cases_tac), t1157), t1158), t1161), t1162), t1163)
  mvbasis_split_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ s : (Num) -> Bool, (∀ x : Num, IN(x, s) → a < x) → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(INSERT(a, s)) == (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({a}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(s))"), t1164))
}

///|
let mvbasis_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_SPLIT")

///|
/// `MVBASIS_SPLIT`
pub fn mvbasis_split() -> @kernel.Thm {
  mvbasis_split_c.get()
}

///|
/// GEOM_MVBASIS_SKEWSYM
fn step_199() -> Unit raise {
  let t1172 = @sets.set_tac(@list.List([]))
  let t1171 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t1170 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_neg(), @vectors.vector_neg_0()]))
  let t1169 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t1166 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) → i < j && !(j < i) || j < i && !(i < j)")))
  let t1168 = @tactics.first_assum(fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1166(x1167))
  })
  let t1165 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis_sing()]))
  let t1173 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t1165), t1168), t1169), @class.cond_cases_tac), t1170), t1171), t1172)
  geom_mvbasis_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}) == (if i == j { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}) } else { -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i})) })"), t1173))
}

///|
let geom_mvbasis_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS_SKEWSYM")

///|
/// `GEOM_MVBASIS_SKEWSYM`
pub fn geom_mvbasis_skewsym() -> @kernel.Thm {
  geom_mvbasis_skewsym_c.get()
}

///|
/// GEOM_MVBASIS_REFL
fn step_200() -> Unit raise {
  let t1178 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1177 = @tactics.pop_assum(fn(x1174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1175 = @tactics.mp_tac(x1174)
    fn(x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1175(x1176)
    }
  })
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([geom_mvbasis_sing()]))), @class.cond_cases_tac), t1177), t1178), @int.arith_tac)
  geom_mvbasis_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { if IN(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } })"), t1179))
}

///|
let geom_mvbasis_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS_REFL")

///|
/// `GEOM_MVBASIS_REFL`
pub fn geom_mvbasis_refl() -> @kernel.Thm {
  geom_mvbasis_refl_c.get()
}

///|
/// GEOM_MVBASIS_LID
fn step_201() -> Unit raise {
  let t1183 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid(), @vectors.vector_mul_lid()]))
  let t1182 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, {}) && IN(j, (s : (Num) -> Bool)) && i > j} == {}"))]))
  let t1181 = @simp.simp_tac(@list.List([geom_mvbasis(), symdiff_empty(), @sets.empty_subset(), @sets.inter_empty()]))
  let t1180 = @simp.simp_tac(@list.List([geomga_rmul(), geomga_radd()]))
  let t1184 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mvbasis_extension()), t1180), t1181), t1182), t1183)
  geom_mvbasis_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], mbasis({}) * x == x"), t1184))
}

///|
let geom_mvbasis_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS_LID")

///|
/// `GEOM_MVBASIS_LID`
pub fn geom_mvbasis_lid() -> @kernel.Thm {
  geom_mvbasis_lid_c.get()
}

///|
/// GEOM_MVBASIS_RID
fn step_202() -> Unit raise {
  let t1188 = @simp.rewrite_tac(@list.List([@sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid(), @vectors.vector_mul_lid()]))
  let t1187 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, (s : (Num) -> Bool)) && IN(j, {}) && i > j} == {}"))]))
  let t1186 = @simp.simp_tac(@list.List([geom_mvbasis(), symdiff_empty(), @sets.empty_subset(), @sets.inter_empty()]))
  let t1185 = @simp.simp_tac(@list.List([geomga_lmul(), geomga_ladd()]))
  let t1189 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mvbasis_extension()), t1185), t1186), t1187), t1188)
  geom_mvbasis_rid_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], x * mbasis({}) == x"), t1189))
}

///|
let geom_mvbasis_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_MVBASIS_RID")

///|
/// `GEOM_MVBASIS_RID`
pub fn geom_mvbasis_rid() -> @kernel.Thm {
  geom_mvbasis_rid_c.get()
}

///|
/// MVBASIS_SPLIT_GEOM
fn step_203() -> Unit raise {
  let t1195 = @simp.asm_simp_tac(@list.List([mvbasis_split(), geom_outer_mvbasis_eq()]))
  let t1194 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([@arith.lt_refl()])), @tactics.all_tac])
  let t1193 = @tactics.subgoal_then(@term_syntax.parse_term("INTER({(a : Num)}, (s : (Num) -> Bool)) == {}"), fn(x1190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1191 = @tactics.assume_tac(x1190)
    fn(x1192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1191(x1192)
    }
  })
  let t1196 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1193), t1194), t1195)
  mvbasis_split_geom_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ s : (Num) -> Bool, (∀ x : Num, IN(x, s) → a < x) → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(INSERT(a, s)) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({a}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(s)"), t1196))
}

///|
let mvbasis_split_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVBASIS_SPLIT_GEOM")

///|
/// `MVBASIS_SPLIT_GEOM`
pub fn mvbasis_split_geom() -> @kernel.Thm {
  mvbasis_split_geom_c.get()
}

///|
/// INNER_MVBASIS_SKEWSYM
fn step_204() -> Unit raise {
  let t1199 = @simp.asm_rewrite_tac(@list.List([]))
  let t1198 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)"))
  let t1197 = @simp.asm_rewrite_tac(@list.List([inner_mvbasis_sing()]))
  let t1200 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1197), t1198), t1199)
  inner_mvbasis_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (innerga : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j})) == (innerga : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}))"), t1200))
}

///|
let inner_mvbasis_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_MVBASIS_SKEWSYM")

///|
/// `INNER_MVBASIS_SKEWSYM`
pub fn inner_mvbasis_skewsym() -> @kernel.Thm {
  inner_mvbasis_skewsym_c.get()
}

///|
/// INNER_MVBASIS_REFL
fn step_205() -> Unit raise {
  let t1205 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1204 = @tactics.pop_assum(fn(x1201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1202 = @tactics.mp_tac(x1201)
    fn(x1203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1202(x1203)
    }
  })
  let t1206 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([inner_mvbasis_sing()]))), @class.cond_cases_tac), t1204), t1205), @int.arith_tac)
  inner_mvbasis_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i})) == (if IN(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { if IN(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({}) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } })"), t1206))
}

///|
let inner_mvbasis_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_MVBASIS_REFL")

///|
/// `INNER_MVBASIS_REFL`
pub fn inner_mvbasis_refl() -> @kernel.Thm {
  inner_mvbasis_refl_c.get()
}

///|
/// swappair
fn step_206() -> Unit raise {
  swappair_c.set(@pair.new_definition(@term_syntax.parse_term("(swappair : ((_, _)) -> (_, _))((p : (_, _))) == (SND(p), FST(p))")))
}

///|
let swappair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("swappair")

///|
/// `swappair`
pub fn swappair() -> @kernel.Thm {
  swappair_c.get()
}

///|
/// VECTOR_GEOM_EQ_OUTER_ADD_INNER
fn step_207() -> Unit raise {
  let t1216 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_lid(), @vectors.vector_add_rid()]))
  let t1215 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis_sing(), outer_mvbasis_sing(), inner_mvbasis_sing()]))
  let t1214 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @equal.gsym(@vectors.vector_add_ldistrib())]))
  let t1213 = @simp.rewrite_tac(@list.List([geomga_rmul(), geomga_lmul(), outerga_rmul(), outerga_lmul(), innerga_rmul(), innerga_lmul()]))
  let t1212 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1211 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_cross()]))
  let t1210 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t1209 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1208 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_cross(), @equal.gsym(@vectors.vsum_add())]))
  let t1207 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), bilinear_innerga(), bilinear_outerga(), bilinear_geomga(), @vectors.bilinear_vsum()]))
  let t1217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([multivect()])), t1207), t1208), t1209), t1210), t1211), t1212), t1213), t1214), @tactics.ap_term_tac), t1215), @class.cond_cases_tac), t1216)
  vector_geom_eq_outer_add_inner_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], ∀ y : Cart[Real, Trip_fin_sum[P, Q, R]], multivec(x) * multivec(y) == outer(multivec(x), multivec(y)) + innerga(multivec(x), multivec(y))"), t1217))
}

///|
let vector_geom_eq_outer_add_inner_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_GEOM_EQ_OUTER_ADD_INNER")

///|
/// `VECTOR_GEOM_EQ_OUTER_ADD_INNER`
pub fn vector_geom_eq_outer_add_inner() -> @kernel.Thm {
  vector_geom_eq_outer_add_inner_c.get()
}

///|
/// VECTOR_OUTERGA_SKEWSYM
fn step_208() -> Unit raise {
  let t1264 = @meson.meson_tac(@list.List([@pair.pair_eq()]))
  let t1263 = @simp.rewrite_tac(@list.List([swappair(), @pair.forall_pair_thm()]))
  let t1262 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_cross()]))
  let t1260 = @equal.gsym(@sets.set_pair_thm())
  let t1261 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_cross()), t1260, @sets.in_elim_thm(), @sets.in_gspec()]))
  let t1259 = @tactics.match_mp_tac(@vectors.vsum_image())
  let t1258 = @simp.gen_rewrite_tac(fn(x1257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1251 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1252 = @equal.rand_conv(x1251)
      fn(x1253 : @kernel.Term) -> @kernel.Thm raise {
        s1252(x1253)
      }
    })((fn(x1254 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1255 = @equal.once_depth_conv(x1254)
      fn(x1256 : @kernel.Term) -> @kernel.Thm raise {
        s1255(x1256)
      }
    })(x1257))
  }, @list.List([@realax.real_mul_sym()]))
  let t1248 = @meson.meson_tac(@list.List([@pair.pair_eq()]))
  let t1249 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @pair.forall_pair_thm(), @pair.exists_pair_thm(), @sets.in_elim_pair_thm(), swappair()])), t1248)
  let t1250 = @simp.gen_rewrite_tac(fn(x1247 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1241 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1242 = @equal.land_conv(x1241)
      fn(x1243 : @kernel.Term) -> @kernel.Thm raise {
        s1242(x1243)
      }
    })((fn(x1244 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1245 = @equal.once_depth_conv(x1244)
      fn(x1246 : @kernel.Term) -> @kernel.Thm raise {
        s1245(x1246)
      }
    })(x1247))
  }, @list.List([@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, {((x : _), (y : _)) | IN(x, s) && IN(y, s)} == IMAGE(swappair, {((x : _), (y : _)) | IN(x, s) && IN(y, s)})"), t1249)]))
  let t1240 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t1238 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @pair.forall_pair_thm(), swappair()]))
  let t1239 = @simp.gen_rewrite_tac(fn(x1237 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1231 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1232 = @equal.rand_conv(x1231)
      fn(x1233 : @kernel.Term) -> @kernel.Thm raise {
        s1232(x1233)
      }
    })((fn(x1234 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1235 = @equal.once_depth_conv(x1234)
      fn(x1236 : @kernel.Term) -> @kernel.Thm raise {
        s1235(x1236)
      }
    })(x1237))
  }, @list.List([@tactics.prove(@term_syntax.parse_term("∀ P : (_, _) -> _, GABS((f : ((_, _)) -> _) => ∀ x : _, ∀ y : _, GEQ(f((x, y)), P(x, y))) == o(GABS((f : ((_, _)) -> _) => ∀ x : _, ∀ y : _, GEQ(f((x, y)), P(y, x))), swappair)"), t1238)]))
  let t1230 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_neg(), @equal.gsym(@pair.lambda_pair())]))
  let t1229 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rneg(), @pair.lambda_pair(), @vectors.vsum_neg()]))
  let t1228 = @simp.gen_rewrite_tac(fn(x1227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1221 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1222 = @equal.rand_conv(x1221)
      fn(x1223 : @kernel.Term) -> @kernel.Thm raise {
        s1222(x1223)
      }
    })((fn(x1224 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1225 = @equal.once_depth_conv(x1224)
      fn(x1226 : @kernel.Term) -> @kernel.Thm raise {
        s1225(x1226)
      }
    })(x1227))
  }, @list.List([outer_mvbasis_skewsym()]))
  let t1220 = @simp.rewrite_tac(@list.List([@sets.cross(), outerga_lmul(), outerga_rmul()]))
  let t1219 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), bilinear_outerga(), @vectors.bilinear_vsum()]))
  let t1218 = @simp.rewrite_tac(@list.List([multivect()]))
  let t1265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1218), t1219), t1220), t1228), t1229), t1230), t1239), t1240), t1250), t1258), t1259), t1261), t1262), t1263), t1264)
  vector_outerga_skewsym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], ∀ y : Cart[Real, Trip_fin_sum[P, Q, R]], outer(multivec(x), multivec(y)) == -outer(multivec(y), multivec(x))"), t1265))
}

///|
let vector_outerga_skewsym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_OUTERGA_SKEWSYM")

///|
/// `VECTOR_OUTERGA_SKEWSYM`
pub fn vector_outerga_skewsym() -> @kernel.Thm {
  vector_outerga_skewsym_c.get()
}

///|
/// VECTOR_OUTERGA_REFL
fn step_209() -> Unit raise {
  let t1266 = @tactics.match_accept_tac(vector_outerga_skewsym())
  let t1267 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) == -x → x == vec(0)")))), t1266)
  vector_outerga_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], outer(multivec(x), multivec(x)) == vec(0)"), t1267))
}

///|
let vector_outerga_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_OUTERGA_REFL")

///|
/// `VECTOR_OUTERGA_REFL`
pub fn vector_outerga_refl() -> @kernel.Thm {
  vector_outerga_refl_c.get()
}

///|
/// VECTOR_INNERGA_REFL
fn step_210() -> Unit raise {
  let t1309 = @meson.asm_meson_tac(@list.List([@arith.add_sym(), @arith.le_add_lcancel(), @vectors.vector_mul_rzero()]))
  let t1308 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → !(i + (n : Num) <= n)"))]))
  let t1307 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1306 = @simp.rewrite_tac(@list.List([inner_mvbasis_refl(), @iterate.in_numseg()]))
  let t1305 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.subset_numseg()])), @int.arith_tac), @tactics.all_tac])
  let t1304 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1303 = @tactics.match_mp_tac(@vectors.vsum_eq_superset())
  let t1301 = @equal.gsym(@vectors.vsum_rmul())
  let t1302 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_mul_rneg()), t1301]))
  let t1300 = @simp.rewrite_tac(@list.List([@vectors.vsum_offset()]))
  let t1299 = @simp.gen_rewrite_tac(fn(x1298 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1292 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1293 = @equal.land_conv(x1292)
      fn(x1294 : @kernel.Term) -> @kernel.Thm raise {
        s1293(x1294)
      }
    })((fn(x1295 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1296 = @equal.once_depth_conv(x1295)
      fn(x1297 : @kernel.Term) -> @kernel.Thm raise {
        s1296(x1297)
      }
    })(x1298))
  }, @list.List([@arith.add_sym()]))
  let t1290 = @meson.meson_tac(@list.List([inner_mvbasis_refl()]))
  let t1289 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t1291 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_rmul())])), t1289), t1290), @tactics.all_tac])
  let t1288 = @simp.simp_tac(@list.List([@arith.le_addr(), @vectors.vsum_add_split()]))
  let t1287 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_rdistrib(), @vectors.vector_sub_v1()]))
  let t1285 = @simp.asm_simp_tac(@list.List([@vectors.vsum_delta()]))
  let t1284 = @simp.gen_rewrite_tac(fn(x1283 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1277 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1278 = @equal.land_conv(x1277)
      fn(x1279 : @kernel.Term) -> @kernel.Thm raise {
        s1278(x1279)
      }
    })((fn(x1280 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1281 = @equal.once_depth_conv(x1280)
      fn(x1282 : @kernel.Term) -> @kernel.Thm raise {
        s1281(x1282)
      }
    })(x1283))
  }, @list.List([@theorems.eq_sym_eq(), @vectors.vector_mul_rzero()]))
  let t1276 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1275 = @simp.rewrite_tac(@list.List([inner_mvbasis_sing()]))
  let t1274 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1273 = @simp.rewrite_tac(@list.List([innerga_rmul(), innerga_lmul(), @vectors.vector_mul_assoc()]))
  let t1286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_eq()), t1273), t1274), t1275), t1276), t1284), t1285), @tactics.all_tac])
  let t1272 = @tactics.exists_tac(@term_syntax.parse_term("(vsum : ((Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))), (i : Num) => (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)((x : Cart[Real, Trip_fin_sum[P, Q, R]]), i) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i), (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}))))"))
  let t1271 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1270 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @equal.gsym(@vectors.vsum_vsum_product())]))
  let t1269 = @simp.rewrite_tac(@list.List([@sets.cross()]))
  let t1268 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), bilinear_innerga(), @vectors.bilinear_vsum()]))
  let t1310 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([multivect()]))), t1268), t1269), t1270), t1271), t1272), @tactics.conj_tac), t1286), t1287), t1288), @tactics.binop_tac), t1291), t1299), t1300), t1302), t1303), t1304), @tactics.conj_tac), t1305), t1306), @tactics.conj_tac), t1307), t1308), t1309)
  vector_innerga_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], (innerga : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x), (multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x)) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i)) - (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool)))"), t1310))
}

///|
let vector_innerga_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_INNERGA_REFL")

///|
/// `VECTOR_INNERGA_REFL`
pub fn vector_innerga_refl() -> @kernel.Thm {
  vector_innerga_refl_c.get()
}

///|
/// VECTOR_GEOMGA_INNER_REFL_EQ
fn step_211() -> Unit raise {
  let t1311 = @simp.rewrite_tac(@list.List([vector_geom_eq_outer_add_inner(), vector_outerga_refl(), @vectors.vector_add_lid()]))
  vector_geomga_inner_refl_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], multivec(x) * multivec(x) == innerga(multivec(x), multivec(x))"), t1311))
}

///|
let vector_geomga_inner_refl_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_GEOMGA_INNER_REFL_EQ")

///|
/// `VECTOR_GEOMGA_INNER_REFL_EQ`
pub fn vector_geomga_inner_refl_eq() -> @kernel.Thm {
  vector_geomga_inner_refl_eq_c.get()
}

///|
/// VECTOR_GEOMGA_REFL
fn step_212() -> Unit raise {
  let t1312 = @simp.rewrite_tac(@list.List([vector_geom_eq_outer_add_inner(), vector_outerga_refl(), vector_innerga_refl(), @vectors.vector_add_lid()]))
  vector_geomga_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], (multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x) * (multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i)) - (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool)))"), t1312))
}

///|
let vector_geomga_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_GEOMGA_REFL")

///|
/// `VECTOR_GEOMGA_REFL`
pub fn vector_geomga_refl() -> @kernel.Thm {
  vector_geomga_refl_c.get()
}

///|
let mvbasis_split_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("MVBASIS_SPLIT_CONV")

///|
/// `MVBASIS_SPLIT_CONV`
pub fn mvbasis_split_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (mvbasis_split_conv_c.get())(x)
}

///|
let mvbasis_merge_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("MVBASIS_MERGE_CONV")

///|
/// `MVBASIS_MERGE_CONV`
pub fn mvbasis_merge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (mvbasis_merge_conv_c.get())(x)
}

///|
/// MVBASIS_SPLIT_CONV, MVBASIS_MERGE_CONV
fn step_213() -> Unit raise {
  let setlemma = @sets.set_rule(@term_syntax.parse_term("(∀ x : Num, IN(x, {}) → (a : Num) < x) == true && (∀ x : Num, IN(x, INSERT((y : Num), (s : (Num) -> Bool))) → a < x) == (a < y && (∀ x : Num, IN(x, s) → a < x))"))
  let set_check_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.gen_rewrite_conv(fn(x1313 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1314 = @equal.top_sweep_conv(x1313)
    fn(x1315 : @kernel.Term) -> @kernel.Thm raise {
      s1314(x1315)
    }
  }, @list.List([setlemma])), @calc_num.num_reduce_conv)
  let inst_split : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x1316 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1316))
  }, mvbasis_split())
  let inst_merge : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x1317 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1317))
  }, @equal.gsym(mvbasis_split()))
  fn conv(x1318 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1318
    if (Int::to_int64(@lib.length(@sets.dest_setenum(@kernel.rand(tm)))) <= 1L) {
      @kernel.refl(tm)
    } else {
      let th = @drule.mp_conv(set_check_conv, inst_split(tm))
      let t1319 = @kernel.rand(@kernel.concl(th))
      let th_p = @equal.rand_conv(conv)(t1319)
      @kernel.trans(th, th_p)
    }
  }
  let (mvbasis_split_conv, mvbasis_merge_conv) = (fn(x1320 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x1320
    try {
      let (op, se) = @kernel.dest_comb(tm_1)
      if ((@kernel.dest_const(op).0 == "mvbasis") && @lib.forall(@nums.is_numeral, @sets.dest_setenum(se))) {
        @equal.thenc(@equal.rand_conv(@clifford.setenum_norm_conv), conv)(tm_1)
      } else {
        @lib.failure()
      }
    } catch {
      Failure(_) => raise Failure("MVBASIS_SPLIT_CONV")
      e => raise e
    }
  }, fn(x1321 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x1321
    try {
      @drule.mp_conv(set_check_conv, inst_merge(tm_2))
    } catch {
      Failure(_) => raise Failure("MVBASIS_MERGE_CONV")
      e => raise e
    }
  })
  mvbasis_split_conv_c.set(mvbasis_split_conv)
  mvbasis_merge_conv_c.set(mvbasis_merge_conv)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1554
fn step_214() -> Unit raise {
  ignore(mvbasis_split_conv(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({1, 2})")))
}

///|
let geom_mvbasis_split_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("GEOM_MVBASIS_SPLIT_CONV")

///|
/// `GEOM_MVBASIS_SPLIT_CONV`
pub fn geom_mvbasis_split_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (geom_mvbasis_split_conv_c.get())(x)
}

///|
let geom_mvbasis_merge_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("GEOM_MVBASIS_MERGE_CONV")

///|
/// `GEOM_MVBASIS_MERGE_CONV`
pub fn geom_mvbasis_merge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (geom_mvbasis_merge_conv_c.get())(x)
}

///|
/// GEOM_MVBASIS_SPLIT_CONV, GEOM_MVBASIS_MERGE_CONV
fn step_215() -> Unit raise {
  let setlemma = @sets.set_rule(@term_syntax.parse_term("(∀ x : Num, IN(x, {}) → (a : Num) < x) == true && (∀ x : Num, IN(x, INSERT((y : Num), (s : (Num) -> Bool))) → a < x) == (a < y && (∀ x : Num, IN(x, s) → a < x))"))
  let set_check_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.gen_rewrite_conv(fn(x1322 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1323 = @equal.top_sweep_conv(x1322)
    fn(x1324 : @kernel.Term) -> @kernel.Thm raise {
      s1323(x1324)
    }
  }, @list.List([setlemma])), @calc_num.num_reduce_conv)
  let inst_split : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x1325 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1325))
  }, mvbasis_split_geom())
  let inst_merge : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x1326 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1326))
  }, @equal.gsym(mvbasis_split_geom()))
  fn conv(x1327 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1327
    if (Int::to_int64(@lib.length(@sets.dest_setenum(@kernel.rand(tm)))) <= 1L) {
      @kernel.refl(tm)
    } else {
      let th = @drule.mp_conv(set_check_conv, inst_split(tm))
      let t1328 = @kernel.rand(@kernel.concl(th))
      let th_p = @equal.rand_conv(conv)(t1328)
      @kernel.trans(th, th_p)
    }
  }
  let (geom_mvbasis_split_conv, geom_mvbasis_merge_conv) = (fn(x1329 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x1329
    try {
      let (op, se) = @kernel.dest_comb(tm_1)
      if ((@kernel.dest_const(op).0 == "mvbasis") && @lib.forall(@nums.is_numeral, @sets.dest_setenum(se))) {
        @equal.thenc(@equal.rand_conv(@clifford.setenum_norm_conv), conv)(tm_1)
      } else {
        @lib.failure()
      }
    } catch {
      Failure(_) => raise Failure("GEOM_MVBASIS_SPLIT_CONV")
      e => raise e
    }
  }, fn(x1330 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x1330
    try {
      @drule.mp_conv(set_check_conv, inst_merge(tm_2))
    } catch {
      Failure(_) => raise Failure("GEOM_MVBASIS_MERGE_CONV")
      e => raise e
    }
  })
  geom_mvbasis_split_conv_c.set(geom_mvbasis_split_conv)
  geom_mvbasis_merge_conv_c.set(geom_mvbasis_merge_conv)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1585
fn step_216() -> Unit raise {
  ignore(geom_mvbasis_split_conv(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({1, 2})")))
}

///|
/// OUTERGA_ACI
fn step_217() -> Unit raise {
  let t1335 = @meson.meson_tac(@list.List([outer_mvbasis_skewsym(), outerga_lneg()]))
  let t1333 = @vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (y : Cart[Real, N]) == x + -y"))
  let t1334 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vector_neg_minus1()), t1333]))
  let t1332 = @simp.rewrite_tac(@list.List([outer_mvbasis_lscalar(), outer_mvbasis_rscalar()]))
  let t1331 = @simp.rewrite_tac(@list.List([outer_mvbasis_refl(), outerga_lzero()]))
  let t1336 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outerga_assoc(), outerga_lzero(), outerga_rzero(), outerga_ladd(), outerga_radd(), outerga_lmul(), outerga_rmul(), outerga_lzero(), outerga_rzero()])), t1331), t1332), t1334), t1335)
  outerga_aci_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, Geomalg[_, _, _]], ∀ y : Cart[Real, Geomalg[_, _, _]], ∀ z : Cart[Real, Geomalg[_, _, _]], outer(outer(x, y), z) == outer(x, outer(y, z))) && (∀ i : Num, ∀ j : Num, i > j → (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j})) == (op_pct : (Real, Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])(-real_of_num(1), (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({j}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i})))) && (∀ i : Num, ∀ j : Num, ∀ x : Cart[Real, Geomalg[_, _, _]], i > j → outer(mbasis({i}), outer(mbasis({j}), x)) == op_pct(-real_of_num(1), outer(mbasis({j}), outer(mbasis({i}), x)))) && (∀ i : Num, (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({i})) == (vec : (Num) -> Cart[Real, Geomalg[_, _, _]])(0)) && (∀ i : Num, ∀ x : Cart[Real, Geomalg[_, _, _]], outer(mbasis({i}), outer(mbasis({i}), x)) == vec(0)) && (∀ x : Cart[Real, Geomalg[_, _, _]], outer(mbasis({}), x) == x) && (∀ x : Cart[Real, Geomalg[_, _, _]], outer(x, mbasis({})) == x)"), t1336))
}

///|
let outerga_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERGA_ACI")

///|
/// `OUTERGA_ACI`
pub fn outerga_aci() -> @kernel.Thm {
  outerga_aci_c.get()
}

///|
/// GEOM_ACI
fn step_218() -> Unit raise {
  let t1338 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) > (j : Num) → !(i == j)")), geom_mvbasis_skewsym(), geomga_lneg(), geom_mvbasis_lid(), geomga_lzero(), @class.cond_rand()]))
  let t1337 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vector_neg_minus1())]))
  let t1339 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([geomga_assoc(), geom_mvbasis_refl(), geom_mvbasis_lid(), geom_mvbasis_rid()])), t1337), t1338)
  geom_aci_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], x * y * z == x * (y * z)) && (∀ i : Num, ∀ j : Num, i > j → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(-real_of_num(1), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}))) && (∀ i : Num, ∀ j : Num, ∀ x : Cart[Real, Geomalg[P, Q, R]], i > j → (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) * x) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(-real_of_num(1), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({j}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * x))) && (∀ i : Num, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) == (if (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool)) } else { if (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(-real_of_num(1), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool))) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } })) && (∀ i : Num, ∀ x : Cart[Real, Geomalg[P, Q, R]], (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])({i}) * x) == (if (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)))) { x } else { if (IN : (Num, (Num) -> Bool) -> Bool)(i, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))) { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(-real_of_num(1), x) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) } })) && (∀ x : Cart[Real, Geomalg[P, Q, R]], (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool)) * x == x) && (∀ x : Cart[Real, Geomalg[P, Q, R]], x * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(({} : (Num) -> Bool)) == x) && (∀ p : Bool, ∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], x * (if p { y } else { z }) == (if p { x * y } else { x * z }))"), t1339))
}

///|
let geom_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEOM_ACI")

///|
/// `GEOM_ACI`
pub fn geom_aci() -> @kernel.Thm {
  geom_aci_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1646
fn step_219() -> Unit raise {
  ignore(@clifford.mbasis_group_conv(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])(real_of_num(2), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1, 2})) + ((op_pct : (Real, Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])(real_of_num(3), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({2})) + ((op_pct : (Real, Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])(real_of_num(2), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1, 3})) + (op_pct : (Real, Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])(-real_of_num(3), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}))))")))
}

///|
/// OUTERGA_CANON_CONV
fn step_220() -> Unit raise {
  let t1354 = @simp.gen_rewrite_conv(fn(x1351 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1352 = @equal.depth_conv(x1351)
    fn(x1353 : @kernel.Term) -> @kernel.Thm raise {
      s1352(x1353)
    }
  }, @list.List([@equal.gsym(@vectors.vector_add_rdistrib())]))
  let t1350 = @equal.depth_conv(mvbasis_merge_conv)
  let t1349 = @simp.pure_rewrite_conv(@list.List([@equal.gsym(@vectors.vector_add_assoc())]))
  let t1348 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc()]))
  let t1347 = @simp.gen_rewrite_conv(fn(x1346 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1346
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())]))
  let t1345 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_rzero(), @vectors.vector_add_lid(), @vectors.vector_add_rid(), @vectors.vector_mul_assoc()]))
  let t1344 = @simp.pure_simp_conv(@list.List([outerga_aci(), @calc_num.arith_gt(), @calc_num.arith_ge(), outerga_lmul(), outerga_rmul(), outerga_lzero(), outerga_rzero()]))
  let t1343 = @simp.gen_rewrite_conv(fn(x1340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1341 = @equal.top_depth_conv(x1340)
    fn(x1342 : @kernel.Term) -> @kernel.Thm raise {
      s1341(x1342)
    }
  }, @list.List([@vectors.vector_sub_v1(), @vectors.vector_neg_minus1(), outerga_ladd(), outerga_radd(), outerga_lmul(), outerga_rmul(), outerga_lzero(), outerga_rzero(), @vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc(), @vectors.vector_mul_lzero(), @vectors.vector_mul_rzero()]))
  outerga_canon_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.once_depth_conv(mvbasis_split_conv), t1343), @calc_rat.real_rat_reduce_conv), t1344), t1345), t1347), t1348), @calc_rat.real_rat_reduce_conv), t1349), t1350), @clifford.mbasis_group_conv), t1354), @calc_rat.real_rat_reduce_conv))
}

///|
let outerga_canon_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("OUTERGA_CANON_CONV")

///|
/// `OUTERGA_CANON_CONV`
pub fn outerga_canon_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (outerga_canon_conv_c.get())(x)
}

///|
/// GEOM_CANON_CONV
fn step_221() -> Unit raise {
  let t1371 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_add_lid(), @vectors.vector_add_rid()]))
  let t1370 = @simp.gen_rewrite_conv(fn(x1367 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1368 = @equal.depth_conv(x1367)
    fn(x1369 : @kernel.Term) -> @kernel.Thm raise {
      s1368(x1369)
    }
  }, @list.List([@equal.gsym(@vectors.vector_add_rdistrib())]))
  let t1366 = @equal.depth_conv(geom_mvbasis_merge_conv)
  let t1365 = @simp.pure_rewrite_conv(@list.List([@equal.gsym(@vectors.vector_add_assoc())]))
  let t1364 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc()]))
  let t1363 = @simp.gen_rewrite_conv(fn(x1362 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1362
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())]))
  let t1361 = @simp.pure_rewrite_conv(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_rzero(), @vectors.vector_add_lid(), @vectors.vector_add_rid(), @vectors.vector_mul_assoc()]))
  let t1360 = @simp.pure_rewrite_conv(@list.List([pdimindex_0(), pdimindex_1(), pdimindex_2(), pdimindex_3(), pdimindex_4(), @iterate.in_numseg()]))
  let t1359 = @simp.pure_simp_conv(@list.List([geom_aci(), @calc_num.arith_gt(), @calc_num.arith_ge(), geomga_lmul(), geomga_rmul(), geomga_lzero(), geomga_rzero()]))
  let t1358 = @simp.gen_rewrite_conv(fn(x1355 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1356 = @equal.top_depth_conv(x1355)
    fn(x1357 : @kernel.Term) -> @kernel.Thm raise {
      s1356(x1357)
    }
  }, @list.List([@vectors.vector_sub_v1(), @vectors.vector_neg_minus1(), geomga_ladd(), geomga_radd(), geomga_lmul(), geomga_rmul(), geomga_lzero(), geomga_rzero(), @vectors.vector_add_ldistrib(), @vectors.vector_add_rdistrib(), @vectors.vector_mul_assoc(), @vectors.vector_mul_lzero(), @vectors.vector_mul_rzero()]))
  geom_canon_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.once_depth_conv(geom_mvbasis_split_conv), t1358), @calc_rat.real_rat_reduce_conv), t1359), t1360), @calc_num.num_reduce_conv), t1361), t1363), t1364), @calc_rat.real_rat_reduce_conv), t1365), t1366), @clifford.mbasis_group_conv), t1370), @calc_rat.real_rat_reduce_conv), t1371))
}

///|
let geom_canon_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("GEOM_CANON_CONV")

///|
/// `GEOM_CANON_CONV`
pub fn geom_canon_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (geom_canon_conv_c.get())(x)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1697
fn step_222() -> Unit raise {
  ignore(geom_canon_conv(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4})")))
}

///|
/// GA_GEOM_CONV
fn step_223() -> Unit raise {
  let t1372 = @int.arith_rule(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ x : Num, !(a == b) → !(x == a && x == b)"))
  let t1373 = @simp.simp_conv(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_insert(), @sets.subset(), @sets.not_in_empty(), @class.not_forall_thm(), @equal.gsym(@class.not_exists_thm()), @theorems.exists_refl(), t1372, @theorems.exists_or_thm(), @calc_num.arith_eq()]))
  ga_geom_conv_c.set(@equal.thenc(@simp.pure_rewrite_conv(@list.List([mvbasis_outer_geom(), mvbasis_inner_geom()])), t1373))
}

///|
let ga_geom_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("GA_GEOM_CONV")

///|
/// `GA_GEOM_CONV`
pub fn ga_geom_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ga_geom_conv_c.get())(x)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1706
fn step_224() -> Unit raise {
  ignore(ga_geom_conv(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}) * ((innerga : (Cart[Real, Geomalg[Four, One, One]], Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1, 3})) + (outer : (Cart[Real, Geomalg[Four, One, One]], Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({2})))")))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1709
fn step_225() -> Unit raise {
  let t1374 = @term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}) * ((innerga : (Cart[Real, Geomalg[Four, One, One]], Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1, 3})) + (outer : (Cart[Real, Geomalg[Four, One, One]], Cart[Real, Geomalg[Four, One, One]]) -> Cart[Real, Geomalg[Four, One, One]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({1}), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Four, One, One]])({2})))")
  ignore(@equal.thenc(ga_geom_conv, geom_canon_conv)(t1374))
}

///|
/// `GEOM_ARITH`
pub fn geom_arith(x1375 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1375
  let (l, r) = @kernel.dest_eq(tm)
  let t1376 = geom_canon_conv(r)
  let (th, th_p) = (geom_canon_conv(l), t1376)
  @kernel.trans(th, @equal.sym(th_p))
}

///|
/// OUTERGA_VECTOR_CONV
fn step_226() -> Unit raise {
  let t1377 = @bool.ispec(@term_syntax.parse_term("(multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), @vectors.linear())
  outerga_vector_conv_c.set(@equal.thenc(@simp.rewrite_conv(@list.List([@simp.rewrite_rule(@list.List([linear_multivect()]))(t1377), multivect_basis(), @vectors.vector_sub_v1(), @vectors.vector_neg_minus1()])), outerga_canon_conv))
}

///|
let outerga_vector_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("OUTERGA_VECTOR_CONV")

///|
/// `OUTERGA_VECTOR_CONV`
pub fn outerga_vector_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (outerga_vector_conv_c.get())(x)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1722
fn step_227() -> Unit raise {
  ignore(outerga_vector_conv(@term_syntax.parse_term("(outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(1) + (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(2)), (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(2) + (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(3)), (multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(1) - (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(3))))")))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1725
fn step_228() -> Unit raise {
  ignore(outerga_vector_conv(@term_syntax.parse_term("(outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(1) + (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(2)), (outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(2) + (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(3)), (multivec : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(1) + (basis : (Num) -> Cart[Real, Trip_fin_sum[_, _, _]])(3))))")))
}

///|
/// mvinvertible
fn step_229() -> Unit raise {
  mvinvertible_c.set(@pair.new_definition(@term_syntax.parse_term("(mvinvertible : (Cart[Real, Geomalg[P, Q, R]]) -> Bool)((x : Cart[Real, Geomalg[P, Q, R]])) == (∃ x' : Cart[Real, Geomalg[P, Q, R]], x' * x == mbasis({}) && x * x' == mbasis({}))")))
}

///|
let mvinvertible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mvinvertible")

///|
/// `mvinvertible`
pub fn mvinvertible() -> @kernel.Thm {
  mvinvertible_c.get()
}

///|
/// mvinverse
fn step_230() -> Unit raise {
  mvinverse_c.set(@pair.new_definition(@term_syntax.parse_term("(mvinverse : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]])) == select((x' : Cart[Real, Geomalg[P, Q, R]]) => x' * x == mbasis({}) && x * x' == mbasis({}))")))
}

///|
let mvinverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mvinverse")

///|
/// `mvinverse`
pub fn mvinverse() -> @kernel.Thm {
  mvinverse_c.get()
}

///|
/// MVINVERTIBLE_MVINVERSE
fn step_231() -> Unit raise {
  let t1378 = @meson.meson_tac(@list.List([mvinvertible(), mvinverse()]))
  mvinvertible_mvinverse_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], mvinvertible(x) == (mvinverse(x) * x == mbasis({}) && x * mvinverse(x) == mbasis({}))"), t1378))
}

///|
let mvinvertible_mvinverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_MVINVERSE")

///|
/// `MVINVERTIBLE_MVINVERSE`
pub fn mvinvertible_mvinverse() -> @kernel.Thm {
  mvinvertible_mvinverse_c.get()
}

///|
/// MV_LEFT_RIGHT_INVERSE
fn step_232() -> Unit raise {
  let t1424 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(geomga_assoc())]))
  let t1423 = @tactics.assum_list(fn(x1421 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thl = x1421
    @simp.rewrite_tac(@lib.map(@equal.gsym, thl))
  })
  let t1420 = @simp.gen_rewrite_tac(fn(x1419 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1415 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1411 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1405 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1406 = @equal.land_conv(x1405)
          fn(x1407 : @kernel.Term) -> @kernel.Thm raise {
            s1406(x1407)
          }
        })((fn(x1408 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1409 = @equal.land_conv(x1408)
          fn(x1410 : @kernel.Term) -> @kernel.Thm raise {
            s1409(x1410)
          }
        })(x1411))
      })((fn(x1412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1413 = @equal.rand_conv(x1412)
        fn(x1414 : @kernel.Term) -> @kernel.Thm raise {
          s1413(x1414)
        }
      })(x1415))
    })((fn(x1416 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1417 = @equal.once_depth_conv(x1416)
      fn(x1418 : @kernel.Term) -> @kernel.Thm raise {
        s1417(x1418)
      }
    })(x1419))
  }, @list.List([@equal.gsym(geom_mvbasis_lid())]))
  let t1403 = @simp.asm_rewrite_tac(@list.List([]))
  let t1404 = @list.List([@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1402 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1398 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1392 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1393 = @equal.land_conv(x1392)
        fn(x1394 : @kernel.Term) -> @kernel.Thm raise {
          s1393(x1394)
        }
      })((fn(x1395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1396 = @equal.rand_conv(x1395)
        fn(x1397 : @kernel.Term) -> @kernel.Thm raise {
          s1396(x1397)
        }
      })(x1398))
    })((fn(x1399 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1400 = @equal.once_depth_conv(x1399)
      fn(x1401 : @kernel.Term) -> @kernel.Thm raise {
        s1400(x1401)
      }
    })(x1402))
  }, @list.List([@equal.gsym(geom_mvbasis_rid())])), t1403), @tactics.all_tac])
  let t1391 = @tactics.subgoal_then(@term_syntax.parse_term("(f' : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]])) == mbasis({})"), fn(x1388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1389 = @tactics.mp_tac(x1388)
    fn(x1390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1389(x1390)
    }
  })
  let t1387 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f' : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))(@tactics.strip_assume_tac))
  let t1385 = @simp.asm_rewrite_tac(@list.List([geomga_assoc(), geom_mvbasis_lid()]))
  let t1384 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, Geomalg[P, Q, R]]) * (z : Cart[Real, Geomalg[P, Q, R]])"))
  let t1386 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, Geomalg[P, Q, R]])")), t1384), t1385), @tactics.all_tac])
  let t1383 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@vectors.bilinear()]))(bilinear_geomga())]))
  let t1382 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, Geomalg[P, Q, R]]) => (x : Cart[Real, Geomalg[P, Q, R]]) * z"), @vectors.linear_surjective_isomorphism()))
  let t1381 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1425 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], x * y == mbasis({}) → y * x == mbasis({})"), fn(x1379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1379
    @meson.meson_tac(@list.List([th]))
  }), t1381), t1382), t1383), @tactics.ants_tac), t1386), t1387), t1391), t1404), t1420), t1423), t1424)
  mv_left_right_inverse_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], (x * y == mbasis({})) == (y * x == mbasis({}))"), t1425))
}

///|
let mv_left_right_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MV_LEFT_RIGHT_INVERSE")

///|
/// `MV_LEFT_RIGHT_INVERSE`
pub fn mv_left_right_inverse() -> @kernel.Thm {
  mv_left_right_inverse_c.get()
}

///|
/// MVINVERTIBLE_LEFT_INVERSE
fn step_233() -> Unit raise {
  let t1426 = @meson.meson_tac(@list.List([mvinvertible(), mv_left_right_inverse()]))
  mvinvertible_left_inverse_c.set(@tactics.prove(@term_syntax.parse_term("mvinvertible((x : Cart[Real, Geomalg[P, Q, R]])) == (∃ x' : Cart[Real, Geomalg[P, Q, R]], x' * x == mbasis({}))"), t1426))
}

///|
let mvinvertible_left_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_LEFT_INVERSE")

///|
/// `MVINVERTIBLE_LEFT_INVERSE`
pub fn mvinvertible_left_inverse() -> @kernel.Thm {
  mvinvertible_left_inverse_c.get()
}

///|
/// MVINVERTIBLE_RIGHT_INVERSE
fn step_234() -> Unit raise {
  let t1427 = @meson.meson_tac(@list.List([mvinvertible(), mv_left_right_inverse()]))
  mvinvertible_right_inverse_c.set(@tactics.prove(@term_syntax.parse_term("mvinvertible((x : Cart[Real, Geomalg[P, Q, R]])) == (∃ x' : Cart[Real, Geomalg[P, Q, R]], x * x' == mbasis({}))"), t1427))
}

///|
let mvinvertible_right_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_RIGHT_INVERSE")

///|
/// `MVINVERTIBLE_RIGHT_INVERSE`
pub fn mvinvertible_right_inverse() -> @kernel.Thm {
  mvinvertible_right_inverse_c.get()
}

///|
/// is_null
fn step_235() -> Unit raise {
  is_null_c.set(@pair.new_definition(@term_syntax.parse_term("(is_null : (Cart[Real, Geomalg[P, Q, R]]) -> Bool)((x : Cart[Real, Geomalg[P, Q, R]])) == (innerga(x, x) == vec(0))")))
}

///|
let is_null_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_null")

///|
/// `is_null`
pub fn is_null() -> @kernel.Thm {
  is_null_c.get()
}

///|
/// MVINVERTIBLE_VECTOR_EQ
fn step_236() -> Unit raise {
  let t1448 = @simp.rewrite_tac(@list.List([mvbasis_eq_0(), @sets.empty_subset()]))
  let t1447 = @simp.asm_rewrite_tac(@list.List([geom_arith(@term_syntax.parse_term("(a : Cart[Real, Geomalg[P, Q, R]]) * ((b : Cart[Real, Geomalg[P, Q, R]]) * ((c : Cart[Real, Geomalg[P, Q, R]]) * (d : Cart[Real, Geomalg[P, Q, R]]))) == a * (b * c * d)")), geom_mvbasis_lid(), geomga_rzero()]))
  let t1443 = @term_syntax.parse_term("(y : Cart[Real, Geomalg[P, Q, R]]) => (x' : Cart[Real, Geomalg[P, Q, R]]) * (x' * y)")
  let t1446 = @tactics.disch_then(fn(x1445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1441 = @tactics.mp_tac(x1440)
      fn(x1442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1441(x1442)
      }
    })(((x1444 : @kernel.Thm) => @equal.ap_term(t1443, x1444))(x1445))
  })
  let t1437 = @term_syntax.parse_term("(x' : Cart[Real, Geomalg[P, Q, R]])")
  let t1439 = @tactics.disch_then((x1438 : @kernel.Thm) => @tactics.x_choose_tac(t1437, x1438))
  let t1435 = @simp.simp_tac(@list.List([@realax.real_mul_linv(), @vectors.vector_mul_lid()]))
  let t1434 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), mvbasis_eq_0(), @sets.empty_subset(), @vectors.vector_mul_assoc()]))
  let t1433 = @simp.rewrite_tac(@list.List([vector_geomga_refl()]))
  let t1432 = @simp.rewrite_tac(@list.List([geomga_lmul()]))
  let t1431 = @tactics.pop_assum(fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1429 = @tactics.mp_tac(x1428)
    fn(x1430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1429(x1430)
    }
  })
  let t1436 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(inv((sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)((x : Cart[Real, Trip_fin_sum[P, Q, R]]), i) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i)) - (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))), (i : Num) => (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))) * (op_dollar : (Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Real)(x, i + (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool))))), (multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(x))"))), t1431), t1432), t1433), t1434), t1435), @tactics.all_tac])
  let t1449 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([is_null(), mvinvertible_left_inverse(), @equal.gsym(vector_geomga_inner_refl_eq())]))), @tactics.eq_tac), t1436), t1439), t1446), t1447), t1448)
  mvinvertible_vector_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], !is_null(multivec(x)) == mvinvertible(multivec(x))"), t1449))
}

///|
let mvinvertible_vector_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_VECTOR_EQ")

///|
/// `MVINVERTIBLE_VECTOR_EQ`
pub fn mvinvertible_vector_eq() -> @kernel.Thm {
  mvinvertible_vector_eq_c.get()
}

///|
/// MVINVERTIBLE_GEOM
fn step_237() -> Unit raise {
  let t1475 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis_lid()]))
  let t1474 = @simp.gen_rewrite_tac(fn(x1473 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1469 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1463 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1464 = @equal.land_conv(x1463)
        fn(x1465 : @kernel.Term) -> @kernel.Thm raise {
          s1464(x1465)
        }
      })((fn(x1466 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1467 = @equal.rand_conv(x1466)
        fn(x1468 : @kernel.Term) -> @kernel.Thm raise {
          s1467(x1468)
        }
      })(x1469))
    })((fn(x1470 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1471 = @equal.once_depth_conv(x1470)
      fn(x1472 : @kernel.Term) -> @kernel.Thm raise {
        s1471(x1472)
      }
    })(x1473))
  }, @list.List([geomga_assoc()]))
  let t1462 = @simp.rewrite_tac(@list.List([@equal.gsym(geomga_assoc())]))
  let t1461 = @tactics.exists_tac(@term_syntax.parse_term("(b' : Cart[Real, Geomalg[P, Q, R]]) * (a' : Cart[Real, Geomalg[P, Q, R]])"))
  let t1460 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b' : Cart[Real, Geomalg[P, Q, R]])"))(fn(x1457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1458 = @tactics.mp_tac(x1457)
    fn(x1459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1458(x1459)
    }
  }))
  let t1456 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a' : Cart[Real, Geomalg[P, Q, R]])"))(fn(x1453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1454 = @tactics.mp_tac(x1453)
    fn(x1455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1454(x1455)
    }
  }))
  let t1451 = @equal.gsym(@theorems.left_exists_and_thm())
  let t1452 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.right_exists_and_thm()), t1451]))
  let t1450 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1476 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mvinvertible_left_inverse()])), t1450), t1452), t1456), t1460), @tactics.strip_tac), t1461), t1462), t1474), t1475)
  mvinvertible_geom_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : Cart[Real, Geomalg[P, Q, R]], mvinvertible(a) && mvinvertible(b) → mvinvertible(a * b)"), t1476))
}

///|
let mvinvertible_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_GEOM")

///|
/// `MVINVERTIBLE_GEOM`
pub fn mvinvertible_geom() -> @kernel.Thm {
  mvinvertible_geom_c.get()
}

///|
/// MVINVERTIBLE_LMUL_EQ
fn step_238() -> Unit raise {
  let t1478 = @meson.asm_meson_tac(@list.List([geomga_assoc(), geom_mvbasis_lid()]))
  let t1477 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1479 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mvinvertible_mvinverse()])), t1477), t1478)
  mvinvertible_lmul_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : Cart[Real, Geomalg[P, Q, R]], ∀ x : Cart[Real, Geomalg[P, Q, R]], mvinvertible(x) → (a == b) == (x * a == x * b)"), t1479))
}

///|
let mvinvertible_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_LMUL_EQ")

///|
/// `MVINVERTIBLE_LMUL_EQ`
pub fn mvinvertible_lmul_eq() -> @kernel.Thm {
  mvinvertible_lmul_eq_c.get()
}

///|
/// MVINVERTIBLE_EQ_LMUL
fn step_239() -> Unit raise {
  let t1480 = @meson.meson_tac(@list.List([mvinvertible_lmul_eq()]))
  mvinvertible_eq_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : Cart[Real, Geomalg[P, Q, R]], ∀ x : Cart[Real, Geomalg[P, Q, R]], mvinvertible(x) && x * a == x * b → a == b"), t1480))
}

///|
let mvinvertible_eq_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_EQ_LMUL")

///|
/// `MVINVERTIBLE_EQ_LMUL`
pub fn mvinvertible_eq_lmul() -> @kernel.Thm {
  mvinvertible_eq_lmul_c.get()
}

///|
/// MVINVERSE_GEOM
fn step_240() -> Unit raise {
  let t1529 = @simp.asm_rewrite_tac(@list.List([geom_mvbasis_lid()]))
  let t1528 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1527 = @simp.asm_rewrite_tac(@list.List([]))
  let t1526 = @tactics.pop_assum(fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1524 = @tactics.mp_tac(x1523)
    fn(x1525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1524(x1525)
    }
  })
  let t1522 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(a : Cart[Real, Geomalg[P, Q, R]])"), mvinvertible_mvinverse()))
  let t1521 = @simp.asm_rewrite_tac(@list.List([]))
  let t1520 = @tactics.pop_assum(fn(x1517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1518 = @tactics.mp_tac(x1517)
    fn(x1519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1518(x1519)
    }
  })
  let t1516 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(b : Cart[Real, Geomalg[P, Q, R]])"), mvinvertible_mvinverse()))
  let t1515 = @simp.rewrite_tac(@list.List([mvinvertible_mvinverse()]))
  let t1514 = @tactics.pop_assum(fn(x1511 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1512 = @tactics.mp_tac(x1511)
    fn(x1513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1512(x1513)
    }
  })
  let t1510 = @simp.gen_rewrite_tac(fn(x1509 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1505 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1499 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1500 = @equal.land_conv(x1499)
        fn(x1501 : @kernel.Term) -> @kernel.Thm raise {
          s1500(x1501)
        }
      })((fn(x1502 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1503 = @equal.rand_conv(x1502)
        fn(x1504 : @kernel.Term) -> @kernel.Thm raise {
          s1503(x1504)
        }
      })(x1505))
    })((fn(x1506 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1507 = @equal.once_depth_conv(x1506)
      fn(x1508 : @kernel.Term) -> @kernel.Thm raise {
        s1507(x1508)
      }
    })(x1509))
  }, @list.List([geomga_assoc()]))
  let t1498 = @simp.gen_rewrite_tac(fn(x1497 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1491 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1492 = @equal.land_conv(x1491)
      fn(x1493 : @kernel.Term) -> @kernel.Thm raise {
        s1492(x1493)
      }
    })((fn(x1494 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1495 = @equal.once_depth_conv(x1494)
      fn(x1496 : @kernel.Term) -> @kernel.Thm raise {
        s1495(x1496)
      }
    })(x1497))
  }, @list.List([@equal.gsym(geomga_assoc())]))
  let t1490 = @simp.asm_rewrite_tac(@list.List([]))
  let t1489 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, Geomalg[P, Q, R]]) * (b : Cart[Real, Geomalg[P, Q, R]])"))
  let t1488 = @tactics.match_mp_tac(mvinvertible_eq_lmul())
  let t1487 = @simp.asm_rewrite_tac(@list.List([]))
  let t1486 = @tactics.pop_assum(fn(x1483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1484 = @tactics.mp_tac(x1483)
    fn(x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1484(x1485)
    }
  })
  let t1481 = @term_syntax.parse_term("(b : Cart[Real, Geomalg[P, Q, R]])")
  let t1482 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Geomalg[P, Q, R]])"), t1481]), mvinvertible_geom()))
  let t1530 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1482), t1486), t1487), @tactics.strip_tac), t1488), t1489), t1490), t1498), t1510), t1514), t1515), @tactics.strip_tac), t1516), t1520), t1521), t1522), t1526), t1527), t1528), t1529)
  mvinverse_geom_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : Cart[Real, Geomalg[P, Q, R]], mvinvertible(a) && mvinvertible(b) → mvinverse(b) * mvinverse(a) == mvinverse(a * b)"), t1530))
}

///|
let mvinverse_geom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERSE_GEOM")

///|
/// `MVINVERSE_GEOM`
pub fn mvinverse_geom() -> @kernel.Thm {
  mvinverse_geom_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1829
fn step_241() -> Unit raise {
  @preterm.make_overloadable("outermorphism", @term_syntax.parse_type("((Cart[Real, M]) -> Cart[Real, N], Cart[Real, A]) -> Cart[Real, B]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:1830
fn step_242() -> Unit raise {
  @preterm.overload_interface("outermorphism", @term_syntax.parse_term("(outergamorphism : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[S, T, U]])"))
}

///|
/// outergamorphism
fn step_243() -> Unit raise {
  outergamorphism_c.set(@pair.new_definition(@term_syntax.parse_term("(outergamorphism : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[S, T, U]])((f : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]]), (x : Cart[Real, Geomalg[P, Q, R]])) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (s : (Num) -> Bool) => (op_pct : (Real, Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]])((setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s), (seqiterate : ((Cart[Real, Geomalg[S, T, U]], Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]])((outer : (Cart[Real, Geomalg[S, T, U]], Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]]), s, (o : ((Cart[Real, Trip_fin_sum[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]], (Num) -> Cart[Real, Trip_fin_sum[S, T, U]], Num) -> Cart[Real, Geomalg[S, T, U]])((multivec : (Cart[Real, Trip_fin_sum[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]]), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Trip_fin_sum[S, T, U]])(f, (basis : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]]))))))")))
}

///|
let outergamorphism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outergamorphism")

///|
/// `outergamorphism`
pub fn outergamorphism() -> @kernel.Thm {
  outergamorphism_c.get()
}

///|
/// NEUTRAL_OUTERGA
fn step_244() -> Unit raise {
  let t1532 = @meson.meson_tac(@list.List([outer_mvbasis_lscalar(), outer_mvbasis_rscalar()]))
  let t1531 = @tactics.match_mp_tac(@class.select_unique())
  let t1533 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t1531), t1532)
  neutral_outerga_c.set(@tactics.prove(@term_syntax.parse_term("(neutral : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((outer : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({})"), t1533))
}

///|
let neutral_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_OUTERGA")

///|
/// `NEUTRAL_OUTERGA`
pub fn neutral_outerga() -> @kernel.Thm {
  neutral_outerga_c.get()
}

///|
/// NEUTRAL_GEOMGA
fn step_245() -> Unit raise {
  let t1535 = @meson.meson_tac(@list.List([geom_mvbasis_lid(), geom_mvbasis_rid()]))
  let t1534 = @tactics.match_mp_tac(@class.select_unique())
  let t1536 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t1534), t1535)
  neutral_geomga_c.set(@tactics.prove(@term_syntax.parse_term("(neutral : ((Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((op_star : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({})"), t1536))
}

///|
let neutral_geomga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_GEOMGA")

///|
/// `NEUTRAL_GEOMGA`
pub fn neutral_geomga() -> @kernel.Thm {
  neutral_geomga_c.get()
}

///|
/// OUTERMORPHISM_MVBASIS
fn step_246() -> Unit raise {
  let t1540 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vsum_delta(), @sets.in_elim_thm(), @vectors.vector_mul_lid()]))
  let t1539 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t1538 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1537 = @simp.simp_tac(@list.List([mvbasis_component()]))
  let t1541 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([outergamorphism()])), t1537), t1538), t1539), t1540)
  outermorphism_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], ∀ s : (Num) -> Bool, ∀ t : _, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) → (outergamorphism : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[S, T, U]])(f, (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == (seqiterate : ((Cart[Real, Geomalg[S, T, U]], Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]])((outer : (Cart[Real, Geomalg[S, T, U]], Cart[Real, Geomalg[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]]), s, (o : ((Cart[Real, Trip_fin_sum[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]], (Num) -> Cart[Real, Trip_fin_sum[S, T, U]], Num) -> Cart[Real, Geomalg[S, T, U]])((multivec : (Cart[Real, Trip_fin_sum[S, T, U]]) -> Cart[Real, Geomalg[S, T, U]]), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Trip_fin_sum[S, T, U]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Trip_fin_sum[S, T, U]])(f, (basis : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]]))))"), t1541))
}

///|
let outermorphism_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERMORPHISM_MVBASIS")

///|
/// `OUTERMORPHISM_MVBASIS`
pub fn outermorphism_mvbasis() -> @kernel.Thm {
  outermorphism_mvbasis_c.get()
}

///|
/// OUTERMORPHISM_MVBASIS_EMPTY
fn step_247() -> Unit raise {
  let t1542 = @simp.rewrite_tac(@list.List([neutral_outerga()]))
  let t1543 = @tactics.then_tac(@simp.simp_tac(@list.List([outermorphism_mvbasis(), @sets.empty_subset(), @clifford.seqiterate_clauses()])), t1542)
  outermorphism_mvbasis_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Trip_fin_sum[_, _, _]]) -> Cart[Real, Trip_fin_sum[_, _, _]], outergamorphism(f, mbasis({})) == mbasis({})"), t1543))
}

///|
let outermorphism_mvbasis_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTERMORPHISM_MVBASIS_EMPTY")

///|
/// `OUTERMORPHISM_MVBASIS_EMPTY`
pub fn outermorphism_mvbasis_empty() -> @kernel.Thm {
  outermorphism_mvbasis_empty_c.get()
}

///|
/// SEQITERATE_NUMSEG_IMAGE
fn step_248() -> Unit raise {
  let t1600 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @clifford.seqiterate_clauses(), @trivia.o_thm()]))
  let t1599 = @tactics.disch_then(fn(x1596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1597 = @tactics.subst1_tac(x1596)
    fn(x1598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1597(x1598)
    }
  })
  let t1593 = @term_syntax.parse_term("SUC((n : Num))")
  let t1594 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1593]), @iterate.numseg_empty()))
  let t1595 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@arith.not_le())]))(t1594)]))
  let t1592 = @tactics.pop_assum(fn(x1589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1590 = @tactics.mp_tac(x1589)
    fn(x1591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1590(x1591)
    }
  })
  let t1587 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @clifford.seqiterate_clauses(), @trivia.o_thm()]))
  let t1584 = @term_syntax.parse_term("(n : Num)")
  let t1585 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1584]), @iterate.numseg_empty()))
  let t1586 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1585)]))
  let t1581 = @equal.gsym(@arith.add_assoc())
  let t1582 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @iterate.numseg_offset_image(), @equal.gsym(@sets.image_o()), @trivia.o_def(), t1581]))
  let t1580 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1578 = @tactics.disch_then(fn(x1575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1576 = @tactics.subst1_tac(x1575)
    fn(x1577 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1576(x1577)
    }
  })
  let t1574 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t1579 = @tactics.repeat_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm()])), t1574), @tactics.all_tac])), @int.asm_arith_tac), @tactics.all_tac])), t1578))
  let t1573 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_image(), @sets.image_eq_empty(), @sets.extension(), @iterate.in_numseg(), @sets.not_in_empty(), @sets.in_image()]))
  let t1571 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1568 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, SUC((n : Num)))")
  let t1569 = @term_syntax.parse_term("(m : Num)")
  let t1570 = @term_syntax.parse_term("o((f : (Num) -> Cart[Real, Geomalg[P, Q, R]]), (i : Num) => i + (p : Num))")
  let t1572 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1570, t1569, t1568]), t1571))
  let t1567 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1564 = @term_syntax.parse_term("IMAGE((i : Num) => i + (p : Num), op_dot_dot((m : Num) + 1, SUC((n : Num))))")
  let t1565 = @term_syntax.parse_term("(m : Num) + (p : Num)")
  let t1566 = @term_syntax.parse_term("(f : (Num) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1583 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1566, t1565, t1564]), t1567)), t1572), t1573), t1579), t1580), @tactics.ap_term_tac), t1582), @tactics.all_tac])
  let t1563 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1562 = @tactics.pop_assum(fn(x1559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1560 = @tactics.mp_tac(x1559)
    fn(x1561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1560(x1561)
    }
  })
  let t1588 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec()), @sets.image_clauses(), @trivia.o_thm()])), t1562), t1563), @tactics.strip_tac), t1583), t1586), t1587), @tactics.all_tac])
  let t1558 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= SUC((n : Num))"))
  let t1557 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1556 = @simp.asm_rewrite_tac(@list.List([@iterate.numseg_sing(), @sets.image_clauses(), @clifford.seqiterate_clauses(), @trivia.o_thm()]))
  let t1554 = @tactics.disch_then(fn(x1551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1552 = @tactics.subst1_tac(x1551)
    fn(x1553 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1552(x1553)
    }
  })
  let t1548 = @term_syntax.parse_term("0")
  let t1549 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1548]), @iterate.numseg_empty()))
  let t1550 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@arith.lt_nz()]))(t1549)]))
  let t1555 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x1545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1546 = @tactics.mp_tac(x1545)
    fn(x1547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1546(x1547)
    }
  }), t1550), t1554)])
  let t1544 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1601 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1544), t1555), t1556), @tactics.all_tac])), t1557), t1558), t1588), t1592), t1595), t1599), t1600)
  seqiterate_numseg_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], ∀ m : Num, ∀ p : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], seqiterate(op, IMAGE((i : Num) => i + p, op_dot_dot(m, n)), f) == seqiterate(op, op_dot_dot(m, n), o(f, (i : Num) => i + p))"), t1601))
}

///|
let seqiterate_numseg_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_NUMSEG_IMAGE")

///|
/// `SEQITERATE_NUMSEG_IMAGE`
pub fn seqiterate_numseg_image() -> @kernel.Thm {
  seqiterate_numseg_image_c.get()
}

///|
/// SEQITERATE_NUMSEG_SUC
fn step_249() -> Unit raise {
  let t1683 = @simp.asm_rewrite_tac(@list.List([@clifford.seqiterate_clauses()]))
  let t1681 = @term_syntax.parse_term("(n : Num)")
  let t1682 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1681]), @iterate.numseg_empty()))
  let t1684 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.add1(), @simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1682)])), t1683)
  let t1680 = @simp.rewrite_tac(@list.List([@arith.add1(), @iterate.numseg_sing(), @clifford.seqiterate_clauses(), @trivia.o_thm()]))
  let t1677 = @term_syntax.parse_term("(n : Num)")
  let t1678 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1677]), @iterate.numseg_empty()))
  let t1679 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1678)]))
  let t1676 = @tactics.disch_then(fn(x1673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1674 = @tactics.subst1_tac(x1673)
    fn(x1675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1674(x1675)
    }
  })
  let t1671 = @tactics.exists_tac(@term_syntax.parse_term("SUC(SUC((n : Num)))"))
  let t1672 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm()])), t1671), @tactics.all_tac])), @int.asm_arith_tac), @tactics.all_tac])
  let t1670 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.extension(), @iterate.in_numseg(), @sets.not_in_empty()]))
  let t1668 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_le(), @trivia.o_thm()]))
  let t1667 = @tactics.pop_assum(fn(x1664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1665 = @tactics.mp_tac(x1664)
    fn(x1666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1665(x1666)
    }
  })
  let t1663 = @simp.rewrite_tac(@list.List([@iterate.numseg_offset_image(), seqiterate_numseg_image()]))
  let t1662 = @simp.once_rewrite_tac(@list.List([@arith.add1()]))
  let t1661 = @simp.asm_rewrite_tac(@list.List([]))
  let t1659 = @tactics.disch_then(fn(x1656 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1657 = @tactics.subst1_tac(x1656)
    fn(x1658 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1657(x1658)
    }
  })
  let t1655 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t1660 = @tactics.repeat_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm()])), t1655), @tactics.all_tac])), @int.asm_arith_tac), @tactics.all_tac])), t1659))
  let t1654 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.extension(), @iterate.in_numseg(), @sets.not_in_empty()]))
  let t1653 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1650 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, SUC((n : Num)))")
  let t1651 = @term_syntax.parse_term("(m : Num)")
  let t1652 = @term_syntax.parse_term("(f : (Num) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1669 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1652, t1651, t1650]), t1653)), t1654), t1660), t1661), @tactics.ap_term_tac), t1662), t1663), t1667), t1668), @tactics.all_tac])
  let t1649 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1648 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec())]))
  let t1647 = @tactics.pop_assum(fn(x1644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1645 = @tactics.mp_tac(x1644)
    fn(x1646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1645(x1646)
    }
  })
  let t1643 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1640 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, SUC(SUC((n : Num))))")
  let t1641 = @term_syntax.parse_term("(m : Num)")
  let t1642 = @term_syntax.parse_term("(f : (Num) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1685 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1642, t1641, t1640]), t1643)), t1647), t1648), t1649), @tactics.strip_tac), t1669), t1670), @tactics.ants_tac), t1672), t1676), t1679), t1680)
  let t1639 = @simp.asm_rewrite_tac(@list.List([@clifford.seqiterate_clauses()]))
  let t1636 = @term_syntax.parse_term("(n : Num)")
  let t1637 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1636]), @iterate.numseg_empty()))
  let t1638 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1637)]))
  let t1635 = @simp.gen_rewrite_tac(fn(x1634 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1630 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1624 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1625 = @equal.rand_conv(x1624)
        fn(x1626 : @kernel.Term) -> @kernel.Thm raise {
          s1625(x1626)
        }
      })((fn(x1627 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1628 = @equal.land_conv(x1627)
        fn(x1629 : @kernel.Term) -> @kernel.Thm raise {
          s1628(x1629)
        }
      })(x1630))
    })((fn(x1631 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1632 = @equal.depth_conv(x1631)
      fn(x1633 : @kernel.Term) -> @kernel.Thm raise {
        s1632(x1633)
      }
    })(x1634))
  }, @list.List([@arith.one(), @arith.add1()]))
  let t1686 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.one())])), t1635), t1638), t1639)
  let t1623 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < 1"))]))
  let t1622 = @simp.rewrite_tac(@list.List([@sets.finite_sing(), @sets.extension(), @sets.in_sing(), @sets.not_in_empty()]))
  let t1621 = @tactics.match_mp_tac(@lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses())))
  let t1620 = @simp.gen_rewrite_tac(fn(x1619 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1615 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1609 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1610 = @equal.rand_conv(x1609)
        fn(x1611 : @kernel.Term) -> @kernel.Thm raise {
          s1610(x1611)
        }
      })((fn(x1612 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1613 = @equal.rand_conv(x1612)
        fn(x1614 : @kernel.Term) -> @kernel.Thm raise {
          s1613(x1614)
        }
      })(x1615))
    })((fn(x1616 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1617 = @equal.once_depth_conv(x1616)
      fn(x1618 : @kernel.Term) -> @kernel.Thm raise {
        s1617(x1618)
      }
    })(x1619))
  }, @list.List([@equal.gsym(@clifford.seqiterate_clauses())]))
  let t1608 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses()]))
  let t1607 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_sing()]))
  let t1687 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1605
    @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@arith.le()]))(th)]))
  }), t1607), t1608), t1620), t1621), t1622), t1623), t1686, t1685, t1684])
  let t1604 = @simp.rewrite_tac(@list.List([@arith.lt_suc_le()]))
  let t1603 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1602 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1688 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec())]))), t1602), @tactics.disch_tac), t1603), t1604), @tactics.strip_tac), t1687)
  seqiterate_numseg_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ op : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], (∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], ∀ z : Cart[Real, Geomalg[P, Q, R]], op(op(x, y), z) == op(x, op(y, z)) && op(neutral(op), x) == x) → m <= SUC(n) → seqiterate(op, op_dot_dot(m, SUC(n)), f) == op(seqiterate(op, op_dot_dot(m, n), f), f(SUC(n)))"), t1688))
}

///|
let seqiterate_numseg_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_NUMSEG_SUC")

///|
/// `SEQITERATE_NUMSEG_SUC`
pub fn seqiterate_numseg_suc() -> @kernel.Thm {
  seqiterate_numseg_suc_c.get()
}

///|
/// SEQITERATE_OUTERGA_LREC
fn step_250() -> Unit raise {
  let t1709 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), neutral_outerga(), outer_mvbasis_rscalar()]))
  let t1706 = @term_syntax.parse_term("(n : Num)")
  let t1707 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1706]), @iterate.numseg_empty()))
  let t1708 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1707)]))
  let t1704 = @tactics.disch_then(fn(x1702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1702
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1700 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1701 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm()])), t1700), @tactics.all_tac])), @int.asm_arith_tac), @tactics.all_tac])
  let t1699 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.extension(), @iterate.in_numseg(), @sets.not_in_empty()]))
  let t1698 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1695 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, (n : Num))")
  let t1696 = @term_syntax.parse_term("(m : Num)")
  let t1697 = @term_syntax.parse_term("(f : (Num) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1705 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1697, t1696, t1695]), t1698)), t1699), @tactics.ants_tac), t1701), t1704), @tactics.all_tac])
  let t1694 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1693 = @tactics.pop_assum(fn(x1690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1691 = @tactics.mp_tac(x1690)
    fn(x1692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1691(x1692)
    }
  })
  let t1689 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec())]))
  let t1710 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1689), t1693), t1694), @tactics.strip_tac), t1705), t1708), t1709)
  seqiterate_outerga_lrec_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], m <= n → seqiterate(outer, op_dot_dot(m, n), f) == outer(f(m), seqiterate(outer, op_dot_dot(m + 1, n), f))"), t1710))
}

///|
let seqiterate_outerga_lrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_LREC")

///|
/// `SEQITERATE_OUTERGA_LREC`
pub fn seqiterate_outerga_lrec() -> @kernel.Thm {
  seqiterate_outerga_lrec_c.get()
}

///|
/// SEQITERATE_OUTERGA_RREC
fn step_251() -> Unit raise {
  let t1712 = @term_syntax.parse_term("(outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1713 = @term_syntax.parse_term("(m : Num)")
  let t1714 = @bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num)"), t1713, t1712]), seqiterate_numseg_suc())
  let t1715 = @simp.rewrite_rule(@list.List([outerga_assoc(), neutral_outerga(), outer_mvbasis_lscalar()]))(t1714)
  let t1711 = @term_syntax.parse_term("(m : Num)")
  seqiterate_outerga_rrec_c.set(@bool.genl(@list.List([@term_syntax.parse_term("(n : Num)"), t1711]), t1715))
}

///|
let seqiterate_outerga_rrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_RREC")

///|
/// `SEQITERATE_OUTERGA_RREC`
pub fn seqiterate_outerga_rrec() -> @kernel.Thm {
  seqiterate_outerga_rrec_c.get()
}

///|
/// SEQITERATE_GEOMGA_LREC
fn step_252() -> Unit raise {
  let t1736 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), neutral_geomga(), geom_mvbasis_rid()]))
  let t1733 = @term_syntax.parse_term("(n : Num)")
  let t1734 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1733]), @iterate.numseg_empty()))
  let t1735 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1734)]))
  let t1731 = @tactics.disch_then(fn(x1729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1729
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1727 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1728 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm()])), t1727), @tactics.all_tac])), @int.asm_arith_tac), @tactics.all_tac])
  let t1726 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.extension(), @iterate.in_numseg(), @sets.not_in_empty()]))
  let t1725 = @lib.last(@bool.conjuncts_rule(@clifford.seqiterate_clauses()))
  let t1722 = @term_syntax.parse_term("op_dot_dot((m : Num) + 1, (n : Num))")
  let t1723 = @term_syntax.parse_term("(m : Num)")
  let t1724 = @term_syntax.parse_term("(f : (Num) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1732 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(op_star : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"), t1724, t1723, t1722]), t1725)), t1726), @tactics.ants_tac), t1728), t1731), @tactics.all_tac])
  let t1721 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1720 = @tactics.pop_assum(fn(x1717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1718 = @tactics.mp_tac(x1717)
    fn(x1719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1718(x1719)
    }
  })
  let t1716 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec())]))
  let t1737 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1716), t1720), t1721), @tactics.strip_tac), t1732), t1735), t1736)
  seqiterate_geomga_lrec_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], m <= n → seqiterate(op_star, op_dot_dot(m, n), f) == f(m) * seqiterate(op_star, op_dot_dot(m + 1, n), f)"), t1737))
}

///|
let seqiterate_geomga_lrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_GEOMGA_LREC")

///|
/// `SEQITERATE_GEOMGA_LREC`
pub fn seqiterate_geomga_lrec() -> @kernel.Thm {
  seqiterate_geomga_lrec_c.get()
}

///|
/// SEQITERATE_GEOMGA_RREC
fn step_253() -> Unit raise {
  let t1739 = @term_syntax.parse_term("(op_star : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])")
  let t1740 = @term_syntax.parse_term("(m : Num)")
  let t1741 = @bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num)"), t1740, t1739]), seqiterate_numseg_suc())
  let t1742 = @simp.rewrite_rule(@list.List([geomga_assoc(), neutral_geomga(), geom_mvbasis_lid()]))(t1741)
  let t1738 = @term_syntax.parse_term("(m : Num)")
  seqiterate_geomga_rrec_c.set(@bool.genl(@list.List([@term_syntax.parse_term("(n : Num)"), t1738]), t1742))
}

///|
let seqiterate_geomga_rrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_GEOMGA_RREC")

///|
/// `SEQITERATE_GEOMGA_RREC`
pub fn seqiterate_geomga_rrec() -> @kernel.Thm {
  seqiterate_geomga_rrec_c.get()
}

///|
/// OUTER_SEQITERATE_SYM
fn step_254() -> Unit raise {
  let t1757 = @simp.rewrite_tac(@list.List([@arith.sub_refl(), @calc_num.arith(), @realax.real_pow()]))
  let t1756 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → SUC(n) - m + 1 == SUC(n - m + 1)"))]))
  let t1755 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_minus1(), @vectors.vector_mul_assoc(), outerga_rneg(), @vectors.vector_mul_rneg(), @equal.gsym(@vectors.vector_mul_lneg())]))
  let t1754 = @simp.gen_rewrite_tac(fn(x1753 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1747 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1748 = @equal.land_conv(x1747)
      fn(x1749 : @kernel.Term) -> @kernel.Thm raise {
        s1748(x1749)
      }
    })((fn(x1750 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1751 = @equal.once_depth_conv(x1750)
      fn(x1752 : @kernel.Term) -> @kernel.Thm raise {
        s1751(x1752)
      }
    })(x1753))
  }, @list.List([vector_outerga_skewsym()]))
  let t1746 = @simp.rewrite_tac(@list.List([outerga_lmul(), @equal.gsym(outerga_assoc())]))
  let t1745 = @simp.asm_simp_tac(@list.List([outerga_assoc()]))
  let t1744 = @simp.asm_simp_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses(), @calc_num.arith(), @trivia.o_thm(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m <= SUC(n)")), seqiterate_outerga_rrec()]))
  let t1743 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1758 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.le()]))), t1743), t1744), t1745), t1746), t1754), t1755), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1756), t1757), @calc_rat.real_arith_tac)
  outer_seqiterate_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], ∀ f : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], m <= n → outer(multivec(x), seqiterate(outer, op_dot_dot(m, n), o(multivec, f))) == op_pct(pow(-real_of_num(1), n - m + 1), outer(seqiterate(outer, op_dot_dot(m, n), o(multivec, f)), multivec(x)))"), t1758))
}

///|
let outer_seqiterate_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OUTER_SEQITERATE_SYM")

///|
/// `OUTER_SEQITERATE_SYM`
pub fn outer_seqiterate_sym() -> @kernel.Thm {
  outer_seqiterate_sym_c.get()
}

///|
/// SEQITERATE_SPLIT_NUMSEG_OUTERGA
fn step_255() -> Unit raise {
  let t1777 = @simp.asm_rewrite_tac(@list.List([]))
  let t1776 = @tactics.match_mp_tac(seqiterate_outerga_lrec())
  let t1772 = @simp.gen_rewrite_tac(fn(x1771 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1765 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1766 = @equal.land_conv(x1765)
      fn(x1767 : @kernel.Term) -> @kernel.Thm raise {
        s1766(x1767)
      }
    })((fn(x1768 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1769 = @equal.depth_conv(x1768)
      fn(x1770 : @kernel.Term) -> @kernel.Thm raise {
        s1769(x1770)
      }
    })(x1771))
  }, @list.List([@equal.gsym(@arith.add1())]))
  let t1764 = @simp.rewrite_tac(@list.List([@equal.gsym(outerga_assoc())]))
  let t1763 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (i : Num) → m <= SUC(i)")), seqiterate_outerga_rrec()]))
  let t1773 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(m : Num) <= (i : Num) && i <= (n : Num)"), fn(x1760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1761 = @tactics.assume_tac(x1760)
    fn(x1762 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1761(x1762)
    }
  }), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1763), t1764), @tactics.ap_term_tac), t1772)
  let t1774 = @simp.asm_rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()]))
  let t1775 = @list.List([@simp.asm_rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()])), t1774, t1773])
  let t1759 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1778 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.le()]))), t1759), t1775), t1776), t1777)
  seqiterate_split_numseg_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ m : Num, ∀ n : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], m <= i && i <= n → seqiterate(outer, op_dot_dot(m, n), f) == outer(seqiterate(outer, op_dot_dot(m, i), f), seqiterate(outer, op_dot_dot(i + 1, n), f))"), t1778))
}

///|
let seqiterate_split_numseg_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_SPLIT_NUMSEG_OUTERGA")

///|
/// `SEQITERATE_SPLIT_NUMSEG_OUTERGA`
pub fn seqiterate_split_numseg_outerga() -> @kernel.Thm {
  seqiterate_split_numseg_outerga_c.get()
}

///|
/// SEQITERATE_SPLIT_NUMSEG_GEOMGA
fn step_256() -> Unit raise {
  let t1797 = @simp.asm_rewrite_tac(@list.List([]))
  let t1796 = @tactics.match_mp_tac(seqiterate_geomga_lrec())
  let t1792 = @simp.gen_rewrite_tac(fn(x1791 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1785 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1786 = @equal.land_conv(x1785)
      fn(x1787 : @kernel.Term) -> @kernel.Thm raise {
        s1786(x1787)
      }
    })((fn(x1788 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1789 = @equal.depth_conv(x1788)
      fn(x1790 : @kernel.Term) -> @kernel.Thm raise {
        s1789(x1790)
      }
    })(x1791))
  }, @list.List([@equal.gsym(@arith.add1())]))
  let t1784 = @simp.rewrite_tac(@list.List([@equal.gsym(geomga_assoc())]))
  let t1783 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (i : Num) → m <= SUC(i)")), seqiterate_geomga_rrec()]))
  let t1793 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(m : Num) <= (i : Num) && i <= (n : Num)"), fn(x1780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1781 = @tactics.assume_tac(x1780)
    fn(x1782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1781(x1782)
    }
  }), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1783), t1784), @tactics.ap_term_tac), t1792)
  let t1794 = @simp.asm_rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()]))
  let t1795 = @list.List([@simp.asm_rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()])), t1794, t1793])
  let t1779 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1798 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.le()]))), t1779), t1795), t1796), t1797)
  seqiterate_split_numseg_geomga_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ m : Num, ∀ n : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], m <= i && i <= n → seqiterate(op_star, op_dot_dot(m, n), f) == seqiterate(op_star, op_dot_dot(m, i), f) * seqiterate(op_star, op_dot_dot(i + 1, n), f)"), t1798))
}

///|
let seqiterate_split_numseg_geomga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_SPLIT_NUMSEG_GEOMGA")

///|
/// `SEQITERATE_SPLIT_NUMSEG_GEOMGA`
pub fn seqiterate_split_numseg_geomga() -> @kernel.Thm {
  seqiterate_split_numseg_geomga_c.get()
}

///|
/// SEQITERATE_OUTERGA_SPLIT3
fn step_257() -> Unit raise {
  let t1862 = @tactics.match_mp_tac(seqiterate_split_numseg_outerga())
  let t1861 = @tactics.first_assum(fn(x1860 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1858 = @tactics.subst1_tac(x1857)
      fn(x1859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1858(x1859)
      }
    })(@equal.sym(x1860))
  })
  let t1856 = @simp.asm_simp_tac(@list.List([@equal.gsym(seqiterate_outerga_rrec())]))
  let t1855 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) + 1 <= SUC((j : Num) - 1)"), fn(x1852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1853 = @tactics.assume_tac(x1852)
    fn(x1854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1853(x1854)
    }
  })
  let t1851 = @simp.rewrite_tac(@list.List([outerga_assoc()]))
  let t1850 = @tactics.first_assum(fn(x1833 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1833
    @simp.gen_rewrite_tac(fn(x1849 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1845 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1841 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x1835 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1836 = @equal.rand_conv(x1835)
            fn(x1837 : @kernel.Term) -> @kernel.Thm raise {
              s1836(x1837)
            }
          })((fn(x1838 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1839 = @equal.rand_conv(x1838)
            fn(x1840 : @kernel.Term) -> @kernel.Thm raise {
              s1839(x1840)
            }
          })(x1841))
        })((fn(x1842 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1843 = @equal.land_conv(x1842)
          fn(x1844 : @kernel.Term) -> @kernel.Thm raise {
            s1843(x1844)
          }
        })(x1845))
      })((fn(x1846 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1847 = @equal.depth_conv(x1846)
        fn(x1848 : @kernel.Term) -> @kernel.Thm raise {
          s1847(x1848)
        }
      })(x1849))
    }, @list.List([th_1]))
  })
  let t1832 = @tactics.subgoal_then(@term_syntax.parse_term("(j : Num) == SUC(j - 1)"), fn(x1829 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1830 = @tactics.assume_tac(x1829)
    fn(x1831 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1830(x1831)
    }
  })
  let t1828 = @tactics.first_assum(fn(x1827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1825 = @tactics.subst1_tac(x1824)
      fn(x1826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1825(x1826)
      }
    })(@equal.sym(x1827))
  })
  let t1823 = @simp.rewrite_tac(@list.List([@equal.gsym(outerga_assoc())]))
  let t1822 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_rrec()]))
  let t1821 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) <= SUC((i : Num) - 1)"), fn(x1818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1819 = @tactics.assume_tac(x1818)
    fn(x1820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1819(x1820)
    }
  })
  let t1817 = @tactics.first_assum(fn(x1804 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1804
    @simp.gen_rewrite_tac(fn(x1816 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1812 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1806 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1807 = @equal.land_conv(x1806)
          fn(x1808 : @kernel.Term) -> @kernel.Thm raise {
            s1807(x1808)
          }
        })((fn(x1809 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1810 = @equal.land_conv(x1809)
          fn(x1811 : @kernel.Term) -> @kernel.Thm raise {
            s1810(x1811)
          }
        })(x1812))
      })((fn(x1813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1814 = @equal.depth_conv(x1813)
        fn(x1815 : @kernel.Term) -> @kernel.Thm raise {
          s1814(x1815)
        }
      })(x1816))
    }, @list.List([th]))
  })
  let t1803 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) == SUC(i - 1)"), fn(x1800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1801 = @tactics.assume_tac(x1800)
    fn(x1802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1801(x1802)
    }
  })
  let t1799 = @simp.asm_simp_tac(@list.List([seqiterate_split_numseg_outerga()]))
  let t1863 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1799), t1803), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1817), t1821), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1822), t1823), @tactics.ap_term_tac), t1828), @tactics.ap_term_tac), t1832), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1850), t1851), t1855), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1856), t1861), t1862), @int.asm_arith_tac)
  seqiterate_outerga_split3_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, ∀ m : Num, ∀ n : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], 0 < i && m <= i && i <= n && m <= j && j <= n && i < j → seqiterate(outer, op_dot_dot(m, n), f) == outer(seqiterate(outer, op_dot_dot(m, i - 1), f), outer(f(i), outer(seqiterate(outer, op_dot_dot(i + 1, j - 1), f), outer(f(j), seqiterate(outer, op_dot_dot(j + 1, n), f)))))"), t1863))
}

///|
let seqiterate_outerga_split3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_SPLIT3")

///|
/// `SEQITERATE_OUTERGA_SPLIT3`
pub fn seqiterate_outerga_split3() -> @kernel.Thm {
  seqiterate_outerga_split3_c.get()
}

///|
/// SEQITERATE_ZERO_OUTERGA
fn step_258() -> Unit raise {
  let t1882 = @simp.rewrite_tac(@list.List([outerga_lzero(), outerga_rzero()]))
  let t1881 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_rrec()]))
  let t1880 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) == SUC(i - 1)"), fn(x1877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1878 = @tactics.subst_all_tac(x1877)
    fn(x1879 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1878(x1879)
    }
  })
  let t1876 = @simp.asm_simp_tac(@list.List([seqiterate_split_numseg_outerga()]))
  let t1875 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1872 = @simp.rewrite_rule(@list.List([@equal.gsym(@arith.lt_nz())]))
  let t1874 = @tactics.pop_assum(fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1870 = @tactics.mp_tac(x1869)
      fn(x1871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1870(x1871)
      }
    })(t1872(x1873))
  })
  let t1867 = @simp.rewrite_tac(@list.List([outerga_lzero()]))
  let t1866 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_lrec()]))
  let t1865 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1868 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.le()])), t1865), t1866), t1867), @tactics.all_tac])
  let t1864 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t1883 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1864), t1868), t1874), t1875), t1876), t1880), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1881), t1882)
  seqiterate_zero_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Geomalg[P, Q, R]], ∀ i : Num, ∀ m : Num, ∀ n : Num, m <= i && i <= n && a(i) == vec(0) → seqiterate(outer, op_dot_dot(m, n), a) == vec(0)"), t1883))
}

///|
let seqiterate_zero_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_ZERO_OUTERGA")

///|
/// `SEQITERATE_ZERO_OUTERGA`
pub fn seqiterate_zero_outerga() -> @kernel.Thm {
  seqiterate_zero_outerga_c.get()
}

///|
/// SEQITERATE_OUTERGA_NUMSEG_EQ
fn step_259() -> Unit raise {
  let t1895 = @meson.meson_tac(@list.List([@iterate.numseg_empty(), @iterate.numseg_sing(), @clifford.seqiterate_clauses(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m <= SUC(n)")), seqiterate_outerga_rrec(), @arith.le_refl()]))
  let t1893 = @tactics.match_mp_tac(@arith.le_induct())
  let t1891 = @term_syntax.parse_term("(m : Num)")
  let t1892 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t1891)
  let t1890 = @term_syntax.parse_term("(n : Num)")
  let t1894 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1890), t1892), t1893), @tactics.all_tac])
  let t1889 = @tactics.pop_assum(fn(x1886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1887 = @tactics.mp_tac(x1886)
    fn(x1888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1887(x1888)
    }
  })
  let t1884 = @term_syntax.parse_term("(n : Num)")
  let t1885 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1884]), @arith.let_cases()))
  let t1896 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1885), @tactics.strip_tac), t1889), t1894), t1895)
  seqiterate_outerga_numseg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ f : (Num) -> Cart[Real, Geomalg[P, Q, R]], ∀ g : (Num) -> Cart[Real, Geomalg[P, Q, R]], (∀ x : Num, m <= x && x <= n → f(x) == g(x)) → seqiterate(outer, op_dot_dot(m, n), f) == seqiterate(outer, op_dot_dot(m, n), g)"), t1896))
}

///|
let seqiterate_outerga_numseg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_NUMSEG_EQ")

///|
/// `SEQITERATE_OUTERGA_NUMSEG_EQ`
pub fn seqiterate_outerga_numseg_eq() -> @kernel.Thm {
  seqiterate_outerga_numseg_eq_c.get()
}

///|
/// SEQITERATE_IDENTICAL_OUTERGA
fn step_260() -> Unit raise {
  let t2009 = @simp.rewrite_tac(@list.List([vector_outerga_refl(), outerga_lzero(), outerga_rzero(), @vectors.vector_mul_rzero()]))
  let t2008 = @simp.gen_rewrite_tac(fn(x2007 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2003 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1999 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1995 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x1989 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1990 = @equal.land_conv(x1989)
            fn(x1991 : @kernel.Term) -> @kernel.Thm raise {
              s1990(x1991)
            }
          })((fn(x1992 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1993 = @equal.rand_conv(x1992)
            fn(x1994 : @kernel.Term) -> @kernel.Thm raise {
              s1993(x1994)
            }
          })(x1995))
        })((fn(x1996 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1997 = @equal.rand_conv(x1996)
          fn(x1998 : @kernel.Term) -> @kernel.Thm raise {
            s1997(x1998)
          }
        })(x1999))
      })((fn(x2000 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2001 = @equal.rand_conv(x2000)
        fn(x2002 : @kernel.Term) -> @kernel.Thm raise {
          s2001(x2002)
        }
      })(x2003))
    })((fn(x2004 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2005 = @equal.once_depth_conv(x2004)
      fn(x2006 : @kernel.Term) -> @kernel.Thm raise {
        s2005(x2006)
      }
    })(x2007))
  }, @list.List([outerga_assoc()]))
  let t1988 = @simp.rewrite_tac(@list.List([outerga_lmul(), @equal.gsym(outerga_assoc())]))
  let t1987 = @simp.asm_simp_tac(@list.List([@trivia.o_thm(), outer_seqiterate_sym()]))
  let t1986 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) + 1 <= (j : Num) - 1"), fn(x1983 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1984 = @tactics.assume_tac(x1983)
    fn(x1985 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1984(x1985)
    }
  })
  let t1981 = @simp.asm_rewrite_tac(@list.List([vector_outerga_refl(), outerga_lzero(), outerga_rzero()]))
  let t1980 = @simp.gen_rewrite_tac(fn(x1979 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1975 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1969 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1970 = @equal.land_conv(x1969)
        fn(x1971 : @kernel.Term) -> @kernel.Thm raise {
          s1970(x1971)
        }
      })((fn(x1972 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1973 = @equal.rand_conv(x1972)
        fn(x1974 : @kernel.Term) -> @kernel.Thm raise {
          s1973(x1974)
        }
      })(x1975))
    })((fn(x1976 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1977 = @equal.once_depth_conv(x1976)
      fn(x1978 : @kernel.Term) -> @kernel.Thm raise {
        s1977(x1978)
      }
    })(x1979))
  }, @list.List([outerga_assoc()]))
  let t1968 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), neutral_outerga(), outer_mvbasis_rscalar(), @trivia.o_thm()]))
  let t1965 = @term_syntax.parse_term("(n : Num)")
  let t1966 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1965]), @iterate.numseg_empty()))
  let t1967 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))(t1966)]))
  let t1982 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1962 = @tactics.subst1_tac(x1961)
      fn(x1963 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1962(x1963)
      }
    })(@equal.sym(x1964))
  }), t1967), t1968), t1980), t1981), @tactics.all_tac])
  let t1960 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num) - 1"))
  let t1959 = @simp.gen_rewrite_tac(fn(x1958 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1954 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1948 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1949 = @equal.land_conv(x1948)
        fn(x1950 : @kernel.Term) -> @kernel.Thm raise {
          s1949(x1950)
        }
      })((fn(x1951 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1952 = @equal.rand_conv(x1951)
        fn(x1953 : @kernel.Term) -> @kernel.Thm raise {
          s1952(x1953)
        }
      })(x1954))
    })((fn(x1955 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1956 = @equal.once_depth_conv(x1955)
      fn(x1957 : @kernel.Term) -> @kernel.Thm raise {
        s1956(x1957)
      }
    })(x1958))
  }, @list.List([outerga_assoc()]))
  let t1947 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_split3()]))
  let t1946 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1943 = @simp.rewrite_rule(@list.List([@equal.gsym(@arith.lt_nz())]))
  let t1945 = @tactics.pop_assum(fn(x1944 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1940 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1941 = @tactics.mp_tac(x1940)
      fn(x1942 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1941(x1942)
      }
    })(t1943(x1944))
  })
  let t1938 = @simp.asm_rewrite_tac(@list.List([vector_outerga_refl(), outerga_rzero(), @vectors.vector_mul_rzero(), outerga_lzero()]))
  let t1937 = @simp.rewrite_tac(@list.List([@equal.gsym(outerga_assoc())]))
  let t1936 = @simp.once_rewrite_tac(@list.List([outerga_lmul()]))
  let t1935 = @simp.simp_tac(@list.List([@trivia.o_thm(), outer_seqiterate_sym()]))
  let t1934 = @simp.rewrite_tac(@list.List([outerga_assoc()]))
  let t1933 = @simp.rewrite_tac(@list.List([@equal.gsym(outerga_assoc())]))
  let t1930 = @simp.rewrite_rule(@list.List([@arith.lt_suc_le()]))
  let t1932 = @tactics.pop_assum(fn(x1931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1928 = @tactics.mp_tac(x1927)
      fn(x1929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1928(x1929)
      }
    })(t1930(x1931))
  })
  let t1926 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_le(), seqiterate_outerga_rrec()]))
  let t1925 = @tactics.subgoal_then(@term_syntax.parse_term("(j : Num) == SUC(j - 1)"), fn(x1922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1923 = @tactics.subst_all_tac(x1922)
    fn(x1924 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1923(x1924)
    }
  })
  let t1921 = @tactics.disch_then(fn(x1918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1919 = @tactics.subst1_tac(x1918)
    fn(x1920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1919(x1920)
    }
  })
  let t1917 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_le()]))
  let t1913 = @term_syntax.parse_term("o(multivec, (a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]]))")
  let t1914 = @term_syntax.parse_term("(n : Num)")
  let t1915 = @term_syntax.parse_term("1")
  let t1916 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(j : Num)"), t1915, t1914, t1913]), seqiterate_split_numseg_outerga()))
  let t1911 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_lrec(), outerga_assoc(), @trivia.o_thm(), vector_outerga_refl(), outerga_lzero()]))
  let t1912 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.pop_assum(fn(x1910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1908 = @tactics.subst_all_tac(x1907)
      fn(x1909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1908(x1909)
      }
    })(@equal.sym(x1910))
  }), t1911)])
  let t1906 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t1905 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_suc_lt()), @calc_num.arith()]))
  let t1904 = @tactics.undisch_tac(@term_syntax.parse_term("0 < (j : Num)"))
  let t1903 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_lrec()]))
  let t1902 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1939 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.le()])), t1902), t1903), t1904), t1905), t1906), @tactics.strip_tac), t1912), t1916), t1917), t1921), t1925), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1926), t1932), t1933), t1934), t1935), t1936), t1937), t1938), @tactics.all_tac])
  let t1901 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t1900 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1899 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ i : Num, ∀ j : Num, ∀ m : Num, ∀ n : Num, m <= i && i <= n && m <= j && j <= n && i < j && a(i) == a(j) → seqiterate(outer, op_dot_dot(m, n), o(multivec, a)) == vec(0)"), fn(x1897 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1897
    @meson.meson_tac(@list.List([th]))
  })
  let t2010 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((i : Num) == (j : Num)) == (i < j || j < i)"))])), t1899), t1900), t1901), t1939), t1945), t1946), t1947), t1959), t1960), t1982), t1986), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1987), t1988), t2008), t2009)
  seqiterate_identical_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ i : Num, ∀ j : Num, ∀ m : Num, ∀ n : Num, m <= i && i <= n && m <= j && j <= n && !(i == j) && a(i) == a(j) → seqiterate(outer, op_dot_dot(m, n), o(multivec, a)) == vec(0)"), t2010))
}

///|
let seqiterate_identical_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_IDENTICAL_OUTERGA")

///|
/// `SEQITERATE_IDENTICAL_OUTERGA`
pub fn seqiterate_identical_outerga() -> @kernel.Thm {
  seqiterate_identical_outerga_c.get()
}

///|
/// SEQITERATE_ADD_OUTERGA
fn step_261() -> Unit raise {
  let t2046 = @tactics.match_mp_tac(seqiterate_outerga_numseg_eq())
  let t2044 = @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac)
  let t2045 = @list.List([@tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac), @tactics.all_tac, t2044, @tactics.all_tac])
  let t2043 = @simp.rewrite_tac(@list.List([outerga_radd(), outerga_ladd()]))
  let t2042 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_rrec()]))
  let t2041 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) == SUC(k - 1)"), fn(x2038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2039 = @tactics.subst_all_tac(x2038)
    fn(x2040 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2039(x2040)
    }
  })
  let t2036 = @tactics.match_mp_tac(seqiterate_outerga_numseg_eq())
  let t2035 = @simp.rewrite_tac(@list.List([outerga_ladd()]))
  let t2034 = @simp.rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()]))
  let t2033 = @tactics.disch_then(fn(x2030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2031 = @tactics.subst1_tac(x2030)
    fn(x2032 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2031(x2032)
    }
  })
  let t2029 = @simp.asm_rewrite_tac(@list.List([@arith.le()]))
  let t2037 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(m : Num) <= (k : Num)")), t2029), t2033), t2034), t2035), @tactics.binop_tac), @tactics.ap_term_tac), t2036), @int.asm_arith_tac), @tactics.all_tac])
  let t2028 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2027 = @tactics.repeat_tac(@tactics.disch_then(fn(x2024 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2025 = @tactics.subst1_tac(x2024)
    fn(x2026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2025(x2026)
    }
  }))
  let t2023 = @simp.asm_rewrite_tac(@list.List([]))
  let t2019 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { (b : Cart[Real, Geomalg[P, Q, R]]) } else { (c : (Num) -> Cart[Real, Geomalg[P, Q, R]])(i) }")
  let t2020 = @term_syntax.parse_term("(n : Num)")
  let t2021 = @term_syntax.parse_term("(m : Num)")
  let t2022 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num)"), t2021, t2020, t2019]), seqiterate_split_numseg_outerga()))
  let t2015 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { (a : Cart[Real, Geomalg[P, Q, R]]) } else { (c : (Num) -> Cart[Real, Geomalg[P, Q, R]])(i) }")
  let t2016 = @term_syntax.parse_term("(n : Num)")
  let t2017 = @term_syntax.parse_term("(m : Num)")
  let t2018 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num)"), t2017, t2016, t2015]), seqiterate_split_numseg_outerga()))
  let t2011 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { (a : Cart[Real, Geomalg[P, Q, R]]) + (b : Cart[Real, Geomalg[P, Q, R]]) } else { (c : (Num) -> Cart[Real, Geomalg[P, Q, R]])(i) }")
  let t2012 = @term_syntax.parse_term("(n : Num)")
  let t2013 = @term_syntax.parse_term("(m : Num)")
  let t2014 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num)"), t2013, t2012, t2011]), seqiterate_split_numseg_outerga()))
  let t2047 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2014), t2018), t2022), t2023), t2027), t2028), t2037), t2041), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2042), t2043), @tactics.binop_tac), @tactics.binop_tac), t2045), t2046), @int.asm_arith_tac)
  seqiterate_add_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : Cart[Real, Geomalg[P, Q, R]], ∀ c : (Num) -> Cart[Real, Geomalg[P, Q, R]], ∀ k : Num, ∀ m : Num, ∀ n : Num, m <= k && k <= n → seqiterate(outer, op_dot_dot(m, n), (i : Num) => if i == k { a + b } else { c(i) }) == seqiterate(outer, op_dot_dot(m, n), (i : Num) => if i == k { a } else { c(i) }) + seqiterate(outer, op_dot_dot(m, n), (i : Num) => if i == k { b } else { c(i) })"), t2047))
}

///|
let seqiterate_add_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_ADD_OUTERGA")

///|
/// `SEQITERATE_ADD_OUTERGA`
pub fn seqiterate_add_outerga() -> @kernel.Thm {
  seqiterate_add_outerga_c.get()
}

///|
/// SEQITERATE_MUL_OUTERGA
fn step_262() -> Unit raise {
  let t2078 = @tactics.match_mp_tac(seqiterate_outerga_numseg_eq())
  let t2077 = @list.List([@tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac), @tactics.all_tac])
  let t2076 = @simp.rewrite_tac(@list.List([outerga_rmul(), outerga_lmul()]))
  let t2075 = @simp.asm_simp_tac(@list.List([seqiterate_outerga_rrec()]))
  let t2074 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) == SUC(k - 1)"), fn(x2071 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2072 = @tactics.subst_all_tac(x2071)
    fn(x2073 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2072(x2073)
    }
  })
  let t2069 = @tactics.match_mp_tac(seqiterate_outerga_numseg_eq())
  let t2068 = @simp.rewrite_tac(@list.List([outerga_lmul()]))
  let t2067 = @simp.rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses()]))
  let t2066 = @tactics.disch_then(fn(x2063 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2064 = @tactics.subst1_tac(x2063)
    fn(x2065 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2064(x2065)
    }
  })
  let t2062 = @simp.asm_rewrite_tac(@list.List([@arith.le()]))
  let t2070 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(m : Num) <= (k : Num)")), t2062), t2066), t2067), t2068), @tactics.ap_term_tac), @tactics.ap_term_tac), t2069), @int.asm_arith_tac), @tactics.all_tac])
  let t2061 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2060 = @tactics.repeat_tac(@tactics.disch_then(fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2058 = @tactics.subst1_tac(x2057)
    fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2058(x2059)
    }
  }))
  let t2056 = @simp.asm_rewrite_tac(@list.List([]))
  let t2052 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { (a : Cart[Real, Geomalg[P, Q, R]]) } else { (b : (Num) -> Cart[Real, Geomalg[P, Q, R]])(i) }")
  let t2053 = @term_syntax.parse_term("(n : Num)")
  let t2054 = @term_syntax.parse_term("(m : Num)")
  let t2055 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num)"), t2054, t2053, t2052]), seqiterate_split_numseg_outerga()))
  let t2048 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { op_pct((c : Real), (a : Cart[Real, Geomalg[P, Q, R]])) } else { (b : (Num) -> Cart[Real, Geomalg[P, Q, R]])(i) }")
  let t2049 = @term_syntax.parse_term("(n : Num)")
  let t2050 = @term_syntax.parse_term("(m : Num)")
  let t2051 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num)"), t2050, t2049, t2048]), seqiterate_split_numseg_outerga()))
  let t2079 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2051), t2055), t2056), t2060), t2061), t2070), t2074), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2075), t2076), @tactics.ap_term_tac), @tactics.binop_tac), t2077), t2078), @int.asm_arith_tac)
  seqiterate_mul_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Geomalg[P, Q, R]], ∀ b : (Num) -> Cart[Real, Geomalg[P, Q, R]], ∀ c : Real, ∀ k : Num, ∀ m : Num, ∀ n : Num, m <= k && k <= n → seqiterate(outer, op_dot_dot(m, n), (i : Num) => if i == k { op_pct(c, a) } else { b(i) }) == op_pct(c, seqiterate(outer, op_dot_dot(m, n), (i : Num) => if i == k { a } else { b(i) }))"), t2079))
}

///|
let seqiterate_mul_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_MUL_OUTERGA")

///|
/// `SEQITERATE_MUL_OUTERGA`
pub fn seqiterate_mul_outerga() -> @kernel.Thm {
  seqiterate_mul_outerga_c.get()
}

///|
/// SEQITERATE_OPERATION_OUTERGA
fn step_263() -> Unit raise {
  let t2102 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t2100 = @term_syntax.parse_term("(j : Num)")
  let t2101 = @tactics.map_every(fn(x2097 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2098 = @tactics.exists_tac(x2097)
    fn(x2099 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2098(x2099)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num)"), t2100]))
  let t2096 = @tactics.match_mp_tac(seqiterate_identical_outerga())
  let t2093 = @equal.gsym(@trivia.o_assoc())
  let t2094 = @equal.gsym(@trivia.o_def())
  let t2095 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.cond_rand()), t2094, t2093]))
  let t2091 = @simp.simp_tac(@list.List([@vectors.vector_mul_rzero()]))
  let t2092 = @tactics.match_mp_tac(@tactics.prove(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0) → op_pct((c : Real), x) == vec(0)"), t2091))
  let t2089 = @meson.meson_tac(@list.List([]))
  let t2090 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(seqiterate_outerga_numseg_eq()), t2089), @tactics.all_tac])
  let t2088 = @simp.gen_rewrite_tac(fn(x2087 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2081 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2082 = @equal.rand_conv(x2081)
      fn(x2083 : @kernel.Term) -> @kernel.Thm raise {
        s2082(x2083)
      }
    })((fn(x2084 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2085 = @equal.once_depth_conv(x2084)
      fn(x2086 : @kernel.Term) -> @kernel.Thm raise {
        s2085(x2086)
      }
    })(x2087))
  }, @list.List([@equal.gsym(@vectors.vector_add_rid())]))
  let t2080 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([seqiterate_add_outerga(), seqiterate_mul_outerga()])), t2080), t2088), @tactics.binop_tac), t2090), t2092), t2095), t2096), t2101), t2102)
  seqiterate_operation_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ c : Real, ∀ i : Num, ∀ j : Num, ∀ m : Num, ∀ n : Num, m <= i && i <= n && m <= j && j <= n && !(i == j) → seqiterate(outer, op_dot_dot(m, n), (k : Num) => if k == i { o(multivec, a, i) + op_pct(c, o(multivec, a, j)) } else { o(multivec, a, k) }) == seqiterate(outer, op_dot_dot(m, n), o(multivec, a))"), t2103))
}

///|
let seqiterate_operation_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OPERATION_OUTERGA")

///|
/// `SEQITERATE_OPERATION_OUTERGA`
pub fn seqiterate_operation_outerga() -> @kernel.Thm {
  seqiterate_operation_outerga_c.get()
}

///|
/// SEQITERATE_SPAN_OUTERGA
fn step_264() -> Unit raise {
  let t2132 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t2130 = @term_syntax.parse_term("(j : Num)")
  let t2131 = @tactics.map_every(fn(x2127 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2128 = @tactics.exists_tac(x2127)
    fn(x2129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2128(x2129)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num)"), t2130]))
  let t2126 = @tactics.match_mp_tac(seqiterate_identical_outerga())
  let t2123 = @equal.gsym(@trivia.o_assoc())
  let t2124 = @equal.gsym(@trivia.o_def())
  let t2125 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.cond_rand()), t2124, t2123]))
  let t2121 = @simp.simp_tac(@list.List([@vectors.vector_mul_rzero()]))
  let t2122 = @tactics.match_mp_tac(@tactics.prove(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0) → op_pct((c : Real), x) == vec(0)"), t2121))
  let t2120 = @simp.asm_simp_tac(@list.List([seqiterate_add_outerga(), seqiterate_mul_outerga(), @vectors.vector_eq_addr()]))
  let t2119 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + (op_pct((c : Real), (x : Cart[Real, N])) + (y : Cart[Real, N])) == a + y + op_pct(c, x)"))]))
  let t2118 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), multivect_add(), multivect_mul()]))
  let t2111 = @term_syntax.parse_term("(j : Num)")
  let t2117 = @tactics.disch_then(@tactics.conjuncts_then2((x2112 : @kernel.Thm) => @tactics.x_choose_tac(t2111, x2112), fn(x2116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2114 = @tactics.subst_all_tac(x2113)
      fn(x2115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2114(x2115)
      }
    })(@equal.sym(x2116))
  }))
  let t2110 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2109 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2107 = @meson.meson_tac(@list.List([@trivia.o_thm(), multivect_0(), @vectors.vector_add_rid()]))
  let t2108 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(seqiterate_outerga_numseg_eq()), t2107), @tactics.all_tac])
  let t2106 = @tactics.match_mp_tac(@vectors.span_induct_alt())
  let t2105 = @tactics.repeat_tac(@tactics.disch_tac)
  let t2104 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t2133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @tactics.gen_tac), t2104), t2105), t2106), @tactics.conj_tac), t2108), t2109), t2110), t2117), t2118), t2119), t2120), t2122), t2125), t2126), t2131), t2132)
  seqiterate_span_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ i : Num, ∀ m : Num, ∀ n : Num, ∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], m <= i && i <= n && IN(x, span({a((j : Num)) | m <= j && j <= n && !(j == i)})) → seqiterate(outer, op_dot_dot(m, n), (k : Num) => if k == i { o(multivec, a, i) + multivec(x) } else { o(multivec, a, k) }) == seqiterate(outer, op_dot_dot(m, n), o(multivec, a))"), t2133))
}

///|
let seqiterate_span_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_SPAN_OUTERGA")

///|
/// `SEQITERATE_SPAN_OUTERGA`
pub fn seqiterate_span_outerga() -> @kernel.Thm {
  seqiterate_span_outerga_c.get()
}

///|
/// SEQITERATE_DEPENDENT_OUTERGA
fn step_265() -> Unit raise {
  let t2166 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @equal.gsym(multivect_add()), @vectors.vector_add_rinv(), multivect_0()]))
  let t2165 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num)"))
  let t2164 = @tactics.match_mp_tac(seqiterate_zero_outerga())
  let t2167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2161 = @tactics.subst1_tac(x2160)
      fn(x2162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2161(x2162)
      }
    })(@equal.sym(x2163))
  }), t2164), t2165), t2166)
  let t2159 = @meson.asm_meson_tac(@list.List([]))
  let t2158 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_delete(), @sets.in_elim_thm()]))
  let t2157 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t2156 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → a → b")))
  let t2153 = @simp.gen_rewrite_rule(fn(x2152 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2152
  }, @list.List([@sets.in_()]))
  let t2155 = @tactics.first_x_assum(fn(x2154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2150 = @tactics.mp_tac(x2149)
      fn(x2151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2150(x2151)
      }
    })(t2153(x2154))
  })
  let t2148 = @tactics.match_mp_tac(@vectors.span_neg())
  let t2168 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2148), t2155), t2156), t2157), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2158), t2159), t2167])
  let t2143 = @term_syntax.parse_term("-(a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]])((i : Num))")
  let t2144 = @term_syntax.parse_term("(n : Num)")
  let t2145 = @term_syntax.parse_term("(m : Num)")
  let t2146 = @term_syntax.parse_term("(i : Num)")
  let t2147 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]])"), t2146, t2145, t2144, t2143]), seqiterate_span_outerga()))
  let t2142 = @list.List([@meson.asm_meson_tac(@list.List([seqiterate_identical_outerga()])), @tactics.all_tac])
  let t2141 = @class.asm_cases_tac(@term_syntax.parse_term("∃ i : Num, ∃ j : Num, (m : Num) <= i && i <= (n : Num) && m <= j && j <= n && !(i == j) && (a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]])(i) == a(j)"))
  let t2140 = @tactics.first_x_assum(fn(x2137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2138 = @tactics.subst_all_tac(x2137)
    fn(x2139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2138(x2139)
    }
  })
  let t2136 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2135 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2134 = @simp.rewrite_tac(@list.List([@vectors.dependent(), @sets.in_elim_thm(), @theorems.left_and_exists_thm(), @iterate.in_numseg()]))
  let t2169 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2134), t2135), @tactics.gen_tac), t2136), @tactics.strip_tac), t2140), t2141), t2142), t2147), @tactics.ants_tac), t2168)
  seqiterate_dependent_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ m : Num, ∀ n : Num, dependent({a((i : Num)) | IN(i, op_dot_dot(m, n))}) → seqiterate(outer, op_dot_dot(m, n), o(multivec, a)) == vec(0)"), t2169))
}

///|
let seqiterate_dependent_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_DEPENDENT_OUTERGA")

///|
/// `SEQITERATE_DEPENDENT_OUTERGA`
pub fn seqiterate_dependent_outerga() -> @kernel.Thm {
  seqiterate_dependent_outerga_c.get()
}

///|
/// SEQITERATE_OUTERGA_VSUM
fn step_266() -> Unit raise {
  let t2253 = @meson.asm_meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_sing(), @sets.finite_subset(), @sets.card_sing(), @sets.card_union(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → SUC(n) + 1 - m == n + 1 - m + 1")), @calc_int.real_mul_rzero()]))
  let t2252 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component(), geomalg_vec_component(), @calc_int.real_mul_rzero()]))
  let t2251 = @simp.asm_simp_tac(@list.List([geomalg_vec_component(), outer_mvbasis()]))
  let t2250 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2249 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_cross(), @sets.in_elim_thm(), @sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) == SUBSET({x}, s)"))]))
  let t2248 = @tactics.match_mp_tac(@iterate.sum_eq_0())
  let t2247 = @simp.asm_simp_tac(@list.List([geomalg_vsum_component()]))
  let t2246 = @simp.rewrite_tac(@list.List([outerga_rmul(), outerga_lmul(), outerga_lzero()]))
  let t2245 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t2244 = @simp.rewrite_tac(@list.List([@class.cond_rand()]))
  let t2243 = @simp.simp_tac(@list.List([@sets.finite_powerset(), @iterate.finite_numseg(), bilinear_outerga(), @vectors.bilinear_vsum()]))
  let t2242 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), multivect()]))
  let t2241 = @tactics.first_x_assum(fn(x2238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2239 = @tactics.subst1_tac(x2238)
    fn(x2240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2239(x2240)
    }
  })
  let t2236 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero()]))
  let t2237 = @tactics.match_mp_tac(@tactics.prove(@term_syntax.parse_term("(c : Real) == real_of_num(0) → op_pct(c, (x : Cart[Real, N])) == vec(0)"), t2236))
  let t2235 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m <= SUC(n)")), seqiterate_outerga_rrec()]))
  let t2234 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2233 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> Bool)"))
  let t2232 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t2231 = @simp.gen_rewrite_tac(fn(x2230 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2224 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2225 = @equal.land_conv(x2224)
      fn(x2226 : @kernel.Term) -> @kernel.Thm raise {
        s2225(x2226)
      }
    })((fn(x2227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2228 = @equal.once_depth_conv(x2227)
      fn(x2229 : @kernel.Term) -> @kernel.Thm raise {
        s2228(x2229)
      }
    })(x2230))
  }, @list.List([@equal.gsym(mvbasis_expansion())]))
  let t2223 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2221 = @meson.asm_meson_tac(@list.List([@sets.card_sing(), @calc_int.real_mul_rzero()]))
  let t2220 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2219 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2218 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) == SUBSET({x}, s)"))]))
  let t2217 = @tactics.match_mp_tac(@iterate.sum_eq_0())
  let t2216 = @simp.asm_simp_tac(@list.List([geomalg_vsum_component()]))
  let t2214 = @simp.simp_tac(@list.List([@vectors.vector_mul_lzero()]))
  let t2215 = @tactics.match_mp_tac(@tactics.prove(@term_syntax.parse_term("(c : Real) == real_of_num(0) → op_pct(c, (x : Cart[Real, N])) == vec(0)"), t2214))
  let t2213 = @simp.asm_rewrite_tac(@list.List([multivect()]))
  let t2212 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2211 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2210 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t2209 = @simp.gen_rewrite_tac(fn(x2208 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2202 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2203 = @equal.land_conv(x2202)
      fn(x2204 : @kernel.Term) -> @kernel.Thm raise {
        s2203(x2204)
      }
    })((fn(x2205 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2206 = @equal.once_depth_conv(x2205)
      fn(x2207 : @kernel.Term) -> @kernel.Thm raise {
        s2206(x2207)
      }
    })(x2208))
  }, @list.List([@equal.gsym(mvbasis_expansion())]))
  let t2222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.numseg_sing(), @clifford.seqiterate_clauses(), @trivia.o_thm(), @arith.add_sub2()])), @tactics.gen_tac), t2209), t2210), t2211), t2212), @class.cond_cases_tac), t2213), t2215), t2216), t2217), t2218), t2219), t2220), t2221), @tactics.all_tac])
  let t2201 = @tactics.match_mp_tac(@arith.le_induct())
  let t2198 = @term_syntax.parse_term("(m : Num)")
  let t2199 = (@term_syntax.parse_term("(m : Num)"), t2198)
  let t2197 = @term_syntax.parse_term("(n : Num)")
  let t2200 = @tactics.map_every(fn(x2194 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2195 = @tactics.spec_tac(x2194.0, x2194.1)
    fn(x2196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2195(x2196)
    }
  }, @list.List([(@term_syntax.parse_term("(n : Num)"), t2197), t2199]))
  let t2193 = @simp.rewrite_tac(@list.List([@arith.not_lt()]))
  let t2191 = @meson.meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_subset(), @sets.card_eq_0(), @vectors.vector_mul_lzero()]))
  let t2190 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), mvbasis_component()]))
  let t2189 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t2188 = @simp.gen_rewrite_tac(fn(x2187 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2181 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2182 = @equal.land_conv(x2181)
      fn(x2183 : @kernel.Term) -> @kernel.Thm raise {
        s2182(x2183)
      }
    })((fn(x2184 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2185 = @equal.once_depth_conv(x2184)
      fn(x2186 : @kernel.Term) -> @kernel.Thm raise {
        s2185(x2186)
      }
    })(x2187))
  }, @list.List([@equal.gsym(mvbasis_expansion())]))
  let t2180 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), neutral_outerga()]))
  let t2179 = @tactics.disch_then(fn(x2176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2177 = @tactics.subst1_tac(x2176)
    fn(x2178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2177(x2178)
    }
  })
  let t2175 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg_empty())]))
  let t2192 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) → n + 1 - m == 0"))])), t2175), t2179), t2180), t2188), t2189), t2190), t2191), @tactics.all_tac])
  let t2174 = @tactics.pop_assum(fn(x2171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2172 = @tactics.mp_tac(x2171)
    fn(x2173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2172(x2173)
    }
  })
  let t2170 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < (m : Num)"))
  let t2254 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2170), t2174), t2192), t2193), t2200), t2201), @tactics.conj_tac), t2222), t2223), t2231), t2232), t2233), t2234), @class.cond_cases_tac), t2235), @tactics.disch_tac), t2237), t2241), t2242), t2243), t2244), t2245), t2246), t2247), t2248), t2249), t2250), @class.cond_cases_tac), t2251), @class.cond_cases_tac), t2252), t2253)
  seqiterate_outerga_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], (seqiterate : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), op_dot_dot(m, n), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Geomalg[P, Q, R]])((multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), a)) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))}, (s : (Num) -> Bool) => if (CARD : ((Num) -> Bool) -> Num)(s) == n + 1 - m { (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((seqiterate : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), op_dot_dot(m, n), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Geomalg[P, Q, R]])((multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), a)), s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) } else { (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0) })"), t2254))
}

///|
let seqiterate_outerga_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_VSUM")

///|
/// `SEQITERATE_OUTERGA_VSUM`
pub fn seqiterate_outerga_vsum() -> @kernel.Thm {
  seqiterate_outerga_vsum_c.get()
}

///|
/// SEQITERATE_OUTERGA_EQ_0
fn step_267() -> Unit raise {
  let t2260 = @meson.asm_meson_tac(@list.List([@vectors.vector_mul_lzero()]))
  let t2259 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2258 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2257 = @tactics.match_mp_tac(@vectors.vsum_eq_0())
  let t2256 = @simp.once_rewrite_tac(@list.List([seqiterate_outerga_vsum()]))
  let t2255 = @list.List([@simp.simp_tac(@list.List([geomalg_eq(), geomalg_vec_component()])), @tactics.all_tac])
  let t2261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t2255), @tactics.disch_tac), t2256), t2257), t2258), t2259), t2260)
  seqiterate_outerga_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ((seqiterate : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), op_dot_dot(m, n), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Geomalg[P, Q, R]])((multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), a)) == (vec : (Num) -> Cart[Real, Geomalg[P, Q, R]])(0)) == (∀ s : (Num) -> Bool, (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool))))) && (CARD : ((Num) -> Bool) -> Num)(s) == n + 1 - m → (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)((seqiterate : ((Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool, (Num) -> Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((outer : (Cart[Real, Geomalg[P, Q, R]], Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), op_dot_dot(m, n), (o : ((Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]], (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], Num) -> Cart[Real, Geomalg[P, Q, R]])((multivec : (Cart[Real, Trip_fin_sum[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]]), a)), s) == real_of_num(0))"), t2261))
}

///|
let seqiterate_outerga_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQITERATE_OUTERGA_EQ_0")

///|
/// `SEQITERATE_OUTERGA_EQ_0`
pub fn seqiterate_outerga_eq_0() -> @kernel.Thm {
  seqiterate_outerga_eq_0_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:2313
fn step_268() -> Unit raise {
  @preterm.make_overloadable("reversion", @term_syntax.parse_type("(Cart[Real, N]) -> Cart[Real, N]"))
}

///|
/// Geometric_Algebra/geometricalgebra.ml:2314
fn step_269() -> Unit raise {
  @preterm.overload_interface("reversion", @term_syntax.parse_term("(reversionga : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])"))
}

///|
/// reversionga
fn step_270() -> Unit raise {
  reversionga_c.set(@pair.new_definition(@term_syntax.parse_term("(reversionga : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]])) == lambdas((s : (Num) -> Bool) => pow(-real_of_num(1), DIV(CARD(s) * (CARD(s) - 1), 2)) * setindex(x, s))")))
}

///|
let reversionga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reversionga")

///|
/// `reversionga`
pub fn reversionga() -> @kernel.Thm {
  reversionga_c.get()
}

///|
/// REVERSION_MVBASIS
fn step_271() -> Unit raise {
  let t2265 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t2264 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2263 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2262 = @simp.simp_tac(@list.List([geomalg_beta(), geomalg_eq()]))
  let t2266 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([reversionga()])), t2262), t2263), t2264), @class.cond_cases_tac), t2265)
  reversion_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, (reversionga : (Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(s)) == (op_pct : (Real, Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])(pow(-real_of_num(1), DIV(CARD(s) * (CARD(s) - 1), 2)), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])(s))"), t2266))
}

///|
let reversion_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_MVBASIS")

///|
/// `REVERSION_MVBASIS`
pub fn reversion_mvbasis() -> @kernel.Thm {
  reversion_mvbasis_c.get()
}

///|
/// REVERSIONGA_LINEAR
fn step_272() -> Unit raise {
  let t2268 = @simp.simp_tac(@list.List([geomalg_add_component(), geomalg_mul_component(), geomalg_beta()]))
  let t2267 = @simp.simp_tac(@list.List([geomalg_beta(), geomalg_eq()]))
  let t2269 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([reversionga()])), t2267), t2268), @calc_rat.real_arith_tac)
  reversionga_linear_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, Geomalg[_, _, _]], ∀ y : Cart[Real, Geomalg[_, _, _]], reversionga(x + y) == reversionga(x) + reversionga(y)) && (∀ c : Real, ∀ x : Cart[Real, Geomalg[_, _, _]], reversionga(op_pct(c, x)) == op_pct(c, reversionga(x)))"), t2269))
}

///|
let reversionga_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSIONGA_LINEAR")

///|
/// `REVERSIONGA_LINEAR`
pub fn reversionga_linear() -> @kernel.Thm {
  reversionga_linear_c.get()
}

///|
/// REVERSION_CONV
fn step_273() -> Unit raise {
  reversion_conv_c.set(@equal.thenc(@equal.thenc(@simp.simp_conv(@list.List([reversionga_linear(), reversion_mvbasis(), @sets.card_clauses(), @sets.in_insert(), @sets.finite_empty(), @sets.finite_insert(), @sets.not_in_empty()])), @calc_num.num_reduce_conv), @calc_rat.real_rat_reduce_conv))
}

///|
let reversion_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REVERSION_CONV")

///|
/// `REVERSION_CONV`
pub fn reversion_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (reversion_conv_c.get())(x)
}

///|
/// Geometric_Algebra/geometricalgebra.ml:2336
fn step_274() -> Unit raise {
  ignore(reversion_conv(@term_syntax.parse_term("(reversionga : (Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({1}) + (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[_, _, _]])({1, 2}))")))
}

///|
/// REVERSION_VECTOR
fn step_275() -> Unit raise {
  let t2282 = @tactics.conv_tac(@equal.thenc(@calc_num.num_reduce_conv, @calc_rat.real_rat_reduce_conv))
  let t2281 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.in_insert(), @sets.finite_empty(), @sets.finite_insert(), @sets.not_in_empty()]))
  let t2283 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2279 = @tactics.subst1_tac(x2278)
    fn(x2280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2279(x2280)
    }
  }), t2281), t2282), @tactics.all_tac])
  let t2277 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2276 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t2275 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2274 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t2273 = @simp.asm_simp_tac(@list.List([geomalg_vsum_component()]))
  let t2272 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2271 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_lmul())]))
  let t2270 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta(), @equal.gsym(geomalg_mul_component())]))
  let t2284 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([reversionga(), multivect()])), t2270), t2271), t2272), t2273), t2274), t2275), t2276), t2277), @class.cond_cases_tac), t2283), @calc_rat.real_arith_tac)
  reversion_vector_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], multivec(x) == reversionga(multivec(x))"), t2284))
}

///|
let reversion_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_VECTOR")

///|
/// `REVERSION_VECTOR`
pub fn reversion_vector() -> @kernel.Thm {
  reversion_vector_c.get()
}

///|
/// REVERSION_VECTOR_OUTER
fn step_276() -> Unit raise {
  let t2311 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero()]))
  let t2308 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2309 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.in_insert(), @sets.finite_empty(), @sets.finite_insert(), @sets.not_in_empty()])), t2308), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac])
  let t2307 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2310 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_neg_minus1(), @vectors.vector_mul_assoc()])), t2307), @class.cond_cases_tac), t2309)
  let t2305 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2306 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.in_insert(), @sets.finite_empty(), @sets.finite_insert(), @sets.not_in_empty()])), t2305), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac])
  let t2312 = @list.List([@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()])), @class.cond_cases_tac), t2306), t2310])), t2311])
  let t2304 = @simp.rewrite_tac(@list.List([outer_mvbasis_sing()]))
  let t2303 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t2302 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2301 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t2300 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t2299 = @simp.asm_simp_tac(@list.List([geomalg_vsum_component()]))
  let t2298 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2297 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_minus1(), @equal.gsym(@vectors.vsum_lmul())]))
  let t2296 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta(), @equal.gsym(geomalg_mul_component())]))
  let t2295 = @simp.rewrite_tac(@list.List([@sets.cross(), outerga_lmul(), outerga_rmul()]))
  let t2294 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), bilinear_outerga(), @vectors.bilinear_vsum()]))
  let t2293 = @simp.rewrite_tac(@list.List([reversionga(), multivect()]))
  let t2292 = @simp.gen_rewrite_tac(fn(x2291 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2285 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2286 = @equal.rand_conv(x2285)
      fn(x2287 : @kernel.Term) -> @kernel.Thm raise {
        s2286(x2287)
      }
    })((fn(x2288 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2289 = @equal.once_depth_conv(x2288)
      fn(x2290 : @kernel.Term) -> @kernel.Thm raise {
        s2289(x2290)
      }
    })(x2291))
  }, @list.List([vector_outerga_skewsym()]))
  let t2313 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2292), t2293), t2294), t2295), t2296), t2297), t2298), t2299), t2300), t2301), t2302), t2303), t2304), @class.cond_cases_tac), t2312)
  reversion_vector_outer_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Trip_fin_sum[P, Q, R]], ∀ y : Cart[Real, Trip_fin_sum[P, Q, R]], reversionga(outer(multivec(x), multivec(y))) == outer(multivec(y), multivec(x))"), t2313))
}

///|
let reversion_vector_outer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_VECTOR_OUTER")

///|
/// `REVERSION_VECTOR_OUTER`
pub fn reversion_vector_outer() -> @kernel.Thm {
  reversion_vector_outer_c.get()
}

///|
/// REVERSION_MBASIS
fn step_277() -> Unit raise {
  let t2317 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t2316 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2315 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2314 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta()]))
  let t2318 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([reversionga()]))), t2314), t2315), t2316), @class.cond_cases_tac), t2317)
  reversion_mbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, (reversionga : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(pow(-real_of_num(1), DIV(CARD(s) * (CARD(s) - 1), 2)), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s))"), t2318))
}

///|
let reversion_mbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_MBASIS")

///|
/// `REVERSION_MBASIS`
pub fn reversion_mbasis() -> @kernel.Thm {
  reversion_mbasis_c.get()
}

///|
/// EVEN_POW_EQ
fn step_278() -> Unit raise {
  let t2326 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow(-real_of_num(1), 2) == real_of_num(1)")), @real.real_pow_one()]))
  let t2325 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t2324 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
  let t2323 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2322 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t2319 = @calc_rat.real_field(@term_syntax.parse_term("∀ z : Real, !(z == real_of_num(0)) → ((x : Real) == (y : Real)) == (x * z == y * z)"))
  let t2320 = @bool.spec(@term_syntax.parse_term("pow(-real_of_num(1), (m : Num))"), t2319)
  let t2321 = @simp.once_rewrite_tac(@list.List([@simp.simp_rule(@list.List([@real.real_pow_nz(), @calc_rat.real_arith(@term_syntax.parse_term("!(-real_of_num(1) == real_of_num(0))"))]))(t2320)]))
  let t2327 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.even_add()), @arith.even_exists()])), t2321), t2322), t2323), t2324), t2325), t2326)
  even_pow_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, EVEN(n) == EVEN(m) → pow(-real_of_num(1), n) == pow(-real_of_num(1), m)"), t2327))
}

///|
let even_pow_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_POW_EQ")

///|
/// `EVEN_POW_EQ`
pub fn even_pow_eq() -> @kernel.Thm {
  even_pow_eq_c.get()
}

///|
/// REVERSION_OUTERGA
fn step_279() -> Unit raise {
  let t2412 = @tactics.asm_tac(@sets.set_tac)(@list.List([@arith.gt(), @arith.lt_antisym(), @arith.lt_cases()]))
  let t2411 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_union(), @sets.not_in_empty(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t2409 = @meson.asm_meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_subset()]))
  let t2410 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_product()), t2409), @tactics.all_tac])
  let t2408 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t2406 = @simp.simp_tac(@list.List([@sets.subset(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t2404 = @meson.asm_meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_subset()]))
  let t2405 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_product()), t2404), @tactics.all_tac])
  let t2403 = @tactics.exists_tac(@term_syntax.parse_term("{((i : Num), (j : Num)) | IN(i, (s : (Num) -> Bool)) && IN(j, (t : (Num) -> Bool))}"))
  let t2402 = @tactics.match_mp_tac(@sets.finite_subset())
  let t2400 = @meson.meson_tac(@list.List([@pair.pair_eq()]))
  let t2401 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([swappair(), @pair.forall_pair_thm()])), t2400), @tactics.all_tac])
  let t2399 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t2397 = @meson.meson_tac(@list.List([@pair.pair_eq(), @arith.gt()]))
  let t2398 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @pair.forall_pair_thm(), @pair.exists_pair_thm(), @sets.in_elim_pair_thm(), swappair()])), t2397)
  let t2407 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, {((x : Num), (y : Num)) | IN(x, t) && IN(y, s) && x > y} == IMAGE(swappair, {((x : Num), (y : Num)) | IN(x, s) && IN(y, t) && x < y})"), t2398)])), t2399), @tactics.conj_tac), t2401), t2402), t2403), @tactics.conj_tac), t2405), t2406), @tactics.all_tac])
  let t2396 = @tactics.subgoal_then(@term_syntax.parse_term("CARD({((i : Num), (j : Num)) | IN(i, (t : (Num) -> Bool)) && IN(j, (s : (Num) -> Bool)) && i > j}) == CARD({((i : Num), (j : Num)) | IN(i, s) && IN(j, t) && i < j})"), fn(x2393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2394 = @tactics.subst1_tac(x2393)
    fn(x2395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2394(x2395)
    }
  })
  let t2392 = @tactics.conv_tac(@equal.sym_conv)
  let t2391 = @tactics.disch_then(fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2388 = @tactics.subst1_tac(x2387)
      fn(x2389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2388(x2389)
      }
    })(@equal.sym(x2390))
  })
  let t2386 = @list.List([@meson.asm_meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_subset()])), @tactics.all_tac])
  let t2384 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t2385 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Num) -> Bool)"), t2384]), @sets.card_product()))
  let t2383 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t2381 = @equal.gsym(@arith.right_add_distrib())
  let t2382 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @equal.gsym(@arith.mult_2()), t2381]))
  let t2380 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.le_square_refl()]))
  let t2379 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(c : Num) <= (a : Num) && (f : Num) <= (e : Num) && (b : Num) + (d : Num) == (g : Num) + (h : Num) → a + b - c + (d + e - f) == g + (a - c + (e - f + h))")))
  let t2378 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.right_add_distrib(), @arith.left_sub_distrib(), @arith.right_sub_distrib()]))
  let t2377 = @tactics.disch_then(fn(x2374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2375 = @tactics.subst1_tac(x2374)
    fn(x2376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2375(x2376)
    }
  })
  let t2373 = @list.List([@meson.asm_meson_tac(@list.List([@iterate.finite_numseg(), @sets.finite_subset()])), @tactics.all_tac])
  let t2371 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t2372 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Num) -> Bool)"), t2371]), @sets.card_union()))
  let t2370 = @simp.asm_simp_tac(@list.List([]))
  let t2369 = @list.List([@meson.meson_tac(@list.List([@arith.even_mult(), @arith.even_sub(), @arith.le_lt(), @arith.even(), @arith.one()])), @tactics.all_tac])
  let t2368 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, EVEN(n * (n - 1))"), fn(x2365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2366 = @tactics.assume_tac(x2365)
    fn(x2367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2366(x2367)
    }
  })
  let t2363 = @meson.meson_tac(@list.List([@arith.division(), @int.arith_rule(@term_syntax.parse_term("!(2 == 0)"))]))
  let t2362 = @tactics.first_assum(fn(x2361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2359 = @tactics.subst1_tac(x2358)
      fn(x2360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2359(x2360)
      }
    })(@equal.sym(x2361))
  })
  let t2357 = @simp.gen_rewrite_tac(fn(x2356 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2350 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2351 = @equal.land_conv(x2350)
      fn(x2352 : @kernel.Term) -> @kernel.Thm raise {
        s2351(x2352)
      }
    })((fn(x2353 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2354 = @equal.once_depth_conv(x2353)
      fn(x2355 : @kernel.Term) -> @kernel.Thm raise {
        s2354(x2355)
      }
    })(x2356))
  }, @list.List([@equal.gsym(@arith.add_0())]))
  let t2349 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2364 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_mod()])), t2349), t2357), t2362), t2363), @tactics.all_tac])
  let t2348 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, EVEN(m) → DIV(m, 2) * 2 == m"), fn(x2345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2346 = @tactics.assume_tac(x2345)
    fn(x2347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2346(x2347)
    }
  })
  let t2344 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t2340 = @term_syntax.parse_term("2")
  let t2341 = @term_syntax.parse_term("(n : Num)")
  let t2342 = @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t2341, t2340]), @arith.eq_mult_rcancel())
  let t2343 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_rule(@list.List([@calc_num.arith()]))(t2342))]))
  let t2339 = @simp.once_rewrite_tac(@list.List([@arith.even_add()]))
  let t2337 = @equal.gsym(@arith.add_assoc())
  let t2338 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.even_add()), t2337]))
  let t2336 = @tactics.match_mp_tac(even_pow_eq())
  let t2335 = @simp.asm_rewrite_tac(@list.List([@sets.union_comm(), @calc_int.real_mul_rzero(), @realarith.real_mul_rid(), @equal.gsym(@real.real_pow_add())]))
  let t2334 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2333 = @simp.asm_rewrite_tac(@list.List([@sets.inter_comm(), @vectors.vector_mul_assoc(), @vectors.vector_mul_rzero()]))
  let t2332 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2331 = @simp.simp_tac(@list.List([geomalg_eq(), geomalg_beta(), @equal.gsym(geomalg_mul_component())]))
  let t2330 = @simp.rewrite_tac(@list.List([reversionga(), outer_mvbasis()]))
  let t2329 = @simp.rewrite_tac(@list.List([@vectors.bilinear(), @vectors.linear(), outerga_radd(), outerga_ladd(), outerga_lmul(), outerga_rmul(), reversionga_linear(), reversion_mbasis()]))
  let t2328 = @tactics.match_mp_tac(bilinear_eq_mvbasis())
  let t2413 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.fun_eq_thm())])), t2328), t2329), t2330), t2331), t2332), @class.cond_cases_tac), t2333), t2334), @class.cond_cases_tac), t2335), t2336), t2338), t2339), @tactics.ap_term_tac), t2343), t2344), t2348), t2364), t2368), t2369), t2370), t2372), @tactics.ants_tac), t2373), t2377), t2378), t2379), t2380), t2382), t2383), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2385), @tactics.ants_tac), t2386), t2391), t2392), t2396), t2407), t2408), @tactics.conj_tac), t2410), t2411), t2412)
  reversion_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], ∀ y : Cart[Real, Geomalg[P, Q, R]], reversionga(outer(x, y)) == outer(reversionga(y), reversionga(x))"), t2413))
}

///|
let reversion_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_OUTERGA")

///|
/// `REVERSION_OUTERGA`
pub fn reversion_outerga() -> @kernel.Thm {
  reversion_outerga_c.get()
}

///|
/// REVERSION_SEQITERATE_OUTERGA
fn step_280() -> Unit raise {
  let t2438 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @class.fun_eq_thm()]))
  let t2437 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t2436 = @simp.rewrite_tac(@list.List([@iterate.numseg_offset_image(), seqiterate_numseg_image()]))
  let t2435 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t2434 = @tactics.first_x_assum(fn(x2431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2432 = @tactics.subst1_tac(x2431)
    fn(x2433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2432(x2433)
    }
  })
  let t2430 = @simp.simp_tac(@list.List([reversion_outerga(), @trivia.o_thm(), @equal.gsym(reversion_vector())]))
  let t2429 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) + 1")), seqiterate_outerga_lrec()]))
  let t2428 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((k : Num))")), seqiterate_outerga_rrec()]))
  let t2427 = @simp.gen_rewrite_tac(fn(x2426 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2420 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2421 = @equal.rand_conv(x2420)
      fn(x2422 : @kernel.Term) -> @kernel.Thm raise {
        s2421(x2422)
      }
    })((fn(x2423 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2424 = @equal.once_depth_conv(x2423)
      fn(x2425 : @kernel.Term) -> @kernel.Thm raise {
        s2424(x2425)
      }
    })(x2426))
  }, @list.List([@arith.add1()]))
  let t2418 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t2417 = @tactics.conv_tac(reversion_conv)
  let t2416 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), @trivia.o_thm(), neutral_outerga()]))
  let t2414 = @term_syntax.parse_term("0")
  let t2415 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("1"), t2414]), @iterate.numseg_empty()))
  let t2419 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < 1"))]))(t2415)])), t2416), t2417), t2418), @tactics.all_tac])
  let t2439 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t2419), t2427), t2428), t2429), t2430), t2434), t2435), @tactics.ap_term_tac), t2436), t2437), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t2438), @int.arith_tac)
  reversion_seqiterate_outerga_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], ∀ k : Num, reversionga(seqiterate(outer, op_dot_dot(1, k), o(multivec, a))) == seqiterate(outer, op_dot_dot(1, k), o(multivec, o(a, (i : Num) => SUC(k) - i)))"), t2439))
}

///|
let reversion_seqiterate_outerga_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSION_SEQITERATE_OUTERGA")

///|
/// `REVERSION_SEQITERATE_OUTERGA`
pub fn reversion_seqiterate_outerga() -> @kernel.Thm {
  reversion_seqiterate_outerga_c.get()
}

///|
/// conjugation
fn step_281() -> Unit raise {
  conjugation_c.set(@pair.new_definition(@term_syntax.parse_term("(conjugation : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((x : Cart[Real, Geomalg[P, Q, R]])) == (lambdas : (((Num) -> Bool) -> Real) -> Cart[Real, Geomalg[P, Q, R]])((s : (Num) -> Bool) => pow(-real_of_num(1), DIV((CARD : ((Num) -> Bool) -> Num)(s) * ((CARD : ((Num) -> Bool) -> Num)(s) - 1), 2) + (CARD : ((Num) -> Bool) -> Num)((INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)(s, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))))) * (setindex : (Cart[Real, Geomalg[P, Q, R]], (Num) -> Bool) -> Real)(x, s))")))
}

///|
let conjugation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("conjugation")

///|
/// `conjugation`
pub fn conjugation() -> @kernel.Thm {
  conjugation_c.get()
}

///|
/// CONJUGATION_MVBASIS
fn step_282() -> Unit raise {
  let t2443 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t2442 = @simp.asm_simp_tac(@list.List([geomalg_mul_component(), mvbasis_component()]))
  let t2441 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2440 = @simp.simp_tac(@list.List([geomalg_beta(), geomalg_eq()]))
  let t2444 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([conjugation()])), t2440), t2441), t2442), @class.cond_cases_tac), t2443)
  conjugation_mvbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, (conjugation : (Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s)) == (op_pct : (Real, Cart[Real, Geomalg[P, Q, R]]) -> Cart[Real, Geomalg[P, Q, R]])(pow(-real_of_num(1), DIV(CARD(s) * (CARD(s) - 1), 2) + CARD(INTER(s, op_dot_dot((pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + 1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)))))), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(s))"), t2444))
}

///|
let conjugation_mvbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJUGATION_MVBASIS")

///|
/// `CONJUGATION_MVBASIS`
pub fn conjugation_mvbasis() -> @kernel.Thm {
  conjugation_mvbasis_c.get()
}

///|
/// CONJUGATION_LINEAR
fn step_283() -> Unit raise {
  let t2446 = @simp.simp_tac(@list.List([geomalg_add_component(), geomalg_mul_component(), geomalg_beta()]))
  let t2445 = @simp.simp_tac(@list.List([geomalg_beta(), geomalg_eq()]))
  let t2447 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([conjugation()])), t2445), t2446), @calc_rat.real_arith_tac)
  conjugation_linear_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, Geomalg[_, _, _]], ∀ y : Cart[Real, Geomalg[_, _, _]], conjugation(x + y) == conjugation(x) + conjugation(y)) && (∀ c : Real, ∀ x : Cart[Real, Geomalg[_, _, _]], conjugation(op_pct(c, x)) == op_pct(c, conjugation(x)))"), t2447))
}

///|
let conjugation_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJUGATION_LINEAR")

///|
/// `CONJUGATION_LINEAR`
pub fn conjugation_linear() -> @kernel.Thm {
  conjugation_linear_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:2518
fn step_284() -> Unit raise {
  @printer.parse_as_infix("blade", (8L, "left"))
}

///|
/// blade
fn step_285() -> Unit raise {
  blade_c.set(@pair.new_definition(@term_syntax.parse_term("(blade : (Num, Cart[Real, Geomalg[P, Q, R]]) -> Bool)((k : Num), (A : Cart[Real, Geomalg[P, Q, R]])) == (∃ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], independent({a((i : Num)) | IN(i, op_dot_dot(1, k))}) && HAS_SIZE({a((i : Num)) | IN(i, op_dot_dot(1, k))}, k) && A == seqiterate(outer, op_dot_dot(1, k), o(multivec, a)))")))
}

///|
let blade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("blade")

///|
/// `blade`
pub fn blade() -> @kernel.Thm {
  blade_c.get()
}

///|
/// is_blade
fn step_286() -> Unit raise {
  is_blade_c.set(@pair.new_definition(@term_syntax.parse_term("(is_blade : (Cart[Real, Geomalg[P, Q, R]]) -> Bool)((A : Cart[Real, Geomalg[P, Q, R]])) == (∃ k : Num, blade(k, A))")))
}

///|
let is_blade_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_blade")

///|
/// `is_blade`
pub fn is_blade() -> @kernel.Thm {
  is_blade_c.get()
}

///|
/// pseudoscalar
fn step_287() -> Unit raise {
  pseudoscalar_c.set(@pair.new_definition(@term_syntax.parse_term("(pseudoscalar : Cart[Real, Geomalg[P, Q, R]]) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, R]])(op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + ((pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool)) + (pdimindex : ((R) -> Bool) -> Num)((UNIV : (R) -> Bool)))))")))
}

///|
let pseudoscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pseudoscalar")

///|
/// `pseudoscalar`
pub fn pseudoscalar() -> @kernel.Thm {
  pseudoscalar_c.get()
}

///|
/// is_versor
fn step_288() -> Unit raise {
  is_versor_c.set(@pair.new_definition(@term_syntax.parse_term("(is_versor : (Cart[Real, Geomalg[P, Q, R]]) -> Bool)((A : Cart[Real, Geomalg[P, Q, R]])) == (∃ k : Num, ∃ a : (Num) -> Cart[Real, Trip_fin_sum[P, Q, R]], (∀ i : Num, IN(i, op_dot_dot(1, k)) → !is_null(multivec(a(i)))) && A == seqiterate(op_star, op_dot_dot(1, k), o(multivec, a)))")))
}

///|
let is_versor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_versor")

///|
/// `is_versor`
pub fn is_versor() -> @kernel.Thm {
  is_versor_c.get()
}

///|
/// MVINVERTIBLE_VERSOR
fn step_289() -> Unit raise {
  let t2476 = @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t2475 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2474 = @simp.rewrite_tac(@list.List([@equal.gsym(mvinvertible_vector_eq())]))
  let t2472 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t2471 = @tactics.pop_assum(fn(x2468 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2469 = @tactics.mp_tac(x2468)
    fn(x2470 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2469(x2470)
    }
  })
  let t2467 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2473 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), @tactics.strip_tac), @tactics.strip_tac), t2467), t2471), t2472), @int.arith_tac), @tactics.all_tac])
  let t2466 = @tactics.match_mp_tac(mvinvertible_geom())
  let t2465 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t2464 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((k : Num))")), seqiterate_geomga_rrec()]))
  let t2462 = @meson.meson_tac(@list.List([geom_mvbasis_rid()]))
  let t2461 = @simp.rewrite_tac(@list.List([@clifford.seqiterate_clauses(), @trivia.o_thm(), neutral_geomga(), mvinvertible_left_inverse()]))
  let t2459 = @term_syntax.parse_term("0")
  let t2460 = @equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("1"), t2459]), @iterate.numseg_empty()))
  let t2463 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < 1"))]))(t2460), @sets.not_in_empty()])), t2461), t2462), @tactics.all_tac])
  let t2457 = @term_syntax.parse_term("(k : Num)")
  let t2458 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t2457)
  let t2456 = @tactics.first_x_assum(fn(x2453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2454 = @tactics.mp_tac(x2453)
    fn(x2455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2454(x2455)
    }
  })
  let t2452 = @tactics.first_x_assum(fn(x2449 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2450 = @tactics.subst1_tac(x2449)
    fn(x2451 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2450(x2451)
    }
  })
  let t2448 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2477 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([is_versor()])), t2448), t2452), t2456), t2458), @nums.induct_tac), t2463), @tactics.disch_tac), t2464), t2465), t2466), @tactics.conj_tac), t2473), t2474), t2475), t2476), @int.arith_tac)
  mvinvertible_versor_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[P, Q, R]], is_versor(x) → mvinvertible(x)"), t2477))
}

///|
let mvinvertible_versor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MVINVERTIBLE_VERSOR")

///|
/// `MVINVERTIBLE_VERSOR`
pub fn mvinvertible_versor() -> @kernel.Thm {
  mvinvertible_versor_c.get()
}

///|
/// dual
fn step_290() -> Unit raise {
  dual_c.set(@pair.new_definition(@term_syntax.parse_term("(dual : (Cart[Real, Geomalg[P, Q, Zero]]) -> Cart[Real, Geomalg[P, Q, Zero]])((x : Cart[Real, Geomalg[P, Q, Zero]])) == (vsum : (((Num) -> Bool) -> Bool, ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, Zero]]) -> Cart[Real, Geomalg[P, Q, Zero]])({(s : (Num) -> Bool) | (SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)(s, op_dot_dot(1, (pdimindex : ((P) -> Bool) -> Num)((UNIV : (P) -> Bool)) + (pdimindex : ((Q) -> Bool) -> Num)((UNIV : (Q) -> Bool))))}, (s : (Num) -> Bool) => (inner : (Cart[Real, Geomalg[P, Q, Zero]], Cart[Real, Geomalg[P, Q, Zero]]) -> Cart[Real, Geomalg[P, Q, Zero]])((op_pct : (Real, Cart[Real, Geomalg[P, Q, Zero]]) -> Cart[Real, Geomalg[P, Q, Zero]])((setindex : (Cart[Real, Geomalg[P, Q, Zero]], (Num) -> Bool) -> Real)(x, s), (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[P, Q, Zero]])(s)), (mvinverse : (Cart[Real, Geomalg[P, Q, Zero]]) -> Cart[Real, Geomalg[P, Q, Zero]])((pseudoscalar : Cart[Real, Geomalg[P, Q, Zero]]))))")))
}

///|
let dual_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dual")

///|
/// `dual`
pub fn dual() -> @kernel.Thm {
  dual_c.get()
}

///|
/// meet
fn step_291() -> Unit raise {
  meet_c.set(@pair.new_definition(@term_syntax.parse_term("(meet : (Cart[Real, Geomalg[_, _, Zero]], Cart[Real, Geomalg[_, _, Zero]]) -> Cart[Real, Geomalg[_, _, Zero]])((A : Cart[Real, Geomalg[_, _, Zero]]), (B : Cart[Real, Geomalg[_, _, Zero]])) == inner(dual(A), B)")))
}

///|
let meet_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("meet")

///|
/// `meet`
pub fn meet() -> @kernel.Thm {
  meet_c.get()
}

///|
/// project
fn step_292() -> Unit raise {
  project_c.set(@pair.new_definition(@term_syntax.parse_term("(project : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((B : Cart[Real, Geomalg[_, _, _]]), (A : Cart[Real, Geomalg[_, _, _]])) == inner(A, B) * mvinverse(B)")))
}

///|
let project_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("project")

///|
/// `project`
pub fn project() -> @kernel.Thm {
  project_c.get()
}

///|
/// reject
fn step_293() -> Unit raise {
  reject_c.set(@pair.new_definition(@term_syntax.parse_term("(reject : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((B : Cart[Real, Geomalg[_, _, _]]), (A : Cart[Real, Geomalg[_, _, _]])) == outer(A, B) * mvinverse(B)")))
}

///|
let reject_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reject")

///|
/// `reject`
pub fn reject() -> @kernel.Thm {
  reject_c.get()
}

///|
/// transform
fn step_294() -> Unit raise {
  transform_c.set(@pair.new_definition(@term_syntax.parse_term("(transform : (Cart[Real, Geomalg[_, _, _]], Cart[Real, Geomalg[_, _, _]]) -> Cart[Real, Geomalg[_, _, _]])((v : Cart[Real, Geomalg[_, _, _]]), (x : Cart[Real, Geomalg[_, _, _]])) == v * (x * mvinverse(v))")))
}

///|
let transform_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("transform")

///|
/// `transform`
pub fn transform() -> @kernel.Thm {
  transform_c.get()
}

///|
/// SUPERPOSE_TRANSFORM
fn step_295() -> Unit raise {
  let t2482 = @simp.asm_simp_tac(@list.List([mvinvertible_versor()]))
  let t2481 = @tactics.match_mp_tac(mvinverse_geom())
  let t2480 = @simp.once_rewrite_tac(@list.List([geomga_assoc()]))
  let t2479 = @simp.once_rewrite_tac(@list.List([geomga_assoc()]))
  let t2478 = @simp.rewrite_tac(@list.List([@equal.gsym(geomga_assoc())]))
  let t2483 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2478), t2479), t2480), @tactics.ap_term_tac), t2481), t2482)
  superpose_transform_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[_, _, _]], ∀ a : Cart[Real, Geomalg[_, _, _]], ∀ b : Cart[Real, Geomalg[_, _, _]], is_versor(a) && is_versor(b) → a * (b * (x * mvinverse(b)) * mvinverse(a)) == a * b * (x * mvinverse(a * b))"), t2483))
}

///|
let superpose_transform_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPERPOSE_TRANSFORM")

///|
/// `SUPERPOSE_TRANSFORM`
pub fn superpose_transform() -> @kernel.Thm {
  superpose_transform_c.get()
}

///|
/// Geometric_Algebra/geometricalgebra.ml:2594
fn step_296() -> Unit raise {
  @printer.parse_as_infix("cross_product", (20L, "right"))
}

///|
/// cross_product
fn step_297() -> Unit raise {
  cross_product_c.set(@pair.new_definition(@term_syntax.parse_term("(cross_product : (Cart[Real, Trip_fin_sum[Three, Zero, Zero]], Cart[Real, Trip_fin_sum[Three, Zero, Zero]]) -> Cart[Real, Geomalg[Three, Zero, Zero]])((u : Cart[Real, Trip_fin_sum[Three, Zero, Zero]]), (v : Cart[Real, Trip_fin_sum[Three, Zero, Zero]])) == dual(outer(multivec(u), multivec(v)))")))
}

///|
let cross_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cross_product")

///|
/// `cross_product`
pub fn cross_product() -> @kernel.Thm {
  cross_product_c.get()
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
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
}
