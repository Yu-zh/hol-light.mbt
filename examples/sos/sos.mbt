// Translated from upstream Examples/sos.ml; edit this file directly.

///|
/// Examples/sos.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// debugging
fn step_2() -> Unit raise {
  debugging_c.set(Ref::{ val: false })
}

///|
let debugging_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("debugging")

///|
/// `debugging`
pub fn debugging() -> Ref[Bool] {
  debugging_c.get()
}

///|
/// `exception Sanity`
pub(all) suberror Sanity {
  Sanity
}

///|
/// `exception Unsolvable`
pub(all) suberror Unsolvable {
  Unsolvable
}

///|
/// `exception Csdp_error`
pub(all) suberror Csdp_error {
  Csdp_error(Int64)
}

///|
/// decimalize
fn step_3() -> Unit raise {
  fn normalize(x1 : @num.Num) -> Int64 raise {
    let y = x1
    let t2 = @num.num_of_int64(10L)
    let t3 = @num.div_num(@num.num_of_int64(1L), t2)
    if @num.lt_num(@num.abs_num(y), t3) {
      @lib.sub63(normalize(@num.mult_num(@num.num_of_int64(10L), y)), 1L)
    } else {
      let t4 = @num.num_of_int64(1L)
      if @num.ge_num(@num.abs_num(y), t4) {
        @lib.add63(normalize(@num.div_num(y, @num.num_of_int64(10L))), 1L)
      } else {
        0L
      }
    }
  }
  decimalize_c.set(fn(x5 : Int64) -> ((@num.Num) -> String raise) raise {
    let d = x5
    fn(x6 : @num.Num) -> String raise {
      let x = x6
      if @num.eq_num(x, @num.num_of_int64(0L)) {
        "0.0"
      } else {
        let y_1 = @num.abs_num(x)
        let e = normalize(y_1)
        let t7 = @num.num_of_int64(1L)
        let z = @num.add_num(@num.mult_num(@num.pow10(@lib.int63_to_int(@lib.neg63(e))), y_1), t7)
        let k = @num.round_num(@num.mult_num(@num.pow10(@lib.int63_to_int(d)), z))
        let t8 = if (e == 0L) {
          ""
        } else {
          ("e" + Int64::to_string(e))
        }
        let t9 = (@lib.implode(@lib.tl(@lib.explode(@num.string_of_num(k)))) + t8)
        ((if @num.lt_num(x, @num.num_of_int64(0L)) {
          "-0."
        } else {
          "0."
        }) + t9)
      }
    }
  })
}

///|
let decimalize_c : @lib.Cell[(Int64) -> ((@num.Num) -> String raise) raise] = @lib.Cell::new("decimalize")

///|
/// `decimalize`
pub fn decimalize(x : Int64) -> ((@num.Num) -> String raise) raise {
  (decimalize_c.get())(x)
}

///|
/// `itern`
pub fn[TA, TB] itern(x10 : Int64, x11 : @list.List[TB], x12 : (TB) -> ((Int64) -> ((TA) -> TA raise) raise) raise, x13 : TA) -> TA raise {
  let k = x10
  let l = x11
  let f = x12
  let a = x13
  match l {
    Empty => a
    More(h, tail=t) => {
      let t14 = f(h)(k)(a)
      itern(@lib.add63(k, 1L), t, f, t14)
    }
  }
}

///|
/// `iter`
pub fn[TA] iter(x15 : (Int64, Int64), x16 : (Int64) -> ((TA) -> TA raise) raise, x17 : TA) -> TA raise {
  let (m, n) = x15
  let f = x16
  let a = x17
  if (n < m) {
    a
  } else {
    let t18 = f(m)(a)
    iter((@lib.add63(m, 1L), n), f, t18)
  }
}

///|
/// `vector`
pub type Vector = (Int64, @lib.Func[Int64, @num.Num])

///|
/// `matrix`
pub type Matrix = ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])

///|
/// `monomial`
pub type Monomial = @lib.Func[@kernel.Term, Int64]

///|
/// `poly`
pub type Poly = @lib.Func[Monomial, @num.Num]

///|
/// `|-->`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] op_bar_minus_minus_gt(x19 : TA, x20 : @num.Num, x21 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
  let x = x19
  let y = x20
  let a = x21
  if @num.eq_num(y, @num.num_of_int64(0L)) {
    a
  } else {
    @lib.update(x, y, a)
  }
}

///|
/// `element`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] element(x22 : (TA, @lib.Func[TB, @num.Num]), x23 : TB) -> @num.Num raise {
  let (d, v) = x22
  let i = x23
  @lib.tryapplyd(v, i, @num.num_of_int64(0L))
}

///|
/// `mapa`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash, TC] mapa(x24 : (TC) -> @num.Num raise, x25 : (TA, @lib.Func[TB, TC])) -> ((TA, @lib.Func[TB, @num.Num])) raise {
  let f = x24
  let (d, v) = x25
  (d, @lib.foldl(fn(x26 : @lib.Func[TB, @num.Num], x27 : TB, x28 : TC) -> @lib.Func[TB, @num.Num] raise {
    let a = x26
    let i = x27
    let c = x28
    op_bar_minus_minus_gt(i, f(c), a)
  }, @lib.undefined(), v))
}

///|
/// `is_zero`
pub fn[TA, TB, TC] is_zero(x29 : TA, x30 : @lib.Func[TB, TC]) -> Bool raise {
  let (d, v) = (x29, x30)
  @lib.is_undefined(v)
}

///|
/// `vec_0`
pub fn vec_0(x31 : Int64) -> Vector raise {
  let n = x31
  (n, @lib.undefined())
}

///|
/// `vec_dim`
pub fn vec_dim(x32 : (Int64, @lib.Func[Int64, @num.Num])) -> Int64 raise {
  let _ as v = x32
  v.0
}

///|
/// `vec_const`
pub fn vec_const(x33 : @num.Num, x34 : Int64) -> Vector raise {
  let c = x33
  let n = x34
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    vec_0(n)
  } else {
    (n, @lib.itlist(fn(x35 : Int64, x36 : @lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise {
      let k = x35
      (fn(x38 : @lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise {
        ((x37 : @lib.Func[Int64, @num.Num]) => @lib.update(k, c, x37))(x38)
      })(x36)
    }, @lib.range(1L, n), @lib.undefined()))
  }
}

///|
/// vec_1
fn step_4() -> Unit raise {
  let t39 = @num.num_of_int64(1L)
  vec_1_c.set((x40 : Int64) => vec_const(t39, x40))
}

///|
let vec_1_c : @lib.Cell[(Int64) -> Vector raise] = @lib.Cell::new("vec_1")

///|
/// `vec_1`
pub fn vec_1(x : Int64) -> Vector raise {
  (vec_1_c.get())(x)
}

///|
/// `vec_cmul`
pub fn vec_cmul(x41 : @num.Num, x42 : (Int64, @lib.Func[Int64, @num.Num])) -> Vector raise {
  let c = x41
  let _ as v = x42
  let n = vec_dim(v)
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    vec_0(n)
  } else {
    (n, @lib.mapf(fn(x43 : @num.Num) -> @num.Num raise {
      let x = x43
      @num.mult_num(c, x)
    }, v.1))
  }
}

///|
/// `vec_neg`
pub fn vec_neg(x44 : (Int64, @lib.Func[Int64, @num.Num])) -> Vector raise {
  let _ as v = x44
  (v.0, @lib.mapf(fn(x45 : @num.Num) -> @num.Num raise {
    @num.minus_num(x45)
  }, v.1))
}

///|
/// `vec_add`
pub fn vec_add(x46 : (Int64, @lib.Func[Int64, @num.Num]), x47 : (Int64, @lib.Func[Int64, @num.Num])) -> Vector raise {
  let _ as v1 = x46
  let _ as v2 = x47
  let m = vec_dim(v1)
  let n = vec_dim(v2)
  if (m != n) {
    raise Failure("vec_add: incompatible dimensions")
  } else {
    (n, @lib.combine(fn(x48 : @num.Num, x49 : @num.Num) -> @num.Num raise {
      @num.add_num(x48, x49)
    }, fn(x50 : @num.Num) -> Bool raise {
      let x = x50
      @num.eq_num(x, @num.num_of_int64(0L))
    }, v1.1, v2.1))
  }
}

///|
/// `vec_sub`
pub fn vec_sub(x51 : (Int64, @lib.Func[Int64, @num.Num]), x52 : (Int64, @lib.Func[Int64, @num.Num])) -> Vector raise {
  let v1 = x51
  let v2 = x52
  vec_add(v1, vec_neg(v2))
}

///|
/// `vec_dot`
pub fn vec_dot(x53 : (Int64, @lib.Func[Int64, @num.Num]), x54 : (Int64, @lib.Func[Int64, @num.Num])) -> @num.Num raise {
  let _ as v1 = x53
  let _ as v2 = x54
  let m = vec_dim(v1)
  let n = vec_dim(v2)
  if (m != n) {
    raise Failure("vec_add: incompatible dimensions")
  } else {
    let t61 = @lib.combine(fn(x58 : @num.Num, x59 : @num.Num) -> @num.Num raise {
      @num.mult_num(x58, x59)
    }, fn(x60 : @num.Num) -> Bool raise {
      let x_1 = x60
      @num.eq_num(x_1, @num.num_of_int64(0L))
    }, v1.1, v2.1)
    @lib.foldl(fn(x55 : @num.Num, x56 : Int64, x57 : @num.Num) -> @num.Num raise {
      let a = x55
      let i = x56
      let x = x57
      @num.add_num(x, a)
    }, @num.num_of_int64(0L), t61)
  }
}

///|
/// `vec_of_list`
pub fn vec_of_list(x62 : @list.List[@num.Num]) -> Vector raise {
  let l = x62
  let n = Int::to_int64(@lib.length(l))
  (n, @lib.itlist2(fn(x63 : Int64, x64 : @num.Num, x65 : @lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise {
    @lib.update(x63, x64, x65)
  }, @lib.range(1L, n), l, @lib.undefined()))
}

///|
/// `matrix_0`
pub fn matrix_0(x66 : Int64, x67 : Int64) -> Matrix raise {
  let (m, n) = (x66, x67)
  ((m, n), @lib.undefined())
}

///|
/// `dimensions`
pub fn dimensions(x68 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> ((Int64, Int64)) raise {
  let _ as m = x68
  m.0
}

///|
/// `matrix_const`
pub fn matrix_const(x69 : @num.Num, x70 : (Int64, Int64)) -> Matrix raise {
  let c = x69
  let (m, n) as mn = x70
  if (m != n) {
    raise Failure("matrix_const: needs to be square")
  } else {
    if @num.eq_num(c, @num.num_of_int64(0L)) {
      matrix_0(mn.0, mn.1)
    } else {
      (mn, @lib.itlist(fn(x71 : Int64, x72 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
        let k = x71
        (fn(x74 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
          ((x73 : @lib.Func[(Int64, Int64), @num.Num]) => @lib.update((k, k), c, x73))(x74)
        })(x72)
      }, @lib.range(1L, n), @lib.undefined()))
    }
  }
}

///|
/// matrix_1
fn step_5() -> Unit raise {
  let t75 = @num.num_of_int64(1L)
  matrix_1_c.set((x76 : (Int64, Int64)) => matrix_const(t75, x76))
}

///|
let matrix_1_c : @lib.Cell[((Int64, Int64)) -> Matrix raise] = @lib.Cell::new("matrix_1")

///|
/// `matrix_1`
pub fn matrix_1(x : (Int64, Int64)) -> Matrix raise {
  (matrix_1_c.get())(x)
}

///|
/// `matrix_cmul`
pub fn matrix_cmul(x77 : @num.Num, x78 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Matrix raise {
  let c = x77
  let _ as m = x78
  let (i, j) = dimensions(m)
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    matrix_0(i, j)
  } else {
    ((i, j), @lib.mapf(fn(x79 : @num.Num) -> @num.Num raise {
      let x = x79
      @num.mult_num(c, x)
    }, m.1))
  }
}

///|
/// `matrix_neg`
pub fn matrix_neg(x80 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Matrix raise {
  let _ as m = x80
  let t82 = @lib.mapf(fn(x81 : @num.Num) -> @num.Num raise {
    @num.minus_num(x81)
  }, m.1)
  (dimensions(m), t82)
}

///|
/// `matrix_add`
pub fn matrix_add(x83 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]), x84 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Matrix raise {
  let _ as m1 = x83
  let _ as m2 = x84
  let d1 = dimensions(m1)
  let d2 = dimensions(m2)
  if (d1 != d2) {
    raise Failure("matrix_add: incompatible dimensions")
  } else {
    (d1, @lib.combine(fn(x85 : @num.Num, x86 : @num.Num) -> @num.Num raise {
      @num.add_num(x85, x86)
    }, fn(x87 : @num.Num) -> Bool raise {
      let x = x87
      @num.eq_num(x, @num.num_of_int64(0L))
    }, m1.1, m2.1))
  }
}

///|
/// `matrix_sub`
pub fn matrix_sub(x88 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]), x89 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Matrix raise {
  let m1 = x88
  let m2 = x89
  matrix_add(m1, matrix_neg(m2))
}

///|
/// `row`
pub fn row(x90 : Int64, x91 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Vector raise {
  let k = x90
  let _ as m = x91
  let (i, j) = dimensions(m)
  (j, @lib.foldl(fn(x92 : @lib.Func[Int64, @num.Num], x93 : (Int64, Int64), x94 : @num.Num) -> @lib.Func[Int64, @num.Num] raise {
    let a = x92
    let (i_1, j_1) = x93
    let c = x94
    if (i_1 == k) {
      @lib.update(j_1, c, a)
    } else {
      a
    }
  }, @lib.undefined(), m.1))
}

///|
/// `column`
pub fn column(x95 : Int64, x96 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Vector raise {
  let k = x95
  let _ as m = x96
  let (i, j) = dimensions(m)
  (i, @lib.foldl(fn(x97 : @lib.Func[Int64, @num.Num], x98 : (Int64, Int64), x99 : @num.Num) -> @lib.Func[Int64, @num.Num] raise {
    let a = x97
    let (i_1, j_1) = x98
    let c = x99
    if (j_1 == k) {
      @lib.update(i_1, c, a)
    } else {
      a
    }
  }, @lib.undefined(), m.1))
}

///|
/// `transp`
pub fn transp(x100 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Matrix raise {
  let _ as m = x100
  let (i, j) = dimensions(m)
  ((j, i), @lib.foldl(fn(x101 : @lib.Func[(Int64, Int64), @num.Num], x102 : (Int64, Int64), x103 : @num.Num) -> @lib.Func[(Int64, Int64), @num.Num] raise {
    let a = x101
    let (i_1, j_1) = x102
    let c = x103
    @lib.update((j_1, i_1), c, a)
  }, @lib.undefined(), m.1))
}

///|
/// `diagonal`
pub fn diagonal(x104 : (Int64, @lib.Func[Int64, @num.Num])) -> Matrix raise {
  let _ as v = x104
  let n = vec_dim(v)
  ((n, n), @lib.foldl(fn(x105 : @lib.Func[(Int64, Int64), @num.Num], x106 : Int64, x107 : @num.Num) -> @lib.Func[(Int64, Int64), @num.Num] raise {
    let a = x105
    let i = x106
    let c = x107
    @lib.update((i, i), c, a)
  }, @lib.undefined(), v.1))
}

///|
/// `matrix_of_list`
pub fn matrix_of_list(x108 : @list.List[@list.List[@num.Num]]) -> Matrix raise {
  let l = x108
  let m = Int::to_int64(@lib.length(l))
  if (m == 0L) {
    matrix_0(0L, 0L)
  } else {
    let n = Int::to_int64(@lib.length(@lib.hd(l)))
    ((m, n), itern(1L, l, fn(x109 : @list.List[@num.Num]) -> ((Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise) raise {
      let v = x109
      fn(x110 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
        let i = x110
        (x117 : @lib.Func[(Int64, Int64), @num.Num]) => itern(1L, v, fn(x112 : @num.Num) -> ((Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise) raise {
          let c = x112
          fn(x113 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
            let j = x113
            fn(x116 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
              ((x115 : @lib.Func[(Int64, Int64), @num.Num]) => @lib.update((i, j), c, x115))(x116)
            }
          }
        }, x117)
      }
    }, @lib.undefined()))
  }
}

///|
/// `monomial_eval`
pub fn monomial_eval(x118 : @lib.Func[@kernel.Term, @num.Num], x119 : @lib.Func[@kernel.Term, Int64]) -> @num.Num raise {
  let assig = x118
  let _ as m = x119
  @lib.foldl(fn(x120 : @num.Num, x121 : @kernel.Term, x122 : Int64) -> @num.Num raise {
    let a = x120
    let x = x121
    let k = x122
    let t123 = @num.num_of_int64(k)
    @num.mult_num(a, @num.power_num(@lib.apply(assig, x), t123))
  }, @num.num_of_int64(1L), m)
}

///|
/// monomial_1
fn step_6() -> Unit raise {
  monomial_1_c.set(@lib.undefined())
}

///|
let monomial_1_c : @lib.Cell[Monomial] = @lib.Cell::new("monomial_1")

///|
/// `monomial_1`
pub fn monomial_1() -> Monomial {
  monomial_1_c.get()
}

///|
/// `monomial_var`
pub fn monomial_var(x124 : @kernel.Term) -> Monomial raise {
  let x = x124
  @lib.single(x, 1L)
}

///|
/// monomial_mul
fn step_7() -> Unit raise {
  monomial_mul_c.set(fn(x133 : @lib.Func[@kernel.Term, Int64]) -> ((@lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise) raise {
    fn(x134 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
      ((x131 : @lib.Func[@kernel.Term, Int64], x132 : @lib.Func[@kernel.Term, Int64]) => @lib.combine(fn(x127 : Int64, x128 : Int64) -> Int64 raise {
        let s129 = (fn(x125 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x126 : Int64) -> Int64 raise {
            @lib.add63(x125, x126)
          }
        })(x127)
        s129(x128)
      }, fn(x130 : Int64) -> Bool raise {
        let x = x130
        false
      }, x131, x132))(x133, x134)
    }
  })
}

///|
let monomial_mul_c : @lib.Cell[(Monomial) -> ((Monomial) -> Monomial raise) raise] = @lib.Cell::new("monomial_mul")

///|
/// `monomial_mul`
pub fn monomial_mul(x : Monomial) -> ((Monomial) -> Monomial raise) raise {
  (monomial_mul_c.get())(x)
}

///|
/// `monomial_pow`
pub fn monomial_pow(x135 : @lib.Func[@kernel.Term, Int64], x136 : Int64) -> Monomial raise {
  let _ as m = x135
  let k = x136
  if (k == 0L) {
    monomial_1()
  } else {
    @lib.mapf(fn(x137 : Int64) -> Int64 raise {
      let x = x137
      @lib.mul63(k, x)
    }, m)
  }
}

///|
/// `monomial_divides`
pub fn monomial_divides(x138 : @lib.Func[@kernel.Term, Int64], x139 : @lib.Func[@kernel.Term, Int64]) -> Bool raise {
  let _ as m1 = x138
  let _ as m2 = x139
  @lib.foldl(fn(x140 : Bool, x141 : @kernel.Term, x142 : Int64) -> Bool raise {
    let a = x140
    let x = x141
    let k = x142
    ((@lib.tryapplyd(m2, x, 0L) >= k) && a)
  }, true, m1)
}

///|
/// `monomial_div`
pub fn monomial_div(x143 : @lib.Func[@kernel.Term, Int64], x144 : @lib.Func[@kernel.Term, Int64]) -> Monomial raise {
  let _ as m1 = x143
  let _ as m2 = x144
  let m = @lib.combine(fn(x147 : Int64, x148 : Int64) -> Int64 raise {
    let s149 = (fn(x145 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x146 : Int64) -> Int64 raise {
        @lib.add63(x145, x146)
      }
    })(x147)
    s149(x148)
  }, fn(x150 : Int64) -> Bool raise {
    let x = x150
    (x == 0L)
  }, m1, @lib.mapf(fn(x151 : Int64) -> Int64 raise {
    let x_1 = x151
    @lib.neg63(x_1)
  }, m2))
  if @lib.foldl(fn(x152 : Bool, x153 : @kernel.Term, x154 : Int64) -> Bool raise {
    let a = x152
    let x_2 = x153
    let k = x154
    ((k >= 0L) && a)
  }, true, m) {
    m
  } else {
    raise Failure("monomial_div: non-divisible")
  }
}

///|
/// `monomial_degree`
pub fn monomial_degree(x155 : @kernel.Term, x156 : @lib.Func[@kernel.Term, Int64]) -> Int64 raise {
  let x = x155
  let _ as m = x156
  @lib.tryapplyd(m, x, 0L)
}

///|
/// `monomial_lcm`
pub fn monomial_lcm(x157 : @lib.Func[@kernel.Term, Int64], x158 : @lib.Func[@kernel.Term, Int64]) -> Monomial raise {
  let _ as m1 = x157
  let _ as m2 = x158
  let t166 = @lib.dom(m2)
  @lib.itlist(fn(x159 : @kernel.Term, x160 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
    let x = x159
    let t161 = monomial_degree(x, m2)
    let t162 = monomial_degree(x, m1)
    let t163 = if (t162 >= t161) {
      t162
    } else {
      t161
    }
    (fn(x165 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
      ((x164 : @lib.Func[@kernel.Term, Int64]) => @lib.update(x, t163, x164))(x165)
    })(x160)
  }, @lib.union(@lib.dom(m1), t166), @lib.undefined())
}

///|
/// `monomial_multidegree`
pub fn monomial_multidegree(x167 : @lib.Func[@kernel.Term, Int64]) -> Int64 raise {
  let _ as m = x167
  @lib.foldl(fn(x168 : Int64, x169 : @kernel.Term, x170 : Int64) -> Int64 raise {
    let a = x168
    let x = x169
    let k = x170
    @lib.add63(k, a)
  }, 0L, m)
}

///|
/// `monomial_variables`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] monomial_variables(x171 : @lib.Func[TA, TB]) -> @list.List[TA] raise {
  let m = x171
  @lib.dom(m)
}

///|
/// `eval`
pub fn eval(x172 : @lib.Func[@kernel.Term, @num.Num], x173 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @num.Num raise {
  let assig = x172
  let _ as p = x173
  @lib.foldl(fn(x174 : @num.Num, x175 : @lib.Func[@kernel.Term, Int64], x176 : @num.Num) -> @num.Num raise {
    let a = x174
    let m = x175
    let c = x176
    @num.add_num(a, @num.mult_num(c, monomial_eval(assig, m)))
  }, @num.num_of_int64(0L), p)
}

///|
/// poly_0
fn step_8() -> Unit raise {
  poly_0_c.set(@lib.undefined())
}

///|
let poly_0_c : @lib.Cell[Poly] = @lib.Cell::new("poly_0")

///|
/// `poly_0`
pub fn poly_0() -> Poly {
  poly_0_c.get()
}

///|
/// `poly_isconst`
pub fn poly_isconst(x177 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Bool raise {
  let _ as p = x177
  @lib.foldl(fn(x178 : Bool, x179 : @lib.Func[@kernel.Term, Int64], x180 : @num.Num) -> Bool raise {
    let a = x178
    let m = x179
    let c = x180
    ((m == monomial_1()) && a)
  }, true, p)
}

///|
/// `poly_var`
pub fn poly_var(x181 : @kernel.Term) -> Poly raise {
  let x = x181
  let t182 = @num.num_of_int64(1L)
  @lib.single(monomial_var(x), t182)
}

///|
/// `poly_const`
pub fn poly_const(x183 : @num.Num) -> Poly raise {
  let c = x183
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    poly_0()
  } else {
    @lib.single(monomial_1(), c)
  }
}

///|
/// `poly_cmul`
pub fn poly_cmul(x184 : @num.Num, x185 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let c = x184
  let _ as p = x185
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    poly_0()
  } else {
    @lib.mapf(fn(x186 : @num.Num) -> @num.Num raise {
      let x = x186
      @num.mult_num(c, x)
    }, p)
  }
}

///|
/// `poly_neg`
pub fn poly_neg(x187 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let _ as p = x187
  @lib.mapf(fn(x188 : @num.Num) -> @num.Num raise {
    @num.minus_num(x188)
  }, p)
}

///|
/// `poly_add`
pub fn poly_add(x189 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x190 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let _ as p1 = x189
  let _ as p2 = x190
  @lib.combine(fn(x191 : @num.Num, x192 : @num.Num) -> @num.Num raise {
    @num.add_num(x191, x192)
  }, fn(x193 : @num.Num) -> Bool raise {
    let x = x193
    @num.eq_num(x, @num.num_of_int64(0L))
  }, p1, p2)
}

///|
/// `poly_sub`
pub fn poly_sub(x194 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x195 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let p1 = x194
  let p2 = x195
  poly_add(p1, poly_neg(p2))
}

///|
/// `poly_cmmul`
pub fn poly_cmmul(x196 : (@num.Num, @lib.Func[@kernel.Term, Int64]), x197 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let (c, m) = x196
  let _ as p = x197
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    poly_0()
  } else {
    if (m == monomial_1()) {
      @lib.mapf(fn(x198 : @num.Num) -> @num.Num raise {
        let d = x198
        @num.mult_num(c, d)
      }, p)
    } else {
      @lib.foldl(fn(x199 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x200 : @lib.Func[@kernel.Term, Int64], x201 : @num.Num) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
        let a = x199
        let m_p = x200
        let d_1 = x201
        let t202 = @num.mult_num(c, d_1)
        @lib.update(monomial_mul(m)(m_p), t202, a)
      }, poly_0(), p)
    }
  }
}

///|
/// `poly_mul`
pub fn poly_mul(x203 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x204 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let _ as p1 = x203
  let _ as p2 = x204
  @lib.foldl(fn(x205 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x206 : @lib.Func[@kernel.Term, Int64], x207 : @num.Num) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let a = x205
    let m = x206
    let c = x207
    poly_add(poly_cmmul((c, m), p2), a)
  }, poly_0(), p1)
}

///|
/// `poly_div`
pub fn poly_div(x208 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x209 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let _ as p1 = x208
  let _ as p2 = x209
  if !poly_isconst(p2) {
    raise Failure("poly_div: non-constant")
  } else {
    let c = eval(@lib.undefined(), p2)
    if @num.eq_num(c, @num.num_of_int64(0L)) {
      raise Failure("poly_div: division by zero")
    } else {
      poly_cmul(@num.div_num(@num.num_of_int64(1L), c), p1)
    }
  }
}

///|
/// `poly_square`
pub fn poly_square(x210 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let p = x210
  poly_mul(p, p)
}

///|
/// `poly_pow`
pub fn poly_pow(x211 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x212 : Int64) -> Poly raise {
  let p = x211
  let k = x212
  if (k == 0L) {
    poly_const(@num.num_of_int64(1L))
  } else {
    if (k == 1L) {
      p
    } else {
      let q = poly_square(poly_pow(p, @lib.div63(k, 2L)))
      if (@lib.mod63(k, 2L) == 1L) {
        poly_mul(p, q)
      } else {
        q
      }
    }
  }
}

///|
/// `poly_exp`
pub fn poly_exp(x213 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x214 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let p1 = x213
  let p2 = x214
  if !poly_isconst(p2) {
    raise Failure("poly_exp: not a constant")
  } else {
    poly_pow(p1, @num.int63_of_num(eval(@lib.undefined(), p2)))
  }
}

///|
/// `degree`
pub fn degree(x215 : @kernel.Term, x216 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Int64 raise {
  let x = x215
  let _ as p = x216
  @lib.foldl(fn(x217 : Int64, x218 : @lib.Func[@kernel.Term, Int64], x219 : @num.Num) -> Int64 raise {
    let a = x217
    let m = x218
    let c = x219
    let t220 = monomial_degree(x, m)
    if (t220 >= a) {
      t220
    } else {
      a
    }
  }, 0L, p)
}

///|
/// `multidegree`
pub fn multidegree(x221 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Int64 raise {
  let _ as p = x221
  @lib.foldl(fn(x222 : Int64, x223 : @lib.Func[@kernel.Term, Int64], x224 : @num.Num) -> Int64 raise {
    let a = x222
    let m = x223
    let c = x224
    let t225 = monomial_multidegree(m)
    if (t225 >= a) {
      t225
    } else {
      a
    }
  }, 0L, p)
}

///|
/// `poly_variables`
pub fn poly_variables(x226 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @list.List[@kernel.Term] raise {
  let _ as p = x226
  @lib.foldr(fn(x227 : @lib.Func[@kernel.Term, Int64], x228 : @num.Num, x229 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let m = x227
    let c = x228
    let t230 = monomial_variables(m)
    (fn(x232 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
      ((x231 : @list.List[@kernel.Term]) => @lib.union(t230, x231))(x232)
    })(x229)
  }, p, @list.List([]))
}

///|
/// `humanorder_varpow`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] humanorder_varpow(x233 : (TA, TB), x234 : (TA, TB)) -> Bool raise {
  let (x1, k1) = x233
  let (x2, k2) = x234
  ((@lib.compare(x1, x2) < 0) || ((x1 == x2) && (@lib.compare(k1, k2) > 0)))
}

///|
/// `humanorder_monomial`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] humanorder_monomial(x : @lib.Func[TA, TB]) -> ((@lib.Func[TA, TB]) -> Bool raise) raise {
  let f : (@lib.Func[TA, TB]) -> ((@lib.Func[TA, TB]) -> Bool raise) raise = x237 => {
  let m1 = x237
  x238 => {
    let m2 = x238
    if (m1 == m2) {
      true
    } else {
      let t239 = @lib.sort(humanorder_varpow, @lib.graph(m2))
      ord_l(@lib.sort(humanorder_varpow, @lib.graph(m1)), t239)
    }
  }
}
  f(x)
}

///|
fn[TC : Eq + @lib.OCompare + @lib.OHash, TD : Eq + @lib.OCompare + @lib.OHash] ord_l(x235 : @list.List[(TC, TD)], x236 : @list.List[(TC, TD)]) -> Bool raise {
  let l1 = x235
  let l2 = x236
  match (l1, l2) {
    (_, Empty) => true
    (Empty, _) => false
    (More(h1, tail=t1), More(h2, tail=t2)) => (humanorder_varpow(h1, h2) || ((h1 == h2) && ord_l(t1, t2)))
  }
}

///|
/// `string_of_vector`
pub fn string_of_vector(x240 : Int64, x241 : Int64, x242 : (Int64, @lib.Func[Int64, @num.Num])) -> String raise {
  let min_size = x240
  let max_size = x241
  let _ as v = x242
  let n_raw = vec_dim(v)
  if (n_raw == 0L) {
    "[]"
  } else {
    let t243 = if (n_raw <= max_size) {
      n_raw
    } else {
      max_size
    }
    let n = if (min_size >= t243) {
      min_size
    } else {
      t243
    }
    let xs = @lib.map(fn(x246 : Int64) -> String raise {
      (fn(x244 : @num.Num) -> String raise {
        @num.string_of_num(x244)
      })(((x245 : Int64) => element(v, x245))(x246))
    }, @lib.range(1L, n))
    let t249 = if (n_raw > max_size) {
      ", ...]"
    } else {
      "]"
    }
    ("[" + (@lib.end_itlist(fn(x247 : String, x248 : String) -> String raise {
      let s = x247
      let t = x248
      (s + (", " + t))
    }, xs) + t249))
  }
}

///|
/// `string_of_matrix`
pub fn string_of_matrix(x250 : Int64, x251 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> String raise {
  let max_size = x250
  let _ as m = x251
  let (i_raw, j_raw) = dimensions(m)
  let i = if (max_size <= i_raw) {
    max_size
  } else {
    i_raw
  }
  let j = if (max_size <= j_raw) {
    max_size
  } else {
    j_raw
  }
  let rstr = @lib.map(fn(x252 : Int64) -> String raise {
    let k = x252
    string_of_vector(j, j, row(k, m))
  }, @lib.range(1L, i))
  let t255 = if (j > max_size) {
    "\n ...]"
  } else {
    "]"
  }
  ("[" + (@lib.end_itlist(fn(x253 : String, x254 : String) -> String raise {
    let s = x253
    let t = x254
    (s + (";\n " + t))
  }, rstr) + t255))
}

///|
/// `string_of_term`
pub fn string_of_term(x256 : @kernel.Term) -> String raise {
  let t = x256
  if @kernel.is_comb(t) {
    let (a, b) = @kernel.dest_comb(t)
    let t257 = (" " + (string_of_term(b) + ")"))
    ("(" + (string_of_term(a) + t257))
  } else {
    if @kernel.is_abs(t) {
      let (a_1, b_1) = @kernel.dest_abs(t)
      let t258 = ("." + (string_of_term(b_1) + ")"))
      ("(\\" + (string_of_term(a_1) + t258))
    } else {
      if @kernel.is_const(t) {
        let (a_2, _) = @kernel.dest_const(t)
        a_2
      } else {
        if @kernel.is_var(t) {
          let (a_3, _) = @kernel.dest_var(t)
          a_3
        } else {
          raise Failure("string_of_term")
        }
      }
    }
  }
}

///|
/// `string_of_varpow`
pub fn string_of_varpow(x259 : @kernel.Term, x260 : Int64) -> String raise {
  let x = x259
  let k = x260
  if (k == 1L) {
    string_of_term(x)
  } else {
    let t261 = ("^" + Int64::to_string(k))
    (string_of_term(x) + t261)
  }
}

///|
/// `string_of_monomial`
pub fn string_of_monomial(x262 : @lib.Func[@kernel.Term, Int64]) -> String raise {
  let m = x262
  if (m == monomial_1()) {
    "1"
  } else {
    let vps = @lib.itlist(fn(x263 : (@kernel.Term, Int64), x264 : @list.List[String]) -> @list.List[String] raise {
      let (x, k) = x263
      let a = x264
      a.prepend(string_of_varpow(x, k))
    }, @lib.sort(humanorder_varpow, @lib.graph(m)), @list.List([]))
    @lib.end_itlist(fn(x265 : String, x266 : String) -> String raise {
      let s = x265
      let t = x266
      (s + ("*" + t))
    }, vps)
  }
}

///|
/// `string_of_cmonomial`
pub fn string_of_cmonomial(x267 : @num.Num, x268 : @lib.Func[@kernel.Term, Int64]) -> String raise {
  let (c, m) = (x267, x268)
  if (m == monomial_1()) {
    @num.string_of_num(c)
  } else {
    if @num.eq_num(c, @num.num_of_int64(1L)) {
      string_of_monomial(m)
    } else {
      let t269 = ("*" + string_of_monomial(m))
      (@num.string_of_num(c) + t269)
    }
  }
}

///|
/// `string_of_poly`
pub fn string_of_poly(x270 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> String raise {
  let _ as p = x270
  if (p == poly_0()) {
    "<<0>>"
  } else {
    let cms = @lib.sort(fn(x271 : (@lib.Func[@kernel.Term, Int64], @num.Num), x272 : (@lib.Func[@kernel.Term, Int64], @num.Num)) -> Bool raise {
      let (m1, _) = x271
      let (m2, _) = x272
      humanorder_monomial(m1)(m2)
    }, @lib.graph(p))
    let s = @lib.fold_left(fn(x273 : String, x274 : (@lib.Func[@kernel.Term, Int64], @num.Num)) -> String raise {
      let a = x273
      let (m, c) = x274
      if @num.lt_num(c, @num.num_of_int64(0L)) {
        (a + (" - " + string_of_cmonomial(@num.minus_num(c), m)))
      } else {
        (a + (" + " + string_of_cmonomial(c, m)))
      }
    }, "", cms)
    let s1 = @lib.string_sub(s, 0, 3)
    let s2 = @lib.string_sub(s, 3, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(s)), 3L)))
    ("<<" + ((if (s1 == " + ") {
      s2
    } else {
      ("-" + s2)
    }) + ">>"))
  }
}

///|
/// `print_vector`
pub fn print_vector(x275 : (Int64, @lib.Func[Int64, @num.Num])) -> Unit raise {
  let v = x275
  @pp.std_formatter.print_string(string_of_vector(0L, 20L, v))
}

///|
/// `print_matrix`
pub fn print_matrix(x276 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Unit raise {
  let m = x276
  @pp.std_formatter.print_string(string_of_matrix(20L, m))
}

///|
/// `print_monomial`
pub fn print_monomial(x277 : @lib.Func[@kernel.Term, Int64]) -> Unit raise {
  let m = x277
  @pp.std_formatter.print_string(string_of_monomial(m))
}

///|
/// `print_poly`
pub fn print_poly(x278 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Unit raise {
  let m = x278
  @pp.std_formatter.print_string(string_of_poly(m))
}

///|
/// poly_of_term
fn step_9() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("real_neg")
  let add_tm = @term_syntax.parse_term("real_add")
  let sub_tm = @term_syntax.parse_term("real_sub")
  let mul_tm = @term_syntax.parse_term("real_mul")
  let inv_tm = @term_syntax.parse_term("inv")
  let div_tm = @term_syntax.parse_term("op_slash")
  let pow_tm = @term_syntax.parse_term("real_pow")
  let zero_tm = @term_syntax.parse_term("real_of_num(0)")
  let real_ty = @term_syntax.parse_type("Real")
  fn poly_of_term_1(x279 : @kernel.Term) -> Poly raise {
    let tm = x279
    if (tm == zero_tm) {
      poly_0()
    } else {
      if @calc_int.is_ratconst(tm) {
        poly_const(@calc_int.rat_of_term(tm))
      } else {
        if !@kernel.is_comb(tm) {
          poly_var(tm)
        } else {
          let (lop, r) = @kernel.dest_comb(tm)
          if (lop == neg_tm) {
            poly_neg(poly_of_term_1(r))
          } else {
            if (lop == inv_tm) {
              let p = poly_of_term_1(r)
              if poly_isconst(p) {
                let t280 = eval(@lib.undefined(), p)
                poly_const(@num.div_num(@num.num_of_int64(1L), t280))
              } else {
                raise Failure("poly_of_term: inverse of non-constant polyomial")
              }
            } else {
              if !@kernel.is_comb(lop) {
                poly_var(tm)
              } else {
                let (op, l) = @kernel.dest_comb(lop)
                if ((op == pow_tm) && @nums.is_numeral(r)) {
                  let t281 = @nums.dest_small_numeral(r)
                  poly_pow(poly_of_term_1(l), t281)
                } else {
                  if (op == add_tm) {
                    let t282 = poly_of_term_1(r)
                    poly_add(poly_of_term_1(l), t282)
                  } else {
                    if (op == sub_tm) {
                      let t283 = poly_of_term_1(r)
                      poly_sub(poly_of_term_1(l), t283)
                    } else {
                      if (op == mul_tm) {
                        let t284 = poly_of_term_1(r)
                        poly_mul(poly_of_term_1(l), t284)
                      } else {
                        if (op == div_tm) {
                          let p_1 = poly_of_term_1(l)
                          let q = poly_of_term_1(r)
                          if poly_isconst(q) {
                            let t285 = eval(@lib.undefined(), q)
                            poly_cmul(@num.div_num(@num.num_of_int64(1L), t285), p_1)
                          } else {
                            raise Failure("poly_of_term: division by non-constant polynomial")
                          }
                        } else {
                          poly_var(tm)
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  poly_of_term_c.set(fn(x286 : @kernel.Term) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let tm_1 = x286
    if (@kernel.type_of(tm_1) == real_ty) {
      poly_of_term_1(tm_1)
    } else {
      raise Failure("poly_of_term: term does not have real type")
    }
  })
}

///|
let poly_of_term_c : @lib.Cell[(@kernel.Term) -> Poly raise] = @lib.Cell::new("poly_of_term")

///|
/// `poly_of_term`
pub fn poly_of_term(x : @kernel.Term) -> Poly raise {
  (poly_of_term_c.get())(x)
}

///|
/// `sdpa_of_vector`
pub fn sdpa_of_vector_v1(x287 : (Int64, @lib.Func[Int64, @num.Num])) -> String raise {
  let _ as v = x287
  let n = vec_dim(v)
  let t291 = @lib.range(1L, n)
  let t289 = decimalize(20L)
  let strs = @lib.map(fn(x290 : Int64) -> String raise {
    t289(((x288 : Int64) => element(v, x288))(x290))
  }, t291)
  (@lib.end_itlist(fn(x292 : String, x293 : String) -> String raise {
    let x = x292
    let y = x293
    (x + (" " + y))
  }, strs) + "\n")
}

///|
/// `sdpa_of_blockdiagonal`
pub fn sdpa_of_blockdiagonal_v1(x294 : Int64, x295 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> String raise {
  let k = x294
  let m = x295
  let pfx = (Int64::to_string(k) + " ")
  let ents = @lib.foldl(fn(x296 : @list.List[((Int64, Int64, Int64), @num.Num)], x297 : (Int64, Int64, Int64), x298 : @num.Num) -> @list.List[((Int64, Int64, Int64), @num.Num)] raise {
    let a = x296
    let (b, i, j) = x297
    let c = x298
    if (i > j) {
      a
    } else {
      a.prepend(((b, i, j), c))
    }
  }, @list.List([]), m)
  let entss = @lib.sort((x300 : ((Int64, Int64, Int64), @num.Num), x301 : ((Int64, Int64, Int64), @num.Num)) => @lib.increasing(fn(x299 : ((Int64, Int64, Int64), @num.Num)) -> (Int64, Int64, Int64) raise {
    x299.0
  }, x300, x301), ents)
  @lib.itlist(fn(x302 : ((Int64, Int64, Int64), @num.Num), x303 : String) -> String raise {
    let ((b_1, i_1, j_1), c_1) = x302
    let a_1 = x303
    let t304 = ("\n" + a_1)
    let t305 = (" " + (decimalize(20L)(c_1) + t304))
    let t306 = (" " + (Int64::to_string(j_1) + t305))
    let t307 = (" " + (Int64::to_string(i_1) + t306))
    (pfx + (Int64::to_string(b_1) + t307))
  }, entss, "")
}

///|
/// `sdpa_of_matrix`
pub fn sdpa_of_matrix_v1(x308 : Int64, x309 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> String raise {
  let k = x308
  let _ as m = x309
  let pfx = (Int64::to_string(k) + " 1 ")
  let ms = @lib.foldr(fn(x310 : (Int64, Int64), x311 : @num.Num, x312 : @list.List[((Int64, Int64), @num.Num)]) -> @list.List[((Int64, Int64), @num.Num)] raise {
    let (i, j) = x310
    let c = x311
    let a = x312
    if (i > j) {
      a
    } else {
      a.prepend(((i, j), c))
    }
  }, m.1, @list.List([]))
  let mss = @lib.sort((x314 : ((Int64, Int64), @num.Num), x315 : ((Int64, Int64), @num.Num)) => @lib.increasing(fn(x313 : ((Int64, Int64), @num.Num)) -> (Int64, Int64) raise {
    x313.0
  }, x314, x315), ms)
  @lib.itlist(fn(x316 : ((Int64, Int64), @num.Num), x317 : String) -> String raise {
    let ((i_1, j_1), c_1) = x316
    let a_1 = x317
    let t318 = ("\n" + a_1)
    let t319 = (" " + (decimalize(20L)(c_1) + t318))
    let t320 = (" " + (Int64::to_string(j_1) + t319))
    (pfx + (Int64::to_string(i_1) + t320))
  }, mss, "")
}

///|
/// `sdpa_of_problem`
pub fn sdpa_of_problem_v1(x321 : String, x322 : (Int64, @lib.Func[Int64, @num.Num]), x323 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> String raise {
  let comment = x321
  let obj = x322
  let mats = x323
  let m = @lib.sub63(Int::to_int64(@lib.length(mats)), 1L)
  let (n, _) = dimensions(@lib.hd(mats))
  let t327 = @lib.itlist2(fn(x324 : Int64, x325 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]), x326 : String) -> String raise {
    let k = x324
    let m_1 = x325
    let a = x326
    (sdpa_of_matrix_v1(@lib.sub63(k, 1L), m_1) + a)
  }, @lib.range(1L, Int::to_int64(@lib.length(mats))), mats, "")
  let t328 = ("\n" + (sdpa_of_vector_v1(obj) + t327))
  let t329 = ("\n" + ("1\n" + (Int64::to_string(n) + t328)))
  ("\"" + (comment + ("\"\n" + (Int64::to_string(m) + t329))))
}

///|
/// `word`
pub fn word(x330 : String) -> ((@list.List[String]) -> (String, @list.List[String]) raise) raise {
  let s = x330
  @lib.end_itlist(fn(x332 : (@list.List[String]) -> (String, @list.List[String]) raise, x333 : (@list.List[String]) -> (String, @list.List[String]) raise) -> ((@list.List[String]) -> (String, @list.List[String]) raise) raise {
    let p1 = x332
    let p2 = x333
    @parserutil.map(@parserutil.seq(p1, p2), fn(x335 : (String, String)) -> String raise {
      let (s_1, t) = x335
      (s_1 + t)
    })
  }, @lib.map(fn(x336 : String) -> ((@list.List[String]) -> (String, @list.List[String]) raise) raise {
    let s337 = @parserutil.a_list(x336)
    fn(x338 : @list.List[String]) -> (String, @list.List[String]) raise {
      s337(x338)
    }
  }, @lib.explode(s)))
}

///|
/// `token`
pub fn token(x339 : String) -> ((@list.List[String]) -> (String, @list.List[String]) raise) raise {
  let s = x339
  let t344 = @parserutil.many(@parserutil.some_list(fn(x343 : String) -> Bool raise {
    @printer.isspace(x343)
  }))
  let t342 = word(s)
  @parserutil.map(@parserutil.seq(@parserutil.seq(@parserutil.many(@parserutil.some_list(fn(x341 : String) -> Bool raise {
    @printer.isspace(x341)
  })), t342), t344), fn(x345 : ((@list.List[String], String), @list.List[String])) -> String raise {
    let ((_, t), _) = x345
    t
  })
}

///|
/// decimal
fn step_10() -> Unit raise {
  let numeral : (@list.List[String]) -> (String, @list.List[String]) raise = @parserutil.some_list(fn(x346 : String) -> Bool raise {
    @printer.isnum(x346)
  })
  let decimalint : (@list.List[String]) -> (@num.Num, @list.List[String]) raise = @parserutil.map(@parserutil.atleast(1, numeral), fn(x348 : @list.List[String]) -> @num.Num raise {
    @num.nums_num_of_string((fn(x347 : @list.List[String]) -> String raise {
      @lib.implode(x347)
    })(x348))
  })
  let decimalfrac : (@list.List[String]) -> (@num.Num, @list.List[String]) raise = @parserutil.map(@parserutil.atleast(1, numeral), fn(x349 : @list.List[String]) -> @num.Num raise {
    let s = x349
    let t350 = @num.pow10(@lib.length(s))
    @num.div_num(@num.nums_num_of_string(@lib.implode(s)), t350)
  })
  let decimalsig : (@list.List[String]) -> (@num.Num, @list.List[String]) raise = @parserutil.map(@parserutil.seq(decimalint, @parserutil.possibly(@parserutil.map(@parserutil.seq(@parserutil.a_list("."), decimalfrac), fn(x351 : (String, @num.Num)) -> @num.Num raise {
    x351.1
  }))), fn(x352 : (@num.Num, @list.List[@num.Num])) -> @num.Num raise {
    match x352 {
      (h, Empty) => h
      (h_1, More(x, tail=Empty)) => @num.add_num(h_1, x)
      _ => raise @lib.MatchFailure("tscript.ml:113")
    }
  })
  let t361 = signed_l(decimalint)
  let t360 = @parserutil.a_list("E")
  let exponent : (@list.List[String]) -> (@num.Num, @list.List[String]) raise = @parserutil.map(@parserutil.seq(@parserutil.alt(@parserutil.a_list("e"), t360), t361), fn(x362 : (String, @num.Num)) -> @num.Num raise {
    x362.1
  })
  let t363 = @parserutil.possibly(exponent)
  decimal_c.set(@parserutil.map(@parserutil.seq(signed_l(decimalsig), t363), fn(x364 : (@num.Num, @list.List[@num.Num])) -> @num.Num raise {
    match x364 {
      (h_2, Empty) => h_2
      (h_3, More(x_1, tail=Empty)) => @num.mult_num(h_3, @num.power_num(@num.num_of_int64(10L), x_1))
      _ => raise @lib.MatchFailure("tscript.ml:120")
    }
  }))
}

///|
let decimal_c : @lib.Cell[(@list.List[String]) -> (@num.Num, @list.List[String]) raise] = @lib.Cell::new("decimal")

///|
/// `decimal`
pub fn decimal(x : @list.List[String]) -> ((@num.Num, @list.List[String])) raise {
  (decimal_c.get())(x)
}

///|
fn[TA] signed_l(x353 : (@list.List[String]) -> (@num.Num, TA) raise) -> ((@list.List[String]) -> (@num.Num, TA) raise) raise {
  let prs = x353
  let t359 = @parserutil.map(@parserutil.seq(@parserutil.a_list("+"), prs), fn(x358 : (String, @num.Num)) -> @num.Num raise {
    x358.1
  })
  @parserutil.alt(@parserutil.alt(@parserutil.map(@parserutil.seq(@parserutil.a_list("-"), prs), fn(x357 : (String, @num.Num)) -> @num.Num raise {
    (fn(x355 : @num.Num) -> @num.Num raise {
      @num.minus_num(x355)
    })((fn(x356 : (String, @num.Num)) -> @num.Num raise {
      x356.1
    })(x357))
  }), t359), prs)
}

///|
/// `mkparser`
pub fn[TA, TB] mkparser(x365 : (@list.List[String]) -> (TA, @list.List[TB]) raise, x366 : String) -> TA raise {
  let p = x365
  let s = x366
  let (x, rst) = p(@lib.explode(s))
  if @list.List::is_empty(rst) {
    x
  } else {
    raise Failure("mkparser: unparsed input")
  }
}

///|
/// parse_decimal
fn step_11() -> Unit raise {
  parse_decimal_c.set((x367 : String) => mkparser(decimal, x367))
}

///|
let parse_decimal_c : @lib.Cell[(String) -> @num.Num raise] = @lib.Cell::new("parse_decimal")

///|
/// `parse_decimal`
pub fn parse_decimal(x : String) -> @num.Num raise {
  (parse_decimal_c.get())(x)
}

///|
let parse_sdpaoutput_c : @lib.Cell[(String) -> Vector raise] = @lib.Cell::new("parse_sdpaoutput")

///|
/// `parse_sdpaoutput`
pub fn parse_sdpaoutput(x : String) -> Vector raise {
  (parse_sdpaoutput_c.get())(x)
}

///|
let parse_csdpoutput_c : @lib.Cell[(String) -> Vector raise] = @lib.Cell::new("parse_csdpoutput")

///|
/// `parse_csdpoutput`
pub fn parse_csdpoutput(x : String) -> Vector raise {
  (parse_csdpoutput_c.get())(x)
}

///|
/// parse_sdpaoutput, parse_csdpoutput
fn step_12() -> Unit raise {
  let t369 = token("}")
  let t368 = @parserutil.listof(decimal, token(","), "decimal")
  let vector : (@list.List[String]) -> ((Int64, @lib.Func[Int64, @num.Num]), @list.List[String]) raise = @parserutil.map(@parserutil.seq(@parserutil.seq(token("{"), t368), t369), fn(x370 : ((String, @list.List[@num.Num]), String)) -> (Int64, @lib.Func[Int64, @num.Num]) raise {
    let ((_, v), _) = x370
    vec_of_list(v)
  })
  let parse_vector : (String) -> (Int64, @lib.Func[Int64, @num.Num]) raise = (x371 : String) => mkparser(vector, x371)
  let t383 = @parserutil.map(@parserutil.seq(vector, ignore__l), fn(x382 : ((Int64, @lib.Func[Int64, @num.Num]), Unit)) -> (Int64, @lib.Func[Int64, @num.Num]) raise {
    x382.0
  })
  let t381 = token("=")
  let t384 = @parserutil.seq(word("xVec"), t381)
  let sdpaoutput : (@list.List[String]) -> ((Int64, @lib.Func[Int64, @num.Num]), @list.List[_]) raise = (x385 : @list.List[String]) => skipupto_l(t384, t383, x385)
  let t388 = @parserutil.a_list("\n")
  let t389 = @parserutil.seq(@parserutil.seq(@parserutil.a_list(" "), t388), ignore__l)
  let csdpoutput : (@list.List[String]) -> ((Int64, @lib.Func[Int64, @num.Num]), @list.List[_]) raise = @parserutil.map(@parserutil.seq(@parserutil.map(@parserutil.seq(decimal, @parserutil.many(@parserutil.map(@parserutil.seq(@parserutil.a_list(" "), decimal), fn(x386 : (String, @num.Num)) -> @num.Num raise {
    x386.1
  }))), fn(x387 : (@num.Num, @list.List[@num.Num])) -> @list.List[@num.Num] raise {
    let (h, t) = x387
    t.prepend(h)
  }), t389), fn(x391 : (@list.List[@num.Num], ((String, String), Unit))) -> (Int64, @lib.Func[Int64, @num.Num]) raise {
    vec_of_list((fn(x390 : (@list.List[@num.Num], ((String, String), Unit))) -> @list.List[@num.Num] raise {
      x390.0
    })(x391))
  })
  let (parse_sdpaoutput, parse_csdpoutput) = ((x392 : String) => mkparser(sdpaoutput, x392), (x393 : String) => mkparser(csdpoutput, x393))
  parse_sdpaoutput_c.set(parse_sdpaoutput)
  parse_csdpoutput_c.set(parse_csdpoutput)
}

///|
fn[TA, TB, TC, TD, TE] skipupto_l(x372 : (@list.List[TE]) -> (TC, TD) raise, x373 : (TD) -> (TA, TB) raise, x374 : @list.List[TE]) -> ((TA, TB)) raise {
  let dscr = x372
  let prs = x373
  let inp = x374
  let t379 = @parserutil.map(@parserutil.seq(@parserutil.some_list(fn(x376 : TE) -> Bool raise {
    let c = x376
    true
  }), (x377 : @list.List[TE]) => skipupto_l(dscr, prs, x377)), fn(x378 : (TE, TA)) -> TA raise {
    x378.1
  })
  @parserutil.alt(@parserutil.map(@parserutil.seq(dscr, prs), fn(x375 : (TC, TA)) -> TA raise {
    x375.1
  }), t379)(inp)
}

///|
fn[TF, TG] ignore__l(x380 : TG) -> ((Unit, @list.List[TF])) raise {
  let inp_1 = x380
  ((), @list.List([]))
}

///|
/// sdpa_run_succeeded
fn step_13() -> Unit raise {
  let t404 = word("FEAS")
  let t405 = @parserutil.alt(word("OPT"), t404)
  let t403 = @parserutil.possibly(@parserutil.a_list("d"))
  let t406 = @parserutil.seq(@parserutil.seq(@parserutil.possibly(@parserutil.a_list("p")), t403), t405)
  let t402 = token("=")
  let t407 = @parserutil.seq(word("phase.value"), t402)
  let prs_1 : (@list.List[String]) -> (((@list.List[String], @list.List[String]), String), @list.List[String]) raise = (x408 : @list.List[String]) => skipupto_l_1(t407, t406, x408)
  sdpa_run_succeeded_c.set(fn(x409 : String) -> Bool raise {
    let s = x409
    try {
      ignore(prs_1(@lib.explode(s)))
      true
    } catch {
      @parserutil.Noparse => false
      e => raise e
    }
  })
}

///|
let sdpa_run_succeeded_c : @lib.Cell[(String) -> Bool raise] = @lib.Cell::new("sdpa_run_succeeded")

///|
/// `sdpa_run_succeeded`
pub fn sdpa_run_succeeded(x : String) -> Bool raise {
  (sdpa_run_succeeded_c.get())(x)
}

///|
fn[TA, TB, TC, TD, TE] skipupto_l_1(x394 : (@list.List[TE]) -> (TC, TD) raise, x395 : (TD) -> (TA, TB) raise, x396 : @list.List[TE]) -> ((TA, TB)) raise {
  let dscr = x394
  let prs = x395
  let inp = x396
  let t401 = @parserutil.map(@parserutil.seq(@parserutil.some_list(fn(x398 : TE) -> Bool raise {
    let c = x398
    true
  }), (x399 : @list.List[TE]) => skipupto_l_1(dscr, prs, x399)), fn(x400 : (TE, TA)) -> TA raise {
    x400.1
  })
  @parserutil.alt(@parserutil.map(@parserutil.seq(dscr, prs), fn(x397 : (TC, TA)) -> TA raise {
    x397.1
  }), t401)(inp)
}

///|
/// sdpa_default_parameters
fn step_14() -> Unit raise {
  sdpa_default_parameters_c.set("100     unsigned int maxIteration;\n1.0E-7  double 0.0 < epsilonStar;\n1.0E2   double 0.0 < lambdaStar;\n2.0     double 1.0 < omegaStar;\n-1.0E5  double lowerBound;\n1.0E5   double upperBound;\n0.1     double 0.0 <= betaStar <  1.0;\n0.2     double 0.0 <= betaBar  <  1.0, betaStar <= betaBar;\n0.9     double 0.0 < gammaStar  <  1.0;\n1.0E-7  double 0.0 < epsilonDash;\n")
}

///|
let sdpa_default_parameters_c : @lib.Cell[String] = @lib.Cell::new("sdpa_default_parameters")

///|
/// `sdpa_default_parameters`
pub fn sdpa_default_parameters() -> String {
  sdpa_default_parameters_c.get()
}

///|
/// sdpa_alt_parameters
fn step_15() -> Unit raise {
  sdpa_alt_parameters_c.set("1000    unsigned int maxIteration;\n1.0E-7  double 0.0 < epsilonStar;\n1.0E4   double 0.0 < lambdaStar;\n2.0     double 1.0 < omegaStar;\n-1.0E5  double lowerBound;\n1.0E5   double upperBound;\n0.1     double 0.0 <= betaStar <  1.0;\n0.2     double 0.0 <= betaBar  <  1.0, betaStar <= betaBar;\n0.9     double 0.0 < gammaStar  <  1.0;\n1.0E-7  double 0.0 < epsilonDash;\n")
}

///|
let sdpa_alt_parameters_c : @lib.Cell[String] = @lib.Cell::new("sdpa_alt_parameters")

///|
/// `sdpa_alt_parameters`
pub fn sdpa_alt_parameters() -> String {
  sdpa_alt_parameters_c.get()
}

///|
/// sdpa_params
fn step_16() -> Unit raise {
  sdpa_params_c.set(sdpa_alt_parameters())
}

///|
let sdpa_params_c : @lib.Cell[String] = @lib.Cell::new("sdpa_params")

///|
/// `sdpa_params`
pub fn sdpa_params() -> String {
  sdpa_params_c.get()
}

///|
/// csdp_default_parameters
fn step_17() -> Unit raise {
  csdp_default_parameters_c.set("axtol=1.0e-8\natytol=1.0e-8\nobjtol=1.0e-8\npinftol=1.0e8\ndinftol=1.0e8\nmaxiter=100\nminstepfrac=0.9\nmaxstepfrac=0.97\nminstepp=1.0e-8\nminstepd=1.0e-8\nusexzgap=1\ntweakgap=0\naffine=0\nprintlevel=1\n")
}

///|
let csdp_default_parameters_c : @lib.Cell[String] = @lib.Cell::new("csdp_default_parameters")

///|
/// `csdp_default_parameters`
pub fn csdp_default_parameters() -> String {
  csdp_default_parameters_c.get()
}

///|
/// csdp_params
fn step_18() -> Unit raise {
  csdp_params_c.set(csdp_default_parameters())
}

///|
let csdp_params_c : @lib.Cell[String] = @lib.Cell::new("csdp_params")

///|
/// `csdp_params`
pub fn csdp_params() -> String {
  csdp_params_c.get()
}

///|
/// `run_sdpa`
pub fn run_sdpa_v1(x410 : Bool, x411 : (Int64, @lib.Func[Int64, @num.Num]), x412 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let dbg = x410
  let obj = x411
  let mats = x412
  let input_file = @lib.temp_file("sos", ".dat-s")
  let output_file = (@lib.string_sub(input_file, 0, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(input_file)), 6L))) + ".out")
  let params_file = @lib.filename_concat(@lib.temp_path.val, "param.sdpa")
  @lib.file_of_string(input_file, sdpa_of_problem_v1("", obj, mats))
  @lib.file_of_string(params_file, sdpa_params())
  let t413 = ("; sdpa " + (input_file + (" " + (output_file + (if dbg {
    ""
  } else {
    "> /dev/null"
  })))))
  ignore(Int::to_int64(@lib.sys_command(("cd " + (@lib.temp_path.val + t413)))))
  let op = @lib.string_of_file(output_file)
  if !sdpa_run_succeeded(op) {
    raise Failure("sdpa: call failed")
  } else {
    let res = parse_sdpaoutput(op)
    if dbg {
      ()
    } else {
      @lib.sys_remove(input_file)
      @lib.sys_remove(output_file)
    }
    res
  }
}

///|
/// `sdpa`
pub fn sdpa_v1(x414 : (Int64, @lib.Func[Int64, @num.Num]), x415 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let obj = x414
  let mats = x415
  run_sdpa_v1(debugging().val, obj, mats)
}

///|
/// `run_csdp`
pub fn run_csdp_v1(x416 : Bool, x417 : (Int64, @lib.Func[Int64, @num.Num]), x418 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> ((Int64, Vector)) raise {
  let dbg = x416
  let obj = x417
  let mats = x418
  let input_file = @lib.temp_file("sos", ".dat-s")
  let output_file = (@lib.string_sub(input_file, 0, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(input_file)), 6L))) + ".out")
  let params_file = @lib.filename_concat(@lib.temp_path.val, "param.csdp")
  @lib.file_of_string(input_file, sdpa_of_problem_v1("", obj, mats))
  @lib.file_of_string(params_file, csdp_params())
  let t419 = ("; csdp " + (input_file + (" " + (output_file + (if dbg {
    ""
  } else {
    "> /dev/null"
  })))))
  let rv = Int::to_int64(@lib.sys_command(("cd " + (@lib.temp_path.val + t419))))
  let op = @lib.string_of_file(output_file)
  let res = parse_csdpoutput(op)
  if dbg {
    ()
  } else {
    @lib.sys_remove(input_file)
    @lib.sys_remove(output_file)
  }
  (rv, res)
}

///|
/// `csdp`
pub fn csdp_v1(x420 : (Int64, @lib.Func[Int64, @num.Num]), x421 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let obj = x420
  let mats = x421
  let (rv, res) = run_csdp_v1(debugging().val, obj, mats)
  if ((rv == 1L) || (rv == 2L)) {
    raise Failure("csdp: Problem is infeasible")
  } else {
    if (rv == 3L) {
      @pp.std_formatter.print_string("csdp warning: Reduced accuracy")
      {
        @pp.std_formatter.print_newline()
      }
    } else {
      if (rv != 0L) {
        raise Failure(("csdp: error " + Int64::to_string(rv)))
      } else {
        ()
      }
    }
  }
  res
}

///|
/// `scale_then`
pub fn[TA, TB] scale_then(x : (Vector) -> ((@list.List[@lib.Func[TB, @num.Num]]) -> TA raise) raise) -> ((Vector) -> ((@list.List[@lib.Func[TB, @num.Num]]) -> TA raise) raise) raise {
  let f : ((Vector) -> ((@list.List[@lib.Func[TB, @num.Num]]) -> TA raise) raise) -> ((Vector) -> ((@list.List[@lib.Func[TB, @num.Num]]) -> TA raise) raise) raise = x432 => {
  let solver = x432
  (x433 : (Int64, @lib.Func[Int64, @num.Num])) => {
    let obj = x433
    x434 => {
      let mats = x434
      let cd1 = @lib.itlist(common_denominator_l, mats, @num.num_of_int64(1L))
      let cd2 = common_denominator_l(obj.1, @num.num_of_int64(1L))
      let mats_p = @lib.map(x436 => @lib.mapf(fn(x435 : @num.Num) -> @num.Num raise {
        let x = x435
        @num.mult_num(cd1, x)
      }, x436), mats)
      let obj_p = vec_cmul(cd2, obj)
      let max1 = @lib.itlist(maximal_element_l, mats_p, @num.num_of_int64(0L))
      let max2 = maximal_element_l(obj_p.1, @num.num_of_int64(0L))
      let t437 = @lib.float_log(2.0)
      let scal1 = @num.pow2(@lib.int63_to_int(@lib.sub63(20L, @lib.norm63(Double::to_int64((@lib.float_log(@num.float_of_num(max1)) / t437))))))
      let t438 = @lib.float_log(2.0)
      let scal2 = @num.pow2(@lib.int63_to_int(@lib.sub63(20L, @lib.norm63(Double::to_int64((@lib.float_log(@num.float_of_num(max2)) / t438))))))
      let mats_p_p = @lib.map(x440 => @lib.mapf(fn(x439 : @num.Num) -> @num.Num raise {
        let x_1 = x439
        @num.mult_num(x_1, scal1)
      }, x440), mats_p)
      let obj_p_p = vec_cmul(scal2, obj_p)
      solver(obj_p_p)(mats_p_p)
    }
  }
}
  f(x)
}

///|
fn[TC] common_denominator_l(x422 : @lib.Func[TC, @num.Num], x423 : @num.Num) -> @num.Num raise {
  let amat = x422
  let acc = x423
  @lib.foldl(fn(x424 : @num.Num, x425 : TC, x426 : @num.Num) -> @num.Num raise {
    let a = x424
    let m = x425
    let c = x426
    @num.lcm_num(@num.denominator(c), a)
  }, acc, amat)
}

///|
fn[TD] maximal_element_l(x427 : @lib.Func[TD, @num.Num], x428 : @num.Num) -> @num.Num raise {
  let amat_1 = x427
  let acc_1 = x428
  @lib.foldl(fn(x429 : @num.Num, x430 : TD, x431 : @num.Num) -> @num.Num raise {
    let maxa = x429
    let m_1 = x430
    let c_1 = x431
    @num.max_num(maxa, @num.abs_num(c_1))
  }, acc_1, amat_1)
}

///|
/// `nice_rational`
pub fn nice_rational(x441 : @num.Num, x442 : @num.Num) -> @num.Num raise {
  let n = x441
  let x = x442
  @num.div_num(@num.round_num(@num.mult_num(n, x)), n)
}

///|
/// `nice_vector`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] nice_vector(x443 : @num.Num) -> (((TA, @lib.Func[TB, @num.Num])) -> (TA, @lib.Func[TB, @num.Num]) raise) raise {
  let n = x443
  (x446 : (TA, @lib.Func[TB, @num.Num])) => mapa((x445 : @num.Num) => nice_rational(n, x445), x446)
}

///|
/// `linear_program_basic`
pub fn linear_program_basic(x447 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> Bool raise {
  let a = x447
  let (m, n) = dimensions(a)
  let mats = @lib.map(fn(x448 : Int64) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise {
    let j = x448
    diagonal(column(j, a))
  }, @lib.range(1L, n))
  let obj = vec_const(@num.num_of_int64(1L), m)
  let (rv, res) = run_csdp_v1(false, obj, mats)
  if ((rv == 1L) || (rv == 2L)) {
    false
  } else {
    if (rv == 0L) {
      true
    } else {
      raise Failure("linear_program: An error occurred in the SDP solver")
    }
  }
}

///|
/// `linear_program`
pub fn linear_program(x449 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]), x450 : (Int64, @lib.Func[Int64, @num.Num])) -> Bool raise {
  let a = x449
  let b = x450
  let (m, n) = dimensions(a)
  if (vec_dim(b) != m) {
    raise Failure("linear_program: incompatible dimensions")
  } else {
    let t452 = @lib.map(fn(x451 : Int64) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise {
      let j = x451
      diagonal(column(j, a))
    }, @lib.range(1L, n))
    let mats = t452.prepend(diagonal(b))
    let obj = vec_const(@num.num_of_int64(1L), m)
    let (rv, res) = run_csdp_v1(false, obj, mats)
    if ((rv == 1L) || (rv == 2L)) {
      false
    } else {
      if (rv == 0L) {
        true
      } else {
        raise Failure("linear_program: An error occurred in the SDP solver")
      }
    }
  }
}

///|
/// `in_convex_hull`
pub fn in_convex_hull(x453 : @list.List[@list.List[Int64]], x454 : @list.List[Int64]) -> Bool raise {
  let pts = x453
  let pt = x454
  let pts1 = @lib.map(fn(x455 : @list.List[Int64]) -> @list.List[Int64] raise {
    let x = x455
    x.prepend(1L)
  }, pts).prepend(pt.prepend(1L))
  let pts2 = @lib.map(fn(x456 : @list.List[Int64]) -> @list.List[Int64] raise {
    let p = x456
    @lib.map(fn(x457 : Int64) -> Int64 raise {
      let x_1 = x457
      @lib.neg63(x_1)
    }, p).concat(p)
  }, pts1)
  let n = @lib.add63(Int::to_int64(@lib.length(pts)), 1L)
  let v = @lib.mul63(2L, @lib.add63(Int::to_int64(@lib.length(pt)), 1L))
  let m = @lib.sub63(@lib.add63(v, n), 1L)
  let mat = ((m, n), itern(1L, pts2, fn(x458 : @list.List[Int64]) -> ((Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise) raise {
    let pts_1 = x458
    fn(x459 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
      let j = x459
      (x467 : @lib.Func[(Int64, Int64), @num.Num]) => itern(1L, pts_1, fn(x461 : Int64) -> ((Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise) raise {
        let x_2 = x461
        fn(x462 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
          let i = x462
          let t464 = @num.num_of_int64(x_2)
          fn(x466 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
            ((x465 : @lib.Func[(Int64, Int64), @num.Num]) => @lib.update((i, j), t464, x465))(x466)
          }
        }
      }, x467)
    }
  }, iter((1L, n), fn(x468 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
    let i_1 = x468
    let t471 = @num.num_of_int64(1L)
    let t470 = @lib.add63(i_1, 1L)
    let t472 = (@lib.add63(v, i_1), t470)
    fn(x474 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
      ((x473 : @lib.Func[(Int64, Int64), @num.Num]) => @lib.update(t472, t471, x473))(x474)
    }
  }, @lib.undefined())))
  linear_program_basic(mat)
}

///|
/// minimal_convex_hull
fn step_19() -> Unit raise {
  let augment1 : (@list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise = fn(x475 : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
    match x475 {
      More(m, tail=ms) => {
        if in_convex_hull(ms, m) {
          ms
        } else {
          ms.concat(@list.List([m]))
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:359")
    }
  }
  let augment : (@list.List[Int64]) -> ((@list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise) raise = fn(x476 : @list.List[Int64]) -> ((@list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise) raise {
    let m_1 = x476
    fn(x477 : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
      let ms_1 = x477
      @lib.funpow(3, augment1, ms_1.prepend(m_1))
    }
  }
  minimal_convex_hull_c.set(fn(x478 : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
    let mons = x478
    let t482 = @list.List([@lib.hd(mons)])
    let mons_p = @lib.itlist(fn(x479 : @list.List[Int64], x480 : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
      let s481 = augment(x479)
      s481(x480)
    }, @lib.tl(mons), t482)
    @lib.funpow(@lib.length(mons_p), augment1, mons_p)
  })
}

///|
let minimal_convex_hull_c : @lib.Cell[(@list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise] = @lib.Cell::new("minimal_convex_hull")

///|
/// `minimal_convex_hull`
pub fn minimal_convex_hull(x : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
  (minimal_convex_hull_c.get())(x)
}

///|
/// `equation_cmul`
pub fn[TA] equation_cmul(x483 : @num.Num, x484 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
  let c = x483
  let eq = x484
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    @lib.undefined()
  } else {
    @lib.mapf(fn(x485 : @num.Num) -> @num.Num raise {
      let d = x485
      @num.mult_num(c, d)
    }, eq)
  }
}

///|
/// `equation_add`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equation_add(x486 : @lib.Func[TA, @num.Num], x487 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
  let eq1 = x486
  let eq2 = x487
  @lib.combine(fn(x488 : @num.Num, x489 : @num.Num) -> @num.Num raise {
    @num.add_num(x488, x489)
  }, fn(x490 : @num.Num) -> Bool raise {
    let x = x490
    @num.eq_num(x, @num.num_of_int64(0L))
  }, eq1, eq2)
}

///|
/// `equation_eval`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equation_eval(x491 : @lib.Func[TA, @num.Num], x492 : @lib.Func[TA, @num.Num]) -> @num.Num raise {
  let assig = x491
  let eq = x492
  let value : (TA) -> @num.Num raise = fn(x493 : TA) -> @num.Num raise {
    let v = x493
    @lib.apply(assig, v)
  }
  @lib.foldl(fn(x494 : @num.Num, x495 : TA, x496 : @num.Num) -> @num.Num raise {
    let a = x494
    let v_1 = x495
    let c = x496
    @num.add_num(a, @num.mult_num(value(v_1), c))
  }, @num.num_of_int64(0L), eq)
}

///|
/// `eliminate_equations`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] eliminate_equations(x : TA) -> ((@list.List[TA]) -> ((@list.List[@lib.Func[TA, @num.Num]]) -> (@list.List[TA], @lib.Func[TA, @lib.Func[TA, @num.Num]]) raise) raise) raise {
  let f : (TA) -> ((@list.List[TA]) -> ((@list.List[@lib.Func[TA, @num.Num]]) -> (@list.List[TA], @lib.Func[TA, @lib.Func[TA, @num.Num]]) raise) raise) raise = x507 => {
  let one = x507
  x508 => {
    let vars_1 = x508
    x509 => {
      let eqs_1 = x509
      let assig = eliminate_l(vars_1, @lib.undefined(), eqs_1)
      let vs_1 = @lib.foldl((x510, x511, x512) => {
        let a_1 = x510
        let x = x511
        let f = x512
        @lib.subtract(@lib.dom(f), @list.List([one])).concat(a_1)
      }, @list.List([]), assig)
      (@lib.setify(vs_1), assig)
    }
  }
}
  f(x)
}

///|
fn[TB] extract_first_l(x497 : (TB) -> Bool raise, x498 : @list.List[TB]) -> ((TB, @list.List[TB])) raise {
  let p = x497
  let l = x498
  match l {
    Empty => raise Failure("extract_first")
    More(h, tail=t) => {
      if p(h) {
        (h, t)
      } else {
        let (k, s) = extract_first_l(p, t)
        (k, s.prepend(h))
      }
    }
  }
}

///|
fn[TC : Eq + @lib.OCompare + @lib.OHash] eliminate_l(x499 : @list.List[TC], x500 : @lib.Func[TC, @lib.Func[TC, @num.Num]], x501 : @list.List[@lib.Func[TC, @num.Num]]) -> @lib.Func[TC, @lib.Func[TC, @num.Num]] raise {
  let vars = x499
  let dun = x500
  let eqs = x501
  match vars {
    Empty => {
      if @lib.forall(fn(x502 : @lib.Func[TC, @num.Num]) -> Bool raise {
        @lib.is_undefined(x502)
      }, eqs) {
        dun
      } else {
        raise Unsolvable::Unsolvable
      }
    }
    More(v, tail=vs) => {
      try {
        let (eq, oeqs) = extract_first_l(fn(x503 : @lib.Func[TC, @num.Num]) -> Bool raise {
          let e = x503
          @lib.defined(e, v)
        }, eqs)
        let a = @lib.apply(eq, v)
        let t504 = @lib.undefine(v, eq)
        let eq_p = equation_cmul(@num.div_num(@num.num_of_int64((-1L)), a), t504)
        let elim : (@lib.Func[TC, @num.Num]) -> @lib.Func[TC, @num.Num] raise = fn(x505 : @lib.Func[TC, @num.Num]) -> @lib.Func[TC, @num.Num] raise {
          let e_1 = x505
          let b = @lib.tryapplyd(e_1, v, @num.num_of_int64(0L))
          if @num.eq_num(b, @num.num_of_int64(0L)) {
            e_1
          } else {
            equation_add(e_1, equation_cmul(@num.div_num(@num.minus_num(b), a), eq))
          }
        }
        let t506 = @lib.map(elim, oeqs)
        eliminate_l(vs, @lib.update(v, eq_p, @lib.mapf(elim, dun)), t506)
      } catch {
        Failure(_) => eliminate_l(vs, dun, eqs)
        e => raise e
      }
    }
  }
}

///|
/// `eliminate_all_equations`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] eliminate_all_equations(x513 : TA) -> ((@list.List[@lib.Func[TA, @num.Num]]) -> (@list.List[TA], @lib.Func[TA, @lib.Func[TA, @num.Num]]) raise) raise {
  let one = x513
  fn eliminate(x516 : @lib.Func[TA, @lib.Func[TA, @num.Num]], x517 : @list.List[@lib.Func[TA, @num.Num]]) -> @lib.Func[TA, @lib.Func[TA, @num.Num]] raise {
    let dun = x516
    let eqs = x517
    match eqs {
      Empty => dun
      More(eq_1, tail=oeqs) => {
        if @lib.is_undefined(eq_1) {
          eliminate(dun, oeqs)
        } else {
          let v_1 = ((x515) => choose_variable_l(one, x515))(eq_1)
          let a = @lib.apply(eq_1, v_1)
          let t518 = @lib.undefine(v_1, eq_1)
          let eq_p_1 = equation_cmul(@num.div_num(@num.num_of_int64((-1L)), a), t518)
          let elim : (@lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise = fn(x519 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
            let e = x519
            let b = @lib.tryapplyd(e, v_1, @num.num_of_int64(0L))
            if @num.eq_num(b, @num.num_of_int64(0L)) {
              e
            } else {
              equation_add(e, equation_cmul(@num.div_num(@num.minus_num(b), a), eq_1))
            }
          }
          let t520 = @lib.map(elim, oeqs)
          eliminate(@lib.update(v_1, eq_p_1, @lib.mapf(elim, dun)), t520)
        }
      }
    }
  }
  fn(x521 : @list.List[@lib.Func[TA, @num.Num]]) -> (@list.List[TA], @lib.Func[TA, @lib.Func[TA, @num.Num]]) raise {
    let eqs_1 = x521
    let assig = eliminate(@lib.undefined(), eqs_1)
    let vs = @lib.foldl(fn(x522 : @list.List[TA], x523 : TA, x524 : @lib.Func[TA, @num.Num]) -> @list.List[TA] raise {
      let a_1 = x522
      let x = x523
      let f = x524
      @lib.subtract(@lib.dom(f), @list.List([one])).concat(a_1)
    }, @list.List([]), assig)
    (@lib.setify(vs), assig)
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] choose_variable_l(one : TA, x515 : @lib.Func[TA, TB]) -> TA raise {
  let choose_variable = (x515 : @lib.Func[TA, TB]) => choose_variable_l(one, x515)
  let eq = x515
  let (v, _) = @lib.choose(eq)
  if (v == one) {
    let eq_p = @lib.undefine(v, eq)
    if @lib.is_undefined(eq_p) {
      raise Failure("choose_variable")
    } else {
      let (w, _) = @lib.choose(eq_p)
      w
    }
  } else {
    v
  }
}

///|
/// `solve_equations`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] solve_equations(x525 : TA, x526 : @list.List[@lib.Func[TA, @num.Num]]) -> @lib.Func[TA, @num.Num] raise {
  let one = x525
  let eqs = x526
  let (vars, assigs) = eliminate_all_equations(one)(eqs)
  let vfn = @lib.itlist(fn(x527 : TA, x528 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
    let v = x527
    let t529 = @num.num_of_int64(0L)
    (fn(x531 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
      ((x530 : @lib.Func[TA, @num.Num]) => @lib.update(v, t529, x530))(x531)
    })(x528)
  }, vars, @lib.single(one, @num.num_of_int64((-1L))))
  let ass = @lib.combine(fn(x532 : @num.Num, x533 : @num.Num) -> @num.Num raise {
    @num.add_num(x532, x533)
  }, fn(x534 : @num.Num) -> Bool raise {
    let c = x534
    false
  }, @lib.mapf((x535 : @lib.Func[TA, @num.Num]) => equation_eval(vfn, x535), assigs), vfn)
  if @lib.forall(fn(x536 : @lib.Func[TA, @num.Num]) -> Bool raise {
    let e = x536
    let t537 = @num.num_of_int64(0L)
    @num.eq_num(equation_eval(ass, e), t537)
  }, eqs) {
    @lib.undefine(one, ass)
  } else {
    raise Sanity::Sanity
  }
}

///|
/// `newton_polytope`
pub fn newton_polytope(x538 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @list.List[Monomial] raise {
  let pol = x538
  let vars = poly_variables(pol)
  let mons = @lib.map(fn(x539 : @lib.Func[@kernel.Term, Int64]) -> @list.List[Int64] raise {
    let m = x539
    @lib.map(fn(x540 : @kernel.Term) -> Int64 raise {
      let x = x540
      monomial_degree(x, m)
    }, vars)
  }, @lib.dom(pol))
  let ds = @lib.map(fn(x541 : @kernel.Term) -> Int64 raise {
    let x_1 = x541
    @lib.div63(@lib.add63(degree(x_1, pol), 1L), 2L)
  }, vars)
  let all = @lib.itlist(fn(x542 : Int64, x543 : @list.List[@list.List[Int64]]) -> @list.List[@list.List[Int64]] raise {
    let n = x542
    let t546 = @lib.range(0L, n)
    ((x547 : @list.List[@list.List[Int64]]) => @lib.allpairs(fn(x544 : Int64, x545 : @list.List[Int64]) -> @list.List[Int64] raise {
      let h = x544
      let t = x545
      t.prepend(h)
    }, t546, x547))(x543)
  }, ds, @list.List([@list.List([])]))
  let mons_p = minimal_convex_hull(mons)
  let all_p = @lib.filter(fn(x548 : @list.List[Int64]) -> Bool raise {
    let m_1 = x548
    in_convex_hull(mons_p, @lib.map(fn(x549 : Int64) -> Int64 raise {
      let x_2 = x549
      @lib.mul63(2L, x_2)
    }, m_1))
  }, all)
  @lib.map(fn(x550 : @list.List[Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
    let m_2 = x550
    @lib.itlist2(fn(x551 : @kernel.Term, x552 : Int64, x553 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
      let v = x551
      let i = x552
      let a = x553
      if (i == 0L) {
        a
      } else {
        @lib.update(v, i, a)
      }
    }, vars, m_2, monomial_1())
  }, @lib.rev(all_p))
}

///|
/// `diag`
pub fn diag(x554 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> @list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))] raise {
  let m = x554
  let nn = dimensions(m)
  let n = nn.0
  if (nn.1 != n) {
    raise Failure("diagonalize: non-square matrix")
  } else {
    fn diagonalize(x555 : Int64, x556 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> @list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))] raise {
      let i = x555
      let m_1 = x556
      if is_zero(m_1.0, m_1.1) {
        @list.List([])
      } else {
        let a11 = element(m_1, (i, i))
        if @num.lt_num(a11, @num.num_of_int64(0L)) {
          raise Failure("diagonalize: not PSD")
        } else {
          if @num.eq_num(a11, @num.num_of_int64(0L)) {
            let t557 = row(i, m_1)
            if is_zero(t557.0, t557.1) {
              diagonalize(@lib.add63(i, 1L), m_1)
            } else {
              raise Failure("diagonalize: not PSD")
            }
          } else {
            let v = row(i, m_1)
            let v_p = mapa(fn(x558 : @num.Num) -> @num.Num raise {
              let a1k = x558
              @num.div_num(a1k, a11)
            }, v)
            let m_p = ((n, n), iter((@lib.add63(i, 1L), n), fn(x559 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
              let j = x559
              let t567 = (@lib.add63(i, 1L), n)
              (x568 : @lib.Func[(Int64, Int64), @num.Num]) => iter(t567, fn(x561 : Int64) -> ((@lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise) raise {
                let k = x561
                let t563 = element(v_p, k)
                let t564 = @num.mult_num(element(v, j), t563)
                let t565 = @num.sub_num(element(m_1, (j, k)), t564)
                (x566 : @lib.Func[(Int64, Int64), @num.Num]) => op_bar_minus_minus_gt((j, k), t565, x566)
              }, x568)
            }, @lib.undefined()))
            diagonalize(@lib.add63(i, 1L), m_p).prepend((a11, v_p))
          }
        }
      }
    }
    diagonalize(1L, m)
  }
}

///|
/// `deration`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] deration(x569 : @list.List[(@num.Num, (TA, @lib.Func[TB, @num.Num]))]) -> ((@num.Num, @list.List[(@num.Num, (TA, @lib.Func[TB, @num.Num]))])) raise {
  let d = x569
  if @list.List::is_empty(d) {
    (@num.num_of_int64(0L), d)
  } else {
    let d_p = @lib.map(fn(x581 : (@num.Num, (TA, @lib.Func[TB, @num.Num]))) -> (@num.Num, (TA, @lib.Func[TB, @num.Num])) raise {
      adj_l(x581.0, x581.1)
    }, d)
    let t596 = @lib.itlist(fn(x594 : (@num.Num, (TA, @lib.Func[TB, @num.Num])), x595 : @num.Num) -> @num.Num raise {
      (fn(x592 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
        (fn(x589 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
          fn(x590 : @num.Num) -> @num.Num raise {
            @num.gcd_num(x589, x590)
          }
        })((fn(x591 : @num.Num) -> @num.Num raise {
          @num.numerator(x591)
        })(x592))
      })((fn(x593 : (@num.Num, (TA, @lib.Func[TB, @num.Num]))) -> @num.Num raise {
        x593.0
      })(x594))(x595)
    }, d_p, @num.num_of_int64(0L))
    let a_3 = @num.div_num(@lib.itlist(fn(x587 : (@num.Num, (TA, @lib.Func[TB, @num.Num])), x588 : @num.Num) -> @num.Num raise {
      (fn(x585 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
        (fn(x582 : @num.Num) -> ((@num.Num) -> @num.Num raise) raise {
          fn(x583 : @num.Num) -> @num.Num raise {
            @num.lcm_num(x582, x583)
          }
        })((fn(x584 : @num.Num) -> @num.Num raise {
          @num.denominator(x584)
        })(x585))
      })((fn(x586 : (@num.Num, (TA, @lib.Func[TB, @num.Num]))) -> @num.Num raise {
        x586.0
      })(x587))(x588)
    }, d_p, @num.num_of_int64(1L)), t596)
    let t598 = @lib.map(fn(x597 : (@num.Num, (TA, @lib.Func[TB, @num.Num]))) -> (@num.Num, (TA, @lib.Func[TB, @num.Num])) raise {
      let (c_3, l_1) = x597
      (@num.mult_num(a_3, c_3), l_1)
    }, d_p)
    (@num.div_num(@num.num_of_int64(1L), a_3), t598)
  }
}

///|
fn[TC, TD : Eq + @lib.OCompare + @lib.OHash] adj_l(x570 : @num.Num, x571 : (TC, @lib.Func[TD, @num.Num])) -> ((@num.Num, (TC, @lib.Func[TD, @num.Num]))) raise {
  let (c, l) = (x570, x571)
  let t578 = @lib.foldl(fn(x575 : @num.Num, x576 : TD, x577 : @num.Num) -> @num.Num raise {
    let a_1 = x575
    let i_1 = x576
    let c_2 = x577
    @num.gcd_num(a_1, @num.numerator(c_2))
  }, @num.num_of_int64(0L), l.1)
  let a_2 = @num.div_num(@lib.foldl(fn(x572 : @num.Num, x573 : TD, x574 : @num.Num) -> @num.Num raise {
    let a = x572
    let i = x573
    let c_1 = x574
    @num.lcm_num(a, @num.denominator(c_1))
  }, @num.num_of_int64(1L), l.1), t578)
  let t580 = mapa(fn(x579 : @num.Num) -> @num.Num raise {
    let x = x579
    @num.mult_num(a_2, x)
  }, l)
  (@num.div_num(c, @num.mult_num(a_2, a_2)), t580)
}

///|
/// `enumerate_monomials`
pub fn enumerate_monomials(x599 : Int64, x600 : @list.List[@kernel.Term]) -> @list.List[Monomial] raise {
  let d = x599
  let vars = x600
  if (d < 0L) {
    @list.List([])
  } else {
    if (d == 0L) {
      @list.List([@lib.undefined()])
    } else {
      if @list.List::is_empty(vars) {
        @list.List([monomial_1()])
      } else {
        let alts = @lib.map(fn(x601 : Int64) -> @list.List[@lib.Func[@kernel.Term, Int64]] raise {
          let k = x601
          let t602 = @lib.tl(vars)
          let oths = enumerate_monomials(@lib.sub63(d, k), t602)
          @lib.map(fn(x603 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
            let ks = x603
            if (k == 0L) {
              ks
            } else {
              @lib.update(@lib.hd(vars), k, ks)
            }
          }, oths)
        }, @lib.range(0L, d))
        @lib.end_itlist(fn(x606 : @list.List[@lib.Func[@kernel.Term, Int64]], x607 : @list.List[@lib.Func[@kernel.Term, Int64]]) -> @list.List[@lib.Func[@kernel.Term, Int64]] raise {
          let s608 = (fn(x604 : @list.List[@lib.Func[@kernel.Term, Int64]]) -> ((@list.List[@lib.Func[@kernel.Term, Int64]]) -> @list.List[@lib.Func[@kernel.Term, Int64]] raise) raise {
            fn(x605 : @list.List[@lib.Func[@kernel.Term, Int64]]) -> @list.List[@lib.Func[@kernel.Term, Int64]] raise {
              x604.concat(x605)
            }
          })(x606)
          s608(x607)
        }, alts)
      }
    }
  }
}

///|
/// `enumerate_products`
pub fn enumerate_products(x609 : Int64, x610 : @list.List[(@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)]) -> @list.List[(Poly, @realarith.Positivstellensatz)] raise {
  let d = x609
  let pols = x610
  if (d == 0L) {
    let t611 = @realarith.Positivstellensatz::Rational_lt(@num.num_1)
    @list.List([(poly_const(@num.num_1), t611)])
  } else {
    if (d < 0L) {
      @list.List([])
    } else {
      match pols {
        Empty => {
          let t612 = @realarith.Positivstellensatz::Rational_lt(@num.num_1)
          @list.List([(poly_const(@num.num_1), t612)])
        }
        More((p, b), tail=ps) => {
          let e = multidegree(p)
          if (e == 0L) {
            enumerate_products(d, ps)
          } else {
            let t615 = @lib.map(fn(x613 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz) raise {
              let (q, c) = x613
              let t614 = @realarith.Positivstellensatz::Product(b, c)
              (poly_mul(p, q), t614)
            }, enumerate_products(@lib.sub63(d, e), ps))
            enumerate_products(d, ps).concat(t615)
          }
        }
      }
    }
  }
}

///|
/// `epoly_pmul`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] epoly_pmul(x616 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x617 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]], x618 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]]) -> @lib.Func[Monomial, @lib.Func[TA, @num.Num]] raise {
  let p = x616
  let q = x617
  let acc = x618
  @lib.foldl(fn(x619 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]], x620 : @lib.Func[@kernel.Term, Int64], x621 : @num.Num) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]] raise {
    let a = x619
    let m1 = x620
    let c = x621
    @lib.foldl(fn(x622 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]], x623 : @lib.Func[@kernel.Term, Int64], x624 : @lib.Func[TA, @num.Num]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[TA, @num.Num]] raise {
      let b = x622
      let m2 = x623
      let e = x624
      let m = monomial_mul(m1)(m2)
      let es = @lib.tryapplyd(b, m, @lib.undefined())
      @lib.update(m, equation_add(equation_cmul(c, e), es), b)
    }, a, q)
  }, acc, p)
}

///|
/// `epoly_cmul`
pub fn[TA, TB] epoly_cmul(x625 : @num.Num, x626 : @lib.Func[TA, @lib.Func[TB, @num.Num]]) -> @lib.Func[TA, @lib.Func[TB, @num.Num]] raise {
  let c = x625
  let l = x626
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    @lib.undefined()
  } else {
    @lib.mapf((x627 : @lib.Func[TB, @num.Num]) => equation_cmul(c, x627), l)
  }
}

///|
/// `epoly_of_poly`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] epoly_of_poly(x628 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
  let p = x628
  @lib.foldl(fn(x629 : @lib.Func[TA, @lib.Func[(Int64, Int64, Int64), @num.Num]], x630 : TA, x631 : @num.Num) -> @lib.Func[TA, @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
    let a = x629
    let m = x630
    let c = x631
    @lib.update(m, @lib.single((0L, 0L, 0L), @num.minus_num(c)), a)
  }, @lib.undefined(), p)
}

///|
/// `sdpa_of_blockdiagonal`
pub fn sdpa_of_blockdiagonal_v2(x632 : Int64, x633 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> String raise {
  let k = x632
  let m = x633
  let pfx = (Int64::to_string(k) + " ")
  let ents = @lib.foldl(fn(x634 : @list.List[((Int64, Int64, Int64), @num.Num)], x635 : (Int64, Int64, Int64), x636 : @num.Num) -> @list.List[((Int64, Int64, Int64), @num.Num)] raise {
    let a = x634
    let (b, i, j) = x635
    let c = x636
    if (i > j) {
      a
    } else {
      a.prepend(((b, i, j), c))
    }
  }, @list.List([]), m)
  let entss = @lib.sort((x638 : ((Int64, Int64, Int64), @num.Num), x639 : ((Int64, Int64, Int64), @num.Num)) => @lib.increasing(fn(x637 : ((Int64, Int64, Int64), @num.Num)) -> (Int64, Int64, Int64) raise {
    x637.0
  }, x638, x639), ents)
  @lib.itlist(fn(x640 : ((Int64, Int64, Int64), @num.Num), x641 : String) -> String raise {
    let ((b_1, i_1, j_1), c_1) = x640
    let a_1 = x641
    let t642 = ("\n" + a_1)
    let t643 = (" " + (decimalize(20L)(c_1) + t642))
    let t644 = (" " + (Int64::to_string(j_1) + t643))
    let t645 = (" " + (Int64::to_string(i_1) + t644))
    (pfx + (Int64::to_string(b_1) + t645))
  }, entss, "")
}

///|
/// `sdpa_of_blockproblem`
pub fn sdpa_of_blockproblem(x646 : String, x647 : Int64, x648 : @list.List[Int64], x649 : (Int64, @lib.Func[Int64, @num.Num]), x650 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> String raise {
  let comment = x646
  let nblocks = x647
  let blocksizes = x648
  let obj = x649
  let mats = x650
  let m = @lib.sub63(Int::to_int64(@lib.length(mats)), 1L)
  let t657 = @lib.itlist2(fn(x654 : Int64, x655 : @lib.Func[(Int64, Int64, Int64), @num.Num], x656 : String) -> String raise {
    let k = x654
    let m_1 = x655
    let a = x656
    (sdpa_of_blockdiagonal_v2(@lib.sub63(k, 1L), m_1) + a)
  }, @lib.range(1L, Int::to_int64(@lib.length(mats))), mats, "")
  let t658 = ("\n" + (sdpa_of_vector_v1(obj) + t657))
  let t659 = ("\n" + (@lib.end_itlist(fn(x651 : String, x652 : String) -> String raise {
    let s = x651
    let t = x652
    (s + (" " + t))
  }, @lib.map(fn(x653 : Int64) -> String raise {
    Int64::to_string(x653)
  }, blocksizes)) + t658))
  let t660 = ("\n" + (Int64::to_string(nblocks) + t659))
  ("\"" + (comment + ("\"\n" + (Int64::to_string(m) + t660))))
}

///|
/// `run_csdp`
pub fn run_csdp_v2(x661 : Bool, x662 : Int64, x663 : @list.List[Int64], x664 : (Int64, @lib.Func[Int64, @num.Num]), x665 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> ((Int64, Vector)) raise {
  let dbg = x661
  let nblocks = x662
  let blocksizes = x663
  let obj = x664
  let mats = x665
  let input_file = @lib.temp_file("sos", ".dat-s")
  let output_file = (@lib.string_sub(input_file, 0, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(input_file)), 6L))) + ".out")
  let params_file = @lib.filename_concat(@lib.temp_path.val, "param.csdp")
  @lib.file_of_string(input_file, sdpa_of_blockproblem("", nblocks, blocksizes, obj, mats))
  @lib.file_of_string(params_file, csdp_params())
  let t666 = ("; csdp " + (input_file + (" " + (output_file + (if dbg {
    ""
  } else {
    "> /dev/null"
  })))))
  let rv = Int::to_int64(@lib.sys_command(("cd " + (@lib.temp_path.val + t666))))
  let op = @lib.string_of_file(output_file)
  let res = parse_csdpoutput(op)
  if dbg {
    ()
  } else {
    @lib.sys_remove(input_file)
    @lib.sys_remove(output_file)
  }
  (rv, res)
}

///|
/// `csdp`
pub fn csdp_v2(x667 : Int64, x668 : @list.List[Int64], x669 : (Int64, @lib.Func[Int64, @num.Num]), x670 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> Vector raise {
  let nblocks = x667
  let blocksizes = x668
  let obj = x669
  let mats = x670
  let (rv, res) = run_csdp_v2(debugging().val, nblocks, blocksizes, obj, mats)
  if ((rv == 1L) || (rv == 2L)) {
    raise Failure("csdp: Problem is infeasible")
  } else {
    if (rv == 3L) {
      @pp.std_formatter.print_string("csdp warning: Reduced accuracy")
      {
        @pp.std_formatter.print_newline()
      }
    } else {
      if ((rv >= 4L) && (rv <= 9L)) {
        raise Failure(("csdp: error " + Int64::to_string(rv)))
      } else {
        if (rv != 0L) {
          raise Csdp_error::Csdp_error(rv)
        } else {
          ()
        }
      }
    }
  }
  res
}

///|
/// bmatrix_add
fn step_20() -> Unit raise {
  bmatrix_add_c.set(fn(x676 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> ((@lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise) raise {
    fn(x677 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
      ((x674 : @lib.Func[(Int64, Int64, Int64), @num.Num], x675 : @lib.Func[(Int64, Int64, Int64), @num.Num]) => @lib.combine(fn(x671 : @num.Num, x672 : @num.Num) -> @num.Num raise {
        @num.add_num(x671, x672)
      }, fn(x673 : @num.Num) -> Bool raise {
        let x = x673
        @num.eq_num(x, @num.num_of_int64(0L))
      }, x674, x675))(x676, x677)
    }
  })
}

///|
let bmatrix_add_c : @lib.Cell[(@lib.Func[(Int64, Int64, Int64), @num.Num]) -> ((@lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise) raise] = @lib.Cell::new("bmatrix_add")

///|
/// `bmatrix_add`
pub fn bmatrix_add(x : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> ((@lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise) raise {
  (bmatrix_add_c.get())(x)
}

///|
/// `bmatrix_cmul`
pub fn[TA] bmatrix_cmul(x678 : @num.Num, x679 : @lib.Func[TA, @num.Num]) -> @lib.Func[TA, @num.Num] raise {
  let c = x678
  let bm = x679
  if @num.eq_num(c, @num.num_of_int64(0L)) {
    @lib.undefined()
  } else {
    @lib.mapf(fn(x680 : @num.Num) -> @num.Num raise {
      let x = x680
      @num.mult_num(c, x)
    }, bm)
  }
}

///|
/// bmatrix_neg
fn step_21() -> Unit raise {
  let t681 = @num.num_of_int64((-1L))
  bmatrix_neg_c.set((x682 : @lib.Func[(Int64, Int64, Int64), @num.Num]) => bmatrix_cmul(t681, x682))
}

///|
let bmatrix_neg_c : @lib.Cell[(@lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise] = @lib.Cell::new("bmatrix_neg")

///|
/// `bmatrix_neg`
pub fn bmatrix_neg(x : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
  (bmatrix_neg_c.get())(x)
}

///|
/// `bmatrix_sub`
pub fn bmatrix_sub(x683 : @lib.Func[(Int64, Int64, Int64), @num.Num], x684 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
  let m1 = x683
  let m2 = x684
  let t685 = bmatrix_neg(m2)
  bmatrix_add(m1)(t685)
}

///|
/// `blocks`
pub fn blocks(x686 : @list.List[Int64], x687 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @list.List[Matrix] raise {
  let blocksizes = x686
  let bm = x687
  @lib.map(fn(x688 : (Int64, Int64)) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise {
    let (bs, b0) = x688
    let m = @lib.foldl(fn(x689 : @lib.Func[(Int64, Int64), @num.Num], x690 : (Int64, Int64, Int64), x691 : @num.Num) -> @lib.Func[(Int64, Int64), @num.Num] raise {
      let a = x689
      let (b, i, j) = x690
      let c = x691
      if (b == b0) {
        @lib.update((i, j), c, a)
      } else {
        a
      }
    }, @lib.undefined(), bm)
    let d = @lib.foldl(fn(x692 : Int64, x693 : (Int64, Int64), x694 : @num.Num) -> Int64 raise {
      let a_1 = x692
      let (i_1, j_1) = x693
      let c_1 = x694
      let t695 = if (i_1 >= j_1) {
        i_1
      } else {
        j_1
      }
      if (a_1 >= t695) {
        a_1
      } else {
        t695
      }
    }, 0L, m)
    ((bs, bs), m)
  }, @lib.zip(blocksizes, @lib.range(1L, Int::to_int64(@lib.length(blocksizes)))))
}

///|
/// `real_positivnullstellensatz_general`
pub fn real_positivnullstellensatz_general(x696 : Bool, x697 : Int64, x698 : @list.List[@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]], x699 : @list.List[(@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)], x700 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> ((@list.List[@lib.Func[Monomial, @num.Num]], @list.List[(@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[Monomial, @num.Num])])])) raise {
  let linf = x696
  let d = x697
  let eqs = x698
  let leqs = x699
  let pol = x700
  let vars = @lib.itlist(fn(x703 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x704 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    (fn(x701 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
      fn(x702 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.union(x701, x702)
      }
    })(poly_variables(x703))(x704)
  }, (eqs.prepend(pol)).concat(@lib.map(fn(x705 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    x705.0
  }, leqs)), @list.List([]))
  let monoid = if linf {
    let t708 = @lib.filter(fn(x707 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> Bool raise {
      let (p, c) = x707
      (multidegree(p) <= d)
    }, leqs)
    let t706 = @realarith.Positivstellensatz::Rational_lt(@num.num_1)
    t708.prepend((poly_const(@num.num_1), t706))
  } else {
    enumerate_products(d, leqs)
  }
  let nblocks = Int::to_int64(@lib.length(monoid))
  let mk_idmultiplier : (Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> (@list.List[@lib.Func[@kernel.Term, Int64]], @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) raise) raise = fn(x709 : Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> (@list.List[@lib.Func[@kernel.Term, Int64]], @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) raise) raise {
    let k = x709
    fn(x710 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> (@list.List[@lib.Func[@kernel.Term, Int64]], @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) raise {
      let p_1 = x710
      let e = @lib.sub63(d, multidegree(p_1))
      let mons = enumerate_monomials(e, vars)
      let nons = @lib.zip(mons, @lib.range(1L, Int::to_int64(@lib.length(mons))))
      (mons, @lib.itlist(fn(x711 : (@lib.Func[@kernel.Term, Int64], Int64), x712 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
        let (m, n) = x711
        let t714 = @num.num_of_int64(1L)
        let t713 = @lib.neg63(n)
        let t715 = @lib.single((@lib.neg63(k), t713, n), t714)
        (fn(x717 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
          ((x716 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) => @lib.update(m, t715, x716))(x717)
        })(x712)
      }, nons, @lib.undefined()))
    }
  }
  let (sqmonlist, sqs) = @lib.unzip(@lib.map2(((x718, x719) => mk_sqmultiplier_l(d, vars, x718, x719)), @lib.range(1L, Int::to_int64(@lib.length(monoid))), monoid))
  let (idmonlist, ids) = @lib.unzip(@lib.map2(fn(x725 : Int64, x726 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> (@list.List[@lib.Func[@kernel.Term, Int64]], @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) raise {
    let s727 = mk_idmultiplier(x725)
    s727(x726)
  }, @lib.range(1L, Int::to_int64(@lib.length(eqs))), eqs))
  let blocksizes = @lib.map(fn(x728 : @list.List[@lib.Func[@kernel.Term, Int64]]) -> Int64 raise {
    Int::to_int64(@lib.length(x728))
  }, sqmonlist)
  let bigsum = @lib.itlist2(fn(x729 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x730 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]], x731 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
    let p_3 = x729
    let q = x730
    let a_1 = x731
    epoly_pmul(p_3, q, a_1)
  }, eqs, ids, @lib.itlist2(fn(x732 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), x733 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]], x734 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
    let (p_4, c_3) = x732
    let s = x733
    let a_2 = x734
    epoly_pmul(p_4, s, a_2)
  }, monoid, sqs, epoly_of_poly(poly_neg(pol))))
  let eqns = @lib.foldl(fn(x735 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]], x736 : @lib.Func[@kernel.Term, Int64], x737 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
    let a_3 = x735
    let m_2 = x736
    let e_3 = x737
    a_3.prepend(e_3)
  }, @list.List([]), bigsum)
  let (pvs, assig) = eliminate_all_equations((0L, 0L, 0L))(eqns)
  let qvars = pvs.prepend((0L, 0L, 0L))
  let allassig = @lib.itlist(fn(x738 : (Int64, Int64, Int64), x739 : @lib.Func[(Int64, Int64, Int64), @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[(Int64, Int64, Int64), @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
    let v = x738
    let t740 = @lib.single(v, @num.num_of_int64(1L))
    (fn(x742 : @lib.Func[(Int64, Int64, Int64), @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[(Int64, Int64, Int64), @lib.Func[(Int64, Int64, Int64), @num.Num]] raise {
      ((x741 : @lib.Func[(Int64, Int64, Int64), @lib.Func[(Int64, Int64, Int64), @num.Num]]) => @lib.update(v, t740, x741))(x742)
    })(x739)
  }, pvs, assig)
  let mk_matrix : ((Int64, Int64, Int64)) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise = fn(x743 : (Int64, Int64, Int64)) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
    let v_1 = x743
    @lib.foldl(fn(x744 : @lib.Func[(Int64, Int64, Int64), @num.Num], x745 : (Int64, Int64, Int64), x746 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
      let m_3 = x744
      let (b, i, j) = x745
      let ass = x746
      if (b < 0L) {
        m_3
      } else {
        let c_4 = @lib.tryapplyd(ass, v_1, @num.num_of_int64(0L))
        if @num.eq_num(c_4, @num.num_of_int64(0L)) {
          m_3
        } else {
          @lib.update((b, j, i), c_4, @lib.update((b, i, j), c_4, m_3))
        }
      }
    }, @lib.undefined(), allassig)
  }
  let diagents = @lib.foldl(fn(x747 : @lib.Func[(Int64, Int64, Int64), @num.Num], x748 : (Int64, Int64, Int64), x749 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
    let a_4 = x747
    let (b_1, i_1, j_1) = x748
    let e_4 = x749
    if ((b_1 > 0L) && (i_1 == j_1)) {
      equation_add(e_4, a_4)
    } else {
      a_4
    }
  }, @lib.undefined(), allassig)
  let mats = @lib.map(mk_matrix, qvars)
  let t755 = itern(1L, pvs, fn(x750 : (Int64, Int64, Int64)) -> ((Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise) raise {
    let v_2 = x750
    fn(x751 : Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise {
      let i_2 = x751
      let t753 = @lib.tryapplyd(diagents, v_2, @num.num_of_int64(0L))
      (x754 : @lib.Func[Int64, @num.Num]) => op_bar_minus_minus_gt(i_2, t753, x754)
    }
  }, @lib.undefined())
  let obj = (Int::to_int64(@lib.length(pvs)), t755)
  let raw_vec = if @list.List::is_empty(pvs) {
    vec_0(0L)
  } else {
    scale_then(fn(x772 : (Int64, @lib.Func[Int64, @num.Num])) -> ((@list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> (Int64, @lib.Func[Int64, @num.Num]) raise) raise {
      fn(x773 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> (Int64, @lib.Func[Int64, @num.Num]) raise {
        ((x756, x757) => solve_filtered_l(nblocks, blocksizes, x756, x757))(x772, x773)
      }
    })(obj)(mats)
  }
  let find_rounding : (@num.Num) -> ((Int64, @lib.Func[Int64, @num.Num]), @list.List[@list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))]]) raise = fn(x774 : @num.Num) -> ((Int64, @lib.Func[Int64, @num.Num]), @list.List[@list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))]]) raise {
    let d_1 = x774
    if debugging().val {
      @pp.std_formatter.print_string(("Trying rounding with limit " + @num.string_of_num(d_1)))
      {
        @pp.std_formatter.print_newline()
      }
    } else {
      ()
    }
    let vec = nice_vector(d_1)(raw_vec)
    let t778 = bmatrix_neg(@lib.el(0, mats))
    let blockmat = iter((1L, vec_dim(vec)), fn(x775 : Int64) -> ((@lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise) raise {
      let i_5 = x775
      fn(x776 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
        let a_5 = x776
        let t777 = @lib.el(@lib.int63_to_int(i_5), mats)
        bmatrix_add(bmatrix_cmul(element(vec, i_5), t777))(a_5)
      }
    }, t778)
    let allmats = blocks(blocksizes, blockmat)
    (vec, @lib.map(diag, allmats))
  }
  let (vec_2, ratdias) = if @list.List::is_empty(pvs) {
    find_rounding(@num.num_1)
  } else {
    let t781 = @lib.map(fn(x780 : Int64) -> @num.Num raise {
      @num.pow2(@lib.int63_to_int(x780))
    }, @lib.range(5L, 66L))
    @lib.tryfind(find_rounding, @lib.map(fn(x779 : Int64) -> @num.Num raise {
      @num.num_of_int64(x779)
    }, @lib.range(1L, 31L)).concat(t781))
  }
  let t788 = @lib.single((0L, 0L, 0L), @num.num_of_int64((-1L)))
  let newassigs = @lib.itlist(fn(x782 : Int64, x783 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
    let k_6 = x782
    let t784 = element(vec_2, k_6)
    let t785 = @lib.el(@lib.int63_to_int(@lib.sub63(k_6, 1L)), pvs)
    (fn(x787 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
      ((x786 : @lib.Func[(Int64, Int64, Int64), @num.Num]) => @lib.update(t785, t784, x786))(x787)
    })(x783)
  }, @lib.range(1L, vec_dim(vec_2)), t788)
  let finalassigs = @lib.foldl(fn(x789 : @lib.Func[(Int64, Int64, Int64), @num.Num], x790 : (Int64, Int64, Int64), x791 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
    let a_6 = x789
    let v_3 = x790
    let e_5 = x791
    @lib.update(v_3, equation_eval(newassigs, e_5), a_6)
  }, newassigs, allassig)
  let sqs_1 = @lib.map2(fn(x805 : @list.List[@lib.Func[@kernel.Term, Int64]], x806 : @list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))]) -> @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])] raise {
    let s807 = mk_sos_l(x805)
    s807(x806)
  }, sqmonlist, ratdias)
  let cfs = @lib.map(((x792) => poly_of_epoly_l(finalassigs, x792)), ids)
  let msq = @lib.filter(fn(x808 : ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])) -> Bool raise {
    let (a_9, b_2) = x808
    !@list.List::is_empty(b_2)
  }, @lib.map2(fn(x809 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), x810 : @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) raise {
    let a_10 = x809
    let b_3 = x810
    (a_10, b_3)
  }, monoid, sqs_1))
  let eval_sq : (@list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise = fn(x811 : @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let sqs_2 = x811
    @lib.itlist(fn(x812 : (@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]), x813 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
      let (c_6, q_1) = x812
      let t814 = poly_cmul(c_6, poly_mul(q_1, q_1))
      ((x815 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) => poly_add(t814, x815))(x813)
    }, sqs_2, poly_0())
  }
  let sanity = @lib.itlist(fn(x816 : ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]), x817 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let ((p_6, c_7), s_1) = x816
    let t818 = poly_mul(p_6, eval_sq(s_1))
    ((x819 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) => poly_add(t818, x819))(x817)
  }, msq, @lib.itlist2(fn(x820 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x821 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x822 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let p_7 = x820
    let q_2 = x821
    let t823 = poly_mul(p_7, q_2)
    ((x824 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) => poly_add(t823, x824))(x822)
  }, cfs, eqs, poly_neg(pol)))
  if !@lib.is_undefined(sanity) {
    raise Sanity::Sanity
  } else {
    (cfs, @lib.map(fn(x825 : ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz), @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])) -> (@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) raise {
      let (a_11, b_4) = x825
      (a_11.1, b_4)
    }, msq))
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] mk_sqmultiplier_l(d : Int64, vars : @list.List[@kernel.Term], x718 : TA, x719 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], TB)) -> ((@list.List[Monomial], @lib.Func[Monomial, @lib.Func[(TA, Int64, Int64), @num.Num]])) raise {
  let k_1 = x718
  let (p_2, c_1) = x719
  let e_1 = @lib.div63(@lib.sub63(d, multidegree(p_2)), 2L)
  let mons_1 = enumerate_monomials(e_1, vars)
  let nons_1 = @lib.zip(mons_1, @lib.range(1L, Int::to_int64(@lib.length(mons_1))))
  (mons_1, @lib.itlist(fn(x720 : (@lib.Func[@kernel.Term, Int64], Int64), x721 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(TA, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(TA, Int64, Int64), @num.Num]] raise {
    let (m1, n1) = x720
    ((x724 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(TA, Int64, Int64), @num.Num]]) => @lib.itlist(fn(x722 : (@lib.Func[@kernel.Term, Int64], Int64), x723 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(TA, Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(TA, Int64, Int64), @num.Num]] raise {
      let (m2, n2) = x722
      let a = x723
      let m_1 = monomial_mul(m1)(m2)
      if (n1 > n2) {
        a
      } else {
        let c_2 = if (n1 == n2) {
          @num.num_of_int64(1L)
        } else {
          @num.num_of_int64(2L)
        }
        let e_2 = @lib.tryapplyd(a, m_1, @lib.undefined())
        @lib.update(m_1, equation_add(@lib.single((k_1, n1, n2), c_2), e_2), a)
      }
    }, nons_1, x724))(x721)
  }, nons_1, @lib.undefined()))
}

///|
fn[TC] solve_filtered_l(nblocks : Int64, blocksizes : @list.List[Int64], x756 : (TC, @lib.Func[Int64, @num.Num]), x757 : @list.List[@lib.Func[(Int64, Int64, Int64), @num.Num]]) -> Vector raise {
  let obj_1 = x756
  let mats_1 = x757
  let m_4 = @lib.sub63(Int::to_int64(@lib.length(mats_1)), 1L)
  let keep = @lib.filter(fn(x758 : Int64) -> Bool raise {
    let k_2 = x758
    !@lib.is_undefined(@lib.el(@lib.int63_to_int(k_2), mats_1))
  }, @lib.range(1L, m_4))
  if @list.List::is_empty(keep) {
    vec_0(m_4)
  } else {
    let t760 = @lib.map(fn(x759 : Int64) -> @lib.Func[(Int64, Int64, Int64), @num.Num] raise {
      let k_3 = x759
      @lib.el(@lib.int63_to_int(k_3), mats_1)
    }, keep)
    let mats_p = t760.prepend(@lib.el(0, mats_1))
    let t766 = itern(1L, keep, fn(x761 : Int64) -> ((Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise) raise {
      let k_4 = x761
      fn(x762 : Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise {
        let i_3 = x762
        let t764 = element(obj_1, k_4)
        (x765 : @lib.Func[Int64, @num.Num]) => op_bar_minus_minus_gt(i_3, t764, x765)
      }
    }, @lib.undefined())
    let obj_p = (Int::to_int64(@lib.length(keep)), t766)
    let subvec = csdp_v2(nblocks, blocksizes, obj_p, mats_p)
    (m_4, itern(1L, keep, fn(x767 : Int64) -> ((Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise) raise {
      let k_5 = x767
      fn(x768 : Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise {
        let i_4 = x768
        let t770 = element(subvec, i_4)
        (x771 : @lib.Func[Int64, @num.Num]) => op_bar_minus_minus_gt(k_5, t770, x771)
      }
    }, @lib.undefined()))
  }
}

///|
fn[TD : Eq + @lib.OCompare + @lib.OHash] poly_of_epoly_l(finalassigs : @lib.Func[(Int64, Int64, Int64), @num.Num], x792 : @lib.Func[TD, @lib.Func[(Int64, Int64, Int64), @num.Num]]) -> @lib.Func[TD, @num.Num] raise {
  let p_5 = x792
  @lib.foldl(fn(x793 : @lib.Func[TD, @num.Num], x794 : TD, x795 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> @lib.Func[TD, @num.Num] raise {
    let a_7 = x793
    let v_4 = x794
    let e_6 = x795
    op_bar_minus_minus_gt(v_4, equation_eval(finalassigs, e_6), a_7)
  }, @lib.undefined(), p_5)
}

///|
fn[TF : Eq + @lib.OCompare + @lib.OHash, TH, TI] mk_sq_l(mons_2 : @list.List[TF], x798 : TH, x799 : (TI, @lib.Func[Int64, @num.Num])) -> ((TH, @lib.Func[TF, @num.Num])) raise {
  let (c_5, m_5) = (x798, x799)
  (c_5, @lib.itlist(fn(x800 : Int64, x801 : @lib.Func[TF, @num.Num]) -> @lib.Func[TF, @num.Num] raise {
    let k_7 = x800
    let a_8 = x801
    let t802 = element(m_5, k_7)
    op_bar_minus_minus_gt(@lib.el(@lib.int63_to_int(@lib.sub63(k_7, 1L)), mons_2), t802, a_8)
  }, @lib.range(1L, Int::to_int64(@lib.length(mons_2))), @lib.undefined()))
}

///|
fn[TE, TF : Eq + @lib.OCompare + @lib.OHash, TG] mk_sos_l(x796 : @list.List[TF]) -> ((@list.List[(TE, (TG, @lib.Func[Int64, @num.Num]))]) -> @list.List[(TE, @lib.Func[TF, @num.Num])] raise) raise {
  let mons_2 = x796
  (x804 : @list.List[(TE, (TG, @lib.Func[Int64, @num.Num]))]) => @lib.map(fn(x803 : (TE, (TG, @lib.Func[Int64, @num.Num]))) -> (TE, @lib.Func[TF, @num.Num]) raise {
    ((x798, x799) => mk_sq_l(mons_2, x798, x799))(x803.0, x803.1)
  }, x804)
}

///|
/// `deepen`
pub fn[TA] deepen(x826 : (Int64) -> TA raise, x827 : Int64) -> TA raise {
  let f = x826
  let n = x827
  try {
    @pp.std_formatter.print_string("Searching with depth limit ")
    @pp.std_formatter.print_string(Int64::to_string(n))
    {
      @pp.std_formatter.print_newline()
    }
    f(n)
  } catch {
    Failure(_) => deepen(f, @lib.add63(n, 1L))
    e => raise e
  }
}

///|
/// `dest_monomial`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] dest_monomial(x828 : @lib.Func[TA, TB]) -> @list.List[(TA, TB)] raise {
  let mon = x828
  @lib.sort((x830 : (TA, TB), x831 : (TA, TB)) => @lib.increasing(fn(x829 : (TA, TB)) -> TA raise {
    x829.0
  }, x830, x831), @lib.graph(mon))
}

///|
/// monomial_order
fn step_22() -> Unit raise {
  monomial_order_c.set(fn(x834 : @lib.Func[@kernel.Term, Int64]) -> ((@lib.Func[@kernel.Term, Int64]) -> Bool raise) raise {
    let m1 = x834
    fn(x835 : @lib.Func[@kernel.Term, Int64]) -> Bool raise {
      let m2 = x835
      if (m2 == monomial_1()) {
        true
      } else {
        if (m1 == monomial_1()) {
          false
        } else {
          let mon1 = dest_monomial(m1)
          let mon2 = dest_monomial(m2)
          let deg1 = @lib.itlist(fn(x839 : (@kernel.Term, Int64), x840 : Int64) -> Int64 raise {
            (fn(x836 : Int64) -> ((Int64) -> Int64 raise) raise {
              fn(x837 : Int64) -> Int64 raise {
                @lib.add63(x836, x837)
              }
            })((fn(x838 : (@kernel.Term, Int64)) -> Int64 raise {
              x838.1
            })(x839))(x840)
          }, mon1, 0L)
          let deg2 = @lib.itlist(fn(x844 : (@kernel.Term, Int64), x845 : Int64) -> Int64 raise {
            (fn(x841 : Int64) -> ((Int64) -> Int64 raise) raise {
              fn(x842 : Int64) -> Int64 raise {
                @lib.add63(x841, x842)
              }
            })((fn(x843 : (@kernel.Term, Int64)) -> Int64 raise {
              x843.1
            })(x844))(x845)
          }, mon2, 0L)
          if (deg1 < deg2) {
            false
          } else {
            if (deg1 > deg2) {
              true
            } else {
              lexorder_l(mon1, mon2)
            }
          }
        }
      }
    }
  })
}

///|
let monomial_order_c : @lib.Cell[(Monomial) -> ((Monomial) -> Bool raise) raise] = @lib.Cell::new("monomial_order")

///|
/// `monomial_order`
pub fn monomial_order(x : Monomial) -> ((Monomial) -> Bool raise) raise {
  (monomial_order_c.get())(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] lexorder_l(x832 : @list.List[(TA, TB)], x833 : @list.List[(TA, TB)]) -> Bool raise {
  let l1 = x832
  let l2 = x833
  match (l1, l2) {
    (Empty, Empty) => true
    (vps, Empty) => false
    (Empty, vps_1) => true
    (More((x1, n1), tail=vs1), More((x2, n2), tail=vs2)) => {
      if (@lib.compare(x1, x2) < 0) {
        true
      } else {
        if (@lib.compare(x2, x1) < 0) {
          false
        } else {
          if (@lib.compare(n1, n2) < 0) {
            false
          } else {
            if (@lib.compare(n2, n1) < 0) {
              true
            } else {
              lexorder_l(vs1, vs2)
            }
          }
        }
      }
    }
  }
}

///|
/// `dest_poly`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] dest_poly(x846 : @lib.Func[@lib.Func[@kernel.Term, Int64], TA]) -> @list.List[(TA, @list.List[(@kernel.Term, Int64)])] raise {
  let p = x846
  @lib.map(fn(x847 : (@lib.Func[@kernel.Term, Int64], TA)) -> (TA, @list.List[(@kernel.Term, Int64)]) raise {
    let (m, c) = x847
    (c, dest_monomial(m))
  }, @lib.sort(fn(x848 : (@lib.Func[@kernel.Term, Int64], TA), x849 : (@lib.Func[@kernel.Term, Int64], TA)) -> Bool raise {
    let (m1, _) = x848
    let (m2, _) = x849
    monomial_order(m1)(m2)
  }, @lib.graph(p)))
}

///|
/// term_of_varpow
fn step_23() -> Unit raise {
  let pow_tm = @term_syntax.parse_term("real_pow")
  term_of_varpow_c.set(fn(x850 : @kernel.Term) -> ((Int64) -> @kernel.Term raise) raise {
    let x = x850
    fn(x851 : Int64) -> @kernel.Term raise {
      let k = x851
      if (k == 1L) {
        x
      } else {
        let t852 = @nums.mk_small_numeral(k)
        @kernel.mk_comb(@kernel.mk_comb(pow_tm, x), t852)
      }
    }
  })
}

///|
let term_of_varpow_c : @lib.Cell[(@kernel.Term) -> ((Int64) -> @kernel.Term raise) raise] = @lib.Cell::new("term_of_varpow")

///|
/// `term_of_varpow`
pub fn term_of_varpow(x : @kernel.Term) -> ((Int64) -> @kernel.Term raise) raise {
  (term_of_varpow_c.get())(x)
}

///|
/// term_of_monomial
fn step_24() -> Unit raise {
  let one_tm = @term_syntax.parse_term("real_of_num(1)")
  let mul_tm = @term_syntax.parse_term("real_mul")
  term_of_monomial_c.set(fn(x853 : @lib.Func[@kernel.Term, Int64]) -> @kernel.Term raise {
    let m = x853
    if (m == monomial_1()) {
      one_tm
    } else {
      let m_p = dest_monomial(m)
      let vps = @lib.itlist(fn(x854 : (@kernel.Term, Int64), x855 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        let (x, k) = x854
        let a = x855
        a.prepend(term_of_varpow(x)(k))
      }, m_p, @list.List([]))
      @lib.end_itlist(fn(x856 : @kernel.Term, x857 : @kernel.Term) -> @kernel.Term raise {
        let s = x856
        let t = x857
        @kernel.mk_comb(@kernel.mk_comb(mul_tm, s), t)
      }, vps)
    }
  })
}

///|
let term_of_monomial_c : @lib.Cell[(Monomial) -> @kernel.Term raise] = @lib.Cell::new("term_of_monomial")

///|
/// `term_of_monomial`
pub fn term_of_monomial(x : Monomial) -> @kernel.Term raise {
  (term_of_monomial_c.get())(x)
}

///|
/// term_of_cmonomial
fn step_25() -> Unit raise {
  let mul_tm = @term_syntax.parse_term("real_mul")
  term_of_cmonomial_c.set(fn(x858 : (@lib.Func[@kernel.Term, Int64], @num.Num)) -> @kernel.Term raise {
    let (m, c) = x858
    if (m == monomial_1()) {
      @calc_int.term_of_rat(c)
    } else {
      if @num.eq_num(c, @num.num_1) {
        term_of_monomial(m)
      } else {
        let t859 = term_of_monomial(m)
        @kernel.mk_comb(@kernel.mk_comb(mul_tm, @calc_int.term_of_rat(c)), t859)
      }
    }
  })
}

///|
let term_of_cmonomial_c : @lib.Cell[((Monomial, @num.Num)) -> @kernel.Term raise] = @lib.Cell::new("term_of_cmonomial")

///|
/// `term_of_cmonomial`
pub fn term_of_cmonomial(x : (Monomial, @num.Num)) -> @kernel.Term raise {
  (term_of_cmonomial_c.get())(x)
}

///|
/// term_of_poly
fn step_26() -> Unit raise {
  let zero_tm = @term_syntax.parse_term("real_of_num(0)")
  let add_tm = @term_syntax.parse_term("real_add")
  term_of_poly_c.set(fn(x860 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @kernel.Term raise {
    let p = x860
    if (p == poly_0()) {
      zero_tm
    } else {
      let cms = @lib.map(term_of_cmonomial, @lib.sort(fn(x861 : (@lib.Func[@kernel.Term, Int64], @num.Num), x862 : (@lib.Func[@kernel.Term, Int64], @num.Num)) -> Bool raise {
        let (m1, _) = x861
        let (m2, _) = x862
        monomial_order(m1)(m2)
      }, @lib.graph(p)))
      @lib.end_itlist(fn(x863 : @kernel.Term, x864 : @kernel.Term) -> @kernel.Term raise {
        let t1 = x863
        let t2 = x864
        @kernel.mk_comb(@kernel.mk_comb(add_tm, t1), t2)
      }, cms)
    }
  })
}

///|
let term_of_poly_c : @lib.Cell[(Poly) -> @kernel.Term raise] = @lib.Cell::new("term_of_poly")

///|
/// `term_of_poly`
pub fn term_of_poly(x : Poly) -> @kernel.Term raise {
  (term_of_poly_c.get())(x)
}

///|
/// `term_of_sqterm`
pub fn term_of_sqterm(x865 : @num.Num, x866 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> @realarith.Positivstellensatz raise {
  let (c, p) = (x865, x866)
  let t867 = @realarith.Positivstellensatz::Square(term_of_poly(p))
  @realarith.Positivstellensatz::Product(@realarith.Positivstellensatz::Rational_lt(c), t867)
}

///|
/// `term_of_sos`
pub fn term_of_sos(x868 : @realarith.Positivstellensatz, x869 : @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])]) -> @realarith.Positivstellensatz raise {
  let (pr, sqs) = (x868, x869)
  if @list.List::is_empty(sqs) {
    pr
  } else {
    @realarith.Positivstellensatz::Product(pr, @lib.end_itlist(fn(x870 : @realarith.Positivstellensatz, x871 : @realarith.Positivstellensatz) -> @realarith.Positivstellensatz raise {
      let a = x870
      let b = x871
      @realarith.Positivstellensatz::Sum(a, b)
    }, @lib.map(fn(x872 : (@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])) -> @realarith.Positivstellensatz raise {
      term_of_sqterm(x872.0, x872.1)
    }, sqs)))
  }
}

///|
/// `REAL_NONLINEAR_PROVER`
pub fn real_nonlinear_prover(x873 : ((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise, x874 : (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise {
  let translator = x873
  let (eqs, les, lts) = x874
  let eq0 = @lib.map(fn(x877 : @kernel.Thm) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    (fn(x875 : @kernel.Term) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
      poly_of_term(@equal.lhand(x875))
    })((fn(x876 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x876)
    })(x877))
  }, eqs)
  let le0 = @lib.map(fn(x880 : @kernel.Thm) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    (fn(x878 : @kernel.Term) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
      poly_of_term(@equal.lhand(x878))
    })((fn(x879 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x879)
    })(x880))
  }, les)
  let lt0 = @lib.map(fn(x883 : @kernel.Thm) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    (fn(x881 : @kernel.Term) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
      poly_of_term(@equal.lhand(x881))
    })((fn(x882 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x882)
    })(x883))
  }, lts)
  let eqp0 = @lib.map(fn(x884 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], Int64)) -> (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz) raise {
    let (t, i) = x884
    (t, @realarith.Positivstellensatz::Axiom_eq(i))
  }, @lib.zip(eq0, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(eq0)), 1L))))
  let lep0 = @lib.map(fn(x885 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], Int64)) -> (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz) raise {
    let (t_1, i_1) = x885
    (t_1, @realarith.Positivstellensatz::Axiom_le(i_1))
  }, @lib.zip(le0, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(le0)), 1L))))
  let ltp0 = @lib.map(fn(x886 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], Int64)) -> (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz) raise {
    let (t_2, i_2) = x886
    (t_2, @realarith.Positivstellensatz::Axiom_lt(i_2))
  }, @lib.zip(lt0, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(lt0)), 1L))))
  let (keq, eq) = @lib.partition(fn(x887 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> Bool raise {
    let (p, _) = x887
    (multidegree(p) == 0L)
  }, eqp0)
  let (klep, lep) = @lib.partition(fn(x888 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> Bool raise {
    let (p_1, _) = x888
    (multidegree(p_1) == 0L)
  }, lep0)
  let (kltp, ltp) = @lib.partition(fn(x889 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> Bool raise {
    let (p_2, _) = x889
    (multidegree(p_2) == 0L)
  }, ltp0)
  let trivial_axiom : ((@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @kernel.Thm raise = fn(x890 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @kernel.Thm raise {
    let (p_3, ax) = x890
    match ax {
      @realarith.Positivstellensatz::Axiom_eq(n) if @num.neq_num(eval(@lib.undefined(), p_3), @num.num_0) => @lib.el(@lib.int63_to_int(n), eqs)
      @realarith.Positivstellensatz::Axiom_le(n_1) if @num.lt_num(eval(@lib.undefined(), p_3), @num.num_0) => @lib.el(@lib.int63_to_int(n_1), les)
      @realarith.Positivstellensatz::Axiom_lt(n_2) if @num.le_num(eval(@lib.undefined(), p_3), @num.num_0) => @lib.el(@lib.int63_to_int(n_2), lts)
      _ => raise Failure("not a trivial axiom")
    }
  }
  try {
    let th = @lib.tryfind(trivial_axiom, keq.concat(klep.concat(kltp)))
    @equal.conv_rule(@equal.thenc(@equal.land_conv(@calc_rat.real_poly_conv), @calc_rat.real_rat_red_conv), th)
  } catch {
    Failure(_) => {
      let t892 = poly_const(@num.num_1)
      let pol = @lib.itlist(poly_mul, @lib.map(fn(x891 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
        x891.0
      }, ltp), t892)
      let leq = lep.concat(ltp)
      let tryall : (Int64) -> (Int64, Int64, (@list.List[@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]], @list.List[(@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])])) raise = fn(x893 : Int64) -> (Int64, Int64, (@list.List[@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]], @list.List[(@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])])) raise {
        let d = x893
        let e = multidegree(pol)
        let k = if (e == 0L) {
          0L
        } else {
          @lib.div63(d, e)
        }
        let eq_p = @lib.map(fn(x894 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
          x894.0
        }, eq)
        @lib.tryfind(fn(x895 : Int64) -> (Int64, Int64, (@list.List[@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]], @list.List[(@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])])) raise {
          let i_3 = x895
          (d, i_3, real_positivnullstellensatz_general(false, d, eq_p, leq, poly_neg(poly_pow(pol, i_3))))
        }, @lib.range(0L, k))
      }
      let (d_1, i_4, (cert_ideal, cert_cone)) = deepen(tryall, 0L)
      let proofs_ideal = @lib.map2(fn(x896 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x897 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @realarith.Positivstellensatz raise {
        let q = x896
        let (p_4, ax_1) = x897
        @realarith.Positivstellensatz::Eqmul(term_of_poly(q), ax_1)
      }, cert_ideal, eq)
      let proofs_cone = @lib.map(fn(x898 : (@realarith.Positivstellensatz, @list.List[(@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])])) -> @realarith.Positivstellensatz raise {
        term_of_sos(x898.0, x898.1)
      }, cert_cone)
      let proof_ne = if @list.List::is_empty(ltp) {
        @realarith.Positivstellensatz::Rational_lt(@num.num_1)
      } else {
        let p_5 = @lib.end_itlist(fn(x899 : @realarith.Positivstellensatz, x900 : @realarith.Positivstellensatz) -> @realarith.Positivstellensatz raise {
          let s = x899
          let t_3 = x900
          @realarith.Positivstellensatz::Product(s, t_3)
        }, @lib.map(fn(x901 : (@lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], @realarith.Positivstellensatz)) -> @realarith.Positivstellensatz raise {
          x901.1
        }, ltp))
        let t903 = @realarith.Positivstellensatz::Rational_lt(@num.num_1)
        @lib.funpow(@lib.int63_to_int(i_4), fn(x902 : @realarith.Positivstellensatz) -> @realarith.Positivstellensatz raise {
          let q_1 = x902
          @realarith.Positivstellensatz::Product(p_5, q_1)
        }, t903)
      }
      let proof = @lib.end_itlist(fn(x904 : @realarith.Positivstellensatz, x905 : @realarith.Positivstellensatz) -> @realarith.Positivstellensatz raise {
        let s_1 = x904
        let t_4 = x905
        @realarith.Positivstellensatz::Sum(s_1, t_4)
      }, (proofs_ideal.prepend(proof_ne)).concat(proofs_cone))
      @pp.std_formatter.print_string("Translating proof certificate to HOL")
      {
        @pp.std_formatter.print_newline()
      }
      translator((eqs, les, lts))(proof)
    }
    e => raise e
  }
}

///|
/// REAL_NONLINEAR_SUBST_PROVER
fn step_27() -> Unit raise {
  let zero = @term_syntax.parse_term("real_of_num(0)")
  let mul_tm = @term_syntax.parse_term("real_mul")
  let t906 = @simp.rewr_conv(@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (x : Real) == (y : Real)) == (x == y - a)")))
  let shuffle1 : (@kernel.Thm) -> @kernel.Thm raise = (x907 : @kernel.Thm) => @equal.conv_rule(t906, x907)
  let t908 = @simp.rewr_conv(@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (a : Real) == (y : Real)) == (x == y - a)")))
  let shuffle2 : (@kernel.Thm) -> @kernel.Thm raise = (x909 : @kernel.Thm) => @equal.conv_rule(t908, x909)
  let substitutable_monomial = (x910 : @list.List[@kernel.Term], x911 : @kernel.Term) => substitutable_monomial_l(shuffle2, shuffle1, x910, x911)
  let isolate_variable = (x912 : @kernel.Term, x913 : @kernel.Thm) => isolate_variable_l(shuffle2, shuffle1, x912, x913)
  let make_substitution : (@kernel.Thm) -> @kernel.Thm raise = fn(x914 : @kernel.Thm) -> @kernel.Thm raise {
    let th_1 = x914
    let (c_1, v_1) = substitutable_monomial(@list.List([]), @equal.lhs(@kernel.concl(th_1)))
    let th1 = @equal.ap_term(@kernel.mk_comb(mul_tm, @calc_int.term_of_rat(@num.div_num(@num.num_of_int64(1L), c_1))), th_1)
    let th2 = @equal.conv_rule(@equal.binop_conv(@calc_rat.real_poly_mul_conv), th1)
    let t915 = isolate_variable(v_1, th2)
    @equal.conv_rule(@equal.rand_conv(@calc_rat.real_poly_conv), t915)
  }
  real_nonlinear_subst_prover_c.set(fn(x916 : ((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise {
    let translator = x916
    fn substfirst(x918 : @list.List[@kernel.Thm], x919 : @list.List[@kernel.Thm], x920 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
      let (eqs, les, lts) = (x918, x919, x920)
      try {
        let eth = @lib.tryfind(make_substitution, eqs)
        let t921 = @equal.land_conv(@equal.thenc(@equal.subs_conv(@list.List([eth])), @calc_rat.real_poly_conv))
        let modify : (@kernel.Thm) -> @kernel.Thm raise = (x922 : @kernel.Thm) => @equal.conv_rule(t921, x922)
        let t924 = @lib.map(modify, lts)
        let t925 = @lib.map(modify, les)
        substfirst(@lib.filter(fn(x923 : @kernel.Thm) -> Bool raise {
          let t_4 = x923
          (@equal.lhand(@kernel.concl(t_4)) != zero)
        }, @lib.map(modify, eqs)), t925, t924)
      } catch {
        Failure(_) => real_nonlinear_prover(translator, (eqs, les, lts))
        e => raise e
      }
    }
    fn(x926 : (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise {
      substfirst(x926.0, x926.1, x926.2)
    }
  })
}

///|
let real_nonlinear_subst_prover_c : @lib.Cell[(((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise] = @lib.Cell::new("REAL_NONLINEAR_SUBST_PROVER")

///|
/// `REAL_NONLINEAR_SUBST_PROVER`
pub fn real_nonlinear_subst_prover(x : ((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise {
  (real_nonlinear_subst_prover_c.get())(x)
}

///|
fn substitutable_monomial_l(shuffle2 : (@kernel.Thm) -> @kernel.Thm raise, shuffle1 : (@kernel.Thm) -> @kernel.Thm raise, x910 : @list.List[@kernel.Term], x911 : @kernel.Term) -> ((@num.Num, @kernel.Term)) raise {
  let substitutable_monomial = (x910 : @list.List[@kernel.Term], x911 : @kernel.Term) => substitutable_monomial_l(shuffle2, shuffle1, x910, x911)
  let fvs = x910
  let tm = x911
  match tm {
    @kernel.Term::Var(_, @kernel.HolType::Tyapp("real", Empty)) if !@lib.mem(tm, fvs) => (@num.num_of_int64(1L), tm)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("real_mul", _), c), @kernel.Term::Var(_, _) as t) if (@calc_int.is_ratconst(c) && !@lib.mem(t, fvs)) => (@calc_int.rat_of_term(c), t)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("real_add", _), s), t_1) => {
      try {
        substitutable_monomial(@lib.union(@kernel.frees(t_1), fvs), s)
      } catch {
        Failure(_) => substitutable_monomial(@lib.union(@kernel.frees(s), fvs), t_1)
        e => raise e
      }
    }
    _ => raise Failure("substitutable_monomial")
  }
}

///|
fn isolate_variable_l(shuffle2 : (@kernel.Thm) -> @kernel.Thm raise, shuffle1 : (@kernel.Thm) -> @kernel.Thm raise, x912 : @kernel.Term, x913 : @kernel.Thm) -> @kernel.Thm raise {
  let isolate_variable = (x912 : @kernel.Term, x913 : @kernel.Thm) => isolate_variable_l(shuffle2, shuffle1, x912, x913)
  let v = x912
  let th = x913
  match @equal.lhs(@kernel.concl(th)) {
    x if (x == v) => th
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("real_add", _), @kernel.Term::Var(_, @kernel.HolType::Tyapp("real", Empty)) as x_1), t_2) if (x_1 == v) => shuffle2(th)
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("real_add", _), s_1), t_3) => isolate_variable(v, shuffle1(th))
    _ => raise @lib.MatchFailure("tscript.ml:928")
  }
}

///|
/// REAL_SOS
fn step_28() -> Unit raise {
  let init_ : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x927 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s928 = @equal.once_depth_conv(x927)
    fn(x929 : @kernel.Term) -> @kernel.Thm raise {
      s928(x929)
    }
  }, @list.List([@calc_rat.decimal()]))
  let pure_ : (@kernel.Term) -> @kernel.Thm raise = @calc_rat.gen_real_arith(real_nonlinear_subst_prover)
  real_sos_c.set(fn(x930 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x930
    let th = init_(tm)
    let t931 = pure_(@kernel.rand(@kernel.concl(th)))
    @kernel.eq_mp(@equal.sym(th), t931)
  })
}

///|
let real_sos_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("REAL_SOS")

///|
/// `REAL_SOS`
pub fn real_sos(x : @kernel.Term) -> @kernel.Thm raise {
  (real_sos_c.get())(x)
}

///|
/// REAL_SOSFIELD
fn step_29() -> Unit raise {
  let inv_tm = @term_syntax.parse_term("inv")
  let t933 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), @canon.conds_celim_conv)
  let t932 = @simp.pure_rewrite_conv(@list.List([@theorems.forall_simp(), @theorems.exists_simp(), @realax.real_div(), @real.real_inv_inv(), @real.real_inv_mul(), @equal.gsym(@real.real_pow_inv())]))
  let prenex_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.top_depth_conv(@equal.beta_conv), t932), @canon.nnfc_conv), t933), @canon.prenex_conv)
  let setup_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@canon.nnf_conv, @canon.weak_cnf_conv), @canon.conj_canon_conv)
  let core_rule : (@kernel.Term) -> @kernel.Thm raise = fn(x934 : @kernel.Term) -> @kernel.Thm raise {
    let t = x934
    try {
      @calc_rat.real_arith(t)
    } catch {
      Failure(_) => {
        try {
          @calc_rat.real_ring(t)
        } catch {
          Failure(_) => real_sos(t)
          e => raise e
        }
      }
      e => raise e
    }
  }
  let t935 = @term_syntax.parse_term("op_slash")
  let is_div : (@kernel.Term) -> Bool raise = fn(x937 : @kernel.Term) -> Bool raise {
    ((x936 : @kernel.Term) => @basics.is_binop(t935, x936))(x937)
  }
  let is_inv : (@kernel.Term) -> Bool raise = fn(x938 : @kernel.Term) -> Bool raise {
    let tm = x938
    ((is_div(tm) || (@kernel.is_comb(tm) && (@kernel.rator(tm) == inv_tm))) && !@calc_int.is_ratconst(@kernel.rand(tm)))
  }
  let basic_real_field : (@kernel.Term) -> @kernel.Thm raise = fn(x939 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x939
    let is_freeinv : (@kernel.Term) -> Bool raise = fn(x940 : @kernel.Term) -> Bool raise {
      let t_1 = x940
      (is_inv(t_1) && @basics.free_in(t_1, tm_1))
    }
    let itms = @lib.setify(@lib.map(@kernel.rand, @basics.find_terms(is_freeinv, tm_1)))
    let hyps = @lib.map(fn(x941 : @kernel.Term) -> @kernel.Thm raise {
      let t_2 = x941
      @bool.spec(t_2, @real.real_mul_rinv())
    }, itms)
    let tm_p = @lib.itlist(fn(x942 : @kernel.Thm, x943 : @kernel.Term) -> @kernel.Term raise {
      let th = x942
      let t_3 = x943
      @bool.mk_imp(@kernel.concl(th), t_3)
    }, hyps, tm_1)
    let itms_p = @lib.map((x945 : @kernel.Term) => @lib.curry(fn(x944 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @kernel.mk_comb(x944.0, x944.1)
    }, inv_tm, x945), itms)
    let gvs = @lib.map(fn(x948 : @kernel.Term) -> @kernel.Term raise {
      (fn(x946 : @kernel.HolType) -> @kernel.Term raise {
        @basics.genvar(x946)
      })((fn(x947 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x947)
      })(x948))
    }, itms_p)
    let tm_p_p = @basics.subst(@lib.zip(gvs, itms_p), tm_p)
    let th1 = setup_conv(tm_p_p)
    let cjs = @basics.conjuncts(@kernel.rand(@kernel.concl(th1)))
    let ths = @lib.map(core_rule, cjs)
    let t949 = @lib.end_itlist(@bool.conj, ths)
    let th2 = @kernel.eq_mp(@equal.sym(th1), t949)
    @lib.rev_itlist(fn(x952 : @kernel.Thm, x953 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x950 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x951 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.mp(x950, x951)
        }
      })(x953)(x952)
    }, hyps, @kernel.inst_rule(@lib.zip(itms_p, gvs), th2))
  }
  real_sosfield_c.set(fn(x954 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x954
    let th0 = prenex_conv(tm_2)
    let tm0 = @kernel.rand(@kernel.concl(th0))
    let (avs, bod) = @basics.strip_forall(tm0)
    let th1_1 = setup_conv(bod)
    let ths_1 = @lib.map(basic_real_field, @basics.conjuncts(@kernel.rand(@kernel.concl(th1_1))))
    let t955 = @lib.end_itlist(@bool.conj, ths_1)
    let t956 = @bool.genl(avs, @kernel.eq_mp(@equal.sym(th1_1), t955))
    @kernel.eq_mp(@equal.sym(th0), t956)
  })
}

///|
let real_sosfield_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("REAL_SOSFIELD")

///|
/// `REAL_SOSFIELD`
pub fn real_sosfield(x : @kernel.Term) -> @kernel.Thm raise {
  (real_sosfield_c.get())(x)
}

///|
/// INT_SOS
fn step_30() -> Unit raise {
  let t957 = @simp.rewrite_tac(@list.List([@int.int_not_le(), @int.int_not_lt(), @int.int_not_eq(), @int.int_lt_discrete()]))
  let pth = @tactics.prove(@term_syntax.parse_term("!((x : Int) <= (y : Int)) == (y + int_of_num(1) <= x) && !(x < y) == (y <= x) && !(x == y) == (x + int_of_num(1) <= y || y + int_of_num(1) <= x) && (x < y) == (x + int_of_num(1) <= y)"), t957)
  let atom_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x958 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x958
  }, @list.List([pth]))
  let bub_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x959 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s960 = @equal.top_sweep_conv(x959)
    fn(x961 : @kernel.Term) -> @kernel.Thm raise {
      s960(x961)
    }
  }, @list.List([@int.int_eq(), @int.int_le(), @int.int_lt(), @int.int_ge(), @int.int_gt(), @int.int_of_num_th(), @int.int_neg_th(), @int.int_add_th(), @int.int_mul_th(), @int.int_sub_th(), @int.int_pow_th(), @int.int_abs_th(), @int.int_max_th(), @int.int_min_th()]))
  let base_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.try_conv(atom_conv), bub_conv)
  let nnf_norm_conv : (@kernel.Term) -> @kernel.Thm raise = @canon.gen_nnf_conv(false)((base_conv, fn(x962 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
    let t = x962
    let t963 = base_conv(@bool.mk_neg(t))
    (base_conv(t), t963)
  }))
  let t970 = @simp.gen_rewrite_conv(fn(x967 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s968 = @equal.depth_conv(x967)
    fn(x969 : @kernel.Term) -> @kernel.Thm raise {
      s968(x969)
    }
  }, @list.List([@int.int_gt_v1(), @int.int_ge_v1()]))
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x964 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s965 = @equal.depth_conv(x964)
    fn(x966 : @kernel.Term) -> @kernel.Thm raise {
      s965(x966)
    }
  }, @list.List([@theorems.forall_simp(), @theorems.exists_simp()])), t970), @canon.conds_elim_conv), nnf_norm_conv)
  let p_tm = @term_syntax.parse_term("(p : Bool)")
  let not_tm = @term_syntax.parse_term("op_tilde")
  let pth_1 = @class.taut(@basics.mk_eq(@bool.mk_neg(@bool.mk_neg(p_tm)), p_tm))
  int_sos_c.set(fn(x971 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x971
    let th0 = @kernel.inst_rule(@list.List([(tm, p_tm)]), pth_1)
    let th1 = nnf_norm_conv(@bool.mk_neg(tm))
    let th2 = real_sos(@bool.mk_neg(@kernel.rand(@kernel.concl(th1))))
    @kernel.eq_mp(th0, @kernel.eq_mp(@equal.ap_term(not_tm, @equal.sym(th1)), th2))
  })
}

///|
let int_sos_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("INT_SOS")

///|
/// `INT_SOS`
pub fn int_sos(x : @kernel.Term) -> @kernel.Thm raise {
  (int_sos_c.get())(x)
}

///|
/// `SOS_RULE`
pub fn sos_rule(x972 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x972
  let avs = @kernel.frees(tm)
  let tm_p = @bool.list_mk_forall(avs, tm)
  let th1 = @int.num_to_int_conv(tm_p)
  let th2 = int_sos(@kernel.rand(@kernel.concl(th1)))
  @bool.specl(avs, @kernel.eq_mp(@equal.sym(th1), th2))
}

///|
/// Examples/sos.ml:1048
fn step_31() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// `allpermutations`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] allpermutations(x973 : @list.List[TA]) -> @list.List[@list.List[TA]] raise {
  let l = x973
  if @list.List::is_empty(l) {
    @list.List([@list.List([])])
  } else {
    @lib.itlist(fn(x974 : TA, x975 : @list.List[@list.List[TA]]) -> @list.List[@list.List[TA]] raise {
      let h = x974
      let acc = x975
      @lib.map(fn(x976 : @list.List[TA]) -> @list.List[TA] raise {
        let t = x976
        t.prepend(h)
      }, allpermutations(@lib.subtract(l, @list.List([h])))).concat(acc)
    }, l, @list.List([]))
  }
}

///|
/// `allvarorders`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] allvarorders(x977 : @list.List[TA]) -> @list.List[(TA) -> Int64 raise] raise {
  let l = x977
  @lib.map(fn(x978 : @list.List[TA]) -> ((TA) -> Int64 raise) raise {
    let vlis = x978
    fn(x979 : TA) -> Int64 raise {
      let x = x979
      Int::to_int64(@lib.index(x, vlis))
    }
  }, allpermutations(l))
}

///|
/// `changevariables_monomial`
pub fn changevariables_monomial(x980 : @list.List[(@kernel.Term, @kernel.Term)], x981 : @lib.Func[@kernel.Term, Int64]) -> Monomial raise {
  let zoln = x980
  let _ as m = x981
  @lib.foldl(fn(x982 : @lib.Func[@kernel.Term, Int64], x983 : @kernel.Term, x984 : Int64) -> @lib.Func[@kernel.Term, Int64] raise {
    let a = x982
    let x = x983
    let k = x984
    @lib.update(@lib.assoc(x, zoln), k, a)
  }, monomial_1(), m)
}

///|
/// `changevariables`
pub fn changevariables(x985 : @list.List[(@kernel.Term, @kernel.Term)], x986 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> Poly raise {
  let zoln = x985
  let pol = x986
  @lib.foldl(fn(x987 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num], x988 : @lib.Func[@kernel.Term, Int64], x989 : @num.Num) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let a = x987
    let m = x988
    let c = x989
    @lib.update(changevariables_monomial(zoln, m), c, a)
  }, poly_0(), pol)
}

///|
/// `sdpa_of_vector`
pub fn sdpa_of_vector(x990 : (Int64, @lib.Func[Int64, @num.Num])) -> String raise {
  let _ as v = x990
  let n = vec_dim(v)
  let t994 = @lib.range(1L, n)
  let t992 = decimalize(20L)
  let strs = @lib.map(fn(x993 : Int64) -> String raise {
    t992(((x991 : Int64) => element(v, x991))(x993))
  }, t994)
  (@lib.end_itlist(fn(x995 : String, x996 : String) -> String raise {
    let x = x995
    let y = x996
    (x + (" " + y))
  }, strs) + "\n")
}

///|
/// `sdpa_of_blockdiagonal`
pub fn sdpa_of_blockdiagonal(x997 : Int64, x998 : @lib.Func[(Int64, Int64, Int64), @num.Num]) -> String raise {
  let k = x997
  let m = x998
  let pfx = (Int64::to_string(k) + " ")
  let ents = @lib.foldl(fn(x999 : @list.List[((Int64, Int64, Int64), @num.Num)], x1000 : (Int64, Int64, Int64), x1001 : @num.Num) -> @list.List[((Int64, Int64, Int64), @num.Num)] raise {
    let a = x999
    let (b, i, j) = x1000
    let c = x1001
    if (i > j) {
      a
    } else {
      a.prepend(((b, i, j), c))
    }
  }, @list.List([]), m)
  let entss = @lib.sort((x1003 : ((Int64, Int64, Int64), @num.Num), x1004 : ((Int64, Int64, Int64), @num.Num)) => @lib.increasing(fn(x1002 : ((Int64, Int64, Int64), @num.Num)) -> (Int64, Int64, Int64) raise {
    x1002.0
  }, x1003, x1004), ents)
  @lib.itlist(fn(x1005 : ((Int64, Int64, Int64), @num.Num), x1006 : String) -> String raise {
    let ((b_1, i_1, j_1), c_1) = x1005
    let a_1 = x1006
    let t1007 = ("\n" + a_1)
    let t1008 = (" " + (decimalize(20L)(c_1) + t1007))
    let t1009 = (" " + (Int64::to_string(j_1) + t1008))
    let t1010 = (" " + (Int64::to_string(i_1) + t1009))
    (pfx + (Int64::to_string(b_1) + t1010))
  }, entss, "")
}

///|
/// `sdpa_of_matrix`
pub fn sdpa_of_matrix(x1011 : Int64, x1012 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> String raise {
  let k = x1011
  let _ as m = x1012
  let pfx = (Int64::to_string(k) + " 1 ")
  let ms = @lib.foldr(fn(x1013 : (Int64, Int64), x1014 : @num.Num, x1015 : @list.List[((Int64, Int64), @num.Num)]) -> @list.List[((Int64, Int64), @num.Num)] raise {
    let (i, j) = x1013
    let c = x1014
    let a = x1015
    if (i > j) {
      a
    } else {
      a.prepend(((i, j), c))
    }
  }, m.1, @list.List([]))
  let mss = @lib.sort((x1017 : ((Int64, Int64), @num.Num), x1018 : ((Int64, Int64), @num.Num)) => @lib.increasing(fn(x1016 : ((Int64, Int64), @num.Num)) -> (Int64, Int64) raise {
    x1016.0
  }, x1017, x1018), ms)
  @lib.itlist(fn(x1019 : ((Int64, Int64), @num.Num), x1020 : String) -> String raise {
    let ((i_1, j_1), c_1) = x1019
    let a_1 = x1020
    let t1021 = ("\n" + a_1)
    let t1022 = (" " + (decimalize(20L)(c_1) + t1021))
    let t1023 = (" " + (Int64::to_string(j_1) + t1022))
    (pfx + (Int64::to_string(i_1) + t1023))
  }, mss, "")
}

///|
/// `sdpa_of_problem`
pub fn sdpa_of_problem(x1024 : String, x1025 : (Int64, @lib.Func[Int64, @num.Num]), x1026 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> String raise {
  let comment = x1024
  let obj = x1025
  let mats = x1026
  let m = @lib.sub63(Int::to_int64(@lib.length(mats)), 1L)
  let (n, _) = dimensions(@lib.hd(mats))
  let t1030 = @lib.itlist2(fn(x1027 : Int64, x1028 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]), x1029 : String) -> String raise {
    let k = x1027
    let m_1 = x1028
    let a = x1029
    (sdpa_of_matrix(@lib.sub63(k, 1L), m_1) + a)
  }, @lib.range(1L, Int::to_int64(@lib.length(mats))), mats, "")
  let t1031 = ("\n" + (sdpa_of_vector(obj) + t1030))
  let t1032 = ("\n" + ("1\n" + (Int64::to_string(n) + t1031)))
  ("\"" + (comment + ("\"\n" + (Int64::to_string(m) + t1032))))
}

///|
/// `run_sdpa`
pub fn run_sdpa(x1033 : Bool, x1034 : (Int64, @lib.Func[Int64, @num.Num]), x1035 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let dbg = x1033
  let obj = x1034
  let mats = x1035
  let input_file = @lib.temp_file("sos", ".dat-s")
  let output_file = (@lib.string_sub(input_file, 0, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(input_file)), 6L))) + ".out")
  let params_file = @lib.filename_concat(@lib.temp_path.val, "param.sdpa")
  @lib.file_of_string(input_file, sdpa_of_problem("", obj, mats))
  @lib.file_of_string(params_file, sdpa_params())
  let t1036 = ("; sdpa " + (input_file + (" " + (output_file + (if dbg {
    ""
  } else {
    "> /dev/null"
  })))))
  ignore(Int::to_int64(@lib.sys_command(("cd " + (@lib.temp_path.val + t1036)))))
  let op = @lib.string_of_file(output_file)
  if !sdpa_run_succeeded(op) {
    raise Failure("sdpa: call failed")
  } else {
    let res = parse_sdpaoutput(op)
    if dbg {
      ()
    } else {
      @lib.sys_remove(input_file)
      @lib.sys_remove(output_file)
    }
    res
  }
}

///|
/// `sdpa`
pub fn sdpa(x1037 : (Int64, @lib.Func[Int64, @num.Num]), x1038 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let obj = x1037
  let mats = x1038
  run_sdpa(debugging().val, obj, mats)
}

///|
/// `run_csdp`
pub fn run_csdp(x1039 : Bool, x1040 : (Int64, @lib.Func[Int64, @num.Num]), x1041 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> ((Int64, Vector)) raise {
  let dbg = x1039
  let obj = x1040
  let mats = x1041
  let input_file = @lib.temp_file("sos", ".dat-s")
  let output_file = (@lib.string_sub(input_file, 0, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(input_file)), 6L))) + ".out")
  let params_file = @lib.filename_concat(@lib.temp_path.val, "param.csdp")
  @lib.file_of_string(input_file, sdpa_of_problem("", obj, mats))
  @lib.file_of_string(params_file, csdp_params())
  let t1042 = ("; csdp " + (input_file + (" " + (output_file + (if dbg {
    ""
  } else {
    "> /dev/null"
  })))))
  let rv = Int::to_int64(@lib.sys_command(("cd " + (@lib.temp_path.val + t1042))))
  let op = @lib.string_of_file(output_file)
  let res = parse_csdpoutput(op)
  if dbg {
    ()
  } else {
    @lib.sys_remove(input_file)
    @lib.sys_remove(output_file)
  }
  (rv, res)
}

///|
/// `csdp`
pub fn csdp(x1043 : (Int64, @lib.Func[Int64, @num.Num]), x1044 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> Vector raise {
  let obj = x1043
  let mats = x1044
  let (rv, res) = run_csdp(debugging().val, obj, mats)
  if ((rv == 1L) || (rv == 2L)) {
    raise Failure("csdp: Problem is infeasible")
  } else {
    if (rv == 3L) {
      @pp.std_formatter.print_string("csdp warning: Reduced accuracy")
      {
        @pp.std_formatter.print_newline()
      }
    } else {
      if (rv != 0L) {
        raise Failure(("csdp: error " + Int64::to_string(rv)))
      } else {
        ()
      }
    }
  }
  res
}

///|
/// `sumofsquares_general_symmetry`
pub fn sumofsquares_general_symmetry(x1045 : ((Int64, @lib.Func[Int64, @num.Num])) -> ((@list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> (Int64, @lib.Func[Int64, @num.Num]) raise) raise, x1046 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) -> ((@num.Num, @list.List[(@num.Num, @lib.Func[Monomial, @num.Num])])) raise {
  let tool = x1045
  let pol = x1046
  let vars = poly_variables(pol)
  let lpps = newton_polytope(pol)
  let n = Int::to_int64(@lib.length(lpps))
  let invariants = @lib.filter(fn(x1047 : @list.List[@kernel.Term]) -> Bool raise {
    let vars_p = x1047
    @lib.is_undefined(poly_sub(pol, changevariables(@lib.zip(vars, vars_p), pol)))
  }, allpermutations(vars))
  let lpps2 = @lib.allpairs(fn(x1048 : @lib.Func[@kernel.Term, Int64], x1049 : @lib.Func[@kernel.Term, Int64]) -> @lib.Func[@kernel.Term, Int64] raise {
    let s1050 = monomial_mul(x1048)
    s1050(x1049)
  }, lpps, lpps)
  let lpp2_classes = @lib.setify(@lib.map(fn(x1051 : @lib.Func[@kernel.Term, Int64]) -> @list.List[@lib.Func[@kernel.Term, Int64]] raise {
    let m = x1051
    @lib.setify(@lib.map(fn(x1052 : @list.List[@kernel.Term]) -> @lib.Func[@kernel.Term, Int64] raise {
      let vars_p_1 = x1052
      changevariables_monomial(@lib.zip(vars, vars_p_1), m)
    }, invariants))
  }, lpps2))
  let lpns = @lib.zip(lpps, @lib.range(1L, Int::to_int64(@lib.length(lpps))))
  let lppcs = @lib.filter(fn(x1053 : ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))) -> Bool raise {
    let (m_1, (n1, n2)) = x1053
    (n1 <= n2)
  }, @lib.allpairs(fn(x1054 : (@lib.Func[@kernel.Term, Int64], Int64), x1055 : (@lib.Func[@kernel.Term, Int64], Int64)) -> ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64)) raise {
    let (m1, n1_1) = x1054
    let (m2, n2_1) = x1055
    ((m1, m2), (n1_1, n2_1))
  }, lpns, lpns))
  let clppcs = @lib.end_itlist(fn(x1058 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))], x1059 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) -> @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))] raise {
    let s1060 = (fn(x1056 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) -> ((@list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) -> @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))] raise) raise {
      fn(x1057 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) -> @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))] raise {
        x1056.concat(x1057)
      }
    })(x1058)
    s1060(x1059)
  }, @lib.map(fn(x1061 : ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))) -> @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))] raise {
    let ((m1_1, m2_1), (n1_2, n2_2)) = x1061
    @lib.map(fn(x1062 : @list.List[@kernel.Term]) -> ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64)) raise {
      let vars_p_2 = x1062
      let t1063 = changevariables_monomial(@lib.zip(vars, vars_p_2), m2_1)
      ((changevariables_monomial(@lib.zip(vars, vars_p_2), m1_1), t1063), (n1_2, n2_2))
    }, invariants)
  }, lppcs))
  let clppcs_dom = @lib.setify(@lib.map(fn(x1064 : ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))) -> (@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]) raise {
    x1064.0
  }, clppcs))
  let clppcs_cls = @lib.map(fn(x1065 : (@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64])) -> @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))] raise {
    let d = x1065
    @lib.filter(fn(x1066 : ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))) -> Bool raise {
      let (e, _) = x1066
      (e == d)
    }, clppcs)
  }, clppcs_dom)
  let eqvcls = @lib.map(fn(x1070 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) -> @list.List[(Int64, Int64)] raise {
    (fn(x1067 : @list.List[(Int64, Int64)]) -> @list.List[(Int64, Int64)] raise {
      @lib.setify(x1067)
    })(((x1069 : @list.List[((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))]) => @lib.map(fn(x1068 : ((@lib.Func[@kernel.Term, Int64], @lib.Func[@kernel.Term, Int64]), (Int64, Int64))) -> (Int64, Int64) raise {
      x1068.1
    }, x1069))(x1070))
  }, clppcs_cls)
  let sym_eqs = @lib.itlist(mk_eq_l, eqvcls, @list.List([]))
  let eqs = @lib.foldl(fn(x1075 : @list.List[@lib.Func[(Int64, Int64), @num.Num]], x1076 : @lib.Func[@kernel.Term, Int64], x1077 : @lib.Func[(Int64, Int64), @num.Num]) -> @list.List[@lib.Func[(Int64, Int64), @num.Num]] raise {
    let a = x1075
    let x = x1076
    let y = x1077
    a.prepend(y)
  }, @list.List([]), itern(1L, lpps, fn(x1078 : @lib.Func[@kernel.Term, Int64]) -> ((Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise) raise) raise {
    let m1_2 = x1078
    fn(x1079 : Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise) raise {
      let n1_3 = x1079
      (x1084 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) => itern(1L, lpps, fn(x1081 : @lib.Func[@kernel.Term, Int64]) -> ((Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise) raise) raise {
        let m2_2 = x1081
        fn(x1082 : Int64) -> ((@lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise) raise {
          let n2_3 = x1082
          fn(x1083 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise {
            let f = x1083
            let m_2 = monomial_mul(m1_2)(m2_2)
            if (n1_3 > n2_3) {
              f
            } else {
              let c = if (n1_3 == n2_3) {
                @num.num_of_int64(1L)
              } else {
                @num.num_of_int64(2L)
              }
              @lib.update(m_2, @lib.update((n1_3, n2_3), c, @lib.tryapplyd(f, m_2, @lib.undefined())), f)
            }
          }
        }
      }, x1084)
    }
  }, @lib.foldl(fn(x1085 : @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]], x1086 : @lib.Func[@kernel.Term, Int64], x1087 : @num.Num) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @lib.Func[(Int64, Int64), @num.Num]] raise {
    let a_1 = x1085
    let m_3 = x1086
    let c_1 = x1087
    @lib.update(m_3, @lib.single((0L, 0L), c_1), a_1)
  }, @lib.undefined(), pol))).concat(sym_eqs)
  let (pvs, assig) = eliminate_all_equations((0L, 0L))(eqs)
  let allassig = @lib.itlist(fn(x1088 : (Int64, Int64), x1089 : @lib.Func[(Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[(Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]] raise {
    let v = x1088
    let t1090 = @lib.single(v, @num.num_of_int64(1L))
    (fn(x1092 : @lib.Func[(Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]]) -> @lib.Func[(Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]] raise {
      ((x1091 : @lib.Func[(Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]]) => @lib.update(v, t1090, x1091))(x1092)
    })(x1089)
  }, pvs, assig)
  let qvars = pvs.prepend((0L, 0L))
  let diagents = @lib.end_itlist(equation_add, @lib.map(fn(x1093 : Int64) -> @lib.Func[(Int64, Int64), @num.Num] raise {
    let i = x1093
    @lib.apply(allassig, (i, i))
  }, @lib.range(1L, n)))
  let mk_matrix : ((Int64, Int64)) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise = fn(x1094 : (Int64, Int64)) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise {
    let v_1 = x1094
    ((n, n), @lib.foldl(fn(x1095 : @lib.Func[(Int64, Int64), @num.Num], x1096 : (Int64, Int64), x1097 : @lib.Func[(Int64, Int64), @num.Num]) -> @lib.Func[(Int64, Int64), @num.Num] raise {
      let m_4 = x1095
      let (i_1, j) = x1096
      let ass = x1097
      let c_2 = @lib.tryapplyd(ass, v_1, @num.num_of_int64(0L))
      if @num.eq_num(c_2, @num.num_of_int64(0L)) {
        m_4
      } else {
        @lib.update((j, i_1), c_2, @lib.update((i_1, j), c_2, m_4))
      }
    }, @lib.undefined(), allassig))
  }
  let mats = @lib.map(mk_matrix, qvars)
  let t1103 = itern(1L, pvs, fn(x1098 : (Int64, Int64)) -> ((Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise) raise {
    let v_2 = x1098
    fn(x1099 : Int64) -> ((@lib.Func[Int64, @num.Num]) -> @lib.Func[Int64, @num.Num] raise) raise {
      let i_2 = x1099
      let t1101 = @lib.tryapplyd(diagents, v_2, @num.num_of_int64(0L))
      (x1102 : @lib.Func[Int64, @num.Num]) => op_bar_minus_minus_gt(i_2, t1101, x1102)
    }
  }, @lib.undefined())
  let obj = (Int::to_int64(@lib.length(pvs)), t1103)
  let raw_vec = if @list.List::is_empty(pvs) {
    vec_0(0L)
  } else {
    tool(obj)(mats)
  }
  let find_rounding : (@num.Num) -> (@num.Num, @list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))]) raise = fn(x1104 : @num.Num) -> (@num.Num, @list.List[(@num.Num, (Int64, @lib.Func[Int64, @num.Num]))]) raise {
    let d_1 = x1104
    if debugging().val {
      @pp.std_formatter.print_string(("Trying rounding with limit " + @num.string_of_num(d_1)))
      {
        @pp.std_formatter.print_newline()
      }
    } else {
      ()
    }
    let vec = nice_vector(d_1)(raw_vec)
    let t1108 = matrix_neg(@lib.el(0, mats))
    let mat = iter((1L, vec_dim(vec)), fn(x1105 : Int64) -> ((((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise) raise {
      let i_3 = x1105
      fn(x1106 : ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])) -> ((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num]) raise {
        let a_2 = x1106
        let t1107 = @lib.el(@lib.int63_to_int(i_3), mats)
        matrix_add(matrix_cmul(element(vec, i_3), t1107), a_2)
      }
    }, t1108)
    deration(diag(mat))
  }
  let (rat, dia) = if @list.List::is_empty(pvs) {
    let mat_1 = matrix_neg(@lib.el(0, mats))
    deration(diag(mat_1))
  } else {
    let t1111 = @lib.map(fn(x1110 : Int64) -> @num.Num raise {
      @num.pow2(@lib.int63_to_int(x1110))
    }, @lib.range(5L, 66L))
    @lib.tryfind(find_rounding, @lib.map(fn(x1109 : Int64) -> @num.Num raise {
      @num.num_of_int64(x1109)
    }, @lib.range(1L, 31L)).concat(t1111))
  }
  let lins = @lib.map(fn(x1117 : (@num.Num, (Int64, @lib.Func[Int64, @num.Num]))) -> (@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) raise {
    ((x1112, x1113) => poly_of_lin_l(lpps, x1112, x1113))(x1117.0, x1117.1)
  }, dia)
  let sqs = @lib.map(fn(x1118 : (@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])) -> @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num] raise {
    let (d_3, l) = x1118
    let t1119 = poly_pow(l, 2L)
    poly_mul(poly_const(d_3), t1119)
  }, lins)
  let sos = poly_cmul(rat, @lib.end_itlist(poly_add, sqs))
  if @lib.is_undefined(poly_sub(sos, pol)) {
    (rat, lins)
  } else {
    raise Sanity::Sanity
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] mk_eq_l(x1071 : @list.List[TA], x1072 : @list.List[@lib.Func[TA, @num.Num]]) -> @list.List[@lib.Func[TA, @num.Num]] raise {
  let cls = x1071
  let acc = x1072
  match cls {
    Empty => raise Sanity::Sanity
    More(h, tail=Empty) => acc
    More(h_1, tail=t) => @lib.map(fn(x1073 : TA) -> @lib.Func[TA, @num.Num] raise {
      let k = x1073
      let t1074 = @lib.single(h_1, @num.num_of_int64(1L))
      @lib.update(k, @num.num_of_int64((-1L)), t1074)
    }, t).concat(acc)
  }
}

///|
fn[TB, TC, TD] poly_of_lin_l(lpps : @list.List[@lib.Func[@kernel.Term, Int64]], x1112 : TB, x1113 : (TD, @lib.Func[Int64, TC])) -> ((TB, @lib.Func[Monomial, TC])) raise {
  let (d_2, v_3) = (x1112, x1113)
  (d_2, @lib.foldl(fn(x1114 : @lib.Func[@lib.Func[@kernel.Term, Int64], TC], x1115 : Int64, x1116 : TC) -> @lib.Func[@lib.Func[@kernel.Term, Int64], TC] raise {
    let a_3 = x1114
    let i_4 = x1115
    let c_3 = x1116
    @lib.update(@lib.el(@lib.int63_to_int(@lib.sub63(i_4, 1L)), lpps), c_3, a_3)
  }, @lib.undefined(), v_3.1))
}

///|
/// sumofsquares
fn step_32() -> Unit raise {
  sumofsquares_c.set((x1122 : @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num]) => sumofsquares_general_symmetry(fn(x1120 : (Int64, @lib.Func[Int64, @num.Num])) -> ((@list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> (Int64, @lib.Func[Int64, @num.Num]) raise) raise {
    fn(x1121 : @list.List[((Int64, Int64), @lib.Func[(Int64, Int64), @num.Num])]) -> (Int64, @lib.Func[Int64, @num.Num]) raise {
      csdp(x1120, x1121)
    }
  }, x1122))
}

///|
let sumofsquares_c : @lib.Cell[(Poly) -> (@num.Num, @list.List[(@num.Num, @lib.Func[Monomial, @num.Num])]) raise] = @lib.Cell::new("sumofsquares")

///|
/// `sumofsquares`
pub fn sumofsquares(x : Poly) -> ((@num.Num, @list.List[(@num.Num, @lib.Func[Monomial, @num.Num])])) raise {
  (sumofsquares_c.get())(x)
}

///|
/// SOS_CONV
fn step_33() -> Unit raise {
  let pow_tm = @term_syntax.parse_term("real_pow")
  let two_tm = @term_syntax.parse_term("2")
  let mk_square : (@kernel.Term) -> @kernel.Term raise = fn(x1123 : @kernel.Term) -> @kernel.Term raise {
    let tm = x1123
    @kernel.mk_comb(@kernel.mk_comb(pow_tm, tm), two_tm)
  }
  let t1124 = @term_syntax.parse_term("real_mul")
  let mk_prod : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x1127 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x1128 : @kernel.Term) -> @kernel.Term raise {
      ((x1125 : @kernel.Term, x1126 : @kernel.Term) => @basics.mk_binop(t1124, x1125, x1126))(x1127, x1128)
    }
  }
  let t1129 = @term_syntax.parse_term("real_add")
  let mk_sum : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x1132 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x1133 : @kernel.Term) -> @kernel.Term raise {
      ((x1130 : @kernel.Term, x1131 : @kernel.Term) => @basics.mk_binop(t1129, x1130, x1131))(x1132, x1133)
    }
  }
  sos_conv_c.set(fn(x1134 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x1134
    let (k, sos) = sumofsquares(poly_of_term(tm_1))
    let mk_sqtm : ((@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])) -> @kernel.Term raise = fn(x1135 : (@num.Num, @lib.Func[@lib.Func[@kernel.Term, Int64], @num.Num])) -> @kernel.Term raise {
      let (c, p) = x1135
      let t1136 = mk_square(term_of_poly(p))
      mk_prod(@calc_int.term_of_rat(@num.mult_num(k, c)))(t1136)
    }
    let tm_p = @lib.end_itlist(fn(x1137 : @kernel.Term, x1138 : @kernel.Term) -> @kernel.Term raise {
      let s1139 = mk_sum(x1137)
      s1139(x1138)
    }, @lib.map(mk_sqtm, sos))
    let th = @calc_rat.real_poly_conv(tm_1)
    let th_p = @calc_rat.real_poly_conv(tm_p)
    @kernel.trans(th, @equal.sym(th_p))
  })
}

///|
let sos_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("SOS_CONV")

///|
/// `SOS_CONV`
pub fn sos_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (sos_conv_c.get())(x)
}

///|
/// PURE_SOS_TAC
fn step_34() -> Unit raise {
  let t1143 = @tactics.conv_tac(@equal.thenc(@equal.rand_conv(@calc_rat.real_rat_reduce_conv), @calc_rat.real_rat_le_conv))
  let t1142 = @tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac)
  let t1141 = @tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), @tactics.conj_tac)
  let t1140 = @tactics.match_accept_tac(@realarith.real_le_square())
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_accept_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realarith.real_pow_2())]))(@realarith.real_le_square())), t1140), t1141), t1142), t1143)
  let t1148 = @tactics.repeat_tac(tac)
  let t1147 = @tactics.conv_tac(@equal.rand_conv(sos_conv))
  let t1146 = @simp.gen_rewrite_tac(fn(x1145 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1145
  }, @list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t1144 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  pure_sos_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1144), t1146), t1147), t1148), @tactics.no_tac))
}

///|
let pure_sos_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("PURE_SOS_TAC")

///|
/// `PURE_SOS_TAC`
pub fn pure_sos_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (pure_sos_tac_c.get())(x)
}

///|
/// `PURE_SOS`
pub fn pure_sos(x1149 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1149
  @tactics.prove(tm, pure_sos_tac)
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
}
