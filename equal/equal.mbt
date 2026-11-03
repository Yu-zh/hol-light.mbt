// ===========================================================================
// Basic equality reasoning including conversionals (port of equal.ml).
// ===========================================================================

///|
using @kernel {type Term, type Thm}

///|
using @list {type List}

///|
/// Conversions: functions from a term `t` to a theorem `|- t = t'`.
pub type Conv = (Term) -> Thm raise

// ---------------------------------------------------------------------------
// A bit more syntax.
// ---------------------------------------------------------------------------

///|
pub fn lhand(tm : Term) -> Term raise {
  @kernel.rand(@kernel.rator(tm))
}

///|
pub fn lhs(tm : Term) -> Term raise {
  @kernel.dest_eq(tm).0
}

///|
pub fn rhs(tm : Term) -> Term raise {
  @kernel.dest_eq(tm).1
}

///|
/// Like `variant`, but also avoids constant names and
/// ignores types.
pub fn mk_primed_var(avoid : List[Term], v : Term) -> Term raise {
  let (s, ty) = @kernel.dest_var(v)
  let names = @lib.mapfilter(t => @kernel.dest_var(t).0, avoid)
  let mut s1 = s
  while @lib.mem(s1, names) || @lib.can(c => @kernel.get_const_type(c), s1) {
    s1 = s1 + "'"
  }
  @kernel.mk_var(s1, ty)
}

// ---------------------------------------------------------------------------
// General case of beta-conversion and basic derived rules.
// ---------------------------------------------------------------------------

///|
/// `BETA_CONV`: `|- (\x. t[x]) s = t[s]`.
pub fn beta_conv(tm : Term) -> Thm raise {
  @kernel.beta(tm) catch {
    Failure(_) => {
      let result = try {
        let (f, arg) = @kernel.dest_comb(tm)
        let v = @basics.bndvar(f)
        @kernel.inst_rule(
          @list.singleton((arg, v)),
          @kernel.beta(@kernel.mk_comb(f, v)),
        )
      } catch {
        Failure(_) => raise Failure("BETA_CONV: Not a beta-redex")
        e => raise e
      }
      result
    }
    e => raise e
  }
}

///|
/// `AP_TERM`: from `|- x = y` derive `|- f x = f y`.
pub fn ap_term(tm : Term, th : Thm) -> Thm raise {
  let rth = @kernel.refl(tm)
  @kernel.mk_comb_rule(rth, th) catch {
    Failure(_) => raise Failure("AP_TERM")
    e => raise e
  }
}

///|
/// `AP_THM`: from `|- f = g` derive `|- f x = g x`.
pub fn ap_thm(th : Thm, tm : Term) -> Thm raise {
  @kernel.mk_comb_rule(th, @kernel.refl(tm)) catch {
    Failure(_) => raise Failure("AP_THM")
    e => raise e
  }
}

///|
/// `SYM`: from `|- l = r` derive `|- r = l`.
pub fn sym(th : Thm) -> Thm raise {
  let tm = @kernel.concl(th)
  let (l, _) = @kernel.dest_eq(tm)
  let lth = @kernel.refl(l)
  @kernel.eq_mp(
    @kernel.mk_comb_rule(ap_term(@kernel.rator(@kernel.rator(tm)), th), lth),
    lth,
  )
}

///|
/// `ALPHA`: `|- tm1 = tm2` for alpha-equivalent terms.
pub fn alpha_rule(tm1 : Term, tm2 : Term) -> Thm raise {
  @kernel.trans(@kernel.refl(tm1), @kernel.refl(tm2)) catch {
    Failure(_) => raise Failure("ALPHA")
    e => raise e
  }
}

///|
/// `ALPHA_CONV`: rename the bound variable of an abstraction.
pub fn alpha_conv(v : Term) -> Conv {
  tm => {
    let res = @basics.alpha(v, tm)
    alpha_rule(tm, res)
  }
}

///|
/// `GEN_ALPHA_CONV`: rename the bound variable of an abstraction or binder.
pub fn gen_alpha_conv(v : Term) -> Conv {
  tm => {
    if @kernel.is_abs(tm) {
      alpha_conv(v)(tm)
    } else {
      let (b, abs) = @kernel.dest_comb(tm)
      ap_term(b, alpha_conv(v)(abs))
    }
  }
}

///|
/// `MK_BINOP`: from `|- a = b` and `|- c = d` derive `|- op a c = op b d`.
pub fn mk_binop_rule(op : Term, lth : Thm, rth : Thm) -> Thm raise {
  @kernel.mk_comb_rule(ap_term(op, lth), rth)
}

// ---------------------------------------------------------------------------
// Terminal conversions and conversion combinators.
// ---------------------------------------------------------------------------

///|
/// `NO_CONV`: always fails.
pub fn no_conv(_tm : Term) -> Thm raise {
  raise Failure("NO_CONV")
}

///|
/// `ALL_CONV`: `|- t = t`.
pub let all_conv : Conv = tm => @kernel.refl(tm)

///|
/// `conv1 THENC conv2`
pub fn thenc(conv1 : Conv, conv2 : Conv) -> Conv {
  t => {
    let th1 = conv1(t)
    let th2 = conv2(@kernel.rand(@kernel.concl(th1)))
    @kernel.trans(th1, th2)
  }
}

///|
/// `conv1 ORELSEC conv2`
pub fn orelsec(conv1 : Conv, conv2 : Conv) -> Conv {
  t => {
    conv1(t) catch {
      Failure(_) => conv2(t)
      e => raise e
    }
  }
}

///|
/// `FIRST_CONV`
pub fn first_conv(l : List[Conv]) -> Conv raise {
  @lib.end_itlist(orelsec, l)
}

///|
/// `EVERY_CONV`
pub fn every_conv(l : List[Conv]) -> Conv {
  @lib.itlist(thenc, l, all_conv)
}

///|
/// `REPEATC`: apply a conversion repeatedly until it fails.
pub fn repeatc(conv : Conv) -> Conv {
  fn go(t : Term) -> Thm raise {
    orelsec(thenc(conv, go), all_conv)(t)
  }

  go
}

///|
/// `CHANGED_CONV`: fail if the conversion does not change the term.
pub fn changed_conv(conv : Conv) -> Conv {
  tm => {
    let th = conv(tm)
    let (l, r) = @kernel.dest_eq(@kernel.concl(th))
    if @basics.aconv(l, r) {
      raise Failure("CHANGED_CONV")
    }
    th
  }
}

///|
/// `TRY_CONV`
pub fn try_conv(conv : Conv) -> Conv {
  orelsec(conv, all_conv)
}

// ---------------------------------------------------------------------------
// Subterm conversions.
// ---------------------------------------------------------------------------

///|
/// `RATOR_CONV`
pub fn rator_conv(conv : Conv) -> Conv {
  tm => {
    match tm {
      Comb(l, r) => ap_thm(conv(l), r)
      _ => raise Failure("RATOR_CONV: Not a combination")
    }
  }
}

///|
/// `RAND_CONV`
pub fn rand_conv(conv : Conv) -> Conv {
  tm => {
    match tm {
      Comb(l, r) => @kernel.mk_comb_rule(@kernel.refl(l), conv(r))
      _ => raise Failure("RAND_CONV: Not a combination")
    }
  }
}

///|
/// `LAND_CONV = RATOR_CONV o RAND_CONV`
pub fn land_conv(conv : Conv) -> Conv {
  rator_conv(rand_conv(conv))
}

///|
/// `COMB2_CONV`
pub fn comb2_conv(lconv : Conv, rconv : Conv) -> Conv {
  tm => {
    match tm {
      Comb(l, r) => {
        // `MK_COMB(lconv l, rconv r)`: OCaml evaluates the right one first.
        let rth = rconv(r)
        @kernel.mk_comb_rule(lconv(l), rth)
      }
      _ => raise Failure("COMB2_CONV: Not a combination")
    }
  }
}

///|
/// `COMB_CONV = W COMB2_CONV`
pub fn comb_conv(conv : Conv) -> Conv {
  comb2_conv(conv, conv)
}

///|
/// `ABS_CONV`: apply a conversion to the body of an abstraction, renaming
/// the bound variable if it occurs free in the hypotheses.
pub fn abs_conv(conv : Conv) -> Conv {
  tm => {
    let (v, bod) = @kernel.dest_abs(tm)
    let th = conv(bod)
    @kernel.abs_rule(v, th) catch {
      Failure(_) => {
        let gv = @basics.genvar(@kernel.type_of(v))
        let gbod = @kernel.vsubst(@list.singleton((gv, v)), bod)
        let gth = @kernel.abs_rule(gv, conv(gbod))
        let gtm = @kernel.concl(gth)
        let (l, r) = @kernel.dest_eq(gtm)
        let v1 = @kernel.variant(@kernel.frees(gtm), v)
        let l1 = @basics.alpha(v1, l)
        let r1 = @basics.alpha(v1, r)
        @kernel.eq_mp(alpha_rule(gtm, @basics.mk_eq(l1, r1)), gth)
      }
      e => raise e
    }
  }
}

///|
/// `BINDER_CONV`
pub fn binder_conv(conv : Conv) -> Conv {
  tm => {
    if @kernel.is_abs(tm) {
      abs_conv(conv)(tm)
    } else {
      rand_conv(abs_conv(conv))(tm)
    }
  }
}

///|
/// `SUB_CONV`
pub fn sub_conv(conv : Conv) -> Conv {
  tm => {
    match tm {
      Comb(_) => comb_conv(conv)(tm)
      Abs(_) => abs_conv(conv)(tm)
      _ => @kernel.refl(tm)
    }
  }
}

///|
/// `BINOP_CONV`
pub fn binop_conv(conv : Conv) -> Conv {
  tm => {
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, l) = @kernel.dest_comb(lop)
    // OCaml evaluates the right argument of `MK_COMB(_, _)` first.
    let rth = conv(r)
    @kernel.mk_comb_rule(ap_term(op, conv(l)), rth)
  }
}

///|
/// `BINOP2_CONV`
pub fn binop2_conv(conv1 : Conv, conv2 : Conv) -> Conv {
  tm => {
    let (lop, r) = @kernel.dest_comb(tm)
    let (op, l) = @kernel.dest_comb(lop)
    let rth = conv2(r)
    @kernel.mk_comb_rule(ap_term(op, conv1(l)), rth)
  }
}

// ---------------------------------------------------------------------------
// Depth conversions, using failure-propagating ("Boultonized") versions
// internally to avoid rebuilding terms.
// ---------------------------------------------------------------------------

///|
/// `THENQC`: the outer handler covers `conv1`; the inner one covers
/// `conv2` and the `TRANS`.
fn thenqc(conv1 : Conv, conv2 : Conv, tm : Term) -> Thm raise {
  try {
    let th1 = conv1(tm)
    try {
      let th2 = conv2(@kernel.rand(@kernel.concl(th1)))
      @kernel.trans(th1, th2)
    } catch {
      Failure(_) => th1
      e => raise e
    }
  } catch {
    Failure(_) => conv2(tm)
    e => raise e
  }
}

///|
fn thencqc(conv1 : Conv, conv2 : Conv, tm : Term) -> Thm raise {
  let th1 = conv1(tm)
  try {
    let th2 = conv2(@kernel.rand(@kernel.concl(th1)))
    @kernel.trans(th1, th2)
  } catch {
    Failure(_) => th1
    e => raise e
  }
}

///|
/// `COMB_QCONV`: the outer handler also covers the inner fallback.
fn comb_qconv(conv : Conv, tm : Term) -> Thm raise {
  match tm {
    Comb(l, r) =>
      try {
        let th1 = conv(l)
        try {
          let th2 = conv(r)
          @kernel.mk_comb_rule(th1, th2)
        } catch {
          Failure(_) => ap_thm(th1, r)
          e => raise e
        }
      } catch {
        Failure(_) => ap_term(l, conv(r))
        e => raise e
      }
    _ => raise Failure("COMB_QCONV: Not a combination")
  }
}

///|
fn repeatqc(conv : Conv, tm : Term) -> Thm raise {
  thencqc(conv, t => repeatqc(conv, t), tm)
}

///|
fn sub_qconv(conv : Conv, tm : Term) -> Thm raise {
  match tm {
    Abs(_) => abs_conv(conv)(tm)
    _ => comb_qconv(conv, tm)
  }
}

///|
fn once_depth_qconv(conv : Conv, tm : Term) -> Thm raise {
  orelsec(conv, t => sub_qconv(t1 => once_depth_qconv(conv, t1), t))(tm)
}

///|
fn depth_qconv(conv : Conv, tm : Term) -> Thm raise {
  thenqc(
    t => sub_qconv(t1 => depth_qconv(conv, t1), t),
    t => repeatqc(conv, t),
    tm,
  )
}

///|
fn redepth_qconv(conv : Conv, tm : Term) -> Thm raise {
  thenqc(
    t => sub_qconv(t1 => redepth_qconv(conv, t1), t),
    t => thencqc(conv, t1 => redepth_qconv(conv, t1), t),
    tm,
  )
}

///|
fn top_depth_qconv(conv : Conv, tm : Term) -> Thm raise {
  thenqc(
    t => repeatqc(conv, t),
    t => {
      thencqc(
        t1 => sub_qconv(t2 => top_depth_qconv(conv, t2), t1),
        t1 => thencqc(conv, t2 => top_depth_qconv(conv, t2), t1),
        t,
      )
    },
    tm,
  )
}

///|
fn top_sweep_qconv(conv : Conv, tm : Term) -> Thm raise {
  thenqc(
    t => repeatqc(conv, t),
    t => sub_qconv(t1 => top_sweep_qconv(conv, t1), t),
    tm,
  )
}

///|
/// `ONCE_DEPTH_CONV`
pub fn once_depth_conv(c : Conv) -> Conv {
  try_conv(t => once_depth_qconv(c, t))
}

///|
/// `DEPTH_CONV`
pub fn depth_conv(c : Conv) -> Conv {
  try_conv(t => depth_qconv(c, t))
}

///|
/// `REDEPTH_CONV`
pub fn redepth_conv(c : Conv) -> Conv {
  try_conv(t => redepth_qconv(c, t))
}

///|
/// `TOP_DEPTH_CONV`
pub fn top_depth_conv(c : Conv) -> Conv {
  try_conv(t => top_depth_qconv(c, t))
}

///|
/// `TOP_SWEEP_CONV`
pub fn top_sweep_conv(c : Conv) -> Conv {
  try_conv(t => top_sweep_qconv(c, t))
}

///|
/// `DEPTH_BINOP_CONV`: apply at the leaves of an `op`-tree (failures at
/// leaves cause failure).
pub fn depth_binop_conv(op : Term, conv : Conv) -> Conv {
  fn go(tm : Term) -> Thm raise {
    match tm {
      Comb(Comb(op1, _), _) if op1 == op => {
        let (l, r) = @basics.dest_binop(op, tm)
        let lth = go(l)
        let rth = go(r)
        @kernel.mk_comb_rule(ap_term(op1, lth), rth)
      }
      _ => conv(tm)
    }
  }

  go
}

///|
/// `PATH_CONV`: follow a path (`l` = rator, `r` = rand, otherwise body).
pub fn path_conv(s : String, cnv : Conv) -> Conv {
  // As upstream's `explode`, one step per byte of the path.
  let steps = @utf8.encode(s)
  let mut c = cnv
  for i = steps.length() - 1; i >= 0; i = i - 1 {
    c = match steps[i] {
      b'l' => rator_conv(c)
      b'r' => rand_conv(c)
      _ => abs_conv(c)
    }
  }
  c
}

///|
/// `PAT_CONV`: apply `conv` where the pattern's bound variables occur.
pub fn pat_conv(pat : Term, conv : Conv) -> Conv raise {
  let (xs, pbod) = @basics.strip_abs(pat)
  fn pconv(pat : Term) -> Conv raise {
    if @lib.mem(pat, xs) {
      conv
    } else if !@lib.exists(x => @basics.free_in(x, pat), xs) {
      all_conv
    } else if @kernel.is_comb(pat) {
      // Arguments are evaluated right to left in OCaml.
      let rc = pconv(@kernel.rand(pat))
      comb2_conv(pconv(@kernel.rator(pat)), rc)
    } else {
      abs_conv(pconv(@basics.body(pat)))
    }
  }

  pconv(pbod)
}

///|
/// `SYM_CONV`: `|- (l = r) = (r = l)`.
pub fn sym_conv(tm : Term) -> Thm raise {
  let result = try {
    let th1 = sym(@kernel.assume_rule(tm))
    let tm1 = @kernel.concl(th1)
    let th2 = sym(@kernel.assume_rule(tm1))
    @kernel.deduct_antisym_rule(th2, th1)
  } catch {
    Failure(_) => raise Failure("SYM_CONV")
    e => raise e
  }
  result
}

///|
/// `CONV_RULE`: apply a conversion to the conclusion of a theorem.
pub fn conv_rule(conv : Conv, th : Thm) -> Thm raise {
  @kernel.eq_mp(conv(@kernel.concl(th)), th)
}

///|
/// `SUBS_CONV`: substitute using the equations `ths`.
pub fn subs_conv(ths : List[Thm]) -> Conv {
  tm => {
    let result = try {
      if ths.is_empty() {
        @kernel.refl(tm)
      } else {
        let lefts = @lib.map(th => lhand(@kernel.concl(th)), ths)
        let gvs = @lib.map(l => @basics.genvar(@kernel.type_of(l)), lefts)
        let pat = @basics.subst(@lib.zip(gvs, lefts), tm)
        let abs = @basics.list_mk_abs(gvs, pat)
        let th = @lib.rev_itlist(
          (y, x) => {
            conv_rule(
              thenc(rand_conv(beta_conv), land_conv(beta_conv)),
              @kernel.mk_comb_rule(x, y),
            )
          },
          ths,
          @kernel.refl(abs),
        )
        if @kernel.rand(@kernel.concl(th)) == tm {
          @kernel.refl(tm)
        } else {
          th
        }
      }
    } catch {
      Failure(_) => raise Failure("SUBS_CONV")
      e => raise e
    }
    result
  }
}

///|
/// `BETA_RULE`
pub fn beta_rule(th : Thm) -> Thm raise {
  conv_rule(redepth_conv(beta_conv), th)
}

///|
/// `GSYM`: reverse the (top-level) equations in a theorem.
pub fn gsym(th : Thm) -> Thm raise {
  conv_rule(once_depth_conv(sym_conv), th)
}

///|
/// `SUBS`
pub fn subs(ths : List[Thm], th : Thm) -> Thm raise {
  conv_rule(subs_conv(ths), th)
}

///|
/// A closure stored in a net: OCaml's `compare` raises on closures unless
/// they are physically equal.
priv struct CachedConv {
  f : Conv
}

///|
impl @nets.NetCompare for CachedConv with fn net_compare(self, other) {
  if physical_equal(self.f, other.f) {
    Some(0)
  } else {
    None
  }
}

///|
/// `CACHE_CONV`: remember the results of a conversion (modulo alpha).
pub fn cache_conv(conv : Conv) -> Conv {
  let net : Ref[@nets.Net[CachedConv]] = Ref::{ val: @nets.empty_net(), }
  let alpha_hack = (th : Thm) => {
    let tm1 = lhand(@kernel.concl(th))
    let f : Conv = tm => {
      if tm1 == tm {
        th
      } else {
        @kernel.trans(alpha_rule(tm, tm1), th)
      }
    }
    f
  }
  tm => {
    let cached = Some(
      @lib.tryfind((c : CachedConv) => (c.f)(tm), @nets.lookup(tm, net.val)),
    ) catch {
      Failure(_) => None
      e => raise e
    }
    match cached {
      Some(th) => th
      None => {
        let th = conv(tm)
        net.val = @nets.enter(
          @list.List([]),
          tm,
          { f: alpha_hack(th), },
          net.val,
        )
        th
      }
    }
  }
}

///|
/// `PRINT_TERM_CONV`: print the term and return `|- t = t`.
pub fn print_term_conv(t : Term) -> Thm raise {
  @printer.pp_print_qterm(@pp.std_formatter, t)
  // `Format.printf "%a\n"` prints the newline as literal text.
  @pp.std_formatter.print_string("\n")
  all_conv(t)
}
