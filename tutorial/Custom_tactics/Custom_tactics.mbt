// Translated from upstream Tutorial/Custom_tactics.ml; edit this file directly.

///|
/// points
fn step_1() -> Unit raise {
  points_c.set(@list.List([((0L, (-1L)), (0L, (-1L)), (2L, 0L)), ((0L, (-1L)), (0L, 0L), (2L, 0L)), ((0L, (-1L)), (0L, 1L), (2L, 0L)), ((0L, (-1L)), (2L, 0L), (0L, (-1L))), ((0L, (-1L)), (2L, 0L), (0L, 0L)), ((0L, (-1L)), (2L, 0L), (0L, 1L)), ((0L, 0L), (0L, (-1L)), (2L, 0L)), ((0L, 0L), (0L, 0L), (2L, 0L)), ((0L, 0L), (0L, 1L), (2L, 0L)), ((0L, 0L), (2L, 0L), ((-2L), 0L)), ((0L, 0L), (2L, 0L), (0L, (-1L))), ((0L, 0L), (2L, 0L), (0L, 0L)), ((0L, 0L), (2L, 0L), (0L, 1L)), ((0L, 0L), (2L, 0L), (2L, 0L)), ((0L, 1L), (0L, (-1L)), (2L, 0L)), ((0L, 1L), (0L, 0L), (2L, 0L)), ((0L, 1L), (0L, 1L), (2L, 0L)), ((0L, 1L), (2L, 0L), (0L, (-1L))), ((0L, 1L), (2L, 0L), (0L, 0L)), ((0L, 1L), (2L, 0L), (0L, 1L)), ((2L, 0L), ((-2L), 0L), (0L, 0L)), ((2L, 0L), (0L, (-1L)), (0L, (-1L))), ((2L, 0L), (0L, (-1L)), (0L, 0L)), ((2L, 0L), (0L, (-1L)), (0L, 1L)), ((2L, 0L), (0L, 0L), ((-2L), 0L)), ((2L, 0L), (0L, 0L), (0L, (-1L))), ((2L, 0L), (0L, 0L), (0L, 0L)), ((2L, 0L), (0L, 0L), (0L, 1L)), ((2L, 0L), (0L, 0L), (2L, 0L)), ((2L, 0L), (0L, 1L), (0L, (-1L))), ((2L, 0L), (0L, 1L), (0L, 0L)), ((2L, 0L), (0L, 1L), (0L, 1L)), ((2L, 0L), (2L, 0L), (0L, 0L))]))
}

///|
let points_c : @lib.Cell[@list.List[((Int64, Int64), (Int64, Int64), (Int64, Int64))]] = @lib.Cell::new("points")

///|
/// `points`
pub fn points() -> @list.List[((Int64, Int64), (Int64, Int64), (Int64, Int64))] {
  points_c.get()
}

///|
/// ortho
fn step_2() -> Unit raise {
  let mult : ((Int64, Int64)) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise = fn(x1 : (Int64, Int64)) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise {
    let (x1_1, y1) = x1
    fn(x2 : (Int64, Int64)) -> (Int64, Int64) raise {
      let (x2_1, y2) = x2
      let t4 = @lib.mul63(y1, x2_1)
      let t5 = @lib.add63(@lib.mul63(x1_1, y2), t4)
      let t3 = @lib.mul63(@lib.mul63(2L, y1), y2)
      (@lib.add63(@lib.mul63(x1_1, x2_1), t3), t5)
    }
  }
  let add : ((Int64, Int64)) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise = fn(x6 : (Int64, Int64)) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise {
    let (x1_2, y1_1) = x6
    fn(x7 : (Int64, Int64)) -> (Int64, Int64) raise {
      let (x2_2, y2_1) = x7
      let t8 = @lib.add63(y1_1, y2_1)
      (@lib.add63(x1_2, x2_2), t8)
    }
  }
  let dot : (((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> ((((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (Int64, Int64) raise) raise = fn(x9 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> ((((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (Int64, Int64) raise) raise {
    let (x1_3, y1_2, z1) = x9
    fn(x10 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (Int64, Int64) raise {
      let (x2_3, y2_2, z2) = x10
      let t14 = mult(z1)(z2)
      let t15 = mult(y1_2)(y2_2)
      @lib.end_itlist(fn(x11 : (Int64, Int64), x12 : (Int64, Int64)) -> (Int64, Int64) raise {
        let s13 = add(x11)
        s13(x12)
      }, @list.List([mult(x1_3)(x2_3), t15, t14]))
    }
  }
  ortho_c.set(fn(x16 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
    let (v1, v2) = x16
    (dot(v1)(v2) == (0L, 0L))
  })
}

///|
let ortho_c : @lib.Cell[((((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise] = @lib.Cell::new("ortho")

///|
/// `ortho`
pub fn ortho(x : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
  (ortho_c.get())(x)
}

///|
/// opairs
fn step_3() -> Unit raise {
  opairs_c.set(@lib.filter(ortho, @lib.allpairs(fn(x17 : ((Int64, Int64), (Int64, Int64), (Int64, Int64)), x18 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64))) raise {
    let a = x17
    let b = x18
    (a, b)
  }, points(), points())))
}

///|
let opairs_c : @lib.Cell[@list.List[(((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))]] = @lib.Cell::new("opairs")

///|
/// `opairs`
pub fn opairs() -> @list.List[(((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))] {
  opairs_c.get()
}

///|
/// otrips
fn step_4() -> Unit raise {
  otrips_c.set(@lib.filter(fn(x19 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
    let (a, b, c) = x19
    (ortho((a, b)) && ortho((a, c)))
  }, @lib.allpairs(fn(x20 : ((Int64, Int64), (Int64, Int64), (Int64, Int64)), x21 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64))) raise {
    let a_1 = x20
    let (b_1, c_1) = x21
    (a_1, b_1, c_1)
  }, points(), opairs())))
}

///|
let otrips_c : @lib.Cell[@list.List[(((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))]] = @lib.Cell::new("otrips")

///|
/// `otrips`
pub fn otrips() -> @list.List[(((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))] {
  otrips_c.get()
}

///|
/// hol_of_value
fn step_5() -> Unit raise {
  let tm0 = @term_syntax.parse_term("real_of_num(0)")
  let tm1 = @term_syntax.parse_term("real_of_num(2)")
  let tm2 = @term_syntax.parse_term("-real_of_num(2)")
  let tm3 = @term_syntax.parse_term("sqrt(real_of_num(2))")
  let tm4 = @term_syntax.parse_term("-sqrt(real_of_num(2))")
  hol_of_value_c.set(fn(x22 : (Int64, Int64)) -> @kernel.Term raise {
    match x22 {
      (0L, 0L) => tm0
      (2L, 0L) => tm1
      ((-2L), 0L) => tm2
      (0L, 1L) => tm3
      (0L, (-1L)) => tm4
      _ => raise @lib.MatchFailure("tscript.ml:37")
    }
  })
}

///|
let hol_of_value_c : @lib.Cell[((Int64, Int64)) -> @kernel.Term raise] = @lib.Cell::new("hol_of_value")

///|
/// `hol_of_value`
pub fn hol_of_value(x : (Int64, Int64)) -> @kernel.Term raise {
  (hol_of_value_c.get())(x)
}

///|
/// hol_of_point
fn step_6() -> Unit raise {
  let ptm = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])")
  hol_of_point_c.set(fn(x23 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise {
    let (x, y, z) = x23
    @kernel.mk_comb(ptm, @lists.mk_flist(@lib.map(hol_of_value, @list.List([x, y, z]))))
  })
}

///|
let hol_of_point_c : @lib.Cell[(((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise] = @lib.Cell::new("hol_of_point")

///|
/// `hol_of_point`
pub fn hol_of_point(x : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise {
  (hol_of_point_c.get())(x)
}

///|
/// SQRT_2_POW
fn step_7() -> Unit raise {
  let t24 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @analysis.real_pos()]))
  sqrt_2_pow_c.set(@tactics.prove(@term_syntax.parse_term("pow(sqrt(real_of_num(2)), 2) == real_of_num(2)"), t24))
}

///|
let sqrt_2_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_2_POW")

///|
/// `SQRT_2_POW`
pub fn sqrt_2_pow() -> @kernel.Thm {
  sqrt_2_pow_c.get()
}

///|
/// PROVE_NONTRIVIAL
fn step_8() -> Unit raise {
  let ptm = @term_syntax.parse_term("!((x : Cart[Real, 3]) == vec(0))")
  let xtm = @term_syntax.parse_term("(x : Cart[Real, 3])")
  prove_nontrivial_c.set(fn(x25 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Thm raise {
    let x = x25
    let t30 = @tactics.conv_tac(@calc_rat.real_ring)
    let t29 = @tactics.mp_tac(sqrt_2_pow())
    let t31 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s27 = @equal.rand_conv(x26)
      fn(x28 : @kernel.Term) -> @kernel.Thm raise {
        s27(x28)
      }
    }, @list.List([@Vectors.vector_zero()])), t29), t30)
    @tactics.prove(@kernel.vsubst(@list.List([(hol_of_point(x), xtm)]), ptm), t31)
  })
}

///|
let prove_nontrivial_c : @lib.Cell[(((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Thm raise] = @lib.Cell::new("PROVE_NONTRIVIAL")

///|
/// `PROVE_NONTRIVIAL`
pub fn prove_nontrivial(x : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Thm raise {
  (prove_nontrivial_c.get())(x)
}

///|
/// PROVE_ORTHOGONAL
fn step_9() -> Unit raise {
  let ptm = @term_syntax.parse_term("(orthogonal : (Cart[Real, 3], Cart[Real, 3]) -> Bool)")
  prove_orthogonal_c.set(fn(x32 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> @kernel.Thm raise {
    let (x, y) = x32
    let t35 = @tactics.conv_tac(@calc_rat.real_ring)
    let t34 = @tactics.mp_tac(sqrt_2_pow())
    let t36 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@Vectors.orthogonal_vector()])), t34), t35)
    let t33 = hol_of_point(y)
    @tactics.prove(@basics.list_mk_comb(ptm, @list.List([hol_of_point(x), t33])), t36)
  })
}

///|
let prove_orthogonal_c : @lib.Cell[((((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> @kernel.Thm raise] = @lib.Cell::new("PROVE_ORTHOGONAL")

///|
/// `PROVE_ORTHOGONAL`
pub fn prove_orthogonal(x : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> @kernel.Thm raise {
  (prove_orthogonal_c.get())(x)
}

///|
/// ppoint
fn step_10() -> Unit raise {
  let p = @term_syntax.parse_term("(P : (Cart[Real, 3]) -> Bool)")
  ppoint_c.set(fn(x37 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise {
    let v = x37
    @kernel.mk_comb(p, hol_of_point(v))
  })
}

///|
let ppoint_c : @lib.Cell[(((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise] = @lib.Cell::new("ppoint")

///|
/// `ppoint`
pub fn ppoint(x : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise {
  (ppoint_c.get())(x)
}

///|
/// `DEDUCE_POINT_TAC`
pub fn deduce_point_tac(x38 : @list.List[((Int64, Int64), (Int64, Int64), (Int64, Int64))]) -> @tactics.Tactic raise {
  let pts = x38
  let t41 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @tactics.map_every(@rqe_tactics_ext.exists_tac, @lib.map(hol_of_point, pts))
  @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t40), t41)
}

///|
/// `KOCHEN_SPECKER_TAC`
pub fn kochen_specker_tac(x42 : @list.List[((Int64, Int64), (Int64, Int64), (Int64, Int64))], x43 : @list.List[((Int64, Int64), (Int64, Int64), (Int64, Int64))]) -> @tactics.Tactic raise {
  let set_0 = x42
  let set_1 = x43
  if !@list.List::is_empty(@lib.intersect(set_0, set_1)) {
    let p = ppoint(@lib.hd(@lib.intersect(set_0, set_1)))
    let th1 = @kernel.assume_rule(@bool.mk_neg(p))
    let th2 = @kernel.assume_rule(p)
    @tactics.accept_tac(@kernel.eq_mp(@bool.eqf_intro(th1), th2))
  } else {
    let prf_1 = @lib.filter(fn(x45 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
      let (a, b) = x45
      @lib.mem(a, set_0)
    }, opairs())
    let prf_0 = @lib.filter(fn(x46 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
      let (a_1, b_1, c) = x46
      (@lib.mem(a_1, set_1) && @lib.mem(b_1, set_1))
    }, otrips())
    let new_1 = @lib.map(fn(x47 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> ((Int64, Int64), (Int64, Int64), (Int64, Int64)) raise {
      x47.1
    }, prf_1)
    let new_0 = @lib.map(fn(x48 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> ((Int64, Int64), (Int64, Int64), (Int64, Int64)) raise {
      let (a_2, b_2, c_1) = x48
      c_1
    }, prf_0)
    let set_0_p = @lib.union(new_0, set_0)
    let set_1_p = @lib.union(new_1, set_1)
    let del_0 = @lib.subtract(set_0_p, set_0)
    let del_1 = @lib.subtract(set_1_p, set_1)
    if (!@list.List::is_empty(del_0) || !@list.List::is_empty(del_1)) {
      let prv_0 : (((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x49 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let x = x49
        let (a_4, b_4, _) = @lib.find(fn(x51 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
          let (a_3, b_3, c_2) = x51
          (c_2 == x)
        }, prf_0)
        deduce_point_tac(@list.List([a_4, b_4]))
      }
      let prv_1 : (((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x52 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let x_1 = x52
        let (a_6, _) = @lib.find(fn(x54 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> Bool raise {
          let (a_5, c_3) = x54
          (c_3 == x_1)
        }, prf_1)
        deduce_point_tac(@list.List([a_6]))
      }
      let t56 = @lib.map(fn(x55 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> @kernel.Term raise {
        @bool.mk_neg(ppoint(x55))
      }, del_0)
      let newuns = @bool.list_mk_conj(@lib.map(ppoint, del_1).concat(t56))
      let t57 = @lib.map(prv_0, del_0)
      let tacs = @lib.map(prv_1, del_1).concat(t57)
      let t59 = kochen_specker_tac(set_0_p, set_1_p)
      let t58 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), tacs), @tactics.all_tac])
      @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(newuns, @tactics.strip_assume_tac), t58), t59)
    } else {
      let v = @lib.find(fn(x60 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> Bool raise {
        let i = x60
        (!@lib.mem(i, set_0) && !@lib.mem(i, set_1))
      }, points())
      let t61 = kochen_specker_tac(set_0.prepend(v), set_1)
      let t62 = @list.List([kochen_specker_tac(set_0, set_1.prepend(v)), t61])
      @tactics.thenl(@class.asm_cases_tac(ppoint(v)), t62)
    }
  }
}

///|
/// KOCHEN_SPECKER_LEMMA
fn step_11() -> Unit raise {
  let t73 = kochen_specker_tac(@list.List([]), @list.List([]))
  let t72 = @tactics.map_every(fn(x71 : (((Int64, Int64), (Int64, Int64), (Int64, Int64)), ((Int64, Int64), (Int64, Int64), (Int64, Int64)))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s69 = @tactics.assume_tac(x68)
      fn(x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s69(x70)
      }
    })(prove_orthogonal(x71))
  }, opairs())
  let t67 = @tactics.map_every(fn(x66 : ((Int64, Int64), (Int64, Int64), (Int64, Int64))) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s64 = @tactics.assume_tac(x63)
      fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s64(x65)
      }
    })(prove_nontrivial(x66))
  }, points())
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t67), t72), t73)
  kochen_specker_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, 3]) -> Bool, (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && orthogonal(x, y) && !P(x) → P(y)) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && !(z == vec(0)) && orthogonal(x, y) && orthogonal(x, z) && orthogonal(y, z) && P(x) && P(y) → !P(z)) → false"), t74))
}

///|
let kochen_specker_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KOCHEN_SPECKER_LEMMA")

///|
/// `KOCHEN_SPECKER_LEMMA`
pub fn kochen_specker_lemma() -> @kernel.Thm {
  kochen_specker_lemma_c.get()
}

///|
/// NONTRIVIAL_CROSS
fn step_12() -> Unit raise {
  let t75 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_eq_0())])), @Vectors.vec3_tac)
  nontrivial_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], orthogonal(x, y) && !(x == vec(0)) && !(y == vec(0)) → !(cross(x, y) == vec(0))"), t75))
}

///|
let nontrivial_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONTRIVIAL_CROSS")

///|
/// `NONTRIVIAL_CROSS`
pub fn nontrivial_cross() -> @kernel.Thm {
  nontrivial_cross_c.get()
}

///|
/// KOCHEN_SPECKER_PARADOX
fn step_13() -> Unit raise {
  let t86 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(1 == 0)")), nontrivial_cross(), @Vectors.orthogonal_cross()]))
  let t85 = @tactics.disch_then(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x83
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t82 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t81 = @tactics.pop_assum(fn(x78 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s79 = @tactics.mp_tac(x78)
    fn(x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s79(x80)
    }
  })
  let t77 = @simp.asm_rewrite_tac(@list.List([]))
  let t76 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, 3]) => (spin : (Cart[Real, 3]) -> Num)(x) == 1"), kochen_specker_lemma()))
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t76), t77), @tactics.conj_tac), t81), t82), t85), t86)
  kochen_specker_paradox_c.set(@tactics.prove(@term_syntax.parse_term("!(∃ spin : (Cart[Real, 3]) -> Num, ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], !(x == vec(0)) && !(y == vec(0)) && !(z == vec(0)) && orthogonal(x, y) && orthogonal(x, z) && orthogonal(y, z) → spin(x) == 0 && spin(y) == 1 && spin(z) == 1 || spin(x) == 1 && spin(y) == 0 && spin(z) == 1 || spin(x) == 1 && spin(y) == 1 && spin(z) == 0)"), t87))
}

///|
let kochen_specker_paradox_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KOCHEN_SPECKER_PARADOX")

///|
/// `KOCHEN_SPECKER_PARADOX`
pub fn kochen_specker_paradox() -> @kernel.Thm {
  kochen_specker_paradox_c.get()
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
}
