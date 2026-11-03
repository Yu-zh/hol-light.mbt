// Translated from upstream grobner.ml; edit this file directly.

///|
/// `history`
#derive(Eq, Debug)
pub(all) enum History {
  Start(Int64)
  Mmul((@num.Num, @list.List[Int64]), History)
  Add(History, History)
}

///|
pub extend History with Eq::{not_equal, equal}

///|
pub extend History with Debug::{to_repr}

///|
pub extend History with @lib.OCompare::{ocompare}

///|
pub extend History with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_History(x : History) -> Int {
  match x {
    Start(_) => 1000000
    Mmul(_, _) => 1000001
    Add(_, _) => 1000002
  }
}

///|
pub impl @lib.OCompare for History with fn ocompare(self, other) {
  match (self, other) {
    (Start(a0), Start(b0)) => @lib.compare(a0, b0)
    (Mmul(a0, a1), Mmul(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Add(a0, a1), Add(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_History(self).compare(ocaml_rank_History(other))
  }
}

///|
pub impl @lib.OHash for History with fn ohash_visit(self, h) {
  match self {
    Start(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Mmul(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    Add(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// RING_AND_IDEAL_CONV
fn step_1() -> Unit raise {
  let morder_lt : (@list.List[Int64]) -> ((@list.List[Int64]) -> Bool raise) raise = fn(
    x3 : @list.List[Int64],
  ) -> ((@list.List[Int64]) -> Bool raise) raise {
    let m1 = x3
    fn(x4 : @list.List[Int64]) -> Bool raise {
      let m2 = x4
      let n1 = @lib.itlist(
        fn(x7 : Int64, x8 : Int64) -> Int64 raise {
          let s9 = (fn(x5 : Int64) -> ((Int64) -> Int64 raise) raise {
            fn(x6 : Int64) -> Int64 raise { @lib.add63(x5, x6) }
          })(x7)
          s9(x8)
        },
        m1,
        0L,
      )
      let n2 = @lib.itlist(
        fn(x12 : Int64, x13 : Int64) -> Int64 raise {
          let s14 = (fn(x10 : Int64) -> ((Int64) -> Int64 raise) raise {
            fn(x11 : Int64) -> Int64 raise { @lib.add63(x10, x11) }
          })(x12)
          s14(x13)
        },
        m2,
        0L,
      )
      n1 < n2 || (n1 == n2 && lexorder_l(m1, m2))
    }
  }
  let grob_neg : (@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
    (@num.Num, @list.List[Int64]),
  ] raise = (x16 : @list.List[(@num.Num, @list.List[Int64])]) => {
    @lib.map(
      fn(
        x15 : (@num.Num, @list.List[Int64]),
      ) -> (@num.Num, @list.List[Int64]) raise {
        let (c, m) = x15
        (@num.minus_num(c), m)
      },
      x16,
    )
  }
  fn grob_add(
    x17 : @list.List[(@num.Num, @list.List[Int64])],
    x18 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
    let l1_1 = x17
    let l2_1 = x18
    match (l1_1, l2_1) {
      (Empty, l2_2) => l2_2
      (l1_2, Empty) => l1_2
      (More((c1, m1_1), tail=o1_1), More((c2, m2_1), tail=o2_1)) =>
        if m1_1 == m2_1 {
          let c_1 = @num.add_num(c1, c2)
          let rest = grob_add(o1_1, o2_1)
          if @num.eq_num(c_1, @num.num_0) {
            rest
          } else {
            rest.prepend((c_1, m1_1))
          }
        } else if morder_lt(m2_1)(m1_1) {
          grob_add(o1_1, l2_1).prepend((c1, m1_1))
        } else {
          grob_add(l1_1, o2_1).prepend((c2, m2_1))
        }
    }
  }
  let grob_sub : (@list.List[(@num.Num, @list.List[Int64])]) -> ((
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise = fn(
    x19 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
    (@num.Num, @list.List[Int64]),
  ] raise) raise {
    let l1_3 = x19
    fn(
      x20 : @list.List[(@num.Num, @list.List[Int64])],
    ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let l2_3 = x20
      grob_add(l1_3, grob_neg(l2_3))
    }
  }
  let grob_mmul : ((@num.Num, @list.List[Int64])) -> ((
    (@num.Num, @list.List[Int64]),
  ) -> (@num.Num, @list.List[Int64]) raise) raise = fn(
    x21 : (@num.Num, @list.List[Int64]),
  ) -> (((@num.Num, @list.List[Int64])) -> (@num.Num, @list.List[Int64]) raise) raise {
    let (c1_1, m1_2) = x21
    fn(
      x22 : (@num.Num, @list.List[Int64]),
    ) -> (@num.Num, @list.List[Int64]) raise {
      let (c2_1, m2_2) = x22
      let t28 = @lib.map2(
        fn(x25 : Int64, x26 : Int64) -> Int64 raise {
          let s27 = (fn(x23 : Int64) -> ((Int64) -> Int64 raise) raise {
            fn(x24 : Int64) -> Int64 raise { @lib.add63(x23, x24) }
          })(x25)
          s27(x26)
        },
        m1_2,
        m2_2,
      )
      (@num.mult_num(c1_1, c2_1), t28)
    }
  }
  fn grob_cmul(
    x29 : (@num.Num, @list.List[Int64]),
    x30 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
    let cm = x29
    let pol = x30
    @lib.map(grob_mmul(cm), pol)
  }
  fn grob_mul(
    x31 : @list.List[(@num.Num, @list.List[Int64])],
    x32 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
    let l1_4 = x31
    let l2_4 = x32
    match l1_4 {
      Empty => @list.List([])
      More(h1, tail=t1) => {
        let t33 = grob_mul(t1, l2_4)
        grob_add(grob_cmul(h1, l2_4), t33)
      }
    }
  }
  let grob_inv : (@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
    (@num.Num, @list.List[Int64]),
  ] raise = fn(
    x34 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
    let l = x34
    match l {
      More((c_2, vs), tail=Empty) if @lib.forall(
          fn(x35 : Int64) -> Bool raise {
            let x = x35
            x == 0L
          },
          vs,
        ) =>
        if @num.eq_num(c_2, @num.num_0) {
          raise Failure("grob_inv: division by zero")
        } else {
          @list.List([(@num.div_num(@num.num_1, c_2), vs)])
        }
      _ => raise Failure("grob_inv: non-constant divisor polynomial")
    }
  }
  let grob_div : (@list.List[(@num.Num, @list.List[Int64])]) -> ((
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise = fn(
    x36 : @list.List[(@num.Num, @list.List[Int64])],
  ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
    (@num.Num, @list.List[Int64]),
  ] raise) raise {
    let l1_5 = x36
    fn(
      x37 : @list.List[(@num.Num, @list.List[Int64])],
    ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let l2_5 = x37
      match l2_5 {
        More((c_3, l_1), tail=Empty) if @lib.forall(
            fn(x38 : Int64) -> Bool raise {
              let x_1 = x38
              x_1 == 0L
            },
            l_1,
          ) =>
          if @num.eq_num(c_3, @num.num_0) {
            raise Failure("grob_div: division by zero")
          } else {
            grob_cmul((@num.div_num(@num.num_1, c_3), l_1), l1_5)
          }
        _ => raise Failure("grob_div: non-constant divisor polynomial")
      }
    }
  }
  let mdiv : ((@num.Num, @list.List[Int64])) -> (((@num.Num, @list.List[Int64])) -> (
    @num.Num,
    @list.List[Int64],
  ) raise) raise = fn(
    x43 : (@num.Num, @list.List[Int64]),
  ) -> (((@num.Num, @list.List[Int64])) -> (@num.Num, @list.List[Int64]) raise) raise {
    let (c1_2, m1_3) = x43
    fn(
      x44 : (@num.Num, @list.List[Int64]),
    ) -> (@num.Num, @list.List[Int64]) raise {
      let (c2_2, m2_3) = x44
      let t47 = @lib.map2(
        fn(x45 : Int64, x46 : Int64) -> Int64 raise {
          let n1_1 = x45
          let n2_1 = x46
          if n1_1 < n2_1 {
            raise Failure("mdiv")
          } else {
            @lib.sub63(n1_1, n2_1)
          }
        },
        m1_3,
        m2_3,
      )
      (@num.div_num(c1_2, c2_2), t47)
    }
  }
  let reduce1 : ((@num.Num, @list.List[Int64])) -> ((
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise) raise = fn(
    x55 : (@num.Num, @list.List[Int64]),
  ) -> (((@list.List[(@num.Num, @list.List[Int64])], History)) -> (
    @list.List[(@num.Num, @list.List[Int64])],
    History,
  ) raise) raise {
    let cm_1 = x55
    fn(
      x56 : (@list.List[(@num.Num, @list.List[Int64])], History),
    ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
      let (pol_1, hpol) = x56
      match pol_1 {
        Empty => raise Failure("reduce1")
        More(cm1, tail=cms) =>
          try {
            let (c_4, m_1) = mdiv(cm_1)(cm1)
            let t57 = History::Mmul((@num.minus_num(c_4), m_1), hpol)
            (grob_cmul((@num.minus_num(c_4), m_1), cms), t57)
          } catch {
            Failure(_) => raise Failure("reduce1")
            e => raise e
          }
      }
    }
  }
  let reduceb : ((@num.Num, @list.List[Int64])) -> ((
    @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
  ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise) raise = fn(
    x58 : (@num.Num, @list.List[Int64]),
  ) -> ((@list.List[(@list.List[(@num.Num, @list.List[Int64])], History)]) -> (
    @list.List[(@num.Num, @list.List[Int64])],
    History,
  ) raise) raise {
    let cm_2 = x58
    fn(
      x59 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
    ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
      let basis = x59
      @lib.tryfind(
        fn(
          x60 : (@list.List[(@num.Num, @list.List[Int64])], History),
        ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
          let p = x60
          reduce1(cm_2)(p)
        },
        basis,
      )
    }
  }
  fn reduce(
    x61 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
    x62 : (@list.List[(@num.Num, @list.List[Int64])], History),
  ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
    let basis_1 = x61
    let (pol_2, hist) = x62
    match pol_2 {
      Empty => (pol_2, hist)
      More(cm_3, tail=ptl) =>
        try {
          let (q, hnew) = reduceb(cm_3)(basis_1)
          let t63 = History::Add(hnew, hist)
          reduce(basis_1, (grob_add(q, ptl), t63))
        } catch {
          Failure(_) => {
            let (q_1, hist_p) = reduce(basis_1, (ptl, hist))
            (q_1.prepend(cm_3), hist_p)
          }
          e => raise e
        }
    }
  }
  let spoly : ((@num.Num, @list.List[Int64])) -> ((
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ) -> (((@list.List[(@num.Num, @list.List[Int64])], History)) -> (
    @list.List[(@num.Num, @list.List[Int64])],
    History,
  ) raise) raise) raise = fn(
    x68 : (@num.Num, @list.List[Int64]),
  ) -> (((@list.List[(@num.Num, @list.List[Int64])], History)) -> ((
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise) raise) raise {
    let cm_4 = x68
    fn(
      x69 : (@list.List[(@num.Num, @list.List[Int64])], History),
    ) -> (((@list.List[(@num.Num, @list.List[Int64])], History)) -> (
      @list.List[(@num.Num, @list.List[Int64])],
      History,
    ) raise) raise {
      let ph1 = x69
      fn(
        x70 : (@list.List[(@num.Num, @list.List[Int64])], History),
      ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
        let ph2 = x70
        match (ph1, ph2) {
          ((Empty, h), p_1) => (@list.List([]), h)
          (p_2, (Empty, h_1)) => (@list.List([]), h_1)
          ((More(cm1_1, tail=ptl1), his1), (More(cm2, tail=ptl2), his2)) => {
            let t72 = History::Mmul(
              mdiv((@num.minus_num(cm_4.0), cm_4.1))(cm2),
              his2,
            )
            let t73 = History::Add(History::Mmul(mdiv(cm_4)(cm1_1), his1), t72)
            let t71 = grob_cmul(mdiv(cm_4)(cm2), ptl2)
            (grob_sub(grob_cmul(mdiv(cm_4)(cm1_1), ptl1))(t71), t73)
          }
        }
      }
    }
  }
  fn grobner_basis(
    x104 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
    x105 : @list.List[
      (
        (@num.Num, @list.List[Int64]),
        (
          (@list.List[(@num.Num, @list.List[Int64])], History),
          (@list.List[(@num.Num, @list.List[Int64])], History),
        ),
      ),
    ],
  ) -> @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)] raise {
    let basis_3 = x104
    let pairs = x105
    let t106 = " basis elements and " +
      (Int64::to_string(Int::to_int64(@lib.length(pairs))) + " critical pairs")
    @pp.std_formatter.print_string(
      Int64::to_string(Int::to_int64(@lib.length(basis_3))) + t106,
    )
    @pp.std_formatter.print_newline()
    match pairs {
      Empty => basis_3
      More((l_4, (p1_4, p2_4)), tail=opairs_1) => {
        let t107 = reduce(basis_3, spoly(l_4)(p1_4)(p2_4))
        let (sp, hist_2) as sph = monic_l(t107.0, t107.1)
        if sp == @list.List([]) ||
          ((x93, x94, x95) => criterion2_l(mdiv, x93, x94, x95))(
            basis_3,
            (l_4, (p1_4, p2_4)),
            opairs_1,
          ) {
          grobner_basis(basis_3, opairs_1)
        } else if constant_poly_l(sp) {
          grobner_basis(basis_3.prepend(sph), @list.List([]))
        } else {
          let rawcps = @lib.map(
            fn(
              x108 : (@list.List[(@num.Num, @list.List[Int64])], History),
            ) -> (
              (@num.Num, @list.List[Int64]),
              (
                (@list.List[(@num.Num, @list.List[Int64])], History),
                (@list.List[(@num.Num, @list.List[Int64])], History),
              ),
            ) raise {
              let p_7 = x108
              let t110 = align_l(p_7, sph)
              let t109 = @lib.hd(sp)
              (mlcm_l(@lib.hd(p_7.0), t109), t110)
            },
            basis_3,
          )
          let newcps = @lib.filter(
            fn(
              x111 : (
                (@num.Num, @list.List[Int64]),
                (
                  (@list.List[(@num.Num, @list.List[Int64])], History),
                  (@list.List[(@num.Num, @list.List[Int64])], History),
                ),
              ),
            ) -> Bool raise {
              let (l_5, (p_8, q_5)) = x111
              !((x64, x65, x66) => orthogonal_l(grob_mmul, x64, x65, x66))(
                l_5,
                p_8.0,
                q_5.0,
              )
            },
            rawcps,
          )
          grobner_basis(
            basis_3.prepend(sph),
            @lib.merge(
              (x80, x81) => forder_l(morder_lt, x80, x81),
              opairs_1,
              @lib.mergesort(
                (x80, x81) => forder_l(morder_lt, x80, x81),
                newcps,
              ),
            ),
          )
        }
      }
    }
  }
  fn grobner_interreduce(
    x112 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
    x113 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
  ) -> @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)] raise {
    let rpols = x112
    let ipols = x113
    match ipols {
      Empty =>
        @lib.map(
          fn(
            x114 : (@list.List[(@num.Num, @list.List[Int64])], History),
          ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
            monic_l(x114.0, x114.1)
          },
          @lib.rev(rpols),
        )
      More(p_9, tail=ps) => {
        let p_p = reduce(rpols.concat(ps), p_9)
        if p_p.0 == @list.List([]) {
          grobner_interreduce(rpols, ps)
        } else {
          grobner_interreduce(rpols.prepend(p_p), ps)
        }
      }
    }
  }
  let grobner : (@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> @list.List[
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ] raise = fn(
    x115 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
  ) -> @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)] raise {
    let pols = x115
    let npols = @lib.map2(
      fn(
        x116 : @list.List[(@num.Num, @list.List[Int64])],
        x117 : Int64,
      ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
        let p_10 = x116
        let n_1 = x117
        (p_10, History::Start(n_1))
      },
      pols,
      @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(pols)), 1L)),
    )
    let phists = @lib.filter(
      fn(
        x118 : (@list.List[(@num.Num, @list.List[Int64])], History),
      ) -> Bool raise {
        let (p_11, _) = x118
        p_11 != @list.List([])
      },
      npols,
    )
    let bas = grobner_interreduce(
      @list.List([]),
      @lib.map(
        fn(
          x119 : (@list.List[(@num.Num, @list.List[Int64])], History),
        ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
          monic_l(x119.0, x119.1)
        },
        phists,
      ),
    )
    let prs0 = @lib.allpairs(
      fn(
        x120 : (@list.List[(@num.Num, @list.List[Int64])], History),
        x121 : (@list.List[(@num.Num, @list.List[Int64])], History),
      ) -> (
        (@list.List[(@num.Num, @list.List[Int64])], History),
        (@list.List[(@num.Num, @list.List[Int64])], History),
      ) raise {
        let x_2 = x120
        let y = x121
        (x_2, y)
      },
      bas,
      bas,
    )
    let prs1 = @lib.filter(
      fn(
        x122 : (
          (@list.List[(@num.Num, @list.List[Int64])], History),
          (@list.List[(@num.Num, @list.List[Int64])], History),
        ),
      ) -> Bool raise {
        let ((x_3, _), (y_1, _)) = x122
        poly_lt_l(x_3, y_1)
      },
      prs0,
    )
    let prs2 = @lib.map(
      fn(
        x123 : (
          (@list.List[(@num.Num, @list.List[Int64])], History),
          (@list.List[(@num.Num, @list.List[Int64])], History),
        ),
      ) -> (
        (@num.Num, @list.List[Int64]),
        (
          (@list.List[(@num.Num, @list.List[Int64])], History),
          (@list.List[(@num.Num, @list.List[Int64])], History),
        ),
      ) raise {
        let (p_12, q_6) = x123
        let t124 = @lib.hd(q_6.0)
        (mlcm_l(@lib.hd(p_12.0), t124), (p_12, q_6))
      },
      prs1,
    )
    let prs3 = @lib.filter(
      fn(
        x125 : (
          (@num.Num, @list.List[Int64]),
          (
            (@list.List[(@num.Num, @list.List[Int64])], History),
            (@list.List[(@num.Num, @list.List[Int64])], History),
          ),
        ),
      ) -> Bool raise {
        let (l_6, (p_13, q_7)) = x125
        !((x64, x65, x66) => orthogonal_l(grob_mmul, x64, x65, x66))(
          l_6,
          p_13.0,
          q_7.0,
        )
      },
      prs2,
    )
    grobner_basis(
      bas,
      @lib.mergesort((x80, x81) => forder_l(morder_lt, x80, x81), prs3),
    )
  }
  let grobner_refute : (@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> History raise = fn(
    x126 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
  ) -> History raise {
    let pols_1 = x126
    let gb = grobner(pols_1)
    @lib.find(
      fn(
        x127 : (@list.List[(@num.Num, @list.List[Int64])], History),
      ) -> Bool raise {
        let (p_14, h_2) = x127
        Int::to_int64(@lib.length(p_14)) == 1L &&
        @lib.forall(
          fn(x128 : Int64) -> Bool raise { 0L == x128 },
          @lib.hd(p_14).1,
        )
      },
      gb,
    ).1
  }
  let grobner_strong : (@list.List[@kernel.Term]) -> ((
    @list.List[@list.List[(@num.Num, @list.List[Int64])]],
  ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> (
    Int64,
    @num.Num,
    @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])],
  ) raise) raise) raise = fn(
    x160 : @list.List[@kernel.Term],
  ) -> ((@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> ((
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> (
    Int64,
    @num.Num,
    @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])],
  ) raise) raise) raise {
    let vars_4 = x160
    fn(
      x161 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
    ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> (
      Int64,
      @num.Num,
      @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])],
    ) raise) raise {
      let pols_4 = x161
      fn(
        x162 : @list.List[(@num.Num, @list.List[Int64])],
      ) -> (
        Int64,
        @num.Num,
        @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])],
      ) raise {
        let pol_6 = x162
        if pol_6 == @list.List([]) {
          (1L, @num.num_1, @list.List([]))
        } else {
          let vars_p = vars_4.prepend(@kernel.concl(@bool.truth()))
          let grob_z = @list.List([
            (
              @num.num_1,
              @lib.map(
                fn(x163 : @kernel.Term) -> Int64 raise {
                  let x_4 = x163
                  0L
                },
                vars_4,
              ).prepend(1L),
            ),
          ])
          let grob_1 = @list.List([
            (
              @num.num_1,
              @lib.map(
                fn(x164 : @kernel.Term) -> Int64 raise {
                  let x_5 = x164
                  0L
                },
                vars_p,
              ),
            ),
          ])
          let augment : (@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
            (@num.Num, @list.List[Int64]),
          ] raise = (x166 : @list.List[(@num.Num, @list.List[Int64])]) => {
            @lib.map(
              fn(
                x165 : (@num.Num, @list.List[Int64]),
              ) -> (@num.Num, @list.List[Int64]) raise {
                let (c_6, m_5) = x165
                (c_6, m_5.prepend(0L))
              },
              x166,
            )
          }
          let pols_p = @lib.map(augment, pols_4)
          let pol_p_1 = augment(pol_6)
          let allpols = pols_p.prepend(
            grob_sub(grob_mul(grob_z, pol_p_1))(grob_1),
          )
          let (l_8, cert_1) = ((x137, x138) => {
            grobner_weak_l(grob_cmul, grob_add, grobner_refute, x137, x138)
          })(vars_p, allpols)
          let d_1 = @lib.itlist(
            fn(
              x178 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
              x179 : Int64,
            ) -> Int64 raise {
              (fn(
                x175 : @list.List[(@num.Num, @list.List[Int64])],
              ) -> ((Int64) -> Int64 raise) raise {
                fn(x176 : Int64) -> Int64 raise {
                  ((
                    x173 : @list.List[(@num.Num, @list.List[Int64])],
                    x174 : Int64,
                  ) => {
                    @lib.itlist(
                      fn(
                        x171 : (@num.Num, @list.List[Int64]),
                        x172 : Int64,
                      ) -> Int64 raise {
                        (fn(
                          x169 : @list.List[Int64],
                        ) -> ((Int64) -> Int64 raise) raise {
                          (fn(x167 : Int64) -> ((Int64) -> Int64 raise) raise {
                            fn(x168 : Int64) -> Int64 raise {
                              if x167 >= x168 {
                                x167
                              } else {
                                x168
                              }
                            }
                          })(@lib.hd(x169))
                        })(
                          (fn(
                            x170 : (@num.Num, @list.List[Int64]),
                          ) -> @list.List[Int64] raise {
                            x170.1
                          })(x171),
                        )(x172)
                      },
                      x173,
                      x174,
                    )
                  })(x175, x176)
                }
              })(
                (fn(
                  x177 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
                ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                  x177.1
                })(x178),
              )(x179)
            },
            cert_1,
            0L,
          )
          let transform_monomial : ((@num.Num, @list.List[Int64])) -> @list.List[
            (@num.Num, @list.List[Int64]),
          ] raise = fn(
            x180 : (@num.Num, @list.List[Int64]),
          ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
            let (c_7, m_6) = x180
            let t181 = ((x39, x40, x41) => grob_pow_l(grob_mul, x39, x40, x41))(
              vars_4,
              pol_6,
              @lib.sub63(d_1, @lib.hd(m_6)),
            )
            grob_cmul((c_7, @lib.tl(m_6)), t181)
          }
          let transform_polynomial : (@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
            (@num.Num, @list.List[Int64]),
          ] raise = fn(
            x182 : @list.List[(@num.Num, @list.List[Int64])],
          ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
            let q_8 = x182
            @lib.itlist(
              fn(
                x185 : (@num.Num, @list.List[Int64]),
                x186 : @list.List[(@num.Num, @list.List[Int64])],
              ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                (fn(
                  x183 : @list.List[(@num.Num, @list.List[Int64])],
                ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
                  (@num.Num, @list.List[Int64]),
                ] raise) raise {
                  fn(
                    x184 : @list.List[(@num.Num, @list.List[Int64])],
                  ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                    grob_add(x183, x184)
                  }
                })(transform_monomial(x185))(x186)
              },
              q_8,
              @list.List([]),
            )
          }
          let cert_p = @lib.map(
            fn(
              x187 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
              let (c_8, q_9) = x187
              let t188 = transform_polynomial(q_9)
              (@lib.sub63(c_8, 1L), t188)
            },
            @lib.filter(
              fn(
                x189 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
              ) -> Bool raise {
                let (k, _) = x189
                k != 0L
              },
              cert_1,
            ),
          )
          (d_1, l_8, cert_p)
        }
      }
    }
  }
  let t203 = @simp.asm_simp_tac(@list.List([]))
  let t202 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t195 = @term_syntax.parse_term("(c : A)")
  let t196 = @term_syntax.parse_term("(d : A)")
  let t197 = @term_syntax.parse_term("(n : A)")
  let t198 = @list.List([@term_syntax.parse_term("(n0 : A)"), t197, t196, t195])
  let t201 = @tactics.first_x_assum(fn(
    x200 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x192 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s193 = @tactics.mp_tac(x192)
      fn(
        x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s193(x194)
      }
    })(((x199 : @kernel.Thm) => @bool.specl(t198, x199))(x200))
  })
  let t191 = @tactics.repeat_tac(@tactics.gen_tac)
  let t190 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@class.de_morgan_thm())]),
  )
  let t204 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.gen_tac),
                  @tactics.strip_tac,
                ),
                t190,
              ),
              t191,
            ),
            @tactics.disch_tac,
          ),
          @tactics.strip_tac,
        ),
        t201,
      ),
      t202,
    ),
    t203,
  )
  let pth_step = @tactics.prove(
    @term_syntax.parse_term("∀ add : (A, A) -> A, ∀ mul : (A, A) -> A, ∀ n0 : A, (∀ x : A, mul(n0, x) == n0) && (∀ x : A, ∀ y : A, ∀ z : A, (add(x, y) == add(x, z)) == (y == z)) && (∀ w : A, ∀ x : A, ∀ y : A, ∀ z : A, (add(mul(w, y), mul(x, z)) == add(mul(w, z), mul(x, y))) == (w == x || y == z)) → (∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, (!(a == b) && !(c == d)) == !(add(mul(a, c), mul(b, d)) == add(mul(a, d), mul(b, c)))) && (∀ n : A, ∀ a : A, ∀ b : A, ∀ c : A, ∀ d : A, !(n == n0) → a == b && !(c == d) → !(add(a, mul(n, c)) == add(b, mul(n, d))))"),
    t204,
  )
  let final_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    @class.taut(@term_syntax.parse_term("((p : Bool) → false) → !(q : Bool) == p → q")),
  )
  let false_tm = @term_syntax.parse_term("false")
  fn refute_disj(
    x205 : (@kernel.Term) -> @kernel.Thm raise,
    x206 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let rfn = x205
    let tm = x206
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("\\/", _), l_9),
        r
      ) => {
        let t207 = refute_disj(rfn, r)
        let t208 = refute_disj(rfn, l_9)
        @bool.disj_cases(@kernel.assume_rule(tm), t208, t207)
      }
      _ => rfn(tm)
    }
  }
  ring_and_ideal_conv_c.set(fn(
    x209 : (
      (@kernel.Term) -> @num.Num raise,
      (@num.Num) -> @kernel.Term raise,
      (@kernel.Term) -> @kernel.Thm raise,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Thm,
      @kernel.Thm,
      (@kernel.Term) -> @kernel.Thm raise,
    ),
  ) -> (
    (@kernel.Term) -> @kernel.Thm raise,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise,
  ) raise {
    let (
      ring_dest_const,
      ring_mk_const,
      ring_eq_conv,
      ring_neg_tm,
      ring_add_tm,
      ring_sub_tm,
      ring_inv_tm,
      ring_mul_tm,
      ring_div_tm,
      ring_pow_tm,
      ring_integral,
      rabinowitsch_thm,
      ring_normalize_conv,
    ) = x209
    let t217 = @simp.gen_rewrite_conv(
      fn(
        x214 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s215 = @equal.redepth_conv(x214)
        fn(x216 : @kernel.Term) -> @kernel.Thm raise { s215(x216) }
      },
      @list.List([
        @theorems.and_forall_thm(),
        @theorems.left_and_forall_thm(),
        @theorems.right_and_forall_thm(),
        @class.left_or_forall_thm(),
        @class.right_or_forall_thm(),
        @theorems.or_exists_thm(),
        @theorems.left_or_exists_thm(),
        @theorems.right_or_exists_thm(),
        @theorems.left_and_exists_thm(),
        @theorems.right_and_exists_thm(),
      ]),
    )
    let t213 = if @bool.is_iff(
        @basics.strip_forall(@kernel.concl(rabinowitsch_thm)).1,
      ) {
      @simp.gen_rewrite_conv(
        fn(
          x210 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s211 = @equal.once_depth_conv(x210)
          fn(x212 : @kernel.Term) -> @kernel.Thm raise { s211(x212) }
        },
        @list.List([rabinowitsch_thm]),
      )
    } else {
      @equal.all_conv
    }
    let initial_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @equal.top_depth_conv(@equal.beta_conv),
              @canon.presimp_conv,
            ),
            @canon.conds_elim_conv,
          ),
          @canon.nnf_conv,
        ),
        t213,
      ),
      t217,
    )
    let ring_dest_neg : (@kernel.Term) -> @kernel.Term raise = fn(
      x218 : @kernel.Term,
    ) -> @kernel.Term raise {
      let t = x218
      let (l_10, r_1) = @kernel.dest_comb(t)
      if l_10 == ring_neg_tm {
        r_1
      } else {
        raise Failure("ring_dest_neg")
      }
    }
    let ring_dest_inv : (@kernel.Term) -> @kernel.Term raise = fn(
      x219 : @kernel.Term,
    ) -> @kernel.Term raise {
      let t_1 = x219
      let (l_11, r_2) = @kernel.dest_comb(t_1)
      if l_11 == ring_inv_tm {
        r_2
      } else {
        raise Failure("ring_dest_inv")
      }
    }
    let ring_dest_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
      x220 : @kernel.Term,
    ) => @basics.dest_binop(ring_add_tm, x220)
    let ring_mk_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
      x223 : @kernel.Term,
    ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      fn(x224 : @kernel.Term) -> @kernel.Term raise {
        ((x221 : @kernel.Term, x222 : @kernel.Term) => {
          @basics.mk_binop(ring_add_tm, x221, x222)
        })(x223, x224)
      }
    }
    let ring_dest_sub : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
      x225 : @kernel.Term,
    ) => @basics.dest_binop(ring_sub_tm, x225)
    let ring_dest_mul : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
      x226 : @kernel.Term,
    ) => @basics.dest_binop(ring_mul_tm, x226)
    let ring_mk_mul : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
      x229 : @kernel.Term,
    ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      fn(x230 : @kernel.Term) -> @kernel.Term raise {
        ((x227 : @kernel.Term, x228 : @kernel.Term) => {
          @basics.mk_binop(ring_mul_tm, x227, x228)
        })(x229, x230)
      }
    }
    let ring_dest_div : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
      x231 : @kernel.Term,
    ) => @basics.dest_binop(ring_div_tm, x231)
    let ring_dest_pow : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
      x232 : @kernel.Term,
    ) => @basics.dest_binop(ring_pow_tm, x232)
    let ring_mk_pow : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
      x235 : @kernel.Term,
    ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      fn(x236 : @kernel.Term) -> @kernel.Term raise {
        ((x233 : @kernel.Term, x234 : @kernel.Term) => {
          @basics.mk_binop(ring_pow_tm, x233, x234)
        })(x235, x236)
      }
    }
    fn grobvars(
      x237 : @kernel.Term,
      x238 : @list.List[@kernel.Term],
    ) -> @list.List[@kernel.Term] raise {
      let tm_1 = x237
      let acc = x238
      if @lib.can(ring_dest_const, tm_1) {
        acc
      } else if @lib.can(ring_dest_neg, tm_1) {
        grobvars(@kernel.rand(tm_1), acc)
      } else if @lib.can(ring_dest_pow, tm_1) &&
        @nums.is_numeral(@kernel.rand(tm_1)) {
        grobvars(@equal.lhand(tm_1), acc)
      } else if @lib.can(ring_dest_add, tm_1) ||
        @lib.can(ring_dest_sub, tm_1) ||
        @lib.can(ring_dest_mul, tm_1) {
        let t239 = grobvars(@kernel.rand(tm_1), acc)
        grobvars(@equal.lhand(tm_1), t239)
      } else if @lib.can(ring_dest_inv, tm_1) {
        let gvs = grobvars(@kernel.rand(tm_1), @list.List([]))
        if gvs == @list.List([]) {
          acc
        } else {
          acc.prepend(tm_1)
        }
      } else if @lib.can(ring_dest_div, tm_1) {
        let lvs = grobvars(@equal.lhand(tm_1), acc)
        let gvs_1 = grobvars(@kernel.rand(tm_1), @list.List([]))
        if gvs_1 == @list.List([]) {
          lvs
        } else {
          acc.prepend(tm_1)
        }
      } else {
        acc.prepend(tm_1)
      }
    }
    fn grobify_term(
      x240 : @list.List[@kernel.Term],
      x241 : @kernel.Term,
    ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let vars_5 = x240
      let tm_2 = x241
      try {
        if !@lib.mem(tm_2, vars_5) {
          raise Failure("")
        } else {
          @list.List([
            (
              @num.num_1,
              @lib.map(
                fn(x242 : @kernel.Term) -> Int64 raise {
                  let i_1 = x242
                  if i_1 == tm_2 {
                    1L
                  } else {
                    0L
                  }
                },
                vars_5,
              ),
            ),
          ])
        }
      } catch {
        Failure(_) =>
          try {
            let x_6 = ring_dest_const(tm_2)
            if @num.eq_num(x_6, @num.num_0) {
              @list.List([])
            } else {
              @list.List([
                (
                  x_6,
                  @lib.map(
                    fn(x243 : @kernel.Term) -> Int64 raise {
                      let v_1 = x243
                      0L
                    },
                    vars_5,
                  ),
                ),
              ])
            }
          } catch {
            Failure(_) =>
              grob_neg(grobify_term(vars_5, ring_dest_neg(tm_2))) catch {
                Failure(_) =>
                  grob_inv(grobify_term(vars_5, ring_dest_inv(tm_2))) catch {
                    Failure(_) =>
                      try {
                        let (l_12, r_3) = ring_dest_add(tm_2)
                        let t244 = grobify_term(vars_5, r_3)
                        grob_add(grobify_term(vars_5, l_12), t244)
                      } catch {
                        Failure(_) =>
                          try {
                            let (l_13, r_4) = ring_dest_sub(tm_2)
                            let t245 = grobify_term(vars_5, r_4)
                            grob_sub(grobify_term(vars_5, l_13))(t245)
                          } catch {
                            Failure(_) =>
                              try {
                                let (l_14, r_5) = ring_dest_mul(tm_2)
                                let t246 = grobify_term(vars_5, r_5)
                                grob_mul(grobify_term(vars_5, l_14), t246)
                              } catch {
                                Failure(_) =>
                                  try {
                                    let (l_15, r_6) = ring_dest_div(tm_2)
                                    let t247 = grobify_term(vars_5, r_6)
                                    grob_div(grobify_term(vars_5, l_15))(t247)
                                  } catch {
                                    Failure(_) =>
                                      try {
                                        let (l_16, r_7) = ring_dest_pow(tm_2)
                                        let t248 = @nums.dest_small_numeral(r_7)
                                        ((x39, x40, x41) => {
                                          grob_pow_l(grob_mul, x39, x40, x41)
                                        })(
                                          vars_5,
                                          grobify_term(vars_5, l_16),
                                          t248,
                                        )
                                      } catch {
                                        Failure(_) =>
                                          raise Failure(
                                            "grobify_term: unknown or invalid term",
                                          )
                                        e => raise e
                                      }
                                    e => raise e
                                  }
                                e => raise e
                              }
                            e => raise e
                          }
                        e => raise e
                      }
                    e => raise e
                  }
                e => raise e
              }
            e => raise e
          }
        e => raise e
      }
    }
    let grobify_equation : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
      (@num.Num, @list.List[Int64]),
    ] raise) raise = fn(
      x249 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
      let vars_6 = x249
      fn(
        x250 : @kernel.Term,
      ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
        let tm_3 = x250
        let (l_17, r_8) = @kernel.dest_eq(tm_3)
        let t251 = grobify_term(vars_6, r_8)
        grob_sub(grobify_term(vars_6, l_17))(t251)
      }
    }
    let grobify_equations : (@kernel.Term) -> (
      @list.List[@kernel.Term],
      @list.List[@list.List[(@num.Num, @list.List[Int64])]],
    ) raise = fn(
      x252 : @kernel.Term,
    ) -> (
      @list.List[@kernel.Term],
      @list.List[@list.List[(@num.Num, @list.List[Int64])]],
    ) raise {
      let tm_4 = x252
      let cjs = @basics.conjuncts(tm_4)
      let rawvars = @lib.itlist(
        fn(
          x253 : @kernel.Term,
          x254 : @list.List[@kernel.Term],
        ) -> @list.List[@kernel.Term] raise {
          let eq = x253
          let a_1 = x254
          let t255 = grobvars(@kernel.rand(eq), a_1)
          grobvars(@equal.lhand(eq), t255)
        },
        cjs,
        @list.List([]),
      )
      let vars_7 = @lib.sort(
        fn(x256 : @kernel.Term, x257 : @kernel.Term) -> Bool raise {
          let x_7 = x256
          let y_2 = x257
          @lib.compare(x_7, y_2) < 0
        },
        @lib.setify(rawvars),
      )
      (vars_7, @lib.map(grobify_equation(vars_7), cjs))
    }
    let holify_varpow : ((@kernel.Term, Int64)) -> @kernel.Term raise = fn(
      x258 : (@kernel.Term, Int64),
    ) -> @kernel.Term raise {
      let (v_2, n_4) = x258
      if n_4 == 1L {
        v_2
      } else {
        let t259 = @nums.mk_small_numeral(n_4)
        ring_mk_pow(v_2)(t259)
      }
    }
    let holify_monomial : (@list.List[@kernel.Term]) -> ((
      (@num.Num, @list.List[Int64]),
    ) -> @kernel.Term raise) raise = fn(
      x260 : @list.List[@kernel.Term],
    ) -> (((@num.Num, @list.List[Int64])) -> @kernel.Term raise) raise {
      let vars_8 = x260
      fn(x261 : (@num.Num, @list.List[Int64])) -> @kernel.Term raise {
        let (c_9, m_7) = x261
        let xps = @lib.map(
          holify_varpow,
          @lib.filter(
            fn(x262 : (@kernel.Term, Int64)) -> Bool raise {
              let (_, n_5) = x262
              n_5 != 0L
            },
            @lib.zip(vars_8, m_7),
          ),
        )
        @lib.end_itlist(
          fn(x263 : @kernel.Term, x264 : @kernel.Term) -> @kernel.Term raise {
            let s265 = ring_mk_mul(x263)
            s265(x264)
          },
          xps.prepend(ring_mk_const(c_9)),
        )
      }
    }
    let holify_polynomial : (@list.List[@kernel.Term]) -> ((
      @list.List[(@num.Num, @list.List[Int64])],
    ) -> @kernel.Term raise) raise = fn(
      x266 : @list.List[@kernel.Term],
    ) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise) raise {
      let vars_9 = x266
      fn(
        x267 : @list.List[(@num.Num, @list.List[Int64])],
      ) -> @kernel.Term raise {
        let p_17 = x267
        if p_17 == @list.List([]) {
          ring_mk_const(@num.num_0)
        } else {
          @lib.end_itlist(
            fn(x268 : @kernel.Term, x269 : @kernel.Term) -> @kernel.Term raise {
              let s270 = ring_mk_add(x268)
              s270(x269)
            },
            @lib.map(holify_monomial(vars_9), p_17),
          )
        }
      }
    }
    let holify_polynomial_1 : (@list.List[@kernel.Term]) -> ((
      @list.List[(@num.Num, @list.List[Int64])],
    ) -> @kernel.Term raise) raise = holify_polynomial
    let (pth_idom, pth_ine) = @bool.conj_pair(
      @drule.match_mp(pth_step)(ring_integral),
    )
    let t271 = @simp.rewr_conv(pth_idom)
    let idom_rule : (@kernel.Thm) -> @kernel.Thm raise = (x272 : @kernel.Thm) => {
      @equal.conv_rule(t271, x272)
    }
    let prove_nz : (@num.Num) -> @kernel.Thm raise = fn(
      x273 : @num.Num,
    ) -> @kernel.Thm raise {
      let n_6 = x273
      let t274 = ring_mk_const(@num.num_0)
      @bool.eqf_elim(ring_eq_conv(@basics.mk_eq(ring_mk_const(n_6), t274)))
    }
    let not_eq_01 = prove_nz(@num.num_1)
    let ine_rule : (@num.Num) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
      x275 : @num.Num,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let n_7 = x275
      let t277 = prove_nz(n_7)
      @drule.match_mp(@drule.match_mp(pth_ine)(t277))
    }
    let mk_add : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
      x278 : @kernel.Thm,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let th1 = x278
      fn(x279 : @kernel.Thm) -> @kernel.Thm raise {
        let th2 = x279
        @kernel.mk_comb_rule(@equal.ap_term(ring_add_tm, th1), th2)
      }
    }
    let execute_proof : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Thm]) -> ((
      History,
    ) -> @kernel.Thm raise) raise) raise = fn(
      x280 : @list.List[@kernel.Term],
    ) -> ((@list.List[@kernel.Thm]) -> ((History) -> @kernel.Thm raise) raise) raise {
      let vars_10 = x280
      fn(
        x281 : @list.List[@kernel.Thm],
      ) -> ((History) -> @kernel.Thm raise) raise {
        let eths = x281
        fn(x282 : History) -> @kernel.Thm raise {
          let prf_1 = x282
          let (x_8, th1_1) = @bool.spec_var(
            @bool.conjunct1(@bool.conjunct2(ring_integral)),
          )
          let (y_3, th2_1) = @bool.spec_var(th1_1)
          let (z, th3) = @bool.spec_var(th2_1)
          let sub_eq_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
            fn(
              x283 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x283
            },
            @list.List([
              @equal.sym(
                @kernel.inst_rule(
                  @list.List([(@kernel.mk_comb(ring_neg_tm, z), x_8)]),
                  th3,
                ),
              ),
            ]),
          )
          let t284 = @equal.binop_conv(ring_normalize_conv)
          let initpols = @lib.map(
            fn(x286 : @kernel.Thm) -> @kernel.Thm raise {
              ((x285 : @kernel.Thm) => @equal.conv_rule(t284, x285))(
                sub_eq_rule(x286),
              )
            },
            eths,
          )
          let add_rule : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
            x287 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            let th1_2 = x287
            fn(x288 : @kernel.Thm) -> @kernel.Thm raise {
              let th2_2 = x288
              let t289 = @kernel.mk_comb_rule(
                @equal.ap_term(ring_add_tm, th1_2),
                th2_2,
              )
              @equal.conv_rule(@equal.binop_conv(ring_normalize_conv), t289)
            }
          }
          let mul_rule : (@list.List[@kernel.Term]) -> ((
            (@num.Num, @list.List[Int64]),
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
            x290 : @list.List[@kernel.Term],
          ) -> (((@num.Num, @list.List[Int64])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
            let vars_11 = x290
            fn(
              x291 : (@num.Num, @list.List[Int64]),
            ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
              let m_8 = x291
              fn(x292 : @kernel.Thm) -> @kernel.Thm raise {
                let th = x292
                let t293 = @equal.ap_term(
                  @kernel.mk_comb(
                    ring_mul_tm,
                    holify_polynomial_1(vars_11)(@list.List([m_8])),
                  ),
                  th,
                )
                @equal.conv_rule(@equal.binop_conv(ring_normalize_conv), t293)
              }
            }
          }
          let run_proof_1 : (@list.List[@kernel.Term]) -> ((History) -> @kernel.Thm raise) raise = if @bool.is_iff(
              @basics.strip_forall(@kernel.concl(rabinowitsch_thm)).1,
            ) {
            @pp.std_formatter.print_string("Generating HOL version of proof")
            @pp.std_formatter.print_newline()
            let execache = Ref::{ val: @list.List([]), }
            let memoize : (History) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
              x296 : History,
            ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
              let prf_2 = x296
              fn(x297 : @kernel.Thm) -> @kernel.Thm raise {
                let x_10 = x297
                {
                  execache.val = execache.val.prepend((prf_2, x_10))
                  ()
                }
                x_10
              }
            }
            fn run_proof(
              x298 : @list.List[@kernel.Term],
              x299 : History,
            ) -> @kernel.Thm raise {
              let vars_12 = x298
              let prf_3 = x299
              assoceq_l(prf_3, execache.val) catch {
                Failure(_) =>
                  match prf_3 {
                    History::Start(m_9) =>
                      @lib.el(@lib.int63_to_int(m_9), initpols)
                    History::Add(p1_5, p2_5) => {
                      let t300 = run_proof(vars_12, p2_5)
                      let t301 = add_rule(run_proof(vars_12, p1_5))(t300)
                      memoize(prf_3)(t301)
                    }
                    History::Mmul(m_10, p2_6) => {
                      let t302 = run_proof(vars_12, p2_6)
                      let t303 = mul_rule(vars_12)(m_10)(t302)
                      memoize(prf_3)(t303)
                    }
                  }
                e => raise e
              }
            }
            fn(
              x304 : @list.List[@kernel.Term],
            ) -> ((History) -> @kernel.Thm raise) raise {
              let vars_13 = x304
              fn(x305 : History) -> @kernel.Thm raise {
                let prf_4 = x305
                let ans = run_proof(vars_13, prf_4)
                {
                  execache.val = @list.List([])
                  ()
                }
                ans
              }
            }
          } else {
            @pp.std_formatter.print_string(
              "Generating HOL version of scaled proof",
            )
            @pp.std_formatter.print_newline()
            let km = @lib.map(
              fn(x306 : @kernel.Term) -> Int64 raise {
                let x_11 = x306
                0L
              },
              vars_10,
            )
            let execache_1 = Ref::{ val: @list.List([]), }
            let memoize_1 : (History) -> (((@num.Num, @kernel.Thm)) -> (
              @num.Num,
              @kernel.Thm,
            ) raise) raise = fn(
              x307 : History,
            ) -> (((@num.Num, @kernel.Thm)) -> (@num.Num, @kernel.Thm) raise) raise {
              let prf_5 = x307
              fn(
                x308 : (@num.Num, @kernel.Thm),
              ) -> (@num.Num, @kernel.Thm) raise {
                let x_12 = x308
                {
                  execache_1.val = execache_1.val.prepend((prf_5, x_12))
                  ()
                }
                x_12
              }
            }
            fn run_scaled_proof(
              x309 : @list.List[@kernel.Term],
              x310 : History,
            ) -> (@num.Num, @kernel.Thm) raise {
              let vars_14 = x309
              let prf_6 = x310
              assoceq_l(prf_6, execache_1.val) catch {
                Failure(_) =>
                  match prf_6 {
                    History::Start(m_11) =>
                      (@num.num_1, @lib.el(@lib.int63_to_int(m_11), initpols))
                    History::Add(p1_6, p2_7) => {
                      let (d1, th1_3) = run_scaled_proof(vars_14, p1_6)
                      let (d2, th2_3) = run_scaled_proof(vars_14, p2_7)
                      let d_2 = @num.lcm_num(d1, d2)
                      let t312 = (@num.div_num(d_2, d2), km)
                      let t313 = mul_rule(vars_14)(t312)(th2_3)
                      let t311 = (@num.div_num(d_2, d1), km)
                      let t314 = (
                        d_2,
                        add_rule(mul_rule(vars_14)(t311)(th1_3))(t313),
                      )
                      memoize_1(prf_6)(t314)
                    }
                    History::Mmul((c_10, xs), p2_8) => {
                      let e = @num.denominator(c_10)
                      let (d_3, th_1) = run_scaled_proof(vars_14, p2_8)
                      let t315 = (@num.mult_num(c_10, e), xs)
                      let t316 = mul_rule(vars_14)(t315)(th_1)
                      let t317 = (@num.mult_num(d_3, e), t316)
                      memoize_1(prf_6)(t317)
                    }
                  }
                e => raise e
              }
            }
            fn(
              x318 : @list.List[@kernel.Term],
            ) -> ((History) -> @kernel.Thm raise) raise {
              let vars_15 = x318
              fn(x319 : History) -> @kernel.Thm raise {
                let prf_7 = x319
                let (_, ans_1) = run_scaled_proof(vars_15, prf_7)
                {
                  execache_1.val = @list.List([])
                  ()
                }
                ans_1
              }
            }
          }
          let th_2 = run_proof_1(vars_10)(prf_1)
          @equal.conv_rule(ring_eq_conv, th_2)
        }
      }
    }
    let refute : (@kernel.Term) -> @kernel.Thm raise = fn(
      x320 : @kernel.Term,
    ) -> @kernel.Thm raise {
      let tm_5 = x320
      if tm_5 == false_tm {
        @kernel.assume_rule(tm_5)
      } else {
        let (nths0, eths0) = @lib.partition(
          fn(x323 : @kernel.Thm) -> Bool raise {
            (fn(x321 : @kernel.Term) -> Bool raise { @basics.is_neg(x321) })(
              (fn(x322 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x322)
              })(x323),
            )
          },
          @bool.conjuncts_rule(@kernel.assume_rule(tm_5)),
        )
        let nths = @lib.filter(
          fn(x327 : @kernel.Thm) -> Bool raise {
            (fn(x325 : @kernel.Term) -> Bool raise {
              (fn(x324 : @kernel.Term) -> Bool raise { @basics.is_eq(x324) })(
                @kernel.rand(x325),
              )
            })(
              (fn(x326 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x326)
              })(x327),
            )
          },
          nths0,
        )
        let eths_1 = @lib.filter(
          fn(x330 : @kernel.Thm) -> Bool raise {
            (fn(x328 : @kernel.Term) -> Bool raise { @basics.is_eq(x328) })(
              (fn(x329 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x329)
              })(x330),
            )
          },
          eths0,
        )
        if eths_1 == @list.List([]) {
          let th1_5 = @lib.end_itlist(
            fn(x331 : @kernel.Thm, x332 : @kernel.Thm) -> @kernel.Thm raise {
              let th1_4 = x331
              let th2_4 = x332
              idom_rule(@bool.conj(th1_4, th2_4))
            },
            nths,
          )
          let th2_5 = @equal.conv_rule(
            @equal.rand_conv(@equal.binop_conv(ring_normalize_conv)),
            th1_5,
          )
          let (l_19, r_9) = @kernel.dest_eq(@kernel.rand(@kernel.concl(th2_5)))
          let t333 = @kernel.refl(l_19)
          @kernel.eq_mp(@bool.eqf_intro(th2_5), t333)
        } else if nths == @list.List([]) && !@kernel.is_var(ring_neg_tm) {
          let (vars_16, pols_5) = grobify_equations(
            @bool.list_mk_conj(
              @lib.map(
                fn(x334 : @kernel.Thm) -> @kernel.Term raise {
                  @kernel.concl(x334)
                },
                eths_1,
              ),
            ),
          )
          let t335 = grobner_refute(pols_5)
          execute_proof(vars_16)(eths_1)(t335)
        } else {
          let (vars_19, l_22, cert_4, noteqth) = if nths == @list.List([]) {
            let (vars_17, pols_6) = grobify_equations(
              @bool.list_mk_conj(
                @lib.map(
                  fn(x336 : @kernel.Thm) -> @kernel.Term raise {
                    @kernel.concl(x336)
                  },
                  eths_1,
                ),
              ),
            )
            let (l_20, cert_2) = ((x137, x138) => {
              grobner_weak_l(grob_cmul, grob_add, grobner_refute, x137, x138)
            })(vars_17, pols_6)
            (vars_17, l_20, cert_2, not_eq_01)
          } else {
            let nth = @lib.end_itlist(
              fn(x337 : @kernel.Thm, x338 : @kernel.Thm) -> @kernel.Thm raise {
                let th1_6 = x337
                let th2_6 = x338
                idom_rule(@bool.conj(th1_6, th2_6))
              },
              nths,
            )
            let t340 = @lib.map(
              fn(x339 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x339)
              },
              eths_1,
            )
            match
              grobify_equations(
                @bool.list_mk_conj(
                  t340.prepend(@kernel.rand(@kernel.concl(nth))),
                ),
              ) {
              (vars_18, More(pol_7, tail=pols_7)) => {
                let (deg, l_21, cert_3) = grobner_strong(vars_18)(pols_7)(pol_7)
                let th1_7 = @equal.conv_rule(
                  @equal.rand_conv(@equal.binop_conv(ring_normalize_conv)),
                  nth,
                )
                let th2_7 = @lib.funpow(
                  @lib.int63_to_int(deg),
                  fn(x342 : @kernel.Thm) -> @kernel.Thm raise {
                    idom_rule(
                      ((x341 : @kernel.Thm) => @bool.conj(th1_7, x341))(x342),
                    )
                  },
                  not_eq_01,
                )
                (vars_18, l_21, cert_3, th2_7)
              }
              _ => raise @lib.MatchFailure("tscript.ml:552")
            }
          }
          @pp.std_formatter.print_string(
            "Translating certificate to HOL inferences",
          )
          @pp.std_formatter.print_newline()
          let cert_pos = @lib.map(
            fn(
              x343 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
              let (i_2, p_18) = x343
              (
                i_2,
                @lib.filter(
                  fn(x344 : (@num.Num, @list.List[Int64])) -> Bool raise {
                    let (c_11, m_12) = x344
                    @num.gt_num(c_11, @num.num_0)
                  },
                  p_18,
                ),
              )
            },
            cert_4,
          )
          let cert_neg = @lib.map(
            fn(
              x345 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
              let (i_3, p_19) = x345
              (
                i_3,
                @lib.map(
                  fn(
                    x346 : (@num.Num, @list.List[Int64]),
                  ) -> (@num.Num, @list.List[Int64]) raise {
                    let (c_12, m_13) = x346
                    (@num.minus_num(c_12), m_13)
                  },
                  @lib.filter(
                    fn(x347 : (@num.Num, @list.List[Int64])) -> Bool raise {
                      let (c_13, m_14) = x347
                      @num.lt_num(c_13, @num.num_0)
                    },
                    p_19,
                  ),
                ),
              )
            },
            cert_4,
          )
          let herts_pos = @lib.map(
            fn(
              x348 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> (Int64, @kernel.Term) raise {
              let (i_4, p_20) = x348
              (i_4, holify_polynomial_1(vars_19)(p_20))
            },
            cert_pos,
          )
          let herts_neg = @lib.map(
            fn(
              x349 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> (Int64, @kernel.Term) raise {
              let (i_5, p_21) = x349
              (i_5, holify_polynomial_1(vars_19)(p_21))
            },
            cert_neg,
          )
          let thm_fn : (@list.List[(Int64, @kernel.Term)]) -> @kernel.Thm raise = fn(
            x350 : @list.List[(Int64, @kernel.Term)],
          ) -> @kernel.Thm raise {
            let pols_8 = x350
            if pols_8 == @list.List([]) {
              @kernel.refl(ring_mk_const(@num.num_0))
            } else {
              @lib.end_itlist(
                fn(
                  x351 : @kernel.Thm,
                  x352 : @kernel.Thm,
                ) -> @kernel.Thm raise {
                  let s353 = mk_add(x351)
                  s353(x352)
                },
                @lib.map(
                  fn(x354 : (Int64, @kernel.Term)) -> @kernel.Thm raise {
                    let (i_6, p_22) = x354
                    let t355 = @lib.el(@lib.int63_to_int(i_6), eths_1)
                    @equal.ap_term(@kernel.mk_comb(ring_mul_tm, p_22), t355)
                  },
                  pols_8,
                ),
              )
            }
          }
          let th1_8 = thm_fn(herts_pos)
          let th2_8 = thm_fn(herts_neg)
          let th3_1 = @bool.conj(mk_add(@equal.sym(th1_8))(th2_8), noteqth)
          let t356 = ine_rule(l_22)(th3_1)
          let th4 = @equal.conv_rule(
            @equal.rand_conv(@equal.binop_conv(ring_normalize_conv)),
            t356,
          )
          let (l_23, r_10) = @kernel.dest_eq(@kernel.rand(@kernel.concl(th4)))
          let t357 = @kernel.refl(l_23)
          @kernel.eq_mp(@bool.eqf_intro(th4), t357)
        }
      }
    }
    let ring_ty = @basics.dest_fun_ty(
        @basics.dest_fun_ty(@kernel.type_of(ring_add_tm)).1,
      ).1
    let ring : (@kernel.Term) -> @kernel.Thm raise = fn(
      x358 : @kernel.Term,
    ) -> @kernel.Thm raise {
      let tm_6 = x358
      let avs = @lib.filter(
        fn(x361 : @kernel.Term) -> Bool raise {
          (fn(x359 : @kernel.HolType) -> Bool raise { ring_ty == x359 })(
            (fn(x360 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x360)
            })(x361),
          )
        },
        @kernel.frees(tm_6),
      )
      let tm_p = @bool.list_mk_forall(avs, tm_6)
      let th1_9 = initial_conv(@bool.mk_neg(tm_p))
      let (evs, bod) = @basics.strip_exists(@kernel.rand(@kernel.concl(th1_9)))
      if @basics.is_forall(bod) {
        raise Failure("RING: non-universal formula")
      } else {
        let th1a = @canon.weak_dnf_conv(bod)
        let boda = @kernel.rand(@kernel.concl(th1a))
        let th2a = refute_disj(refute, boda)
        let th2b = @kernel.trans(
          th1a,
          @bool.eqf_intro(@bool.not_intro(@bool.disch(boda, th2a))),
        )
        let th2_9 = @bool.undisch(@bool.not_elim(@bool.eqf_elim(th2b)))
        fn chooses(
          x362 : @list.List[@kernel.Term],
          x363 : (@kernel.Term, @kernel.Thm),
        ) -> (@kernel.Term, @kernel.Thm) raise {
          let evs_1 = x362
          let (etm, th_3) = x363
          match evs_1 {
            Empty => (etm, th_3)
            More(ev, tail=oevs) => {
              let (etm_p, th_p) = chooses(oevs, (etm, th_3))
              let t364 = @bool.choose_rule(
                ev,
                @kernel.assume_rule(@bool.mk_exists(ev, etm_p)),
                th_p,
              )
              (@bool.mk_exists(ev, etm_p), t364)
            }
          }
        }
        let (finbod, th3_2) = chooses(evs, (bod, th2_9))
        @bool.specl(
          avs,
          @drule.match_mp(final_rule(@bool.disch(finbod, th3_2)))(th1_9),
        )
      }
    }
    let ideal : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
      @kernel.Term,
    ] raise) raise = fn(
      x365 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
      let tms = x365
      fn(x366 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        let tm_7 = x366
        let rawvars_1 = @lib.itlist(grobvars, tms.prepend(tm_7), @list.List([]))
        let vars_20 = @lib.sort(
          fn(x367 : @kernel.Term, x368 : @kernel.Term) -> Bool raise {
            let x_13 = x367
            let y_5 = x368
            @lib.compare(x_13, y_5) < 0
          },
          @lib.setify(rawvars_1),
        )
        let pols_9 = @lib.map(
          (x369 : @kernel.Term) => grobify_term(vars_20, x369),
          tms,
        )
        let pol_8 = grobify_term(vars_20, tm_7)
        let cert_5 = ((x155, x156, x157) => {
          grobner_ideal_l(
            reduce, grobner, grob_neg, grob_cmul, grob_add, x155, x156, x157,
          )
        })(vars_20, pols_9, pol_8)
        @lib.map(
          fn(x370 : Int64) -> @kernel.Term raise {
            let n_8 = x370
            let p_23 = @lib.assocd(n_8, cert_5, @list.List([]))
            holify_polynomial_1(vars_20)(p_23)
          },
          @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(pols_9)), 1L)),
        )
      }
    }
    (ring, ideal)
  })
}

///|
let ring_and_ideal_conv_c : @lib.Cell[
  (
    (
      (@kernel.Term) -> @num.Num raise,
      (@num.Num) -> @kernel.Term raise,
      @equal.Conv,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Term,
      @kernel.Thm,
      @kernel.Thm,
      @equal.Conv,
    ),
  ) -> (
    (@kernel.Term) -> @kernel.Thm raise,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise,
  ) raise,
] = @lib.Cell::new("RING_AND_IDEAL_CONV")

///|
/// `RING_AND_IDEAL_CONV`
pub fn ring_and_ideal_conv(
  x : (
    (@kernel.Term) -> @num.Num raise,
    (@num.Num) -> @kernel.Term raise,
    @equal.Conv,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Thm,
    @kernel.Thm,
    @equal.Conv,
  ),
) -> (
  (@kernel.Term) -> @kernel.Thm raise,
  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise,
) raise {
  ring_and_ideal_conv_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] lexorder_l(
  x1 : @list.List[TA],
  x2 : @list.List[TA],
) -> Bool raise {
  let l1 = x1
  let l2 = x2
  match (l1, l2) {
    (Empty, Empty) => false
    (More(x1_1, tail=o1), More(x2_1, tail=o2)) =>
      @lib.compare(x1_1, x2_1) > 0 || (x1_1 == x2_1 && lexorder_l(o1, o2))
    _ => raise Failure("morder: inconsistent monomial lengths")
  }
}

///|
fn[TB] grob_pow_l(
  grob_mul : (
    @list.List[(@num.Num, @list.List[Int64])],
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  x39 : @list.List[TB],
  x40 : @list.List[(@num.Num, @list.List[Int64])],
  x41 : Int64,
) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let grob_pow = (
    x39 : @list.List[TB],
    x40 : @list.List[(@num.Num, @list.List[Int64])],
    x41 : Int64,
  ) => grob_pow_l(grob_mul, x39, x40, x41)
  let vars = x39
  let l_2 = x40
  let n = x41
  if n < 0L {
    raise Failure("grob_pow: negative power")
  } else if n == 0L {
    @list.List([
      (
        @num.num_1,
        @lib.map(
          fn(x42 : TB) -> Int64 raise {
            let v = x42
            0L
          },
          vars,
        ),
      ),
    ])
  } else {
    grob_mul(l_2, grob_pow(vars, l_2, @lib.sub63(n, 1L)))
  }
}

///|
fn[TC : Eq + @lib.OCompare + @lib.OHash, TD, TE] mlcm_l(
  x48 : (TE, @list.List[TC]),
  x49 : (TD, @list.List[TC]),
) -> (@num.Num, @list.List[TC]) raise {
  let (c1_3, m1_4) = x48
  let (c2_3, m2_4) = x49
  (
    @num.num_1,
    @lib.map2(
      fn(x52 : TC, x53 : TC) -> TC raise {
        let s54 = (fn(x50 : TC) -> ((TC) -> TC raise) raise {
          fn(x51 : TC) -> TC raise {
            if @lib.compare(x50, x51) >= 0 {
              x50
            } else {
              x51
            }
          }
        })(x52)
        s54(x53)
      },
      m1_4,
      m2_4,
    ),
  )
}

///|
fn[TF] orthogonal_l(
  grob_mmul : ((@num.Num, @list.List[Int64])) -> ((
    (@num.Num, @list.List[Int64]),
  ) -> (@num.Num, @list.List[Int64]) raise) raise,
  x64 : (TF, @list.List[Int64]),
  x65 : @list.List[(@num.Num, @list.List[Int64])],
  x66 : @list.List[(@num.Num, @list.List[Int64])],
) -> Bool raise {
  let l_3 = x64
  let p1 = x65
  let p2 = x66
  let t67 = @lib.hd(p2)
  l_3.1 == grob_mmul(@lib.hd(p1))(t67).1
}

///|
fn[TG : Eq + @lib.OCompare + @lib.OHash] monic_l(
  x74 : @list.List[(@num.Num, @list.List[TG])],
  x75 : History,
) -> (@list.List[(@num.Num, @list.List[TG])], History) raise {
  let (pol_3, hist_1) = (x74, x75)
  if pol_3 == @list.List([]) {
    (pol_3, hist_1)
  } else {
    let (c_p, m_p) = @lib.hd(pol_3)
    let t78 = @lib.map(fn(x77 : TG) -> Int64 raise { 0L }, m_p)
    let t79 = History::Mmul((@num.div_num(@num.num_1, c_p), t78), hist_1)
    (
      @lib.map(
        fn(
          x76 : (@num.Num, @list.List[TG]),
        ) -> (@num.Num, @list.List[TG]) raise {
          let (c_5, m_2) = x76
          (@num.div_num(c_5, c_p), m_2)
        },
        pol_3,
      ),
      t79,
    )
  }
}

///|
fn[TH, TI, TJ, TK] forder_l(
  morder_lt : (@list.List[Int64]) -> ((@list.List[Int64]) -> Bool raise) raise,
  x80 : ((TJ, @list.List[Int64]), TK),
  x81 : ((TH, @list.List[Int64]), TI),
) -> Bool raise {
  let ((c1_4, m1_5), _) = x80
  let ((c2_4, m2_5), _) = x81
  morder_lt(m1_5)(m2_5)
}

///|
fn[TL : Eq + @lib.OCompare + @lib.OHash] poly_lt_l(
  x82 : @list.List[(@num.Num, TL)],
  x83 : @list.List[(@num.Num, TL)],
) -> Bool raise {
  let p_3 = x82
  let q_2 = x83
  match (p_3, q_2) {
    (p_4, Empty) => false
    (Empty, q_3) => true
    (More((c1_5, m1_6), tail=o1_2), More((c2_5, m2_6), tail=o2_2)) =>
      @num.lt_num(c1_5, c2_5) ||
      (
        @num.eq_num(c1_5, c2_5) &&
        (
          @lib.compare(m1_6, m2_6) < 0 ||
          (m1_6 == m2_6 && poly_lt_l(o1_2, o2_2))
        )
      )
  }
}

///|
fn[TM : Eq + @lib.OCompare + @lib.OHash, TN] align_l(
  x84 : (@list.List[(@num.Num, TM)], TN),
  x85 : (@list.List[(@num.Num, TM)], TN),
) -> ((@list.List[(@num.Num, TM)], TN), (@list.List[(@num.Num, TM)], TN)) raise {
  let ((p_5, hp), (q_4, hq)) = (x84, x85)
  if poly_lt_l(p_5, q_4) {
    ((p_5, hp), (q_4, hq))
  } else {
    ((q_4, hq), (p_5, hp))
  }
}

///|
fn[TO : Eq + @lib.OCompare + @lib.OHash] poly_eq_l(
  x86 : @list.List[(@num.Num, TO)],
  x87 : @list.List[(@num.Num, TO)],
) -> Bool raise {
  let p1_1 = x86
  let p2_1 = x87
  @lib.forall2(
    fn(x88 : (@num.Num, TO), x89 : (@num.Num, TO)) -> Bool raise {
      let (c1_6, m1_7) = x88
      let (c2_6, m2_7) = x89
      @num.eq_num(c1_6, c2_6) && m1_7 == m2_7
    },
    p1_1,
    p2_1,
  )
}

///|
fn[
  TP : Eq + @lib.OCompare + @lib.OHash,
  TQ,
  TR : Eq + @lib.OCompare + @lib.OHash,
  TS,
  TT,
  TU,
] memx_l(
  x90 : ((@list.List[(@num.Num, TP)], TT), (@list.List[(@num.Num, TR)], TU)),
  x91 : @list.List[
    ((@list.List[(@num.Num, TP)], TQ), (@list.List[(@num.Num, TR)], TS)),
  ],
) -> Bool raise {
  let ((p1_2, h1_1), (p2_2, h2)) = x90
  let ppairs = x91
  !@lib.exists(
    fn(
      x92 : ((@list.List[(@num.Num, TP)], TQ), (@list.List[(@num.Num, TR)], TS)),
    ) -> Bool raise {
      let ((q1, _), (q2, _)) = x92
      poly_eq_l(p1_2, q1) && poly_eq_l(p2_2, q2)
    },
    ppairs,
  )
}

///|
fn[TV, TW, TX, TY] criterion2_l(
  mdiv : ((@num.Num, @list.List[Int64])) -> (((@num.Num, @list.List[Int64])) -> (
    @num.Num,
    @list.List[Int64],
  ) raise) raise,
  x93 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], TY)],
  x94 : (
    (@num.Num, @list.List[Int64]),
    (
      (@list.List[(@num.Num, @list.List[Int64])], TY),
      (@list.List[(@num.Num, @list.List[Int64])], TY),
    ),
  ),
  x95 : @list.List[
    (
      TV,
      (
        (@list.List[(@num.Num, @list.List[Int64])], TW),
        (@list.List[(@num.Num, @list.List[Int64])], TX),
      ),
    ),
  ],
) -> Bool raise {
  let basis_2 = x93
  let (lcm, ((p1_3, h1_2), (p2_3, h2_1))) = x94
  let opairs = x95
  @lib.exists(
    fn(x96 : (@list.List[(@num.Num, @list.List[Int64])], TY)) -> Bool raise {
      let g = x96
      !poly_eq_l(g.0, p1_3) &&
      (if !poly_eq_l(g.0, p2_3) {
        let t97 = @lib.hd(g.0)
        if @lib.can(mdiv(lcm), t97) {
          let t99 = @lib.map(
            fn(
              x98 : (
                TV,
                (
                  (@list.List[(@num.Num, @list.List[Int64])], TW),
                  (@list.List[(@num.Num, @list.List[Int64])], TX),
                ),
              ),
            ) -> (
              (@list.List[(@num.Num, @list.List[Int64])], TW),
              (@list.List[(@num.Num, @list.List[Int64])], TX),
            ) raise {
              x98.1
            },
            opairs,
          )
          if !memx_l(align_l(g, (p1_3, h1_2)), t99) {
            let t101 = @lib.map(
              fn(
                x100 : (
                  TV,
                  (
                    (@list.List[(@num.Num, @list.List[Int64])], TW),
                    (@list.List[(@num.Num, @list.List[Int64])], TX),
                  ),
                ),
              ) -> (
                (@list.List[(@num.Num, @list.List[Int64])], TW),
                (@list.List[(@num.Num, @list.List[Int64])], TX),
              ) raise {
                x100.1
              },
              opairs,
            )
            !memx_l(align_l(g, (p2_3, h2_1)), t101)
          } else {
            false
          }
        } else {
          false
        }
      } else {
        false
      })
    },
    basis_2,
  )
}

///|
fn[TZ] constant_poly_l(
  x102 : @list.List[(TZ, @list.List[Int64])],
) -> Bool raise {
  let p_6 = x102
  Int::to_int64(@lib.length(p_6)) == 1L &&
  @lib.forall(fn(x103 : Int64) -> Bool raise { 0L == x103 }, @lib.hd(p_6).1)
}

///|
fn[TBA] resolve_proof_l(
  grob_cmul : (
    (@num.Num, @list.List[Int64]),
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  grob_add : (
    @list.List[(@num.Num, @list.List[Int64])],
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  x129 : @list.List[TBA],
  x130 : History,
) -> @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])] raise {
  let resolve_proof = (x129 : @list.List[TBA], x130 : History) => {
    resolve_proof_l(grob_cmul, grob_add, x129, x130)
  }
  let vars_1 = x129
  let prf = x130
  match prf {
    History::Start(-1L) => @list.List([])
    History::Start(m_3) =>
      @list.List([
        (
          m_3,
          @list.List([
            (@num.num_1, @lib.map(fn(x131 : TBA) -> Int64 raise { 0L }, vars_1)),
          ]),
        ),
      ])
    History::Mmul(pol_4, lin) => {
      let lis = resolve_proof(vars_1, lin)
      @lib.map(
        fn(
          x132 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
        ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
          let (n_2, p_15) = x132
          (n_2, grob_cmul(pol_4, p_15))
        },
        lis,
      )
    }
    History::Add(lin1, lin2) => {
      let lis1 = resolve_proof(vars_1, lin1)
      let lis2 = resolve_proof(vars_1, lin2)
      let t135 = @lib.map(
        fn(
          x134 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
        ) -> Int64 raise {
          x134.0
        },
        lis2,
      )
      let dom = @lib.setify(
        @lib.union(
          @lib.map(
            fn(
              x133 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
            ) -> Int64 raise {
              x133.0
            },
            lis1,
          ),
          t135,
        ),
      )
      @lib.map(
        fn(
          x136 : Int64,
        ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
          let n_3 = x136
          let a = @lib.assoc(n_3, lis1) catch {
            Failure(_) => @list.List([])
            e => raise e
          }
          let b = @lib.assoc(n_3, lis2) catch {
            Failure(_) => @list.List([])
            e => raise e
          }
          (n_3, grob_add(a, b))
        },
        dom,
      )
    }
  }
}

///|
fn[TBB] grobner_weak_l(
  grob_cmul : (
    (@num.Num, @list.List[Int64]),
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  grob_add : (
    @list.List[(@num.Num, @list.List[Int64])],
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  grobner_refute : (@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> History raise,
  x137 : @list.List[TBB],
  x138 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
) -> (@num.Num, @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])]) raise {
  let vars_2 = x137
  let pols_2 = x138
  let cert = ((x129, x130) => resolve_proof_l(grob_cmul, grob_add, x129, x130))(
    vars_2,
    grobner_refute(pols_2),
  )
  let l_7 = @lib.itlist(
    fn(
      x151 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
      x152 : @num.Num,
    ) -> @num.Num raise {
      (fn(
        x148 : @list.List[(@num.Num, @list.List[Int64])],
      ) -> ((@num.Num) -> @num.Num raise) raise {
        fn(x149 : @num.Num) -> @num.Num raise {
          ((x146 : @list.List[(@num.Num, @list.List[Int64])], x147 : @num.Num) => {
            @lib.itlist(
              fn(
                x144 : (@num.Num, @list.List[Int64]),
                x145 : @num.Num,
              ) -> @num.Num raise {
                (fn(x142 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
                  (fn(x139 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
                    fn(x140 : @num.Num) -> @num.Num raise {
                      @num.lcm_num(x139, x140)
                    }
                  })(
                    (fn(x141 : @num.Num) -> @num.Num raise {
                      @num.denominator(x141)
                    })(x142),
                  )
                })(
                  (fn(x143 : (@num.Num, @list.List[Int64])) -> @num.Num raise {
                    x143.0
                  })(x144),
                )(x145)
              },
              x146,
              x147,
            )
          })(x148, x149)
        }
      })(
        (fn(
          x150 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
        ) -> @list.List[(@num.Num, @list.List[Int64])] raise {
          x150.1
        })(x151),
      )(x152)
    },
    cert,
    @num.num_1,
  )
  (
    l_7,
    @lib.map(
      fn(
        x153 : (Int64, @list.List[(@num.Num, @list.List[Int64])]),
      ) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
        let (i, p_16) = x153
        (
          i,
          @lib.map(
            fn(
              x154 : (@num.Num, @list.List[Int64]),
            ) -> (@num.Num, @list.List[Int64]) raise {
              let (d, m_4) = x154
              (@num.mult_num(l_7, d), m_4)
            },
            p_16,
          ),
        )
      },
      cert,
    ),
  )
}

///|
fn[TBC] grobner_ideal_l(
  reduce : (
    @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)],
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise,
  grobner : (@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> @list.List[
    (@list.List[(@num.Num, @list.List[Int64])], History),
  ] raise,
  grob_neg : (@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[
    (@num.Num, @list.List[Int64]),
  ] raise,
  grob_cmul : (
    (@num.Num, @list.List[Int64]),
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  grob_add : (
    @list.List[(@num.Num, @list.List[Int64])],
    @list.List[(@num.Num, @list.List[Int64])],
  ) -> @list.List[(@num.Num, @list.List[Int64])] raise,
  x155 : @list.List[TBC],
  x156 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
  x157 : @list.List[(@num.Num, @list.List[Int64])],
) -> @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])] raise {
  let grobner_ideal = (
    x155 : @list.List[TBC],
    x156 : @list.List[@list.List[(@num.Num, @list.List[Int64])]],
    x157 : @list.List[(@num.Num, @list.List[Int64])],
  ) => {
    grobner_ideal_l(
      reduce, grobner, grob_neg, grob_cmul, grob_add, x155, x156, x157,
    )
  }
  let vars_3 = x155
  let pols_3 = x156
  let pol_5 = x157
  let t158 = History::Start(-1L)
  let t159 = (grob_neg(pol_5), t158)
  let (pol_p, h_3) = reduce(grobner(pols_3), t159)
  if pol_p != @list.List([]) {
    raise Failure("grobner_ideal: not in the ideal")
  } else {
    ((x129, x130) => resolve_proof_l(grob_cmul, grob_add, x129, x130))(
      vars_3, h_3,
    )
  }
}

///|
fn[TBD, TBE] assoceq_l(x294 : TBE, x295 : @list.List[(TBE, TBD)]) -> TBD raise {
  let a_2 = x294
  let l_18 = x295
  match l_18 {
    Empty => raise Failure("assoceq")
    More((x_9, y_4), tail=t_2) =>
      if physical_equal(x_9, a_2) {
        y_4
      } else {
        assoceq_l(a_2, t_2)
      }
  }
}

///|
/// `RING`
pub fn ring(
  x371 : (
    (@kernel.Term) -> @num.Num raise,
    (@num.Num) -> @kernel.Term raise,
    (@kernel.Term) -> @kernel.Thm raise,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Thm,
    @kernel.Thm,
    (@kernel.Term) -> @kernel.Thm raise,
  ),
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let parms = x371
  ring_and_ideal_conv(parms).0
}

///|
/// `ideal_cofactors`
pub fn ideal_cofactors(
  x373 : (
    (@kernel.Term) -> @num.Num raise,
    (@num.Num) -> @kernel.Term raise,
    (@kernel.Term) -> @kernel.Thm raise,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Term,
    @kernel.Thm,
    @kernel.Thm,
    (@kernel.Term) -> @kernel.Thm raise,
  ),
) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise) raise {
  let parms = x373
  ring_and_ideal_conv(parms).1
}

///|
/// NUM_SIMPLIFY_CONV
fn step_2() -> Unit raise {
  let pre_tm = @term_syntax.parse_term("PRE")
  let div_tm = @term_syntax.parse_term("DIV")
  let mod_tm = @term_syntax.parse_term("MOD")
  let p_tm = @term_syntax.parse_term("(P : (Num) -> Bool)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let q_tm = @term_syntax.parse_term("(P : (Num, Num) -> Bool)")
  let a_tm = @term_syntax.parse_term("(a : Num)")
  let b_tm = @term_syntax.parse_term("(b : Num)")
  let is_pre : (@kernel.Term) -> Bool raise = fn(
    x375 : @kernel.Term,
  ) -> Bool raise {
    let tm = x375
    @kernel.is_comb(tm) && @kernel.rator(tm) == pre_tm
  }
  let t376 = @term_syntax.parse_term("op_minus")
  let is_sub : (@kernel.Term) -> Bool raise = fn(
    x378 : @kernel.Term,
  ) -> Bool raise {
    ((x377 : @kernel.Term) => @basics.is_binop(t376, x377))(x378)
  }
  let is_div : (@kernel.Term) -> Bool raise = fn(
    x380 : @kernel.Term,
  ) -> Bool raise {
    ((x379 : @kernel.Term) => @basics.is_binop(div_tm, x379))(x380)
  }
  let is_mod : (@kernel.Term) -> Bool raise = fn(
    x382 : @kernel.Term,
  ) -> Bool raise {
    ((x381 : @kernel.Term) => @basics.is_binop(mod_tm, x381))(x382)
  }
  let is_divmod : (@kernel.Term) -> Bool raise = fn(
    x383 : @kernel.Term,
  ) -> Bool raise {
    let tm_1 = x383
    is_div(tm_1) || is_mod(tm_1)
  }
  let contains_quantifier : (@kernel.Term) -> Bool raise = (x386 : @kernel.Term) => {
    @lib.can(
      (x385 : @kernel.Term) => {
        @basics.find_term(
          fn(x384 : @kernel.Term) -> Bool raise {
            let t = x384
            @basics.is_forall(t) ||
            @basics.is_exists(t) ||
            @basics.is_uexists(t)
          },
          x385,
        )
      },
      x386,
    )
  }
  let beta2_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.rator_conv(@equal.beta_conv),
    @equal.beta_conv,
  )
  let pre_elim_thm_p_p = @equal.conv_rule(
    @equal.rand_conv(@canon.nnf_conv),
    @arith.pre_elim_thm(),
  )
  let sub_elim_thm_p_p = @equal.conv_rule(
    @equal.rand_conv(@canon.nnf_conv),
    @arith.sub_elim_thm(),
  )
  let divmod_elim_thm_p_p = @equal.conv_rule(
    @equal.rand_conv(@canon.nnf_conv),
    @arith.divmod_elim_thm(),
  )
  let t389 = @simp.rewrite_tac(
    @list.List([@arith.not_even(), @arith.not_odd()]),
  )
  let t387 = @equal.gsym(@arith.odd_exists())
  let t388 = @equal.gsym(@arith.even_exists())
  let t390 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@class.not_exists_thm()), t388, t387]),
    ),
    t389,
  )
  let pth_evenodd = @tactics.prove(
    @term_syntax.parse_term("EVEN((x : Num)) == (∀ y : Num, !(x == SUC(2 * y))) && ODD(x) == (∀ y : Num, !(x == 2 * y)) && !EVEN(x) == (∀ y : Num, !(x == 2 * y)) && !ODD(x) == (∀ y : Num, !(x == SUC(2 * y)))"),
    t390,
  )
  fn num_multiply_conv(x391 : Bool, x392 : @kernel.Term) -> @kernel.Thm raise {
    let pos = x391
    let tm_2 = x392
    if @basics.is_forall(tm_2) ||
      @basics.is_exists(tm_2) ||
      @basics.is_uexists(tm_2) {
      @equal.binder_conv((x393 : @kernel.Term) => num_multiply_conv(pos, x393))(
        tm_2,
      )
    } else if @basics.is_imp(tm_2) && contains_quantifier(tm_2) {
      @equal.comb2_conv(
        @equal.rand_conv((x394 : @kernel.Term) => num_multiply_conv(!pos, x394)),
        (x395 : @kernel.Term) => num_multiply_conv(pos, x395),
      )(tm_2)
    } else if (
        @basics.is_conj(tm_2) || @basics.is_disj(tm_2) || @bool.is_iff(tm_2)
      ) &&
      contains_quantifier(tm_2) {
      @equal.binop_conv((x396 : @kernel.Term) => num_multiply_conv(pos, x396))(
        tm_2,
      )
    } else if @basics.is_neg(tm_2) && !pos && contains_quantifier(tm_2) {
      @equal.rand_conv((x397 : @kernel.Term) => num_multiply_conv(!pos, x397))(
        tm_2,
      )
    } else {
      try {
        let t_2 = @basics.find_term(
          fn(x398 : @kernel.Term) -> Bool raise {
            let t_1 = x398
            is_pre(t_1) && @basics.free_in(t_1, tm_2)
          },
          tm_2,
        )
        let ty = @kernel.type_of(t_2)
        let v = @basics.genvar(ty)
        let p = @kernel.mk_abs(v, @basics.subst(@list.List([(v, t_2)]), tm_2))
        let th0 = if pos { pre_elim_thm_p_p } else { @arith.pre_elim_thm_p() }
        let th1 = @kernel.inst_rule(
          @list.List([(p, p_tm), (@kernel.rand(t_2), n_tm)]),
          th0,
        )
        let t399 = @equal.binder_conv(@equal.rand_conv(@equal.beta_conv))
        let th2 = @equal.conv_rule(
          @equal.comb2_conv(@equal.rand_conv(@equal.beta_conv), t399),
          th1,
        )
        @equal.conv_rule(
          @equal.rand_conv((x400 : @kernel.Term) => num_multiply_conv(pos, x400)),
          th2,
        )
      } catch {
        Failure(_) =>
          try {
            let t_4 = @basics.find_term(
              fn(x401 : @kernel.Term) -> Bool raise {
                let t_3 = x401
                is_sub(t_3) && @basics.free_in(t_3, tm_2)
              },
              tm_2,
            )
            let ty_1 = @kernel.type_of(t_4)
            let v_1 = @basics.genvar(ty_1)
            let p_1 = @kernel.mk_abs(
              v_1,
              @basics.subst(@list.List([(v_1, t_4)]), tm_2),
            )
            let th0_1 = if pos {
              sub_elim_thm_p_p
            } else {
              @arith.sub_elim_thm_p()
            }
            let t402 = (@kernel.rand(t_4), b_tm)
            let th1_1 = @kernel.inst_rule(
              @list.List([(p_1, p_tm), (@equal.lhand(t_4), a_tm), t402]),
              th0_1,
            )
            let t403 = @equal.binder_conv(@equal.rand_conv(@equal.beta_conv))
            let th2_1 = @equal.conv_rule(
              @equal.comb2_conv(@equal.rand_conv(@equal.beta_conv), t403),
              th1_1,
            )
            @equal.conv_rule(
              @equal.rand_conv((x404 : @kernel.Term) => {
                num_multiply_conv(pos, x404)
              }),
              th2_1,
            )
          } catch {
            Failure(_) =>
              try {
                let t_6 = @basics.find_term(
                  fn(x405 : @kernel.Term) -> Bool raise {
                    let t_5 = x405
                    is_divmod(t_5) && @basics.free_in(t_5, tm_2)
                  },
                  tm_2,
                )
                let x = @equal.lhand(t_6)
                let y = @kernel.rand(t_6)
                let dtm = @kernel.mk_comb(@kernel.mk_comb(div_tm, x), y)
                let mtm = @kernel.mk_comb(@kernel.mk_comb(mod_tm, x), y)
                let vd = @basics.genvar(@kernel.type_of(dtm))
                let vm = @basics.genvar(@kernel.type_of(mtm))
                let p_2 = @basics.list_mk_abs(
                  @list.List([vd, vm]),
                  @basics.subst(@list.List([(vd, dtm), (vm, mtm)]), tm_2),
                )
                let th0_2 = if pos {
                  divmod_elim_thm_p_p
                } else {
                  @arith.divmod_elim_thm_p()
                }
                let th1_2 = @kernel.inst_rule(
                  @list.List([(p_2, q_tm), (x, m_tm), (y, n_tm)]),
                  th0_2,
                )
                let t409 = @lib.funpow(
                  2,
                  fn(
                    x406 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    let s407 = @equal.binder_conv(x406)
                    fn(x408 : @kernel.Term) -> @kernel.Thm raise { s407(x408) }
                  },
                  @equal.rand_conv(beta2_conv),
                )
                let th2_2 = @equal.conv_rule(
                  @equal.comb2_conv(@equal.rand_conv(beta2_conv), t409),
                  th1_2,
                )
                @equal.conv_rule(
                  @equal.rand_conv((x410 : @kernel.Term) => {
                    num_multiply_conv(pos, x410)
                  }),
                  th2_2,
                )
              } catch {
                Failure(_) => @kernel.refl(tm_2)
                e => raise e
              }
            e => raise e
          }
        e => raise e
      }
    }
  }
  let t415 = @simp.gen_rewrite_conv(
    fn(
      x412 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s413 = @equal.once_depth_conv(x412)
      fn(x414 : @kernel.Term) -> @kernel.Thm raise { s413(x414) }
    },
    @list.List([pth_evenodd]),
  )
  num_simplify_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(@calc_num.num_reduce_conv, @canon.conds_celim_conv),
            @canon.nnf_conv,
          ),
          (x411 : @kernel.Term) => num_multiply_conv(true, x411),
        ),
        @calc_num.num_reduce_conv,
      ),
      t415,
    ),
  )
}

///|
let num_simplify_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "NUM_SIMPLIFY_CONV",
)

///|
/// `NUM_SIMPLIFY_CONV`
pub fn num_simplify_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_simplify_conv_c.get()(x)
}

///|
/// NUM_RING
fn step_3() -> Unit raise {
  let t421 = @simp.rewrite_tac(
    @list.List([
      @arith.eq_add_lcancel(),
      @arith.eq_add_lcancel_0(),
      @arith.mult_eq_0(),
    ]),
  )
  let t419 = @term_syntax.parse_term("(a : Num) + ((b : Num) + ((c : Num) + ((d : Num) + (e : Num)))) == a + (c + (e + (b + d)))")
  let t420 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.add_ac())(t419)]),
  )
  let t418 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
    ]),
  )
  let t422 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x416 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th = x416
          @simp.rewrite_tac(@list.List([th]))
        }),
        t418,
      ),
      t420,
    ),
    t421,
  )
  let num_integral_lemma = @tactics.prove(
    @term_syntax.parse_term("(w : Num) == (x : Num) + (d : Num) && (y : Num) == (z : Num) + (e : Num) → (w * y + x * z == w * z + x * y) == (w == x || y == z)"),
    t422,
  )
  let t435 = @meson.asm_meson_tac(
    @list.List([num_integral_lemma, @arith.add_sym(), @arith.mult_sym()]),
  )
  let t431 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t432 = @tactics.choose_then(fn(
    x428 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s429 = @tactics.subst1_tac(x428)
    fn(
      x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s429(x430)
    }
  })
  let t434 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x433 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      t432(t431(x433))
    }),
  )
  let t426 = @term_syntax.parse_term("(z : Num)")
  let t427 = @tactics.disj_cases_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(y : Num)"), t426]),
      @arith.le_cases(),
    ),
  )
  let t424 = @term_syntax.parse_term("(x : Num)")
  let t425 = @tactics.disj_cases_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(w : Num)"), t424]),
      @arith.le_cases(),
    ),
  )
  let t423 = @tactics.repeat_tac(@tactics.gen_tac)
  let t436 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@arith.mult_clauses(), @arith.eq_add_lcancel()]),
            ),
            t423,
          ),
          t425,
        ),
        t427,
      ),
      t434,
    ),
    t435,
  )
  let num_integral = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Num, 0 * x == 0) && (∀ x : Num, ∀ y : Num, ∀ z : Num, (x + y == x + z) == (y == z)) && (∀ w : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, (w * y + x * z == w * z + x * y) == (w == x || y == z))"),
    t436,
  )
  let t437 = @term_syntax.parse_term("EXP")
  let t438 = @basics.genvar(@kernel.bool_ty)
  let t439 = @term_syntax.parse_term("op_star")
  let t440 = @basics.genvar(@kernel.bool_ty)
  let t441 = @basics.genvar(@kernel.bool_ty)
  let t442 = @term_syntax.parse_term("op_plus")
  let rawring : (@kernel.Term) -> @kernel.Thm raise = ring(
    (
      @basics.dest_numeral,
      @nums.mk_numeral,
      @calc_num.num_eq_conv,
      @basics.genvar(@kernel.bool_ty),
      t442,
      t441,
      t440,
      t439,
      t438,
      t437,
      num_integral,
      @bool.truth(),
      @normalizer.num_normalize_conv,
    ),
  )
  let initconv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    num_simplify_conv,
    @simp.gen_rewrite_conv(
      fn(
        x443 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s444 = @equal.depth_conv(x443)
        fn(x445 : @kernel.Term) -> @kernel.Thm raise { s444(x445) }
      },
      @list.List([@arith.add1()]),
    ),
  )
  let t_tm = @term_syntax.parse_term("true")
  num_ring_c.set(fn(x446 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x446
    let th_1 = initconv(tm)
    if @kernel.rand(@kernel.concl(th_1)) == t_tm {
      th_1
    } else {
      let t447 = rawring(@kernel.rand(@kernel.concl(th_1)))
      @kernel.eq_mp(@equal.sym(th_1), t447)
    }
  })
}

///|
let num_ring_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_RING",
)

///|
/// `NUM_RING`
pub fn num_ring(x : @kernel.Term) -> @kernel.Thm raise {
  num_ring_c.get()(x)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
