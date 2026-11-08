// Translated from upstream Quaternions/qnormalizer.hl; edit this file directly.

///|
/// QUAT_MUL_HX_MUL_SYM
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([@quaternion.quat_mul_assoc(), @quaternion.quat_mul_hx_sym()]))
  quat_mul_hx_mul_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], ∀ a : Real, quat_mul(x, quat_mul(Hx(a), y)) == quat_mul(Hx(a), quat_mul(x, y))"), t1))
}

///|
let quat_mul_hx_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_MUL_HX_MUL_SYM")

///|
/// `QUAT_MUL_HX_MUL_SYM`
pub fn quat_mul_hx_mul_sym() -> @kernel.Thm {
  quat_mul_hx_mul_sym_c.get()
}

///|
/// QUAT_POLY_CONV
fn step_2() -> Unit raise {
  let hx_tm = @term_syntax.parse_term("Hx")
  let is_quat_real : (@kernel.Term) -> Bool raise = fn(x2 : @kernel.Term) -> Bool raise {
    let tm = x2
    (@kernel.is_comb(tm) && (@kernel.rator(tm) == hx_tm))
  }
  let t3 = @term_syntax.parse_term("(op_plus : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])")
  let is_quat_add : (@kernel.Term) -> Bool raise = fn(x5 : @kernel.Term) -> Bool raise {
    ((x4 : @kernel.Term) => @basics.is_binop(t3, x4))(x5)
  }
  let t6 = @term_syntax.parse_term("(op_plus : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])")
  let mk_quat_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x9 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x10 : @kernel.Term) -> @kernel.Term raise {
      ((x7 : @kernel.Term, x8 : @kernel.Term) => @basics.mk_binop(t6, x7, x8))(x9, x10)
    }
  }
  let t11 = @term_syntax.parse_term("(op_plus : (Cart[Real, 4], Cart[Real, 4]) -> Cart[Real, 4])")
  let dest_quat_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x12 : @kernel.Term) => @basics.dest_binop(t11, x12)
  let t13 = @term_syntax.parse_term("quat_mul")
  let is_quat_mul : (@kernel.Term) -> Bool raise = fn(x15 : @kernel.Term) -> Bool raise {
    ((x14 : @kernel.Term) => @basics.is_binop(t13, x14))(x15)
  }
  let t16 = @term_syntax.parse_term("quat_mul")
  let dest_quat_mul : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x17 : @kernel.Term) => @basics.dest_binop(t16, x17)
  let t18 = @term_syntax.parse_term("quat_pow")
  let is_quat_pow : (@kernel.Term) -> Bool raise = fn(x20 : @kernel.Term) -> Bool raise {
    ((x19 : @kernel.Term) => @basics.is_binop(t18, x19))(x20)
  }
  let t21 = @term_syntax.parse_term("quat_pow")
  let dest_quat_pow : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (x22 : @kernel.Term) => @basics.dest_binop(t21, x22)
  let t23 = @equal.gsym(@quaternion.quat_pow_suc_alt())
  let t24 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_pow()), t23]))
  let t25 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_pow_add(), @quaternion.quat_pow_1(), @quaternion.quat_pow_2()])), t24)
  let th1 = @tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], ∀ m : Num, ∀ n : Num, quat_mul(quat_pow(x, m), quat_pow(x, n)) == quat_pow(x, m + n)) && (∀ x : Cart[Real, 4], ∀ n : Num, quat_mul(x, quat_pow(x, n)) == quat_pow(x, n + 1)) && (∀ x : Cart[Real, 4], ∀ n : Num, quat_mul(quat_pow(x, n), x) == quat_pow(x, n + 1)) && (∀ x : Cart[Real, 4], quat_mul(x, x) == quat_pow(x, 2))"), t25)
  let t27 = @equal.rand_conv(@normalizer.num_normalize_conv)
  let pow_mul_fuse_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.gen_rewrite_conv(fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x26
  }, @list.List([th1])), t27)
  let assoc : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@quaternion.quat_mul_assoc())
  let pow_fuse : (@kernel.Term) -> @kernel.Thm raise = @equal.try_conv(pow_mul_fuse_conv)
  let pow_monomial_mul_fuse_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x28 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x28
    if @lib.can(fn(x31 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
      (fn(x30 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
        dest_quat_mul((fn(x29 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x29.1
        })(x30))
      })(dest_quat_mul(x31))
    }, tm_1) {
      @equal.try_conv(@equal.thenc(assoc, @equal.land_conv(pow_mul_fuse_conv)))(tm_1)
    } else {
      pow_fuse(tm_1)
    }
  }
  let assoc_dx : (@kernel.Term) -> @kernel.Thm raise = @equal.try_conv(@simp.rewr_conv(@equal.gsym(@quaternion.quat_mul_assoc())))
  fn monomial_mul(x32 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x32
    if @lib.can(fn(x35 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
      (fn(x34 : (@kernel.Term, @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
        dest_quat_mul((fn(x33 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x33.0
        })(x34))
      })(dest_quat_mul(x35))
    }, tm_2) {
      @equal.thenc(assoc_dx, @equal.rand_conv(monomial_mul))(tm_2)
    } else {
      pow_monomial_mul_fuse_conv(tm_2)
    }
  }
  let monomial_mul_conv : (@kernel.Term) -> @kernel.Thm raise = monomial_mul
  let conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@quaternion.quat_mul_lid())
  let t40 = @simp.rewrite_tac(@list.List([@quaternion.hx_mul(), @quaternion.quat_mul_assoc()]))
  let t39 = @simp.once_rewrite_tac(@list.List([quat_mul_hx_mul_sym(), @quaternion.quat_mul_hx_sym()]))
  let t41 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.hx_mul(), @quaternion.quat_mul_assoc()])), t39), t40)
  let t42 = (@term_syntax.parse_term("(∀ a : Real, ∀ b : Real, ∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(quat_mul(Hx(a), x), quat_mul(Hx(b), y)) == quat_mul(Hx(a * b), quat_mul(x, y))) && (∀ a : Real, ∀ b : Real, ∀ x : Cart[Real, 4], quat_mul(quat_mul(Hx(a), x), Hx(b)) == quat_mul(Hx(a * b), x)) && (∀ a : Real, ∀ b : Real, ∀ x : Cart[Real, 4], quat_mul(Hx(a), quat_mul(Hx(b), x)) == quat_mul(Hx(a * b), x)) && (∀ a : Real, ∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(quat_mul(Hx(a), x), y) == quat_mul(Hx(a), quat_mul(x, y))) && (∀ a : Real, ∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_mul(x, quat_mul(Hx(a), y)) == quat_mul(Hx(a), quat_mul(x, y)))"), t41)
  let term_mul_conv : (@kernel.Term) -> @kernel.Thm raise = match (fn(x37 : @kernel.Thm) -> @list.List[(@kernel.Term) -> @kernel.Thm raise] raise {
    ((x36 : @list.List[@kernel.Thm]) => @lib.map(@simp.rewr_conv, x36))(@bool.conjuncts_rule(x37))
  })((fn(x38 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x38.0, x38.1)
  })(t42)) {
    More(conv1, tail=More(conv2, tail=More(conv3, tail=More(conv4, tail=More(conv5, tail=Empty))))) => {
      let t52 = @simp.rewr_conv(@quaternion.quat_mul_hx_sym())
      let t50 = @equal.rand_conv(monomial_mul_conv)
      let t51 = @equal.thenc(@equal.orelsec(conv4, conv5), t50)
      let t48 = @equal.try_conv(conv0)
      let t47 = @equal.land_conv(@equal.rand_conv(@calc_rat.real_poly_conv))
      let t49 = @equal.thenc(@equal.thenc(@equal.orelsec(@equal.orelsec(@equal.thenc(conv1, @equal.rand_conv(monomial_mul_conv)), conv2), conv3), t47), t48)
      let t45 = @equal.rand_conv(@calc_rat.real_poly_conv)
      let t46 = @equal.thenc(@simp.rewr_conv(@equal.gsym(@quaternion.hx_mul())), t45)
      let t44 = @simp.rewr_conv(@quaternion.quat_mul_rid())
      let t43 = @simp.rewr_conv(@quaternion.quat_mul_rzero())
      @equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@quaternion.quat_mul_lzero()), t43), conv0), t44), t46), t49), t51), t52), monomial_mul_conv)
    }
    _ => raise @lib.MatchFailure("tscript.ml:68")
  }
  let t53 = @simp.rewrite_tac(@list.List([@quaternion.hx_add(), @quaternion.quat_add_rdistrib()]))
  let th1_1 = @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ q : Cart[Real, 4], quat_mul(Hx(x), q) + quat_mul(Hx(y), q) == quat_mul(Hx(x + y), q)"), t53)
  let t54 = @simp.rewrite_tac(@list.List([@quaternion.hx_add(), @quaternion.quat_add_rdistrib(), @quaternion.quat_mul_lid()]))
  let th2 = @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ q : Cart[Real, 4], quat_mul(Hx(x), q) + q == quat_mul(Hx(x + real_of_num(1)), q)"), t54)
  let t55 = @simp.rewrite_tac(@list.List([@quaternion.hx_add(), @quaternion.quat_add_rdistrib(), @quaternion.quat_mul_lid()]))
  let th3 = @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ q : Cart[Real, 4], q + quat_mul(Hx(x), q) == quat_mul(Hx(real_of_num(1) + x), q)"), t55)
  let t64 = @simp.rewr_conv(@quaternion.quat_mul_lzero())
  let t65 = @equal.orelsec(@equal.orelsec(@simp.rewr_conv(@quaternion.quat_mul_lid()), t64), @equal.all_conv)
  let t63 = @simp.rewr_conv(@equal.gsym(@quaternion.quat_mul_2()))
  let t61 = @equal.land_conv(@equal.rand_conv(@calc_rat.real_poly_conv))
  let t60 = @simp.rewr_conv(th3)
  let t59 = @simp.rewr_conv(th2)
  let t62 = @equal.thenc(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(th1_1), t59), t60), t61)
  let t57 = @equal.rand_conv(@calc_rat.real_poly_conv)
  let t58 = @equal.thenc(@simp.rewr_conv(@equal.gsym(@quaternion.hx_add())), t57)
  let t56 = @simp.rewr_conv(@quaternion.quat_add_rid())
  let terms_fuse_add_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.orelsec(@equal.orelsec(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(@quaternion.quat_add_lid()), t56), t58), t62), t63), t65)
  let dest_literal_quat_pow : (@kernel.Term) -> (@kernel.Term, @num.Num) raise = fn(x66 : @kernel.Term) -> (@kernel.Term, @num.Num) raise {
    let tm_3 = x66
    try {
      let (b, e) = dest_quat_pow(tm_3)
      (b, @basics.dest_numeral(e))
    } catch {
      Failure(_) => (tm_3, @num.num_1)
      e => raise e
    }
  }
  let pow_compare : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise = fn(x67 : @kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise {
    let tm1 = x67
    fn(x68 : @kernel.Term) -> Int64 raise {
      let tm2 = x68
      let (b1, e1) = dest_literal_quat_pow(tm1)
      let (b2, e2) = dest_literal_quat_pow(tm2)
      let c = Int::to_int64(@lib.compare(b1, b2))
      if (c != 0L) {
        c
      } else {
        Int::to_int64(@lib.compare(e1, e2))
      }
    }
  }
  fn mon_compare(x69 : @kernel.Term, x70 : @kernel.Term) -> Int64 raise {
    let tm1_1 = x69
    let tm2_1 = x70
    let t71 = is_quat_mul(tm1_1)
    match (t71, is_quat_mul(tm2_1)) {
      (true, true) => {
        let t72 = @equal.lhand(tm2_1)
        let c_1 = pow_compare(@equal.lhand(tm1_1))(t72)
        if (c_1 != 0L) {
          c_1
        } else {
          let t73 = @kernel.rand(tm2_1)
          mon_compare(@kernel.rand(tm1_1), t73)
        }
      }
      (true, false) => 1L
      (false, true) => (-1L)
      (false, false) => pow_compare(tm1_1)(tm2_1)
    }
  }
  let mon_of_term : (@kernel.Term) -> @kernel.Term raise = fn(x74 : @kernel.Term) -> @kernel.Term raise {
    let tm_4 = x74
    try {
      let (c_2, m) = dest_quat_mul(tm_4)
      if is_quat_real(c_2) {
        m
      } else {
        tm_4
      }
    } catch {
      Failure(_) => tm_4
      e => raise e
    }
  }
  let term_compare : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise = fn(x75 : @kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise {
    let tm1_2 = x75
    fn(x76 : @kernel.Term) -> Int64 raise {
      let tm2_2 = x76
      let t77 = is_quat_real(tm1_2)
      match (t77, is_quat_real(tm2_2)) {
        (true, false) => (-1L)
        (false, true) => 1L
        (true, true) => 0L
        (false, false) => {
          let t78 = mon_of_term(tm2_2)
          mon_compare(mon_of_term(tm1_2), t78)
        }
      }
    }
  }
  let t79 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_ac()]))
  let insert_term_th = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ r : Cart[Real, 4], p + (q + r) == q + (p + r)"), t79)
  let insert_term = (x80 : @kernel.Term, x81 : @kernel.Term) => insert_term_l(mk_quat_add, dest_quat_add, term_compare, terms_fuse_add_conv, insert_term_th, x80, x81)
  let insert_term_conv = (x87 : @kernel.Term) => insert_term_conv_l(mk_quat_add, dest_quat_add, term_compare, terms_fuse_add_conv, insert_term_th, x87)
  let t88 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_ac()]))
  let th_add1 = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ r : Cart[Real, 4], p + q + (r + (s : Cart[Real, 4])) == p + r + (q + s)"), t88)
  let t89 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_ac()]))
  let th_add2 = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ r : Cart[Real, 4], p + q + (r + (s : Cart[Real, 4])) == p + (q + (r + s))"), t89)
  let t90 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_ac()]))
  let th_add3 = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ r : Cart[Real, 4], p + q + (r + (s : Cart[Real, 4])) == r + (p + q + s)"), t90)
  fn pre_add_conv(x91 : @kernel.Term) -> @kernel.Thm raise {
    let tm_8 = x91
    let (tm1_4, tm2_3) = dest_quat_add(tm_8)
    if is_quat_add(tm1_4) {
      let (htm1, ttm1) = dest_quat_add(tm1_4)
      if is_quat_add(tm2_3) {
        let (htm2, ttm2) = dest_quat_add(tm2_3)
        match term_compare(htm1)(htm2) {
          0L => {
            let t94 = @equal.try_conv(@simp.rewr_conv(@quaternion.quat_add_rid()))
            let t93 = @equal.rand_conv(pre_add_conv)
            let t95 = @equal.thenc(@equal.orelsec(@equal.thenc(@simp.rewr_conv(@quaternion.quat_add_lid()), pre_add_conv), t93), t94)
            let t92 = @equal.land_conv(terms_fuse_add_conv)
            @equal.thenc(@equal.thenc(@simp.rewr_conv(th_add1), t92), t95)(tm_8)
          }
          c_5 if (c_5 < 0L) => {
            let t96 = @equal.rand_conv(pre_add_conv)
            @equal.thenc(@simp.rewr_conv(th_add2), t96)(tm_8)
          }
          c_6 if (c_6 > 0L) => {
            let t97 = @equal.rand_conv(pre_add_conv)
            @equal.thenc(@simp.rewr_conv(th_add3), t97)(tm_8)
          }
          _ => raise @lib.MatchFailure("tscript.ml:207")
        }
      } else {
        @equal.thenc(@simp.rewr_conv(@quaternion.quat_add_sym()), insert_term_conv)(tm_8)
      }
    } else {
      insert_term_conv(tm_8)
    }
  }
  let dist_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@quaternion.quat_add_ldistrib())
  fn ldistrib_conv(x98 : @kernel.Term) -> @kernel.Thm raise {
    let tm_9 = x98
    let t99 = @equal.rand_conv(ldistrib_conv)
    @equal.orelsec(@equal.thenc(@equal.thenc(dist_conv, @equal.land_conv(term_mul_conv)), t99), term_mul_conv)(tm_9)
  }
  let ldistrib_conv_1 : (@kernel.Term) -> @kernel.Thm raise = ldistrib_conv
  let dist_conv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@quaternion.quat_add_rdistrib())
  fn rdistrib_conv(x100 : @kernel.Term) -> @kernel.Thm raise {
    let tm_10 = x100
    let t101 = @equal.rand_conv(rdistrib_conv)
    @equal.orelsec(@equal.thenc(@equal.thenc(dist_conv_1, @equal.land_conv(term_mul_conv)), t101), term_mul_conv)(tm_10)
  }
  let rdistrib_conv_1 : (@kernel.Term) -> @kernel.Thm raise = rdistrib_conv
  let t102 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_ldistrib(), @quaternion.quat_add_rdistrib(), @quaternion.quat_add_ac()]))
  let th_mul = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ r : Cart[Real, 4], ∀ s : Cart[Real, 4], quat_mul(p + q, r + s) == quat_mul(p, r) + (quat_mul(p, s) + quat_mul(q, r) + quat_mul(q, s))"), t102)
  let binop_conv2 : ((@kernel.Term) -> @kernel.Thm raise) -> (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(x103 : (@kernel.Term) -> @kernel.Thm raise) -> (((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let conv1_1 = x103
    fn(x104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let conv2_1 = x104
      let t106 = @equal.rand_conv(conv2_1)
      @equal.thenc(@equal.land_conv(conv1_1), t106)
    }
  }
  fn pre_mul_conv(x107 : @kernel.Term) -> @kernel.Thm raise {
    let tm_11 = x107
    let (l, r) = dest_quat_mul(tm_11)
    if !is_quat_add(l) {
      ldistrib_conv_1(tm_11)
    } else {
      if !is_quat_add(r) {
        rdistrib_conv_1(tm_11)
      } else {
        let t108 = @equal.thenc(binop_conv2(@equal.thenc(binop_conv2(ldistrib_conv_1)(rdistrib_conv_1), pre_add_conv))(pre_mul_conv), pre_add_conv)
        let t109 = binop_conv2(term_mul_conv)(t108)
        @equal.thenc(@simp.rewr_conv(th_mul), t109)(tm_11)
      }
    }
  }
  let t110 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let quat_pow_denumeral = @tactics.prove(@term_syntax.parse_term("quat_pow((x : Cart[Real, 4]), NUMERAL((n : Num))) == quat_pow(x, n)"), t110)
  let t112 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_pow_2()), @quaternion.quat_pow_pow(), @arith.mult_sym()]))
  let t111 = @simp.rewrite_tac(@list.List([@arith.bit0(), @quaternion.quat_pow_add()]))
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t111), t112)
  let quat_pow_bit0 = @tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(x, BIT0(n)) == quat_pow(quat_mul(x, x), n)"), t113)
  let t115 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_pow_2()), @quaternion.quat_pow_pow(), @arith.mult_sym()]))
  let t114 = @simp.rewrite_tac(@list.List([@arith.bit1(), @quaternion.quat_pow(), @quaternion.quat_pow_add()]))
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t114), t115)
  let quat_pow_bit1 = @tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, quat_pow(x, BIT1(n)) == quat_mul(x, quat_pow(quat_mul(x, x), n))"), t116)
  let t117 = @simp.rewrite_tac(@list.List([@calc_num.denumeral(@quaternion.quat_pow()), @nums.numeral()]))
  let quat_pow_0 = @tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], quat_pow(x, _0) == Hx(real_of_num(1))"), t117)
  fn pre_pow_conv(x118 : @kernel.Term) -> @kernel.Thm raise {
    let tm_12 = x118
    let t121 = @equal.rand_conv(@equal.thenc(@equal.land_conv(pre_mul_conv), pre_pow_conv))
    let t122 = @equal.thenc(@equal.thenc(@simp.rewr_conv(quat_pow_bit1), t121), pre_mul_conv)
    let t119 = @equal.land_conv(pre_mul_conv)
    let t120 = @equal.thenc(@equal.thenc(@simp.rewr_conv(quat_pow_bit0), t119), pre_pow_conv)
    @equal.orelsec(@equal.orelsec(@equal.orelsec(@simp.rewr_conv(quat_pow_0), t120), t122), @equal.all_conv)(tm_12)
  }
  let pre_pow_conv_1 : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@simp.rewr_conv(quat_pow_denumeral), pre_pow_conv)
  let poly_conv = (x123 : @kernel.Term) => poly_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x123)
  let add_conv = (x124 : @kernel.Term) => add_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x124)
  let mul_conv = (x125 : @kernel.Term) => mul_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x125)
  let pow_conv = (x126 : @kernel.Term) => pow_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x126)
  let t129 = @simp.rewrite_tac(@list.List([@quaternion.quat_poly_clauses(), @quaternion.quat_cnj_add(), @quaternion.quat_cnj_mul(), @quaternion.quat_cnj_inv(), @quaternion.quat_cnj_pow(), @quaternion.cnj_hx(), @quaternion.quat_cnj_units()]))
  let quat_desugar_clauses = @tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 4], Hx(real_of_num(0)) + x == x) && (∀ x : Cart[Real, 4], -x == quat_mul(Hx(-real_of_num(1)), x)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], x - y == x + quat_mul(Hx(-real_of_num(1)), y)) && (∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(1)), x) == x) && (∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(1))) == x) && (∀ x : Cart[Real, 4], quat_mul(Hx(real_of_num(0)), x) == Hx(real_of_num(0))) && (∀ x : Cart[Real, 4], quat_mul(x, Hx(real_of_num(0))) == Hx(real_of_num(0))) && (∀ x : Cart[Real, 4], quat_pow(x, 0) == Hx(real_of_num(1))) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_cnj(x + y) == quat_cnj(x) + quat_cnj(y)) && (∀ x : Cart[Real, 4], ∀ y : Cart[Real, 4], quat_cnj(quat_mul(x, y)) == quat_mul(quat_cnj(y), quat_cnj(x))) && (∀ x : Cart[Real, 4], quat_cnj(quat_inv(x)) == quat_inv(quat_cnj(x))) && (∀ x : Cart[Real, 4], ∀ n : Num, quat_cnj(quat_pow(x, n)) == quat_pow(quat_cnj(x), n)) && (∀ a : Real, quat_cnj(Hx(a)) == Hx(a)) && quat_cnj(quat_ii) == quat_mul(Hx(-real_of_num(1)), quat_ii) && quat_cnj(jj) == quat_mul(Hx(-real_of_num(1)), jj) && quat_cnj(kk) == quat_mul(Hx(-real_of_num(1)), kk)"), t129)
  let quat_desugar_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(@list.List([quat_desugar_clauses]))
  quat_poly_conv_c.set(@equal.thenc(quat_desugar_conv, poly_conv))
}

///|
let quat_poly_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_POLY_CONV")

///|
/// `QUAT_POLY_CONV`
pub fn quat_poly_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_poly_conv_c.get())(x)
}

///|
fn insert_term_l(mk_quat_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise, dest_quat_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise, term_compare : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise, terms_fuse_add_conv : (@kernel.Term) -> @kernel.Thm raise, insert_term_th : @kernel.Thm, x80 : @kernel.Term, x81 : @kernel.Term) -> @kernel.Thm raise {
  let insert_term_conv = (x87 : @kernel.Term) => insert_term_conv_l(mk_quat_add, dest_quat_add, term_compare, terms_fuse_add_conv, insert_term_th, x87)
  let tm_5 = x80
  let tms = x81
  let ptm = mk_quat_add(tm_5)(tms)
  try {
    let t82 = @simp.rewr_conv(@quaternion.quat_add_rid())
    @equal.orelsec(@simp.rewr_conv(@quaternion.quat_add_lid()), t82)(ptm)
  } catch {
    Failure(_) => {
      try {
        let (tm1_3, tms_1) = dest_quat_add(tms)
        match term_compare(tm_5)(tm1_3) {
          0L => {
            let t84 = @equal.try_conv(@simp.rewr_conv(@quaternion.quat_add_lid()))
            let t83 = @equal.land_conv(@simp.rewr_conv(terms_fuse_add_conv(mk_quat_add(tm_5)(tm1_3))))
            @equal.thenc(@equal.thenc(@simp.rewr_conv(@quaternion.quat_add_assoc()), t83), t84)(ptm)
          }
          c_3 if (c_3 > 0L) => {
            let t86 = @equal.try_conv(@simp.rewr_conv(@quaternion.quat_add_rid()))
            let t85 = @equal.rand_conv(insert_term_conv)
            @equal.thenc(@equal.thenc(@simp.rewr_conv(insert_term_th), t85), t86)(ptm)
          }
          _ => @equal.all_conv(ptm)
        }
      } catch {
        Failure(_) => {
          match term_compare(tm_5)(tms) {
            0L => terms_fuse_add_conv(ptm)
            c_4 if (c_4 > 0L) => @simp.rewr_conv(@quaternion.quat_add_sym())(ptm)
            _ => @equal.all_conv(ptm)
          }
        }
        e => raise e
      }
    }
    e => raise e
  }
}

///|
fn insert_term_conv_l(mk_quat_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise, dest_quat_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise, term_compare : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise, terms_fuse_add_conv : (@kernel.Term) -> @kernel.Thm raise, insert_term_th : @kernel.Thm, x87 : @kernel.Term) -> @kernel.Thm raise {
  let insert_term = (x80 : @kernel.Term, x81 : @kernel.Term) => insert_term_l(mk_quat_add, dest_quat_add, term_compare, terms_fuse_add_conv, insert_term_th, x80, x81)
  let tm_6 = x87
  try {
    let (tm_7, tms_2) = dest_quat_add(tm_6)
    insert_term(tm_7, tms_2)
  } catch {
    Failure(_) => @equal.all_conv(tm_6)
    e => raise e
  }
}

///|
fn poly_conv_l(is_quat_add : (@kernel.Term) -> Bool raise, is_quat_mul : (@kernel.Term) -> Bool raise, is_quat_pow : (@kernel.Term) -> Bool raise, pre_add_conv : (@kernel.Term) -> @kernel.Thm raise, pre_mul_conv : (@kernel.Term) -> @kernel.Thm raise, pre_pow_conv_1 : (@kernel.Term) -> @kernel.Thm raise, x123 : @kernel.Term) -> @kernel.Thm raise {
  let add_conv = (x124 : @kernel.Term) => add_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x124)
  let mul_conv = (x125 : @kernel.Term) => mul_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x125)
  let pow_conv = (x126 : @kernel.Term) => pow_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x126)
  let tm_13 = x123
  if is_quat_add(tm_13) {
    add_conv(tm_13)
  } else {
    if is_quat_mul(tm_13) {
      mul_conv(tm_13)
    } else {
      if is_quat_pow(tm_13) {
        pow_conv(tm_13)
      } else {
        @equal.all_conv(tm_13)
      }
    }
  }
}

///|
fn add_conv_l(is_quat_add : (@kernel.Term) -> Bool raise, is_quat_mul : (@kernel.Term) -> Bool raise, is_quat_pow : (@kernel.Term) -> Bool raise, pre_add_conv : (@kernel.Term) -> @kernel.Thm raise, pre_mul_conv : (@kernel.Term) -> @kernel.Thm raise, pre_pow_conv_1 : (@kernel.Term) -> @kernel.Thm raise, x124 : @kernel.Term) -> @kernel.Thm raise {
  let poly_conv = (x123 : @kernel.Term) => poly_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x123)
  let tm_14 = x124
  @equal.thenc(@equal.binop_conv(poly_conv), pre_add_conv)(tm_14)
}

///|
fn mul_conv_l(is_quat_add : (@kernel.Term) -> Bool raise, is_quat_mul : (@kernel.Term) -> Bool raise, is_quat_pow : (@kernel.Term) -> Bool raise, pre_add_conv : (@kernel.Term) -> @kernel.Thm raise, pre_mul_conv : (@kernel.Term) -> @kernel.Thm raise, pre_pow_conv_1 : (@kernel.Term) -> @kernel.Thm raise, x125 : @kernel.Term) -> @kernel.Thm raise {
  let poly_conv = (x123 : @kernel.Term) => poly_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x123)
  let tm_15 = x125
  @equal.thenc(@equal.binop_conv(poly_conv), pre_mul_conv)(tm_15)
}

///|
fn pow_conv_l(is_quat_add : (@kernel.Term) -> Bool raise, is_quat_mul : (@kernel.Term) -> Bool raise, is_quat_pow : (@kernel.Term) -> Bool raise, pre_add_conv : (@kernel.Term) -> @kernel.Thm raise, pre_mul_conv : (@kernel.Term) -> @kernel.Thm raise, pre_pow_conv_1 : (@kernel.Term) -> @kernel.Thm raise, x126 : @kernel.Term) -> @kernel.Thm raise {
  let poly_conv = (x123 : @kernel.Term) => poly_conv_l(is_quat_add, is_quat_mul, is_quat_pow, pre_add_conv, pre_mul_conv, pre_pow_conv_1, x123)
  let tm_16 = x126
  let t128 = @equal.try_conv(pre_pow_conv_1)
  let t127 = @equal.rand_conv(@normalizer.num_normalize_conv)
  @equal.thenc(@equal.thenc(@equal.land_conv(poly_conv), t127), t128)(tm_16)
}

///|
/// QUAT_EQ_CONV
fn step_3() -> Unit raise {
  let t130 = @simp.rewr_conv(@theorems.refl_clause())
  quat_eq_conv_c.set(@equal.thenc(@equal.binop_conv(quat_poly_conv), t130))
}

///|
let quat_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("QUAT_EQ_CONV")

///|
/// `QUAT_EQ_CONV`
pub fn quat_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (quat_eq_conv_c.get())(x)
}

///|
/// `QUAT_POLY`
pub fn quat_poly(x131 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x131
  let t132 = @tactics.conv_tac(quat_eq_conv)
  @tactics.prove(tm, @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t132))
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
