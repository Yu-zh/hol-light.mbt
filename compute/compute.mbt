// Translated from upstream compute.ml; edit this file directly.

///|
/// `with_flag`
pub fn[TA, TB, TC] with_flag(
  x1 : (Ref[TB], TB),
  x2 : (TC) -> TA raise,
  x3 : TC,
) -> TA raise {
  let (flag, b) = x1
  let f = x2
  let x = x3
  let fval = flag.val
  match
    ({
      flag.val = b
      ()
    }) {
    _ => {
      let res = f(x) catch {
        e => {
          {
            flag.val = fval
            ()
          }
          raise e
        }
      }
      {
        flag.val = fval
        ()
      }
      res
    }
  }
}

///|
/// `RIGHT_BETA`
pub fn right_beta(x4 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x4
  @kernel.trans(th, @equal.beta_conv(@equal.rhs(@kernel.concl(th)))) catch {
    _ => raise Failure("RIGHT_BETA")
  }
}

///|
/// `RIGHT_ETA`
pub fn right_eta(x5 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x5
  @kernel.trans(thm, @class.eta_conv(@equal.rhs(@kernel.concl(thm)))) catch {
    _ => raise Failure("RIGHT_ETA")
  }
}

///|
/// `MK_comb`
pub fn mk_comb(
  x6 : @kernel.Thm,
) -> (
  @kernel.Thm,
  @kernel.Thm,
  (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
) raise {
  let th = x6
  let (rator, rand) = @kernel.dest_comb(@equal.rhs(@kernel.concl(th)))
  let mka : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x7 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1 = x7
    fn(x8 : @kernel.Thm) -> @kernel.Thm raise {
      let th2 = x8
      @kernel.trans(th, @kernel.mk_comb_rule(th1, th2))
    }
  }
  let t9 = @kernel.refl(rand)
  (@kernel.refl(rator), t9, mka)
}

///|
/// `MK_abs`
pub fn mk_abs(
  x10 : @kernel.Thm,
) -> (@kernel.Term, @kernel.Thm, (@kernel.Thm) -> @kernel.Thm raise) raise {
  let th = x10
  let (bvar, body) = @kernel.dest_abs(@equal.rhs(@kernel.concl(th)))
  (
    bvar,
    @kernel.refl(body),
    fn(x11 : @kernel.Thm) -> @kernel.Thm raise {
      let th1 = x11
      @kernel.trans(th, @kernel.abs_rule(bvar, th1))
    },
  )
}

///|
/// `BODY_CONJUNCTS`
pub fn body_conjuncts(x12 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x12
  if @basics.is_forall(@kernel.concl(th)) {
    body_conjuncts(@bool.spec_all(th))
  } else if @basics.is_conj(@kernel.concl(th)) {
    let t13 = body_conjuncts(@bool.conjunct2(th))
    body_conjuncts(@bool.conjunct1(th)).concat(t13)
  } else {
    @list.List([th])
  }
}

///|
/// `stack`
#derive(Eq, Debug)
pub(all) enum Stack[TA, TB, TC] {
  Ztop
  Zrator(TA, Stack[TA, TB, TC])
  Zrand(TB, Stack[TA, TB, TC])
  Zabs(TC, Stack[TA, TB, TC])
}

///|
pub extend Stack with Eq::{not_equal, equal}

///|
pub extend Stack with Debug::{to_repr}

///|
pub extend Stack with @lib.OCompare::{ocompare}

///|
pub extend Stack with @lib.OHash::{ohash_visit}

///|
fn[TA, TB, TC] ocaml_rank_Stack(x : Stack[TA, TB, TC]) -> Int {
  match x {
    Ztop => 0
    Zrator(_, _) => 1000000
    Zrand(_, _) => 1000001
    Zabs(_, _) => 1000002
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare, TC : @lib.OCompare] @lib.OCompare for Stack[
  TA,
  TB,
  TC,
] with fn ocompare(self, other) {
  match (self, other) {
    (Zrator(a0, a1), Zrator(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Zrand(a0, a1), Zrand(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Zabs(a0, a1), Zabs(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Stack(self).compare(ocaml_rank_Stack(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash, TC : @lib.OHash] @lib.OHash for Stack[
  TA,
  TB,
  TC,
] with fn ohash_visit(self, h) {
  match self {
    Ztop => h.int(0L)
    Zrator(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Zrand(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    Zabs(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `exception Dead_code`
pub(all) suberror Dead_code {
  Dead_code(String)
}

///|
/// rhs_concl
fn step_1() -> Unit raise {
  rhs_concl_c.set(fn(x15 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand(
      (fn(x14 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x14) })(x15),
    )
  })
}

///|
let rhs_concl_c : @lib.Cell[(@kernel.Thm) -> @kernel.Term raise] = @lib.Cell::new(
  "rhs_concl",
)

///|
/// `rhs_concl`
pub fn rhs_concl(x : @kernel.Thm) -> @kernel.Term raise {
  rhs_concl_c.get()(x)
}

///|
/// refl_thm
fn step_2() -> Unit raise {
  refl_thm_c.set(fn(x16 : @kernel.Term) -> @kernel.Thm raise {
    @kernel.refl(x16)
  })
}

///|
let refl_thm_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "refl_thm",
)

///|
/// `refl_thm`
pub fn refl_thm(x : @kernel.Term) -> @kernel.Thm raise {
  refl_thm_c.get()(x)
}

///|
/// trans_thm
fn step_3() -> Unit raise {
  trans_thm_c.set(fn(
    x17 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x18 : @kernel.Thm) -> @kernel.Thm raise { @kernel.trans(x17, x18) }
  })
}

///|
let trans_thm_c : @lib.Cell[
  (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("trans_thm")

///|
/// `trans_thm`
pub fn trans_thm(x : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  trans_thm_c.get()(x)
}

///|
/// beta_thm
fn step_4() -> Unit raise {
  beta_thm_c.set(right_beta)
}

///|
let beta_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "beta_thm",
)

///|
/// `beta_thm`
pub fn beta_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  beta_thm_c.get()(x)
}

///|
/// `evaluate`
pub fn[TA] evaluate(x19 : TA) -> TA raise {
  let th = x19
  th
}

///|
/// `try_eta`
pub fn try_eta(x20 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x20
  right_eta(thm) catch {
    _ => thm
  }
}

///|
/// `push_in_stk`
pub fn[TA, TB, TC, TD] push_in_stk(
  x21 : (TD) -> TA raise,
  x22 : TD,
  x23 : (
    @kernel.Thm,
    Stack[
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        (@kernel.Thm, TA),
      ),
      TB,
      TC,
    ],
  ),
) -> (
  @kernel.Thm,
  Stack[
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      (@kernel.Thm, TA),
    ),
    TB,
    TC,
  ],
) raise {
  let f = x21
  let arg = x22
  let (th, stk) = x23
  let (tha, thb, mka) = mk_comb(th)
  (tha, Stack::Zrator((mka, (thb, f(arg))), stk))
}

///|
/// `push_skip_stk`
pub fn[TA, TB, TC, TD] push_skip_stk(
  x24 : (TD) -> TB raise,
  x25 : TD,
  x26 : (
    @kernel.Thm,
    Stack[
      TA,
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        Bool,
        (@kernel.Thm, TB),
      ),
      TC,
    ],
  ),
) -> (
  @kernel.Thm,
  Stack[
    TA,
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      Bool,
      (@kernel.Thm, TB),
    ),
    TC,
  ],
) raise {
  let f = x24
  let arg = x25
  let (th, stk) = x26
  let (tha, thb, mka) = mk_comb(th)
  (
    tha,
    Stack::Zrand(
      (
        fn(x27 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          fn(x28 : @kernel.Thm) -> @kernel.Thm raise { mka(x28)(x27) }
        },
        true,
        (thb, f(arg)),
      ),
      stk,
    ),
  )
}

///|
/// `push_lam_in_stk`
pub fn[TA, TB] push_lam_in_stk(
  x29 : @kernel.Thm,
  x30 : Stack[TA, TB, (@kernel.Thm) -> @kernel.Thm raise],
) -> (@kernel.Thm, Stack[TA, TB, (@kernel.Thm) -> @kernel.Thm raise]) raise {
  let (th, stk) = (x29, x30)
  let (_, thb, mkl) = mk_abs(th)
  (
    thb,
    Stack::Zabs(
      fn(x31 : @kernel.Thm) -> @kernel.Thm raise { try_eta(mkl(x31)) },
      stk,
    ),
  )
}

///|
/// `FUNIFY`
pub fn funify(x32 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x32
  try {
    let x = @kernel.rand(@equal.lhs(@kernel.concl(thm)))
    let t33 = @kernel.abs_rule(x, thm)
    @equal.conv_rule(
      @equal.rator_conv(
        @equal.rand_conv(
          @equal.changed_conv(
            @simp.pure_rewrite_conv(@list.List([@class.eta_ax()])),
          ),
        ),
      ),
      t33,
    )
  } catch {
    _ => raise Failure("FUNIFY")
  }
}

///|
/// `UNFUNIFY`
pub fn unfunify(x34 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x34
  try {
    let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(thm))
    let t35 = @kernel.dest_abs(rhs).0
    let x = @kernel.variant(@kernel.frees(lhs), t35)
    let t36 = @equal.ap_thm(thm, x)
    @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), t36)
  } catch {
    _ => raise Failure("UNFUNIFY")
  }
}

///|
/// `repeat_on_conj`
pub fn repeat_on_conj(
  x37 : (@kernel.Thm) -> @kernel.Thm raise,
  x38 : @kernel.Thm,
) -> @kernel.Thm raise {
  let f = x37
  let thm = x38
  fn iter(x39 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x39
    iter(f(th)) catch {
      _ => th
    }
  }
  @lib.end_itlist(@bool.conj, @lib.map(iter, body_conjuncts(thm)))
}

///|
/// lazyfy_thm
fn step_5() -> Unit raise {
  lazyfy_thm_c.set((x40 : @kernel.Thm) => repeat_on_conj(funify, x40))
}

///|
let lazyfy_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "lazyfy_thm",
)

///|
/// `lazyfy_thm`
pub fn lazyfy_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  lazyfy_thm_c.get()(x)
}

///|
/// strictify_thm
fn step_6() -> Unit raise {
  strictify_thm_c.set((x41 : @kernel.Thm) => repeat_on_conj(unfunify, x41))
}

///|
let strictify_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "strictify_thm",
)

///|
/// `strictify_thm`
pub fn strictify_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  strictify_thm_c.get()(x)
}

///|
/// `eq_intro`
pub fn eq_intro(x42 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x42
  if @basics.is_eq(@kernel.concl(thm)) {
    thm
  } else if @basics.is_neg(@kernel.concl(thm)) {
    @bool.eqf_intro(thm)
  } else {
    @bool.eqt_intro(thm)
  }
}

///|
/// `pattern`
#derive(Eq, Debug)
pub(all) enum Pattern {
  Pvar(Int64)
  Papp(@kernel.Term, @list.List[Pattern])
}

///|
pub extend Pattern with Eq::{not_equal, equal}

///|
pub extend Pattern with Debug::{to_repr}

///|
pub extend Pattern with @lib.OCompare::{ocompare}

///|
pub extend Pattern with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Pattern(x : Pattern) -> Int {
  match x {
    Pvar(_) => 1000000
    Papp(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Pattern with fn ocompare(self, other) {
  match (self, other) {
    (Pvar(a0), Pvar(b0)) => @lib.compare(a0, b0)
    (Papp(a0, a1), Papp(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Pattern(self).compare(ocaml_rank_Pattern(other))
  }
}

///|
pub impl @lib.OHash for Pattern with fn ohash_visit(self, h) {
  match self {
    Pvar(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Papp(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `check_arg_form`
pub fn check_arg_form(
  x43 : @kernel.Term,
) -> (@list.List[@kernel.Term], @kernel.Term, @list.List[Pattern]) raise {
  let trm = x43
  fn chk(
    x44 : @kernel.Term,
    x45 : @list.List[Pattern],
    x46 : @list.List[@kernel.Term],
  ) -> (@list.List[@kernel.Term], Pattern) raise {
    let t = x44
    let stk = x45
    let free = x46
    if @kernel.is_comb(t) {
      let (rator, rand) = @kernel.dest_comb(t)
      let (free_p, pat1) = chk(rand, @list.List([]), free)
      chk(rator, stk.prepend(pat1), free_p)
    } else if @kernel.is_var(t) {
      if stk == @list.List([]) {
        let newi = Int::to_int64(@lib.length(free))
        (
          free,
          Pattern::Pvar(
            @lib.sub63(@lib.sub63(newi, Int::to_int64(@lib.index(t, free))), 1L),
          ),
        ) catch {
          _ => (free.prepend(t), Pattern::Pvar(newi))
        }
      } else {
        raise Failure(
          "check_arg_form: " +
          (@kernel.dest_var(t).0 + " occurs as a variable on lhs"),
        )
      }
    } else if @kernel.is_const(t) {
      (free, Pattern::Papp(t, @lib.rev(stk)))
    } else {
      raise Failure(
        "check_arg_form: lambda abstraction not allowed on lhs: `" +
        (@printer.string_of_term(trm) + "`"),
      )
    }
  }
  match chk(trm, @list.List([]), @list.List([])) {
    (fv, Pattern::Papp(head, args)) => (@lib.rev(fv), head, args)
    _ => raise Failure("check_arg_form: ill-formed lhs")
  }
}

///|
/// `cst_rec`
pub(all) struct CstRec[TA] {
  head : @kernel.Term
  args : @list.List[(@kernel.Term, Fterm[TA])]
  rws : TA
  skip : Int64?
}

///|
pub extend CstRec with @lib.OCompare::{ocompare}

///|
pub extend CstRec with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for CstRec[TA] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.head, other.head)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.args, other.args)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.rws, other.rws)
  if c != 0 {
    return c
  }
  @lib.compare(self.skip, other.skip)
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for CstRec[TA] with fn ohash_visit(self, h) {
  h.block(0, 4)
  h.field(self.head)
  h.field(self.args)
  h.field(self.rws)
  h.field(self.skip)
}

///|
/// `clos_rec`
pub(all) struct ClosRec[TA] {
  env : @list.List[Fterm[TA]]
  term : Dterm[TA]
}

///|
pub extend ClosRec with @lib.OCompare::{ocompare}

///|
pub extend ClosRec with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for ClosRec[TA] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.env, other.env)
  if c != 0 {
    return c
  }
  @lib.compare(self.term, other.term)
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for ClosRec[TA] with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 2)
  h.field(self.env)
  h.field(self.term)
}

///|
/// `fterm`
pub(all) enum Fterm[TA] {
  Const(CstRec[TA])
  Neutr
  Clos(ClosRec[TA])
}

///|
pub extend Fterm with @lib.OCompare::{ocompare}

///|
pub extend Fterm with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Fterm(x : Fterm[TA]) -> Int {
  match x {
    Const(_) => 1000000
    Neutr => 0
    Clos(_) => 1000001
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Fterm[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Const(a0), Const(b0)) => @lib.compare(a0, b0)
    (Clos(a0), Clos(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Fterm(self).compare(ocaml_rank_Fterm(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Fterm[TA] with fn ohash_visit(self, h) {
  match self {
    Const(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Neutr => h.int(0L)
    Clos(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `dterm`
pub(all) enum Dterm[TA] {
  Bv(Int64)
  Fv
  Cst(@kernel.Term, Ref[(TA, Int64?)])
  App(Dterm[TA], @list.List[Dterm[TA]])
  Abs(Dterm[TA])
}

///|
pub extend Dterm with @lib.OCompare::{ocompare}

///|
pub extend Dterm with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Dterm(x : Dterm[TA]) -> Int {
  match x {
    Bv(_) => 1000000
    Fv => 0
    Cst(_, _) => 1000001
    App(_, _) => 1000002
    Abs(_) => 1000003
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Dterm[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Bv(a0), Bv(b0)) => @lib.compare(a0, b0)
    (Cst(a0, a1), Cst(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (App(a0, a1), App(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Abs(a0), Abs(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Dterm(self).compare(ocaml_rank_Dterm(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Dterm[TA] with fn ohash_visit(self, h) {
  match self {
    Bv(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Fv => h.int(0L)
    Cst(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    App(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
    Abs(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
  }
}

///|
/// `appl`
pub fn[TA] appl(x47 : (Dterm[TA], Dterm[TA])) -> Dterm[TA] raise {
  match x47 {
    (Dterm::App(a, l1), arg) => Dterm::App(a, l1.prepend(arg))
    (t, arg_1) => Dterm::App(t, @list.List([arg_1]))
  }
}

///|
/// `inst_type_dterm`
pub fn[TA] inst_type_dterm(
  x48 : (@list.List[(@kernel.HolType, @kernel.HolType)], Dterm[TA]),
) -> Dterm[TA] raise {
  match x48 {
    (Empty, v) => v
    (tysub, v_1) => (x49 => tyi_dt_l(tysub, x49))(v_1)
  }
}

///|
fn[TB] tyi_dt_l(
  tysub : @list.List[(@kernel.HolType, @kernel.HolType)],
  x49 : Dterm[TB],
) -> Dterm[TB] raise {
  let tyi_dt = (x49 : Dterm[TB]) => tyi_dt_l(tysub, x49)
  match x49 {
    Dterm::Cst(c, dbsk) => Dterm::Cst(@kernel.inst(tysub, c), dbsk)
    Dterm::App(h, l) => {
      let t50 = @lib.map(tyi_dt, l)
      Dterm::App(tyi_dt(h), t50)
    }
    Dterm::Abs(v_2) => Dterm::Abs(tyi_dt(v_2))
    v_3 => v_3
  }
}

///|
/// `action`
pub(all) enum Action {
  Rewrite(@list.List[Rewrite])
  Conv((@kernel.Term) -> (@kernel.Thm, Fterm[Db]) raise)
}

///|
/// `try_rec`
pub(all) struct TryRec {
  hcst : @kernel.Term
  rws : Action
  tail : Db
}

///|
/// `db`
pub(all) enum Db {
  End_db
  Try(TryRec)
  Need_arg(Db)
}

///|
/// `rewrite_rec`
pub(all) struct RewriteRec {
  cst : @kernel.Term
  lhs : @list.List[Pattern]
  npv : Int64
  rhs : Dterm[Db]
  thm : @kernel.Thm
}

///|
/// `rewrite`
pub(all) enum Rewrite {
  Rw(RewriteRec)
}

///|
/// `add_in_db`
pub fn add_in_db(x51 : (Int64, @kernel.Term, Action, Db)) -> Db raise {
  match x51 {
    (n, cst, act, Db::End_db) => {
      let t53 = Db::Try(TryRec::{ hcst: cst, rws: act, tail: Db::End_db, })
      @lib.funpow(
        @lib.int63_to_int(n),
        fn(x52 : Db) -> Db raise {
          let a = x52
          Db::Need_arg(a)
        },
        t53,
      )
    }
    (
      0L,
      cst_1,
      Action::Rewrite(nrws) as act_1,
      Db::Try({ hcst, rws: Action::Rewrite(rws) as rw, tail }),
    ) =>
      if cst_1 == hcst {
        Db::Try(TryRec::{ hcst, rws: Action::Rewrite(nrws.concat(rws)), tail, })
      } else {
        Db::Try(TryRec::{
          hcst,
          rws: rw,
          tail: add_in_db((0L, cst_1, act_1, tail)),
        })
      }
    (n_1, cst_2, act_2, Db::Try({ hcst: hcst_1, rws: rws_1, tail: tail_1 })) =>
      Db::Try(TryRec::{
        hcst: hcst_1,
        rws: rws_1,
        tail: add_in_db((n_1, cst_2, act_2, tail_1)),
      })
    (0L, cst_3, act_3, db) =>
      Db::Try(TryRec::{ hcst: cst_3, rws: act_3, tail: db, })
    (n_2, cst_4, act_4, Db::Need_arg(tail_2)) =>
      Db::Need_arg(add_in_db((@lib.sub63(n_2, 1L), cst_4, act_4, tail_2)))
  }
}

///|
/// `key_of`
pub fn key_of(x54 : Rewrite) -> (String, Int64, @kernel.Term) raise {
  match x54 {
    Rewrite::Rw({ cst, lhs, .. }) => {
      let (name, _) = @kernel.dest_const(cst)
      (name, Int::to_int64(@lib.length(lhs)), cst)
    }
  }
}

///|
/// `is_skip`
pub fn[TA, TB] is_skip(x55 : (TA, Fterm[TB])) -> Bool raise {
  match x55 {
    (_, Fterm::Const({ args, skip: Some(n), .. })) =>
      n <= Int::to_int64(@lib.length(args))
    _ => false
  }
}

///|
/// `partition_skip`
pub fn[TA] partition_skip(
  x56 : Int64?,
  x57 : @list.List[TA],
) -> (@list.List[TA], @list.List[TA]) raise {
  let skip = x56
  let args = x57
  match skip {
    Some(n) => {
      let len = Int::to_int64(@lib.length(args))
      if n <= len {
        @lib.chop_list(@lib.int63_to_int(@lib.sub63(len, n)), args)
      } else {
        (@list.List([]), args)
      }
    }
    None => (@list.List([]), args)
  }
}

///|
/// `compset`
pub(all) enum Compset {
  Rws(@lib.OHashtbl[String, Ref[(Db, Int64?)]])
}

///|
/// `empty_rws`
pub fn empty_rws(x58 : Unit) -> Compset raise {
  let _ = x58
  Compset::Rws(@lib.hashtbl_create(100))
}

///|
/// `assoc_clause`
pub fn assoc_clause(
  x59 : Compset,
) -> ((String) -> Ref[(Db, Int64?)] raise) raise {
  match x59 {
    Compset::Rws(rws) =>
      fn(x60 : String) -> Ref[(Db, Int64?)] raise {
        let cst = x60
        @lib.hashtbl_find(rws, cst) catch {
          @lib.NotFound => {
            let mt = Ref::{ val: (Db::End_db, None), }
            @lib.hashtbl_add(rws, cst, mt)
            mt
          }
          e => raise e
        }
      }
  }
}

///|
/// `add_in_db_upd`
pub fn add_in_db_upd(
  x61 : Compset,
  x62 : (String, Int64, @kernel.Term),
  x63 : Action,
) -> Unit raise {
  let rws = x61
  let (name, arity, hcst) = x62
  let act = x63
  match assoc_clause(rws)(name) {
    { val: (db, sk) } as rl => {
      rl.val = (add_in_db((arity, hcst, act, db)), sk)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:342")
  }
}

///|
/// `set_skip_name`
pub fn set_skip_name(
  x64 : Compset,
) -> ((String) -> ((Int64?) -> Unit raise) raise) raise {
  match x64 {
    Compset::Rws(htbl) as rws =>
      fn(x65 : String) -> ((Int64?) -> Unit raise) raise {
        let p = x65
        fn(x66 : Int64?) -> Unit raise {
          let sk = x66
          match assoc_clause(rws)(p) {
            { val: (db, _) } as rl => {
              rl.val = (db, sk)
              ()
            }
            _ => raise @lib.MatchFailure("tscript.ml:346")
          }
        }
      }
  }
}

///|
/// `scrub_const`
pub fn scrub_const(x67 : Compset) -> ((@kernel.Term) -> Unit raise) raise {
  match x67 {
    Compset::Rws(htbl) =>
      fn(x68 : @kernel.Term) -> Unit raise {
        let c = x68
        let (name, _) = @kernel.dest_const(c)
        @lib.hashtbl_remove(htbl, name)
      }
  }
}

///|
/// `from_term`
pub fn from_term(
  x69 : Compset,
  x70 : @list.List[@kernel.Term],
  x71 : @kernel.Term,
) -> Dterm[Db] raise {
  let (rws, env, t) = (x69, x70, x71)
  let down = (
    x72 : @list.List[@kernel.Term],
    x73 : @kernel.Term,
    x74 : Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
  ) => down_l(rws, x72, x73, x74)
  let up = (
    x75 : (
      Dterm[Db],
      Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
    ),
  ) => up_l(rws, x75)
  down(env, t, Stack::Ztop)
}

///|
fn down_l(
  rws : Compset,
  x72 : @list.List[@kernel.Term],
  x73 : @kernel.Term,
  x74 : Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
) -> Dterm[Db] raise {
  let down = (
    x72 : @list.List[@kernel.Term],
    x73 : @kernel.Term,
    x74 : Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
  ) => down_l(rws, x72, x73, x74)
  let up = (
    x75 : (
      Dterm[Db],
      Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
    ),
  ) => up_l(rws, x75)
  let (env_1, t_1, c) = (x72, x73, x74)
  match t_1 {
    @kernel.Term::Var(_, _) =>
      up(
        (
          Dterm::Bv(Int::to_int64(@lib.index(t_1, env_1))) catch {
            _ => Dterm::Fv
          },
          c,
        ),
      )
    @kernel.Term::Const(name, _) =>
      up((Dterm::Cst(t_1, assoc_clause(rws)(name)), c))
    @kernel.Term::Comb(rator, rand) =>
      down(env_1, rator, Stack::Zrator((env_1, rand), c))
    @kernel.Term::Abs(bvar, body) =>
      down(env_1.prepend(bvar), body, Stack::Zabs((), c))
  }
}

///|
fn up_l(
  rws : Compset,
  x75 : (
    Dterm[Db],
    Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
  ),
) -> Dterm[Db] raise {
  let down = (
    x72 : @list.List[@kernel.Term],
    x73 : @kernel.Term,
    x74 : Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
  ) => down_l(rws, x72, x73, x74)
  let up = (
    x75 : (
      Dterm[Db],
      Stack[(@list.List[@kernel.Term], @kernel.Term), Dterm[Db], Unit],
    ),
  ) => up_l(rws, x75)
  match x75 {
    (dt, Stack::Ztop) => dt
    (dt_1, Stack::Zrator((env_2, arg), c_1)) =>
      down(env_2, arg, Stack::Zrand(dt_1, c_1))
    (dt_2, Stack::Zrand(dr, c_2)) => up((appl((dr, dt_2)), c_2))
    (dt_3, Stack::Zabs(_, c_3)) => up((Dterm::Abs(dt_3), c_3))
  }
}

///|
/// `mk_rewrite`
pub fn mk_rewrite(x76 : Compset, x77 : @kernel.Thm) -> Rewrite raise {
  let rws = x76
  let eq_thm = x77
  let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(eq_thm))
  let (fv, cst, pats) = check_arg_form(lhs)
  let gen_thm = @lib.itlist(@bool.gen, fv, eq_thm)
  let rhsc = from_term(rws, @lib.rev(fv), rhs)
  Rewrite::Rw(RewriteRec::{
    cst,
    lhs: pats,
    npv: Int::to_int64(@lib.length(fv)),
    rhs: rhsc,
    thm: gen_thm,
  })
}

///|
/// `unsuitable`
pub fn unsuitable(x78 : @kernel.Thm) -> Bool raise {
  let th = x78
  let (l, r) = @kernel.dest_eq(@kernel.concl(th))
  @lib.can((x79 : @kernel.Term) => @drule.term_match(@list.List([]), l, x79), r)
}

///|
/// `enter_thm`
pub fn enter_thm(x80 : Compset, x81 : @kernel.Thm) -> Unit raise {
  let rws = x80
  let thm0 = x81
  let thm = eq_intro(thm0)
  if unsuitable(thm) {
    ()
  } else {
    let rw = mk_rewrite(rws, thm)
    let t82 = Action::Rewrite(@list.List([rw]))
    add_in_db_upd(rws, key_of(rw), t82)
  }
}

///|
/// `add_thms`
pub fn add_thms(x83 : @list.List[@kernel.Thm], x84 : Compset) -> Unit raise {
  let lthm = x83
  let rws = x84
  @lib.do_list(
    fn(x87 : @kernel.Thm) -> Unit raise {
      (x86 => @lib.do_list((x85 : @kernel.Thm) => enter_thm(rws, x85), x86))(
        body_conjuncts(x87),
      )
    },
    lthm,
  )
}

///|
/// `add_extern`
pub fn add_extern(
  x88 : (@kernel.Term, Int64, (@kernel.Term) -> (@kernel.Thm, Fterm[Db]) raise),
  x89 : Compset,
) -> Unit raise {
  let (cst, arity, fconv) = x88
  let rws = x89
  let (name, _) = @kernel.dest_const(cst)
  add_in_db_upd(rws, (name, arity, cst), Action::Conv(fconv))
}

///|
/// `new_rws`
pub fn new_rws(x90 : Unit) -> Compset raise {
  let _ = x90
  let rws = empty_rws(())
  add_thms(@list.List([@theorems.refl_clause()]), rws)
  rws
}

///|
/// `from_list`
pub fn from_list(x91 : @list.List[@kernel.Thm]) -> Compset raise {
  let lthm = x91
  let rws = new_rws(())
  add_thms(lthm, rws)
  rws
}

///|
/// `scrub_thms`
pub fn scrub_thms(x92 : @list.List[@kernel.Thm], x93 : Compset) -> Unit raise {
  let lthm = x92
  let rws = x93
  let tmlist = @lib.map(
    fn(x96 : @kernel.Thm) -> @kernel.Term raise {
      (fn(x95 : @list.List[@kernel.Thm]) -> @kernel.Term raise {
        (fn(x94 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x94) })(
          @lib.hd(x95),
        )
      })(body_conjuncts(x96))
    },
    lthm,
  )
  let clist = @lib.map(
    fn(x104 : @kernel.Term) -> @kernel.Term raise {
      (fn(
        x102 : (@list.List[@kernel.Term], @kernel.Term),
      ) -> @kernel.Term raise {
        (fn(x100 : @kernel.Term) -> @kernel.Term raise {
          (fn(x99 : @kernel.Term) -> @kernel.Term raise {
            (fn(
              x97 : (@kernel.Term, @list.List[@kernel.Term]),
            ) -> @kernel.Term raise {
              x97.0
            })(
              (fn(
                x98 : @kernel.Term,
              ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                @basics.strip_comb(x98)
              })(x99),
            )
          })(@equal.lhs(x100))
        })(
          (fn(
            x101 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            x101.1
          })(x102),
        )
      })(
        (fn(
          x103 : @kernel.Term,
        ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
          @basics.strip_forall(x103)
        })(x104),
      )
    },
    tmlist,
  )
  @lib.do_list(scrub_const(rws), clist)
}

///|
/// `rws_of`
pub fn rws_of(
  x105 : Compset,
) -> @list.List[(@kernel.Term, @list.List[@kernel.Thm])] raise {
  match x105 {
    Compset::Rws(htbl) => {
      let dblist = @lib.hashtbl_fold(
        fn(
          x106 : String,
          x107 : Ref[(Db, Int64?)],
          x108 : @list.List[Db],
        ) -> @list.List[Db] raise {
          match x107 {
            { val: (db, _) } => {
              let r = x108
              r.prepend(db)
            }
          }
        },
        htbl,
        @list.List([]),
      )
      fn get_actions(x109 : Db) -> @list.List[(@kernel.Term, Action)] raise {
        let db_1 = x109
        match db_1 {
          Db::End_db => @list.List([])
          Db::Need_arg(db_p) => get_actions(db_p)
          Db::Try({ hcst, rws, tail }) =>
            get_actions(tail).prepend((hcst, rws))
        }
      }
      let actionlist = @lib.flat(@lib.map(get_actions, dblist))
      let dest : (Rewrite) -> @kernel.Thm raise = fn(
        x110 : Rewrite,
      ) -> @kernel.Thm raise {
        match x110 {
          Rewrite::Rw({ thm, .. }) => thm
        }
      }
      let rwlist = @lib.map(x111 => dest_action_l(dest, x111), actionlist)
      rwlist
    }
  }
}

///|
fn[TA] dest_action_l(
  dest : (Rewrite) -> @kernel.Thm raise,
  x111 : (TA, Action),
) -> (TA, @list.List[@kernel.Thm]) raise {
  match x111 {
    (hcst_1, Action::Rewrite(rws_1)) => (hcst_1, @lib.map(dest, rws_1))
    (hcst_2, Action::Conv(_)) => (hcst_2, @list.List([]))
  }
}

///|
/// `transform`
pub(all) enum Transform {
  Conversion((@kernel.Term) -> (@kernel.Thm, Fterm[Db]) raise)
  Rrules(@list.List[@kernel.Thm])
}

///|
/// `deplist`
pub fn deplist(
  x112 : Compset,
) -> @list.List[(String, @list.List[Transform])] raise {
  match x112 {
    Compset::Rws(htbl) => {
      let dblist = @lib.hashtbl_fold(
        fn(
          x113 : String,
          x114 : Ref[(Db, Int64?)],
          x115 : @list.List[(String, Db)],
        ) -> @list.List[(String, Db)] raise {
          let s = x113
          match x114 {
            { val: (db, _) } => {
              let r = x115
              r.prepend((s, db))
            }
          }
        },
        htbl,
        @list.List([]),
      )
      fn get_actions(x116 : Db) -> @list.List[Action] raise {
        let db_1 = x116
        match db_1 {
          Db::End_db => @list.List([])
          Db::Need_arg(db_p) => get_actions(db_p)
          Db::Try({ hcst, rws, tail }) => get_actions(tail).prepend(rws)
        }
      }
      let actionlist = @lib.map(
        fn(x117 : (String, Db)) -> (String, @list.List[Action]) raise {
          let (s_1, db_2) = x117
          (s_1, get_actions(db_2))
        },
        dblist,
      )
      let dest : (Rewrite) -> @kernel.Thm raise = fn(
        x118 : Rewrite,
      ) -> @kernel.Thm raise {
        match x118 {
          Rewrite::Rw({ thm, .. }) => thm
        }
      }
      let dest_action : (Action) -> Transform raise = fn(
        x119 : Action,
      ) -> Transform raise {
        match x119 {
          Action::Rewrite(rws_1) => Transform::Rrules(@lib.map(dest, rws_1))
          Action::Conv(ecnv) => Transform::Conversion(ecnv)
        }
      }
      let rwlist = @lib.map(
        fn(
          x120 : (String, @list.List[Action]),
        ) -> (String, @list.List[Transform]) raise {
          let (s_2, act) = x120
          (s_2, @lib.map(dest_action, act))
        },
        actionlist,
      )
      rwlist
    }
  }
}

///|
/// `exception No_match`
pub(all) suberror No_match {
  No_match
}

///|
/// `match_const`
pub fn[TA] match_const(
  x121 : (TA, @list.List[(@kernel.HolType, @kernel.HolType)]),
  x122 : @kernel.Term,
  x123 : @kernel.Term,
) -> (TA, @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
  let (bds, tbds) = x121
  let pc = x122
  let c = x123
  let (name, ty) = @kernel.dest_const(pc)
  let (name_p, ty_p) = @kernel.dest_const(c)
  if name == name_p {
    (bds, @basics.type_match(ty, ty_p, tbds)) catch {
      _ => raise No_match::No_match
    }
  } else {
    raise No_match::No_match
  }
}

///|
/// `match_var`
pub fn[TA, TB] match_var(
  x124 : (FixedArray[(@kernel.Term, TA)?], TB),
  x125 : Int64,
  x126 : (@kernel.Term, TA),
) -> (FixedArray[(@kernel.Term, TA)?], TB) raise {
  let (bds, tbds) = x124
  let var_ = x125
  let arg = x126
  let _ = match @lib.array_get(bds, @lib.int63_to_int(var_)) {
    Some((tm, _)) =>
      if @basics.aconv(tm, arg.0) {
        ()
      } else {
        raise No_match::No_match
      }
    None => @lib.array_set(bds, @lib.int63_to_int(var_), Some(arg))
  }
  (bds, tbds)
}

///|
/// `match_list`
pub fn[TA] match_list(
  x127 : (
    FixedArray[(@kernel.Term, Fterm[TA])?],
    @list.List[(@kernel.HolType, @kernel.HolType)],
  ),
  x128 : @list.List[Pattern],
  x129 : @list.List[(@kernel.Term, Fterm[TA])],
) -> (
  FixedArray[(@kernel.Term, Fterm[TA])?],
  @list.List[(@kernel.HolType, @kernel.HolType)],
) raise {
  let bds = x127
  let pats = x128
  let args = x129
  match (pats, args) {
    (More(pat, tail=pats_1), More(arg, tail=args_1)) =>
      match_list(match_solve(bds, pat, arg), pats_1, args_1)
    (Empty, Empty) => bds
    _ => raise Dead_code::Dead_code("match_list")
  }
}

///|
/// `match_solve`
pub fn[TA] match_solve(
  x130 : (
    FixedArray[(@kernel.Term, Fterm[TA])?],
    @list.List[(@kernel.HolType, @kernel.HolType)],
  ),
  x131 : Pattern,
  x132 : (@kernel.Term, Fterm[TA]),
) -> (
  FixedArray[(@kernel.Term, Fterm[TA])?],
  @list.List[(@kernel.HolType, @kernel.HolType)],
) raise {
  let bds_1 = x130
  let pat_1 = x131
  let arg_1 = x132
  match (pat_1, arg_1) {
    (Pattern::Pvar(var_), arg_2) => match_var(bds_1, var_, arg_2)
    (Pattern::Papp(phead, pargs), (_, Fterm::Const({ head, args: args_2, .. }))) => {
      let t133 = Int::to_int64(@lib.length(args_2))
      if Int::to_int64(@lib.length(pargs)) == t133 {
        match_list(match_const(bds_1, phead, head), pargs, args_2)
      } else {
        raise No_match::No_match
      }
    }
    _ => raise No_match::No_match
  }
}

///|
/// `rule_inst`
pub(all) struct RuleInst[TA] {
  rule : Rewrite
  inst : (
    FixedArray[(@kernel.Term, Fterm[TA])?],
    @list.List[(@kernel.HolType, @kernel.HolType)],
  )
}

///|
/// `try_rwn`
pub fn[TA] try_rwn(
  x134 : @list.List[(@kernel.HolType, @kernel.HolType)],
  x135 : @list.List[(@kernel.Term, Fterm[TA])],
) -> ((@list.List[Rewrite]) -> RuleInst[TA] raise) raise {
  let ibds = x134
  let lt = x135
  fn try_rec(x137 : @list.List[Rewrite]) -> RuleInst[TA] raise {
    match x137 {
      Empty => raise No_match::No_match
      More(Rewrite::Rw({ lhs, npv, .. }) as rw, tail=rwn) => {
        let env = @lib.array_make(npv, None)
        RuleInst::{ rule: rw, inst: match_list((env, ibds), lhs, lt), } catch {
          No_match::No_match => try_rec(rwn)
          e => raise e
        }
      }
    }
  }
  try_rec
}

///|
/// `comb_ct`
pub fn comb_ct(
  x138 : CstRec[Db],
  x139 : (@kernel.Term, Fterm[Db]),
) -> Fterm[Db] raise {
  let cst = x138
  let arg = x139
  match cst {
    { head, args, rws: Db::Need_arg(tail), skip } =>
      Fterm::Const(CstRec::{ head, args: args.prepend(arg), rws: tail, skip, })
    { head: head_1, args: args_1, rws: Db::End_db, skip: skip_1 } =>
      Fterm::Const(CstRec::{
        head: head_1,
        args: args_1.prepend(arg),
        rws: Db::End_db,
        skip: skip_1,
      })
    { rws: Db::Try(_), .. } =>
      raise Dead_code::Dead_code("comb_ct: yet rules to try")
  }
}

///|
/// `mk_clos`
pub fn[TA] mk_clos(
  x140 : @list.List[Fterm[TA]],
  x141 : Dterm[TA],
) -> Fterm[TA] raise {
  let (env, t) = (x140, x141)
  match t {
    Dterm::Cst(hc, { val: (db, b) }) =>
      Fterm::Const(CstRec::{ head: hc, args: @list.List([]), rws: db, skip: b, })
    Dterm::Bv(i) => @lib.list_nth(env, @lib.int63_to_int(i))
    Dterm::Fv => Fterm::Neutr
    _ => Fterm::Clos(ClosRec::{ env, term: t, })
  }
}

///|
/// `inst_one_var`
pub fn[TA] inst_one_var(
  x142 : (@kernel.Thm, @list.List[TA]),
  x143 : (@kernel.Term, TA)?,
) -> (@kernel.Thm, @list.List[TA]) raise {
  let (thm, lv) = x142
  match x143 {
    Some((tm, v)) => (@bool.spec(tm, thm), lv.prepend(v))
    None => raise Dead_code::Dead_code("inst_rw")
  }
}

///|
/// `inst_rw`
pub fn inst_rw(
  x144 : @kernel.Thm,
  x145 : Bool,
  x146 : RuleInst[Db],
) -> (@kernel.Thm, Fterm[Db]) raise {
  match (x144, x145, x146) {
    (
      th,
      monitoring,
      { rule: Rewrite::Rw({ rhs, thm }), inst: (bds, tysub) },
    ) => {
      let tirhs = inst_type_dterm((tysub, rhs))
      let tithm = @kernel.inst_type(tysub, thm)
      let (spec_thm, venv) = @lib.array_fold_left(
        inst_one_var,
        (tithm, @list.List([])),
        bds,
      )
      match
        (if monitoring {
          @printer.print_term(@kernel.concl(spec_thm))
        } else {
          ()
        }) {
        _ => {
          let t147 = mk_clos(venv, tirhs)
          (trans_thm(th)(spec_thm), t147)
        }
      }
    }
  }
}

///|
/// monitoring
fn step_7() -> Unit raise {
  monitoring_c.set(Ref::{ val: None, })
}

///|
let monitoring_c : @lib.Cell[Ref[((@kernel.Term) -> Bool raise)?]] = @lib.Cell::new(
  "monitoring",
)

///|
/// `monitoring`
pub fn monitoring() -> Ref[((@kernel.Term) -> Bool raise)?] {
  monitoring_c.get()
}

///|
/// stoppers
fn step_8() -> Unit raise {
  stoppers_c.set(Ref::{ val: None, })
}

///|
let stoppers_c : @lib.Cell[Ref[((@kernel.Term) -> Bool raise)?]] = @lib.Cell::new(
  "stoppers",
)

///|
/// `stoppers`
pub fn stoppers() -> Ref[((@kernel.Term) -> Bool raise)?] {
  stoppers_c.get()
}

///|
/// `reduce_cst`
pub fn reduce_cst(
  x148 : (@kernel.Thm, CstRec[Db]),
) -> (Bool, (@kernel.Thm, Fterm[Db])) raise {
  match x148 {
    (
      th,
      {
        head,
        args,
        rws: Db::Try({ hcst, rws: Action::Rewrite(rls), tail }),
        skip
      },
    ) =>
      try {
        match
          (match stoppers().val {
            None => ()
            Some(p) => if p(head) { raise No_match::No_match } else { () }
          }) {
          _ => {
            let (_, _, tytheta) = @drule.term_match(@list.List([]), hcst, head) catch {
              _ => raise No_match::No_match
            }
            let rule_inst = try_rwn(tytheta, args)(rls)
            let mon = match monitoring().val {
              None => false
              Some(f) => f(head)
            }
            let insted = inst_rw(th, mon, rule_inst)
            (true, insted)
          }
        }
      } catch {
        No_match::No_match =>
          reduce_cst((th, CstRec::{ head, args, rws: tail, skip, }))
        e => raise e
      }
    (
      th_1,
      {
        head: head_1,
        args: args_1,
        rws: Db::Try(
          { hcst: hcst_1, rws: Action::Conv(fconv), tail: tail_1 }
        ),
        skip: skip_1
      },
    ) =>
      try {
        let (thm, ft) = fconv(rhs_concl(th_1))
        (true, (trans_thm(th_1)(thm), ft))
      } catch {
        _ =>
          reduce_cst(
            (
              th_1,
              CstRec::{ head: head_1, args: args_1, rws: tail_1, skip: skip_1, },
            ),
          )
      }
    (th_2, cst) => (false, (th_2, Fterm::Const(cst)))
  }
}

///|
/// auto_import_definitions
fn step_9() -> Unit raise {
  auto_import_definitions_c.set(Ref::{ val: true, })
}

///|
let auto_import_definitions_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new(
  "auto_import_definitions",
)

///|
/// `auto_import_definitions`
pub fn auto_import_definitions() -> Ref[Bool] {
  auto_import_definitions_c.get()
}

///|
/// new_compset
fn step_10() -> Unit raise {
  new_compset_c.set(from_list)
}

///|
let new_compset_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Compset raise] = @lib.Cell::new(
  "new_compset",
)

///|
/// `new_compset`
pub fn new_compset(x : @list.List[@kernel.Thm]) -> Compset raise {
  new_compset_c.get()(x)
}

///|
/// listItems
fn step_11() -> Unit raise {
  listitems_c.set(deplist)
}

///|
let listitems_c : @lib.Cell[
  (Compset) -> @list.List[(String, @list.List[Transform])] raise,
] = @lib.Cell::new("listItems")

///|
/// `listItems`
pub fn listitems(
  x : Compset,
) -> @list.List[(String, @list.List[Transform])] raise {
  listitems_c.get()(x)
}

///|
/// `cbv_stack`
pub type CbvStack = Stack[
  (
    (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
    (@kernel.Thm, Fterm[Db]),
  ),
  (
    (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
    Bool,
    (@kernel.Thm, Fterm[Db]),
  ),
  (@kernel.Thm) -> @kernel.Thm raise,
]

///|
/// `stack_out`
pub fn[TA, TB, TC, TD, TE, TF] stack_out(
  x149 : (
    TA,
    Stack[
      ((TA) -> ((TB) -> TA raise) raise, (TB, TC)),
      ((TD) -> ((TA) -> TA raise) raise, TE, (TD, TF)),
      (TA) -> TA raise,
    ],
  ),
) -> TA raise {
  match x149 {
    (th, Stack::Ztop) => th
    (th_1, Stack::Zrator((mka, (thb, _)), ctx)) =>
      stack_out((mka(th_1)(thb), ctx))
    (th_2, Stack::Zrand((mka_1, _, (tha, _)), ctx_1)) =>
      stack_out((mka_1(tha)(th_2), ctx_1))
    (th_3, Stack::Zabs(mkl, ctx_2)) => stack_out((mkl(th_3), ctx_2))
  }
}

///|
/// `initial_state`
pub fn initial_state(
  x150 : Compset,
  x151 : @kernel.Term,
) -> ((@kernel.Thm, Fterm[Db]), CbvStack) raise {
  let rws = x150
  let t = x151
  let t152 = mk_clos(@list.List([]), from_term(rws, @list.List([]), t))
  ((refl_thm(t), t152), Stack::Ztop)
}

///|
/// `cbv_wk`
pub fn[TA] cbv_wk(
  x153 : (
    (@kernel.Thm, Fterm[Db]),
    Stack[
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        (@kernel.Thm, Fterm[Db]),
      ),
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        Bool,
        (@kernel.Thm, Fterm[Db]),
      ),
      TA,
    ],
  ),
) -> (
  (@kernel.Thm, Fterm[Db]),
  Stack[
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      (@kernel.Thm, Fterm[Db]),
    ),
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      Bool,
      (@kernel.Thm, Fterm[Db]),
    ),
    TA,
  ],
) raise {
  match x153 {
    ((th, Fterm::Clos({ env, term: Dterm::App(a, args) })), stk) => {
      let (tha, stka) = @lib.rev_itlist(
        (
          x156 : Dterm[Db],
          x157 : (
            @kernel.Thm,
            Stack[
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                (@kernel.Thm, Fterm[Db]),
              ),
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                Bool,
                (@kernel.Thm, Fterm[Db]),
              ),
              TA,
            ],
          ),
        ) => {
          push_in_stk(
            (x155 : Dterm[Db]) => {
              @lib.curry(
                fn(
                  x154 : (@list.List[Fterm[Db]], Dterm[Db]),
                ) -> Fterm[Db] raise {
                  mk_clos(x154.0, x154.1)
                },
                env,
                x155,
              )
            },
            x156,
            x157,
          )
        },
        args,
        (th, stk),
      )
      cbv_wk(((tha, mk_clos(env, a)), stka))
    }
    (
      (th_1, Fterm::Clos({ env: env_1, term: Dterm::Abs(body) })),
      Stack::Zrator((mka, (thb, cl)), s_p),
    ) => {
      let t158 = mk_clos(env_1.prepend(cl), body)
      cbv_wk(((beta_thm(mka(th_1)(thb)), t158), s_p))
    }
    ((th_2, Fterm::Const(cargs)), stk_1) => {
      let (reduced, clos) = reduce_cst((th_2, cargs))
      if reduced {
        cbv_wk((clos, stk_1))
      } else {
        cbv_up((clos, stk_1))
      }
    }
    (clos_1, stk_2) => cbv_up((clos_1, stk_2))
  }
}

///|
/// `cbv_up`
pub fn[TA] cbv_up(
  x159 : (
    (@kernel.Thm, Fterm[Db]),
    Stack[
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        (@kernel.Thm, Fterm[Db]),
      ),
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        Bool,
        (@kernel.Thm, Fterm[Db]),
      ),
      TA,
    ],
  ),
) -> (
  (@kernel.Thm, Fterm[Db]),
  Stack[
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      (@kernel.Thm, Fterm[Db]),
    ),
    (
      (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      Bool,
      (@kernel.Thm, Fterm[Db]),
    ),
    TA,
  ],
) raise {
  match x159 {
    (hcl, Stack::Zrator((mka_1, clos_2), ctx)) => {
      let new_state = (clos_2, Stack::Zrand((mka_1, false, hcl), ctx))
      if is_skip(hcl) {
        cbv_up(new_state)
      } else {
        cbv_wk(new_state)
      }
    }
    (
      (thb_1, v),
      Stack::Zrand((mka_2, false, (th_3, Fterm::Const(cargs_1))), stk_3),
    ) => {
      let t160 = comb_ct(cargs_1, (rhs_concl(thb_1), v))
      cbv_wk(((mka_2(th_3)(thb_1), t160), stk_3))
    }
    (
      (thb_2, Fterm::Neutr),
      Stack::Zrand((mka_3, false, (th_4, Fterm::Neutr)), stk_4),
    ) => cbv_up(((mka_3(th_4)(thb_2), Fterm::Neutr), stk_4))
    (clos_3, stk_5) => (clos_3, stk_5)
  }
}

///|
/// `strong`
pub fn strong(
  x161 : (
    (@kernel.Thm, Fterm[Db]),
    Stack[
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        (@kernel.Thm, Fterm[Db]),
      ),
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        Bool,
        (@kernel.Thm, Fterm[Db]),
      ),
      (@kernel.Thm) -> @kernel.Thm raise,
    ],
  ),
) -> @kernel.Thm raise {
  match x161 {
    ((th, Fterm::Clos({ env, term: Dterm::Abs(t) })), stk) => {
      let (thb, stk_p) = push_lam_in_stk(th, stk)
      strong(cbv_wk(((thb, mk_clos(env.prepend(Fterm::Neutr), t)), stk_p)))
    }
    ((_, Fterm::Clos(_)), stk_1) => raise Dead_code::Dead_code("strong")
    ((th_1, Fterm::Const({ args, skip, .. })), stk_2) => {
      let (argssk, argsrd) = partition_skip(skip, args)
      let (th_p, stk_p_1) = @lib.rev_itlist(
        (
          x163 : (@kernel.Term, Fterm[Db]),
          x164 : (
            @kernel.Thm,
            Stack[
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                (@kernel.Thm, Fterm[Db]),
              ),
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                Bool,
                (@kernel.Thm, Fterm[Db]),
              ),
              (@kernel.Thm) -> @kernel.Thm raise,
            ],
          ),
        ) => {
          push_skip_stk(
            fn(x162 : (@kernel.Term, Fterm[Db])) -> Fterm[Db] raise { x162.1 },
            x163,
            x164,
          )
        },
        argssk,
        (th_1, stk_2),
      )
      let (th_p_p, stk_p_p) = @lib.rev_itlist(
        (
          x166 : (@kernel.Term, Fterm[Db]),
          x167 : (
            @kernel.Thm,
            Stack[
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                (@kernel.Thm, Fterm[Db]),
              ),
              (
                (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                Bool,
                (@kernel.Thm, Fterm[Db]),
              ),
              (@kernel.Thm) -> @kernel.Thm raise,
            ],
          ),
        ) => {
          push_in_stk(
            fn(x165 : (@kernel.Term, Fterm[Db])) -> Fterm[Db] raise { x165.1 },
            x166,
            x167,
          )
        },
        argsrd,
        (th_p, stk_p_1),
      )
      strong_up((th_p_p, stk_p_p))
    }
    ((th_2, Fterm::Neutr), stk_3) => strong_up((th_2, stk_3))
  }
}

///|
/// `strong_up`
pub fn strong_up(
  x168 : (
    @kernel.Thm,
    Stack[
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        (@kernel.Thm, Fterm[Db]),
      ),
      (
        (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
        Bool,
        (@kernel.Thm, Fterm[Db]),
      ),
      (@kernel.Thm) -> @kernel.Thm raise,
    ],
  ),
) -> @kernel.Thm raise {
  match x168 {
    (th_3, Stack::Ztop) => th_3
    (th_4, Stack::Zrand((mka, false, (tha, Fterm::Neutr)), ctx)) =>
      strong(cbv_wk(((mka(tha)(th_4), Fterm::Neutr), ctx)))
    (th_5, Stack::Zrand((mka_1, false, clos), ctx_1)) =>
      raise Dead_code::Dead_code("strong_up")
    (th_6, Stack::Zrator((mka_2, clos_1), ctx_2)) =>
      strong(
        cbv_wk(
          (clos_1, Stack::Zrand((mka_2, true, (th_6, Fterm::Neutr)), ctx_2)),
        ),
      )
    (th_7, Stack::Zrand((mka_3, true, (tha_1, _)), ctx_3)) =>
      strong_up((mka_3(tha_1)(th_7), ctx_3))
    (th_8, Stack::Zabs(mkl, ctx_4)) => strong_up((mkl(th_8), ctx_4))
  }
}

///|
/// `CBV_CONV`
pub fn cbv_conv(x169 : Compset) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let rws = x169
  fn(x174 : @kernel.Term) -> @kernel.Thm raise {
    (fn(
      x172 : (
        (@kernel.Thm, Fterm[Db]),
        Stack[
          (
            (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
            (@kernel.Thm, Fterm[Db]),
          ),
          (
            (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
            Bool,
            (@kernel.Thm, Fterm[Db]),
          ),
          (@kernel.Thm) -> @kernel.Thm raise,
        ],
      ),
    ) -> @kernel.Thm raise {
      (fn(
        x171 : (
          (@kernel.Thm, Fterm[Db]),
          Stack[
            (
              (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
              (@kernel.Thm, Fterm[Db]),
            ),
            (
              (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
              Bool,
              (@kernel.Thm, Fterm[Db]),
            ),
            (@kernel.Thm) -> @kernel.Thm raise,
          ],
        ),
      ) -> @kernel.Thm raise {
        evaluate(strong(x171))
      })(cbv_wk(x172))
    })(((x173 : @kernel.Term) => initial_state(rws, x173))(x174))
  }
}

///|
/// `WEAK_CBV_CONV`
pub fn weak_cbv_conv(
  x175 : Compset,
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let rws = x175
  fn(x181 : @kernel.Term) -> @kernel.Thm raise {
    (fn(
      x179 : (
        (@kernel.Thm, Fterm[Db]),
        Stack[
          (
            (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
            (@kernel.Thm, Fterm[Db]),
          ),
          (
            (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
            Bool,
            (@kernel.Thm, Fterm[Db]),
          ),
          (@kernel.Thm) -> @kernel.Thm raise,
        ],
      ),
    ) -> @kernel.Thm raise {
      (fn(
        x178 : (
          (@kernel.Thm, Fterm[Db]),
          Stack[
            (
              (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
              (@kernel.Thm, Fterm[Db]),
            ),
            (
              (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
              Bool,
              (@kernel.Thm, Fterm[Db]),
            ),
            (@kernel.Thm) -> @kernel.Thm raise,
          ],
        ),
      ) -> @kernel.Thm raise {
        evaluate(
          (fn(
            x177 : (
              (@kernel.Thm, Fterm[Db]),
              Stack[
                (
                  (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                  (@kernel.Thm, Fterm[Db]),
                ),
                (
                  (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
                  Bool,
                  (@kernel.Thm, Fterm[Db]),
                ),
                (@kernel.Thm) -> @kernel.Thm raise,
              ],
            ),
          ) -> @kernel.Thm raise {
            let ((th, _), stk) = x177
            stack_out((th, stk))
          })(x178),
        )
      })(cbv_wk(x179))
    })(((x180 : @kernel.Term) => initial_state(rws, x180))(x181))
  }
}

///|
/// `extern_of_conv`
pub fn[TA] extern_of_conv(
  x182 : Compset,
  x183 : (TA) -> @kernel.Thm raise,
  x184 : TA,
) -> (@kernel.Thm, Fterm[Db]) raise {
  let rws = x182
  let conv = x183
  let tm = x184
  let thm = conv(tm)
  (
    thm,
    mk_clos(
      @list.List([]),
      from_term(rws, @list.List([]), @equal.rhs(@kernel.concl(thm))),
    ),
  )
}

///|
/// `add_conv`
pub fn add_conv(
  x185 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
  x186 : Compset,
) -> Unit raise {
  let (cst, arity, conv) = x185
  let rws = x186
  add_extern(
    (cst, arity, (x187 : @kernel.Term) => extern_of_conv(rws, conv, x187)),
    rws,
  )
}

///|
/// `set_skip`
pub fn set_skip(
  x188 : Compset,
  x189 : @kernel.Term,
  x190 : Int64?,
) -> Unit raise {
  let compset = x188
  let c = x189
  let opt = x190
  try {
    let (name, _) = @kernel.dest_const(c)
    set_skip_name(compset)(name)(opt)
  } catch {
    _ => raise Failure("set_skip")
  }
}

///|
/// bool_redns
fn step_12() -> Unit raise {
  let t191 = @lib.map(
    lazyfy_thm,
    @list.List([
      @class.cond_clauses(),
      @class.cond_id(),
      @class.not_clauses(),
      @theorems.and_clauses(),
      @theorems.or_clauses(),
      @theorems.imp_clauses(),
      @theorems.eq_clauses(),
    ]),
  )
  bool_redns_c.set(t191.prepend(strictify_thm(@pair.let_def())))
}

///|
let bool_redns_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new(
  "bool_redns",
)

///|
/// `bool_redns`
pub fn bool_redns() -> @list.List[@kernel.Thm] {
  bool_redns_c.get()
}

///|
/// `bool_compset`
pub fn bool_compset(x192 : Unit) -> Compset raise {
  let _ = x192
  let base = from_list(bool_redns())
  match set_skip(base, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), None) {
    _ => base
  }
}

///|
/// `basic_compset`
pub fn basic_compset(x193 : Unit) -> Compset raise {
  let _ = x193
  let basic_rws0 = @simp.basic_rewrites()
  let lhs_lambda_rules = @lib.map(
    @bool.spec_all,
    @list.List([
      @class.select_refl(),
      @theorems.forall_simp(),
      @theorems.exists_simp(),
    ]),
  )
  let basic_rws = @lib.list_filter(
    fn(x194 : @kernel.Thm) -> Bool raise {
      let th = x194
      !@lib.mem(th, lhs_lambda_rules)
    },
    basic_rws0,
  )
  let cs = new_compset(@lib.map(lazyfy_thm, basic_rws))
  @lib.do_list(
    fn(
      x195 : (String, (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)),
    ) -> Unit raise {
      let (_, (pat, the_conv)) = x195
      let (cst, args) = @basics.strip_comb(pat)
      add_conv((cst, Int::to_int64(@lib.length(args)), the_conv), cs)
    },
    @simp.basic_convs(),
  )
  add_conv((@term_syntax.parse_term("(LET : ((A) -> B, A) -> B)"), 2L, @pair.let_conv), cs)
  set_skip(cs, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), None)
  cs
}

///|
/// the_compset
fn step_13() -> Unit raise {
  the_compset_c.set(bool_compset(()))
}

///|
let the_compset_c : @lib.Cell[Compset] = @lib.Cell::new("the_compset")

///|
/// `the_compset`
pub fn the_compset() -> Compset {
  the_compset_c.get()
}

///|
/// add_funs
fn step_14() -> Unit raise {
  add_funs_c.set(fn(x198 : @list.List[@kernel.Thm]) -> Unit raise {
    (fn(x196 : @list.List[@kernel.Thm]) -> ((Compset) -> Unit raise) raise {
      fn(x197 : Compset) -> Unit raise { add_thms(x196, x197) }
    })(x198)(the_compset())
  })
}

///|
let add_funs_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new(
  "add_funs",
)

///|
/// `add_funs`
pub fn add_funs(x : @list.List[@kernel.Thm]) -> Unit raise {
  add_funs_c.get()(x)
}

///|
/// add_convs
fn step_15() -> Unit raise {
  add_convs_c.set(x202 => {
    @lib.do_list(
      fn(
        x201 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
      ) -> Unit raise {
        (fn(
          x199 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
        ) -> ((Compset) -> Unit raise) raise {
          fn(x200 : Compset) -> Unit raise { add_conv(x199, x200) }
        })(x201)(the_compset())
      },
      x202,
    )
  })
}

///|
let add_convs_c : @lib.Cell[
  (@list.List[(@kernel.Term, Int64, @equal.Conv)]) -> Unit raise,
] = @lib.Cell::new("add_convs")

///|
/// `add_convs`
pub fn add_convs(
  x : @list.List[(@kernel.Term, Int64, @equal.Conv)],
) -> Unit raise {
  add_convs_c.get()(x)
}

///|
/// del_consts
fn step_16() -> Unit raise {
  let t203 = scrub_const(the_compset())
  del_consts_c.set(x204 => @lib.do_list(t203, x204))
}

///|
let del_consts_c : @lib.Cell[(@list.List[@kernel.Term]) -> Unit raise] = @lib.Cell::new(
  "del_consts",
)

///|
/// `del_consts`
pub fn del_consts(x : @list.List[@kernel.Term]) -> Unit raise {
  del_consts_c.get()(x)
}

///|
/// del_funs
fn step_17() -> Unit raise {
  del_funs_c.set(fn(x207 : @list.List[@kernel.Thm]) -> Unit raise {
    (fn(x205 : @list.List[@kernel.Thm]) -> ((Compset) -> Unit raise) raise {
      fn(x206 : Compset) -> Unit raise { scrub_thms(x205, x206) }
    })(x207)(the_compset())
  })
}

///|
let del_funs_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new(
  "del_funs",
)

///|
/// `del_funs`
pub fn del_funs(x : @list.List[@kernel.Thm]) -> Unit raise {
  del_funs_c.get()(x)
}

///|
/// EVAL_CONV
fn step_18() -> Unit raise {
  eval_conv_c.set(cbv_conv(the_compset()))
}

///|
let eval_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EVAL_CONV")

///|
/// `EVAL_CONV`
pub fn eval_conv(x : @kernel.Term) -> @kernel.Thm raise {
  eval_conv_c.get()(x)
}

///|
/// EVAL_RULE
fn step_19() -> Unit raise {
  eval_rule_c.set((x208 : @kernel.Thm) => @equal.conv_rule(eval_conv, x208))
}

///|
let eval_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "EVAL_RULE",
)

///|
/// `EVAL_RULE`
pub fn eval_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  eval_rule_c.get()(x)
}

///|
/// EVAL_TAC
fn step_20() -> Unit raise {
  eval_tac_c.set(@tactics.conv_tac(eval_conv))
}

///|
let eval_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("EVAL_TAC")

///|
/// `EVAL_TAC`
pub fn eval_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  eval_tac_c.get()(x)
}

///|
/// `same_const`
pub fn same_const(x209 : @kernel.Term, x210 : @kernel.Term) -> Bool raise {
  let c1 = x209
  let c2 = x210
  let t211 = @kernel.dest_const(c2).0
  @kernel.dest_const(c1).0 == t211
}

///|
/// `OR`
pub fn or(
  x212 : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> Bool raise) raise {
  match x212 {
    Empty => fn(x214 : @kernel.Term) -> Bool raise { false }
    More(x, tail=Empty) => (x216 : @kernel.Term) => same_const(x, x216)
    More(h, tail=t) =>
      fn(x217 : @kernel.Term) -> Bool raise {
        let x_1 = x217
        same_const(h, x_1) || or(t)(x_1)
      }
  }
}

///|
/// `RESTR_EVAL_CONV`
pub fn restr_eval_conv(
  x218 : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let clist = x218
  let t220 = (stoppers(), Some(or(clist)))
  (x221 : @kernel.Term) => with_flag(t220, eval_conv, x221)
}

///|
/// RESTR_EVAL_TAC
fn step_21() -> Unit raise {
  restr_eval_tac_c.set(fn(
    x225 : @list.List[@kernel.Term],
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
      x222 : (@kernel.Term) -> @kernel.Thm raise,
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
      let s223 = @tactics.conv_tac(x222)
      fn(
        x224 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s223(x224)
      }
    })(restr_eval_conv(x225))
  })
}

///|
let restr_eval_tac_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> @tactics.Tactic raise,
] = @lib.Cell::new("RESTR_EVAL_TAC")

///|
/// `RESTR_EVAL_TAC`
pub fn restr_eval_tac(x : @list.List[@kernel.Term]) -> @tactics.Tactic raise {
  restr_eval_tac_c.get()(x)
}

///|
/// RESTR_EVAL_RULE
fn step_22() -> Unit raise {
  restr_eval_rule_c.set(fn(
    x228 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    (fn(
      x226 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x227 : @kernel.Thm) -> @kernel.Thm raise {
        @equal.conv_rule(x226, x227)
      }
    })(restr_eval_conv(x228))
  })
}

///|
let restr_eval_rule_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("RESTR_EVAL_RULE")

///|
/// `RESTR_EVAL_RULE`
pub fn restr_eval_rule(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  restr_eval_rule_c.get()(x)
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
}
