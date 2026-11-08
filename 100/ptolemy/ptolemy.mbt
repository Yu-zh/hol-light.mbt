// Translated from upstream 100/ptolemy.ml; edit this file directly.

///|
/// DOT_VECTOR
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([@vectors.dot(), @cart.dimindex_2(), @vectors.sum_2(), @vectors.vector_2()]))
  dot_vector_c.set(@tactics.prove(@term_syntax.parse_term("(dot : (Cart[Real, 2], Cart[Real, 2]) -> Real)((vector : (List[Real]) -> Cart[Real, 2])([(x1 : Real), (y1 : Real)]), (vector : (List[Real]) -> Cart[Real, 2])([(x2 : Real), (y2 : Real)])) == x1 * x2 + y1 * y2"), t1))
}

///|
let dot_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_VECTOR")

///|
/// `DOT_VECTOR`
pub fn dot_vector() -> @kernel.Thm {
  dot_vector_c.get()
}

///|
/// DIST_SEGMENT_LEMMA
fn step_2() -> Unit raise {
  let t18 = @tactics.conv_tac(@calc_rat.real_ring)
  let t17 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(a2 : Real) / real_of_num(2)"), @transcendentals.sin_circle()))
  let t16 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(a1 : Real) / real_of_num(2)"), @transcendentals.sin_circle()))
  let t15 = @simp.rewrite_tac(@list.List([@transcendentals.sin_sub(), @transcendentals.sin_double(), @transcendentals.cos_double()]))
  let t14 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (x : Real) - real_of_num(2) * (y : Real)) / real_of_num(2) == x - y"))]))
  let t13 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a2 : Real) == real_of_num(2) * (a2 / real_of_num(2))")))
  let t12 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) == real_of_num(2) * (a1 / real_of_num(2))")))
  let t11 = @simp.rewrite_tac(@list.List([@vectors.dot_lsub(), @vectors.dot_rsub(), dot_vector()]))
  let t10 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("dot(op_pct((r : Real), (x : Cart[Real, _])), op_pct(r, x)) == pow(r, 2) * dot(x, x)"))]))
  let t9 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(c : Cart[Real, 2]) + op_pct((r : Real), (x : Cart[Real, 2])) - (c + op_pct(r, (y : Cart[Real, 2]))) == op_pct(r, x - y)"))]))
  let t7 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi_le())
  let t6 = @simp.asm_rewrite_tac(@list.List([]))
  let t5 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t4 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t8 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t4), t5), t6), t7), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3 = @tactics.match_mp_tac(@real.sqrt_unique())
  let t2 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_norm()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2), t3), @tactics.conj_tac), t8), t9), t10), t11), t12), t13), t14), t15), t16), t17), t18)
  dist_segment_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a1 : Real, ∀ a2 : Real, real_of_num(0) <= a1 && a1 <= a2 && a2 <= real_of_num(2) * pi && real_of_num(0) <= (radius : Real) → distance(((centre : Cart[Real, 2]) + op_pct(radius, vector([cos(a1), sin(a1)])), centre + op_pct(radius, vector([cos(a2), sin(a2)])))) == real_of_num(2) * (radius * sin((a2 - a1) / real_of_num(2)))"), t19))
}

///|
let dist_segment_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_SEGMENT_LEMMA")

///|
/// `DIST_SEGMENT_LEMMA`
pub fn dist_segment_lemma() -> @kernel.Thm {
  dist_segment_lemma_c.get()
}

///|
/// PTOLEMY
fn step_3() -> Unit raise {
  let t49 = @tactics.conv_tac(@calc_rat.real_ring)
  let t48 = @simp.rewrite_tac(@list.List([@transcendentals.sin_sub(), @transcendentals.sin_add(), @transcendentals.cos_add(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t44 = @term_syntax.parse_term("(d : Real) / real_of_num(2)")
  let t45 = @term_syntax.parse_term("(c : Real) / real_of_num(2)")
  let t46 = @term_syntax.parse_term("(b : Real) / real_of_num(2)")
  let t47 = @tactics.map_every(fn(x42 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_2 = x42
    @tactics.mp_tac(@bool.spec(t_2, @transcendentals.sin_circle()))
  }, @list.List([@term_syntax.parse_term("(a : Real) / real_of_num(2)"), t46, t45, t44]))
  let t41 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real)) / real_of_num(2) == x / real_of_num(2) - y / real_of_num(2)"))]))
  let t40 = @tactics.repeat_tac(fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x30
      let t_1 = @basics.find_term(fn(x32 : @kernel.Term) -> Bool raise {
        let t = x32
        @lib.can(@drule.part_match(fn(x33 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhs(@kernel.rand(x33))
        }, dist_segment_lemma()), t)
      }, w)
      let t38 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x35 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s36 = @tactics.subst1_tac(x35)
        fn(x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s36(x37)
        }
      })])
      @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@drule.part_match(fn(x34 : @kernel.Term) -> @kernel.Term raise {
        @equal.lhs(@kernel.rand(x34))
      }, dist_segment_lemma())(t_1)), @tactics.ants_tac), t38)
    })(x39)(x39)
  })
  let t29 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s21 = @tactics.subst1_tac(x20)
      fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s21(x22)
      }
    })(((x27 : @kernel.Thm) => @lib.check(fn(x26 : @kernel.Thm) -> Bool raise {
      (fn(x24 : @kernel.Term) -> Bool raise {
        (fn(x23 : @kernel.Term) -> Bool raise {
          @kernel.is_var(x23)
        })(@equal.lhs(x24))
      })((fn(x25 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x25)
      })(x26))
    }, x27))(x28))
  }))
  let t50 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t29), t40), t41), t47), t48), t49)
  ptolemy_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ D : Cart[Real, 2], ∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ centre : Cart[Real, 2], ∀ radius : Real, A == centre + op_pct(radius, vector([cos(a), sin(a)])) && B == centre + op_pct(radius, vector([cos(b), sin(b)])) && C == centre + op_pct(radius, vector([cos(c), sin(c)])) && D == centre + op_pct(radius, vector([cos(d), sin(d)])) && real_of_num(0) <= radius && real_of_num(0) <= a && a <= b && b <= c && c <= d && d <= real_of_num(2) * pi → distance((A, C)) * distance((B, D)) == distance((A, B)) * distance((C, D)) + distance((A, D)) * distance((B, C))"), t50))
}

///|
let ptolemy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PTOLEMY")

///|
/// `PTOLEMY`
pub fn ptolemy() -> @kernel.Thm {
  ptolemy_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
