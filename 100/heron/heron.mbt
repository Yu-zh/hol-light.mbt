// Translated from upstream 100/heron.ml; edit this file directly.

///|
/// 100/heron.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// SQRT_ELIM_TAC
fn step_2() -> Unit raise {
  let sqrt_tm = @term_syntax.parse_term("sqrt")
  let is_sqrt : (@kernel.Term) -> Bool raise = fn(x1 : @kernel.Term) -> Bool raise {
    let tm = x1
    (@kernel.is_comb(tm) && (@kernel.rator(tm) == sqrt_tm))
  }
  sqrt_elim_tac_c.set(fn(x2 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x2
    let stms = @lib.setify(@basics.find_terms(is_sqrt, w))
    let gvs = @lib.map(fn(x5 : @kernel.Term) -> @kernel.Term raise {
      (fn(x3 : @kernel.HolType) -> @kernel.Term raise {
        @basics.genvar(x3)
      })((fn(x4 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x4)
      })(x5))
    }, stms)
    let t17 = @tactics.every(@lib.map2(fn(x14 : @kernel.Term, x15 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s = x14
      let v = x15
      @tactics.spec_tac(s, v)
    }, stms, gvs))
    @tactics.then_tac(@tactics.map_every(fn(x13 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x12 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s7 = @tactics.mp_tac(x6)
          fn(x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s7(x8)
          }
        })((fn(x11 : @kernel.Term) -> @kernel.Thm raise {
          (fn(x9 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x10 : @kernel.Thm) -> @kernel.Thm raise {
              @bool.spec(x9, x10)
            }
          })(x11)(@real.sqrt_pow_2())
        })(x12))
      })(@kernel.rand(x13))
    }, stms), t17)((asl, w))
  })
}

///|
let sqrt_elim_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("SQRT_ELIM_TAC")

///|
/// `SQRT_ELIM_TAC`
pub fn sqrt_elim_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (sqrt_elim_tac_c.get())(x)
}

///|
/// HERON
fn step_3() -> Unit raise {
  let t28 = @tactics.conv_tac(@calc_rat.real_ring)
  let t27 = @simp.simp_tac(@list.List([@realarith.real_le_square(), @realarith.real_le_add()]))
  let t26 = @simp.simp_tac(@list.List([@vectors.vector_sub_component(), @calc_num.arith(), @cart.dimindex_2()]))
  let t25 = @simp.rewrite_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @cart.dimindex_2()]))
  let t24 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_norm()]))
  let t23 = @simp.rewrite_tac(@list.List([@real.real_pow_div(), @real.real_pow2_abs()]))
  let t22 = @simp.simp_tac(@list.List([@real.real_le_div(), @real.real_abs_pos(), @realarith.real_pos()]))
  let t21 = @tactics.match_mp_tac(@real.sqrt_unique())
  let t20 = @tactics.conv_tac(@equal.sym_conv)
  let t19 = @simp.rewrite_tac(@list.List([@measure.measure_triangle()]))
  let t18 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t18), t19), t20), t21), t22), t23), t24), t25), t26), sqrt_elim_tac), t27), t28)
  heron_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], LET((a : Real) => (b : Real) => (c : Real) => LET_END(LET((s : Real) => LET_END(measure(hull(convex, {A, B, C})) == sqrt(s * ((s - a) * ((s - b) * (s - c))))), (a + (b + c)) / real_of_num(2))), distance((C, B)), distance((A, C)), distance((B, A)))"), t29))
}

///|
let heron_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERON")

///|
/// `HERON`
pub fn heron() -> @kernel.Thm {
  heron_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
