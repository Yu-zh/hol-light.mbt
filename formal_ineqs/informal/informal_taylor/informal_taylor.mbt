// Translated from upstream Formal_ineqs/informal/informal_taylor.hl; edit this file directly.

///|
/// `m_cell_domain`
#derive(Eq, Debug)
pub(all) struct MCellDomain {
  lo : @list.List[@informal_float.Ifloat]
  hi : @list.List[@informal_float.Ifloat]
  y : @list.List[@informal_float.Ifloat]
  w : @list.List[@informal_float.Ifloat]
}

///|
pub extend MCellDomain with Eq::{not_equal, equal}

///|
pub extend MCellDomain with Debug::{to_repr}

///|
pub extend MCellDomain with @lib.OCompare::{ocompare}

///|
pub extend MCellDomain with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for MCellDomain with fn ocompare(self, other) {
  let c = @lib.compare(self.lo, other.lo)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.hi, other.hi)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.y, other.y)
  if c != 0 {
    return c
  }
  @lib.compare(self.w, other.w)
}

///|
pub impl @lib.OHash for MCellDomain with fn ohash_visit(self, h) {
  h.block(0, 4)
  h.field(self.lo)
  h.field(self.hi)
  h.field(self.y)
  h.field(self.w)
}

///|
/// `m_taylor_interval`
#derive(Eq, Debug)
pub(all) struct MTaylorInterval {
  n : Int64
  domain : MCellDomain
  f : @informal_interval.Interval
  df : @list.List[@informal_interval.Interval]
  ddf : @list.List[@list.List[@informal_interval.Interval]]
}

///|
pub extend MTaylorInterval with Eq::{not_equal, equal}

///|
pub extend MTaylorInterval with Debug::{to_repr}

///|
pub extend MTaylorInterval with @lib.OCompare::{ocompare}

///|
pub extend MTaylorInterval with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for MTaylorInterval with fn ocompare(self, other) {
  let c = @lib.compare(self.n, other.n)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.domain, other.domain)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.f, other.f)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.df, other.df)
  if c != 0 {
    return c
  }
  @lib.compare(self.ddf, other.ddf)
}

///|
pub impl @lib.OHash for MTaylorInterval with fn ohash_visit(self, h) {
  h.block(0, 5)
  h.field(self.n)
  h.field(self.domain)
  h.field(self.f)
  h.field(self.df)
  h.field(self.ddf)
}

///|
/// float_0
fn step_1() -> Unit raise {
  float_0_c.set(@informal_float.mk_small_num_float(0L))
}

///|
let float_0_c : @lib.Cell[@informal_float.Ifloat] = @lib.Cell::new("float_0")

///|
/// `Informal_taylor.float_0`
pub fn float_0() -> @informal_float.Ifloat {
  float_0_c.get()
}

///|
/// float_1
fn step_2() -> Unit raise {
  float_1_c.set(@informal_float.mk_small_num_float(1L))
}

///|
let float_1_c : @lib.Cell[@informal_float.Ifloat] = @lib.Cell::new("float_1")

///|
/// `Informal_taylor.float_1`
pub fn float_1() -> @informal_float.Ifloat {
  float_1_c.get()
}

///|
/// float_2
fn step_3() -> Unit raise {
  float_2_c.set(@informal_float.mk_small_num_float(2L))
}

///|
let float_2_c : @lib.Cell[@informal_float.Ifloat] = @lib.Cell::new("float_2")

///|
/// `Informal_taylor.float_2`
pub fn float_2() -> @informal_float.Ifloat {
  float_2_c.get()
}

///|
/// float_inv2
fn step_4() -> Unit raise {
  float_inv2_c.set(@informal_float.div_float_lo(1L, float_1(), float_2()))
}

///|
let float_inv2_c : @lib.Cell[@informal_float.Ifloat] = @lib.Cell::new("float_inv2")

///|
/// `Informal_taylor.float_inv2`
pub fn float_inv2() -> @informal_float.Ifloat {
  float_inv2_c.get()
}

///|
/// `convert_to_float_list`
pub fn convert_to_float_list(x1 : Int64, x2 : Bool, x3 : @kernel.Term) -> @list.List[@informal_float.Ifloat] raise {
  let pp = x1
  let lo_flag = x2
  let list_tm = x3
  let tms = @basics.dest_list(list_tm)
  let i_funs = @lib.map(@informal_eval_interval.build_interval_fun, tms)
  let ints = @lib.map(fn(x4 : @informal_eval_interval.IntervalFun) -> @informal_interval.Interval raise {
    let f = x4
    @informal_eval_interval.eval_interval_fun(pp)(f)(@list.List([]))(@list.List([]))
  }, i_funs)
  let t8 = if lo_flag {
    fn(x5 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
      x5.0
    }
  } else {
    fn(x6 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
      x6.1
    }
  }
  let extract : (@informal_interval.Interval) -> @informal_float.Ifloat raise = fn(x9 : @informal_interval.Interval) -> @informal_float.Ifloat raise {
    t8((fn(x7 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
      @informal_interval.dest_interval(x7.0, x7.1)
    })(x9))
  }
  @lib.map(extract, ints)
}

///|
/// `mk_m_center_domain`
pub fn mk_m_center_domain(x10 : Int64, x11 : @list.List[@informal_float.Ifloat], x12 : @list.List[@informal_float.Ifloat]) -> MCellDomain raise {
  let pp = x10
  let x_list = x11
  let z_list = x12
  let (op_star, op_plus) = (fn(x13 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x14 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      @informal_float.mul_float_eq(x13, x14)
    }
  }, fn(x17 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x18 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x15 : (Bool, @bigint.BigInt, Int64), x16 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x15, x16))(x17, x18)
    }
  })
  let y_list = @lib.map2(fn(x19 : @informal_float.Ifloat, x20 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let x = x19
    let z = x20
    if @informal_float.eq_float(x, z) {
      x
    } else {
      let t21 = op_plus(x)(z)
      op_star(float_inv2())(t21)
    }
  }, x_list, z_list)
  let flag1 = @lib.itlist2(fn(x22 : @informal_float.Ifloat, x23 : @informal_float.Ifloat, x24 : Bool) -> Bool raise {
    let x_1 = x22
    let y = x23
    let a = x24
    (@informal_float.le_float(x_1, y) && a)
  }, x_list, y_list, true)
  let flag2 = @lib.itlist2(fn(x25 : @informal_float.Ifloat, x26 : @informal_float.Ifloat, x27 : Bool) -> Bool raise {
    let y_1 = x25
    let z_1 = x26
    let a_1 = x27
    (@informal_float.le_float(y_1, z_1) && a_1)
  }, y_list, z_list, true)
  if (!flag1 || !flag2) {
    raise Failure("mk_m_center_domain: ~(x <= y <= z)")
  } else {
    let op_minus : (@informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise = fn(x30 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
      fn(x31 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
        ((x28 : (Bool, @bigint.BigInt, Int64), x29 : (Bool, @bigint.BigInt, Int64)) => @informal_float.sub_float_hi(pp, x28, x29))(x30, x31)
      }
    }
    let w1 = @lib.map2(fn(x32 : @informal_float.Ifloat, x33 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      let s34 = op_minus(x32)
      s34(x33)
    }, y_list, x_list)
    let w2 = @lib.map2(fn(x35 : @informal_float.Ifloat, x36 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      let s37 = op_minus(x35)
      s37(x36)
    }, z_list, y_list)
    let w_list = @lib.map2(@informal_float.max_float, w1, w2)
    MCellDomain::{ lo: x_list, hi: z_list, y: y_list, w: w_list }
  }
}

///|
/// `eval_m_taylor`
pub fn eval_m_taylor(x38 : Int64, x39 : @kernel.Term, x40 : @list.List[@kernel.Thm], x41 : @list.List[@list.List[@kernel.Thm]]) -> ((Int64) -> ((Int64) -> ((MCellDomain) -> MTaylorInterval raise) raise) raise) raise {
  let pp0 = x38
  let f_tm = x39
  let partials = x40
  let partials2 = x41
  let t43 = @informal_eval_interval.eval_constants(pp0)
  let build : (@kernel.Term) -> @informal_eval_interval.IntervalFun raise = fn(x47 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
    (fn(x46 : (@kernel.Term, @kernel.Term)) -> @informal_eval_interval.IntervalFun raise {
      (fn(x44 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
        t43(@informal_eval_interval.build_interval_fun(x44))
      })((fn(x45 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x45.1
      })(x46))
    })(@kernel.dest_abs(x47))
  }
  let f = build(f_tm)
  let n = Int::to_int64(@lib.length(partials))
  let _ = @lib.map2(fn(x48 : Int64, x49 : @list.List[@kernel.Thm]) -> Unit raise {
    let i = x48
    let list = x49
    if (Int::to_int64(@lib.length(list)) != i) {
      raise Failure("eval_m_taylor: incorrect partials2")
    } else {
      ()
    }
  }, @lib.range(1L, n), partials2)
  let dfs = @lib.map(fn(x52 : @kernel.Thm) -> @informal_eval_interval.IntervalFun raise {
    (fn(x50 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
      build(@kernel.rand(x50))
    })((fn(x51 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x51)
    })(x52))
  }, partials)
  let d2fs = @lib.map(fn(x55 : @kernel.Thm) -> @informal_eval_interval.IntervalFun raise {
    (fn(x53 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
      build(@kernel.rand(x53))
    })((fn(x54 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x54)
    })(x55))
  }, @lib.flat(partials2))
  let f_dfs_list = @informal_eval_interval.find_and_replace_all(dfs.prepend(f), @list.List([]))
  let d2fs_list = @informal_eval_interval.find_and_replace_all(d2fs, @list.List([]))
  fn(x58 : Int64) -> ((Int64) -> ((MCellDomain) -> MTaylorInterval raise) raise) raise {
    let p_lin = x58
    fn(x59 : Int64) -> ((MCellDomain) -> MTaylorInterval raise) raise {
      let p_second = x59
      fn(x60 : MCellDomain) -> MTaylorInterval raise {
        let domain = x60
        let y_ints = @lib.map(fn(x61 : @informal_float.Ifloat) -> @informal_interval.Interval raise {
          let y = x61
          @informal_interval.mk_interval(y, y)
        }, domain.y)
        let t63 = domain.hi
        let xz_ints = @lib.map(fn(x62 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_interval.Interval raise {
          @informal_interval.mk_interval(x62.0, x62.1)
        }, @lib.zip(domain.lo, t63))
        let f_dfs_vals = @informal_eval_interval.eval_interval_fun_list(p_lin, f_dfs_list, y_ints)
        let d2fs_vals = @informal_eval_interval.eval_interval_fun_list(p_second, d2fs_list, xz_ints)
        let t64 = ((x56, x57) => shape_list_l(n, x56, x57))(d2fs_vals, 1L)
        let t65 = @lib.tl(f_dfs_vals)
        MTaylorInterval::{ n: n, domain: domain, f: @lib.hd(f_dfs_vals), df: t65, ddf: t64 }
      }
    }
  }
}

///|
fn[TH] shape_list_l(n : Int64, x56 : @list.List[TH], x57 : Int64) -> @list.List[@list.List[TH]] raise {
  let shape_list = (x56 : @list.List[TH], x57 : Int64) => shape_list_l(n, x56, x57)
  let dd = x56
  let i_1 = x57
  if (i_1 >= n) {
    @list.List([dd])
  } else {
    let (l1, l2) = @lib.chop_list(@lib.int63_to_int(i_1), dd)
    shape_list(l2, @lib.add63(i_1, 1L)).prepend(l1)
  }
}

///|
/// `mk_eval_function`
pub fn mk_eval_function(x66 : Int64, x67 : @kernel.Term) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise) raise {
  let pp0 = x66
  let f_tm = x67
  let t69 = @informal_eval_interval.eval_constants(pp0)
  let build : (@kernel.Term) -> @informal_eval_interval.IntervalFun raise = fn(x73 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
    (fn(x72 : (@kernel.Term, @kernel.Term)) -> @informal_eval_interval.IntervalFun raise {
      (fn(x70 : @kernel.Term) -> @informal_eval_interval.IntervalFun raise {
        t69(@informal_eval_interval.build_interval_fun(x70))
      })((fn(x71 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x71.1
      })(x72))
    })(@kernel.dest_abs(x73))
  }
  let f = build(f_tm)
  let f_list = @informal_eval_interval.find_and_replace_all(@list.List([f]), @list.List([]))
  fn(x74 : Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise {
    let pp = x74
    fn(x75 : @list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise {
      let x_list = x75
      fn(x76 : @list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise {
        let z_list = x76
        let xz_ints = @lib.map(fn(x77 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_interval.Interval raise {
          @informal_interval.mk_interval(x77.0, x77.1)
        }, @lib.zip(x_list, z_list))
        let f_val = @informal_eval_interval.eval_interval_fun_list(pp, f_list, xz_ints)
        @lib.hd(f_val)
      }
    }
  }
}

///|
/// `error_mul_f2_hi`
pub fn error_mul_f2_hi(x78 : Int64, x79 : @informal_float.Ifloat, x80 : @informal_interval.Interval) -> @informal_float.Ifloat raise {
  let pp = x78
  let a = x79
  let int = x80
  @informal_float.mul_float_hi(pp, a, @informal_interval.iabs_interval(int.0, int.1))
}

///|
/// `eval_m_taylor_error`
pub fn eval_m_taylor_error(x81 : Int64, x82 : MTaylorInterval) -> @informal_float.Ifloat raise {
  let pp = x81
  let ti = x82
  let w = (ti.domain).w
  let ns = @lib.range(1L, ti.n)
  let (op_star, op_plus) = (fn(x85 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x86 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x83 : (Bool, @bigint.BigInt, Int64), x84 : (Bool, @bigint.BigInt, Int64)) => @informal_float.mul_float_hi(pp, x83, x84))(x85, x86)
    }
  }, fn(x89 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x90 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x87 : (Bool, @bigint.BigInt, Int64), x88 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x87, x88))(x89, x90)
    }
  })
  let mul_wdd = @lib.map2(fn(x91 : @list.List[@informal_interval.Interval], x92 : Int64) -> @list.List[@informal_float.Ifloat] raise {
    let list = x91
    let i = x92
    @misc_functions.my_map2(fn(x95 : @informal_float.Ifloat) -> ((@informal_interval.Interval) -> @informal_float.Ifloat raise) raise {
      fn(x96 : @informal_interval.Interval) -> @informal_float.Ifloat raise {
        ((x93 : @informal_float.Ifloat, x94 : @informal_interval.Interval) => error_mul_f2_hi(pp, x93, x94))(x95, x96)
      }
    }, w, list)
  }, ti.ddf, ns)
  let sums1 = @lib.map(fn(x101 : @list.List[@informal_float.Ifloat]) -> @informal_float.Ifloat raise {
    ((x100 : @list.List[@informal_float.Ifloat]) => @lib.end_itlist(fn(x97 : @informal_float.Ifloat, x98 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      let s99 = op_plus(x97)
      s99(x98)
    }, x100))(@lib.butlast(x101))
  }, @lib.tl(mul_wdd))
  let t105 = @lib.map2(fn(x102 : @list.List[@informal_float.Ifloat], x103 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let list_1 = x102
    let t1 = x103
    let t104 = op_star(float_2())(t1)
    op_plus(@lib.last(list_1))(t104)
  }, @lib.tl(mul_wdd), sums1)
  let sums2 = t105.prepend(@lib.hd(@lib.hd(mul_wdd)))
  let sums = @lib.map2(fn(x106 : @informal_float.Ifloat, x107 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let s108 = op_star(x106)
    s108(x107)
  }, w, sums2)
  @lib.end_itlist(fn(x109 : @informal_float.Ifloat, x110 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let s111 = op_plus(x109)
    s111(x110)
  }, sums)
}

///|
/// `eval_m_taylor_upper_bound`
pub fn eval_m_taylor_upper_bound(x112 : Int64, x113 : MTaylorInterval) -> @informal_float.Ifloat raise {
  let pp = x112
  let ti = x113
  let t116 = ti.f
  let f_hi = (fn(x114 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
    x114.1
  })((fn(x115 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
    @informal_interval.dest_interval(x115.0, x115.1)
  })(t116))
  let error = eval_m_taylor_error(pp, ti)
  let (op_star, op_plus) = (fn(x119 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x120 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x117 : (Bool, @bigint.BigInt, Int64), x118 : (Bool, @bigint.BigInt, Int64)) => @informal_float.mul_float_hi(pp, x117, x118))(x119, x120)
    }
  }, fn(x123 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x124 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x121 : (Bool, @bigint.BigInt, Int64), x122 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x121, x122))(x123, x124)
    }
  })
  let t127 = ti.df
  let mul_wd = @lib.map2((x125 : @informal_float.Ifloat, x126 : @informal_interval.Interval) => error_mul_f2_hi(pp, x125, x126), (ti.domain).w, t127)
  let sum2 = @lib.end_itlist(fn(x128 : @informal_float.Ifloat, x129 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let s130 = op_plus(x128)
    s130(x129)
  }, mul_wd)
  let t131 = op_star(float_inv2())(error)
  let a = op_plus(sum2)(t131)
  op_plus(f_hi)(a)
}

///|
/// `eval_m_taylor_lower_bound`
pub fn eval_m_taylor_lower_bound(x132 : Int64, x133 : MTaylorInterval) -> @informal_float.Ifloat raise {
  let pp = x132
  let ti = x133
  let t136 = ti.f
  let f_lo = (fn(x134 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
    x134.0
  })((fn(x135 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
    @informal_interval.dest_interval(x135.0, x135.1)
  })(t136))
  let error = eval_m_taylor_error(pp, ti)
  let (op_star, op_plus, op_minus) = (fn(x139 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x140 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x137 : (Bool, @bigint.BigInt, Int64), x138 : (Bool, @bigint.BigInt, Int64)) => @informal_float.mul_float_hi(pp, x137, x138))(x139, x140)
    }
  }, fn(x143 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x144 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x141 : (Bool, @bigint.BigInt, Int64), x142 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x141, x142))(x143, x144)
    }
  }, fn(x147 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x148 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x145 : (Bool, @bigint.BigInt, Int64), x146 : (Bool, @bigint.BigInt, Int64)) => @informal_float.sub_float_lo(pp, x145, x146))(x147, x148)
    }
  })
  let t151 = ti.df
  let mul_wd = @lib.map2((x149 : @informal_float.Ifloat, x150 : @informal_interval.Interval) => error_mul_f2_hi(pp, x149, x150), (ti.domain).w, t151)
  let sum2 = @lib.end_itlist(fn(x152 : @informal_float.Ifloat, x153 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let s154 = op_plus(x152)
    s154(x153)
  }, mul_wd)
  let t155 = op_star(float_inv2())(error)
  let a = op_plus(sum2)(t155)
  op_minus(f_lo)(a)
}

///|
/// `eval_m_taylor_bound`
pub fn eval_m_taylor_bound(x156 : Int64, x157 : MTaylorInterval) -> @informal_interval.Interval raise {
  let pp = x156
  let ti = x157
  let t158 = ti.f
  let (f_lo, f_hi) = @informal_interval.dest_interval(t158.0, t158.1)
  let error = eval_m_taylor_error(pp, ti)
  let (op_star, op_plus, op_minus) = (fn(x161 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x162 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x159 : (Bool, @bigint.BigInt, Int64), x160 : (Bool, @bigint.BigInt, Int64)) => @informal_float.mul_float_hi(pp, x159, x160))(x161, x162)
    }
  }, fn(x165 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x166 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x163 : (Bool, @bigint.BigInt, Int64), x164 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x163, x164))(x165, x166)
    }
  }, fn(x169 : @informal_float.Ifloat) -> ((@informal_float.Ifloat) -> @informal_float.Ifloat raise) raise {
    fn(x170 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
      ((x167 : (Bool, @bigint.BigInt, Int64), x168 : (Bool, @bigint.BigInt, Int64)) => @informal_float.sub_float_lo(pp, x167, x168))(x169, x170)
    }
  })
  let t173 = ti.df
  let mul_wd = @lib.map2((x171 : @informal_float.Ifloat, x172 : @informal_interval.Interval) => error_mul_f2_hi(pp, x171, x172), (ti.domain).w, t173)
  let sum2 = @lib.end_itlist(fn(x174 : @informal_float.Ifloat, x175 : @informal_float.Ifloat) -> @informal_float.Ifloat raise {
    let s176 = op_plus(x174)
    s176(x175)
  }, mul_wd)
  let t177 = op_star(float_inv2())(error)
  let a = op_plus(sum2)(t177)
  let hi = op_plus(f_hi)(a)
  let lo = op_minus(f_lo)(a)
  @informal_interval.mk_interval(lo, hi)
}

///|
/// `eval_m_taylor_partial_upper`
pub fn eval_m_taylor_partial_upper(x178 : Int64, x179 : Int64, x180 : MTaylorInterval) -> @informal_float.Ifloat raise {
  let pp = x178
  let i = x179
  let ti = x180
  let t187 = @lib.sub63(i, 1L)
  let t184 = ti.df
  let df_hi = (fn(x183 : @informal_interval.Interval) -> @informal_float.Ifloat raise {
    (fn(x181 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
      x181.1
    })((fn(x182 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
      @informal_interval.dest_interval(x182.0, x182.1)
    })(x183))
  })((fn(x186 : Int64) -> @informal_interval.Interval raise {
    ((x185 : Int) => @lib.list_nth(t184, x185))(@lib.int63_to_int(x186))
  })(t187))
  let dd_list = @lib.map(fn(x188 : Int64) -> @informal_interval.Interval raise {
    let j = x188
    if (j <= i) {
      let t190 = @lib.int63_to_int(@lib.sub63(j, 1L))
      let t189 = @lib.int63_to_int(@lib.sub63(i, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t189), t190)
    } else {
      let t192 = @lib.int63_to_int(@lib.sub63(i, 1L))
      let t191 = @lib.int63_to_int(@lib.sub63(j, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t191), t192)
    }
  }, @lib.range(1L, ti.n))
  let mul_dd = @lib.map2((x193 : @informal_float.Ifloat, x194 : @informal_interval.Interval) => error_mul_f2_hi(pp, x193, x194), (ti.domain).w, dd_list)
  let sum2 = @lib.end_itlist((x195 : (Bool, @bigint.BigInt, Int64), x196 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x195, x196), mul_dd)
  @informal_float.add_float_hi(pp, df_hi, sum2)
}

///|
/// `eval_m_taylor_partial_lower`
pub fn eval_m_taylor_partial_lower(x197 : Int64, x198 : Int64, x199 : MTaylorInterval) -> @informal_float.Ifloat raise {
  let pp = x197
  let i = x198
  let ti = x199
  let t206 = @lib.sub63(i, 1L)
  let t203 = ti.df
  let df_lo = (fn(x202 : @informal_interval.Interval) -> @informal_float.Ifloat raise {
    (fn(x200 : (@informal_float.Ifloat, @informal_float.Ifloat)) -> @informal_float.Ifloat raise {
      x200.0
    })((fn(x201 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
      @informal_interval.dest_interval(x201.0, x201.1)
    })(x202))
  })((fn(x205 : Int64) -> @informal_interval.Interval raise {
    ((x204 : Int) => @lib.list_nth(t203, x204))(@lib.int63_to_int(x205))
  })(t206))
  let dd_list = @lib.map(fn(x207 : Int64) -> @informal_interval.Interval raise {
    let j = x207
    if (j <= i) {
      let t209 = @lib.int63_to_int(@lib.sub63(j, 1L))
      let t208 = @lib.int63_to_int(@lib.sub63(i, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t208), t209)
    } else {
      let t211 = @lib.int63_to_int(@lib.sub63(i, 1L))
      let t210 = @lib.int63_to_int(@lib.sub63(j, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t210), t211)
    }
  }, @lib.range(1L, ti.n))
  let mul_dd = @lib.map2((x212 : @informal_float.Ifloat, x213 : @informal_interval.Interval) => error_mul_f2_hi(pp, x212, x213), (ti.domain).w, dd_list)
  let sum2 = @lib.end_itlist((x214 : (Bool, @bigint.BigInt, Int64), x215 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x214, x215), mul_dd)
  @informal_float.sub_float_lo(pp, df_lo, sum2)
}

///|
/// `eval_m_taylor_partial_bound`
pub fn eval_m_taylor_partial_bound(x216 : Int64, x217 : Int64, x218 : MTaylorInterval) -> @informal_interval.Interval raise {
  let pp = x216
  let i = x217
  let ti = x218
  let t223 = @lib.sub63(i, 1L)
  let t220 = ti.df
  let (df_lo, df_hi) = (fn(x219 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> (@informal_float.Ifloat, @informal_float.Ifloat) raise {
    @informal_interval.dest_interval(x219.0, x219.1)
  })((fn(x222 : Int64) -> @informal_interval.Interval raise {
    ((x221 : Int) => @lib.list_nth(t220, x221))(@lib.int63_to_int(x222))
  })(t223))
  let dd_list = @lib.map(fn(x224 : Int64) -> @informal_interval.Interval raise {
    let j = x224
    if (j <= i) {
      let t226 = @lib.int63_to_int(@lib.sub63(j, 1L))
      let t225 = @lib.int63_to_int(@lib.sub63(i, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t225), t226)
    } else {
      let t228 = @lib.int63_to_int(@lib.sub63(i, 1L))
      let t227 = @lib.int63_to_int(@lib.sub63(j, 1L))
      @lib.list_nth(@lib.list_nth(ti.ddf, t227), t228)
    }
  }, @lib.range(1L, ti.n))
  let mul_dd = @lib.map2((x229 : @informal_float.Ifloat, x230 : @informal_interval.Interval) => error_mul_f2_hi(pp, x229, x230), (ti.domain).w, dd_list)
  let sum2 = @lib.end_itlist((x231 : (Bool, @bigint.BigInt, Int64), x232 : (Bool, @bigint.BigInt, Int64)) => @informal_float.add_float_hi(pp, x231, x232), mul_dd)
  let lo = @informal_float.sub_float_lo(pp, df_lo, sum2)
  let hi = @informal_float.add_float_hi(pp, df_hi, sum2)
  @informal_interval.mk_interval(lo, hi)
}

///|
/// `eval_m_taylor_add`
pub fn eval_m_taylor_add(x233 : Int64, x234 : Int64, x235 : MTaylorInterval, x236 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x233
  let p_second = x234
  let taylor1 = x235
  let taylor2 = x236
  let (op_plus, op_plus_plus) = (fn(x239 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x240 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x237 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x238 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_lin, x237, x238))(x239, x240)
    }
  }, fn(x243 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x244 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x241 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x242 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x241, x242))(x243, x244)
    }
  })
  let t255 = taylor2.ddf
  let t256 = @lib.map2((x253 : @list.List[@informal_interval.Interval], x254 : @list.List[@informal_interval.Interval]) => @lib.map2(fn(x250 : @informal_interval.Interval, x251 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let s252 = op_plus_plus(x250)
    s252(x251)
  }, x253, x254), taylor1.ddf, t255)
  let t249 = taylor2.df
  let t257 = @lib.map2(fn(x246 : @informal_interval.Interval, x247 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let s248 = op_plus(x246)
    s248(x247)
  }, taylor1.df, t249)
  let t245 = taylor2.f
  let t258 = op_plus(taylor1.f)(t245)
  let t259 = taylor1.domain
  MTaylorInterval::{ n: taylor1.n, domain: t259, f: t258, df: t257, ddf: t256 }
}

///|
/// `eval_m_taylor_sub`
pub fn eval_m_taylor_sub(x260 : Int64, x261 : Int64, x262 : MTaylorInterval, x263 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x260
  let p_second = x261
  let taylor1 = x262
  let taylor2 = x263
  let (op_minus, op_minus_minus) = (fn(x266 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x267 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x264 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x265 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_lin, x264, x265))(x266, x267)
    }
  }, fn(x270 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x271 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x268 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x269 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_second, x268, x269))(x270, x271)
    }
  })
  let t282 = taylor2.ddf
  let t283 = @lib.map2((x280 : @list.List[@informal_interval.Interval], x281 : @list.List[@informal_interval.Interval]) => @lib.map2(fn(x277 : @informal_interval.Interval, x278 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let s279 = op_minus_minus(x277)
    s279(x278)
  }, x280, x281), taylor1.ddf, t282)
  let t276 = taylor2.df
  let t284 = @lib.map2(fn(x273 : @informal_interval.Interval, x274 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let s275 = op_minus(x273)
    s275(x274)
  }, taylor1.df, t276)
  let t272 = taylor2.f
  let t285 = op_minus(taylor1.f)(t272)
  let t286 = taylor1.domain
  MTaylorInterval::{ n: taylor1.n, domain: t286, f: t285, df: t284, ddf: t283 }
}

///|
/// `eval_m_taylor_mul`
pub fn eval_m_taylor_mul(x287 : Int64, x288 : Int64, x289 : MTaylorInterval, x290 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x287
  let p_second = x288
  let ti1 = x289
  let ti2 = x290
  let n = ti1.n
  let ns = @lib.range(1L, n)
  let t291 = ti2.f
  let bounds = @informal_interval.mul_interval(p_lin, ti1.f, t291)
  let t304 = ti2.df
  let df = @lib.map2(fn(x292 : @informal_interval.Interval, x293 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d1 = x292
    let d2 = x293
    let (op_star, op_plus) = (fn(x296 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x297 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        ((x294 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x295 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x294, x295))(x296, x297)
      }
    }, fn(x300 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x301 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        ((x298 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x299 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_lin, x298, x299))(x300, x301)
      }
    })
    let t303 = op_star(ti1.f)(d2)
    let t302 = ti2.f
    op_plus(op_star(d1)(t302))(t303)
  }, ti1.df, t304)
  let d1_bounds = @lib.map(fn(x305 : Int64) -> @informal_interval.Interval raise {
    let i = x305
    eval_m_taylor_partial_bound(p_second, i, ti1)
  }, ns)
  let d2_bounds = @lib.map(fn(x306 : Int64) -> @informal_interval.Interval raise {
    let i_1 = x306
    eval_m_taylor_partial_bound(p_second, i_1, ti2)
  }, ns)
  let f1_bound = eval_m_taylor_bound(p_second, ti1)
  let f2_bound = eval_m_taylor_bound(p_second, ti2)
  let (op_star_1, op_plus_1) = (fn(x309 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x310 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x307 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x308 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x307, x308))(x309, x310)
    }
  }, fn(x313 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x314 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x311 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x312 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x311, x312))(x313, x314)
    }
  })
  let t323 = ti2.ddf
  let ddf = @lib.map2(fn(x315 : (@list.List[@informal_interval.Interval], @list.List[@informal_interval.Interval]), x316 : Int64) -> @list.List[@informal_interval.Interval] raise {
    let (list1, list2) = x315
    let i_2 = x316
    let di1 = @lib.list_nth(d1_bounds, @lib.int63_to_int(@lib.sub63(i_2, 1L)))
    let di2 = @lib.list_nth(d2_bounds, @lib.int63_to_int(@lib.sub63(i_2, 1L)))
    let t322 = @lib.range(1L, i_2)
    @lib.map2(fn(x317 : (@informal_interval.Interval, @informal_interval.Interval), x318 : Int64) -> @informal_interval.Interval raise {
      let (dd1, dd2) = x317
      let j = x318
      let dj1 = @lib.list_nth(d1_bounds, @lib.int63_to_int(@lib.sub63(j, 1L)))
      let dj2 = @lib.list_nth(d2_bounds, @lib.int63_to_int(@lib.sub63(j, 1L)))
      let t320 = op_star_1(f1_bound)(dd2)
      let t321 = op_plus_1(op_star_1(dj1)(di2))(t320)
      let t319 = op_star_1(di1)(dj2)
      op_plus_1(op_plus_1(op_star_1(dd1)(f2_bound))(t319))(t321)
    }, @lib.zip(list1, list2), t322)
  }, @lib.zip(ti1.ddf, t323), ns)
  MTaylorInterval::{ n: n, domain: ti1.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_neg`
pub fn eval_m_taylor_neg(x324 : MTaylorInterval) -> MTaylorInterval raise {
  let taylor1 = x324
  let neg : (@informal_interval.Interval) -> @informal_interval.Interval raise = fn(x325 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x325.0, x325.1)
  }
  let t327 = @lib.map((x326 : @list.List[@informal_interval.Interval]) => @lib.map(neg, x326), taylor1.ddf)
  let t328 = @lib.map(neg, taylor1.df)
  let t329 = neg(taylor1.f)
  let t330 = taylor1.domain
  MTaylorInterval::{ n: taylor1.n, domain: t330, f: t329, df: t328, ddf: t327 }
}

///|
/// `eval_m_taylor_abs`
pub fn eval_m_taylor_abs(x331 : Int64, x332 : MTaylorInterval) -> MTaylorInterval raise {
  let p_second = x331
  let ti = x332
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  match @informal_interval.compare0_interval(f1_bound.0, f1_bound.1) {
    (-1L) => eval_m_taylor_neg(ti)
    1L => ti
    _ => raise Failure("eval_m_taylor_abs: interval contains 0")
  }
}

///|
/// `eval_m_taylor_pow2`
pub fn eval_m_taylor_pow2(x333 : Int64, x334 : Int64, x335 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x333
  let p_second = x334
  let ti = x335
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_interval.pow_interval(p_lin, 2L, ti.f)
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x338 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x339 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x336 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x337 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x336, x337))(x338, x339)
    }
  }
  let t340 = ti.f
  let u_bounds = op_star(@informal_interval.two_interval())(t340)
  let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x343 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x344 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x341 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x342 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x341, x342))(x343, x344)
    }
  }
  let df = @lib.map(fn(x345 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x345
    op_star_1(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x346 : Int64) -> @informal_interval.Interval raise {
    let i = x346
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (op_star_2, op_plus) = (fn(x349 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x350 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x347 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x348 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x347, x348))(x349, x350)
    }
  }, fn(x353 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x354 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x351 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x352 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x351, x352))(x353, x354)
    }
  })
  let ddf = @lib.map2(fn(x355 : @list.List[@informal_interval.Interval], x356 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x355
    let di1 = x356
    @misc_functions.my_map2(fn(x357 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x357
      fn(x358 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x358
        let t359 = op_star_2(f1_bound)(dd)
        let t360 = op_plus(op_star_2(dj1)(di1))(t359)
        op_star_2(@informal_interval.two_interval())(t360)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_pow`
pub fn eval_m_taylor_pow(x361 : Int64) -> ((Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise) raise {
  let k = x361
  if (k <= 1L) {
    raise Failure("Informal.eval_m_taylor_pow: k <= 1")
  } else {
    if (k == 2L) {
      fn(x363 : Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise {
        fn(x364 : Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise {
          fn(x365 : MTaylorInterval) -> MTaylorInterval raise {
            eval_m_taylor_pow2(x363, x364, x365)
          }
        }
      }
    } else {
      let k_interval = @informal_interval.mk_small_num_interval(k)
      let k1_interval = @informal_interval.mk_small_num_interval(@lib.sub63(k, 1L))
      fn(x366 : Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise {
        let p_lin = x366
        fn(x367 : Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise {
          let p_second = x367
          fn(x368 : MTaylorInterval) -> MTaylorInterval raise {
            let ti = x368
            let n = ti.n
            let ns = @lib.range(1L, n)
            let f1_bound = eval_m_taylor_bound(p_second, ti)
            let t369 = ti.f
            let bounds_pow_k1 = @informal_interval.pow_interval(p_lin, @lib.sub63(k, 1L), t369)
            let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x372 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x373 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x370 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x371 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x370, x371))(x372, x373)
              }
            }
            let bounds = op_star(ti.f)(bounds_pow_k1)
            let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x376 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x377 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x374 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x375 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x374, x375))(x376, x377)
              }
            }
            let u_bounds = op_star_1(k_interval)(bounds_pow_k1)
            let op_star_2 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x380 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x381 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x378 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x379 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x378, x379))(x380, x381)
              }
            }
            let df = @lib.map(fn(x382 : @informal_interval.Interval) -> @informal_interval.Interval raise {
              let d = x382
              op_star_2(u_bounds)(d)
            }, ti.df)
            let d1_bounds = @lib.map(fn(x383 : Int64) -> @informal_interval.Interval raise {
              let i = x383
              eval_m_taylor_partial_bound(p_second, i, ti)
            }, ns)
            let op_star_3 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x386 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x387 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x384 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x385 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x384, x385))(x386, x387)
              }
            }
            let t388 = @lib.sub63(k, 2L)
            let pow_k2 : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x389 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.pow_interval(p_second, t388, x389)
            let t390 = pow_k2(f1_bound)
            let d2 = op_star_3(k_interval)(t390)
            let (op_star_4, op_plus) = (fn(x393 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x394 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x391 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x392 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x391, x392))(x393, x394)
              }
            }, fn(x397 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
              fn(x398 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                ((x395 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x396 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x395, x396))(x397, x398)
              }
            })
            let ddf = @lib.map2(fn(x399 : @list.List[@informal_interval.Interval], x400 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
              let dd_list = x399
              let di1 = x400
              @misc_functions.my_map2(fn(x401 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
                let dd = x401
                fn(x402 : @informal_interval.Interval) -> @informal_interval.Interval raise {
                  let dj1 = x402
                  let t403 = op_star_4(f1_bound)(dd)
                  let t404 = op_plus(op_star_4(op_star_4(k1_interval)(dj1))(di1))(t403)
                  op_star_4(d2)(t404)
                }
              }, dd_list, d1_bounds)
            }, ti.ddf, d1_bounds)
            MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
          }
        }
      }
    }
  }
}

///|
/// `eval_m_taylor_inv`
pub fn eval_m_taylor_inv(x405 : Int64, x406 : Int64, x407 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x405
  let p_second = x406
  let ti = x407
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_interval.inv_interval(p_lin, ti.f)
  let (neg, inv, op_star) = (fn(x408 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x408.0, x408.1)
  }, (x409 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x409), fn(x412 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x413 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x410 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x411 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x410, x411))(x412, x413)
    }
  })
  let t414 = ti.f
  let u_bounds = neg(inv(op_star(ti.f)(t414)))
  let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x417 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x418 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x415 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x416 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x415, x416))(x417, x418)
    }
  }
  let df = @lib.map(fn(x419 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x419
    op_star_1(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x420 : Int64) -> @informal_interval.Interval raise {
    let i = x420
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (inv_1, op_star_2) = ((x421 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x421), fn(x424 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x425 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x422 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x423 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x422, x423))(x424, x425)
    }
  })
  let ff = op_star_2(f1_bound)(f1_bound)
  let t426 = inv_1(op_star_2(f1_bound)(ff))
  let t427 = op_star_2(@informal_interval.two_interval())(t426)
  let (d1, d2) = (inv_1(ff), t427)
  let (op_star_3, op_minus) = (fn(x430 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x431 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x428 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x429 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x428, x429))(x430, x431)
    }
  }, fn(x434 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x435 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x432 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x433 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_second, x432, x433))(x434, x435)
    }
  })
  let ddf = @lib.map2(fn(x436 : @list.List[@informal_interval.Interval], x437 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x436
    let di1 = x437
    @misc_functions.my_map2(fn(x438 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x438
      fn(x439 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x439
        let t440 = op_star_3(d1)(dd)
        op_minus(op_star_3(op_star_3(d2)(dj1))(di1))(t440)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_sqrt`
pub fn eval_m_taylor_sqrt(x441 : Int64, x442 : Int64, x443 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x441
  let p_second = x442
  let ti = x443
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_interval.sqrt_interval(p_lin, ti.f)
  let (inv, op_star) = ((x444 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x444), fn(x447 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x448 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x445 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x446 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x445, x446))(x447, x448)
    }
  })
  let u_bounds = inv(op_star(@informal_interval.two_interval())(bounds))
  let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x451 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x452 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x449 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x450 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x449, x450))(x451, x452)
    }
  }
  let df = @lib.map(fn(x453 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x453
    op_star_1(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x454 : Int64) -> @informal_interval.Interval raise {
    let i = x454
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (neg, sqrt, inv_1, op_star_2) = (fn(x455 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x455.0, x455.1)
  }, (x456 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sqrt_interval(p_second, x456), (x457 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x457), fn(x460 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x461 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x458 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x459 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x458, x459))(x460, x461)
    }
  })
  let t462 = sqrt(f1_bound)
  let two_sqrt_f = op_star_2(@informal_interval.two_interval())(t462)
  let t463 = op_star_2(@informal_interval.two_interval())(f1_bound)
  let t464 = neg(inv_1(op_star_2(two_sqrt_f)(t463)))
  let (d1, d2) = (inv_1(two_sqrt_f), t464)
  let (op_star_3, op_plus) = (fn(x467 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x468 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x465 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x466 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x465, x466))(x467, x468)
    }
  }, fn(x471 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x472 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x469 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x470 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x469, x470))(x471, x472)
    }
  })
  let ddf = @lib.map2(fn(x473 : @list.List[@informal_interval.Interval], x474 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x473
    let di1 = x474
    @misc_functions.my_map2(fn(x475 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x475
      fn(x476 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x476
        let t477 = op_star_3(d1)(dd)
        op_plus(op_star_3(op_star_3(d2)(dj1))(di1))(t477)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_exp`
pub fn eval_m_taylor_exp(x478 : Int64, x479 : Int64, x480 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x478
  let p_second = x479
  let ti = x480
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_exp.exp_interval(p_lin, ti.f)
  let exp : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x481 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_exp.exp_interval(p_lin, x481)
  let u_bounds = exp(ti.f)
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x484 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x485 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x482 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x483 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x482, x483))(x484, x485)
    }
  }
  let df = @lib.map(fn(x486 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x486
    op_star(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x487 : Int64) -> @informal_interval.Interval raise {
    let i = x487
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let exp_1 : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x488 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_exp.exp_interval(p_second, x488)
  let exp_f = exp_1(f1_bound)
  let (d1, d2) = (exp_f, exp_f)
  let (op_star_1, op_plus) = (fn(x491 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x492 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x489 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x490 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x489, x490))(x491, x492)
    }
  }, fn(x495 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x496 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x493 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x494 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x493, x494))(x495, x496)
    }
  })
  let ddf = @lib.map2(fn(x497 : @list.List[@informal_interval.Interval], x498 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x497
    let di1 = x498
    @misc_functions.my_map2(fn(x499 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x499
      fn(x500 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x500
        let t501 = op_star_1(d1)(dd)
        op_plus(op_star_1(op_star_1(d2)(dj1))(di1))(t501)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_log`
pub fn eval_m_taylor_log(x502 : Int64, x503 : Int64, x504 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x502
  let p_second = x503
  let ti = x504
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_log.log_interval(p_lin, ti.f)
  let inv : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x505 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x505)
  let u_bounds = inv(ti.f)
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x508 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x509 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x506 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x507 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x506, x507))(x508, x509)
    }
  }
  let df = @lib.map(fn(x510 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x510
    op_star(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x511 : Int64) -> @informal_interval.Interval raise {
    let i = x511
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (neg, pow2, inv_1) = (fn(x512 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x512.0, x512.1)
  }, (x513 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.pow_interval(p_second, 2L, x513), (x514 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x514))
  let inv_f = inv_1(f1_bound)
  let (d1, d2) = (inv_f, neg(pow2(inv_f)))
  let (op_star_1, op_plus) = (fn(x517 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x518 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x515 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x516 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x515, x516))(x517, x518)
    }
  }, fn(x521 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x522 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x519 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x520 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x519, x520))(x521, x522)
    }
  })
  let ddf = @lib.map2(fn(x523 : @list.List[@informal_interval.Interval], x524 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x523
    let di1 = x524
    @misc_functions.my_map2(fn(x525 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x525
      fn(x526 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x526
        let t527 = op_star_1(d1)(dd)
        op_plus(op_star_1(op_star_1(d2)(dj1))(di1))(t527)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_matan`
pub fn eval_m_taylor_matan(x528 : Int64, x529 : Int64, x530 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x528
  let p_second = x529
  let ti = x530
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let t531 = ti.f
  let bounds = @informal_matan.matan_interval(p_lin)(t531)
  let dmatan : (@informal_interval.Interval) -> @informal_interval.Interval raise = @informal_matan.dmatan_interval(p_lin)
  let u_bounds = dmatan(ti.f)
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x534 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x535 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x532 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x533 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x532, x533))(x534, x535)
    }
  }
  let df = @lib.map(fn(x536 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x536
    op_star(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x537 : Int64) -> @informal_interval.Interval raise {
    let i = x537
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let t538 = @informal_matan.ddmatan_interval(p_second)
  let (dmatan_1, ddmatan) = (@informal_matan.dmatan_interval(p_second), t538)
  let t539 = ddmatan(f1_bound)
  let (d1, d2) = (dmatan_1(f1_bound), t539)
  let (op_star_1, op_plus) = (fn(x542 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x543 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x540 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x541 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x540, x541))(x542, x543)
    }
  }, fn(x546 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x547 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x544 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x545 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x544, x545))(x546, x547)
    }
  })
  let ddf = @lib.map2(fn(x548 : @list.List[@informal_interval.Interval], x549 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x548
    let di1 = x549
    @misc_functions.my_map2(fn(x550 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x550
      fn(x551 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x551
        let t552 = op_star_1(d1)(dd)
        op_plus(op_star_1(op_star_1(d2)(dj1))(di1))(t552)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// eval_m_taylor_atn
fn step_5() -> Unit raise {
  let neg_two_interval = @informal_interval.neg_interval(@informal_interval.two_interval().0, @informal_interval.two_interval().1)
  eval_m_taylor_atn_c.set(fn(x553 : Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise {
    let p_lin = x553
    fn(x554 : Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise {
      let p_second = x554
      fn(x555 : MTaylorInterval) -> MTaylorInterval raise {
        let ti = x555
        let n = ti.n
        let ns = @lib.range(1L, n)
        let f1_bound = eval_m_taylor_bound(p_second, ti)
        let bounds = @informal_atn.atn_interval(p_lin, ti.f)
        let (inv, op_plus, op_star) = ((x556 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x556), fn(x559 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x560 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x557 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x558 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_lin, x557, x558))(x559, x560)
          }
        }, fn(x563 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x564 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x561 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x562 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x561, x562))(x563, x564)
          }
        })
        let t565 = ti.f
        let t566 = op_star(ti.f)(t565)
        let u_bounds = inv(op_plus(@informal_interval.one_interval())(t566))
        let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x569 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x570 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x567 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x568 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x567, x568))(x569, x570)
          }
        }
        let df = @lib.map(fn(x571 : @informal_interval.Interval) -> @informal_interval.Interval raise {
          let d = x571
          op_star_1(u_bounds)(d)
        }, ti.df)
        let d1_bounds = @lib.map(fn(x572 : Int64) -> @informal_interval.Interval raise {
          let i = x572
          eval_m_taylor_partial_bound(p_second, i, ti)
        }, ns)
        let (neg, inv_1, op_plus_1, op_star_2) = (fn(x573 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
          @informal_interval.neg_interval(x573.0, x573.1)
        }, (x574 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x574), fn(x577 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x578 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x575 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x576 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x575, x576))(x577, x578)
          }
        }, fn(x581 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x582 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x579 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x580 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x579, x580))(x581, x582)
          }
        })
        let pow2 : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x583 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.pow_interval(p_second, 2L, x583)
        let t584 = op_star_2(f1_bound)(f1_bound)
        let inv_one_ff = inv_1(op_plus_1(@informal_interval.one_interval())(t584))
        let t585 = pow2(inv_one_ff)
        let (d1, d2) = (inv_one_ff, op_star_2(op_star_2(neg_two_interval)(f1_bound))(t585))
        let (op_star_3, op_plus_2) = (fn(x588 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x589 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x586 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x587 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x586, x587))(x588, x589)
          }
        }, fn(x592 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
          fn(x593 : @informal_interval.Interval) -> @informal_interval.Interval raise {
            ((x590 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x591 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x590, x591))(x592, x593)
          }
        })
        let ddf = @lib.map2(fn(x594 : @list.List[@informal_interval.Interval], x595 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
          let dd_list = x594
          let di1 = x595
          @misc_functions.my_map2(fn(x596 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
            let dd = x596
            fn(x597 : @informal_interval.Interval) -> @informal_interval.Interval raise {
              let dj1 = x597
              let t598 = op_star_3(d1)(dd)
              op_plus_2(op_star_3(op_star_3(d2)(dj1))(di1))(t598)
            }
          }, dd_list, d1_bounds)
        }, ti.ddf, d1_bounds)
        MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
      }
    }
  })
}

///|
let eval_m_taylor_atn_c : @lib.Cell[(Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise] = @lib.Cell::new("eval_m_taylor_atn")

///|
/// `eval_m_taylor_atn`
pub fn eval_m_taylor_atn(x : Int64) -> ((Int64) -> ((MTaylorInterval) -> MTaylorInterval raise) raise) raise {
  (eval_m_taylor_atn_c.get())(x)
}

///|
/// `eval_m_taylor_cos`
pub fn eval_m_taylor_cos(x599 : Int64, x600 : Int64, x601 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x599
  let p_second = x600
  let ti = x601
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_sin_cos.cos_interval(p_lin, ti.f)
  let (sin, neg) = ((x602 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.sin_interval(p_lin, x602), fn(x603 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x603.0, x603.1)
  })
  let u_bounds = neg(sin(ti.f))
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x606 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x607 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x604 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x605 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x604, x605))(x606, x607)
    }
  }
  let df = @lib.map(fn(x608 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x608
    op_star(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x609 : Int64) -> @informal_interval.Interval raise {
    let i = x609
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (cos, sin_1) = ((x610 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.cos_interval(p_second, x610), (x611 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.sin_interval(p_second, x611))
  let t612 = cos(f1_bound)
  let (d1, d2) = (sin_1(f1_bound), t612)
  let (op_star_1, op_plus) = (fn(x615 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x616 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x613 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x614 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x613, x614))(x615, x616)
    }
  }, fn(x619 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x620 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x617 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x618 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x617, x618))(x619, x620)
    }
  })
  let neg_1 : (@informal_interval.Interval) -> @informal_interval.Interval raise = fn(x621 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x621.0, x621.1)
  }
  let ddf = @lib.map2(fn(x622 : @list.List[@informal_interval.Interval], x623 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x622
    let di1 = x623
    @misc_functions.my_map2(fn(x624 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x624
      fn(x625 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x625
        let t626 = op_star_1(d1)(dd)
        neg_1(op_plus(op_star_1(op_star_1(d2)(dj1))(di1))(t626))
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_sin`
pub fn eval_m_taylor_sin(x627 : Int64, x628 : Int64, x629 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x627
  let p_second = x628
  let ti = x629
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_sin_cos.sin_interval(p_lin, ti.f)
  let cos : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x630 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.cos_interval(p_lin, x630)
  let u_bounds = cos(ti.f)
  let op_star : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x633 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x634 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x631 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x632 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x631, x632))(x633, x634)
    }
  }
  let df = @lib.map(fn(x635 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x635
    op_star(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x636 : Int64) -> @informal_interval.Interval raise {
    let i = x636
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (cos_1, sin) = ((x637 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.cos_interval(p_second, x637), (x638 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_sin_cos.sin_interval(p_second, x638))
  let neg : (@informal_interval.Interval) -> @informal_interval.Interval raise = fn(x639 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x639.0, x639.1)
  }
  let t640 = neg(sin(f1_bound))
  let (d1, d2) = (cos_1(f1_bound), t640)
  let (op_star_1, op_plus) = (fn(x643 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x644 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x641 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x642 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x641, x642))(x643, x644)
    }
  }, fn(x647 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x648 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x645 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x646 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x645, x646))(x647, x648)
    }
  })
  let ddf = @lib.map2(fn(x649 : @list.List[@informal_interval.Interval], x650 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x649
    let di1 = x650
    @misc_functions.my_map2(fn(x651 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x651
      fn(x652 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x652
        let t653 = op_star_1(d1)(dd)
        op_plus(op_star_1(op_star_1(d2)(dj1))(di1))(t653)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_asn`
pub fn eval_m_taylor_asn(x654 : Int64, x655 : Int64, x656 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x654
  let p_second = x655
  let ti = x656
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_asn_acs.asn_interval(p_lin, ti.f)
  let (inv, sqrt) = ((x657 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x657), (x658 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sqrt_interval(p_lin, x658))
  let (op_star, op_minus) = (fn(x661 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x662 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x659 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x660 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x659, x660))(x661, x662)
    }
  }, fn(x665 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x666 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x663 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x664 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_lin, x663, x664))(x665, x666)
    }
  })
  let t667 = ti.f
  let t668 = op_star(ti.f)(t667)
  let u_bounds = inv(sqrt(op_minus(@informal_interval.one_interval())(t668)))
  let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x671 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x672 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x669 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x670 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x669, x670))(x671, x672)
    }
  }
  let df = @lib.map(fn(x673 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x673
    op_star_1(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x674 : Int64) -> @informal_interval.Interval raise {
    let i = x674
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (sqrt_1, inv_1) = ((x675 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sqrt_interval(p_second, x675), (x676 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x676))
  let (op_minus_1, op_star_2, op_slash) = (fn(x679 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x680 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x677 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x678 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_second, x677, x678))(x679, x680)
    }
  }, fn(x683 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x684 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x681 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x682 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x681, x682))(x683, x684)
    }
  }, fn(x687 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x688 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x685 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x686 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.div_interval(p_second, x685, x686))(x687, x688)
    }
  })
  let pow3 : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x689 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.pow_interval(p_second, 3L, x689)
  let t690 = op_star_2(f1_bound)(f1_bound)
  let ff_1 = op_minus_1(@informal_interval.one_interval())(t690)
  let t691 = sqrt_1(pow3(ff_1))
  let t692 = op_slash(f1_bound)(t691)
  let (d1, d2) = (inv_1(sqrt_1(ff_1)), t692)
  let (op_star_3, op_plus) = (fn(x695 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x696 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x693 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x694 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x693, x694))(x695, x696)
    }
  }, fn(x699 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x700 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x697 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x698 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.add_interval(p_second, x697, x698))(x699, x700)
    }
  })
  let ddf = @lib.map2(fn(x701 : @list.List[@informal_interval.Interval], x702 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x701
    let di1 = x702
    @misc_functions.my_map2(fn(x703 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x703
      fn(x704 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x704
        let t705 = op_star_3(d1)(dd)
        op_plus(op_star_3(op_star_3(d2)(dj1))(di1))(t705)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
/// `eval_m_taylor_acs`
pub fn eval_m_taylor_acs(x706 : Int64, x707 : Int64, x708 : MTaylorInterval) -> MTaylorInterval raise {
  let p_lin = x706
  let p_second = x707
  let ti = x708
  let n = ti.n
  let ns = @lib.range(1L, n)
  let f1_bound = eval_m_taylor_bound(p_second, ti)
  let bounds = @informal_asn_acs.acs_interval(p_lin, ti.f)
  let (inv, sqrt, neg) = ((x709 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_lin, x709), (x710 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sqrt_interval(p_lin, x710), fn(x711 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x711.0, x711.1)
  })
  let (op_star, op_minus) = (fn(x714 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x715 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x712 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x713 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x712, x713))(x714, x715)
    }
  }, fn(x718 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x719 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x716 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x717 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_lin, x716, x717))(x718, x719)
    }
  })
  let t720 = ti.f
  let t721 = op_star(ti.f)(t720)
  let u_bounds = neg(inv(sqrt(op_minus(@informal_interval.one_interval())(t721))))
  let op_star_1 : (@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise = fn(x724 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x725 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x722 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x723 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_lin, x722, x723))(x724, x725)
    }
  }
  let df = @lib.map(fn(x726 : @informal_interval.Interval) -> @informal_interval.Interval raise {
    let d = x726
    op_star_1(u_bounds)(d)
  }, ti.df)
  let d1_bounds = @lib.map(fn(x727 : Int64) -> @informal_interval.Interval raise {
    let i = x727
    eval_m_taylor_partial_bound(p_second, i, ti)
  }, ns)
  let (neg_1, sqrt_1, inv_1) = (fn(x728 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
    @informal_interval.neg_interval(x728.0, x728.1)
  }, (x729 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sqrt_interval(p_second, x729), (x730 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.inv_interval(p_second, x730))
  let (op_minus_1, op_star_2, op_slash) = (fn(x733 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x734 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x731 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x732 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_second, x731, x732))(x733, x734)
    }
  }, fn(x737 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x738 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x735 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x736 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x735, x736))(x737, x738)
    }
  }, fn(x741 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x742 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x739 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x740 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.div_interval(p_second, x739, x740))(x741, x742)
    }
  })
  let pow3 : (@informal_interval.Interval) -> @informal_interval.Interval raise = (x743 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.pow_interval(p_second, 3L, x743)
  let t744 = op_star_2(f1_bound)(f1_bound)
  let ff_1 = op_minus_1(@informal_interval.one_interval())(t744)
  let t745 = sqrt_1(pow3(ff_1))
  let t746 = neg_1(op_slash(f1_bound)(t745))
  let (d1, d2) = (inv_1(sqrt_1(ff_1)), t746)
  let (op_star_3, op_minus_2) = (fn(x749 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x750 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x747 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x748 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.mul_interval(p_second, x747, x748))(x749, x750)
    }
  }, fn(x753 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x754 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      ((x751 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64)), x752 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) => @informal_interval.sub_interval(p_second, x751, x752))(x753, x754)
    }
  })
  let ddf = @lib.map2(fn(x755 : @list.List[@informal_interval.Interval], x756 : @informal_interval.Interval) -> @list.List[@informal_interval.Interval] raise {
    let dd_list = x755
    let di1 = x756
    @misc_functions.my_map2(fn(x757 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      let dd = x757
      fn(x758 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        let dj1 = x758
        let t759 = op_star_3(d1)(dd)
        op_minus_2(op_star_3(op_star_3(d2)(dj1))(di1))(t759)
      }
    }, dd_list, d1_bounds)
  }, ti.ddf, d1_bounds)
  MTaylorInterval::{ n: n, domain: ti.domain, f: bounds, df: df, ddf: ddf }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
