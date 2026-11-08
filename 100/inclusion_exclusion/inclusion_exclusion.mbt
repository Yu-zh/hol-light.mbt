// Translated from upstream 100/inclusion_exclusion.ml; edit this file directly.

///|
/// SUBSET_INSERT_EXISTS
fn step_1() -> Unit raise {
  let t4 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3 = @tactics.exists_tac(@term_syntax.parse_term("DELETE((s : (A) -> Bool), (x : A))"))
  let t2 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && !(b : Bool) → (c : Bool)) → a → b || c")))
  let t1 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1), t2), @tactics.disch_tac), t3), t4)
  subset_insert_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ x : A, ∀ t : (A) -> Bool, SUBSET(s, INSERT(x, t)) == (SUBSET(s, t) || (∃ u : (A) -> Bool, SUBSET(u, t) && s == INSERT(x, u)))"), t5))
}

///|
let subset_insert_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_INSERT_EXISTS")

///|
/// `SUBSET_INSERT_EXISTS`
pub fn subset_insert_exists() -> @kernel.Thm {
  subset_insert_exists_c.get()
}

///|
/// FINITE_SUBSETS_RESTRICT
fn step_2() -> Unit raise {
  let t9 = @sets.set_tac(@list.List([]))
  let t8 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset()]))
  let t7 = @tactics.exists_tac(@term_syntax.parse_term("{(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}"))
  let t6 = @tactics.match_mp_tac(@sets.finite_subset())
  let t10 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t6), t7), t8), t9)
  finite_subsets_restrict_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : ((A) -> Bool) -> Bool, FINITE(s) → FINITE({(t : (A) -> Bool) | SUBSET(t, s) && p(t)})"), t10))
}

///|
let finite_subsets_restrict_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBSETS_RESTRICT")

///|
/// `FINITE_SUBSETS_RESTRICT`
pub fn finite_subsets_restrict_v1() -> @kernel.Thm {
  finite_subsets_restrict_v1_c.get()
}

///|
/// INCLUSION_EXCLUSION_REAL_RESTRICTED_INDEXED
fn step_3() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([]))
  let t13 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_union()]))
  let t12 = @simp.gen_rewrite_tac(fn(x11 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x11
  }, @list.List([@sets.extension()]))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([subset_insert_exists()])), t12), t13), t14)
  let lemma = @tactics.prove(@term_syntax.parse_term("{(t : (_) -> Bool) | SUBSET(t, INSERT((a : _), (s : (_) -> Bool))) && (P : ((_) -> Bool) -> Bool)(t)} == UNION({(t : (_) -> Bool) | SUBSET(t, s) && P(t)}, {INSERT(a, t) | t : (_) -> Bool | SUBSET(t, s) && P(INSERT(a, t))})"), t15)
  let t205 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @realax.real_pow()]))
  let t204 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t203 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @real.real_pow_add(), @realax.real_pow()]))
  let t202 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset()])), @tactics.all_tac])
  let t201 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((B : (I) -> Bool))"), fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s199 = @tactics.assume_tac(x198)
    fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s199(x200)
    }
  })
  let t197 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : (I) -> Bool)"))
  let t196 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @real.real_pow_add(), @real.real_pow_1()]))
  let t195 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t194 = @simp.rewrite_tac(@list.List([@real.real_sub_add2()]))
  let t193 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @sets.inters_1(), @sets.card_clauses(), @realax.real_pow(), @realax.real_mul_lid()]))
  let t191 = @tactics.disch_then(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s189 = @tactics.subst1_tac(x188)
    fn(x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s189(x190)
    }
  })
  let t192 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t191])
  let t182 = @drule.part_match(fn(x181 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x181))
  }, @iterate.sum_image())
  let t177 = @simp.gen_rewrite_tac(fn(x176 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x170 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s171 = @equal.rand_conv(x170)
      fn(x172 : @kernel.Term) -> @kernel.Thm raise {
        s171(x172)
      }
    })((fn(x173 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s174 = @equal.once_depth_conv(x173)
      fn(x175 : @kernel.Term) -> @kernel.Thm raise {
        s174(x175)
      }
    })(x176))
  }, @list.List([@sets.simple_image_gen()]))
  let t169 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.empty_subset(), @sets.image_clauses()]))
  let t168 = @simp.asm_simp_tac(@list.List([@iterate.sum_delete_cases(), @equal.gsym(@sets.delete()), @sets.finite_powerset()]))
  let t206 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(s : _) | (P : (_) -> Bool)(s) && !(s == (e : _))} == DELETE({(s : _) | P(s)}, e)"))])), t168), t169), t177), fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x184 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x183 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s179 = @tactics.mp_tac(x178)
            fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s179(x180)
            }
          })(t182(x183))
        })(@kernel.rand(x184))
      })((fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x185.1
      })(x186))
    })(x187)(x187)
  }), @tactics.ants_tac), t192), t193), t194), t195), t196), t197), @tactics.disch_tac), t201), t202), t203), @class.cond_cases_tac), t204), t205), @calc_rat.real_arith_tac)
  let t167 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t166 = @simp.rewrite_tac(@list.List([@sets.inters_image()]))
  let t165 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @realarith.real_mul_rid()]))
  let t164 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1(), @calc_int.real_mul_rneg(), @calc_int.real_mul_lneg()]))
  let t163 = @tactics.repeat_tac(@tactics.strip_tac)
  let t162 = @simp.rewrite_tac(@list.List([]))
  let t161 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @sets.inters_insert(), @trivia.o_def(), @sets.forall_in_gspec()]))
  let t160 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t159 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_neg())]))
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (a : Real) == x + (b : Real)) == (b == -a)"))])), t159), t160), t161), t162), t163), t164), t165), @tactics.ap_term_tac), @tactics.ap_term_tac), t166), t167), t206])
  let t158 = @tactics.exists_tac(@term_syntax.parse_term("(f : ((A) -> Bool) -> Real)((x : (I, A) -> Bool)((a : I))) + sum({(B : (I) -> Bool) | SUBSET(B, (A : (I) -> Bool)) && !(B == {})}, (B : (I) -> Bool) => pow(-real_of_num(1), CARD(B)) * f(INTERS(IMAGE(x, INSERT(a, B)))))"))
  let t157 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t156 = @simp.rewrite_tac(@list.List([@sets.not_insert_empty(), @calc_rat.real_arith(@term_syntax.parse_term("((fa : Real) + (s : Real) - (fas : Real) == s + (s' : Real)) == (fa - fas == s')"))]))
  let t154 = @tactics.disch_then(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s152 = @tactics.subst1_tac(x151)
    fn(x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s152(x153)
    }
  })
  let t150 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t149 = @simp.rewrite_tac(@list.List([@sets.exists_in_gspec()]))
  let t148 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t147 = @simp.rewrite_tac(@list.List([@sets.in_disjoint(), @sets.exists_in_gspec()]))
  let t146 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.simple_image_gen())]))
  let t145 = @simp.asm_simp_tac(@list.List([finite_subsets_restrict_v1(), @sets.finite_image()]))
  let t155 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()])), t145), t146), t147), t148), t149), t150), t154])
  let t139 = @drule.part_match(fn(x138 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x138))
  }, @iterate.sum_union())
  let t134 = @simp.rewrite_tac(@list.List([lemma]))
  let t131 = @simp.gen_rewrite_rule(fn(x130 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x130
  }, @list.List([@sets.has_size()]))
  let t133 = @tactics.first_assum(fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s128 = @tactics.assume_tac(x127)
      fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s128(x129)
      }
    })(t131(x132))
  })
  let t126 = @tactics.repeat_tac(@tactics.disch_then(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s124 = @tactics.subst1_tac(x123)
    fn(x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s124(x125)
    }
  }))
  let t122 = @simp.asm_simp_tac(@list.List([]))
  let t121 = @tactics.disch_then(fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x118
    let t120 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : (I, A) -> Bool)"), th_1))
    @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(s : I) => INTER((x : (I, A) -> Bool)((a : I)), x(s))"), th_1)), t120)
  })
  let t117 = @simp.asm_rewrite_tac(@list.List([]))
  let t113 = @term_syntax.parse_term("(A : (I) -> Bool)")
  let t116 = @tactics.disch_then(fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s111 = @tactics.mp_tac(x110)
      fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s111(x112)
      }
    })(((x114 : @kernel.Thm) => @bool.spec(t113, x114))(x115))
  })
  let t109 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t105 = @term_syntax.parse_term("(n : Num)")
  let t108 = @tactics.first_x_assum(fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s103 = @tactics.mp_tac(x102)
      fn(x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s103(x104)
      }
    })(((x106 : @kernel.Thm) => @bool.spec(t105, x106))(x107))
  })
  let t101 = @simp.rewrite_tac(@list.List([@sets.inter_unions(), @sets.simple_image(), @equal.gsym(@sets.image_o()), @trivia.o_def()]))
  let t97 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@sets.set_tac(@list.List([])), @tactics.disch_tac])))
  let t95 = @sets.set_rule(@term_syntax.parse_term("UNION(INTER((s : (_) -> Bool), (t : (_) -> Bool)), DIFF(t, s)) == t"))
  let t96 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION((s : (_) -> Bool), DIFF((t : (_) -> Bool), s)) == UNION(s, t)")), t95]))
  let t94 = @tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x89
    let t92 = @term_syntax.parse_term("DIFF((t : (A) -> Bool), (s : (A) -> Bool))")
    let t93 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (A) -> Bool)"), t92]), th))
    let t91 = @term_syntax.parse_term("DIFF((t : (A) -> Bool), (s : (A) -> Bool))")
    @tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("INTER((s : (A) -> Bool), (t : (A) -> Bool))"), t91]), th)), t93)
  })
  let t88 = @tactics.undisch_tac(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(s) && P(t) && DISJOINT(s, t) → (f : ((A) -> Bool) -> Real)(UNION(s, t)) == f(s) + f(t)"))
  let t87 = @tactics.repeat_tac(@tactics.strip_tac)
  let t85 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t86 = @tactics.spec_tac(@term_syntax.parse_term("(x : (I, A) -> Bool)((a : I))"), t85)
  let t84 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t98 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("UNIONS(IMAGE((x : (I, A) -> Bool), (A : (I) -> Bool)))"), t84), t86), t87), t88), t94), t96), t97), @calc_rat.asm_real_arith_tac)
  let t83 = @simp.asm_simp_tac(@list.List([@sets.image_clauses(), @sets.unions_0(), @sets.unions_insert(), @sets.forall_in_insert()]))
  let t82 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t80 = @term_syntax.parse_term("(u : (I) -> Bool)")
  let t81 = @tactics.spec_tac(@term_syntax.parse_term("(A : (I) -> Bool)"), t80)
  let t79 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t78 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((A : (I) -> Bool))"), fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s76 = @tactics.mp_tac(x75)
    fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s76(x77)
    }
  })
  let t74 = @tactics.undisch_tac(@term_syntax.parse_term("∀ b : I, IN(b, (A : (I) -> Bool)) → (P : ((A) -> Bool) -> Bool)((x : (I, A) -> Bool)(b))"))
  let t99 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t74), t78), t79), t81), t82), t83), t98])
  let t100 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)((x : (I, A) -> Bool)((a : I))) && P(UNIONS(IMAGE(x, (A : (I) -> Bool))))"), fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s72 = @tactics.mp_tac(x71)
    fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s72(x73)
    }
  }), t99), @tactics.all_tac])
  let t70 = @tactics.exists_tac(@term_syntax.parse_term("(f : ((A) -> Bool) -> Real)((x : (I, A) -> Bool)((a : I))) + f(UNIONS(IMAGE(x, (A : (I) -> Bool)))) - f(INTER(x(a), UNIONS(IMAGE(x, A))))"))
  let t69 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t68 = @simp.rewrite_tac(@list.List([@sets.image_clauses(), @sets.unions_insert()]))
  let t67 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert()]))
  let t66 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (I, A) -> Bool)"))
  let t65 = @tactics.disch_then(fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s63 = @tactics.subst1_tac(x62)
    fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s63(x64)
    }
  })
  let t61 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.assume_tac(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  }, fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s59 = @tactics.mp_tac(x58)
    fn(x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s59(x60)
    }
  })))
  let t52 = @term_syntax.parse_term("(A : (I) -> Bool)")
  let t53 = @term_syntax.parse_term("(a : I)")
  let t54 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A0 : (I) -> Bool)"), t53, t52]))
  let t51 = @tactics.disch_then(fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t49 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t47 = @simp.asm_simp_tac(@list.List([@sets.union_empty(), @sets.disjoint_empty()]))
  let t42 = @term_syntax.parse_term("({} : (A) -> Bool)")
  let t43 = @list.List([@term_syntax.parse_term("({} : (A) -> Bool)"), t42])
  let t46 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x45 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s40 = @tactics.mp_tac(x39)
      fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s40(x41)
      }
    })(((x44 : @kernel.Thm) => @bool.specl(t43, x44))(x45))
  }))
  let t38 = @tactics.repeat_tac(@tactics.strip_tac)
  let t37 = @simp.asm_rewrite_tac(@list.List([@sets.empty_gspec(), @iterate.sum_clauses()]))
  let t36 = @simp.rewrite_tac(@list.List([@sets.unions_0(), @sets.image_clauses(), @sets.subset_empty(), @class.taut(@term_syntax.parse_term("!((p : Bool) && !p)"))]))
  let t35 = @tactics.disch_then(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s33 = @tactics.subst1_tac(x32)
    fn(x34 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s33(x34)
    }
  })
  let t48 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), @tactics.gen_tac), t35), t36), t37), t38), t46), t47), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t30 = @simp.rewrite_tac(@list.List([@sets.has_size_clauses(), @theorems.left_imp_exists_thm()]))
  let t29 = @tactics.match_mp_tac(@nums.num_induction())
  let t28 = @tactics.match_mp_tac(@arith.num_wf())
  let t27 = @tactics.match_mp_tac(@meson.meson(@list.List([@sets.has_size()]), @term_syntax.parse_term("(∀ n : Num, ∀ s : (_) -> Bool, HAS_SIZE(s, n) → (P : ((_) -> Bool) -> Bool)(s)) → (∀ s : (_) -> Bool, FINITE(s) → P(s))")))
  let t26 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t25 = @simp.gen_rewrite_tac(fn(x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x18 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s19 = @equal.land_conv(x18)
      fn(x20 : @kernel.Term) -> @kernel.Thm raise {
        s19(x20)
      }
    })((fn(x21 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s22 = @equal.once_depth_conv(x21)
      fn(x23 : @kernel.Term) -> @kernel.Thm raise {
        s22(x23)
      }
    })(x24))
  }, @list.List([@theorems.right_imp_forall_thm()]))
  let t17 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t16 = @tactics.repeat_tac(@tactics.gen_tac)
  let t208 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t16), t17), t25), t26), @tactics.strip_tac), t27), t28), t29), t30), @tactics.conj_tac), t48), t49), t51), @tactics.disch_tac), t54), t61), t65), t66), t67), @tactics.strip_tac), t68), t69), t70), @tactics.conj_tac), t100), t101), t108), t109), t116), t117), t121), t122), t126), t133), t134), fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x141 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x140 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s136 = @tactics.mp_tac(x135)
            fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s136(x137)
            }
          })(t139(x140))
        })(@kernel.rand(x141))
      })((fn(x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x142.1
      })(x143))
    })(x144)(x144)
  }), @tactics.ants_tac), t155), t156), t157), t158), @tactics.conj_tac), t207)
  inclusion_exclusion_real_restricted_indexed_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ f : ((A) -> Bool) -> Real, ∀ A : (I) -> Bool, ∀ x : (I, A) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) && DISJOINT(s, t) → f(UNION(s, t)) == f(s) + f(t)) && P({}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(INTER(s, t)) && P(UNION(s, t)) && P(DIFF(s, t))) && FINITE(A) && (∀ a : I, IN(a, A) → P(x(a))) → f(UNIONS(IMAGE(x, A))) == sum({(B : (I) -> Bool) | SUBSET(B, A) && !(B == {})}, (B : (I) -> Bool) => pow(-real_of_num(1), CARD(B) + 1) * f(INTERS(IMAGE(x, B))))"), t208))
}

///|
let inclusion_exclusion_real_restricted_indexed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_REAL_RESTRICTED_INDEXED")

///|
/// `INCLUSION_EXCLUSION_REAL_RESTRICTED_INDEXED`
pub fn inclusion_exclusion_real_restricted_indexed() -> @kernel.Thm {
  inclusion_exclusion_real_restricted_indexed_c.get()
}

///|
/// INCLUSION_EXCLUSION_REAL_RESTRICTED
fn step_4() -> Unit raise {
  let t213 = @simp.asm_rewrite_tac(@list.List([@sets.image_id()]))
  let t209 = @term_syntax.parse_term("(x : (A) -> Bool) => x")
  let t210 = @term_syntax.parse_term("(A : ((A) -> Bool) -> Bool)")
  let t211 = @term_syntax.parse_term("(f : ((A) -> Bool) -> Real)")
  let t212 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)"), t211, t210, t209]), inclusion_exclusion_real_restricted_indexed()))
  let t214 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t212), t213)
  inclusion_exclusion_real_restricted_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, ∀ f : ((A) -> Bool) -> Real, ∀ A : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) && DISJOINT(s, t) → f(UNION(s, t)) == f(s) + f(t)) && P({}) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, P(s) && P(t) → P(INTER(s, t)) && P(UNION(s, t)) && P(DIFF(s, t))) && FINITE(A) && (∀ a : (A) -> Bool, IN(a, A) → P(a)) → f(UNIONS(A)) == sum({(B : ((A) -> Bool) -> Bool) | SUBSET(B, A) && !(B == {})}, (B : ((A) -> Bool) -> Bool) => pow(-real_of_num(1), CARD(B) + 1) * f(INTERS(B)))"), t214))
}

///|
let inclusion_exclusion_real_restricted_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_REAL_RESTRICTED")

///|
/// `INCLUSION_EXCLUSION_REAL_RESTRICTED`
pub fn inclusion_exclusion_real_restricted() -> @kernel.Thm {
  inclusion_exclusion_real_restricted_c.get()
}

///|
/// INCLUSION_EXCLUSION_REAL_INDEXED
fn step_5() -> Unit raise {
  let t215 = @simp.rewrite_tac(@list.List([]))
  let t216 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : (A) -> Bool) => true"), inclusion_exclusion_real_restricted_indexed())), t215)
  inclusion_exclusion_real_indexed_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((A) -> Bool) -> Real, ∀ A : (I) -> Bool, ∀ x : (I, A) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, DISJOINT(s, t) → f(UNION(s, t)) == f(s) + f(t)) && FINITE(A) → f(UNIONS(IMAGE(x, A))) == sum({(B : (I) -> Bool) | SUBSET(B, A) && !(B == {})}, (B : (I) -> Bool) => pow(-real_of_num(1), CARD(B) + 1) * f(INTERS(IMAGE(x, B))))"), t216))
}

///|
let inclusion_exclusion_real_indexed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_REAL_INDEXED")

///|
/// `INCLUSION_EXCLUSION_REAL_INDEXED`
pub fn inclusion_exclusion_real_indexed() -> @kernel.Thm {
  inclusion_exclusion_real_indexed_c.get()
}

///|
/// INCLUSION_EXCLUSION_REAL
fn step_6() -> Unit raise {
  let t220 = @simp.asm_rewrite_tac(@list.List([@sets.image_id()]))
  let t217 = @term_syntax.parse_term("(x : (A) -> Bool) => x")
  let t218 = @term_syntax.parse_term("(A : ((A) -> Bool) -> Bool)")
  let t219 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : ((A) -> Bool) -> Real)"), t218, t217]), inclusion_exclusion_real_indexed()))
  let t221 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t219), t220)
  inclusion_exclusion_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((A) -> Bool) -> Real, ∀ A : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, DISJOINT(s, t) → f(UNION(s, t)) == f(s) + f(t)) && FINITE(A) → f(UNIONS(A)) == sum({(B : ((A) -> Bool) -> Bool) | SUBSET(B, A) && !(B == {})}, (B : ((A) -> Bool) -> Bool) => pow(-real_of_num(1), CARD(B) + 1) * f(INTERS(B)))"), t221))
}

///|
let inclusion_exclusion_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_REAL")

///|
/// `INCLUSION_EXCLUSION_REAL`
pub fn inclusion_exclusion_real() -> @kernel.Thm {
  inclusion_exclusion_real_c.get()
}

///|
/// INCLUSION_EXCLUSION
fn step_7() -> Unit raise {
  let t227 = @simp.simp_tac(@list.List([@sets.card_union(), @sets.disjoint(), @realax.real_of_num_add()]))
  let t226 = @tactics.disch_then(@tactics.match_mp_tac)
  let t225 = @simp.asm_simp_tac(@list.List([@sets.finite_inter(), @sets.finite_union(), @sets.finite_diff(), @sets.finite_empty()]))
  let t222 = @term_syntax.parse_term("(s : ((A) -> Bool) -> Bool)")
  let t223 = @term_syntax.parse_term("(s : (A) -> Bool) => real_of_num(CARD(s))")
  let t224 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (A) -> Bool) => FINITE(s)"), t223, t222]), inclusion_exclusion_real_restricted()))
  let t228 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t224), t225), t226), t227)
  inclusion_exclusion_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ k : (A) -> Bool, IN(k, s) → FINITE(k)) → real_of_num(CARD(UNIONS(s))) == sum({(t : ((A) -> Bool) -> Bool) | SUBSET(t, s) && !(t == {})}, (t : ((A) -> Bool) -> Bool) => pow(-real_of_num(1), CARD(t) + 1) * real_of_num(CARD(INTERS(t))))"), t228))
}

///|
let inclusion_exclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION")

///|
/// `INCLUSION_EXCLUSION`
pub fn inclusion_exclusion() -> @kernel.Thm {
  inclusion_exclusion_c.get()
}

///|
/// INCLUSION_EXCLUSION_USUAL
fn step_8() -> Unit raise {
  let t259 = @meson.asm_meson_tac(@list.List([@sets.card_eq_0(), @int.arith_rule(@term_syntax.parse_term("!(1 <= 0)")), @sets.finite_subset()]))
  let t258 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t257 = @simp.gen_rewrite_tac(fn(x256 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x256
  }, @list.List([@sets.extension()]))
  let t255 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.has_size()]))
  let t254 = @simp.rewrite_tac(@list.List([@iterate.sum_lmul()]))
  let t253 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t252 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t251 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t249 = @meson.asm_meson_tac(@list.List([@sets.choose_subset(), @sets.card_subset(), @sets.finite_subset(), @sets.card_eq_0(), @sets.has_size()]))
  let t248 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))]))
  let t247 = @simp.rewrite_tac(@list.List([@sets.in_image(), @iterate.in_numseg(), @sets.in_elim_thm()]))
  let t250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x246 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x246
  }, @list.List([@sets.extension()])), t247), t248), t249), @tactics.all_tac])
  let t245 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) && sum(t, (f : (_) -> Real)) == sum(t, (g : (_) -> Real)) → sum(s, f) == sum(t, g)")))
  let t244 = @tactics.disch_then(fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s242 = @tactics.subst1_tac(x241)
    fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s242(x243)
    }
  })
  let t240 = @simp.asm_simp_tac(@list.List([finite_subsets_restrict_v1()]))
  let t234 = @drule.part_match(fn(x233 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x233))
  }, @bool.ispec(@term_syntax.parse_term("(CARD : ((_) -> Bool) -> Num)"), @iterate.sum_image_gen()))
  let t229 = @simp.asm_simp_tac(@list.List([inclusion_exclusion()]))
  let t260 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t229), fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x236 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x235 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s231 = @tactics.mp_tac(x230)
            fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s231(x232)
            }
          })(t234(x235))
        })(@equal.lhand(x236))
      })((fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x237.1
      })(x238))
    })(x239)(x239)
  }), t240), t244), t245), @tactics.conj_tac), t250), t251), t252), t253), @tactics.strip_tac), t254), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t255), t257), t258), t259)
  inclusion_exclusion_usual_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ k : (A) -> Bool, IN(k, s) → FINITE(k)) → real_of_num(CARD(UNIONS(s))) == sum(op_dot_dot(1, CARD(s)), (n : Num) => pow(-real_of_num(1), n + 1) * sum({(t : ((A) -> Bool) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, n)}, (t : ((A) -> Bool) -> Bool) => real_of_num(CARD(INTERS(t)))))"), t260))
}

///|
let inclusion_exclusion_usual_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_USUAL")

///|
/// `INCLUSION_EXCLUSION_USUAL`
pub fn inclusion_exclusion_usual() -> @kernel.Thm {
  inclusion_exclusion_usual_c.get()
}

///|
/// FINITE_SUBSETS_RESTRICT
fn step_9() -> Unit raise {
  let t264 = @sets.set_tac(@list.List([]))
  let t263 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset()]))
  let t262 = @tactics.exists_tac(@term_syntax.parse_term("{(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}"))
  let t261 = @tactics.match_mp_tac(@sets.finite_subset())
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t261), t262), t263), t264)
  finite_subsets_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ p : ((A) -> Bool) -> Bool, FINITE(s) → FINITE({(t : (A) -> Bool) | SUBSET(t, s) && p(t)})"), t265))
}

///|
let finite_subsets_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBSETS_RESTRICT")

///|
/// `FINITE_SUBSETS_RESTRICT`
pub fn finite_subsets_restrict() -> @kernel.Thm {
  finite_subsets_restrict_c.get()
}

///|
/// CARD_ADJUST_LEMMA
fn step_10() -> Unit raise {
  let t266 = @meson.meson_tac(@list.List([@sets.card_image_inj()]))
  card_adjust_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ x : Num, ∀ y : Num, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && x == y + CARD(IMAGE(f, s)) → x == y + CARD(s)"), t266))
}

///|
let card_adjust_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_ADJUST_LEMMA")

///|
/// `CARD_ADJUST_LEMMA`
pub fn card_adjust_lemma() -> @kernel.Thm {
  card_adjust_lemma_c.get()
}

///|
/// CARD_SUBSETS_STEP
fn step_11() -> Unit raise {
  let t292 = @meson.asm_meson_tac(@list.List([@sets.card_clauses(), @arith.even(), @arith.not_odd(), @sets.finite_subset(), @sets.subset()]))
  let t291 = @meson.asm_meson_tac(@list.List([@sets.card_clauses(), @arith.even(), @arith.not_odd(), @sets.finite_subset(), @sets.subset()]))
  let t290 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t289 = @simp.asm_rewrite_tac(@list.List([]))
  let t288 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET((v : (A) -> Bool), (s : (A) -> Bool))"))
  let t287 = @simp.asm_rewrite_tac(@list.List([]))
  let t286 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (A) -> Bool) == INSERT((x : A), (v : (A) -> Bool))"))
  let t285 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (A) -> Bool)"))
  let t284 = @simp.gen_rewrite_tac(fn(x283 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x283
  }, @list.List([@class.fun_eq_thm()]))
  let t282 = @simp.rewrite_tac(@list.List([@theorems.right_or_distrib(), @theorems.left_and_exists_thm()]))
  let t281 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t280 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_union(), subset_insert_exists()]))
  let t279 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t278 = @simp.gen_rewrite_tac(fn(x277 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x277
  }, @list.List([@sets.extension()]))
  let t275 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t274 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (b → !a)")), @sets.forall_in_image()]))
  let t276 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_inter()])), t274), t275), @tactics.all_tac])
  let t273 = @simp.asm_simp_tac(@list.List([finite_subsets_restrict(), @sets.finite_insert()]))
  let t272 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t271 = @tactics.conv_tac(@equal.sym_conv)
  let t293 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])), t271), t272), t273), @tactics.conj_tac), t276), t278), t279), t280), t281), t282), @tactics.ap_term_tac), @tactics.ap_term_tac), t284), t285), t286), t287), t288), t289), @tactics.binop_tac), t290), t291), t292)
  let t270 = @simp.asm_simp_tac(@list.List([finite_subsets_restrict()]))
  let t269 = @tactics.exists_tac(@term_syntax.parse_term("(u : (A) -> Bool) => INSERT((x : A), u)"))
  let t267 = @term_syntax.parse_type("B")
  let t268 = @tactics.match_mp_tac(@kernel.inst_type(@list.List([(@term_syntax.parse_type("A"), t267)]), card_adjust_lemma()))
  let t294 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t268), t269), t270), t293)
  card_subsets_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ s : (A) -> Bool, FINITE(s) && !IN(x, s) && SUBSET((u : (A) -> Bool), s) → CARD({(t : (A) -> Bool) | SUBSET(t, INSERT(x, s)) && SUBSET(u, t) && ODD(CARD(t))}) == CARD({(t : (A) -> Bool) | SUBSET(t, s) && SUBSET(u, t) && ODD(CARD(t))}) + CARD({(t : (A) -> Bool) | SUBSET(t, s) && SUBSET(u, t) && EVEN(CARD(t))}) && CARD({(t : (A) -> Bool) | SUBSET(t, INSERT(x, s)) && SUBSET(u, t) && EVEN(CARD(t))}) == CARD({(t : (A) -> Bool) | SUBSET(t, s) && SUBSET(u, t) && EVEN(CARD(t))}) + CARD({(t : (A) -> Bool) | SUBSET(t, s) && SUBSET(u, t) && ODD(CARD(t))})"), t294))
}

///|
let card_subsets_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUBSETS_STEP")

///|
/// `CARD_SUBSETS_STEP`
pub fn card_subsets_step() -> @kernel.Thm {
  card_subsets_step_c.get()
}

///|
/// CARD_SUBSUPERSETS_EVEN_ODD
fn step_12() -> Unit raise {
  let t319 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @arith.lt(), @sets.psubset()]))
  let t318 = @tactics.match_accept_tac(@arith.add_sym())
  let t320 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.conj_assoc(), @sets.subset_antisym_eq()])), t318), t319])
  let t317 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == (v : (A) -> Bool)"))
  let t316 = @simp.asm_simp_tac(@list.List([card_subsets_step()]))
  let t315 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([@sets.finite_insert()])), @tactics.all_tac])
  let t314 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((v : (A) -> Bool)) && SUBSET((s : (A) -> Bool), v)"), @tactics.strip_assume_tac)
  let t313 = @simp.abbrev_tac(@term_syntax.parse_term("(v : (A) -> Bool) == DELETE((u : (A) -> Bool), (x : A))"))
  let t312 = @tactics.mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : A), DELETE((u : (A) -> Bool), x))")))
  let t309 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → s == INSERT(x, DELETE(s, x))")))
  let t311 = @tactics.first_x_assum(fn(x310 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s307 = @tactics.subst_all_tac(x306)
      fn(x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s307(x308)
      }
    })(t309(x310))
  })
  let t305 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(@tactics.strip_assume_tac))
  let t304 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s299 = @tactics.assume_tac(x298)
    fn(x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s299(x300)
    }
  }, fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s302 = @tactics.mp_tac(x301)
    fn(x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s302(x303)
    }
  })))
  let t297 = @simp.rewrite_tac(@list.List([@sets.psubset_alt()]))
  let t296 = @wf.wf_induct_tac(@term_syntax.parse_term("CARD((u : (A) -> Bool))"))
  let t295 = @tactics.repeat_tac(@tactics.gen_tac)
  let t321 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) == (b && a && c)"))])), t295), t296), t297), t304), t305), t311), t312), t313), @tactics.strip_tac), t314), t315), t316), t317), t320)
  card_subsupersets_even_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ u : (A) -> Bool, FINITE(u) && PSUBSET(s, u) → CARD({(t : (A) -> Bool) | SUBSET(s, t) && SUBSET(t, u) && EVEN(CARD(t))}) == CARD({(t : (A) -> Bool) | SUBSET(s, t) && SUBSET(t, u) && ODD(CARD(t))})"), t321))
}

///|
let card_subsupersets_even_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUBSUPERSETS_EVEN_ODD")

///|
/// `CARD_SUBSUPERSETS_EVEN_ODD`
pub fn card_subsupersets_even_odd() -> @kernel.Thm {
  card_subsupersets_even_odd_c.get()
}

///|
/// SUM_ALTERNATING_CANCELS
fn step_13() -> Unit raise {
  let t329 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * real_of_num(1) + x * -real_of_num(1) == real_of_num(0)"))
  let t330 = @simp.asm_simp_tac(@list.List([@calc_int.real_pow_neg(), @real.real_pow_one(), @equal.gsym(@arith.not_even()), @iterate.sum_const(), @sets.finite_restrict(), t329]))
  let t327 = @meson.meson_tac(@list.List([]))
  let t326 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_even())]))
  let t325 = @simp.asm_simp_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_inter(), @sets.in_union(), @sets.not_in_empty()]))
  let t324 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t328 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t324), t325), t326), t327), @tactics.all_tac])
  let t323 = @tactics.exists_tac(@term_syntax.parse_term("sum({(x : A) | IN(x, (s : (A) -> Bool)) && EVEN((f : (A) -> Num)(x))}, (x : A) => pow(-real_of_num(1), f(x))) + sum({(x : A) | IN(x, s) && ODD(f(x))}, (x : A) => pow(-real_of_num(1), f(x)))"))
  let t322 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t331 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t322), t323), @tactics.conj_tac), t328), t330)
  sum_alternating_cancels_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Num, FINITE(s) && CARD({(x : A) | IN(x, s) && EVEN(f(x))}) == CARD({(x : A) | IN(x, s) && ODD(f(x))}) → sum(s, (x : A) => pow(-real_of_num(1), f(x))) == real_of_num(0)"), t331))
}

///|
let sum_alternating_cancels_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_ALTERNATING_CANCELS")

///|
/// `SUM_ALTERNATING_CANCELS`
pub fn sum_alternating_cancels() -> @kernel.Thm {
  sum_alternating_cancels_c.get()
}

///|
/// INCLUSION_EXCLUSION_SYMMETRIC
fn step_14() -> Unit raise {
  let t371 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t370 = @tactics.match_mp_tac(card_subsupersets_even_odd())
  let t369 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool)) == (b && a && c)"))]))
  let t368 = @simp.asm_simp_tac(@list.List([finite_subsets_restrict(), @sets.in_elim_thm()]))
  let t367 = @tactics.match_mp_tac(sum_alternating_cancels())
  let t366 = @tactics.repeat_tac(@tactics.disj1_tac)
  let t365 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t363 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_add(), @real.real_pow_one(), @realax.real_mul_lid()]))
  let t362 = @simp.rewrite_tac(@list.List([@iterate.sum_sing(), @realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add())]))
  let t364 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset_antisym_eq(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))])), t362), t363), @tactics.all_tac])
  let t361 = @simp.asm_rewrite_tac(@list.List([]))
  let t360 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t359 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : (A) -> Bool)"))
  let t358 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t357 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@iterate.sum_delta(), @sets.in_elim_thm(), @sets.subset_refl()]))])
  let t356 = @tactics.exists_tac(@term_syntax.parse_term("sum({(u : (A) -> Bool) | SUBSET(u, (s : (A) -> Bool))}, (u : (A) -> Bool) => if u == s { (f : ((A) -> Bool) -> Real)(s) } else { real_of_num(0) })"))
  let t355 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t354 = @simp.rewrite_tac(@list.List([@iterate.sum_rmul(), @sets.in_elim_thm()]))
  let t353 = @tactics.disch_then(fn(x350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s351 = @tactics.subst1_tac(x350)
    fn(x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s351(x352)
    }
  })
  let t349 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset()]))
  let t343 = @drule.part_match(fn(x342 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x342))
  }, @iterate.sum_sum_restrict())
  let t338 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t336 = @meson.asm_meson_tac(@list.List([@sets.finite_subset()]))
  let t335 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → (SUBSET((u : (_) -> Bool), t) && SUBSET(u, s)) == SUBSET(u, s)"))]))
  let t337 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq()), t335), t336), @tactics.all_tac])
  let t334 = @tactics.exists_tac(@term_syntax.parse_term("sum({(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}, (t : (A) -> Bool) => pow(-real_of_num(1), CARD(t)) * sum({(u : (A) -> Bool) | IN(u, {(u : (A) -> Bool) | SUBSET(u, s)}) && SUBSET(u, t)}, (u : (A) -> Bool) => pow(-real_of_num(1), CARD(u)) * (f : ((A) -> Bool) -> Real)(u)))"))
  let t333 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t332 = @tactics.conv_tac(@equal.sym_conv)
  let t372 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t332), t333), t334), @tactics.conj_tac), t337), t338), fn(x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x345 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x344 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s340 = @tactics.mp_tac(x339)
            fn(x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s340(x341)
            }
          })(t343(x344))
        })(@equal.lhs(x345))
      })((fn(x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x346.1
      })(x347))
    })(x348)(x348)
  }), t349), t353), t354), t355), t356), @tactics.conj_tac), t357), t358), t359), t360), @tactics.strip_tac), @class.cond_cases_tac), t361), t364), t365), t366), t367), t368), t369), t370), t371)
  inclusion_exclusion_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((A) -> Bool) -> Real, ∀ g : ((A) -> Bool) -> Real, (∀ s : (A) -> Bool, FINITE(s) → g(s) == sum({(t : (A) -> Bool) | SUBSET(t, s)}, (t : (A) -> Bool) => pow(-real_of_num(1), CARD(t)) * f(t))) → (∀ s : (A) -> Bool, FINITE(s) → f(s) == sum({(t : (A) -> Bool) | SUBSET(t, s)}, (t : (A) -> Bool) => pow(-real_of_num(1), CARD(t)) * g(t)))"), t372))
}

///|
let inclusion_exclusion_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_SYMMETRIC")

///|
/// `INCLUSION_EXCLUSION_SYMMETRIC`
pub fn inclusion_exclusion_symmetric() -> @kernel.Thm {
  inclusion_exclusion_symmetric_c.get()
}

///|
/// INCLUSION_EXCLUSION_MOBIUS
fn step_15() -> Unit raise {
  let t407 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t406 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @real.real_pow_one()]))
  let t405 = @simp.asm_simp_tac(@list.List([@real.real_pow_sub(), @calc_rat.real_arith(@term_syntax.parse_term("!(-real_of_num(1) == real_of_num(0))")), @sets.card_subset()]))
  let t404 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_mul_assoc()]))
  let t403 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : (A) -> Bool)"))
  let t402 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t401 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t400 = @tactics.disch_then(fn(x397 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s398 = @tactics.subst1_tac(x397)
    fn(x399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s398(x399)
    }
  })
  let t396 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @realax.real_mul_lid()]))
  let t395 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t394 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t392 = @equal.gsym(@arith.mult_2())
  let t393 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add()), t392]))
  let t388 = @term_syntax.parse_term("op_star(pow(-real_of_num(1), CARD((s : (A) -> Bool))))")
  let t391 = @tactics.disch_then(fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s386 = @tactics.mp_tac(x385)
      fn(x387 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s386(x387)
      }
    })(((x389 : @kernel.Thm) => @equal.ap_term(t388, x389))(x390))
  })
  let t384 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t383 = @tactics.disch_then(fn(x382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s378 = @tactics.mp_tac(x377)
      fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s378(x379)
      }
    })(((x381 : @kernel.Thm) => @bool.spec(t380, x381))(x382))
  })
  let t376 = @list.List([@simp.asm_simp_tac(@list.List([@arith.even_add(), @real.real_pow_one(), @calc_int.real_pow_neg(), @realax.real_mul_lid(), @class.eta_ax()])), @tactics.all_tac])
  let t375 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_add())]))
  let t373 = @term_syntax.parse_term("(g : ((A) -> Bool) -> Real)")
  let t374 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : (A) -> Bool) => pow(-real_of_num(1), CARD(t)) * (f : ((A) -> Bool) -> Real)(t)"), t373]), inclusion_exclusion_symmetric()))
  let t408 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t374), t375), @tactics.ants_tac), t376), t383), t384), t391), t393), t394), t395), t396), t400), t401), t402), t403), t404), t405), t406), t407), @calc_rat.real_arith_tac)
  inclusion_exclusion_mobius_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((A) -> Bool) -> Real, ∀ g : ((A) -> Bool) -> Real, (∀ s : (A) -> Bool, FINITE(s) → g(s) == sum({(t : (A) -> Bool) | SUBSET(t, s)}, f)) → (∀ s : (A) -> Bool, FINITE(s) → f(s) == sum({(t : (A) -> Bool) | SUBSET(t, s)}, (t : (A) -> Bool) => pow(-real_of_num(1), CARD(s) - CARD(t)) * g(t)))"), t408))
}

///|
let inclusion_exclusion_mobius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCLUSION_EXCLUSION_MOBIUS")

///|
/// `INCLUSION_EXCLUSION_MOBIUS`
pub fn inclusion_exclusion_mobius() -> @kernel.Thm {
  inclusion_exclusion_mobius_c.get()
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
}
