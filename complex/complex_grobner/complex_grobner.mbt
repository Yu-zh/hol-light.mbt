// Translated from upstream Complex/complex_grobner.ml; edit this file directly.

///|
/// Complex/complex_grobner.ml:8
fn step_1() -> Unit raise {
  @complexnumbers.prioritize_complex(())
}

///|
/// `allpairs`
pub fn[TA, TB, TC] allpairs(x1 : (TC) -> ((TB) -> TA raise) raise, x2 : @list.List[TC], x3 : @list.List[TB]) -> @list.List[TA] raise {
  let f = x1
  let l1 = x2
  let l2 = x3
  @lib.itlist(fn(x10 : TC, x11 : @list.List[TA]) -> @list.List[TA] raise {
    (fn(x9 : (TB) -> TA raise) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      (fn(x4 : @list.List[TA]) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
        fn(x5 : @list.List[TA]) -> @list.List[TA] raise {
          x4.concat(x5)
        }
      })((fn(x8 : (TB) -> TA raise) -> @list.List[TA] raise {
        (fn(x6 : (TB) -> TA raise) -> ((@list.List[TB]) -> @list.List[TA] raise) raise {
          fn(x7 : @list.List[TB]) -> @list.List[TA] raise {
            @lib.map(x6, x7)
          }
        })(x8)(l2)
      })(x9))
    })(f(x10))(x11)
  }, l1, @list.List([]))
}

///|
/// `merge`
pub fn[TA] merge(x12 : (TA) -> ((TA) -> Bool raise) raise, x13 : @list.List[TA], x14 : @list.List[TA]) -> @list.List[TA] raise {
  let ord = x12
  let l1 = x13
  let l2 = x14
  match l1 {
    Empty => l2
    More(h1, tail=t1) => {
      match l2 {
        Empty => l1
        More(h2, tail=t2) => {
          if ord(h1)(h2) {
            merge(ord, t1, l2).prepend(h1)
          } else {
            merge(ord, l1, t2).prepend(h2)
          }
        }
      }
    }
  }
}

///|
/// `sort`
pub fn[TA] sort(x15 : (TA) -> ((TA) -> Bool raise) raise) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
  let ord = x15
  fn mergepairs(x17 : @list.List[@list.List[TA]], x18 : @list.List[@list.List[TA]]) -> @list.List[TA] raise {
    let l1 = x17
    let l2 = x18
    match (l1, l2) {
      (More(s, tail=Empty), Empty) => s
      (l, Empty) => mergepairs(@list.List([]), l)
      (l_1, More(s1, tail=Empty)) => mergepairs(l_1.prepend(s1), @list.List([]))
      (l_2, More(s1_1, tail=More(s2, tail=ss))) => mergepairs(l_2.prepend(merge(ord, s1_1, s2)), ss)
    }
  }
  fn(x19 : @list.List[TA]) -> @list.List[TA] raise {
    let l_3 = x19
    if @list.List::is_empty(l_3) {
      @list.List([])
    } else {
      mergepairs(@list.List([]), @lib.map(fn(x20 : TA) -> @list.List[TA] raise {
        let x = x20
        @list.List([x])
      }, l_3))
    }
  }
}

///|
/// `history`
pub(all) enum History {
  Start(Int64)
  Mmul((@num.Num, @list.List[Int64]), History)
  Add(History, History)
} derive(Eq, Debug)

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
    (Start(a0), Start(b0)) => {
      
      @lib.compare(a0, b0)
    }
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
/// `grob_var`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] grob_var(x21 : @list.List[TA], x22 : TA) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let vars = x21
  let tm = x22
  let res = @lib.map(fn(x23 : TA) -> Int64 raise {
    let i = x23
    if (i == tm) {
      1L
    } else {
      0L
    }
  }, vars)
  if @lib.exists(fn(x24 : Int64) -> Bool raise {
    let x = x24
    (x != 0L)
  }, res) {
    @list.List([(@num.num_of_int64(1L), res)])
  } else {
    raise Failure("grob_var")
  }
}

///|
/// grob_const
fn step_2() -> Unit raise {
  let cx_tm = @term_syntax.parse_term("Cx")
  grob_const_c.set(fn(x25 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
    let vars = x25
    fn(x26 : @kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let tm = x26
      try {
        let (l, r) = @kernel.dest_comb(tm)
        if (l == cx_tm) {
          let x = @calc_int.rat_of_term(r)
          if @num.eq_num(x, @num.num_of_int64(0L)) {
            @list.List([])
          } else {
            @list.List([(x, @lib.map(fn(x27 : @kernel.Term) -> Int64 raise {
              let v = x27
              0L
            }, vars))])
          }
        } else {
          raise Failure("")
        }
      } catch {
        Failure(_) => raise Failure("grob_const")
        e => raise e
      }
    }
  })
}

///|
let grob_const_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise] = @lib.Cell::new("grob_const")

///|
/// `grob_const`
pub fn grob_const(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
  (grob_const_c.get())(x)
}

///|
/// morder_lt
fn step_3() -> Unit raise {
  morder_lt_c.set(fn(x30 : @list.List[Int64]) -> ((@list.List[Int64]) -> Bool raise) raise {
    let m1 = x30
    fn(x31 : @list.List[Int64]) -> Bool raise {
      let m2 = x31
      let n1 = @lib.itlist(fn(x34 : Int64, x35 : Int64) -> Int64 raise {
        let s36 = (fn(x32 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x33 : Int64) -> Int64 raise {
            @lib.add63(x32, x33)
          }
        })(x34)
        s36(x35)
      }, m1, 0L)
      let n2 = @lib.itlist(fn(x39 : Int64, x40 : Int64) -> Int64 raise {
        let s41 = (fn(x37 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x38 : Int64) -> Int64 raise {
            @lib.add63(x37, x38)
          }
        })(x39)
        s41(x40)
      }, m2, 0L)
      ((n1 < n2) || ((n1 == n2) && lexorder_l(m1, m2)))
    }
  })
}

///|
let morder_lt_c : @lib.Cell[(@list.List[Int64]) -> ((@list.List[Int64]) -> Bool raise) raise] = @lib.Cell::new("morder_lt")

///|
/// `morder_lt`
pub fn morder_lt(x : @list.List[Int64]) -> ((@list.List[Int64]) -> Bool raise) raise {
  (morder_lt_c.get())(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] lexorder_l(x28 : @list.List[TA], x29 : @list.List[TA]) -> Bool raise {
  let l1 = x28
  let l2 = x29
  match (l1, l2) {
    (Empty, Empty) => false
    (More(x1, tail=o1), More(x2, tail=o2)) => ((@lib.compare(x1, x2) > 0) || ((x1 == x2) && lexorder_l(o1, o2)))
    _ => raise Failure("morder: inconsistent monomial lengths")
  }
}

///|
/// `morder_le`
pub fn morder_le(x42 : @list.List[Int64], x43 : @list.List[Int64]) -> Bool raise {
  let m1 = x42
  let m2 = x43
  (morder_lt(m1)(m2) || (m1 == m2))
}

///|
/// `morder_gt`
pub fn morder_gt(x44 : @list.List[Int64], x45 : @list.List[Int64]) -> Bool raise {
  let m1 = x44
  let m2 = x45
  morder_lt(m2)(m1)
}

///|
/// grob_neg
fn step_4() -> Unit raise {
  grob_neg_c.set((x47 : @list.List[(@num.Num, @list.List[Int64])]) => @lib.map(fn(x46 : (@num.Num, @list.List[Int64])) -> (@num.Num, @list.List[Int64]) raise {
    let (c, m) = x46
    (@num.minus_num(c), m)
  }, x47))
}

///|
let grob_neg_c : @lib.Cell[(@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise] = @lib.Cell::new("grob_neg")

///|
/// `grob_neg`
pub fn grob_neg(x : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  (grob_neg_c.get())(x)
}

///|
/// `grob_add`
pub fn grob_add(x48 : @list.List[(@num.Num, @list.List[Int64])], x49 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let l1 = x48
  let l2 = x49
  match (l1, l2) {
    (Empty, l2_1) => l2_1
    (l1_1, Empty) => l1_1
    (More((c1, m1), tail=o1), More((c2, m2), tail=o2)) => {
      if (m1 == m2) {
        let c = @num.add_num(c1, c2)
        let rest = grob_add(o1, o2)
        if @num.eq_num(c, @num.num_of_int64(0L)) {
          rest
        } else {
          rest.prepend((c, m1))
        }
      } else {
        if morder_lt(m2)(m1) {
          grob_add(o1, l2).prepend((c1, m1))
        } else {
          grob_add(l1, o2).prepend((c2, m2))
        }
      }
    }
  }
}

///|
/// `grob_sub`
pub fn grob_sub(x50 : @list.List[(@num.Num, @list.List[Int64])], x51 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let l1 = x50
  let l2 = x51
  grob_add(l1, grob_neg(l2))
}

///|
/// `grob_mmul`
pub fn grob_mmul(x52 : (@num.Num, @list.List[Int64]), x53 : (@num.Num, @list.List[Int64])) -> ((@num.Num, @list.List[Int64])) raise {
  let (c1, m1) = x52
  let (c2, m2) = x53
  let t59 = @lib.map2(fn(x56 : Int64, x57 : Int64) -> Int64 raise {
    let s58 = (fn(x54 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x55 : Int64) -> Int64 raise {
        @lib.add63(x54, x55)
      }
    })(x56)
    s58(x57)
  }, m1, m2)
  (@num.mult_num(c1, c2), t59)
}

///|
/// `grob_cmul`
pub fn grob_cmul(x60 : (@num.Num, @list.List[Int64]), x61 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let cm = x60
  let pol = x61
  @lib.map((x62 : (@num.Num, @list.List[Int64])) => grob_mmul(cm, x62), pol)
}

///|
/// `grob_mul`
pub fn grob_mul(x63 : @list.List[(@num.Num, @list.List[Int64])], x64 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let l1 = x63
  let l2 = x64
  match l1 {
    Empty => @list.List([])
    More(h1, tail=t1) => {
      let t65 = grob_mul(t1, l2)
      grob_add(grob_cmul(h1, l2), t65)
    }
  }
}

///|
/// `grob_pow`
pub fn[TA] grob_pow(x66 : @list.List[TA], x67 : @list.List[(@num.Num, @list.List[Int64])], x68 : Int64) -> @list.List[(@num.Num, @list.List[Int64])] raise {
  let vars = x66
  let l = x67
  let n = x68
  if (n < 0L) {
    raise Failure("grob_pow: negative power")
  } else {
    if (n == 0L) {
      let t70 = @lib.map(fn(x69 : TA) -> Int64 raise {
        let v = x69
        0L
      }, vars)
      @list.List([(@num.num_of_int64(1L), t70)])
    } else {
      grob_mul(l, grob_pow(vars, l, @lib.sub63(n, 1L)))
    }
  }
}

///|
/// `mdiv`
pub fn mdiv(x71 : (@num.Num, @list.List[Int64]), x72 : (@num.Num, @list.List[Int64])) -> ((@num.Num, @list.List[Int64])) raise {
  let (c1, m1) = x71
  let (c2, m2) = x72
  let t75 = @lib.map2(fn(x73 : Int64, x74 : Int64) -> Int64 raise {
    let n1 = x73
    let n2 = x74
    if (n1 < n2) {
      raise Failure("mdiv")
    } else {
      @lib.sub63(n1, n2)
    }
  }, m1, m2)
  (@num.div_num(c1, c2), t75)
}

///|
/// `mlcm`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC] mlcm(x76 : (TB, @list.List[TA]), x77 : (TC, @list.List[TA])) -> ((@num.Num, @list.List[TA])) raise {
  let (c1, m1) = x76
  let (c2, m2) = x77
  let t83 = @lib.map2(fn(x80 : TA, x81 : TA) -> TA raise {
    let s82 = (fn(x78 : TA) -> ((TA) -> TA raise) raise {
      fn(x79 : TA) -> TA raise {
        if (@lib.compare(x78, x79) >= 0) {
          x78
        } else {
          x79
        }
      }
    })(x80)
    s82(x81)
  }, m1, m2)
  (@num.num_of_int64(1L), t83)
}

///|
/// `reduce1`
pub fn reduce1(x84 : (@num.Num, @list.List[Int64]), x85 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@list.List[(@num.Num, @list.List[Int64])], History)) raise {
  let cm = x84
  let (pol, hpol) = x85
  match pol {
    Empty => raise Failure("reduce1")
    More(cm1, tail=cms) => {
      try {
        let (c, m) = mdiv(cm, cm1)
        let t86 = History::Mmul((@num.minus_num(c), m), hpol)
        (grob_cmul((@num.minus_num(c), m), cms), t86)
      } catch {
        Failure(_) => raise Failure("reduce1")
        e => raise e
      }
    }
  }
}

///|
/// `reduceb`
pub fn reduceb(x87 : (@num.Num, @list.List[Int64]), x88 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)]) -> ((@list.List[(@num.Num, @list.List[Int64])], History)) raise {
  let cm = x87
  let basis = x88
  @lib.tryfind(fn(x89 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
    let p = x89
    reduce1(cm, p)
  }, basis)
}

///|
/// `reduce`
pub fn reduce(x90 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], x91 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@list.List[(@num.Num, @list.List[Int64])], History)) raise {
  let basis = x90
  let (pol, hist) = x91
  match pol {
    Empty => (pol, hist)
    More(cm, tail=ptl) => {
      try {
        let (q, hnew) = reduceb(cm, basis)
        let t92 = History::Add(hnew, hist)
        reduce(basis, (grob_add(q, ptl), t92))
      } catch {
        Failure(_) => {
          let (q_1, hist_p) = reduce(basis, (ptl, hist))
          (q_1.prepend(cm), hist_p)
        }
        e => raise e
      }
    }
  }
}

///|
/// `orthogonal`
pub fn[TA] orthogonal(x93 : (TA, @list.List[Int64]), x94 : @list.List[(@num.Num, @list.List[Int64])], x95 : @list.List[(@num.Num, @list.List[Int64])]) -> Bool raise {
  let l = x93
  let p1 = x94
  let p2 = x95
  let t96 = @lib.hd(p2)
  (l.1 == grob_mmul(@lib.hd(p1), t96).1)
}

///|
/// `spoly`
pub fn spoly(x97 : (@num.Num, @list.List[Int64]), x98 : (@list.List[(@num.Num, @list.List[Int64])], History), x99 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@list.List[(@num.Num, @list.List[Int64])], History)) raise {
  let cm = x97
  let ph1 = x98
  let ph2 = x99
  match (ph1, ph2) {
    ((Empty, h), p) => (@list.List([]), h)
    (p_1, (Empty, h_1)) => (@list.List([]), h_1)
    ((More(cm1, tail=ptl1), his1), (More(cm2, tail=ptl2), his2)) => {
      let t101 = History::Mmul(mdiv((@num.minus_num(cm.0), cm.1), cm2), his2)
      let t102 = History::Add(History::Mmul(mdiv(cm, cm1), his1), t101)
      let t100 = grob_cmul(mdiv(cm, cm2), ptl2)
      (grob_sub(grob_cmul(mdiv(cm, cm1), ptl1), t100), t102)
    }
  }
}

///|
/// `monic`
pub fn[TA] monic(x103 : @list.List[(@num.Num, @list.List[TA])], x104 : History) -> ((@list.List[(@num.Num, @list.List[TA])], History)) raise {
  let (pol, hist) = (x103, x104)
  if @list.List::is_empty(pol) {
    (pol, hist)
  } else {
    let (c_p, m_p) = @lib.hd(pol)
    let t107 = @lib.map(fn(x106 : TA) -> Int64 raise {
      0L
    }, m_p)
    let t108 = History::Mmul((@num.div_num(@num.num_of_int64(1L), c_p), t107), hist)
    (@lib.map(fn(x105 : (@num.Num, @list.List[TA])) -> (@num.Num, @list.List[TA]) raise {
      let (c, m) = x105
      (@num.div_num(c, c_p), m)
    }, pol), t108)
  }
}

///|
/// `forder`
pub fn[TA, TB, TC, TD] forder(x109 : ((TA, @list.List[Int64]), TB), x110 : ((TC, @list.List[Int64]), TD)) -> Bool raise {
  let ((c1, m1), _) = x109
  let ((c2, m2), _) = x110
  morder_lt(m1)(m2)
}

///|
/// `poly_lt`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] poly_lt(x111 : @list.List[(@num.Num, TA)], x112 : @list.List[(@num.Num, TA)]) -> Bool raise {
  let p = x111
  let q = x112
  match (p, q) {
    (p_1, Empty) => false
    (Empty, q_1) => true
    (More((c1, m1), tail=o1), More((c2, m2), tail=o2)) => (@num.lt_num(c1, c2) || (@num.eq_num(c1, c2) && ((@lib.compare(m1, m2) < 0) || ((m1 == m2) && poly_lt(o1, o2)))))
  }
}

///|
/// `align`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] align(x113 : (@list.List[(@num.Num, TA)], TB), x114 : (@list.List[(@num.Num, TA)], TB)) -> (((@list.List[(@num.Num, TA)], TB), (@list.List[(@num.Num, TA)], TB))) raise {
  let ((p, hp), (q, hq)) = (x113, x114)
  if poly_lt(p, q) {
    ((p, hp), (q, hq))
  } else {
    ((q, hq), (p, hp))
  }
}

///|
/// `poly_eq`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] poly_eq(x115 : @list.List[(@num.Num, TA)], x116 : @list.List[(@num.Num, TA)]) -> Bool raise {
  let p1 = x115
  let p2 = x116
  @lib.forall2(fn(x117 : (@num.Num, TA), x118 : (@num.Num, TA)) -> Bool raise {
    let (c1, m1) = x117
    let (c2, m2) = x118
    (@num.eq_num(c1, c2) && (m1 == m2))
  }, p1, p2)
}

///|
/// `memx`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC : Eq + @lib.OCompare + @lib.OHash, TD, TE, TF] memx(x119 : ((@list.List[(@num.Num, TA)], TB), (@list.List[(@num.Num, TC)], TD)), x120 : @list.List[((@list.List[(@num.Num, TA)], TE), (@list.List[(@num.Num, TC)], TF))]) -> Bool raise {
  let ((p1, h1), (p2, h2)) = x119
  let ppairs = x120
  !@lib.exists(fn(x121 : ((@list.List[(@num.Num, TA)], TE), (@list.List[(@num.Num, TC)], TF))) -> Bool raise {
    let ((q1, _), (q2, _)) = x121
    (poly_eq(p1, q1) && poly_eq(p2, q2))
  }, ppairs)
}

///|
/// `criterion2`
pub fn[TA, TB, TC, TD] criterion2(x122 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], TA)], x123 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], TA), (@list.List[(@num.Num, @list.List[Int64])], TA))), x124 : @list.List[(TB, ((@list.List[(@num.Num, @list.List[Int64])], TC), (@list.List[(@num.Num, @list.List[Int64])], TD)))]) -> Bool raise {
  let basis = x122
  let (lcm, ((p1, h1), (p2, h2))) = x123
  let opairs = x124
  @lib.exists(fn(x125 : (@list.List[(@num.Num, @list.List[Int64])], TA)) -> Bool raise {
    let g = x125
    (!poly_eq(g.0, p1) && (!poly_eq(g.0, p2) && (if @lib.can((x126 : (@num.Num, @list.List[Int64])) => mdiv(lcm, x126), @lib.hd(g.0)) {
      let t128 = @lib.map(fn(x127 : (TB, ((@list.List[(@num.Num, @list.List[Int64])], TC), (@list.List[(@num.Num, @list.List[Int64])], TD)))) -> ((@list.List[(@num.Num, @list.List[Int64])], TC), (@list.List[(@num.Num, @list.List[Int64])], TD)) raise {
        x127.1
      }, opairs)
      if !memx(align(g, (p1, h1)), t128) {
        let t130 = @lib.map(fn(x129 : (TB, ((@list.List[(@num.Num, @list.List[Int64])], TC), (@list.List[(@num.Num, @list.List[Int64])], TD)))) -> ((@list.List[(@num.Num, @list.List[Int64])], TC), (@list.List[(@num.Num, @list.List[Int64])], TD)) raise {
          x129.1
        }, opairs)
        !memx(align(g, (p2, h2)), t130)
      } else {
        false
      }
    } else {
      false
    })))
  }, basis)
}

///|
/// `constant_poly`
pub fn[TA] constant_poly(x131 : @list.List[(TA, @list.List[Int64])]) -> Bool raise {
  let p = x131
  ((Int::to_int64(@lib.length(p)) == 1L) && @lib.forall(fn(x132 : Int64) -> Bool raise {
    (0L == x132)
  }, @lib.hd(p).1))
}

///|
/// `grobner`
pub fn grobner(x133 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], x134 : @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], x135 : @list.List[((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))]) -> ((@list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)])) raise {
  let histories = x133
  let basis = x134
  let pairs = x135
  let t136 = (" basis elements and " + (Int64::to_string(Int::to_int64(@lib.length(pairs))) + " critical pairs"))
  @pp.std_formatter.print_string((Int64::to_string(Int::to_int64(@lib.length(basis))) + t136))
  {
    @pp.std_formatter.print_newline()
  }
  match pairs {
    Empty => (@lib.rev(histories), basis)
    More((l, (p1, p2)), tail=opairs) => {
      let t137 = reduce(basis, spoly(l, p1, p2))
      let (sp, hist) = monic(t137.0, t137.1)
      if (@list.List::is_empty(sp) || criterion2(basis, (l, (p1, p2)), opairs)) {
        grobner(histories, basis, opairs)
      } else {
        let sph = (sp, History::Start(Int::to_int64(@lib.length(histories))))
        if constant_poly(sp) {
          grobner(histories.prepend((sp, hist)), basis.prepend(sph), @list.List([]))
        } else {
          let rawcps = @lib.map(fn(x138 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History))) raise {
            let p = x138
            let t140 = align(p, sph)
            let t139 = @lib.hd(sp)
            (mlcm(@lib.hd(p.0), t139), t140)
          }, basis)
          let newcps = @lib.filter(fn(x141 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise {
            let (l_1, (p_1, q)) = x141
            !orthogonal(l_1, p_1.0, q.0)
          }, rawcps)
          grobner(histories.prepend((sp, hist)), basis.prepend(sph), merge(fn(x142 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> ((((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise) raise {
            fn(x143 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise {
              forder(x142, x143)
            }
          }, opairs, sort(fn(x144 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> ((((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise) raise {
            fn(x145 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise {
              forder(x144, x145)
            }
          })(newcps)))
        }
      }
    }
  }
}

///|
/// `groebner`
pub fn groebner(x146 : @list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> ((@list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)])) raise {
  let pols = x146
  let npols = @lib.map2(fn(x147 : @list.List[(@num.Num, @list.List[Int64])], x148 : Int64) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
    let p = x147
    let n = x148
    (p, History::Start(n))
  }, pols, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(pols)), 1L)))
  let phists = @lib.filter(fn(x149 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> Bool raise {
    let (p_1, _) = x149
    !@list.List::is_empty(p_1)
  }, npols)
  let bas0 = @lib.map(fn(x150 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
    monic(x150.0, x150.1)
  }, phists)
  let t153 = @lib.sub63(@lib.mul63(2L, Int::to_int64(@lib.length(bas0))), 1L)
  let bas = @lib.map2(fn(x151 : (@list.List[(@num.Num, @list.List[Int64])], History), x152 : Int64) -> (@list.List[(@num.Num, @list.List[Int64])], History) raise {
    let (p_2, h) = x151
    let n_1 = x152
    (p_2, History::Start(n_1))
  }, bas0, @lib.range(Int::to_int64(@lib.length(bas0)), t153))
  let prs0 = allpairs(fn(x154 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> (((@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)) raise) raise {
    let x = x154
    fn(x155 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)) raise {
      let y = x155
      (x, y)
    }
  }, bas, bas)
  let prs1 = @lib.filter(fn(x156 : ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History))) -> Bool raise {
    let ((x_1, _), (y_1, _)) = x156
    poly_lt(x_1, y_1)
  }, prs0)
  let prs2 = @lib.map(fn(x157 : ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History))) -> ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History))) raise {
    let (p_3, q) = x157
    let t158 = @lib.hd(q.0)
    (mlcm(@lib.hd(p_3.0), t158), (p_3, q))
  }, prs1)
  let prs3 = @lib.filter(fn(x159 : ((@num.Num, @list.List[Int64]), ((@list.List[(@num.Num, @list.List[Int64])], History), (@list.List[(@num.Num, @list.List[Int64])], History)))) -> Bool raise {
    let (l, (p_4, q_1)) = x159
    !orthogonal(l, p_4.0, q_1.0)
  }, prs2)
  let t161 = @lib.mergesort(forder, prs3)
  let t160 = @lib.rev(phists)
  grobner(@lib.rev(bas0).concat(t160), bas, t161)
}

///|
/// gr'o'bner
fn step_5() -> Unit raise {
  gr_po_pbner_c.set(groebner)
}

///|
let gr_po_pbner_c : @lib.Cell[(@list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> (@list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)]) raise] = @lib.Cell::new("gr'o'bner")

///|
/// `gr'o'bner`
pub fn gr_po_pbner(x : @list.List[@list.List[(@num.Num, @list.List[Int64])]]) -> ((@list.List[(@list.List[(@num.Num, @list.List[Int64])], History)], @list.List[(@list.List[(@num.Num, @list.List[Int64])], History)])) raise {
  (gr_po_pbner_c.get())(x)
}

///|
/// grobify_term
fn step_6() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("complex_neg")
  let add_tm = @term_syntax.parse_term("complex_add")
  let sub_tm = @term_syntax.parse_term("complex_sub")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let pow_tm = @term_syntax.parse_term("complex_pow")
  fn grobify_term_1(x162 : @list.List[@kernel.Term], x163 : @kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise {
    let vars = x162
    let tm = x163
    try {
      grob_var(vars, tm)
    } catch {
      Failure(_) => {
        try {
          grob_const(vars)(tm)
        } catch {
          Failure(_) => {
            let (lop, r) = @kernel.dest_comb(tm)
            if (lop == neg_tm) {
              grob_neg(grobify_term_1(vars, r))
            } else {
              let (op, l) = @kernel.dest_comb(lop)
              if (op == pow_tm) {
                let t164 = @nums.dest_small_numeral(r)
                grob_pow(vars, grobify_term_1(vars, l), t164)
              } else {
                let t171 = grobify_term_1(vars, r)
                let t172 = grobify_term_1(vars, l)
                (if (op == add_tm) {
                  fn(x165 : @list.List[(@num.Num, @list.List[Int64])]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
                    fn(x166 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                      grob_add(x165, x166)
                    }
                  }
                } else {
                  if (op == sub_tm) {
                    fn(x167 : @list.List[(@num.Num, @list.List[Int64])]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
                      fn(x168 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                        grob_sub(x167, x168)
                      }
                    }
                  } else {
                    if (op == mul_tm) {
                      fn(x169 : @list.List[(@num.Num, @list.List[Int64])]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
                        fn(x170 : @list.List[(@num.Num, @list.List[Int64])]) -> @list.List[(@num.Num, @list.List[Int64])] raise {
                          grob_mul(x169, x170)
                        }
                      }
                    } else {
                      raise Failure("unknown term")
                    }
                  }
                })(t172)(t171)
              }
            }
          }
          e => raise e
        }
      }
      e => raise e
    }
  }
  grobify_term_c.set(fn(x173 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
    let vars_1 = x173
    fn(x174 : @kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let tm_1 = x174
      try {
        grobify_term_1(vars_1, tm_1)
      } catch {
        Failure(_) => raise Failure("grobify_term")
        e => raise e
      }
    }
  })
}

///|
let grobify_term_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise] = @lib.Cell::new("grobify_term")

///|
/// `grobify_term`
pub fn grobify_term(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
  (grobify_term_c.get())(x)
}

///|
/// grobvars
fn step_7() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("complex_neg")
  let add_tm = @term_syntax.parse_term("complex_add")
  let sub_tm = @term_syntax.parse_term("complex_sub")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let pow_tm = @term_syntax.parse_term("complex_pow")
  fn grobvars_1(x175 : @kernel.Term, x176 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let tm = x175
    let acc = x176
    if @complexnumbers.is_complex_const(tm) {
      acc
    } else {
      if !@kernel.is_comb(tm) {
        acc.prepend(tm)
      } else {
        let (lop, r) = @kernel.dest_comb(tm)
        if (lop == neg_tm) {
          grobvars_1(r, acc)
        } else {
          if !@kernel.is_comb(lop) {
            acc.prepend(tm)
          } else {
            let (op, l) = @kernel.dest_comb(lop)
            if (op == pow_tm) {
              grobvars_1(l, acc)
            } else {
              if ((op == mul_tm) || ((op == sub_tm) || (op == add_tm))) {
                grobvars_1(l, grobvars_1(r, acc))
              } else {
                acc.prepend(tm)
              }
            }
          }
        }
      }
    }
  }
  grobvars_c.set(fn(x177 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    let tm_1 = x177
    @lib.setify(grobvars_1(tm_1, @list.List([])))
  })
}

///|
let grobvars_c : @lib.Cell[(@kernel.Term) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("grobvars")

///|
/// `grobvars`
pub fn grobvars(x : @kernel.Term) -> @list.List[@kernel.Term] raise {
  (grobvars_c.get())(x)
}

///|
/// grobify_equations
fn step_8() -> Unit raise {
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  let sub_tm = @term_syntax.parse_term("complex_sub")
  let complex_ty = @term_syntax.parse_type("Complex")
  let grobify_equation : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise = fn(x178 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise) raise {
    let vars = x178
    fn(x179 : @kernel.Term) -> @list.List[(@num.Num, @list.List[Int64])] raise {
      let tm = x179
      let (l, r) = @kernel.dest_eq(tm)
      if (r != zero_tm) {
        let t180 = @kernel.mk_comb(@kernel.mk_comb(sub_tm, l), r)
        grobify_term(vars)(t180)
      } else {
        grobify_term(vars)(l)
      }
    }
  }
  grobify_equations_c.set(fn(x181 : @kernel.Term) -> (@list.List[@kernel.Term], @list.List[@list.List[(@num.Num, @list.List[Int64])]]) raise {
    let tm_1 = x181
    let cjs = @basics.conjuncts(tm_1)
    let rawvars = @lib.itlist(fn(x182 : @kernel.Term, x183 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
      let eq = x182
      let acc = x183
      let (l_1, r_1) = @kernel.dest_eq(eq)
      let t184 = grobvars(r_1)
      @lib.union(@lib.union(grobvars(l_1), t184), acc)
    }, cjs, @list.List([]))
    let vars_1 = sort(fn(x185 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
      let x = x185
      fn(x186 : @kernel.Term) -> Bool raise {
        let y = x186
        (@lib.compare(x, y) < 0)
      }
    })(rawvars)
    (vars_1, @lib.map(grobify_equation(vars_1), cjs))
  })
}

///|
let grobify_equations_c : @lib.Cell[(@kernel.Term) -> (@list.List[@kernel.Term], @list.List[@list.List[(@num.Num, @list.List[Int64])]]) raise] = @lib.Cell::new("grobify_equations")

///|
/// `grobify_equations`
pub fn grobify_equations(x : @kernel.Term) -> ((@list.List[@kernel.Term], @list.List[@list.List[(@num.Num, @list.List[Int64])]])) raise {
  (grobify_equations_c.get())(x)
}

///|
/// `string_of_monomial`
pub fn string_of_monomial(x187 : @list.List[String], x188 : (@num.Num, @list.List[Int64])) -> String raise {
  let vars = x187
  let (c, m) = x188
  let xns = @lib.filter(fn(x189 : (String, Int64)) -> Bool raise {
    let (x, y) = x189
    (y != 0L)
  }, @lib.map2(fn(x190 : String, x191 : Int64) -> (String, Int64) raise {
    let x_1 = x190
    let y_1 = x191
    (x_1, y_1)
  }, vars, m))
  let xnstrs = @lib.map(fn(x192 : (String, Int64)) -> String raise {
    let (x_2, n) = x192
    (x_2 + (if (n == 1L) {
      ""
    } else {
      ("^" + Int64::to_string(n))
    }))
  }, xns)
  if @list.List::is_empty(xns) {
    @num.string_of_num(c)
  } else {
    let basstr = if @num.eq_num(c, @num.num_of_int64(1L)) {
      ""
    } else {
      (@num.string_of_num(c) + " * ")
    }
    (basstr + @lib.end_itlist(fn(x193 : String, x194 : String) -> String raise {
      let s = x193
      let t = x194
      (s + (" * " + t))
    }, xnstrs))
  }
}

///|
/// `string_of_polynomial`
pub fn string_of_polynomial(x195 : @list.List[String], x196 : @list.List[(@num.Num, @list.List[Int64])]) -> String raise {
  let vars = x195
  let l = x196
  if @list.List::is_empty(l) {
    "0"
  } else {
    @lib.end_itlist(fn(x197 : String, x198 : String) -> String raise {
      let s = x197
      let t = x198
      (s + (" + " + t))
    }, @lib.map((x199 : (@num.Num, @list.List[Int64])) => string_of_monomial(vars, x199), l))
  }
}

///|
/// `resolve_proof`
pub fn[TA] resolve_proof(x200 : @list.List[TA], x201 : History) -> @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])] raise {
  let vars = x200
  let prf = x201
  match prf {
    History::Start(n) => {
      let t203 = @lib.map(fn(x202 : TA) -> Int64 raise {
        0L
      }, vars)
      @list.List([(n, @list.List([(@num.num_of_int64(1L), t203)]))])
    }
    History::Mmul(pol, lin) => {
      let lis = resolve_proof(vars, lin)
      @lib.map(fn(x204 : (Int64, @list.List[(@num.Num, @list.List[Int64])])) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
        let (n_1, p) = x204
        (n_1, grob_cmul(pol, p))
      }, lis)
    }
    History::Add(lin1, lin2) => {
      let lis1 = resolve_proof(vars, lin1)
      let lis2 = resolve_proof(vars, lin2)
      let t207 = @lib.map(fn(x206 : (Int64, @list.List[(@num.Num, @list.List[Int64])])) -> Int64 raise {
        x206.0
      }, lis2)
      let dom = @lib.setify(@lib.union(@lib.map(fn(x205 : (Int64, @list.List[(@num.Num, @list.List[Int64])])) -> Int64 raise {
        x205.0
      }, lis1), t207))
      @lib.map(fn(x208 : Int64) -> (Int64, @list.List[(@num.Num, @list.List[Int64])]) raise {
        let n_2 = x208
        let a = try {
          @lib.assoc(n_2, lis1)
        } catch {
          Failure(_) => @list.List([])
          e => raise e
        }
        let b = try {
          @lib.assoc(n_2, lis2)
        } catch {
          Failure(_) => @list.List([])
          e => raise e
        }
        (n_2, grob_add(a, b))
      }, dom)
    }
  }
}

///|
/// holify_polynomial
fn step_9() -> Unit raise {
  let complex_ty = @term_syntax.parse_type("Complex")
  let pow_tm = @term_syntax.parse_term("complex_pow")
  let t209 = @term_syntax.parse_term("complex_mul")
  let mk_mul : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x212 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x213 : @kernel.Term) -> @kernel.Term raise {
      ((x210 : @kernel.Term, x211 : @kernel.Term) => @basics.mk_binop(t209, x210, x211))(x212, x213)
    }
  }
  let t214 = @term_syntax.parse_term("complex_add")
  let mk_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x217 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x218 : @kernel.Term) -> @kernel.Term raise {
      ((x215 : @kernel.Term, x216 : @kernel.Term) => @basics.mk_binop(t214, x215, x216))(x217, x218)
    }
  }
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  let add_tm = @term_syntax.parse_term("complex_add")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let t220 = @term_syntax.parse_term("Cx")
  let complex_term_of_rat : (@num.Num) -> @kernel.Term raise = fn(x222 : @num.Num) -> @kernel.Term raise {
    ((x221 : @kernel.Term) => @lib.curry(fn(x219 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @kernel.mk_comb(x219.0, x219.1)
    }, t220, x221))(@calc_int.term_of_rat(x222))
  }
  let holify_varpow : ((@kernel.Term, Int64)) -> @kernel.Term raise = fn(x223 : (@kernel.Term, Int64)) -> @kernel.Term raise {
    let (v, n) = x223
    if (n == 1L) {
      v
    } else {
      @basics.list_mk_comb(pow_tm, @list.List([v, @nums.mk_small_numeral(n)]))
    }
  }
  let holify_monomial : (@list.List[@kernel.Term]) -> (((@num.Num, @list.List[Int64])) -> @kernel.Term raise) raise = fn(x224 : @list.List[@kernel.Term]) -> (((@num.Num, @list.List[Int64])) -> @kernel.Term raise) raise {
    let vars = x224
    fn(x225 : (@num.Num, @list.List[Int64])) -> @kernel.Term raise {
      let (c, m) = x225
      let xps = @lib.map(holify_varpow, @lib.filter(fn(x226 : (@kernel.Term, Int64)) -> Bool raise {
        let (_, n_1) = x226
        (n_1 != 0L)
      }, @lib.zip(vars, m)))
      @lib.end_itlist(fn(x227 : @kernel.Term, x228 : @kernel.Term) -> @kernel.Term raise {
        let s229 = mk_mul(x227)
        s229(x228)
      }, xps.prepend(complex_term_of_rat(c)))
    }
  }
  let holify_polynomial_1 : (@list.List[@kernel.Term]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise) raise = fn(x230 : @list.List[@kernel.Term]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise) raise {
    let vars_1 = x230
    fn(x231 : @list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise {
      let p = x231
      if @list.List::is_empty(p) {
        zero_tm
      } else {
        @lib.end_itlist(fn(x232 : @kernel.Term, x233 : @kernel.Term) -> @kernel.Term raise {
          let s234 = mk_add(x232)
          s234(x233)
        }, @lib.map(holify_monomial(vars_1), p))
      }
    }
  }
  holify_polynomial_c.set(holify_polynomial_1)
}

///|
let holify_polynomial_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise) raise] = @lib.Cell::new("holify_polynomial")

///|
/// `holify_polynomial`
pub fn holify_polynomial(x : @list.List[@kernel.Term]) -> ((@list.List[(@num.Num, @list.List[Int64])]) -> @kernel.Term raise) raise {
  (holify_polynomial_c.get())(x)
}

///|
/// dependencies
fn step_10() -> Unit raise {
  fn dependencies_1(x235 : History, x236 : @list.List[Int64]) -> @list.List[Int64] raise {
    let prf = x235
    let acc = x236
    match prf {
      History::Start(n) => acc.prepend(n)
      History::Mmul(pol, lin) => dependencies_1(lin, acc)
      History::Add(lin1, lin2) => dependencies_1(lin1, dependencies_1(lin2, acc))
    }
  }
  dependencies_c.set(fn(x237 : History) -> @list.List[Int64] raise {
    let prf_1 = x237
    @lib.setify(dependencies_1(prf_1, @list.List([])))
  })
}

///|
let dependencies_c : @lib.Cell[(History) -> @list.List[Int64] raise] = @lib.Cell::new("dependencies")

///|
/// `dependencies`
pub fn dependencies(x : History) -> @list.List[Int64] raise {
  (dependencies_c.get())(x)
}

///|
/// `involved`
pub fn involved(x238 : @list.List[@list.List[Int64]], x239 : @list.List[Int64], x240 : @list.List[Int64]) -> @list.List[Int64] raise {
  let deps = x238
  let sofar = x239
  let todo = x240
  match todo {
    Empty => sort(fn(x241 : Int64) -> ((Int64) -> Bool raise) raise {
      fn(x242 : Int64) -> Bool raise {
        (x241 < x242)
      }
    })(sofar)
    More(h, tail=hs) => {
      if @lib.mem(h, sofar) {
        involved(deps, sofar, hs)
      } else {
        involved(deps, sofar.prepend(h), @lib.el(@lib.int63_to_int(h), deps).concat(hs))
      }
    }
  }
}

///|
/// GROBNER_REFUTE
fn step_11() -> Unit raise {
  let add_tm = @term_syntax.parse_term("complex_add")
  let mul_tm = @term_syntax.parse_term("complex_mul")
  let apply_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@cpoly.simple_complex_arith(@term_syntax.parse_term("(x : Complex) == (y : Complex) → x + Cx(-real_of_num(1)) * (y + Cx(real_of_num(1))) == Cx(real_of_num(0)) → false")))
  let mk_add : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x243 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1 = x243
    fn(x244 : @kernel.Thm) -> @kernel.Thm raise {
      let th2 = x244
      @kernel.mk_comb_rule(@equal.ap_term(add_tm, th1), th2)
    }
  }
  fn holify_lincombs(x245 : @list.List[@kernel.Term], x246 : @list.List[@kernel.Thm], x247 : @list.List[@list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])]]) -> @list.List[@kernel.Thm] raise {
    let vars = x245
    let cjs = x246
    let prfs = x247
    match prfs {
      Empty => cjs
      More(p, tail=ps) => {
        if @list.List::is_empty(p) {
          holify_lincombs(vars, cjs.concat(@list.List([@bool.truth()])), ps)
        } else {
          let holis = @lib.map(fn(x248 : (Int64, @list.List[(@num.Num, @list.List[Int64])])) -> (Int64, @kernel.Term) raise {
            let (n, q) = x248
            (n, holify_polynomial(vars)(q))
          }, p)
          let ths = @lib.map(fn(x249 : (Int64, @kernel.Term)) -> @kernel.Thm raise {
            let (n_1, m) = x249
            let t250 = @lib.el(@lib.int63_to_int(n_1), cjs)
            @equal.ap_term(@kernel.mk_comb(mul_tm, m), t250)
          }, holis)
          let t254 = @lib.end_itlist(fn(x251 : @kernel.Thm, x252 : @kernel.Thm) -> @kernel.Thm raise {
            let s253 = mk_add(x251)
            s253(x252)
          }, ths)
          let th = @equal.conv_rule(@equal.binop_conv(@complexnumbers.complex_poly_conv), t254)
          holify_lincombs(vars, cjs.concat(@list.List([th])), ps)
        }
      }
    }
  }
  grobner_refute_c.set(fn(x255 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x255
    let (vars_1, pols) = grobify_equations(tm)
    let (prfs_1, gb) = groebner(pols)
    let (_, prf) = @lib.find(fn(x256 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> Bool raise {
      let (p_1, h) = x256
      ((Int::to_int64(@lib.length(p_1)) == 1L) && @lib.forall(fn(x257 : Int64) -> Bool raise {
        (0L == x257)
      }, @lib.hd(p_1).1))
    }, gb)
    let deps = @lib.map(fn(x259 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> @list.List[Int64] raise {
      dependencies((fn(x258 : (@list.List[(@num.Num, @list.List[Int64])], History)) -> History raise {
        x258.1
      })(x259))
    }, prfs_1)
    let depl = dependencies(prf)
    let need = involved(deps, @list.List([]), depl)
    let pprfs = @lib.map2(fn(x260 : (@list.List[(@num.Num, @list.List[Int64])], History), x261 : Int64) -> @list.List[(Int64, @list.List[(@num.Num, @list.List[Int64])])] raise {
      let p_2 = x260
      let n_2 = x261
      if @lib.mem(n_2, need) {
        resolve_proof(vars_1, p_2.1)
      } else {
        @list.List([])
      }
    }, prfs_1, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(prfs_1)), 1L)))
    let ppr = resolve_proof(vars_1, prf)
    let ths_1 = @bool.conjuncts_rule(@kernel.assume_rule(tm))
    let th_1 = @lib.last(holify_lincombs(vars_1, ths_1, @lib.chop_list(@lib.length(ths_1), pprfs.concat(@list.List([ppr]))).1))
    @equal.conv_rule(@cpoly.complex_rat_eq_conv, th_1)
  })
}

///|
let grobner_refute_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("GROBNER_REFUTE")

///|
/// `GROBNER_REFUTE`
pub fn grobner_refute(x : @kernel.Term) -> @kernel.Thm raise {
  (grobner_refute_c.get())(x)
}

///|
/// COMPLEX_ARITH
fn step_12() -> Unit raise {
  let pth0 = @cpoly.simple_complex_arith(@term_syntax.parse_term("((x : Complex) == (y : Complex)) == (x - y == Cx(real_of_num(0)))"))
  let t263 = @tactics.conv_tac((x262 : @kernel.Term) => @lib.time(@quelim.full_complex_quelim_conv, x262))
  let pth1 = @tactics.prove(@term_syntax.parse_term("∀ x : Complex, !(x == Cx(real_of_num(0))) == (∃ z : Complex, z * x + Cx(real_of_num(1)) == Cx(real_of_num(0)))"), t263)
  let t265 = @tactics.conv_tac((x264 : @kernel.Term) => @lib.time(@quelim.full_complex_quelim_conv, x264))
  let pth2a = @tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, ∀ u : Complex, ∀ v : Complex, (!(x == y) || !(u == v)) == (∃ w : Complex, ∃ z : Complex, w * (x - y) + (z * (u - v) + Cx(real_of_num(1))) == Cx(real_of_num(0)))"), t265)
  let t267 = @tactics.conv_tac((x266 : @kernel.Term) => @lib.time(@quelim.full_complex_quelim_conv, x266))
  let pth2b = @tactics.prove(@term_syntax.parse_term("∀ x : Complex, ∀ y : Complex, !(x == y) == (∃ z : Complex, z * (x - y) + Cx(real_of_num(1)) == Cx(real_of_num(0)))"), t267)
  let pth3 = @class.taut(@term_syntax.parse_term("((p : Bool) → false) → !(q : Bool) == p → q"))
  let gen_prenex_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s269 = @equal.redepth_conv(x268)
    fn(x270 : @kernel.Term) -> @kernel.Thm raise {
      s269(x270)
    }
  }, @list.List([@theorems.and_forall_thm(), @theorems.left_and_forall_thm(), @theorems.right_and_forall_thm(), @class.left_or_forall_thm(), @class.right_or_forall_thm(), @theorems.or_exists_thm(), @theorems.left_or_exists_thm(), @theorems.right_or_exists_thm(), @theorems.left_and_exists_thm(), @theorems.right_and_exists_thm()]))
  let t283 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t287 = @simp.gen_rewrite_conv(fn(x282 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x282
  }, @list.List([pth0]))
  let t289 = @equal.once_depth_conv(fn(x288 : @kernel.Term) -> @kernel.Thm raise {
    t287(((x286 : @kernel.Term) => @lib.check(fn(x285 : @kernel.Term) -> Bool raise {
      (fn(x284 : @kernel.Term) -> Bool raise {
        (t283 != x284)
      })(@kernel.rand(x285))
    }, x286))(x288))
  })
  let t281 = @simp.gen_rewrite_conv(fn(x278 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s279 = @equal.once_depth_conv(x278)
    fn(x280 : @kernel.Term) -> @kernel.Thm raise {
      s279(x280)
    }
  }, @list.List([pth2b]))
  let t277 = @simp.gen_rewrite_conv(fn(x274 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s275 = @equal.once_depth_conv(x274)
    fn(x276 : @kernel.Term) -> @kernel.Thm raise {
      s275(x276)
    }
  }, @list.List([pth2a]))
  let initial_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@canon.nnf_conv, @simp.gen_rewrite_conv(fn(x271 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s272 = @equal.once_depth_conv(x271)
    fn(x273 : @kernel.Term) -> @kernel.Thm raise {
      s272(x273)
    }
  }, @list.List([pth1]))), t277), t281), t289), gen_prenex_conv), @canon.dnf_conv)
  complex_arith_c.set(fn(x290 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x290
    let avs = @kernel.frees(tm)
    let tm_p = @bool.list_mk_forall(avs, tm)
    let th1 = initial_conv(@bool.mk_neg(tm_p))
    let (evs, bod) = @basics.strip_exists(@kernel.rand(@kernel.concl(th1)))
    if @basics.is_forall(bod) {
      raise Failure("COMPLEX_ARITH: non-universal formula")
    } else {
      let djs = @basics.disjuncts(bod)
      let th2 = @lib.end_itlist(@bool.simple_disj_cases, @lib.map(grobner_refute, djs))
      let th3 = @lib.itlist(@bool.simple_choose, evs, th2)
      let t291 = @bool.disch_all(th3)
      @bool.specl(avs, @drule.match_mp(@drule.match_mp(pth3)(t291))(th1))
    }
  })
}

///|
let complex_arith_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_ARITH")

///|
/// `COMPLEX_ARITH`
pub fn complex_arith(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_arith_c.get())(x)
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
}
