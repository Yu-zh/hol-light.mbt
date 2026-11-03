// ===========================================================================
// Basic rewriting and simplification tools (port of simp.ml).
//
// Rules, tactics and conversions built from a theorem list are staged as
// upstream: `rewrite_rule(thl)` builds the net once and returns the rule.
// ===========================================================================

///|
using @kernel {type Term, type Thm}

///|
using @list {type List}

///|
using @lib {type Cell}

///|
using @equal {type Conv}

///|
using @nets {type Net}

///|
using @tactics {type Tactic}

///|
fn q(s : String) -> Term raise {
  @parser.parse_term(s)
}

///|
fn[T] fail_() -> T raise {
  raise Failure("")
}

///|
/// A conversion (or any function on terms, upstream's `'a` in
/// `(int * 'a) net`) with a priority, as stored in rewrite nets: 1 for
/// rewrites, 2 for conversions, 3 for conditional rewrites, 4 for
/// congruences.
pub struct GconvOf[C] {
  priority : Int32
  conv : C
}

///|
/// The usual case: a conversion.
pub type Gconv = GconvOf[Conv]

///|
/// OCaml's `compare` on `int * conv`: the priorities first, then the
/// closures, which only compare (as equal) when physically equal.
pub impl[C] @nets.NetCompare for GconvOf[C] with fn net_compare(self, other) {
  let c = self.priority.compare(other.priority)
  if c != 0 {
    Some(c)
  } else if physical_equal(self.conv, other.conv) {
    Some(0)
  } else {
    None
  }
}

///|
pub extend GconvOf with @nets.NetCompare::{net_compare}

///|
/// `REWR_CONV th`: rewrite with the equation `th`.
pub fn rewr_conv(th : Thm) -> Conv raise {
  @drule.part_match(@equal.lhs, th)
}

///|
/// `IMP_REWR_CONV th`: rewrite with the conditional equation `th`.
pub fn imp_rewr_conv(th : Thm) -> Conv raise {
  @drule.part_match(t => @equal.lhs(@basics.dest_imp(t).1), th)
}

///|
/// `ORDERED_REWR_CONV ord th`
pub fn ordered_rewr_conv(
  ord : (Term, Term) -> Bool raise,
  th : Thm,
) -> Conv raise {
  let basic_conv = rewr_conv(th)
  tm => {
    let thm = basic_conv(tm)
    let (l, r) = @kernel.dest_eq(@kernel.concl(thm))
    if ord(l, r) {
      thm
    } else {
      raise Failure("ORDERED_REWR_CONV: wrong orientation")
    }
  }
}

///|
/// `ORDERED_IMP_REWR_CONV ord th`
pub fn ordered_imp_rewr_conv(
  ord : (Term, Term) -> Bool raise,
  th : Thm,
) -> Conv raise {
  let basic_conv = imp_rewr_conv(th)
  tm => {
    let thm = basic_conv(tm)
    let (l, r) = @kernel.dest_eq(@kernel.rand(@kernel.concl(thm)))
    if ord(l, r) {
      thm
    } else {
      raise Failure("ORDERED_IMP_REWR_CONV: wrong orientation")
    }
  }
}

///|
let term_order_top : Cell[Term] = Cell::new("term_order")

///|
fn lexify(ord : (Term, Term) -> Bool, l1 : List[Term], l2 : List[Term]) -> Bool {
  match (l1, l2) {
    (Empty, _) => false
    (_, Empty) => true
    (More(h1, tail=t1), More(h2, tail=t2)) =>
      ord(h1, h2) || (h1 == h2 && lexify(ord, t1, t2))
  }
}

///|
fn dyn_order(top : Term, tm1 : Term, tm2 : Term) -> Bool {
  let (f1, args1) = @basics.strip_comb(tm1)
  let (f2, args2) = @basics.strip_comb(tm2)
  if f1 == f2 {
    lexify((a, b) => dyn_order(f1, a, b), args1, args2)
  } else if f2 == top {
    false
  } else if f1 == top {
    true
  } else {
    @lib.compare(f1, f2) > 0
  }
}

///|
/// `term_order`: the ordering used for permutative rewrites.
pub fn term_order(tm1 : Term, tm2 : Term) -> Bool {
  dyn_order(term_order_top.get(), tm1, tm2)
}

///|
fn[T] match_failure() -> T raise {
  raise @lib.MatchFailure("simp.ml")
}

///|
/// `net_of_thm rep th net`: add the rewrite `th` to `net`; with `rep`,
/// looping rewrites become `|- l <=> T` and permutative ones are ordered.
pub fn net_of_thm(rep : Bool, th : Thm, net : Net[Gconv]) -> Net[Gconv] raise {
  let tm = @kernel.concl(th)
  let lconsts = @kernel.freesl(@kernel.hyp(th))
  let matchable = (a : Term, b : Term) => {
    @lib.can(x => @drule.term_match(lconsts, a, x), b)
  }
  // The `ETA_AX` special case: `(\x. v x) = v`.
  match tm {
    Comb(Comb(Const("=", _), Abs(x, Comb(Var(_) as v, x1)) as l), v1) if x1 == x &&
      v1 == v &&
      !(x == v) => {
      let conv : Conv = tm => {
        match tm {
          Abs(y, Comb(t, y1)) if y == y1 && !@basics.free_in(y, t) =>
            @drule.instantiate_rule(@drule.term_match(@list.List([]), v, t), th)
          _ => raise Failure("REWR_CONV (ETA_AX special case)")
        }
      }
      return @nets.enter(lconsts, l, { priority: 1, conv, }, net)
    }
    _ => ()
  }
  match tm {
    Comb(Comb(Const("=", _), l), r) =>
      if rep && @basics.free_in(l, r) {
        let th1 = @bool.eqt_intro(th)
        @nets.enter(lconsts, l, { priority: 1, conv: rewr_conv(th1), }, net)
      } else if rep && matchable(l, r) && matchable(r, l) {
        let conv = ordered_rewr_conv((a, b) => term_order(a, b), th)
        @nets.enter(lconsts, l, { priority: 1, conv, }, net)
      } else {
        @nets.enter(lconsts, l, { priority: 1, conv: rewr_conv(th), }, net)
      }
    Comb(Comb(_, t), Comb(Comb(Const("=", _), l), r)) =>
      if rep && @basics.free_in(l, r) {
        let th1 = @bool.disch(t, @bool.eqt_intro(@bool.undisch(th)))
        @nets.enter(lconsts, l, { priority: 3, conv: imp_rewr_conv(th1), }, net)
      } else if rep && matchable(l, r) && matchable(r, l) {
        let conv = ordered_imp_rewr_conv((a, b) => term_order(a, b), th)
        @nets.enter(lconsts, l, { priority: 3, conv, }, net)
      } else {
        @nets.enter(lconsts, l, { priority: 3, conv: imp_rewr_conv(th), }, net)
      }
    _ => match_failure()
  }
}

///|
/// `net_of_conv tm conv net`
pub fn[C] net_of_conv(
  tm : Term,
  conv : C,
  sofar : Net[GconvOf[C]],
) -> Net[GconvOf[C]] {
  @nets.enter(@list.List([]), tm, { priority: 2, conv, }, sofar)
}

///|
/// The elements of a rewrite net as OCaml's `(priority, conv)` pairs, for
/// translated code that takes them apart (`snd(hd(lookup tm net))` in
/// Complex/quelim.ml): the nets hold `GconvOf` structs.
pub fn[C] gconv_pairs(l : @list.List[GconvOf[C]]) -> @list.List[(Int64, C)] {
  l.map(g => (g.priority.to_int64(), g.conv))
}

///|
/// `enter lconsts (tm, (priority, conv)) net` on a rewrite net, for
/// translated code that enters the pair itself (Jordan/tactics_ext2.ml):
/// the nets hold `GconvOf` structs.
pub fn[C] enter_gconv(
  lconsts : @list.List[Term],
  tm : Term,
  elem : (Int64, C),
  net : Net[GconvOf[C]],
) -> Net[GconvOf[C]] {
  @nets.enter(lconsts, tm, { priority: elem.0.to_int(), conv: elem.1, }, net)
}

///|
/// `net_of_cong th net`: add the congruence rule `th`.
pub fn net_of_cong(th : Thm, sofar : Net[Gconv]) -> Net[Gconv] raise {
  let (conc, n) = @lib.repeat(
    (p : (Term, Int32)) => {
      // The tuple is evaluated right to left.
      let m1 = p.1 + 1
      (@basics.dest_imp(p.0).1, m1)
    },
    (@kernel.concl(th), 0),
  )
  if n == 0 {
    raise Failure("net_of_cong: Non-implicational congruence")
  }
  let pat = @equal.lhs(conc)
  let conv = @drule.gen_part_match(
    t => @equal.lhand(@lib.funpow(n, @kernel.rand, t)),
    th,
  )
  @nets.enter(@list.List([]), pat, { priority: 4, conv, }, sofar)
}

// ---------------------------------------------------------------------------
// Making rewrite rules from theorems.
// ---------------------------------------------------------------------------

///|
let imp_conj_conv_c : Cell[Conv] = Cell::new("mk_rewrites")

///|
let imp_exists_cnv_c : Cell[Conv] = Cell::new("mk_rewrites")

///|
fn imp_exists_rule(v : Term, th : Thm) -> Thm raise {
  @equal.conv_rule(imp_exists_cnv_c.get(), @bool.gen(v, th))
}

///|
fn collect_condition(oldhyps : List[Term], th : Thm) -> Thm raise {
  let conds = @lib.subtract(@kernel.hyp(th), oldhyps)
  if conds.is_empty() {
    return th
  }
  let jth = @lib.itlist(@bool.disch, conds, th)
  let kth = @equal.conv_rule(@equal.repeatc(imp_conj_conv_c.get()), jth)
  let (cond, eqn) = @basics.dest_imp(@kernel.concl(kth))
  let fvs = @lib.subtract(
    @lib.subtract(@kernel.frees(cond), @kernel.frees(eqn)),
    @kernel.freesl(oldhyps),
  )
  @lib.itlist(imp_exists_rule, fvs, kth)
}

///|
fn split_rewrites(
  oldhyps : List[Term],
  cf : Bool,
  th : Thm,
  sofar : List[Thm],
) -> List[Thm] raise {
  let tm = @kernel.concl(th)
  if @basics.is_forall(tm) {
    split_rewrites(oldhyps, cf, @bool.spec_all(th), sofar)
  } else if @basics.is_conj(tm) {
    // The arguments are evaluated right to left: the second conjunct is
    // split first.
    let rest = split_rewrites(oldhyps, cf, @bool.conjunct2(th), sofar)
    split_rewrites(oldhyps, cf, @bool.conjunct1(th), rest)
  } else if @basics.is_imp(tm) && cf {
    split_rewrites(oldhyps, cf, @bool.undisch(th), sofar)
  } else if @basics.is_eq(tm) {
    sofar.prepend(if cf { collect_condition(oldhyps, th) } else { th })
  } else if @basics.is_neg(tm) {
    let ths = split_rewrites(oldhyps, cf, @bool.eqf_intro(th), sofar)
    if @basics.is_eq(@kernel.rand(tm)) {
      split_rewrites(oldhyps, cf, @bool.eqf_intro(@equal.gsym(th)), ths)
    } else {
      ths
    }
  } else {
    split_rewrites(oldhyps, cf, @bool.eqt_intro(th), sofar)
  }
}

///|
/// `mk_rewrites cf th sofar`: split `th` into rewrite rules (with `cf`,
/// conditional ones too) and add them to `sofar`.
pub fn mk_rewrites(cf : Bool, th : Thm, sofar : List[Thm]) -> List[Thm] raise {
  split_rewrites(@kernel.hyp(th), cf, th, sofar)
}

///|
/// `REWRITES_CONV net`: apply the first rewrite in `net` that works.
pub fn[B] rewrites_conv(
  net : Net[GconvOf[(Term) -> B raise]],
) -> (Term) -> B raise {
  tm => {
    let pconvs = @nets.lookup(tm, net)
    @lib.tryfind((g : GconvOf[(Term) -> B raise]) => (g.conv)(tm), pconvs) catch {
      Failure(_) => raise Failure("REWRITES_CONV")
      e => raise e
    }
  }
}

// ---------------------------------------------------------------------------
// Provers and simpsets.
// ---------------------------------------------------------------------------

///|
/// A prover: a conversion and a way to augment it with theorems.
pub struct Prover {
  apply : Conv
  aug : (List[Thm]) -> Prover raise
}

///|
/// `mk_prover applicator augmentor state`
pub fn[S] mk_prover(
  applicator : (S) -> Conv raise,
  augmentor : (S, List[Thm]) -> S raise,
) -> (S) -> Prover raise {
  fn go(state : S) -> Prover raise {
    let apply = applicator(state)
    { apply, aug: thms => go(augmentor(state, thms)), }
  }

  go
}

///|
/// `augment pr thms`
pub fn augment(pr : Prover, thms : List[Thm]) -> Prover raise {
  (pr.aug)(thms)
}

///|
/// `apply_prover pr tm`
pub fn apply_prover(pr : Prover, tm : Term) -> Thm raise {
  (pr.apply)(tm)
}

///|
/// A simpset: rewrites and congruences, a prover for conditions,
/// subprovers for it, and the rewrite maker.
pub struct Simpset {
  net : Net[Gconv]
  prover : (Strategy) -> Strategy raise
  provers : List[Prover]
  rewmaker : (Thm, List[Thm]) -> List[Thm] raise
}

///|
pub type Strategy = (Simpset, Int32, Term) -> Thm raise

///|
/// OCaml's constructor `Simpset(net, prover, provers, rewmaker)`.
pub fn simpset(
  net : Net[Gconv],
  prover : (Strategy) -> Strategy raise,
  provers : List[Prover],
  rewmaker : (Thm, List[Thm]) -> List[Thm] raise,
) -> Simpset {
  { net, prover, provers, rewmaker, }
}

///|
/// `basic_prover strat ss lev tm`
pub fn basic_prover(strat : Strategy) -> Strategy {
  (ss, lev, tm) => {
    let sth = strat(ss, lev, tm) catch {
      Failure(_) => @kernel.refl(tm)
      e => raise e
    }
    @bool.eqt_elim(sth) catch {
      Failure(_) => {
        let tth = @lib.tryfind(
          (pr : Prover) => apply_prover(pr, @kernel.rand(@kernel.concl(sth))),
          ss.provers,
        )
        @kernel.eq_mp(@equal.sym(sth), tth)
      }
      e => raise e
    }
  }
}

///|
pub fn ss_of_thms(thms : List[Thm], ss : Simpset) -> Simpset raise {
  let cthms = @lib.itlist(ss.rewmaker, thms, @list.List([]))
  let net1 = @lib.itlist((th, n) => net_of_thm(true, th, n), cthms, ss.net)
  { ..ss, net: net1, }
}

///|
pub fn ss_of_conv(keytm : Term, conv : Conv, ss : Simpset) -> Simpset {
  { ..ss, net: net_of_conv(keytm, conv, ss.net), }
}

///|
pub fn ss_of_congs(thms : List[Thm], ss : Simpset) -> Simpset raise {
  { ..ss, net: @lib.itlist(net_of_cong, thms, ss.net), }
}

///|
pub fn ss_of_prover(
  newprover : (Strategy) -> Strategy raise,
  ss : Simpset,
) -> Simpset {
  { ..ss, prover: newprover, }
}

///|
pub fn ss_of_provers(newprovers : List[Prover], ss : Simpset) -> Simpset {
  { ..ss, provers: newprovers.concat(ss.provers), }
}

///|
pub fn ss_of_maker(
  newmaker : (Thm, List[Thm]) -> List[Thm] raise,
  ss : Simpset,
) -> Simpset {
  { ..ss, rewmaker: newmaker, }
}

///|
/// `AUGMENT_SIMPSET cth ss`: add a contextual theorem.
pub fn augment_simpset(cth : Thm, ss : Simpset) -> Simpset raise {
  let provers1 = @lib.map(pr => augment(pr, @list.singleton(cth)), ss.provers)
  let cthms = (ss.rewmaker)(cth, @list.List([]))
  let net1 = @lib.itlist((th, n) => net_of_thm(true, th, n), cthms, ss.net)
  { net: net1, prover: ss.prover, provers: provers1, rewmaker: ss.rewmaker, }
}

// ---------------------------------------------------------------------------
// The simplification strategies.
// ---------------------------------------------------------------------------

///|
fn imp_rewrites_conv(
  strat : Strategy,
  ss : Simpset,
  lev : Int32,
  pconvs : List[Gconv],
  tm : Term,
) -> Thm raise {
  @lib.tryfind(
    (g : Gconv) => {
      if g.priority >= 4 {
        fail_()
      }
      let th = (g.conv)(tm)
      let etm = @kernel.concl(th)
      if @basics.is_eq(etm) {
        return th
      }
      if lev <= 0 {
        raise Failure("IMP_REWRITES_CONV: Too deep")
      }
      // `prover strat ss (lev-1) (lhand etm)`: the term argument first.
      let ant = @equal.lhand(etm)
      let cth = (ss.prover)(strat)(ss, lev - 1, ant)
      @bool.mp(th, cth)
    },
    pconvs,
  )
}

///|
fn run_sub_conv(
  strat : Strategy,
  ss : Simpset,
  lev : Int32,
  triv : Bool,
  th : Thm,
) -> Thm raise {
  let tm = @kernel.concl(th)
  if !@basics.is_imp(tm) {
    if triv {
      fail_()
    }
    return th
  }
  let subtm = @equal.lhand(tm)
  let (avs, bod) = @basics.strip_forall(subtm)
  let ((t, t1), ss1, mk_fun) : ((Term, Term), Simpset, (Thm) -> Thm raise) = try {
    let i : (Thm) -> Thm raise = th => th
    (@kernel.dest_eq(bod), ss, i)
  } catch {
    Failure(_) => {
      let (cxt, deq) = @basics.dest_imp(bod)
      // The tuple is evaluated right to left.
      let mk_fun : (Thm) -> Thm raise = th => @bool.disch(cxt, th)
      let ss1 = augment_simpset(@kernel.assume_rule(cxt), ss)
      (@kernel.dest_eq(deq), ss1, mk_fun)
    }
    e => raise e
  }
  let (eth, triv1) = (strat(ss1, lev, t), false) catch {
    Failure(_) => (@kernel.refl(t), triv)
    e => raise e
  }
  let eth1 = @bool.genl(avs, mk_fun(eth))
  let th1 = if @kernel.is_var(t1) {
    @kernel.inst_rule(
      @list.singleton((@kernel.rand(@kernel.concl(eth)), t1)),
      th,
    )
  } else {
    let c = @kernel.concl(eth1)
    @drule.gen_part_match(@equal.lhand, th)(c)
  }
  let th2 = @bool.mp(th1, eth1)
  run_sub_conv(strat, ss, lev, triv1, th2)
}

///|
fn gen_sub_conv(
  strat : Strategy,
  ss : Simpset,
  lev : Int32,
  pconvs : List[Gconv],
  tm : Term,
) -> Thm raise {
  @lib.tryfind(
    (g : Gconv) => {
      if g.priority < 4 {
        fail_()
      }
      let th = (g.conv)(tm)
      run_sub_conv(strat, ss, lev, true, th)
    },
    pconvs,
  ) catch {
    Failure(_) =>
      match tm {
        Comb(l, r) =>
          try {
            let th1 = strat(ss, lev, l)
            try {
              let th2 = strat(ss, lev, r)
              @kernel.mk_comb_rule(th1, th2)
            } catch {
              Failure(_) => @equal.ap_thm(th1, r)
              e => raise e
            }
          } catch {
            Failure(_) => @equal.ap_term(l, strat(ss, lev, r))
            e => raise e
          }
        Abs(v, bod) => {
          let th = strat(ss, lev, bod)
          @kernel.abs_rule(v, th) catch {
            Failure(_) => {
              let gv = @basics.genvar(@kernel.type_of(v))
              let gbod = @kernel.vsubst(@list.singleton((gv, v)), bod)
              let gth = @kernel.abs_rule(gv, strat(ss, lev, gbod))
              let gtm = @kernel.concl(gth)
              let (l, r) = @kernel.dest_eq(gtm)
              let v1 = @kernel.variant(@kernel.frees(gtm), v)
              let l1 = @basics.alpha(v1, l)
              let r1 = @basics.alpha(v1, r)
              @kernel.eq_mp(@equal.alpha_rule(gtm, @basics.mk_eq(l1, r1)), gth)
            }
            e => raise e
          }
        }
        _ => raise Failure("GEN_SUB_CONV")
      }
    e => raise e
  }
}

///|
/// `ONCE_DEPTH_SQCONV`
pub fn once_depth_sqconv(ss : Simpset, lev : Int32, tm : Term) -> Thm raise {
  let pconvs = @nets.lookup(tm, ss.net)
  imp_rewrites_conv(once_depth_sqconv, ss, lev, pconvs, tm) catch {
    Failure(_) => gen_sub_conv(once_depth_sqconv, ss, lev, pconvs, tm)
    e => raise e
  }
}

///|
/// `DEPTH_SQCONV`
pub fn depth_sqconv(ss : Simpset, lev : Int32, tm : Term) -> Thm raise {
  let pconvs = @nets.lookup(tm, ss.net)
  try {
    let th1 = gen_sub_conv(depth_sqconv, ss, lev, pconvs, tm)
    let tm1 = @kernel.rand(@kernel.concl(th1))
    let pconvs1 = @nets.lookup(tm1, ss.net)
    try {
      let th2 = imp_rewrites_conv(depth_sqconv, ss, lev, pconvs1, tm1)
      @kernel.trans(th1, th2)
    } catch {
      Failure(_) => th1
      e => raise e
    }
  } catch {
    Failure(_) => imp_rewrites_conv(depth_sqconv, ss, lev, pconvs, tm)
    e => raise e
  }
}

///|
/// `REDEPTH_SQCONV`
pub fn redepth_sqconv(ss : Simpset, lev : Int32, tm : Term) -> Thm raise {
  let pconvs = @nets.lookup(tm, ss.net)
  let th = try {
    let th1 = gen_sub_conv(redepth_sqconv, ss, lev, pconvs, tm)
    let tm1 = @kernel.rand(@kernel.concl(th1))
    let pconvs1 = @nets.lookup(tm1, ss.net)
    try {
      let th2 = imp_rewrites_conv(redepth_sqconv, ss, lev, pconvs1, tm1)
      @kernel.trans(th1, th2)
    } catch {
      Failure(_) => th1
      e => raise e
    }
  } catch {
    Failure(_) => imp_rewrites_conv(redepth_sqconv, ss, lev, pconvs, tm)
    e => raise e
  }
  try {
    let th1 = redepth_sqconv(ss, lev, @kernel.rand(@kernel.concl(th)))
    @kernel.trans(th, th1)
  } catch {
    Failure(_) => th
    e => raise e
  }
}

///|
/// `TOP_DEPTH_SQCONV`
pub fn top_depth_sqconv(ss : Simpset, lev : Int32, tm : Term) -> Thm raise {
  let pconvs = @nets.lookup(tm, ss.net)
  let th1 = imp_rewrites_conv(top_depth_sqconv, ss, lev, pconvs, tm) catch {
    Failure(_) => gen_sub_conv(top_depth_sqconv, ss, lev, pconvs, tm)
    e => raise e
  }
  try {
    let th2 = top_depth_sqconv(ss, lev, @kernel.rand(@kernel.concl(th1)))
    @kernel.trans(th1, th2)
  } catch {
    Failure(_) => th1
    e => raise e
  }
}

///|
/// `TOP_SWEEP_SQCONV`
pub fn top_sweep_sqconv(ss : Simpset, lev : Int32, tm : Term) -> Thm raise {
  let pconvs = @nets.lookup(tm, ss.net)
  try {
    let th1 = imp_rewrites_conv(top_sweep_sqconv, ss, lev, pconvs, tm)
    try {
      let th2 = top_sweep_sqconv(ss, lev, @kernel.rand(@kernel.concl(th1)))
      @kernel.trans(th1, th2)
    } catch {
      Failure(_) => th1
      e => raise e
    }
  } catch {
    Failure(_) => gen_sub_conv(top_sweep_sqconv, ss, lev, pconvs, tm)
    e => raise e
  }
}

// ---------------------------------------------------------------------------
// The basic rewrites, conversions and congruences.
// ---------------------------------------------------------------------------

///|
let basic_rewrites_r : Ref[List[Thm]] = Ref::{ val: @list.List([]), }

///|
let basic_conversions_r : Ref[List[(String, (Term, Conv))]] = Ref::{
  val: @list.List([]),
}

///|
let conv_net_r : Ref[Net[Gconv]] = Ref::{ val: @nets.empty_net(), }

///|
fn rehash_convnet() -> Unit raise {
  let cnet = @lib.itlist(
    (p : (String, (Term, Conv)), n) => net_of_conv(p.1.0, p.1.1, n),
    basic_conversions_r.val,
    @nets.empty_net(),
  )
  conv_net_r.val = @lib.itlist(
    (th, n) => net_of_thm(true, th, n),
    basic_rewrites_r.val,
    cnet,
  )
}

///|
pub fn set_basic_rewrites(thl : List[Thm]) -> Unit raise {
  let canon_thl = @lib.itlist(
    (th, acc) => mk_rewrites(false, th, acc),
    thl,
    @list.List([]),
  )
  basic_rewrites_r.val = canon_thl
  rehash_convnet()
}

///|
pub fn extend_basic_rewrites(thl : List[Thm]) -> Unit raise {
  let canon_thl = @lib.itlist(
    (th, acc) => mk_rewrites(false, th, acc),
    thl,
    @list.List([]),
  )
  basic_rewrites_r.val = canon_thl.concat(basic_rewrites_r.val)
  rehash_convnet()
}

///|
pub fn basic_rewrites() -> List[Thm] {
  basic_rewrites_r.val
}

///|
pub fn set_basic_convs(cnvs : List[(String, (Term, Conv))]) -> Unit raise {
  basic_conversions_r.val = cnvs
  rehash_convnet()
}

///|
pub fn extend_basic_convs(name : String, patcong : (Term, Conv)) -> Unit raise {
  let rest = basic_conversions_r.val.filter(p => name != p.0)
  basic_conversions_r.val = rest.prepend((name, patcong))
  rehash_convnet()
}

///|
pub fn basic_convs() -> List[(String, (Term, Conv))] {
  basic_conversions_r.val
}

///|
pub fn basic_net() -> Net[Gconv] {
  conv_net_r.val
}

///|
let basic_congs_r : Ref[List[Thm]] = Ref::{ val: @list.List([]), }

///|
pub fn set_basic_congs(thl : List[Thm]) -> Unit {
  basic_congs_r.val = thl
}

///|
pub fn extend_basic_congs(thl : List[Thm]) -> Unit {
  basic_congs_r.val = @lib.union_eq(@basics.equals_thm, thl, basic_congs_r.val)
}

///|
pub fn basic_congs() -> List[Thm] {
  basic_congs_r.val
}

// ---------------------------------------------------------------------------
// Rewriting conversions, rules and tactics.
// ---------------------------------------------------------------------------

///|
/// `GENERAL_REWRITE_CONV rep cnvl builtin_net thl`
pub fn general_rewrite_conv(
  rep : Bool,
  cnvl : (Conv) -> Conv raise?,
  builtin_net : Net[Gconv],
  thl : List[Thm],
) -> Conv raise {
  let thl_canon = @lib.itlist(
    (th, acc) => mk_rewrites(false, th, acc),
    thl,
    @list.List([]),
  )
  let final_net = @lib.itlist(
    (th, n) => net_of_thm(rep, th, n),
    thl_canon,
    builtin_net,
  )
  cnvl(rewrites_conv(final_net))
}

///|
/// `GEN_REWRITE_CONV cnvl thl`
pub fn gen_rewrite_conv(
  cnvl : (Conv) -> Conv raise?,
  thl : List[Thm],
) -> Conv raise {
  general_rewrite_conv(false, cnvl, @nets.empty_net(), thl)
}

///|
/// `PURE_REWRITE_CONV thl`
pub fn pure_rewrite_conv(thl : List[Thm]) -> Conv raise {
  general_rewrite_conv(true, @equal.top_depth_conv, @nets.empty_net(), thl)
}

///|
/// `REWRITE_CONV thl`
pub fn rewrite_conv(thl : List[Thm]) -> Conv raise {
  general_rewrite_conv(true, @equal.top_depth_conv, basic_net(), thl)
}

///|
/// `PURE_ONCE_REWRITE_CONV thl`
pub fn pure_once_rewrite_conv(thl : List[Thm]) -> Conv raise {
  general_rewrite_conv(false, @equal.once_depth_conv, @nets.empty_net(), thl)
}

///|
/// `ONCE_REWRITE_CONV thl`
pub fn once_rewrite_conv(thl : List[Thm]) -> Conv raise {
  general_rewrite_conv(false, @equal.once_depth_conv, basic_net(), thl)
}

///|
fn rule_of(conv : Conv) -> (Thm) -> Thm raise {
  th => @equal.conv_rule(conv, th)
}

///|
/// `GEN_REWRITE_RULE cnvl thl`
pub fn gen_rewrite_rule(
  cnvl : (Conv) -> Conv raise?,
  thl : List[Thm],
) -> ((Thm) -> Thm raise) raise {
  rule_of(gen_rewrite_conv(cnvl, thl))
}

///|
/// `PURE_REWRITE_RULE thl`
pub fn pure_rewrite_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(pure_rewrite_conv(thl))
}

///|
/// `REWRITE_RULE thl`
pub fn rewrite_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(rewrite_conv(thl))
}

///|
/// `PURE_ONCE_REWRITE_RULE thl`
pub fn pure_once_rewrite_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(pure_once_rewrite_conv(thl))
}

///|
/// `ONCE_REWRITE_RULE thl`
pub fn once_rewrite_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(once_rewrite_conv(thl))
}

///|
fn assumed_hyps(thl : List[Thm], th : Thm) -> List[Thm] raise {
  // `(map ASSUME (hyp th)) @ thl`
  @lib.map(@kernel.assume_rule, @kernel.hyp(th)).concat(thl)
}

///|
/// `PURE_ASM_REWRITE_RULE thl th`
pub fn pure_asm_rewrite_rule(thl : List[Thm], th : Thm) -> Thm raise {
  pure_rewrite_rule(assumed_hyps(thl, th))(th)
}

///|
/// `ASM_REWRITE_RULE thl th`
pub fn asm_rewrite_rule(thl : List[Thm], th : Thm) -> Thm raise {
  rewrite_rule(assumed_hyps(thl, th))(th)
}

///|
/// `PURE_ONCE_ASM_REWRITE_RULE thl th`
pub fn pure_once_asm_rewrite_rule(thl : List[Thm], th : Thm) -> Thm raise {
  pure_once_rewrite_rule(assumed_hyps(thl, th))(th)
}

///|
/// `ONCE_ASM_REWRITE_RULE thl th`
pub fn once_asm_rewrite_rule(thl : List[Thm], th : Thm) -> Thm raise {
  once_rewrite_rule(assumed_hyps(thl, th))(th)
}

///|
/// `GEN_REWRITE_TAC cnvl thl`
pub fn gen_rewrite_tac(
  cnvl : (Conv) -> Conv raise?,
  thl : List[Thm],
) -> Tactic raise {
  @tactics.conv_tac(gen_rewrite_conv(cnvl, thl))
}

///|
/// `PURE_REWRITE_TAC thl`
pub fn pure_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(pure_rewrite_conv(thl))
}

///|
/// `REWRITE_TAC thl`
pub fn rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(rewrite_conv(thl))
}

///|
/// `PURE_ONCE_REWRITE_TAC thl`
pub fn pure_once_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(pure_once_rewrite_conv(thl))
}

///|
/// `ONCE_REWRITE_TAC thl`
pub fn once_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(once_rewrite_conv(thl))
}

///|
/// `PURE_ASM_REWRITE_TAC thl`
pub fn pure_asm_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(pure_rewrite_tac)(thl)
}

///|
/// `ASM_REWRITE_TAC thl`
pub fn asm_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(rewrite_tac)(thl)
}

///|
/// `PURE_ONCE_ASM_REWRITE_TAC thl`
pub fn pure_once_asm_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(pure_once_rewrite_tac)(thl)
}

///|
/// `ONCE_ASM_REWRITE_TAC thl`
pub fn once_asm_rewrite_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(once_rewrite_tac)(thl)
}

// ---------------------------------------------------------------------------
// Simplification.
// ---------------------------------------------------------------------------

///|
/// `GEN_SIMPLIFY_CONV strat ss lev thl`
pub fn gen_simplify_conv(
  strat : Strategy,
  ss : Simpset,
  lev : Int32,
  thl : List[Thm],
) -> Conv raise {
  let ss1 = @lib.itlist(augment_simpset, thl, ss)
  @equal.try_conv(tm => strat(ss1, lev, tm))
}

///|
/// `ONCE_SIMPLIFY_CONV ss thl`
pub fn once_simplify_conv(ss : Simpset, thl : List[Thm]) -> Conv raise {
  gen_simplify_conv(once_depth_sqconv, ss, 1, thl)
}

///|
/// `SIMPLIFY_CONV ss thl`
pub fn simplify_conv(ss : Simpset, thl : List[Thm]) -> Conv raise {
  gen_simplify_conv(top_depth_sqconv, ss, 3, thl)
}

///|
/// `empty_ss`
pub let empty_ss : Simpset = {
  net: @nets.empty_net(),
  prover: strat => basic_prover(strat),
  provers: @list.List([]),
  rewmaker: (th, sofar) => mk_rewrites(true, th, sofar),
}

///|
/// `basic_ss thl`: the basic rewrites and congruences, plus `thl`.
pub fn basic_ss(thl : List[Thm]) -> Simpset raise {
  let rewmaker : (Thm, List[Thm]) -> List[Thm] raise = (th, sofar) => {
    mk_rewrites(true, th, sofar)
  }
  let cthms = @lib.itlist(rewmaker, thl, @list.List([]))
  let net1 = @lib.itlist((th, n) => net_of_thm(true, th, n), cthms, basic_net())
  let net2 = @lib.itlist(net_of_cong, basic_congs(), net1)
  {
    net: net2,
    prover: strat => basic_prover(strat),
    provers: @list.List([]),
    rewmaker,
  }
}

///|
/// `SIMP_CONV thl`
pub fn simp_conv(thl : List[Thm]) -> Conv raise {
  simplify_conv(basic_ss(@list.List([])), thl)
}

///|
/// `PURE_SIMP_CONV thl`
pub fn pure_simp_conv(thl : List[Thm]) -> Conv raise {
  simplify_conv(empty_ss, thl)
}

///|
/// `ONCE_SIMP_CONV thl`
pub fn once_simp_conv(thl : List[Thm]) -> Conv raise {
  once_simplify_conv(basic_ss(@list.List([])), thl)
}

///|
/// `SIMP_RULE thl`
pub fn simp_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(simp_conv(thl))
}

///|
/// `PURE_SIMP_RULE thl`
pub fn pure_simp_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(pure_simp_conv(thl))
}

///|
/// `ONCE_SIMP_RULE thl`
pub fn once_simp_rule(thl : List[Thm]) -> ((Thm) -> Thm raise) raise {
  rule_of(once_simp_conv(thl))
}

///|
/// `SIMP_TAC thl`
pub fn simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(simp_conv(thl))
}

///|
/// `PURE_SIMP_TAC thl`
pub fn pure_simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(pure_simp_conv(thl))
}

///|
/// `ONCE_SIMP_TAC thl`
pub fn once_simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.conv_tac(once_simp_conv(thl))
}

///|
/// `ASM_SIMP_TAC thl`
pub fn asm_simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(simp_tac)(thl)
}

///|
/// `PURE_ASM_SIMP_TAC thl`
pub fn pure_asm_simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(pure_simp_tac)(thl)
}

///|
/// `ONCE_ASM_SIMP_TAC thl`
pub fn once_asm_simp_tac(thl : List[Thm]) -> Tactic raise {
  @tactics.asm_tac(once_simp_tac)(thl)
}

// ---------------------------------------------------------------------------
// Abbreviation tactics.
// ---------------------------------------------------------------------------

///|
/// `ABBREV_TAC tm`: introduce `v = t` (or `f x1 ... xn = t`) as an
/// abbreviation and rewrite with it.
pub fn abbrev_tac(tm : Term) -> Tactic raise {
  let (cvs, t) = @kernel.dest_eq(tm)
  let (v, vs) = @basics.strip_comb(cvs)
  let rs = @basics.list_mk_abs(vs, t)
  let eq = @basics.mk_eq(rs, v)
  let th1 = @lib.itlist(
    (v, th) => {
      @equal.conv_rule(@equal.land_conv(@equal.beta_conv), @equal.ap_thm(th, v))
    },
    vs.rev(),
    @kernel.assume_rule(eq),
  )
  let th2 = @bool.simple_choose(v, @bool.simple_exists(v, @bool.genl(vs, th1)))
  // `PROVE_HYP (EXISTS(mk_exists(v,eq),rs) (REFL rs)) th2`: right to left.
  let rth = @kernel.refl(rs)
  let ex = @bool.exists_rule(@bool.mk_exists(v, eq), rs, rth)
  let th3 = @bool.prove_hyp(ex, th2)
  gl => {
    let (asl, w) = gl
    let avoids = @lib.itlist(
      (p : (String, Thm), acc) => {
        @lib.union(@kernel.frees(@kernel.concl(p.1)), acc)
      },
      asl,
      @kernel.frees(w),
    )
    if @lib.mem(v, avoids) {
      raise Failure("ABBREV_TAC: variable already used")
    }
    @tactics.choose_then(th => {
      // `A THEN B THEN C` groups to the left; the operands are evaluated
      // right to left.
      let c = @tactics.assume_tac(th)
      let b = pure_once_rewrite_tac(@list.singleton(th))
      let a = @tactics.rule_assum_tac(
        pure_once_rewrite_rule(@list.singleton(th)),
      )
      @tactics.then_tac(@tactics.then_tac(a, b), c)
    })(th3)(gl)
  }
}

///|
/// `EXPAND_TAC s`: expand the abbreviation of `s`.
pub fn expand_tac(s : String) -> Tactic {
  @tactics.then_tac(
    @tactics.first_assum(th => {
      let th1 = @lib.check(
        (th : Thm) => @kernel.dest_var(@equal.rhs(@kernel.concl(th))).0 == s,
        th,
      )
      @tactics.subst1_tac(@equal.sym(th1))
    }),
    @tactics.beta_tac,
  )
}

// ---------------------------------------------------------------------------
// Load-time steps, in upstream order.
// ---------------------------------------------------------------------------

///|
fn init {
  @parser.begin_theory("simp")
  load_steps() catch {
    e => abort("HOL Light: loading simp.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
fn load_steps() -> Unit raise {
  term_order_top.set(q("T"))
  // `let IMP_CONJ_CONV = ... and IMP_EXISTS_RULE = ...`: left to right.
  let t1 = q("p ==> q ==> r <=> p /\\ q ==> r")
  imp_conj_conv_c.set(rewr_conv(@itab.itaut(t1)))
  let t2 = q("(forall x. P x ==> Q) <=> (?x. P x) ==> Q")
  imp_exists_cnv_c.set(rewr_conv(@itab.itaut(t2)))
}
