// Translated from upstream Formal_ineqs/verifier/m_verifier_main.hl; edit this file directly.

///|
/// `verification_parameters`
pub(all) struct VerificationParameters {
  allow_derivatives : Bool
  convex_flag : Bool
  mono_pass_flag : Bool
  raw_intervals0 : Bool
  raw_intervals1 : Bool
  adaptive_precision : Bool
  eps : Double
  eps_width : Double
  test_certificate : Bool
} derive(Eq, Debug)

///|
pub extend VerificationParameters with Eq::{not_equal, equal}

///|
pub extend VerificationParameters with Debug::{to_repr}

///|
pub extend VerificationParameters with @lib.OCompare::{ocompare}

///|
pub extend VerificationParameters with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for VerificationParameters with fn ocompare(self, other) {
  let c = @lib.compare(self.allow_derivatives, other.allow_derivatives)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.convex_flag, other.convex_flag)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.mono_pass_flag, other.mono_pass_flag)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.raw_intervals0, other.raw_intervals0)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.raw_intervals1, other.raw_intervals1)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.adaptive_precision, other.adaptive_precision)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.eps, other.eps)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.eps_width, other.eps_width)
  if c != 0 {
    return c
  }
  @lib.compare(self.test_certificate, other.test_certificate)
}

///|
pub impl @lib.OHash for VerificationParameters with fn ohash_visit(self, h) {
  h.block(0, 9)
  h.field(self.allow_derivatives)
  h.field(self.convex_flag)
  h.field(self.mono_pass_flag)
  h.field(self.raw_intervals0)
  h.field(self.raw_intervals1)
  h.field(self.adaptive_precision)
  h.field(self.eps)
  h.field(self.eps_width)
  h.field(self.test_certificate)
}

///|
/// default_params
fn step_1() -> Unit raise {
  default_params_c.set(VerificationParameters::{ allow_derivatives: true, convex_flag: false, mono_pass_flag: true, raw_intervals0: true, raw_intervals1: true, adaptive_precision: true, eps: 0.0, eps_width: 1.0e-12, test_certificate: false })
}

///|
let default_params_c : @lib.Cell[VerificationParameters] = @lib.Cell::new("default_params")

///|
/// `M_verifier_main.default_params`
pub fn default_params() -> VerificationParameters {
  default_params_c.get()
}

///|
/// `verification_stats`
pub(all) struct VerificationStats {
  total_time : Double
  formal_verification_time : Double
  certificate : @certificate.CertificateStats
} derive(Eq, Debug)

///|
pub extend VerificationStats with Eq::{not_equal, equal}

///|
pub extend VerificationStats with Debug::{to_repr}

///|
pub extend VerificationStats with @lib.OCompare::{ocompare}

///|
pub extend VerificationStats with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for VerificationStats with fn ocompare(self, other) {
  let c = @lib.compare(self.total_time, other.total_time)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.formal_verification_time, other.formal_verification_time)
  if c != 0 {
    return c
  }
  @lib.compare(self.certificate, other.certificate)
}

///|
pub impl @lib.OHash for VerificationStats with fn ohash_visit(self, h) {
  h.block(0, 3)
  h.field(self.total_time)
  h.field(self.formal_verification_time)
  h.field(self.certificate)
}

///|
/// `unzip3`
pub fn[TA, TB, TC] unzip3(x1 : @list.List[(TA, TB, TC)]) -> ((@list.List[TA], @list.List[TB], @list.List[TC])) raise {
  match x1 {
    Empty => (@list.List([]), @list.List([]), @list.List([]))
    More((a, b, c), tail=t) => {
      let (x, y, z) = unzip3(t)
      (x.prepend(a), y.prepend(b), z.prepend(c))
    }
  }
}

///|
/// `add_constant_interval`
pub fn add_constant_interval(x2 : @kernel.Thm) -> Unit raise {
  let int_th = x2
  @eval_interval.add_constant_interval(int_th)
  @informal_eval_interval.add_constant_interval(int_th)
}

///|
/// `test_expression`
pub fn test_expression(x3 : @list.List[String], x4 : @list.List[String]) -> ((@kernel.Term) -> Bool raise) raise {
  let bin_ops = x3
  let unary_ops = x4
  let test_vector : (@kernel.Term) -> ((String, @kernel.HolType), Int64) raise = fn(x6 : @kernel.Term) -> ((String, @kernel.HolType), Int64) raise {
    let tm = x6
    let (var_, index) = @basics.dest_binary("$", tm)
    let t7 = @nums.dest_small_numeral(index)
    (@kernel.dest_var(var_), t7)
  }
  let test_ = (x8 : @kernel.Term) => test__l(test_vector, bin_ops, unary_ops, x8)
  let test_binary = (x9 : @kernel.Term) => test_binary_l(test_vector, bin_ops, unary_ops, x9)
  let test_unary = (x10 : @kernel.Term) => test_unary_l(test_vector, bin_ops, unary_ops, x10)
  test_
}

///|
fn test__l(test_vector : (@kernel.Term) -> ((String, @kernel.HolType), Int64) raise, bin_ops : @list.List[String], unary_ops : @list.List[String], x8 : @kernel.Term) -> Bool raise {
  let test_binary = (x9 : @kernel.Term) => test_binary_l(test_vector, bin_ops, unary_ops, x9)
  let test_unary = (x10 : @kernel.Term) => test_unary_l(test_vector, bin_ops, unary_ops, x10)
  let tm_1 = x8
  (@list.List::is_empty(@kernel.frees(tm_1)) || (@lib.can(@kernel.dest_var, tm_1) || (@lib.can(test_vector, tm_1) || (test_unary(tm_1) || test_binary(tm_1)))))
}

///|
fn test_binary_l(test_vector : (@kernel.Term) -> ((String, @kernel.HolType), Int64) raise, bin_ops : @list.List[String], unary_ops : @list.List[String], x9 : @kernel.Term) -> Bool raise {
  let test_ = (x8 : @kernel.Term) => test__l(test_vector, bin_ops, unary_ops, x8)
  let tm_2 = x9
  try {
    let (lhs, rhs) = @kernel.dest_comb(tm_2)
    let (op, lhs_1) = @kernel.dest_comb(lhs)
    let (c, _) = @kernel.dest_const(op)
    if @lib.mem(c, bin_ops) {
      (test_(lhs_1) && test_(rhs))
    } else {
      false
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
fn test_unary_l(test_vector : (@kernel.Term) -> ((String, @kernel.HolType), Int64) raise, bin_ops : @list.List[String], unary_ops : @list.List[String], x10 : @kernel.Term) -> Bool raise {
  let test_ = (x8 : @kernel.Term) => test__l(test_vector, bin_ops, unary_ops, x8)
  let tm_3 = x10
  try {
    let (lhs_2, rhs_1) = @kernel.dest_comb(tm_3)
    let (c_1, _) = @kernel.dest_const(lhs_2)
    if @lib.mem(c_1, unary_ops) {
      test_(rhs_1)
    } else {
      false
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// is_poly
fn step_2() -> Unit raise {
  let bin_ops = @list.List(["real_add", "real_mul", "real_sub", "real_pow"])
  let unary_ops = @list.List(["real_neg"])
  is_poly_c.set(test_expression(bin_ops, unary_ops))
}

///|
let is_poly_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_poly")

///|
/// `is_poly`
pub fn is_poly(x : @kernel.Term) -> Bool raise {
  (is_poly_c.get())(x)
}

///|
/// mk_funs
fn step_3() -> Unit raise {
  let bin_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise)] = @list.List([("real_add", fn(x143 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise {
    fn(x144 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
      fn(x145 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
        mk_add_l(x143, x144, x145)
      }
    }
  }), ("real_sub", fn(x146 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise {
    fn(x147 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
      fn(x148 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
        mk_sub_l(x146, x147, x148)
      }
    }
  }), ("real_mul", fn(x149 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise {
    fn(x150 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
      fn(x151 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
        mk_mul_l(x149, x150, x151)
      }
    }
  })])
  let unary_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise)] = @list.List([("real_neg", fn(x152 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x153 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_neg_l(x152, x153)
    }
  }), ("real_abs", fn(x154 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x155 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_real_abs_l(x154, x155)
    }
  }), ("sqrt", fn(x156 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x157 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_sqrt_l(x156, x157)
    }
  }), ("exp", fn(x158 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x159 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_exp_l(x158, x159)
    }
  }), ("log", fn(x160 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x161 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_log_l(x160, x161)
    }
  }), ("atn", fn(x162 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x163 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_atn_l(x162, x163)
    }
  }), ("cos", fn(x164 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x165 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_cos_l(x164, x165)
    }
  }), ("sin", fn(x166 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x167 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_sin_l(x166, x167)
    }
  }), ("asn", fn(x168 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x169 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_asn_l(x168, x169)
    }
  }), ("acs", fn(x170 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x171 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_acs_l(x170, x171)
    }
  }), ("matan", fn(x172 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x173 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_matan_l(x172, x173)
    }
  }), ("real_inv", fn(x174 : Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
    fn(x175 : ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      mk_inv_l(x174, x175)
    }
  })])
  let mk_funs_rec = (x176 : Int64, x177 : Int64, x178 : @kernel.Term) => mk_funs_rec_l(bin_ops, unary_ops, x176, x177, x178)
  let mk_bin = (x180 : Int64, x181 : Int64, x182 : @kernel.Term, x183 : @kernel.Term) => mk_bin_l(bin_ops, unary_ops, x180, x181, x182, x183)
  let mk_unary = (x184 : Int64, x185 : Int64, x186 : @kernel.Term, x187 : @kernel.Term) => mk_unary_l(bin_ops, unary_ops, x184, x185, x186, x187)
  mk_funs_c.set(fn(x189 : Int64) -> ((Int64) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise {
    fn(x190 : Int64) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise {
      fn(x191 : @kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
        mk_funs_rec(x189, x190, x191)
      }
    }
  })
}

///|
let mk_funs_c : @lib.Cell[(Int64) -> ((Int64) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise] = @lib.Cell::new("mk_funs")

///|
/// `mk_funs`
pub fn mk_funs(x : Int64) -> ((Int64) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise {
  (mk_funs_c.get())(x)
}

///|
fn[TA, TB] mk_add_l(x11 : Int64, x12 : ((Int64) -> ((Int64) -> ((TA) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TB) -> @informal_taylor.MTaylorInterval raise) raise) raise), x13 : ((Int64) -> ((Int64) -> ((TA) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TB) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TA) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TB) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n = x11
  let (f1, ti1) = x12
  let (f2, ti2) = x13
  (fn(x14 : Int64) -> ((Int64) -> ((TA) -> @kernel.Thm raise) raise) raise {
    let p1 = x14
    fn(x15 : Int64) -> ((TA) -> @kernel.Thm raise) raise {
      let p2 = x15
      fn(x16 : TA) -> @kernel.Thm raise {
        let x = x16
        let a = f1(p1)(p2)(x)
        let b = f2(p1)(p2)(x)
        @m_taylor_arith2.eval_m_taylor_add2(n, p1, p2, a, b)
      }
    }
  }, fn(x17 : Int64) -> ((Int64) -> ((TB) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_1 = x17
    fn(x18 : Int64) -> ((TB) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_1 = x18
      fn(x19 : TB) -> @informal_taylor.MTaylorInterval raise {
        let x_1 = x19
        let a_1 = ti1(p1_1)(p2_1)(x_1)
        let b_1 = ti2(p1_1)(p2_1)(x_1)
        @informal_taylor.eval_m_taylor_add(p1_1, p2_1, a_1, b_1)
      }
    }
  })
}

///|
fn[TC, TD] mk_sub_l(x20 : Int64, x21 : ((Int64) -> ((Int64) -> ((TC) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TD) -> @informal_taylor.MTaylorInterval raise) raise) raise), x22 : ((Int64) -> ((Int64) -> ((TC) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TD) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TC) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TD) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_1 = x20
  let (f1_1, ti1_1) = x21
  let (f2_1, ti2_1) = x22
  (fn(x23 : Int64) -> ((Int64) -> ((TC) -> @kernel.Thm raise) raise) raise {
    let p1_2 = x23
    fn(x24 : Int64) -> ((TC) -> @kernel.Thm raise) raise {
      let p2_2 = x24
      fn(x25 : TC) -> @kernel.Thm raise {
        let x_2 = x25
        let a_2 = f1_1(p1_2)(p2_2)(x_2)
        let b_2 = f2_1(p1_2)(p2_2)(x_2)
        @m_taylor_arith2.eval_m_taylor_sub2(n_1, p1_2, p2_2, a_2, b_2)
      }
    }
  }, fn(x26 : Int64) -> ((Int64) -> ((TD) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_3 = x26
    fn(x27 : Int64) -> ((TD) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_3 = x27
      fn(x28 : TD) -> @informal_taylor.MTaylorInterval raise {
        let x_3 = x28
        let a_3 = ti1_1(p1_3)(p2_3)(x_3)
        let b_3 = ti2_1(p1_3)(p2_3)(x_3)
        @informal_taylor.eval_m_taylor_sub(p1_3, p2_3, a_3, b_3)
      }
    }
  })
}

///|
fn[TE, TF] mk_mul_l(x29 : Int64, x30 : ((Int64) -> ((Int64) -> ((TE) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TF) -> @informal_taylor.MTaylorInterval raise) raise) raise), x31 : ((Int64) -> ((Int64) -> ((TE) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TF) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TE) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TF) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_2 = x29
  let (f1_2, ti1_2) = x30
  let (f2_2, ti2_2) = x31
  (fn(x32 : Int64) -> ((Int64) -> ((TE) -> @kernel.Thm raise) raise) raise {
    let p1_4 = x32
    fn(x33 : Int64) -> ((TE) -> @kernel.Thm raise) raise {
      let p2_4 = x33
      fn(x34 : TE) -> @kernel.Thm raise {
        let x_4 = x34
        let a_4 = f1_2(p1_4)(p2_4)(x_4)
        let b_4 = f2_2(p1_4)(p2_4)(x_4)
        @m_taylor_arith2.eval_m_taylor_mul2(n_2, p1_4, p2_4, a_4, b_4)
      }
    }
  }, fn(x35 : Int64) -> ((Int64) -> ((TF) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_5 = x35
    fn(x36 : Int64) -> ((TF) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_5 = x36
      fn(x37 : TF) -> @informal_taylor.MTaylorInterval raise {
        let x_5 = x37
        let a_5 = ti1_2(p1_5)(p2_5)(x_5)
        let b_5 = ti2_2(p1_5)(p2_5)(x_5)
        @informal_taylor.eval_m_taylor_mul(p1_5, p2_5, a_5, b_5)
      }
    }
  })
}

///|
fn[TG, TH] mk_pow_l(x38 : Int64, x39 : ((Int64) -> ((Int64) -> ((TG) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TH) -> @informal_taylor.MTaylorInterval raise) raise) raise), x40 : Int64) -> (((Int64) -> ((Int64) -> ((TG) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TH) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_3 = x38
  let (f1_3, ti1_3) = x39
  let k = x40
  let eval_pow : (Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise = @m_taylor_arith.eval_m_taylor_pow(k)
  let ieval_pow : (Int64) -> ((Int64) -> ((@informal_taylor.MTaylorInterval) -> @informal_taylor.MTaylorInterval raise) raise) raise = @informal_taylor.eval_m_taylor_pow(k)
  (fn(x41 : Int64) -> ((Int64) -> ((TG) -> @kernel.Thm raise) raise) raise {
    let p1_6 = x41
    fn(x42 : Int64) -> ((TG) -> @kernel.Thm raise) raise {
      let p2_6 = x42
      fn(x43 : TG) -> @kernel.Thm raise {
        let x_6 = x43
        let a_6 = f1_3(p1_6)(p2_6)(x_6)
        eval_pow(n_3)(p1_6)(p2_6)(a_6)
      }
    }
  }, fn(x44 : Int64) -> ((Int64) -> ((TH) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_7 = x44
    fn(x45 : Int64) -> ((TH) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_7 = x45
      fn(x46 : TH) -> @informal_taylor.MTaylorInterval raise {
        let x_7 = x46
        let a_7 = ti1_3(p1_7)(p2_7)(x_7)
        ieval_pow(p1_7)(p2_7)(a_7)
      }
    }
  })
}

///|
fn[TI, TJ, TK, TL, TM, TN] mk_neg_l(x47 : Int64, x48 : ((TK) -> ((TJ) -> ((TI) -> @kernel.Thm raise) raise) raise, (TN) -> ((TM) -> ((TL) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((TK) -> ((TJ) -> ((TI) -> @kernel.Thm raise) raise) raise, (TN) -> ((TM) -> ((TL) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_4 = x47
  let (f1_4, ti1_4) = x48
  (fn(x49 : TK) -> ((TJ) -> ((TI) -> @kernel.Thm raise) raise) raise {
    let p1_8 = x49
    fn(x50 : TJ) -> ((TI) -> @kernel.Thm raise) raise {
      let p2_8 = x50
      fn(x51 : TI) -> @kernel.Thm raise {
        let x_8 = x51
        let a_8 = f1_4(p1_8)(p2_8)(x_8)
        @m_taylor_arith2.eval_m_taylor_neg2(n_4)(a_8)
      }
    }
  }, fn(x52 : TN) -> ((TM) -> ((TL) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_9 = x52
    fn(x53 : TM) -> ((TL) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_9 = x53
      fn(x54 : TL) -> @informal_taylor.MTaylorInterval raise {
        let x_9 = x54
        let a_9 = ti1_4(p1_9)(p2_9)(x_9)
        @informal_taylor.eval_m_taylor_neg(a_9)
      }
    }
  })
}

///|
fn[TO, TP, TQ, TR] mk_real_abs_l(x55 : Int64, x56 : ((TP) -> ((Int64) -> ((TO) -> @kernel.Thm raise) raise) raise, (TR) -> ((Int64) -> ((TQ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((TP) -> ((Int64) -> ((TO) -> @kernel.Thm raise) raise) raise, (TR) -> ((Int64) -> ((TQ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_5 = x55
  let (f1_5, ti1_5) = x56
  (fn(x57 : TP) -> ((Int64) -> ((TO) -> @kernel.Thm raise) raise) raise {
    let p1_10 = x57
    fn(x58 : Int64) -> ((TO) -> @kernel.Thm raise) raise {
      let p2_10 = x58
      fn(x59 : TO) -> @kernel.Thm raise {
        let x_10 = x59
        let a_10 = f1_5(p1_10)(p2_10)(x_10)
        @m_taylor_arith2.eval_m_taylor_abs2(n_5, p2_10, a_10)
      }
    }
  }, fn(x60 : TR) -> ((Int64) -> ((TQ) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_11 = x60
    fn(x61 : Int64) -> ((TQ) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_11 = x61
      fn(x62 : TQ) -> @informal_taylor.MTaylorInterval raise {
        let x_11 = x62
        let a_11 = ti1_5(p1_11)(p2_11)(x_11)
        @informal_taylor.eval_m_taylor_abs(p2_11, a_11)
      }
    }
  })
}

///|
fn[TS, TT] mk_sqrt_l(x63 : Int64, x64 : ((Int64) -> ((Int64) -> ((TS) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TT) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TS) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TT) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_6 = x63
  let (f1_6, ti1_6) = x64
  (fn(x65 : Int64) -> ((Int64) -> ((TS) -> @kernel.Thm raise) raise) raise {
    let p1_12 = x65
    fn(x66 : Int64) -> ((TS) -> @kernel.Thm raise) raise {
      let p2_12 = x66
      fn(x67 : TS) -> @kernel.Thm raise {
        let x_12 = x67
        let a_12 = f1_6(p1_12)(p2_12)(x_12)
        @m_taylor_arith2.eval_m_taylor_sqrt2(n_6, p1_12, p2_12, a_12)
      }
    }
  }, fn(x68 : Int64) -> ((Int64) -> ((TT) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_13 = x68
    fn(x69 : Int64) -> ((TT) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_13 = x69
      fn(x70 : TT) -> @informal_taylor.MTaylorInterval raise {
        let x_13 = x70
        let a_13 = ti1_6(p1_13)(p2_13)(x_13)
        @informal_taylor.eval_m_taylor_sqrt(p1_13, p2_13, a_13)
      }
    }
  })
}

///|
fn[TU, TV] mk_inv_l(x71 : Int64, x72 : ((Int64) -> ((Int64) -> ((TU) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TV) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TU) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TV) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_7 = x71
  let (f1_7, ti1_7) = x72
  (fn(x73 : Int64) -> ((Int64) -> ((TU) -> @kernel.Thm raise) raise) raise {
    let p1_14 = x73
    fn(x74 : Int64) -> ((TU) -> @kernel.Thm raise) raise {
      let p2_14 = x74
      fn(x75 : TU) -> @kernel.Thm raise {
        let x_14 = x75
        let a_14 = f1_7(p1_14)(p2_14)(x_14)
        @m_taylor_arith2.eval_m_taylor_inv2(n_7, p1_14, p2_14, a_14)
      }
    }
  }, fn(x76 : Int64) -> ((Int64) -> ((TV) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_15 = x76
    fn(x77 : Int64) -> ((TV) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_15 = x77
      fn(x78 : TV) -> @informal_taylor.MTaylorInterval raise {
        let x_15 = x78
        let a_15 = ti1_7(p1_15)(p2_15)(x_15)
        @informal_taylor.eval_m_taylor_inv(p1_15, p2_15, a_15)
      }
    }
  })
}

///|
fn[TW, TX] mk_exp_l(x79 : Int64, x80 : ((Int64) -> ((Int64) -> ((TW) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TX) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TW) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TX) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_8 = x79
  let (f1_8, ti1_8) = x80
  (fn(x81 : Int64) -> ((Int64) -> ((TW) -> @kernel.Thm raise) raise) raise {
    let p1_16 = x81
    fn(x82 : Int64) -> ((TW) -> @kernel.Thm raise) raise {
      let p2_16 = x82
      fn(x83 : TW) -> @kernel.Thm raise {
        let x_16 = x83
        let a_16 = f1_8(p1_16)(p2_16)(x_16)
        @m_taylor_arith2.eval_m_taylor_exp2(n_8, p1_16, p2_16, a_16)
      }
    }
  }, fn(x84 : Int64) -> ((Int64) -> ((TX) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_17 = x84
    fn(x85 : Int64) -> ((TX) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_17 = x85
      fn(x86 : TX) -> @informal_taylor.MTaylorInterval raise {
        let x_17 = x86
        let a_17 = ti1_8(p1_17)(p2_17)(x_17)
        @informal_taylor.eval_m_taylor_exp(p1_17, p2_17, a_17)
      }
    }
  })
}

///|
fn[TY, TZ] mk_log_l(x87 : Int64, x88 : ((Int64) -> ((Int64) -> ((TY) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TZ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TY) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TZ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_9 = x87
  let (f1_9, ti1_9) = x88
  (fn(x89 : Int64) -> ((Int64) -> ((TY) -> @kernel.Thm raise) raise) raise {
    let p1_18 = x89
    fn(x90 : Int64) -> ((TY) -> @kernel.Thm raise) raise {
      let p2_18 = x90
      fn(x91 : TY) -> @kernel.Thm raise {
        let x_18 = x91
        let a_18 = f1_9(p1_18)(p2_18)(x_18)
        @m_taylor_arith2.eval_m_taylor_log2(n_9, p1_18, p2_18, a_18)
      }
    }
  }, fn(x92 : Int64) -> ((Int64) -> ((TZ) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_19 = x92
    fn(x93 : Int64) -> ((TZ) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_19 = x93
      fn(x94 : TZ) -> @informal_taylor.MTaylorInterval raise {
        let x_19 = x94
        let a_19 = ti1_9(p1_19)(p2_19)(x_19)
        @informal_taylor.eval_m_taylor_log(p1_19, p2_19, a_19)
      }
    }
  })
}

///|
fn[TBA, TBB] mk_atn_l(x95 : Int64, x96 : ((Int64) -> ((Int64) -> ((TBA) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBB) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBA) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBB) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_10 = x95
  let (f1_10, ti1_10) = x96
  (fn(x97 : Int64) -> ((Int64) -> ((TBA) -> @kernel.Thm raise) raise) raise {
    let p1_20 = x97
    fn(x98 : Int64) -> ((TBA) -> @kernel.Thm raise) raise {
      let p2_20 = x98
      fn(x99 : TBA) -> @kernel.Thm raise {
        let x_20 = x99
        let a_20 = f1_10(p1_20)(p2_20)(x_20)
        @m_taylor_arith2.eval_m_taylor_atn2(n_10, p1_20, p2_20, a_20)
      }
    }
  }, fn(x100 : Int64) -> ((Int64) -> ((TBB) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_21 = x100
    fn(x101 : Int64) -> ((TBB) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_21 = x101
      fn(x102 : TBB) -> @informal_taylor.MTaylorInterval raise {
        let x_21 = x102
        let a_21 = ti1_10(p1_21)(p2_21)(x_21)
        @informal_taylor.eval_m_taylor_atn(p1_21)(p2_21)(a_21)
      }
    }
  })
}

///|
fn[TBC, TBD] mk_cos_l(x103 : Int64, x104 : ((Int64) -> ((Int64) -> ((TBC) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBD) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBC) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBD) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_11 = x103
  let (f1_11, ti1_11) = x104
  (fn(x105 : Int64) -> ((Int64) -> ((TBC) -> @kernel.Thm raise) raise) raise {
    let p1_22 = x105
    fn(x106 : Int64) -> ((TBC) -> @kernel.Thm raise) raise {
      let p2_22 = x106
      fn(x107 : TBC) -> @kernel.Thm raise {
        let x_22 = x107
        let a_22 = f1_11(p1_22)(p2_22)(x_22)
        @m_taylor_arith2.eval_m_taylor_cos2(n_11, p1_22, p2_22, a_22)
      }
    }
  }, fn(x108 : Int64) -> ((Int64) -> ((TBD) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_23 = x108
    fn(x109 : Int64) -> ((TBD) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_23 = x109
      fn(x110 : TBD) -> @informal_taylor.MTaylorInterval raise {
        let x_23 = x110
        let a_23 = ti1_11(p1_23)(p2_23)(x_23)
        @informal_taylor.eval_m_taylor_cos(p1_23, p2_23, a_23)
      }
    }
  })
}

///|
fn[TBE, TBF] mk_sin_l(x111 : Int64, x112 : ((Int64) -> ((Int64) -> ((TBE) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBF) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBE) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBF) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_12 = x111
  let (f1_12, ti1_12) = x112
  (fn(x113 : Int64) -> ((Int64) -> ((TBE) -> @kernel.Thm raise) raise) raise {
    let p1_24 = x113
    fn(x114 : Int64) -> ((TBE) -> @kernel.Thm raise) raise {
      let p2_24 = x114
      fn(x115 : TBE) -> @kernel.Thm raise {
        let x_24 = x115
        let a_24 = f1_12(p1_24)(p2_24)(x_24)
        @m_taylor_arith2.eval_m_taylor_sin2(n_12, p1_24, p2_24, a_24)
      }
    }
  }, fn(x116 : Int64) -> ((Int64) -> ((TBF) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_25 = x116
    fn(x117 : Int64) -> ((TBF) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_25 = x117
      fn(x118 : TBF) -> @informal_taylor.MTaylorInterval raise {
        let x_25 = x118
        let a_25 = ti1_12(p1_25)(p2_25)(x_25)
        @informal_taylor.eval_m_taylor_sin(p1_25, p2_25, a_25)
      }
    }
  })
}

///|
fn[TBG, TBH] mk_acs_l(x119 : Int64, x120 : ((Int64) -> ((Int64) -> ((TBG) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBH) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBG) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBH) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_13 = x119
  let (f1_13, ti1_13) = x120
  (fn(x121 : Int64) -> ((Int64) -> ((TBG) -> @kernel.Thm raise) raise) raise {
    let p1_26 = x121
    fn(x122 : Int64) -> ((TBG) -> @kernel.Thm raise) raise {
      let p2_26 = x122
      fn(x123 : TBG) -> @kernel.Thm raise {
        let x_26 = x123
        let a_26 = f1_13(p1_26)(p2_26)(x_26)
        @m_taylor_arith2.eval_m_taylor_acs2(n_13, p1_26, p2_26, a_26)
      }
    }
  }, fn(x124 : Int64) -> ((Int64) -> ((TBH) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_27 = x124
    fn(x125 : Int64) -> ((TBH) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_27 = x125
      fn(x126 : TBH) -> @informal_taylor.MTaylorInterval raise {
        let x_27 = x126
        let a_27 = ti1_13(p1_27)(p2_27)(x_27)
        @informal_taylor.eval_m_taylor_acs(p1_27, p2_27, a_27)
      }
    }
  })
}

///|
fn[TBI, TBJ] mk_asn_l(x127 : Int64, x128 : ((Int64) -> ((Int64) -> ((TBI) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBJ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBI) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBJ) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_14 = x127
  let (f1_14, ti1_14) = x128
  (fn(x129 : Int64) -> ((Int64) -> ((TBI) -> @kernel.Thm raise) raise) raise {
    let p1_28 = x129
    fn(x130 : Int64) -> ((TBI) -> @kernel.Thm raise) raise {
      let p2_28 = x130
      fn(x131 : TBI) -> @kernel.Thm raise {
        let x_28 = x131
        let a_28 = f1_14(p1_28)(p2_28)(x_28)
        @m_taylor_arith2.eval_m_taylor_asn2(n_14, p1_28, p2_28, a_28)
      }
    }
  }, fn(x132 : Int64) -> ((Int64) -> ((TBJ) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_29 = x132
    fn(x133 : Int64) -> ((TBJ) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_29 = x133
      fn(x134 : TBJ) -> @informal_taylor.MTaylorInterval raise {
        let x_29 = x134
        let a_29 = ti1_14(p1_29)(p2_29)(x_29)
        @informal_taylor.eval_m_taylor_asn(p1_29, p2_29, a_29)
      }
    }
  })
}

///|
fn[TBK, TBL] mk_matan_l(x135 : Int64, x136 : ((Int64) -> ((Int64) -> ((TBK) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBL) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> (((Int64) -> ((Int64) -> ((TBK) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((TBL) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let n_15 = x135
  let (f1_15, ti1_15) = x136
  (fn(x137 : Int64) -> ((Int64) -> ((TBK) -> @kernel.Thm raise) raise) raise {
    let p1_30 = x137
    fn(x138 : Int64) -> ((TBK) -> @kernel.Thm raise) raise {
      let p2_30 = x138
      fn(x139 : TBK) -> @kernel.Thm raise {
        let x_30 = x139
        let a_30 = f1_15(p1_30)(p2_30)(x_30)
        @m_taylor_arith2.eval_m_taylor_matan2(n_15, p1_30, p2_30, a_30)
      }
    }
  }, fn(x140 : Int64) -> ((Int64) -> ((TBL) -> @informal_taylor.MTaylorInterval raise) raise) raise {
    let p1_31 = x140
    fn(x141 : Int64) -> ((TBL) -> @informal_taylor.MTaylorInterval raise) raise {
      let p2_31 = x141
      fn(x142 : TBL) -> @informal_taylor.MTaylorInterval raise {
        let x_31 = x142
        let a_31 = ti1_15(p1_31)(p2_31)(x_31)
        @informal_taylor.eval_m_taylor_matan(p1_31, p2_31, a_31)
      }
    }
  })
}

///|
fn mk_funs_rec_l(bin_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise)], unary_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise)], x176 : Int64, x177 : Int64, x178 : @kernel.Term) -> (((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let mk_bin = (x180 : Int64, x181 : Int64, x182 : @kernel.Term, x183 : @kernel.Term) => mk_bin_l(bin_ops, unary_ops, x180, x181, x182, x183)
  let mk_unary = (x184 : Int64, x185 : Int64, x186 : @kernel.Term, x187 : @kernel.Term) => mk_unary_l(bin_ops, unary_ops, x184, x185, x186, x187)
  let n_16 = x176
  let pp = x177
  let fun_tm = x178
  let (x_var, body_tm) = @kernel.dest_abs(fun_tm)
  if is_poly(body_tm) {
    let (eval_fs, ti) = @m_verifier_build.mk_verification_functions_poly(pp, fun_tm)
    let t179 = ti.taylor
    (eval_fs.taylor, t179)
  } else {
    try {
      mk_bin(n_16, pp, x_var, body_tm)
    } catch {
      Failure(_) => mk_unary(n_16, pp, x_var, body_tm)
      e => raise e
    }
  }
}

///|
fn mk_bin_l(bin_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise)], unary_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise)], x180 : Int64, x181 : Int64, x182 : @kernel.Term, x183 : @kernel.Term) -> (((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let mk_funs_rec = (x176 : Int64, x177 : Int64, x178 : @kernel.Term) => mk_funs_rec_l(bin_ops, unary_ops, x176, x177, x178)
  let n_17 = x180
  let pp_1 = x181
  let x_var_1 = x182
  let tm = x183
  let (lhs, rhs) = @kernel.dest_comb(tm)
  let (op, lhs_1) = @kernel.dest_comb(lhs)
  let name = @kernel.dest_const(op).0
  if (name == "real_pow") {
    let l_funs = mk_funs_rec(n_17, pp_1, @kernel.mk_abs(x_var_1, lhs_1))
    let k_1 = @nums.dest_small_numeral(rhs)
    mk_pow_l(n_17, l_funs, k_1)
  } else {
    let mk_f : (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise = @lib.assoc(name, bin_ops)
    let l_funs_1 = mk_funs_rec(n_17, pp_1, @kernel.mk_abs(x_var_1, lhs_1))
    let r_funs = mk_funs_rec(n_17, pp_1, @kernel.mk_abs(x_var_1, rhs))
    mk_f(n_17)(l_funs_1)(r_funs)
  }
}

///|
fn mk_unary_l(bin_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise) raise)], unary_ops : @list.List[(String, (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise)], x184 : Int64, x185 : Int64, x186 : @kernel.Term, x187 : @kernel.Term) -> (((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) raise {
  let mk_funs_rec = (x176 : Int64, x177 : Int64, x178 : @kernel.Term) => mk_funs_rec_l(bin_ops, unary_ops, x176, x177, x178)
  let n_18 = x184
  let pp_2 = x185
  let x_var_2 = x186
  let tm_1 = x187
  let (op_1, rhs_1) = @kernel.dest_comb(tm_1)
  let mk_f_1 : (Int64) -> ((((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise)) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise) raise = @lib.assoc((fn(x188 : (String, @kernel.HolType)) -> String raise {
    x188.0
  })(@kernel.dest_const(op_1)), unary_ops)
  let funs = mk_funs_rec(n_18, pp_2, @kernel.mk_abs(x_var_2, rhs_1))
  mk_f_1(n_18)(funs)
}

///|
/// mk_verification_functions
fn step_4() -> Unit raise {
  mk_verification_functions_c.set(fn(x203 : Ref[VerificationParameters]) -> ((Int64) -> ((@kernel.Term) -> (@m_verifier_build.VerificationFuns, @informal_verifier.VerificationFuns) raise) raise) raise {
    let params = x203
    fn(x204 : Int64) -> ((@kernel.Term) -> (@m_verifier_build.VerificationFuns, @informal_verifier.VerificationFuns) raise) raise {
      let pp_2 = x204
      fn(x205 : @kernel.Term) -> (@m_verifier_build.VerificationFuns, @informal_verifier.VerificationFuns) raise {
        let fun_tm = x205
        let (x_var, body_tm) = @kernel.dest_abs(fun_tm)
        if is_poly(body_tm) {
          @m_verifier_build.mk_verification_functions_poly(pp_2, fun_tm)
        } else {
          let n = @m_taylor.get_dim(x_var)
          let (eval_taylor, eval_ti) = mk_funs(n)(pp_2)(fun_tm)
          let eval0 : (Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = @m_taylor.mk_eval_function(pp_2, fun_tm)
          let eval0_informal : (Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise = @informal_taylor.mk_eval_function(pp_2, fun_tm)
          let _ = {
            params.val = VerificationParameters::{ ..params.val, convex_flag: false, raw_intervals1: false }
            ()
          }
          (@m_verifier_build.VerificationFuns::{ taylor: eval_taylor, f: eval0, df: fn(x206 : Int64) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
            fn(x207 : Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
              fn(x208 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                fn(x209 : @kernel.Term) -> @kernel.Thm raise {
                  dummy_df_l(x206, x207, x208, x209)
                }
              }
            }
          }, ddf: fn(x210 : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise {
            fn(x211 : Int64) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
              fn(x212 : Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
                fn(x213 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  fn(x214 : @kernel.Term) -> @kernel.Thm raise {
                    dummy_ddf_l(x210, x211, x212, x213, x214)
                  }
                }
              }
            }
          }, diff2_f: fn(x215 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x216 : @kernel.Term) -> @kernel.Thm raise {
              dummy_diff2_l(x215, x216)
            }
          } }, @informal_verifier.VerificationFuns::{ taylor: eval_ti, f: eval0_informal, df: fn(x217 : Int64) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise) raise {
            fn(x218 : Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise {
              fn(x219 : @list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise {
                fn(x220 : @list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise {
                  dummy_df_l(x217, x218, x219, x220)
                }
              }
            }
          }, ddf: fn(x221 : Int64) -> ((Int64) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise) raise) raise {
            fn(x222 : Int64) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise) raise {
              fn(x223 : Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise {
                fn(x224 : @list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise {
                  fn(x225 : @list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise {
                    dummy_ddf_l(x221, x222, x223, x224, x225)
                  }
                }
              }
            }
          } })
        }
      }
    }
  })
}

///|
let mk_verification_functions_c : @lib.Cell[(Ref[VerificationParameters]) -> ((Int64) -> ((@kernel.Term) -> (@m_verifier_build.VerificationFuns, @informal_verifier.VerificationFuns) raise) raise) raise] = @lib.Cell::new("mk_verification_functions")

///|
/// `mk_verification_functions`
pub fn mk_verification_functions(x : Ref[VerificationParameters]) -> ((Int64) -> ((@kernel.Term) -> (@m_verifier_build.VerificationFuns, @informal_verifier.VerificationFuns) raise) raise) raise {
  (mk_verification_functions_c.get())(x)
}

///|
fn[TA, TB, TC, TD, TE] dummy_df_l(x192 : TE, x193 : TD, x194 : TC, x195 : TB) -> TA raise {
  let i = x192
  let pp = x193
  let lo = x194
  let hi = x195
  raise Failure("dummy df")
}

///|
fn[TF, TG, TH, TI, TJ, TK] dummy_ddf_l(x196 : TK, x197 : TJ, x198 : TI, x199 : TH, x200 : TG) -> TF raise {
  let i_1 = x196
  let j = x197
  let pp_1 = x198
  let lo_1 = x199
  let hi_1 = x200
  raise Failure("dummy ddf")
}

///|
fn[TL, TM, TN] dummy_diff2_l(x201 : TN, x202 : TM) -> TL raise {
  let lo_2 = x201
  let hi_2 = x202
  raise Failure("dummy diff2")
}

///|
/// `convert_to_float_list`
pub fn convert_to_float_list(x226 : Int64, x227 : Bool, x228 : @kernel.Term) -> @kernel.Term raise {
  let pp = x226
  let lo_flag = x227
  let list_tm = x228
  let tms = @basics.dest_list(list_tm)
  let i_funs = @lib.map(@eval_interval.build_interval_fun, tms)
  let ints = @lib.map(fn(x229 : @eval_interval.IntervalFun) -> @kernel.Thm raise {
    let f = x229
    @eval_interval.eval_interval_fun(pp, f, @list.List([]), @list.List([]))
  }, i_funs)
  let t232 = if lo_flag {
    fn(x230 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x230.0
    }
  } else {
    fn(x231 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x231.1
    }
  }
  let extract : (@kernel.Thm) -> @kernel.Term raise = fn(x236 : @kernel.Thm) -> @kernel.Term raise {
    (fn(x234 : @kernel.Term) -> @kernel.Term raise {
      (fn(x233 : @kernel.Term) -> @kernel.Term raise {
        t232(@pair.dest_pair(x233))
      })(@kernel.rand(x234))
    })((fn(x235 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x235)
    })(x236))
  }
  @lists.mk_list(@lib.map(extract, ints), @misc_vars.real_ty())
}

///|
/// `mk_float_domain`
pub fn mk_float_domain(x237 : Int64, x238 : (@kernel.Term, @kernel.Term)) -> ((@kernel.Thm, (@kernel.Term, @kernel.Term))) raise {
  let pp = x237
  let (xx_tm, zz_tm) = x238
  let xx_list = @basics.dest_list(xx_tm)
  let zz_list = @basics.dest_list(zz_tm)
  let n = Int::to_int64(@lib.length(xx_list))
  let get_intervals : (@list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise = fn(x239 : @list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise {
    let tms = x239
    let i_funs = @lib.map(@eval_interval.build_interval_fun, tms)
    @lib.map(fn(x240 : @eval_interval.IntervalFun) -> @kernel.Thm raise {
      let f = x240
      @eval_interval.eval_interval_fun(pp, f, @list.List([]), @list.List([]))
    }, i_funs)
  }
  let xx_ints = get_intervals(xx_list)
  let zz_ints = get_intervals(zz_list)
  let t241 = @simp.once_rewrite_rule(@list.List([@interval_arith.interval_arith()]))
  let xx_ineqs = @lib.map(fn(x242 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.conjunct1(t241(x242))
  }, xx_ints)
  let t243 = @simp.once_rewrite_rule(@list.List([@interval_arith.interval_arith()]))
  let zz_ineqs = @lib.map(fn(x244 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.conjunct2(t243(x244))
  }, zz_ints)
  let a_vals = @lib.map(fn(x246 : @kernel.Thm) -> @kernel.Term raise {
    @equal.lhand((fn(x245 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x245)
    })(x246))
  }, xx_ineqs)
  let b_vals = @lib.map(fn(x248 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x247 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x247)
    })(x248))
  }, zz_ineqs)
  let a_vars = @misc_vars.mk_real_vars(n, "a")
  let b_vars = @misc_vars.mk_real_vars(n, "b")
  let c_vars = @misc_vars.mk_real_vars(n, "c")
  let d_vars = @misc_vars.mk_real_vars(n, "d")
  let t259 = @lib.array_get(@m_verifier.subset_interval_thms_array(), @lib.int63_to_int(n))
  let t257 = @lib.zip(b_vals, b_vars)
  let t254 = @lib.zip(a_vals, a_vars)
  let t251 = @lib.zip(zz_list, d_vars)
  let t249 = @lib.zip(xx_list, c_vars)
  let th0 = (fn(x256 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x253 : @kernel.Thm) -> @kernel.Thm raise {
      ((x250 : @kernel.Thm) => @kernel.inst_rule(t249, x250))(((x252 : @kernel.Thm) => @kernel.inst_rule(t251, x252))(x253))
    })(((x255 : @kernel.Thm) => @kernel.inst_rule(t254, x255))(x256))
  })(((x258 : @kernel.Thm) => @kernel.inst_rule(t257, x258))(t259))
  let t260 = @lists.mk_list(b_vals, @misc_vars.real_ty())
  let t261 = (@lists.mk_list(a_vals, @misc_vars.real_ty()), t260)
  (@lib.itlist(@misc_functions.my_prove_hyp, xx_ineqs.concat(zz_ineqs), th0), t261)
}

///|
/// mk_standard_ineq
fn step_5() -> Unit raise {
  let lemma_lt = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) < (b : Real)) == (a - b < real_of_num(0))"))
  let lemma_le = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (b : Real)) == (a - b <= real_of_num(0))"))
  let lemma_imp = @class.taut(@term_syntax.parse_term("(P : Bool) == (Q : Bool) → Q → P"))
  mk_standard_ineq_c.set(fn(x262 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let thms = x262
    fn(x263 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x263
      let t264 = @equal.depth_conv(@pair.let_conv)
      let th0 = @equal.thenc(@simp.rewrite_conv((@list.List([@realax.real_gt(), @realax.real_ge(), @realax.real_div()])).concat(thms)), t264)(tm)
      let rhs = @kernel.rand(@kernel.concl(th0))
      let t266 = @simp.pure_rewrite_conv(@list.List([@calc_int.real_neg_0(), @real.real_sub_rzero(), @real.real_sub_lzero()]))
      let t265 = @simp.once_rewrite_conv(@list.List([lemma_lt]))
      let th1 = @equal.thenc(@equal.thenc(@simp.once_rewrite_conv(@list.List([lemma_le])), t265), t266)(rhs)
      let th2 = @kernel.trans(th0, th1)
      let ineqs = @lib.striplist(@basics.dest_disj, @kernel.rand(@kernel.concl(th2)))
      let le_flags = @lib.map((x268 : @kernel.Term) => @lib.can((x267 : @kernel.Term) => @basics.dest_binop(@misc_vars.le_op_real(), x267), x268), ineqs)
      if @lib.exists(fn(x269 : Bool) -> Bool raise {
        x269
      }, le_flags) {
        let (q_le_tms, q_lt_tms) = @lib.unzip(@lib.map2(fn(x270 : Int64, x271 : Bool) -> (@kernel.Term, @kernel.Term) raise {
          let i = x270
          let b = x271
          let var_ = @kernel.mk_var(("Q" + Int64::to_string(i)), @misc_vars.real_ty())
          let t273 = @basics.mk_binop(@misc_vars.lt_op_real(), var_, @term_syntax.parse_term("real_of_num(0)"))
          let t272 = @term_syntax.parse_term("real_of_num(0)")
          (@basics.mk_binop(if b {
            @misc_vars.le_op_real()
          } else {
            @misc_vars.lt_op_real()
          }, var_, t272), t273)
        }, @lib.range(1L, Int::to_int64(@lib.length(le_flags))), le_flags))
        let qs_le = @lib.end_itlist((x275 : @kernel.Term, x276 : @kernel.Term) => @lib.curry(fn(x274 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          @bool.mk_disj(x274.0, x274.1)
        }, x275, x276), q_le_tms)
        let qs_lt = @lib.end_itlist((x278 : @kernel.Term, x279 : @kernel.Term) => @lib.curry(fn(x277 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          @bool.mk_disj(x277.0, x277.1)
        }, x278, x279), q_lt_tms)
        let p_tm = @term_syntax.parse_term("(P : Bool)")
        let t280 = @bool.mk_imp(qs_lt, p_tm)
        let q_th = @meson.meson(@list.List([@realarith.real_lt_imp_le()]), @bool.mk_imp(@basics.mk_eq(p_tm, qs_le), t280))
        @drule.match_mp(q_th)(th2)
      } else {
        @drule.match_mp(lemma_imp)(th2)
      }
    }
  })
}

///|
let mk_standard_ineq_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("mk_standard_ineq")

///|
/// `mk_standard_ineq`
pub fn mk_standard_ineq(x : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (mk_standard_ineq_c.get())(x)
}

///|
/// expr_to_vector_fun
fn step_6() -> Unit raise {
  let comp_op = @term_syntax.parse_term("(op_dollar : (Cart[_, _], Num) -> _)")
  expr_to_vector_fun_c.set(fn(x281 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let expr_tm = x281
    let vars = @lib.list_sort(fn(x284 : @kernel.Term, x285 : @kernel.Term) -> Int raise {
      let s286 = (fn(x282 : @kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise {
        fn(x283 : @kernel.Term) -> Int64 raise {
          Int::to_int64(@lib.compare(x282, x283))
        }
      })(x284)
      @lib.int63_to_int(s286(x285))
    }, @kernel.frees(expr_tm))
    let n = Int::to_int64(@lib.length(vars))
    let x_var = @kernel.mk_var("x", @lib.array_get(@m_taylor.n_vector_type_array(), @lib.int63_to_int(if (n == 0L) {
      1L
    } else {
      n
    })))
    let x_tm = @basics.mk_icomb(comp_op, x_var)
    let vars2 = @lib.map(fn(x287 : Int64) -> @kernel.Term raise {
      let i = x287
      @kernel.mk_comb(x_tm, @nums.mk_small_numeral(i))
    }, @lib.range(1L, n))
    let t288 = if (n == 0L) {
      @m_taylor.mk_vector_list(@list.List([x_var]))
    } else {
      @m_taylor.mk_vector_list(vars)
    }
    (@kernel.mk_abs(x_var, @basics.subst(@lib.zip(vars2, vars), expr_tm)), t288)
  })
}

///|
let expr_to_vector_fun_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term) raise] = @lib.Cell::new("expr_to_vector_fun")

///|
/// `expr_to_vector_fun`
pub fn expr_to_vector_fun(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  (expr_to_vector_fun_c.get())(x)
}

///|
/// exprs_to_vector_fun
fn step_7() -> Unit raise {
  let comp_op = @term_syntax.parse_term("(op_dollar : (Cart[_, _], Num) -> _)")
  exprs_to_vector_fun_c.set(fn(x289 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @kernel.Term) raise {
    let expr_tms = x289
    let vars = @lib.list_sort(fn(x292 : @kernel.Term, x293 : @kernel.Term) -> Int raise {
      let s294 = (fn(x290 : @kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise {
        fn(x291 : @kernel.Term) -> Int64 raise {
          Int::to_int64(@lib.compare(x290, x291))
        }
      })(x292)
      @lib.int63_to_int(s294(x293))
    }, @lib.unions(@lib.map(fn(x295 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      @kernel.frees(x295)
    }, expr_tms)))
    let n = Int::to_int64(@lib.length(vars))
    let x_var = @kernel.mk_var("x", @lib.array_get(@m_taylor.n_vector_type_array(), @lib.int63_to_int(if (n == 0L) {
      1L
    } else {
      n
    })))
    let x_tm = @basics.mk_icomb(comp_op, x_var)
    let vars2 = @lib.map(fn(x296 : Int64) -> @kernel.Term raise {
      let i = x296
      @kernel.mk_comb(x_tm, @nums.mk_small_numeral(i))
    }, @lib.range(1L, n))
    let t298 = if (n == 0L) {
      @m_taylor.mk_vector_list(@list.List([x_var]))
    } else {
      @m_taylor.mk_vector_list(vars)
    }
    (@lib.map(fn(x297 : @kernel.Term) -> @kernel.Term raise {
      let tm = x297
      @kernel.mk_abs(x_var, @basics.subst(@lib.zip(vars2, vars), tm))
    }, expr_tms), t298)
  })
}

///|
let exprs_to_vector_fun_c : @lib.Cell[(@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @kernel.Term) raise] = @lib.Cell::new("exprs_to_vector_fun")

///|
/// `exprs_to_vector_fun`
pub fn exprs_to_vector_fun(x : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term], @kernel.Term)) raise {
  (exprs_to_vector_fun_c.get())(x)
}

///|
/// `mk_ineq`
pub fn mk_ineq(x299 : @kernel.Term, x300 : @list.List[String], x301 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
  let ineq_tm = x299
  let names = x300
  let dom_tm = x301
  let lo_list = @basics.dest_list(dom_tm.0)
  let hi_list = @basics.dest_list(dom_tm.1)
  let vars = @lib.map(fn(x302 : String) -> @kernel.Term raise {
    let name = x302
    @kernel.mk_var(name, @misc_vars.real_ty())
  }, names)
  let lo_ineqs = @lib.map2(fn(x303 : @kernel.Term, x304 : @kernel.Term) -> @kernel.Term raise {
    let tm1 = x303
    let tm2 = x304
    @basics.mk_binop(@misc_vars.le_op_real(), tm1, tm2)
  }, lo_list, vars)
  let hi_ineqs = @lib.map2(fn(x305 : @kernel.Term, x306 : @kernel.Term) -> @kernel.Term raise {
    let tm1_1 = x305
    let tm2_1 = x306
    @basics.mk_binop(@misc_vars.le_op_real(), tm1_1, tm2_1)
  }, vars, hi_list)
  let ineqs = @lib.map2(fn(x307 : @kernel.Term, x308 : @kernel.Term) -> @kernel.Term raise {
    let tm1_2 = x307
    let tm2_2 = x308
    @bool.mk_conj(tm1_2, tm2_2)
  }, lo_ineqs, hi_ineqs)
  let cond = @lib.end_itlist((x310 : @kernel.Term, x311 : @kernel.Term) => @lib.curry(fn(x309 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    @bool.mk_conj(x309.0, x309.1)
  }, x310, x311), ineqs)
  @bool.mk_imp(cond, ineq_tm)
}

///|
/// `dest_ineq`
pub fn dest_ineq(x312 : @kernel.Term) -> ((@kernel.Term, @list.List[String], (@kernel.Term, @kernel.Term))) raise {
  let ineq_tm = x312
  if @list.List::is_empty(@kernel.frees(ineq_tm)) {
    (ineq_tm, @list.List([]), (@misc_vars.real_empty_list(), @misc_vars.real_empty_list()))
  } else {
    let t315 = @simp.pure_rewrite_conv(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
    let tm0 = (fn(x314 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.rand((fn(x313 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x313)
      })(x314))
    })(t315(ineq_tm))
    let (cond, ineq) = @basics.dest_imp(tm0)
    let conds = @lib.striplist(@basics.dest_conj, cond)
    let ineqs = Ref::{ val: @list.List([]) }
    let decode_ineq : (@kernel.Term) -> Unit raise = fn(x316 : @kernel.Term) -> Unit raise {
      let tm = x316
      let (lhs, rhs) = @basics.dest_binop(@misc_vars.le_op_real(), tm)
      let lo_flag = @list.List::is_empty(@kernel.frees(lhs))
      let t318 = if lo_flag {
        rhs
      } else {
        lhs
      }
      let name = (fn(x317 : (String, @kernel.HolType)) -> String raise {
        x317.0
      })(@kernel.dest_var(t318))
      let val_ref_1 = try {
        @lib.assoc(name, ineqs.val)
      } catch {
        Failure(_) => {
          let val_ref = Ref::{ val: (@misc_vars.x_var_real(), @misc_vars.x_var_real()) }
          {
            ineqs.val = (ineqs.val).prepend((name, val_ref))
            ()
          }
          val_ref
        }
        e => raise e
      }
      {
        val_ref_1.val = if lo_flag {
          (lhs, (val_ref_1.val).1)
        } else {
          ((val_ref_1.val).0, rhs)
        }
        ()
      }
    }
    let _ = @lib.map(fn(x319 : @kernel.Term) -> Unit raise {
      let tm_1 = x319
      try {
        decode_ineq(tm_1)
      } catch {
        Failure(_) => raise Failure(("Bad variable bound inequality: " + @printer.string_of_term(tm_1)))
        e => raise e
      }
    }, conds)
    let (names, bounds0) = @lib.unzip(ineqs.val)
    let (lo, hi) = @lib.unzip(@lib.map(fn(x320 : Ref[(@kernel.Term, @kernel.Term)]) -> (@kernel.Term, @kernel.Term) raise {
      let r = x320
      r.val
    }, bounds0))
    let test_bounds : (@list.List[@kernel.Term]) -> ((String) -> Unit raise) raise = fn(x321 : @list.List[@kernel.Term]) -> ((String) -> Unit raise) raise {
      let bounds = x321
      fn(x322 : String) -> Unit raise {
        let bound_name = x322
        let _ = @lib.map2(fn(x323 : @kernel.Term, x324 : String) -> Unit raise {
          let tm_2 = x323
          let name_1 = x324
          if !@list.List::is_empty(@kernel.frees(tm_2)) {
            raise Failure((bound_name + (" bound is not defined for " + name_1)))
          } else {
            ()
          }
        }, bounds, names)
        ()
      }
    }
    test_bounds(hi)("Upper")
    let _ = test_bounds(lo)("Lower")
    let t325 = @misc_vars.mk_real_list(hi)
    (ineq, names, (@misc_vars.mk_real_list(lo), t325))
  }
}

///|
/// `normalize_result`
pub fn normalize_result(x326 : Bool, x327 : @kernel.Term, x328 : @kernel.Thm, x329 : @kernel.Thm, x330 : @kernel.Thm) -> @kernel.Thm raise {
  let norm_flag = x326
  let v1 = x327
  let imp_th1 = x328
  let domain_sub_th = x329
  let pass_thm = x330
  let th0 = @simp.rewrite_rule(@list.List([@m_verifier.m_cell_pass()]))(pass_thm)
  let n = (fn(x333 : @kernel.Term) -> Int64 raise {
    (fn(x332 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
      @m_taylor.get_dim((fn(x331 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x331.0
      })(x332))
    })(@basics.dest_forall(x333))
  })((fn(x334 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x334)
  })(th0))
  let th1 = @bool.spec(v1, th0)
  let comp_thms = @lib.end_itlist(@bool.conj, @lib.array_to_list(@lib.array_get(@m_taylor.comp_thms_array(), @lib.int63_to_int(n))))
  let th2 = @bool.undisch_all(@simp.rewrite_rule(@list.List([comp_thms]))(th1))
  let th3 = @bool.mp(imp_th1, th2)
  let t337 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let dom_th = (fn(x336 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(((x335 : @kernel.Thm) => @bool.spec(v1, x335))(x336))
  })(t337(domain_sub_th))
  let th4 = @bool.disch_all(((x338 : @kernel.Thm) => @misc_functions.my_prove_hyp(dom_th, x338))(th3))
  let t339 = @m_taylor.gen_in_interval(n)
  let th5 = @simp.rewrite_rule(@list.List([@vectors.in_interval(), @lib.array_get(@m_taylor.dimindex_array(), @lib.int63_to_int(n)), t339, comp_thms]))(th4)
  if norm_flag {
    @bool.gen_all(th5)
  } else {
    th4
  }
}

///|
/// `verify_ineq0`
pub fn verify_ineq0(x340 : VerificationParameters, x341 : Bool, x342 : Int64, x343 : @kernel.Term, x344 : @list.List[String], x345 : (@kernel.Term, @kernel.Term), x346 : @list.List[@kernel.Thm]) -> ((@kernel.Thm, VerificationStats)) raise {
  let params0 = x340
  let norm_flag = x341
  let pp = x342
  let ineq_tm = x343
  let var_names = x344
  let (lo_tm, hi_tm) = x345
  let rewrite_thms = x346
  let total_start = {
    (@lib.cpu_time.val)()
  }
  let imp_th1 = mk_standard_ineq(rewrite_thms)(ineq_tm)
  let ineq_tm1 = (fn(x347 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@equal.lhand(x347))
  })((fn(x348 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x348)
  })(imp_th1))
  if @list.List::is_empty(@kernel.frees(ineq_tm1)) {
    let i_fun = @eval_interval.build_interval_fun(ineq_tm1)
    let th0 = @eval_interval.eval_interval_fun(pp, i_fun, @list.List([]), @list.List([]))
    let th1 = @more_float.float_interval_lt0(th0)
    let total = (({
      (@lib.cpu_time.val)()
    }) - total_start)
    (@bool.mp(imp_th1, th1), VerificationStats::{ total_time: total, formal_verification_time: total, certificate: @certificate.dummy_stats() })
  } else {
    let (fun_tm, v1) = expr_to_vector_fun(ineq_tm1)
    let vars = @lib.map(fn(x350 : @kernel.Term) -> String raise {
      (fn(x349 : (String, @kernel.HolType)) -> String raise {
        x349.0
      })(@kernel.dest_var(x350))
    }, @m_taylor.dest_vector(v1))
    let lo_list = @basics.dest_list(lo_tm)
    let hi_list = @basics.dest_list(hi_tm)
    let bounds0 = @lib.zip(var_names, @lib.zip(lo_list, hi_list))
    let bounds = @lib.itlist(fn(x351 : String, x352 : @list.List[(@kernel.Term, @kernel.Term)]) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
      let name = x351
      let list = x352
      list.prepend(@lib.assoc(name, bounds0))
    }, vars, @list.List([]))
    let (xx, zz) = @lib.unzip(bounds)
    let t353 = @misc_vars.mk_real_list(zz)
    let (xx_1, zz_1) = (@misc_vars.mk_real_list(xx), t353)
    let (domain_sub_th, (xx1, zz1)) = mk_float_domain(pp, (xx_1, zz_1))
    let n = (fn(x355 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
      @m_taylor.get_dim((fn(x354 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x354.0
      })(x355))
    })(@kernel.dest_abs(fun_tm))
    let xx2 = @informal_taylor.convert_to_float_list(pp, true, xx_1)
    let zz2 = @informal_taylor.convert_to_float_list(pp, false, zz_1)
    let xx_float = @lib.map(@more_float.float_of_float_tm, @basics.dest_list(xx1))
    let zz_float = @lib.map(@more_float.float_of_float_tm, @basics.dest_list(zz1))
    let params = Ref::{ val: params0 }
    let (eval_fs, ti) = mk_verification_functions(params)(pp)(fun_tm)
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @verifier_options.report0("Constructing a solution certificate... ")
      true
    }
    let t356 = if (params.val).allow_derivatives {
      200L
    } else {
      0L
    }
    let opt0 = @informal_search.SearchOptions::{ raw_intervals0: (params.val).raw_intervals0, max_width: 1.0e-10, max_depth: 200L, mono_depth: t356, pp: pp }
    let fs_inf = @lib.map(fn(x357 : @informal_verifier.VerificationFuns) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      let f = x357
      let t358 = f.taylor
      (f.f, t358)
    }, @list.List([ti]))
    let dom_inf = @informal_taylor.mk_m_center_domain(pp, xx2, zz2)
    let certificate = @informal_search.construct_certificate(opt0, dom_inf, fs_inf)
    let stats = @certificate.result_stats(certificate)
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @verifier_options.report0(" done\n")
      true
    }
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @certificate.report_stats(stats)
      true
    }
    let c1 = @certificate.transform_result(xx_float, zz_float, certificate)
    let (start_2, finish_2, result_2) = if (params.val).adaptive_precision {
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Informal verification... ")
        true
      }
      let c1p = @informal_verifier.m_verify_list(pp, 1L, pp, @list.List([ti]), c1, xx2, zz2)
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Formal verification... ")
        true
      }
      let start = {
        (@lib.cpu_time.val)()
      }
      let result = @m_verifier.m_p_verify_list(n, pp, eval_fs, c1p, xx1, zz1)
      let finish = {
        (@lib.cpu_time.val)()
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      (start, finish, result)
    } else {
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Formal verification... ")
        true
      }
      let start_1 = {
        (@lib.cpu_time.val)()
      }
      let result_1 = @m_verifier.m_verify_list(n, pp, eval_fs, c1, xx1, zz1)
      let finish_1 = {
        (@lib.cpu_time.val)()
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      (start_1, finish_1, result_1)
    }
    let t359 = (finish_2 - start_2)
    let t360 = VerificationStats::{ total_time: (finish_2 - total_start), formal_verification_time: t359, certificate: stats }
    (normalize_result(norm_flag, v1, imp_th1, domain_sub_th, result_2), t360)
  }
}

///|
/// `normalize_disj_result`
pub fn normalize_disj_result(x361 : Bool, x362 : @list.List[@kernel.Term], x363 : @kernel.Term, x364 : @kernel.Thm, x365 : @kernel.Thm, x366 : @kernel.Thm) -> @kernel.Thm raise {
  let norm_flag = x361
  let fun_tms = x362
  let v1 = x363
  let imp_th1 = x364
  let domain_sub_th = x365
  let pass_thm = x366
  let (fs, dom) = @m_verifier.dest_m_cell_pass(@kernel.concl(pass_thm))
  let fs2 = @lists.mk_list(fun_tms, @kernel.type_of(@lib.hd(fun_tms)))
  let append_th0 = @drule.match_mp(@bool.ispecl(@list.List([fs, fs2, dom]), @m_verifier.m_cell_list_pass_append()))(pass_thm)
  let append_th1 = @simp.rewrite_rule(@list.List([@lists.append()]))(append_th0)
  let th0 = @simp.rewrite_rule(@list.List([@m_verifier.m_cell_list_pass(), @lists.itlist()]))(append_th1)
  let n = (fn(x369 : @kernel.Term) -> Int64 raise {
    (fn(x368 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
      @m_taylor.get_dim((fn(x367 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x367.0
      })(x368))
    })(@basics.dest_forall(x369))
  })((fn(x370 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x370)
  })(th0))
  let th1 = @bool.spec(v1, th0)
  let comp_thms = @lib.end_itlist(@bool.conj, @lib.array_to_list(@lib.array_get(@m_taylor.comp_thms_array(), @lib.int63_to_int(n))))
  let th2 = @simp.rewrite_rule(@list.List([comp_thms]))(th1)
  let r_tm0 = @kernel.rand((fn(x371 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x371)
  })(th2))
  let r_tm1 = @equal.lhand((fn(x372 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x372)
  })(imp_th1))
  let imp_th = @calc_rat.real_arith(@bool.mk_imp(r_tm0, r_tm1))
  let th3 = @bool.mp(imp_th, @bool.undisch_all(th2))
  let th4 = @bool.mp(imp_th1, th3)
  let t375 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let dom_th = (fn(x374 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(((x373 : @kernel.Thm) => @bool.spec(v1, x373))(x374))
  })(t375(domain_sub_th))
  let th5 = @bool.disch_all(((x376 : @kernel.Thm) => @misc_functions.my_prove_hyp(dom_th, x376))(th4))
  let t377 = @m_taylor.gen_in_interval(n)
  let th6 = @simp.rewrite_rule(@list.List([@vectors.in_interval(), @lib.array_get(@m_taylor.dimindex_array(), @lib.int63_to_int(n)), t377, comp_thms]))(th5)
  if norm_flag {
    @bool.gen_all(th6)
  } else {
    th5
  }
}

///|
/// `verify_disj_ineq0`
pub fn verify_disj_ineq0(x378 : VerificationParameters, x379 : Bool, x380 : Int64, x381 : @kernel.Term, x382 : @list.List[String], x383 : (@kernel.Term, @kernel.Term), x384 : @list.List[@kernel.Thm]) -> ((@kernel.Thm, VerificationStats)) raise {
  let params0 = x378
  let norm_flag = x379
  let pp = x380
  let ineq_tm = x381
  let var_names = x382
  let (lo_tm, hi_tm) = x383
  let rewrite_thms = x384
  let total_start = {
    (@lib.cpu_time.val)()
  }
  let imp_th1 = mk_standard_ineq(rewrite_thms)(ineq_tm)
  let ineq_tms = @lib.striplist(@basics.dest_disj, @equal.lhand((fn(x385 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x385)
  })(imp_th1)))
  if (Int::to_int64(@lib.length(ineq_tms)) == 1L) {
    verify_ineq0(params0, norm_flag, pp, ineq_tm, var_names, (lo_tm, hi_tm), rewrite_thms)
  } else {
    let ineq_tms1 = @lib.map(@equal.lhand, ineq_tms)
    let (fun_tms, v1) = exprs_to_vector_fun(ineq_tms1)
    let vars = @lib.map(fn(x387 : @kernel.Term) -> String raise {
      (fn(x386 : (String, @kernel.HolType)) -> String raise {
        x386.0
      })(@kernel.dest_var(x387))
    }, @m_taylor.dest_vector(v1))
    let lo_list = @basics.dest_list(lo_tm)
    let hi_list = @basics.dest_list(hi_tm)
    let bounds0 = @lib.zip(var_names, @lib.zip(lo_list, hi_list))
    let bounds = @lib.itlist(fn(x388 : String, x389 : @list.List[(@kernel.Term, @kernel.Term)]) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
      let name = x388
      let list = x389
      list.prepend(@lib.assoc(name, bounds0))
    }, vars, @list.List([]))
    let (xx, zz) = @lib.unzip(bounds)
    let t390 = @misc_vars.mk_real_list(zz)
    let (xx_1, zz_1) = (@misc_vars.mk_real_list(xx), t390)
    let (domain_sub_th, (xx1, zz1)) = mk_float_domain(pp, (xx_1, zz_1))
    let t393 = @lib.hd(fun_tms)
    let n = (fn(x392 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
      @m_taylor.get_dim((fn(x391 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x391.0
      })(x392))
    })(@kernel.dest_abs(t393))
    let xx2 = @informal_taylor.convert_to_float_list(pp, true, xx_1)
    let zz2 = @informal_taylor.convert_to_float_list(pp, false, zz_1)
    let xx_float = @lib.map(@more_float.float_of_float_tm, @basics.dest_list(xx1))
    let zz_float = @lib.map(@more_float.float_of_float_tm, @basics.dest_list(zz1))
    let _ = if (params0.mono_pass_flag == false) {
      true
    } else {
      @lib.report("WARNING: mono_pass_flag should be false")
      true
    }
    let _ = if (params0.convex_flag == false) {
      true
    } else {
      @lib.report("WARNING: covex_flag should be false")
      true
    }
    let _ = if (params0.allow_derivatives == false) {
      true
    } else {
      @lib.report("WARNING: allow_derivatives should be false")
      true
    }
    let params = Ref::{ val: VerificationParameters::{ ..params0, allow_derivatives: false, convex_flag: false, mono_pass_flag: false } }
    let (eval_fs_list, ti_list) = @lib.unzip(@lib.map(mk_verification_functions(params)(pp), fun_tms))
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @verifier_options.report0("Constructing a solution certificate... ")
      true
    }
    let opt0 = @informal_search.SearchOptions::{ raw_intervals0: (params.val).raw_intervals0, max_width: 1.0e-10, max_depth: 200L, mono_depth: 0L, pp: pp }
    let fs_inf = @lib.map(fn(x394 : @informal_verifier.VerificationFuns) -> ((Int64) -> ((@list.List[@informal_float.Ifloat]) -> ((@list.List[@informal_float.Ifloat]) -> @informal_interval.Interval raise) raise) raise, (Int64) -> ((Int64) -> ((@informal_taylor.MCellDomain) -> @informal_taylor.MTaylorInterval raise) raise) raise) raise {
      let f = x394
      let t395 = f.taylor
      (f.f, t395)
    }, ti_list)
    let dom_inf = @informal_taylor.mk_m_center_domain(pp, xx2, zz2)
    let certificate = @informal_search.construct_certificate(opt0, dom_inf, fs_inf)
    let stats = @certificate.result_stats(certificate)
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @verifier_options.report0(" done\n")
      true
    }
    let _ = if (@verifier_options.info_print_level().val < 1L) {
      true
    } else {
      @certificate.report_stats(stats)
      true
    }
    let c1 = certificate
    let (start_2, finish_2, result_2) = if (params.val).adaptive_precision {
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Informal verification... ")
        true
      }
      let (c1p, _) = @informal_verifier.m_verify_raw0(pp, 1L, pp, ti_list, c1, xx2, zz2)
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Formal verification... ")
        true
      }
      let start = {
        (@lib.cpu_time.val)()
      }
      let result = @m_verifier.m_p_verify_disj_raw0(n, pp, eval_fs_list, c1p, xx1, zz1)
      let finish = {
        (@lib.cpu_time.val)()
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      (start, finish, result)
    } else {
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0("Formal verification... ")
        true
      }
      let start_1 = {
        (@lib.cpu_time.val)()
      }
      let result_1 = @m_verifier.m_verify_disj_raw0(n, pp, eval_fs_list, c1, xx1, zz1)
      let finish_1 = {
        (@lib.cpu_time.val)()
      }
      let _ = if (@verifier_options.info_print_level().val < 1L) {
        true
      } else {
        @verifier_options.report0(" done\n")
        true
      }
      (start_1, finish_1, result_1)
    }
    let t396 = (finish_2 - start_2)
    let t397 = VerificationStats::{ total_time: (finish_2 - total_start), formal_verification_time: t396, certificate: stats }
    (normalize_disj_result(norm_flag, fun_tms, v1, imp_th1, domain_sub_th, result_2), t397)
  }
}

///|
/// `verify_ineq_and_rewrite`
pub fn verify_ineq_and_rewrite(x398 : @list.List[@kernel.Thm], x399 : VerificationParameters, x400 : Int64, x401 : @kernel.Term) -> ((@kernel.Thm, VerificationStats)) raise {
  let rewrite_thms = x398
  let params = x399
  let pp = x400
  let ineq_tm = x401
  let (ineq, vars, bounds) = dest_ineq(ineq_tm)
  verify_disj_ineq0(params, true, pp, ineq, vars, bounds, rewrite_thms)
}

///|
/// verify_ineq
fn step_8() -> Unit raise {
  verify_ineq_c.set(fn(x405 : VerificationParameters) -> ((Int64) -> ((@kernel.Term) -> (@kernel.Thm, VerificationStats) raise) raise) raise {
    fn(x406 : Int64) -> ((@kernel.Term) -> (@kernel.Thm, VerificationStats) raise) raise {
      fn(x407 : @kernel.Term) -> (@kernel.Thm, VerificationStats) raise {
        ((x402 : VerificationParameters, x403 : Int64, x404 : @kernel.Term) => verify_ineq_and_rewrite(@list.List([@real.real_pow_1(), @realax.real_pow()]), x402, x403, x404))(x405, x406, x407)
      }
    }
  })
}

///|
let verify_ineq_c : @lib.Cell[(VerificationParameters) -> ((Int64) -> ((@kernel.Term) -> (@kernel.Thm, VerificationStats) raise) raise) raise] = @lib.Cell::new("verify_ineq")

///|
/// `verify_ineq`
pub fn verify_ineq(x : VerificationParameters) -> ((Int64) -> ((@kernel.Term) -> (@kernel.Thm, VerificationStats) raise) raise) raise {
  (verify_ineq_c.get())(x)
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
}
