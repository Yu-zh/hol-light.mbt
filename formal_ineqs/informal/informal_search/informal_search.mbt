// Translated from upstream Formal_ineqs/informal/informal_search.hl; edit this file directly.

///|
/// `search_options`
#derive(Eq, Debug)
pub(all) struct SearchOptions {
  raw_intervals0 : Bool
  max_width : Double
  max_depth : Int64
  mono_depth : Int64
  pp : Int64
}

///|
pub extend SearchOptions with Eq::{not_equal, equal}

///|
pub extend SearchOptions with Debug::{to_repr}

///|
pub extend SearchOptions with @lib.OCompare::{ocompare}

///|
pub extend SearchOptions with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for SearchOptions with fn ocompare(self, other) {
  let c = @lib.compare(self.raw_intervals0, other.raw_intervals0)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.max_width, other.max_width)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.max_depth, other.max_depth)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.mono_depth, other.mono_depth)
  if c != 0 {
    return c
  }
  @lib.compare(self.pp, other.pp)
}

///|
pub impl @lib.OHash for SearchOptions with fn ohash_visit(self, h) {
  h.block(0, 5)
  h.field(self.raw_intervals0)
  h.field(self.max_width)
  h.field(self.max_depth)
  h.field(self.mono_depth)
  h.field(self.pp)
}

///|
/// `find_max`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] find_max(x1 : @list.List[TA]) -> ((TA, Int64)) raise {
  let s = x1
  let t6 = @lib.tl(s)
  find_l(@lib.hd(s), 0L, 1L, t6)
}

///|
fn[TB : Eq + @lib.OCompare + @lib.OHash] find_l(x2 : TB, x3 : Int64, x4 : Int64, x5 : @list.List[TB]) -> ((TB, Int64)) raise {
  let m = x2
  let mi = x3
  let i = x4
  let s_1 = x5
  match s_1 {
    Empty => (m, mi)
    More(x, tail=t) => {
      if (@lib.compare(x, m) > 0) {
        find_l(x, i, @lib.add63(i, 1L), t)
      } else {
        find_l(m, mi, @lib.add63(i, 1L), t)
      }
    }
  }
}

///|
/// `split_domain`
pub fn split_domain(x7 : Int64, x8 : Int64, x9 : @informal_taylor.MCellDomain) -> ((@informal_taylor.MCellDomain, @informal_taylor.MCellDomain)) raise {
  let pp = x7
  let j = x8
  let domain = x9
  let n = Int::to_int64(@lib.length(domain.w))
  let t10 = @lib.int63_to_int(@lib.sub63(j, 1L))
  let t = @lib.list_nth(domain.y, t10)
  let vv = @lib.map(fn(x11 : Int64) -> @informal_float.Ifloat raise {
    let i = x11
    if (i == j) {
      t
    } else {
      let t12 = @lib.int63_to_int(@lib.sub63(i, 1L))
      @lib.list_nth(domain.hi, t12)
    }
  }, @lib.range(1L, n))
  let uu = @lib.map(fn(x13 : Int64) -> @informal_float.Ifloat raise {
    let i_1 = x13
    if (i_1 == j) {
      t
    } else {
      let t14 = @lib.int63_to_int(@lib.sub63(i_1, 1L))
      @lib.list_nth(domain.lo, t14)
    }
  }, @lib.range(1L, n))
  let t15 = @informal_taylor.mk_m_center_domain(pp, uu, domain.hi)
  (@informal_taylor.mk_m_center_domain(pp, domain.lo, vv), t15)
}

///|
/// `restrict_domain`
pub fn restrict_domain(x16 : Int64, x17 : Bool, x18 : @informal_taylor.MCellDomain) -> @informal_taylor.MCellDomain raise {
  let j = x16
  let left_flag = x17
  let domain = x18
  let t23 = @lib.int63_to_int(@lib.sub63(j, 1L))
  let t = @lib.list_nth(if left_flag {
    domain.lo
  } else {
    domain.hi
  }, t23)
  let lo = if left_flag {
    domain.lo
  } else {
    replace_l(domain.lo, j, t)
  }
  let hi = if left_flag {
    replace_l(domain.hi, j, t)
  } else {
    domain.hi
  }
  let w = replace_l(domain.w, j, @informal_taylor.float_0())
  let y = replace_l(domain.y, j, t)
  @informal_taylor.MCellDomain::{ lo: lo, hi: hi, y: y, w: w }
}

///|
fn[TA] replace_l(x19 : @list.List[TA], x20 : Int64, x21 : TA) -> @list.List[TA] raise {
  let list = x19
  let j_1 = x20
  let v = x21
  @lib.map(fn(x22 : Int64) -> TA raise {
    let i = x22
    if (i == j_1) {
      v
    } else {
      @lib.list_nth(list, @lib.int63_to_int(@lib.sub63(i, 1L)))
    }
  }, @lib.range(1L, Int::to_int64(@lib.length(list))))
}

///|
/// `function_info`
pub(all) struct FunctionInfo {
  eval0 : (Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise
  taylor : (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise
  index : Int64
}

///|
/// `result`
pub(all) enum Result {
  Cell_inconclusive
  Cell_false
  Cell_result(@certificate.ResultTree)
  Cell_pass(Bool, FunctionInfo)
}

///|
/// `exception Construction_error`
pub(all) suberror Construction_error {
  Construction_error(String, @informal_taylor.MCellDomain, @list.List[FunctionInfo])
}

///|
/// `error`
pub fn[TA] error(x24 : String, x25 : @informal_taylor.MCellDomain, x26 : @list.List[FunctionInfo]) -> TA raise {
  let msg = x24
  let dom = x25
  let fs = x26
  raise Construction_error::Construction_error(msg, dom, fs)
}

///|
let init_vol_c : @lib.Cell[(@informal_taylor.MCellDomain) -> Unit raise] = @lib.Cell::new("init_vol")

///|
/// `init_vol`
pub fn init_vol(x : @informal_taylor.MCellDomain) -> Unit raise {
  (init_vol_c.get())(x)
}

///|
let update_verified_vol_c : @lib.Cell[(@informal_taylor.MCellDomain) -> Unit raise] = @lib.Cell::new("update_verified_vol")

///|
/// `update_verified_vol`
pub fn update_verified_vol(x : @informal_taylor.MCellDomain) -> Unit raise {
  (update_verified_vol_c.get())(x)
}

///|
/// init_vol, update_verified_vol
fn step_1() -> Unit raise {
  let compute_vol : (@informal_taylor.MCellDomain) -> Double raise = fn(x27 : @informal_taylor.MCellDomain) -> Double raise {
    let dom = x27
    let fw = @lib.map(@informal_float.float_of_ifloat, dom.w)
    @lib.itlist(fn(x30 : Double, x31 : Double) -> Double raise {
      let s32 = (fn(x28 : Double) -> ((Double) -> Double raise) raise {
        fn(x29 : Double) -> Double raise {
          (x28 * x29)
        }
      })(x30)
      s32(x31)
    }, fw, 1.0)
  }
  let total_vol = Ref::{ val: 0.0 }
  let verified_vol = Ref::{ val: 0.0 }
  let last_report = Ref::{ val: 0L }
  let init_vol : (@informal_taylor.MCellDomain) -> Unit raise = fn(x33 : @informal_taylor.MCellDomain) -> Unit raise {
    let dom_1 = x33
    {
      total_vol.val = compute_vol(dom_1)
      ()
    }
    {
      verified_vol.val = 0.0
      ()
    }
    {
      last_report.val = 0L
      ()
    }
  }
  let update_verified_vol : (@informal_taylor.MCellDomain) -> Unit raise = fn(x34 : @informal_taylor.MCellDomain) -> Unit raise {
    let dom_2 = x34
    if ((@verifier_options.info_print_level().val > 0L) && (@lib.compare(total_vol.val, 0.0) > 0)) {
      let t35 = compute_vol(dom_2)
      let _ = {
        verified_vol.val = (verified_vol.val + t35)
        ()
      }
      let t36 = total_vol.val
      let verified = @lib.norm63(Double::to_int64(((verified_vol.val / t36) * 100.5)))
      if (verified > last_report.val) {
        let _ = {
          last_report.val = verified
          ()
        }
        @verifier_options.report0((Int64::to_string(last_report.val) + " "))
      } else {
        ()
      }
    } else {
      ()
    }
  }
  let (init_vol_1, update_verified_vol_1) = (init_vol, update_verified_vol)
  init_vol_c.set(init_vol_1)
  update_verified_vol_c.set(update_verified_vol_1)
}

///|
/// `check_cell`
pub fn check_cell(x37 : SearchOptions, x38 : @informal_taylor.MCellDomain) -> ((@list.List[FunctionInfo]) -> Result raise) raise {
  let opt = x37
  let dom = x38
  let pp = opt.pp
  fn check(x40 : Bool, x41 : @list.List[FunctionInfo]) -> Result raise {
    let flag = x40
    let fs = x41
    match fs {
      Empty => {
        if !flag {
          Result::Cell_false
        } else {
          Result::Cell_inconclusive
        }
      }
      More(f, tail=rest) => {
        try {
          let (raw_fail, raw_pass) = if opt.raw_intervals0 {
            try {
              let t42 = dom.hi
              let t43 = dom.lo
              let interval = (f.eval0)(pp)(t43)(t42)
              let (lo, hi) = @informal_interval.dest_interval(interval.0, interval.1)
              let t44 = @informal_float.lt0_float(hi.0, hi.1, hi.2)
              (@informal_float.ge0_float(lo.0, lo.1, lo.2), t44)
            } catch {
              Failure(_) | @num.DivisionByZero => (false, false)
              e => raise e
            }
          } else {
            (false, false)
          }
          if raw_pass {
            Result::Cell_pass(true, f)
          } else {
            if raw_fail {
              check(flag, rest)
            } else {
              let ti = (f.taylor)(pp)(pp)(dom)
              let upper = @informal_taylor.eval_m_taylor_upper_bound(pp, ti)
              if @informal_float.lt0_float(upper.0, upper.1, upper.2) {
                Result::Cell_pass(false, f)
              } else {
                let lower = @informal_taylor.eval_m_taylor_lower_bound(pp, ti)
                if @informal_float.ge0_float(lower.0, lower.1, lower.2) {
                  check(flag, rest)
                } else {
                  if (opt.mono_depth > 0L) {
                    try {
                      try_mono(SearchOptions::{ ..opt, max_depth: opt.mono_depth }, dom, f, ti)
                    } catch {
                      Failure(_) | @num.DivisionByZero | Construction_error::Construction_error(_, _, _) => check(true, rest)
                      e => raise e
                    }
                  } else {
                    check(true, rest)
                  }
                }
              }
            }
          }
        } catch {
          Failure(_) | @num.DivisionByZero => check(true, rest)
          e => raise e
        }
      }
    }
  }
  fn(x45 : @list.List[FunctionInfo]) -> Result raise {
    let fs_1 = x45
    check(false, fs_1)
  }
}

///|
/// `try_mono`
pub fn try_mono(x46 : SearchOptions, x47 : @informal_taylor.MCellDomain, x48 : FunctionInfo, x49 : @informal_taylor.MTaylorInterval) -> Result raise {
  let opt_1 = x46
  let dom_1 = x47
  let f_1 = x48
  let ti_1 = x49
  let pp_1 = opt_1.pp
  fn mono(x50 : @list.List[@certificate.MonoStatus], x51 : @list.List[(Int64, @informal_float.Ifloat)]) -> @list.List[@certificate.MonoStatus] raise {
    let acc = x50
    let indices_ws = x51
    match indices_ws {
      Empty => acc
      More((i, w), tail=rest_1) => {
        if @informal_float.gt0_float(w.0, w.1, w.2) {
          let upper_1 = @informal_taylor.eval_m_taylor_partial_upper(pp_1, i, ti_1)
          if @informal_float.lt0_float(upper_1.0, upper_1.1, upper_1.2) {
            let status = @certificate.MonoStatus::{ variable: i, decr_flag: true, df0_flag: false, ti_flag: true }
            mono(acc.prepend(status), rest_1)
          } else {
            let lower_1 = @informal_taylor.eval_m_taylor_partial_lower(pp_1, i, ti_1)
            if @informal_float.ge0_float(lower_1.0, lower_1.1, lower_1.2) {
              let status_1 = @certificate.MonoStatus::{ variable: i, decr_flag: false, df0_flag: false, ti_flag: true }
              mono(acc.prepend(status_1), rest_1)
            } else {
              mono(acc, rest_1)
            }
          }
        } else {
          mono(acc, rest_1)
        }
      }
    }
  }
  let restrict : (@certificate.MonoStatus) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MCellDomain raise) raise = fn(x52 : @certificate.MonoStatus) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MCellDomain raise) raise {
    let status_2 = x52
    fn(x53 : @informal_taylor.MCellDomain) -> @informal_taylor.MCellDomain raise {
      let dom_2 = x53
      let t54 = status_2.decr_flag
      restrict_domain(status_2.variable, t54, dom_2)
    }
  }
  let t55 = dom_1.w
  let st = mono(@list.List([]), @lib.zip(@lib.range(1L, ti_1.n), t55))
  if (Int::to_int64(@lib.length(st)) == 0L) {
    raise Failure("Not monotonic")
  } else {
    let dom2 = @lib.itlist(fn(x56 : @certificate.MonoStatus, x57 : @informal_taylor.MCellDomain) -> @informal_taylor.MCellDomain raise {
      let st_1 = x56
      let d = x57
      restrict(st_1)(d)
    }, st, dom_1)
    let result = construct_certificate0(opt_1)(dom2)(@list.List([f_1]))
    Result::Cell_result(@certificate.ResultTree::Result_mono(st, result))
  }
}

///|
/// `construct_certificate0`
pub fn construct_certificate0(x58 : SearchOptions) -> ((@informal_taylor.MCellDomain) -> ((@list.List[FunctionInfo]) -> @certificate.ResultTree raise) raise) raise {
  let opt_2 = x58
  let pp_2 = opt_2.pp
  fn construct(x60 : Int64, x61 : @informal_taylor.MCellDomain, x62 : @list.List[FunctionInfo]) -> @certificate.ResultTree raise {
    let depth = x60
    let dom_3 = x61
    let fs_2 = x62
    if (depth >= opt_2.max_depth) {
      error((((("depth (" + Int64::to_string(depth)) + ") > max_depth (") + Int64::to_string(opt_2.max_depth)) + ")"), dom_3, fs_2)
    } else {
      let result_1 = check_cell(opt_2, dom_3)(fs_2)
      match result_1 {
        Result::Cell_false => error("False result", dom_3, fs_2)
        Result::Cell_result(r) => r
        Result::Cell_pass(raw_flag, f_2) => {
          let _ = update_verified_vol(dom_3)
          @certificate.ResultTree::Result_pass((f_2.index, raw_flag))
        }
        Result::Cell_inconclusive => {
          let ws = @lib.map(@informal_float.float_of_ifloat, dom_3.w)
          let (_, j) = find_max(ws)
          let (dom1, dom2_1) = split_domain(pp_2, @lib.add63(j, 1L), dom_3)
          let r1 = construct(@lib.add63(depth, 1L), dom1, fs_2)
          let r2 = construct(@lib.add63(depth, 1L), dom2_1, fs_2)
          @certificate.ResultTree::Result_glue((j, false, r1, r2))
        }
      }
    }
  }
  fn(x63 : @informal_taylor.MCellDomain) -> ((@list.List[FunctionInfo]) -> @certificate.ResultTree raise) raise {
    let dom_4 = x63
    fn(x64 : @list.List[FunctionInfo]) -> @certificate.ResultTree raise {
      let fs_3 = x64
      let _ = init_vol(dom_4)
      construct(0L, dom_4, fs_3)
    }
  }
}

///|
/// `construct_certificate`
pub fn construct_certificate(x65 : SearchOptions, x66 : @informal_taylor.MCellDomain, x67 : @list.List[((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)]) -> @certificate.ResultTree raise {
  let opt = x65
  let dom = x66
  let fs_informal = x67
  let mk_f : (((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> FunctionInfo raise) raise = fn(x68 : ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> FunctionInfo raise) raise {
    let (f0, ft) = x68
    fn(x69 : Int64) -> FunctionInfo raise {
      let i = x69
      FunctionInfo::{ eval0: f0, taylor: ft, index: i }
    }
  }
  let fs = @lib.list_map2(fn(x70 : ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise), x71 : Int64) -> FunctionInfo raise {
    let s72 = mk_f(x70)
    s72(x71)
  }, fs_informal, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(fs_informal)), 1L)))
  construct_certificate0(opt)(dom)(fs)
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
