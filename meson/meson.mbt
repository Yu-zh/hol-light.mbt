// Translated from upstream meson.ml; edit this file directly.

///|
/// meson_depth
fn step_1() -> Unit raise {
  meson_depth_c.set(Ref::{ val: false, })
}

///|
let meson_depth_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("meson_depth")

///|
/// `meson_depth`
pub fn meson_depth() -> Ref[Bool] {
  meson_depth_c.get()
}

///|
/// meson_prefine
fn step_2() -> Unit raise {
  meson_prefine_c.set(Ref::{ val: true, })
}

///|
let meson_prefine_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("meson_prefine")

///|
/// `meson_prefine`
pub fn meson_prefine() -> Ref[Bool] {
  meson_prefine_c.get()
}

///|
/// meson_dcutin
fn step_3() -> Unit raise {
  meson_dcutin_c.set(Ref::{ val: 1L, })
}

///|
let meson_dcutin_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("meson_dcutin")

///|
/// `meson_dcutin`
pub fn meson_dcutin() -> Ref[Int64] {
  meson_dcutin_c.get()
}

///|
/// meson_skew
fn step_4() -> Unit raise {
  meson_skew_c.set(Ref::{ val: 3L, })
}

///|
let meson_skew_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("meson_skew")

///|
/// `meson_skew`
pub fn meson_skew() -> Ref[Int64] {
  meson_skew_c.get()
}

///|
/// meson_brand
fn step_5() -> Unit raise {
  meson_brand_c.set(Ref::{ val: false, })
}

///|
let meson_brand_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("meson_brand")

///|
/// `meson_brand`
pub fn meson_brand() -> Ref[Bool] {
  meson_brand_c.get()
}

///|
/// meson_split_limit
fn step_6() -> Unit raise {
  meson_split_limit_c.set(Ref::{ val: 8L, })
}

///|
let meson_split_limit_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new(
  "meson_split_limit",
)

///|
/// `meson_split_limit`
pub fn meson_split_limit() -> Ref[Int64] {
  meson_split_limit_c.get()
}

///|
/// meson_chatty
fn step_7() -> Unit raise {
  meson_chatty_c.set(Ref::{ val: false, })
}

///|
let meson_chatty_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("meson_chatty")

///|
/// `meson_chatty`
pub fn meson_chatty() -> Ref[Bool] {
  meson_chatty_c.get()
}

///|
/// `exception Cut`
pub(all) suberror Cut {
  Cut
}

///|
/// `fol_term`
pub(all) enum FolTerm {
  Fvar(Int64)
  Fnapp(Int64, @list.List[FolTerm])
} derive(Eq, Debug)

///|
pub extend FolTerm with Eq::{not_equal, equal}

///|
pub extend FolTerm with Debug::{to_repr}

///|
pub extend FolTerm with @lib.OCompare::{ocompare}

///|
pub extend FolTerm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_FolTerm(x : FolTerm) -> Int {
  match x {
    Fvar(_) => 1000000
    Fnapp(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for FolTerm with fn ocompare(self, other) {
  match (self, other) {
    (Fvar(a0), Fvar(b0)) => @lib.compare(a0, b0)
    (Fnapp(a0, a1), Fnapp(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_FolTerm(self).compare(ocaml_rank_FolTerm(other))
  }
}

///|
pub impl @lib.OHash for FolTerm with fn ohash_visit(self, h) {
  match self {
    Fvar(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Fnapp(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `fol_atom`
pub type FolAtom = (Int64, @list.List[FolTerm])

///|
/// `fol_form`
pub(all) enum FolForm {
  Atom(FolAtom)
  Conj(FolForm, FolForm)
  Disj(FolForm, FolForm)
  Forallq(Int64, FolForm)
} derive(Eq, Debug)

///|
pub extend FolForm with Eq::{not_equal, equal}

///|
pub extend FolForm with Debug::{to_repr}

///|
pub extend FolForm with @lib.OCompare::{ocompare}

///|
pub extend FolForm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_FolForm(x : FolForm) -> Int {
  match x {
    Atom(_) => 1000000
    Conj(_, _) => 1000001
    Disj(_, _) => 1000002
    Forallq(_, _) => 1000003
  }
}

///|
pub impl @lib.OCompare for FolForm with fn ocompare(self, other) {
  match (self, other) {
    (Atom(a0), Atom(b0)) => @lib.compare(a0, b0)
    (Conj(a0, a1), Conj(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Disj(a0, a1), Disj(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Forallq(a0, a1), Forallq(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_FolForm(self).compare(ocaml_rank_FolForm(other))
  }
}

///|
pub impl @lib.OHash for FolForm with fn ohash_visit(self, h) {
  match self {
    Atom(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Conj(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    Disj(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
    Forallq(a0, a1) => {
      h.block(3, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `fol_goal`
pub(all) enum FolGoal {
  Subgoal(
    FolAtom,
    @list.List[FolGoal],
    (Int64, @kernel.Thm),
    Int64,
    @list.List[(FolTerm, Int64)]
  )
} derive(Eq, Debug)

///|
pub extend FolGoal with Eq::{not_equal, equal}

///|
pub extend FolGoal with Debug::{to_repr}

///|
pub extend FolGoal with @lib.OCompare::{ocompare}

///|
pub extend FolGoal with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_FolGoal(x : FolGoal) -> Int {
  match x {
    Subgoal(_, _, _, _, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for FolGoal with fn ocompare(self, other) {
  match (self, other) {
    (Subgoal(a0, a1, a2, a3, a4), Subgoal(b0, b1, b2, b3, b4)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a2, b2)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a3, b3)
      if c != 0 {
        return c
      }
      @lib.compare(a4, b4)
    }
    _ => ocaml_rank_FolGoal(self).compare(ocaml_rank_FolGoal(other))
  }
}

///|
pub impl @lib.OHash for FolGoal with fn ohash_visit(self, h) {
  match self {
    Subgoal(a0, a1, a2, a3, a4) => {
      h.block(0, 5)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
      h.field(a4)
    }
  }
}

///|
/// offinc
fn step_8() -> Unit raise {
  offinc_c.set(10000L)
}

///|
let offinc_c : @lib.Cell[Int64] = @lib.Cell::new("offinc")

///|
/// `offinc`
pub fn offinc() -> Int64 {
  offinc_c.get()
}

///|
/// inferences
fn step_9() -> Unit raise {
  inferences_c.set(Ref::{ val: 0L, })
}

///|
let inferences_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("inferences")

///|
/// `inferences`
pub fn inferences() -> Ref[Int64] {
  inferences_c.get()
}

///|
/// `mk_negated`
pub fn[TA] mk_negated(x1 : Int64, x2 : TA) -> (Int64, TA) raise {
  let (p, a) = (x1, x2)
  (@lib.neg63(p), a)
}

///|
/// `qpartition`
pub fn[TA] qpartition(
  x3 : (TA) -> Bool raise,
  x4 : @list.List[TA],
) -> ((@list.List[TA]) -> (@list.List[TA], @list.List[TA]) raise) raise {
  let p = x3
  let m = x4
  fn qpartition_1(
    x6 : @list.List[TA],
  ) -> (@list.List[TA], @list.List[TA]) raise {
    let l = x6
    if physical_equal(l, m) {
      raise @lib.Unchanged
    } else {
      match l {
        Empty => raise @lib.Unchanged
        More(h, tail=t) =>
          if p(h) {
            try {
              let (yes, no) = qpartition_1(t)
              (yes.prepend(h), no)
            } catch {
              @lib.Unchanged => (@list.List([h]), t)
              e => raise e
            }
          } else {
            let (yes_1, no_1) = qpartition_1(t)
            (yes_1, no_1.prepend(h))
          }
      }
    }
  }
  fn(x7 : @list.List[TA]) -> (@list.List[TA], @list.List[TA]) raise {
    let l_1 = x7
    qpartition_1(l_1) catch {
      @lib.Unchanged => (@list.List([]), l_1)
      e => raise e
    }
  }
}

///|
let reset_vars_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "reset_vars",
)

///|
/// `reset_vars`
pub fn reset_vars(x : Unit) -> Unit raise {
  reset_vars_c.get()(x)
}

///|
let fol_of_var_c : @lib.Cell[(@kernel.Term) -> Int64 raise] = @lib.Cell::new(
  "fol_of_var",
)

///|
/// `fol_of_var`
pub fn fol_of_var(x : @kernel.Term) -> Int64 raise {
  fol_of_var_c.get()(x)
}

///|
let hol_of_var_c : @lib.Cell[(Int64) -> @kernel.Term raise] = @lib.Cell::new(
  "hol_of_var",
)

///|
/// `hol_of_var`
pub fn hol_of_var(x : Int64) -> @kernel.Term raise {
  hol_of_var_c.get()(x)
}

///|
/// reset_vars, fol_of_var, hol_of_var
fn step_10() -> Unit raise {
  let vstore = Ref::{ val: @list.List([]), }
  let gstore = Ref::{ val: @list.List([]), }
  let vcounter = Ref::{ val: 0L, }
  let inc_vcounter : (Unit) -> Int64 raise = fn(x8 : Unit) -> Int64 raise {
    let _ = x8
    let n = vcounter.val
    let m = @lib.add63(n, 1L)
    if m >= offinc() {
      raise Failure("inc_vcounter: too many variables")
    } else {
      {
        vcounter.val = m
        ()
      }
      n
    }
  }
  let reset_vars : (Unit) -> Unit raise = fn(x9 : Unit) -> Unit raise {
    let _ = x9
    {
      vstore.val = @list.List([])
      ()
    }
    {
      gstore.val = @list.List([])
      ()
    }
    vcounter.val = 0L
    ()
  }
  let fol_of_var : (@kernel.Term) -> Int64 raise = fn(
    x10 : @kernel.Term,
  ) -> Int64 raise {
    let v = x10
    let currentvars = vstore.val
    @lib.assoc(v, currentvars) catch {
      Failure(_) => {
        let n_1 = inc_vcounter(())
        {
          vstore.val = currentvars.prepend((v, n_1))
          ()
        }
        n_1
      }
      e => raise e
    }
  }
  let hol_of_var : (Int64) -> @kernel.Term raise = fn(
    x11 : Int64,
  ) -> @kernel.Term raise {
    let v_1 = x11
    @lib.rev_assoc(v_1, vstore.val) catch {
      Failure(_) => @lib.rev_assoc(v_1, gstore.val)
      e => raise e
    }
  }
  let hol_of_bumped_var : (Int64) -> @kernel.Term raise = fn(
    x12 : Int64,
  ) -> @kernel.Term raise {
    let v_2 = x12
    hol_of_var(v_2) catch {
      Failure(_) => {
        let v_p = @lib.mod63(v_2, offinc())
        let hv_p = hol_of_var(v_p)
        let gv = @basics.genvar(@kernel.type_of(hv_p))
        {
          gstore.val = gstore.val.prepend((gv, v_2))
          ()
        }
        gv
      }
      e => raise e
    }
  }
  let (reset_vars_1, fol_of_var_1, hol_of_var_1) = (
    reset_vars, fol_of_var, hol_of_bumped_var,
  )
  reset_vars_c.set(reset_vars_1)
  fol_of_var_c.set(fol_of_var_1)
  hol_of_var_c.set(hol_of_var_1)
}

///|
let reset_consts_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "reset_consts",
)

///|
/// `reset_consts`
pub fn reset_consts(x : Unit) -> Unit raise {
  reset_consts_c.get()(x)
}

///|
let fol_of_const_c : @lib.Cell[(@kernel.Term) -> Int64 raise] = @lib.Cell::new(
  "fol_of_const",
)

///|
/// `fol_of_const`
pub fn fol_of_const(x : @kernel.Term) -> Int64 raise {
  fol_of_const_c.get()(x)
}

///|
let hol_of_const_c : @lib.Cell[(Int64) -> @kernel.Term raise] = @lib.Cell::new(
  "hol_of_const",
)

///|
/// `hol_of_const`
pub fn hol_of_const(x : Int64) -> @kernel.Term raise {
  hol_of_const_c.get()(x)
}

///|
/// reset_consts, fol_of_const, hol_of_const
fn step_11() -> Unit raise {
  let false_tm = @term_syntax.parse_term("false")
  let cstore = Ref::{ val: @list.List([]), }
  let ccounter = Ref::{ val: 2L, }
  let reset_consts : (Unit) -> Unit raise = fn(x13 : Unit) -> Unit raise {
    let _ = x13
    {
      cstore.val = @list.List([(false_tm, 1L)])
      ()
    }
    ccounter.val = 2L
    ()
  }
  let fol_of_const : (@kernel.Term) -> Int64 raise = fn(
    x14 : @kernel.Term,
  ) -> Int64 raise {
    let c = x14
    let currentconsts = cstore.val
    @lib.assoc(c, currentconsts) catch {
      Failure(_) => {
        let n = ccounter.val
        {
          ccounter.val = @lib.add63(n, 1L)
          ()
        }
        {
          cstore.val = currentconsts.prepend((c, n))
          ()
        }
        n
      }
      e => raise e
    }
  }
  let hol_of_const : (Int64) -> @kernel.Term raise = fn(
    x15 : Int64,
  ) -> @kernel.Term raise {
    let c_1 = x15
    @lib.rev_assoc(c_1, cstore.val)
  }
  let (reset_consts_1, fol_of_const_1, hol_of_const_1) = (
    reset_consts, fol_of_const, hol_of_const,
  )
  reset_consts_c.set(reset_consts_1)
  fol_of_const_c.set(fol_of_const_1)
  hol_of_const_c.set(hol_of_const_1)
}

///|
/// `fol_of_term`
pub fn fol_of_term(
  x16 : @list.List[@kernel.Term],
  x17 : @list.List[@kernel.Term],
  x18 : @kernel.Term,
) -> FolTerm raise {
  let env = x16
  let consts = x17
  let tm = x18
  if @kernel.is_var(tm) && !@lib.mem(tm, consts) {
    FolTerm::Fvar(fol_of_var(tm))
  } else {
    let (f, args) = @basics.strip_comb(tm)
    if @lib.mem(f, env) {
      raise Failure("fol_of_term: higher order")
    } else {
      let ff = fol_of_const(f)
      FolTerm::Fnapp(
        ff,
        @lib.map((x19 : @kernel.Term) => fol_of_term(env, consts, x19), args),
      )
    }
  }
}

///|
/// `fol_of_atom`
pub fn fol_of_atom(
  x20 : @list.List[@kernel.Term],
  x21 : @list.List[@kernel.Term],
  x22 : @kernel.Term,
) -> (Int64, @list.List[FolTerm]) raise {
  let env = x20
  let consts = x21
  let tm = x22
  let (f, args) = @basics.strip_comb(tm)
  if @lib.mem(f, env) {
    raise Failure("fol_of_atom: higher order")
  } else {
    let ff = fol_of_const(f)
    (ff, @lib.map((x23 : @kernel.Term) => fol_of_term(env, consts, x23), args))
  }
}

///|
/// `fol_of_literal`
pub fn fol_of_literal(
  x24 : @list.List[@kernel.Term],
  x25 : @list.List[@kernel.Term],
  x26 : @kernel.Term,
) -> (Int64, @list.List[FolTerm]) raise {
  let env = x24
  let consts = x25
  let tm = x26
  try {
    let tm_p = @basics.dest_neg(tm)
    let (p, a) = fol_of_atom(env, consts, tm_p)
    (@lib.neg63(p), a)
  } catch {
    Failure(_) => fol_of_atom(env, consts, tm)
    e => raise e
  }
}

///|
/// `fol_of_form`
pub fn fol_of_form(
  x27 : @list.List[@kernel.Term],
  x28 : @list.List[@kernel.Term],
  x29 : @kernel.Term,
) -> FolForm raise {
  let env = x27
  let consts = x28
  let tm = x29
  try {
    let (v, bod) = @basics.dest_forall(tm)
    let fv = fol_of_var(v)
    let fbod = fol_of_form(
      env.prepend(v),
      @lib.subtract(consts, @list.List([v])),
      bod,
    )
    FolForm::Forallq(fv, fbod)
  } catch {
    Failure(_) =>
      try {
        let (l, r) = @basics.dest_conj(tm)
        let fl = fol_of_form(env, consts, l)
        let fr = fol_of_form(env, consts, r)
        FolForm::Conj(fl, fr)
      } catch {
        Failure(_) =>
          try {
            let (l_1, r_1) = @basics.dest_disj(tm)
            let fl_1 = fol_of_form(env, consts, l_1)
            let fr_1 = fol_of_form(env, consts, r_1)
            FolForm::Disj(fl_1, fr_1)
          } catch {
            Failure(_) => FolForm::Atom(fol_of_literal(env, consts, tm))
            e => raise e
          }
        e => raise e
      }
    e => raise e
  }
}

///|
/// `hol_of_term`
pub fn hol_of_term(x30 : FolTerm) -> @kernel.Term raise {
  let tm = x30
  match tm {
    FolTerm::Fvar(v) => hol_of_var(v)
    FolTerm::Fnapp(f, args) => {
      let t31 = @lib.map(hol_of_term, args)
      @basics.list_mk_comb(hol_of_const(f), t31)
    }
  }
}

///|
/// `hol_of_atom`
pub fn hol_of_atom(
  x32 : Int64,
  x33 : @list.List[FolTerm],
) -> @kernel.Term raise {
  let (p, args) = (x32, x33)
  let t34 = @lib.map(hol_of_term, args)
  @basics.list_mk_comb(hol_of_const(p), t34)
}

///|
/// `hol_of_literal`
pub fn hol_of_literal(
  x35 : Int64,
  x36 : @list.List[FolTerm],
) -> @kernel.Term raise {
  let (p, args) = (x35, x36)
  if p < 0L {
    @bool.mk_neg(hol_of_atom(@lib.neg63(p), args))
  } else {
    hol_of_atom(p, args)
  }
}

///|
/// `fol_free_in`
pub fn fol_free_in(x37 : Int64, x38 : FolTerm) -> Bool raise {
  let v = x37
  let tm = x38
  match tm {
    FolTerm::Fvar(x) => x == v
    FolTerm::Fnapp(_, lis) =>
      @lib.exists((x39 : FolTerm) => fol_free_in(v, x39), lis)
  }
}

///|
/// `fol_subst`
pub fn fol_subst(
  x40 : @list.List[(FolTerm, Int64)],
  x41 : FolTerm,
) -> FolTerm raise {
  let theta = x40
  let tm = x41
  match tm {
    FolTerm::Fvar(v) => @lib.rev_assocd(v, theta, tm)
    FolTerm::Fnapp(f, args) => {
      let args_p = @lib.qmap((x42 : FolTerm) => fol_subst(theta, x42), args)
      if physical_equal(args_p, args) {
        tm
      } else {
        FolTerm::Fnapp(f, args_p)
      }
    }
  }
}

///|
/// `fol_inst`
pub fn fol_inst(
  x43 : @list.List[(FolTerm, Int64)],
  x44 : (Int64, @list.List[FolTerm]),
) -> (Int64, @list.List[FolTerm]) raise {
  let theta = x43
  let (p, args) as at = x44
  let args_p = @lib.qmap((x45 : FolTerm) => fol_subst(theta, x45), args)
  if physical_equal(args_p, args) {
    at
  } else {
    (p, args_p)
  }
}

///|
/// `fol_subst_bump`
pub fn fol_subst_bump(
  x46 : Int64,
  x47 : @list.List[(FolTerm, Int64)],
  x48 : FolTerm,
) -> FolTerm raise {
  let offset = x46
  let theta = x47
  let tm = x48
  match tm {
    FolTerm::Fvar(v) =>
      if v < offinc() {
        let v_p = @lib.add63(v, offset)
        @lib.rev_assocd(v_p, theta, FolTerm::Fvar(v_p))
      } else {
        @lib.rev_assocd(v, theta, tm)
      }
    FolTerm::Fnapp(f, args) => {
      let args_p = @lib.qmap(
        (x49 : FolTerm) => fol_subst_bump(offset, theta, x49),
        args,
      )
      if physical_equal(args_p, args) {
        tm
      } else {
        FolTerm::Fnapp(f, args_p)
      }
    }
  }
}

///|
/// `fol_inst_bump`
pub fn fol_inst_bump(
  x50 : Int64,
  x51 : @list.List[(FolTerm, Int64)],
  x52 : (Int64, @list.List[FolTerm]),
) -> (Int64, @list.List[FolTerm]) raise {
  let offset = x50
  let theta = x51
  let (p, args) as at = x52
  let args_p = @lib.qmap(
    (x53 : FolTerm) => fol_subst_bump(offset, theta, x53),
    args,
  )
  if physical_equal(args_p, args) {
    at
  } else {
    (p, args_p)
  }
}

///|
/// `istriv`
pub fn istriv(
  x54 : @list.List[(FolTerm, Int64)],
  x55 : Int64,
  x56 : FolTerm,
) -> Bool raise {
  let env = x54
  let x = x55
  let t = x56
  match t {
    FolTerm::Fvar(y) =>
      y == x ||
      (try {
        let t_p = @lib.rev_assoc(y, env)
        istriv(env, x, t_p)
      } catch {
        Failure("find") => false
        e => raise e
      })
    FolTerm::Fnapp(f, args) =>
      @lib.exists((x57 : FolTerm) => istriv(env, x, x57), args) &&
      @lib.raise_error(Failure("cyclic"))
  }
}

///|
/// `fol_unify`
pub fn fol_unify(
  x58 : Int64,
  x59 : FolTerm,
  x60 : FolTerm,
  x61 : @list.List[(FolTerm, Int64)],
) -> @list.List[(FolTerm, Int64)] raise {
  let offset = x58
  let tm1 = x59
  let tm2 = x60
  let sofar = x61
  match (tm1, tm2) {
    (FolTerm::Fnapp(f, fargs), FolTerm::Fnapp(g, gargs)) =>
      if f != g {
        raise Failure("")
      } else {
        @lib.itlist2(
          (x62 : FolTerm, x63 : FolTerm, x64 : @list.List[(FolTerm, Int64)]) => {
            fol_unify(offset, x62, x63, x64)
          },
          fargs,
          gargs,
          sofar,
        )
      }
    (_, FolTerm::Fvar(x)) => {
      let x_p = @lib.add63(x, offset)
      try {
        let tm2_p = @lib.rev_assoc(x_p, sofar)
        fol_unify(0L, tm1, tm2_p, sofar)
      } catch {
        Failure("find") =>
          if istriv(sofar, x_p, tm1) {
            sofar
          } else {
            sofar.prepend((tm1, x_p))
          }
        e => raise e
      }
    }
    (FolTerm::Fvar(x_1), _) =>
      try {
        let tm1_p = @lib.rev_assoc(x_1, sofar)
        fol_unify(offset, tm1_p, tm2, sofar)
      } catch {
        Failure("find") => {
          let tm2_p_1 = fol_subst_bump(offset, @list.List([]), tm2)
          if istriv(sofar, x_1, tm2_p_1) {
            sofar
          } else {
            sofar.prepend((tm2_p_1, x_1))
          }
        }
        e => raise e
      }
  }
}

///|
/// `fol_eq`
pub fn fol_eq(
  x65 : @list.List[(FolTerm, Int64)],
  x66 : FolTerm,
  x67 : FolTerm,
) -> Bool raise {
  let insts = x65
  let tm1 = x66
  let tm2 = x67
  physical_equal(tm1, tm2) ||
  (match (tm1, tm2) {
    (FolTerm::Fnapp(f, fargs), FolTerm::Fnapp(g, gargs)) =>
      f == g &&
      @lib.forall2(
        (x68 : FolTerm, x69 : FolTerm) => fol_eq(insts, x68, x69),
        fargs,
        gargs,
      )
    (_, FolTerm::Fvar(x)) =>
      try {
        let tm2_p = @lib.rev_assoc(x, insts)
        fol_eq(insts, tm1, tm2_p)
      } catch {
        Failure("find") =>
          istriv(insts, x, tm1) catch {
            Failure(_) => false
            e => raise e
          }
        e => raise e
      }
    (FolTerm::Fvar(x_1), _) =>
      try {
        let tm1_p = @lib.rev_assoc(x_1, insts)
        fol_eq(insts, tm1_p, tm2)
      } catch {
        Failure("find") =>
          istriv(insts, x_1, tm2) catch {
            Failure(_) => false
            e => raise e
          }
        e => raise e
      }
  })
}

///|
/// `fol_atom_eq`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] fol_atom_eq(
  x70 : @list.List[(FolTerm, Int64)],
  x71 : (TA, @list.List[FolTerm]),
  x72 : (TA, @list.List[FolTerm]),
) -> Bool raise {
  let insts = x70
  let (p1, args1) = x71
  let (p2, args2) = x72
  p1 == p2 &&
  @lib.forall2(
    (x73 : FolTerm, x74 : FolTerm) => fol_eq(insts, x73, x74),
    args1,
    args2,
  )
}

///|
/// `cacheconts`
pub fn[
  TA,
  TB,
  TC : Eq + @lib.OCompare + @lib.OHash,
  TD,
  TE : Eq + @lib.OCompare + @lib.OHash,
] cacheconts(
  x75 : ((TB, (TC, TD, TE))) -> TA raise,
) -> (((TB, (TC, TD, TE))) -> TA raise) raise {
  let f = x75
  let memory = Ref::{ val: @list.List([]), }
  fn(x77 : (TB, (TC, TD, TE))) -> TA raise {
    let (gg, (insts, offset, size)) as input = x77
    if @lib.exists(
        fn(x78 : (TB, (TC, TD, TE))) -> Bool raise {
          let (_, (insts_p, _, size_p)) = x78
          insts == insts_p &&
          (@lib.compare(size, size_p) <= 0 || meson_depth().val)
        },
        memory.val,
      ) {
      raise Failure("cachecont")
    } else {
      memory.val = memory.val.prepend(input)
      ()
    }
    f(input)
  }
}

///|
/// `checkan`
pub fn[TA, TB] checkan(
  x79 : @list.List[(FolTerm, Int64)],
  x80 : (Int64, @list.List[FolTerm]),
  x81 : @list.List[
    (Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)]),
  ],
) -> @list.List[(Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)])] raise {
  let insts = x79
  let (p, a) = x80
  let ancestors = x81
  let p_p = @lib.neg63(p)
  let t_p = (p_p, a)
  try {
    let ours = @lib.assoc(p_p, ancestors)
    if @lib.exists(
        fn(x82 : ((TA, (Int64, @list.List[FolTerm])), TB)) -> Bool raise {
          let u = x82
          fol_atom_eq(insts, t_p, u.0.1)
        },
        ours,
      ) {
      raise Failure("checkan")
    } else {
      ancestors
    }
  } catch {
    Failure("find") => ancestors
    e => raise e
  }
}

///|
/// `insertan`
pub fn[TA] insertan(
  x83 : @list.List[(FolTerm, Int64)],
  x84 : (Int64, @list.List[FolTerm]),
  x85 : @list.List[
    (
      Int64,
      @list.List[
        ((@list.List[TA], (Int64, @list.List[FolTerm])), (Int64, @kernel.Thm)),
      ],
    ),
  ],
) -> @list.List[
  (
    Int64,
    @list.List[
      ((@list.List[TA], (Int64, @list.List[FolTerm])), (Int64, @kernel.Thm)),
    ],
  ),
] raise {
  let insts = x83
  let (p, a) = x84
  let ancestors = x85
  let p_p = @lib.neg63(p)
  let t_p = (p_p, a)
  let (ourancp, otheranc) = @lib.remove(
    fn(
      x86 : (
        Int64,
        @list.List[
          ((@list.List[TA], (Int64, @list.List[FolTerm])), (Int64, @kernel.Thm)),
        ],
      ),
    ) -> Bool raise {
      let (pr, _) = x86
      pr == p_p
    },
    ancestors,
  ) catch {
    Failure(_) => ((p_p, @list.List([])), ancestors)
    e => raise e
  }
  let ouranc = ourancp.1
  if @lib.exists(
      fn(
        x87 : (
          (@list.List[TA], (Int64, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ) -> Bool raise {
        let u = x87
        fol_atom_eq(insts, t_p, u.0.1)
      },
      ouranc,
    ) {
    raise Failure("insertan: loop")
  } else {
    otheranc.prepend(
      (p_p, ouranc.prepend(((@list.List([]), t_p), (0L, @bool.truth())))),
    )
  }
}

///|
/// `fol_subst_partial`
pub fn fol_subst_partial(
  x88 : @list.List[(FolTerm, Int64)],
  x89 : FolTerm,
) -> FolTerm raise {
  let insts = x88
  let tm = x89
  match tm {
    FolTerm::Fvar(v) =>
      try {
        let t = @lib.rev_assoc(v, insts)
        fol_subst_partial(insts, t)
      } catch {
        Failure("find") => tm
        e => raise e
      }
    FolTerm::Fnapp(f, args) =>
      FolTerm::Fnapp(
        f,
        @lib.map((x90 : FolTerm) => fol_subst_partial(insts, x90), args),
      )
  }
}

///|
/// `separate_insts`
pub fn separate_insts(
  x91 : Int64,
  x92 : @list.List[(FolTerm, Int64)],
  x93 : @list.List[(FolTerm, Int64)],
) -> (@list.List[(FolTerm, Int64)], @list.List[(FolTerm, Int64)]) raise {
  let offset = x91
  let oldinsts = x92
  let newinsts = x93
  let (locins, globins) = qpartition(
    fn(x94 : (FolTerm, Int64)) -> Bool raise {
      let (_, v) = x94
      offset <= v
    },
    oldinsts,
  )(newinsts)
  if globins == oldinsts {
    (
      @lib.map(
        fn(x95 : (FolTerm, Int64)) -> (FolTerm, Int64) raise {
          let (t, x) = x95
          (fol_subst_partial(newinsts, t), x)
        },
        locins,
      ),
      oldinsts,
    )
  } else {
    let t98 = @lib.map(
      fn(x97 : (FolTerm, Int64)) -> (FolTerm, Int64) raise {
        let (t_2, x_2) = x97
        (fol_subst_partial(newinsts, t_2), x_2)
      },
      globins,
    )
    (
      @lib.map(
        fn(x96 : (FolTerm, Int64)) -> (FolTerm, Int64) raise {
          let (t_1, x_1) = x96
          (fol_subst_partial(newinsts, t_1), x_1)
        },
        locins,
      ),
      t98,
    )
  }
}

///|
/// `meson_single_expand`
pub fn[TA, TB, TC, TD, TE] meson_single_expand(
  x99 : Int64,
  x100 : (
    (@list.List[(Int64, @list.List[FolTerm])], (TC, @list.List[FolTerm])),
    TD,
  ),
  x101 : (
    (
      (TE, @list.List[FolTerm]),
      @list.List[(Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)])],
    ),
    (@list.List[(FolTerm, Int64)], Int64, Int64),
  ),
) -> (
  @list.List[
    (
      (Int64, @list.List[FolTerm]),
      @list.List[(Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)])],
    ),
  ],
  (@list.List[(FolTerm, Int64)], Int64, Int64),
) raise {
  let loffset = x99
  let rule = x100
  let ((g, ancestors), (insts, offset, size)) = x101
  let ((hyps, conc), tag) = rule
  let allins = @lib.rev_itlist2(
    (x102 : FolTerm, x103 : FolTerm, x104 : @list.List[(FolTerm, Int64)]) => {
      fol_unify(loffset, x102, x103, x104)
    },
    g.1,
    conc.1,
    insts,
  )
  let (locin, globin) = separate_insts(offset, insts, allins)
  let mk_ihyp : ((Int64, @list.List[FolTerm])) -> (
    (Int64, @list.List[FolTerm]),
    @list.List[(Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)])],
  ) raise = fn(
    x105 : (Int64, @list.List[FolTerm]),
  ) -> (
    (Int64, @list.List[FolTerm]),
    @list.List[(Int64, @list.List[((TA, (Int64, @list.List[FolTerm])), TB)])],
  ) raise {
    let h = x105
    let h_p = fol_inst_bump(offset, locin, h)
    (h_p, checkan(insts, h_p, ancestors))
  }
  let newhyps = @lib.map(mk_ihyp, hyps)
  {
    inferences().val = @lib.add63(inferences().val, 1L)
    ()
  }
  let t106 = @lib.sub63(size, Int::to_int64(@lib.length(hyps)))
  (newhyps, (globin, @lib.add63(offset, offinc()), t106))
}

///|
/// `meson_expand_cont`
pub fn[TA, TB, TC, TD, TE, TF] meson_expand_cont(
  x107 : Int64,
  x108 : @list.List[
    ((@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])), TC),
  ],
  x109 : (
    (
      (TD, @list.List[FolTerm]),
      @list.List[(Int64, @list.List[((TE, (Int64, @list.List[FolTerm])), TF)])],
    ),
    (@list.List[(FolTerm, Int64)], Int64, Int64),
  ),
  x110 : (TC) -> ((
    (
      @list.List[
        (
          (Int64, @list.List[FolTerm]),
          @list.List[
            (Int64, @list.List[((TE, (Int64, @list.List[FolTerm])), TF)]),
          ],
        ),
      ],
      (@list.List[(FolTerm, Int64)], Int64, Int64),
    ),
  ) -> TA raise) raise,
) -> TA raise {
  let loffset = x107
  let rules = x108
  let state = x109
  let cont = x110
  @lib.tryfind(
    fn(
      x111 : (
        (@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])),
        TC,
      ),
    ) -> TA raise {
      let r = x111
      let t112 = meson_single_expand(loffset, r, state)
      cont(r.1)(t112)
    },
    rules,
  )
}

///|
/// `meson_expand`
pub fn[TA, TB] meson_expand(
  x113 : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
  x114 : (
    (
      (Int64, @list.List[FolTerm]),
      @list.List[
        (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ],
    ),
    (@list.List[(FolTerm, Int64)], Int64, Int64),
  ),
  x115 : ((Int64, @kernel.Thm)) -> ((
    (
      @list.List[
        (
          (Int64, @list.List[FolTerm]),
          @list.List[
            (
              Int64,
              @list.List[
                (
                  (
                    @list.List[(Int64, @list.List[FolTerm])],
                    (Int64, @list.List[FolTerm]),
                  ),
                  (Int64, @kernel.Thm),
                ),
              ],
            ),
          ],
        ),
      ],
      (@list.List[(FolTerm, Int64)], Int64, Int64),
    ),
  ) -> TA raise) raise,
) -> TA raise {
  let rules = x113
  let ((g, ancestors), (insts, offset, size) as tup) = x114
  let cont = x115
  let pr = g.0
  let newancestors = insertan(insts, g, ancestors)
  let newstate = ((g, newancestors), tup)
  try {
    if meson_prefine().val && pr > 0L {
      raise Failure("meson_expand")
    } else {
      let arules = @lib.assoc(pr, ancestors)
      meson_expand_cont(0L, arules, newstate, cont)
    }
  } catch {
    Cut::Cut => raise Failure("meson_expand")
    Failure(_) =>
      try {
        let crules = @lib.filter(
          fn(
            x116 : (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (TB, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ) -> Bool raise {
            let ((h, _), _) = x116
            Int::to_int64(@lib.length(h)) <= size
          },
          @lib.assoc(pr, rules),
        )
        meson_expand_cont(offset, crules, newstate, cont)
      } catch {
        Cut::Cut => raise Failure("meson_expand")
        Failure(_) => raise Failure("meson_expand")
        e => raise e
      }
    e => raise e
  }
}

///|
/// `expand_goal`
pub fn[TA, TB] expand_goal(
  x117 : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
) -> ((
  (
    FolAtom,
    @list.List[
      (
        Int64,
        @list.List[
          (
            (@list.List[FolAtom], (Int64, @list.List[FolTerm])),
            (Int64, @kernel.Thm),
          ),
        ],
      ),
    ],
  ),
) -> ((Int64) -> ((Int64) -> ((
  ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TA raise,
) -> TA raise) raise) raise) raise) raise {
  let rules = x117
  fn(
    x139 : (
      (Int64, @list.List[FolTerm]),
      @list.List[
        (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ],
    ),
  ) -> ((Int64) -> ((Int64) -> ((
    ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TA raise,
  ) -> TA raise) raise) raise) raise {
    let g_3 = x139
    fn(
      x140 : Int64,
    ) -> ((Int64) -> ((
      ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TA raise,
    ) -> TA raise) raise) raise {
      let maxdep = x140
      fn(
        x141 : Int64,
      ) -> ((
        ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TA raise,
      ) -> TA raise) raise {
        let maxinf = x141
        fn(
          x142 : ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TA raise,
        ) -> TA raise {
          let cont_2 = x142
          ((x119, x120, x121) => expand_goal_1_l(rules, x119, x120, x121))(
            maxdep,
            (g_3, (@list.List([]), @lib.mul63(2L, offinc()), maxinf)),
            cont_2,
          )
        }
      }
    }
  }
}

///|
fn[TB, TC] expand_goal_1_l(
  rules : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
  x119 : Int64,
  x120 : (
    (
      (Int64, @list.List[FolTerm]),
      @list.List[
        (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ],
    ),
    (@list.List[(FolTerm, Int64)], Int64, Int64),
  ),
  x121 : ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TC raise,
) -> TC raise {
  let expand_goals = (
    x126 : Int64,
    x127 : (
      @list.List[
        (
          (Int64, @list.List[FolTerm]),
          @list.List[
            (
              Int64,
              @list.List[
                (
                  (
                    @list.List[(Int64, @list.List[FolTerm])],
                    (Int64, @list.List[FolTerm]),
                  ),
                  (Int64, @kernel.Thm),
                ),
              ],
            ),
          ],
        ),
      ],
      (@list.List[(FolTerm, Int64)], Int64, Int64),
    ),
    x128 : ((@list.List[FolGoal], (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TC raise,
  ) => expand_goals_l(rules, x126, x127, x128)
  let depth = x119
  let ((g, _), (insts, offset, size)) as state = x120
  let cont = x121
  if depth < 0L {
    raise Failure("expand_goal: too deep")
  } else {
    meson_expand(rules, state, fn(
      x122 : (Int64, @kernel.Thm),
    ) -> ((
      (
        @list.List[
          (
            (Int64, @list.List[FolTerm]),
            @list.List[
              (
                Int64,
                @list.List[
                  (
                    (
                      @list.List[(Int64, @list.List[FolTerm])],
                      (Int64, @list.List[FolTerm]),
                    ),
                    (Int64, @kernel.Thm),
                  ),
                ],
              ),
            ],
          ),
        ],
        (@list.List[(FolTerm, Int64)], Int64, Int64),
      ),
    ) -> TC raise) raise {
      let apprule = x122
      fn(
        x123 : (
          @list.List[
            (
              (Int64, @list.List[FolTerm]),
              @list.List[
                (
                  Int64,
                  @list.List[
                    (
                      (
                        @list.List[(Int64, @list.List[FolTerm])],
                        (Int64, @list.List[FolTerm]),
                      ),
                      (Int64, @kernel.Thm),
                    ),
                  ],
                ),
              ],
            ),
          ],
          (@list.List[(FolTerm, Int64)], Int64, Int64),
        ),
      ) -> TC raise {
        let (_, (pinsts, _, _)) as newstate = x123
        let t125 = cacheconts(fn(
          x124 : (
            @list.List[FolGoal],
            (@list.List[(FolTerm, Int64)], Int64, Int64),
          ),
        ) -> TC raise {
          let (gs, (newinsts, newoffset, newsize)) = x124
          let (locin, globin) = separate_insts(offset, pinsts, newinsts)
          let g_p = FolGoal::Subgoal(g, gs, apprule, offset, locin)
          if globin == insts && gs == @list.List([]) {
            cont((g_p, (globin, newoffset, size))) catch {
              Failure(_) => raise Cut::Cut
              e => raise e
            }
          } else {
            cont((g_p, (globin, newoffset, newsize))) catch {
              Cut::Cut => raise Failure("expand_goal")
              Failure(_) => raise Failure("expand_goal")
              e => raise e
            }
          }
        })
        expand_goals(@lib.sub63(depth, 1L), newstate, t125)
      }
    })
  }
}

///|
fn[TB, TC] expand_goals_l(
  rules : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[(Int64, @list.List[FolTerm])], (TB, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
  x126 : Int64,
  x127 : (
    @list.List[
      (
        (Int64, @list.List[FolTerm]),
        @list.List[
          (
            Int64,
            @list.List[
              (
                (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
                (Int64, @kernel.Thm),
              ),
            ],
          ),
        ],
      ),
    ],
    (@list.List[(FolTerm, Int64)], Int64, Int64),
  ),
  x128 : ((@list.List[FolGoal], (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TC raise,
) -> TC raise {
  let expand_goal_1 = (
    x119 : Int64,
    x120 : (
      (
        (Int64, @list.List[FolTerm]),
        @list.List[
          (
            Int64,
            @list.List[
              (
                (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
                (Int64, @kernel.Thm),
              ),
            ],
          ),
        ],
      ),
      (@list.List[(FolTerm, Int64)], Int64, Int64),
    ),
    x121 : ((FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TC raise,
  ) => expand_goal_1_l(rules, x119, x120, x121)
  let expand_goals = (
    x126 : Int64,
    x127 : (
      @list.List[
        (
          (Int64, @list.List[FolTerm]),
          @list.List[
            (
              Int64,
              @list.List[
                (
                  (
                    @list.List[(Int64, @list.List[FolTerm])],
                    (Int64, @list.List[FolTerm]),
                  ),
                  (Int64, @kernel.Thm),
                ),
              ],
            ),
          ],
        ),
      ],
      (@list.List[(FolTerm, Int64)], Int64, Int64),
    ),
    x128 : ((@list.List[FolGoal], (@list.List[(FolTerm, Int64)], Int64, Int64))) -> TC raise,
  ) => expand_goals_l(rules, x126, x127, x128)
  let depth_1 = x126
  let (gl, (insts_1, offset_1, size_1) as tup) = x127
  let cont_1 = x128
  match gl {
    Empty => cont_1((@list.List([]), tup))
    More(g_1, tail=Empty) =>
      expand_goal_1(depth_1, (g_1, tup), fn(
        x129 : (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)),
      ) -> TC raise {
        let (g_p_1, stup) = x129
        cont_1((@list.List([g_p_1]), stup))
      })
    gl_1 =>
      if size_1 >= meson_dcutin().val {
        let lsize = @lib.div63(size_1, meson_skew().val)
        let rsize = @lib.sub63(size_1, lsize)
        let (lgoals, rgoals) = @lib.chop_list(
          @lib.int63_to_int(@lib.div63(Int::to_int64(@lib.length(gl_1)), 2L)),
          gl_1,
        )
        expand_goals(
          depth_1,
          (lgoals, (insts_1, offset_1, lsize)),
          cacheconts(fn(
            x130 : (
              @list.List[FolGoal],
              (@list.List[(FolTerm, Int64)], Int64, Int64),
            ),
          ) -> TC raise {
            let (lg_p, (i, off, n)) = x130
            let t132 = cacheconts(fn(
              x131 : (
                @list.List[FolGoal],
                (@list.List[(FolTerm, Int64)], Int64, Int64),
              ),
            ) -> TC raise {
              let (rg_p, ztup) = x131
              cont_1((lg_p.concat(rg_p), ztup))
            })
            expand_goals(
              depth_1,
              (rgoals, (i, off, @lib.add63(n, rsize))),
              t132,
            )
          }),
        ) catch {
          Failure(_) =>
            expand_goals(
              depth_1,
              (rgoals, (insts_1, offset_1, lsize)),
              cacheconts(fn(
                x133 : (
                  @list.List[FolGoal],
                  (@list.List[(FolTerm, Int64)], Int64, Int64),
                ),
              ) -> TC raise {
                let (rg_p_1, (i_1, off_1, n_1)) = x133
                let t136 = cacheconts(fn(
                  x134 : (
                    @list.List[FolGoal],
                    (@list.List[(FolTerm, Int64)], Int64, Int64),
                  ),
                ) -> TC raise {
                  let (lg_p_1, (_, _, fsize) as ztup_1) = x134
                  let t135 = @lib.add63(lsize, fsize)
                  if @lib.add63(n_1, rsize) <= t135 {
                    raise Failure("repetition of demigoal pair")
                  } else {
                    cont_1((lg_p_1.concat(rg_p_1), ztup_1))
                  }
                })
                expand_goals(
                  depth_1,
                  (lgoals, (i_1, off_1, @lib.add63(n_1, rsize))),
                  t136,
                )
              }),
            )
          e => raise e
        }
      } else {
        match gl_1 {
          More(g_2, tail=gs_1) =>
            expand_goal_1(
              depth_1,
              (g_2, tup),
              cacheconts(fn(
                x137 : (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)),
              ) -> TC raise {
                let (g_p_2, stup_1) = x137
                expand_goals(
                  depth_1,
                  (gs_1, stup_1),
                  cacheconts(fn(
                    x138 : (
                      @list.List[FolGoal],
                      (@list.List[(FolTerm, Int64)], Int64, Int64),
                    ),
                  ) -> TC raise {
                    let (gs_p, ftup) = x138
                    cont_1((gs_p.prepend(g_p_2), ftup))
                  }),
                )
              }),
            )
          _ => raise @lib.MatchFailure("tscript.ml:431")
        }
      }
  }
}

///|
/// `solve_goal`
pub fn[TA] solve_goal(
  x143 : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[(Int64, @list.List[FolTerm])], (TA, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
  x144 : Bool,
  x145 : Int64,
  x146 : Int64,
  x147 : Int64,
) -> ((FolAtom) -> (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)) raise) raise {
  let rules = x143
  let incdepth = x144
  let min = x145
  let max = x146
  let incsize = x147
  fn solve(
    x149 : Int64,
    x150 : (
      (Int64, @list.List[FolTerm]),
      @list.List[
        (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ],
    ),
  ) -> (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)) raise {
    let n = x149
    let g = x150
    if n > max {
      raise Failure("solve_goal: Too deep")
    } else if meson_chatty().val && @lib.verbose.val {
      let t151 = " inferences so far. " +
        ("Searching with maximum size " + (Int64::to_string(n) + "."))
      @pp.std_formatter.print_string(Int64::to_string(inferences().val) + t151)
      @pp.std_formatter.print_newline()
    } else if @lib.verbose.val {
      @pp.std_formatter.print_string(Int64::to_string(inferences().val) + "..")
      @pp.std_formatter.print_flush()
    } else {
      ()
    }
    try {
      let gi = if incdepth {
        expand_goal(rules)(g)(n)(100000L)(fn(
          x152 : (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)),
        ) -> (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)) raise {
          let x = x152
          x
        })
      } else {
        expand_goal(rules)(g)(100000L)(n)(fn(
          x153 : (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)),
        ) -> (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)) raise {
          let x_1 = x153
          x_1
        })
      }
      if meson_chatty().val && @lib.verbose.val {
        @pp.std_formatter.print_string(
          "Goal solved with " +
          (Int64::to_string(inferences().val) + " inferences."),
        )
        @pp.std_formatter.print_newline()
      } else if @lib.verbose.val {
        @pp.std_formatter.print_string(
          "solved at " + Int64::to_string(inferences().val),
        )
        @pp.std_formatter.print_newline()
      } else {
        ()
      }
      gi
    } catch {
      Failure(_) => solve(@lib.add63(n, incsize), g)
      e => raise e
    }
  }
  fn(
    x154 : (Int64, @list.List[FolTerm]),
  ) -> (FolGoal, (@list.List[(FolTerm, Int64)], Int64, Int64)) raise {
    let g_1 = x154
    solve(min, (g_1, @list.List([])))
  }
}

///|
/// fol_of_hol_clauses
fn step_12() -> Unit raise {
  let fol_of_hol_clause : (@kernel.Thm) -> @list.List[
    (
      (@list.List[(Int64, @list.List[FolTerm])], (Int64, @list.List[FolTerm])),
      (Int64, @kernel.Thm),
    ),
  ] raise = fn(
    x163 : @kernel.Thm,
  ) -> @list.List[
    (
      (@list.List[(Int64, @list.List[FolTerm])], (Int64, @list.List[FolTerm])),
      (Int64, @kernel.Thm),
    ),
  ] raise {
    let th_1 = x163
    let lconsts = @kernel.freesl(@kernel.hyp(th_1))
    let tm = @kernel.concl(th_1)
    let hlits = @basics.disjuncts(tm)
    let flits = @lib.map(
      (x164 : @kernel.Term) => fol_of_literal(@list.List([]), lconsts, x164),
      hlits,
    )
    let basics = mk_contraposes_l(0L, th_1, @list.List([]), flits, @list.List([]))
    if @lib.forall(
        fn(x165 : (Int64, @list.List[FolTerm])) -> Bool raise {
          let (p, _) = x165
          p < 0L
        },
        flits,
      ) {
      basics.prepend(
        (
          (
            @lib.map(
              fn(
                x166 : (Int64, @list.List[FolTerm]),
              ) -> (Int64, @list.List[FolTerm]) raise {
                mk_negated(x166.0, x166.1)
              },
              flits,
            ),
            (1L, @list.List([])),
          ),
          (-1L, th_1),
        ),
      )
    } else {
      basics
    }
  }
  fol_of_hol_clauses_c.set(fn(
    x167 : @list.List[@kernel.Thm],
  ) -> @list.List[
    (
      Int64,
      @list.List[
        (
          (
            @list.List[(Int64, @list.List[FolTerm])],
            (Int64, @list.List[FolTerm]),
          ),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ] raise {
    let thms = x167
    let rawrules = @lib.itlist(
      fn(
        x172 : @kernel.Thm,
        x173 : @list.List[
          (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ],
      ) -> @list.List[
        (
          (
            @list.List[(Int64, @list.List[FolTerm])],
            (Int64, @list.List[FolTerm]),
          ),
          (Int64, @kernel.Thm),
        ),
      ] raise {
        (fn(
          x170 : @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ) -> ((
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ) -> @list.List[
          (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ] raise) raise {
          fn(
            x171 : @list.List[
              (
                (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
                (Int64, @kernel.Thm),
              ),
            ],
          ) -> @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ] raise {
            ((
              x168 : @list.List[
                (
                  (
                    @list.List[(Int64, @list.List[FolTerm])],
                    (Int64, @list.List[FolTerm]),
                  ),
                  (Int64, @kernel.Thm),
                ),
              ],
              x169 : @list.List[
                (
                  (
                    @list.List[(Int64, @list.List[FolTerm])],
                    (Int64, @list.List[FolTerm]),
                  ),
                  (Int64, @kernel.Thm),
                ),
              ],
            ) => @lib.union_eq(eqt_l, x168, x169))(x170, x171)
          }
        })(fol_of_hol_clause(x172))(x173)
      },
      thms,
      @list.List([]),
    )
    let prs = @lib.setify(
      @lib.map(
        fn(
          x178 : (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ) -> Int64 raise {
          (fn(
            x176 : (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
          ) -> Int64 raise {
            (fn(x174 : (Int64, @list.List[FolTerm])) -> Int64 raise { x174.0 })(
              (fn(
                x175 : (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
              ) -> (Int64, @list.List[FolTerm]) raise {
                x175.1
              })(x176),
            )
          })(
            (fn(
              x177 : (
                (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
                (Int64, @kernel.Thm),
              ),
            ) -> (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ) raise {
              x177.0
            })(x178),
          )
        },
        rawrules,
      ),
    )
    let prules = @lib.map(
      fn(
        x179 : Int64,
      ) -> (
        Int64,
        @list.List[
          (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ],
      ) raise {
        let t_1 = x179
        (
          t_1,
          @lib.filter(
            fn(
              x186 : (
                (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
                (Int64, @kernel.Thm),
              ),
            ) -> Bool raise {
              (fn(
                x184 : (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ),
              ) -> Bool raise {
                (fn(x182 : (Int64, @list.List[FolTerm])) -> Bool raise {
                  (fn(x180 : Int64) -> Bool raise { t_1 == x180 })(
                    (fn(x181 : (Int64, @list.List[FolTerm])) -> Int64 raise {
                      x181.0
                    })(x182),
                  )
                })(
                  (fn(
                    x183 : (
                      @list.List[(Int64, @list.List[FolTerm])],
                      (Int64, @list.List[FolTerm]),
                    ),
                  ) -> (Int64, @list.List[FolTerm]) raise {
                    x183.1
                  })(x184),
                )
              })(
                (fn(
                  x185 : (
                    (
                      @list.List[(Int64, @list.List[FolTerm])],
                      (Int64, @list.List[FolTerm]),
                    ),
                    (Int64, @kernel.Thm),
                  ),
                ) -> (
                  @list.List[(Int64, @list.List[FolTerm])],
                  (Int64, @list.List[FolTerm]),
                ) raise {
                  x185.0
                })(x186),
              )
            },
            rawrules,
          ),
        )
      },
      prs,
    )
    let srules = @lib.sort(
      fn(
        x187 : (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
        x188 : (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ) -> Bool raise {
        let (p_1, _) = x187
        let (q, _) = x188
        let t189 = @lib.abs63(q)
        @lib.abs63(p_1) <= t189
      },
      prules,
    )
    srules
  })
}

///|
let fol_of_hol_clauses_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @list.List[
    (
      Int64,
      @list.List[
        (
          (
            @list.List[(Int64, @list.List[FolTerm])],
            (Int64, @list.List[FolTerm]),
          ),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ] raise,
] = @lib.Cell::new("fol_of_hol_clauses")

///|
/// `fol_of_hol_clauses`
pub fn fol_of_hol_clauses(
  x : @list.List[@kernel.Thm],
) -> @list.List[
  (
    Int64,
    @list.List[
      (
        (@list.List[(Int64, @list.List[FolTerm])], (Int64, @list.List[FolTerm])),
        (Int64, @kernel.Thm),
      ),
    ],
  ),
] raise {
  fol_of_hol_clauses_c.get()(x)
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TB : Eq + @lib.OCompare + @lib.OHash] eqt_l(
  x155 : (TA, (TB, @kernel.Thm)),
  x156 : (TA, (TB, @kernel.Thm)),
) -> Bool raise {
  let (a1, (b1, c1)) = x155
  let (a2, (b2, c2)) = x156
  a1 == a2 && b1 == b2 && @basics.equals_thm(c1, c2)
}

///|
fn[TC, TD] mk_contraposes_l(
  x157 : Int64,
  x158 : TD,
  x159 : @list.List[(Int64, TC)],
  x160 : @list.List[(Int64, TC)],
  x161 : @list.List[((@list.List[(Int64, TC)], (Int64, TC)), (Int64, TD))],
) -> @list.List[((@list.List[(Int64, TC)], (Int64, TC)), (Int64, TD))] raise {
  let n = x157
  let th = x158
  let used = x159
  let unused = x160
  let sofar = x161
  match unused {
    Empty => sofar
    More(h, tail=t) => {
      let nw = (
        (
          @lib.map(
            fn(x162 : (Int64, TC)) -> (Int64, TC) raise {
              mk_negated(x162.0, x162.1)
            },
            used.concat(t),
          ),
          h,
        ),
        (n, th),
      )
      mk_contraposes_l(
        @lib.add63(n, 1L),
        th,
        used.concat(@list.List([h])),
        t,
        sofar.prepend(nw),
      )
    }
  }
}

///|
/// optimize_rules
fn step_13() -> Unit raise {
  optimize_rules_c.set((
    x195 : @list.List[
      (
        Int64,
        @list.List[
          (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ],
      ),
    ],
  ) => {
    @lib.map(
      fn(
        x194 : (
          Int64,
          @list.List[
            (
              (
                @list.List[(Int64, @list.List[FolTerm])],
                (Int64, @list.List[FolTerm]),
              ),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ) -> (
        Int64,
        @list.List[
          (
            (
              @list.List[(Int64, @list.List[FolTerm])],
              (Int64, @list.List[FolTerm]),
            ),
            (Int64, @kernel.Thm),
          ),
        ],
      ) raise {
        let (a, b) = x194
        (a, optimize_clause_order_l(b))
      },
      x195,
    )
  })
}

///|
let optimize_rules_c : @lib.Cell[
  (
    @list.List[
      (
        Int64,
        @list.List[
          (
            (@list.List[FolAtom], (Int64, @list.List[FolTerm])),
            (Int64, @kernel.Thm),
          ),
        ],
      ),
    ],
  ) -> @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[FolAtom], (Int64, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ] raise,
] = @lib.Cell::new("optimize_rules")

///|
/// `optimize_rules`
pub fn optimize_rules(
  x : @list.List[
    (
      Int64,
      @list.List[
        (
          (@list.List[FolAtom], (Int64, @list.List[FolTerm])),
          (Int64, @kernel.Thm),
        ),
      ],
    ),
  ],
) -> @list.List[
  (
    Int64,
    @list.List[
      (
        (@list.List[FolAtom], (Int64, @list.List[FolTerm])),
        (Int64, @kernel.Thm),
      ),
    ],
  ),
] raise {
  optimize_rules_c.get()(x)
}

///|
fn[TA, TB, TC] optimize_clause_order_l(
  x190 : @list.List[((@list.List[TA], TB), TC)],
) -> @list.List[((@list.List[TA], TB), TC)] raise {
  let cls = x190
  @lib.sort(
    fn(
      x191 : ((@list.List[TA], TB), TC),
      x192 : ((@list.List[TA], TB), TC),
    ) -> Bool raise {
      let ((l1, _), _) = x191
      let ((l2, _), _) = x192
      let t193 = Int::to_int64(@lib.length(l2))
      Int::to_int64(@lib.length(l1)) <= t193
    },
    cls,
  )
}

///|
let clear_contrapos_cache_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "clear_contrapos_cache",
)

///|
/// `clear_contrapos_cache`
pub fn clear_contrapos_cache(x : Unit) -> Unit raise {
  clear_contrapos_cache_c.get()(x)
}

///|
let make_hol_contrapos_c : @lib.Cell[
  ((Int64, @kernel.Thm)) -> @kernel.Thm raise,
] = @lib.Cell::new("make_hol_contrapos")

///|
/// `make_hol_contrapos`
pub fn make_hol_contrapos(x : (Int64, @kernel.Thm)) -> @kernel.Thm raise {
  make_hol_contrapos_c.get()(x)
}

///|
/// clear_contrapos_cache, make_hol_contrapos
fn step_14() -> Unit raise {
  let disj_ac : (@kernel.Term) -> @kernel.Thm raise = @theorems.ac(
    @theorems.disj_aci(),
  )
  let imp_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!b → a)")),
  )
  let t199 = @class.taut(@term_syntax.parse_term("!!(a : Bool) == a"))
  let push_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x196 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s197 = @equal.top_sweep_conv(x196)
      fn(x198 : @kernel.Term) -> @kernel.Thm raise { s197(x198) }
    },
    @list.List([
      @class.taut(@term_syntax.parse_term("!((a : Bool) || (b : Bool)) == (!a && !b)")),
      t199,
    ]),
  )
  let pull_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x200 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s201 = @equal.depth_conv(x200)
      fn(x202 : @kernel.Term) -> @kernel.Thm raise { s201(x202) }
    },
    @list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) || !(b : Bool)) == !(a && b)"))]),
  )
  let imf_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("!(p : Bool) == (p → false)")),
  )
  let memory = Ref::{ val: @list.List([]), }
  let clear_contrapos_cache : (Unit) -> Unit raise = fn(
    x203 : Unit,
  ) -> Unit raise {
    let _ = x203
    memory.val = @list.List([])
    ()
  }
  let make_hol_contrapos : ((Int64, @kernel.Thm)) -> @kernel.Thm raise = fn(
    x204 : (Int64, @kernel.Thm),
  ) -> @kernel.Thm raise {
    let (n, th) = x204
    let tm = @kernel.concl(th)
    let key = (n, tm)
    @lib.assoc(key, memory.val) catch {
      Failure(_) =>
        if n < 0L {
          @equal.conv_rule(@equal.thenc(pull_conv, imf_conv), th)
        } else {
          let djs = @basics.disjuncts(tm)
          let acth = if n == 0L {
            th
          } else {
            let (ldjs, rdjs) = @lib.chop_list(@lib.int63_to_int(n), djs)
            let t205 = ldjs.concat(@lib.tl(rdjs))
            let ndjs = t205.prepend(@lib.hd(rdjs))
            @kernel.eq_mp(
              disj_ac(@basics.mk_eq(tm, @bool.list_mk_disj(ndjs))),
              th,
            )
          }
          let fth = if Int::to_int64(@lib.length(djs)) == 1L {
            acth
          } else {
            @equal.conv_rule(@equal.thenc(imp_conv, push_conv), acth)
          }
          {
            memory.val = memory.val.prepend((key, fth))
            ()
          }
          fth
        }
      e => raise e
    }
  }
  let (clear_contrapos_cache_1, make_hol_contrapos_1) = (
    clear_contrapos_cache, make_hol_contrapos,
  )
  clear_contrapos_cache_c.set(clear_contrapos_cache_1)
  make_hol_contrapos_c.set(make_hol_contrapos_1)
}

///|
/// finish_RULE
fn step_15() -> Unit raise {
  let t207 = @class.taut(@term_syntax.parse_term("((p : Bool) → !p) == !p"))
  finish_rule_c.set(
    @simp.gen_rewrite_rule(
      fn(
        x206 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x206
      },
      @list.List([@class.taut(@term_syntax.parse_term("(!(p : Bool) → p) == p")), t207]),
    ),
  )
}

///|
let finish_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "finish_RULE",
)

///|
/// `finish_RULE`
pub fn finish_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  finish_rule_c.get()(x)
}

///|
/// meson_to_hol
fn step_16() -> Unit raise {
  let hol_negate : (@kernel.Term) -> @kernel.Term raise = fn(
    x208 : @kernel.Term,
  ) -> @kernel.Term raise {
    let tm = x208
    @basics.dest_neg(tm) catch {
      Failure(_) => @bool.mk_neg(tm)
      e => raise e
    }
  }
  let merge_inst : ((FolTerm, Int64)) -> ((@list.List[(FolTerm, Int64)]) -> @list.List[
    (FolTerm, Int64),
  ] raise) raise = fn(
    x209 : (FolTerm, Int64),
  ) -> ((@list.List[(FolTerm, Int64)]) -> @list.List[(FolTerm, Int64)] raise) raise {
    let (t, x) = x209
    fn(
      x210 : @list.List[(FolTerm, Int64)],
    ) -> @list.List[(FolTerm, Int64)] raise {
      let current = x210
      current.prepend((fol_subst(current, t), x))
    }
  }
  fn meson_to_hol_1(
    x211 : @list.List[(FolTerm, Int64)],
    x212 : FolGoal,
  ) -> @kernel.Thm raise {
    let insts = x211
    match x212 {
      FolGoal::Subgoal(g, gs, (n, th), offset, locin) => {
        let newins = @lib.itlist(
          fn(
            x213 : (FolTerm, Int64),
            x214 : @list.List[(FolTerm, Int64)],
          ) -> @list.List[(FolTerm, Int64)] raise {
            let s215 = merge_inst(x213)
            s215(x214)
          },
          locin,
          insts,
        )
        let g_p = fol_inst(newins, g)
        let hol_g = hol_of_literal(g_p.0, g_p.1)
        let ths = @lib.map((x216 : FolGoal) => meson_to_hol_1(newins, x216), gs)
        let hth = if @basics.equals_thm(th, @bool.truth()) {
          @kernel.assume_rule(hol_g)
        } else {
          let cth = make_hol_contrapos((n, th))
          if ths == @list.List([]) {
            cth
          } else {
            let t217 = @lib.end_itlist(@bool.conj, ths)
            @drule.match_mp(cth)(t217)
          }
        }
        let ith = @drule.part_match(
          fn(x218 : @kernel.Term) -> @kernel.Term raise { x218 },
          hth,
        )(hol_g)
        finish_rule(@bool.disch(hol_negate(@kernel.concl(ith)), ith))
      }
    }
  }
  meson_to_hol_c.set(fn(
    x219 : @list.List[(FolTerm, Int64)],
  ) -> ((FolGoal) -> @kernel.Thm raise) raise {
    fn(x220 : FolGoal) -> @kernel.Thm raise { meson_to_hol_1(x219, x220) }
  })
}

///|
let meson_to_hol_c : @lib.Cell[
  (@list.List[(FolTerm, Int64)]) -> ((FolGoal) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("meson_to_hol")

///|
/// `meson_to_hol`
pub fn meson_to_hol(
  x : @list.List[(FolTerm, Int64)],
) -> ((FolGoal) -> @kernel.Thm raise) raise {
  meson_to_hol_c.get()(x)
}

///|
/// create_equality_axioms
fn step_17() -> Unit raise {
  let t224 = @tactics.conv_tac(@class.taut)
  let t223 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t225 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t222),
      t223,
    ),
    t224,
  )
  let t226 = (
    @term_syntax.parse_term("(x : A) == x && (!(x == (y : A)) || !(x == (z : A)) || y == z)"),
    t225,
  )
  let eq_thms = @bool.conjuncts_rule(
    (fn(
      x221 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x221.0, x221.1)
    })(t226),
  )
  let imp_elim_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!a || b)")),
  )
  let eq_elim_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    @class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → b || !a")),
  )
  let veq_tm = @kernel.rator(@kernel.rator(@kernel.concl(@lib.hd(eq_thms))))
  fn tm_consts(
    x232 : @kernel.Term,
    x233 : @list.List[(@kernel.Term, Int64)],
  ) -> @list.List[(@kernel.Term, Int64)] raise {
    let tm = x232
    let acc = x233
    let (fn_, args) = @basics.strip_comb(tm)
    if args == @list.List([]) {
      acc
    } else {
      @lib.itlist(
        tm_consts,
        args,
        @lib.insert((fn_, Int::to_int64(@lib.length(args))), acc),
      )
    }
  }
  fn fm_consts(
    x234 : @kernel.Term,
    x235 : (
      @list.List[(@kernel.Term, Int64)],
      @list.List[(@kernel.Term, Int64)],
    ),
  ) -> (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]) raise {
    let tm_1 = x234
    let (preds, funs) as acc_1 = x235
    fm_consts(@basics.dest_forall(tm_1).1, acc_1) catch {
      Failure(_) =>
        fm_consts(@basics.dest_exists(tm_1).1, acc_1) catch {
          Failure(_) =>
            try {
              let (l, r) = @basics.dest_conj(tm_1)
              fm_consts(l, fm_consts(r, acc_1))
            } catch {
              Failure(_) =>
                try {
                  let (l_1, r_1) = @basics.dest_disj(tm_1)
                  fm_consts(l_1, fm_consts(r_1, acc_1))
                } catch {
                  Failure(_) =>
                    try {
                      let (l_2, r_2) = @basics.dest_imp(tm_1)
                      fm_consts(l_2, fm_consts(r_2, acc_1))
                    } catch {
                      Failure(_) =>
                        fm_consts(@basics.dest_neg(tm_1), acc_1) catch {
                          Failure(_) =>
                            try {
                              let (l_3, r_3) = @kernel.dest_eq(tm_1)
                              if @kernel.type_of(l_3) == @kernel.bool_ty {
                                fm_consts(r_3, fm_consts(l_3, acc_1))
                              } else {
                                raise Failure("atomic equality")
                              }
                            } catch {
                              Failure(_) => {
                                let (pred, args_1) = @basics.strip_comb(tm_1)
                                if args_1 == @list.List([]) {
                                  acc_1
                                } else {
                                  let t236 = @lib.itlist(
                                    tm_consts, args_1, funs,
                                  )
                                  (
                                    @lib.insert(
                                      (pred, Int::to_int64(@lib.length(args_1))),
                                      preds,
                                    ),
                                    t236,
                                  )
                                }
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
  let create_congruence_axiom : (Bool) -> (((@kernel.Term, Int64)) -> @kernel.Thm raise) raise = fn(
    x237 : Bool,
  ) -> (((@kernel.Term, Int64)) -> @kernel.Thm raise) raise {
    let pflag = x237
    fn(x238 : (@kernel.Term, Int64)) -> @kernel.Thm raise {
      let (tm_2, len) = x238
      let (atys, rty) = @lib.splitlist(
        fn(x239 : @kernel.HolType) -> (@kernel.HolType, @kernel.HolType) raise {
          let ty = x239
          let (op, l_4) = @kernel.dest_type(ty)
          if op == "fun" {
            let t240 = @lib.hd(@lib.tl(l_4))
            (@lib.hd(l_4), t240)
          } else {
            @lib.failure()
          }
        },
        @kernel.type_of(tm_2),
      )
      let ctys = @lib.chop_list(@lib.int63_to_int(len), atys).0
      let largs = @lib.map(
        fn(x241 : @kernel.HolType) -> @kernel.Term raise {
          @basics.genvar(x241)
        },
        ctys,
      )
      let rargs = @lib.map(
        fn(x242 : @kernel.HolType) -> @kernel.Term raise {
          @basics.genvar(x242)
        },
        ctys,
      )
      let t252 = @kernel.refl(tm_2)
      let th1 = @lib.rev_itlist(
        fn(x248 : @kernel.Thm, x249 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x246 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x247 : @kernel.Thm) -> @kernel.Thm raise {
              ((x244 : @kernel.Thm, x245 : @kernel.Thm) => {
                @lib.curry(
                  fn(x243 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                    @kernel.mk_comb_rule(x243.0, x243.1)
                  },
                  x244,
                  x245,
                )
              })(x246, x247)
            }
          })(x249)(x248)
        },
        @lib.map(
          fn(x251 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
            @kernel.assume_rule(
              (fn(x250 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                @basics.mk_eq(x250.0, x250.1)
              })(x251),
            )
          },
          @lib.zip(largs, rargs),
        ),
        t252,
      )
      let th2 = if pflag { eq_elim_rule(th1) } else { th1 }
      @lib.itlist(
        fn(x253 : @kernel.Term, x254 : @kernel.Thm) -> @kernel.Thm raise {
          let e = x253
          let th = x254
          @equal.conv_rule(imp_elim_conv, @bool.disch(e, th))
        },
        @kernel.hyp(th2),
        th2,
      )
    }
  }
  create_equality_axioms_c.set(fn(
    x255 : @list.List[@kernel.Term],
  ) -> @list.List[@kernel.Thm] raise {
    let tms = x255
    let (preds_1, funs_1) = @lib.itlist(
      fm_consts,
      tms,
      (@list.List([]), @list.List([])),
    )
    let (eqs0, noneqs) = @lib.partition(
      fn(x256 : (@kernel.Term, Int64)) -> Bool raise {
        let (t, _) = x256
        @kernel.is_const(t) && @kernel.dest_const(t).0 == "="
      },
      preds_1,
    )
    if eqs0 == @list.List([]) {
      @list.List([])
    } else {
      let pcongs = @lib.map(create_congruence_axiom(true), noneqs)
      let fcongs = @lib.map(create_congruence_axiom(false), funs_1)
      let (preds1, _) = @lib.itlist(
        fm_consts,
        @lib.map(
          fn(x257 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x257) },
          pcongs.concat(fcongs),
        ),
        (@list.List([]), @list.List([])),
      )
      let eqs1 = @lib.filter(
        fn(x258 : (@kernel.Term, Int64)) -> Bool raise {
          let (t_1, _) = x258
          @kernel.is_const(t_1) && @kernel.dest_const(t_1).0 == "="
        },
        preds1,
      )
      let eqs = @lib.union(eqs0, eqs1)
      let equivs = @lib.itlist(
        fn(
          x266 : (@kernel.Term, Int64),
          x267 : @list.List[@kernel.Thm],
        ) -> @list.List[@kernel.Thm] raise {
          (fn(
            x263 : @list.List[@kernel.Thm],
          ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
            fn(
              x264 : @list.List[@kernel.Thm],
            ) -> @list.List[@kernel.Thm] raise {
              ((x261 : @list.List[@kernel.Thm], x262 : @list.List[@kernel.Thm]) => {
                @lib.union_eq(
                  fn(x259 : @kernel.Thm, x260 : @kernel.Thm) -> Bool raise {
                    @basics.equals_thm(x259, x260)
                  },
                  x261,
                  x262,
                )
              })(x263, x264)
            }
          })(
            (fn(x265 : (@kernel.Term, Int64)) -> @list.List[@kernel.Thm] raise {
              ((x227, x228) => {
                create_equivalence_axioms_l(veq_tm, eq_thms, x227, x228)
              })(x265.0, x265.1)
            })(x266),
          )(x267)
        },
        eqs,
        @list.List([]),
      )
      equivs.concat(pcongs.concat(fcongs))
    }
  })
}

///|
let create_equality_axioms_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise,
] = @lib.Cell::new("create_equality_axioms")

///|
/// `create_equality_axioms`
pub fn create_equality_axioms(
  x : @list.List[@kernel.Term],
) -> @list.List[@kernel.Thm] raise {
  create_equality_axioms_c.get()(x)
}

///|
fn[TA] create_equivalence_axioms_l(
  veq_tm : @kernel.Term,
  eq_thms : @list.List[@kernel.Thm],
  x227 : @kernel.Term,
  x228 : TA,
) -> @list.List[@kernel.Thm] raise {
  let (eq, _) = (x227, x228)
  let t229 = @kernel.type_of(eq)
  let tyins = @basics.type_match(@kernel.type_of(veq_tm), t229, @list.List([]))
  @lib.map(
    fn(x231 : @kernel.Thm) -> @kernel.Thm raise {
      ((x230 : @kernel.Thm) => @kernel.inst_type(tyins, x230))(x231)
    },
    eq_thms,
  )
}

///|
/// perform_brand_modification
fn step_18() -> Unit raise {
  let subterms_irrefl = (
    x268 : @list.List[@kernel.Term],
    x269 : @kernel.Term,
    x270 : @list.List[@kernel.Term],
  ) => subterms_irrefl_l(x268, x269, x270)
  let subterms_refl = (
    x273 : @list.List[@kernel.Term],
    x274 : @kernel.Term,
    x275 : @list.List[@kernel.Term],
  ) => subterms_refl_l(x273, x274, x275)
  let t278 = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!a || b)")),
  )
  let clausify : (@kernel.Thm) -> @kernel.Thm raise = (x279 : @kernel.Thm) => {
    @equal.conv_rule(t278, x279)
  }
  fn brand(
    x280 : @list.List[@kernel.Term],
    x281 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let tms = x280
    let th = x281
    if tms == @list.List([]) {
      th
    } else {
      let tm_2 = @lib.hd(tms)
      let gv = @basics.genvar(@kernel.type_of(tm_2))
      let eq = @basics.mk_eq(gv, tm_2)
      let th_p = clausify(
        @bool.disch(
          eq,
          @equal.subs(@list.List([@equal.sym(@kernel.assume_rule(eq))]), th),
        ),
      )
      let tms_p = @lib.map(
        (x282 : @kernel.Term) => @basics.subst(@list.List([(gv, tm_2)]), x282),
        @lib.tl(tms),
      )
      brand(tms_p, th_p)
    }
  }
  let brand_congs : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x283 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_1 = x283
    let lconsts_2 = @kernel.freesl(@kernel.hyp(th_1))
    let lits = @basics.disjuncts(@kernel.concl(th_1))
    let atoms = @lib.map(
      fn(x284 : @kernel.Term) -> @kernel.Term raise {
        let t = x284
        @basics.dest_neg(t) catch {
          Failure(_) => t
          e => raise e
        }
      },
      lits,
    )
    let (eqs, noneqs) = @lib.partition(
      fn(x285 : @kernel.Term) -> Bool raise {
        let t_1 = x285
        try @kernel.dest_const(@basics.strip_comb(t_1).0).0 == "=" catch {
          Failure(_) => false
          e => raise e
        }
      },
      atoms,
    )
    let acc_2 = @lib.itlist(
      (x286 : @kernel.Term, x287 : @list.List[@kernel.Term]) => {
        subterms_irrefl(lconsts_2, x286, x287)
      },
      noneqs,
      @list.List([]),
    )
    let uts = @lib.itlist(
      fn(
        x297 : @kernel.Term,
        x298 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x295 : (@kernel.Term, @list.List[@kernel.Term]),
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          (fn(
            x292 : @list.List[@kernel.Term],
          ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
            fn(
              x293 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              ((
                x290 : @list.List[@kernel.Term],
                x291 : @list.List[@kernel.Term],
              ) => {
                @lib.itlist(
                  (x288 : @kernel.Term, x289 : @list.List[@kernel.Term]) => {
                    subterms_irrefl(lconsts_2, x288, x289)
                  },
                  x290,
                  x291,
                )
              })(x292, x293)
            }
          })(
            (fn(
              x294 : (@kernel.Term, @list.List[@kernel.Term]),
            ) -> @list.List[@kernel.Term] raise {
              x294.1
            })(x295),
          )
        })(
          (fn(
            x296 : @kernel.Term,
          ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
            @basics.strip_comb(x296)
          })(x297),
        )(x298)
      },
      eqs,
      acc_2,
    )
    let sts = @lib.sort(
      fn(x299 : @kernel.Term, x300 : @kernel.Term) -> Bool raise {
        let s = x299
        let t_2 = x300
        !@basics.free_in(s, t_2)
      },
      uts,
    )
    brand(sts, th_1)
  }
  let brande : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x301 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_2 = x301
    let tm_3 = @kernel.concl(th_2)
    let (l, r) = @kernel.dest_eq(tm_3)
    let gv_1 = @basics.genvar(@kernel.type_of(l))
    let eq_1 = @basics.mk_eq(r, gv_1)
    let t302 = @kernel.assume_rule(eq_1)
    clausify(
      @bool.disch(
        eq_1,
        @kernel.eq_mp(@equal.ap_term(@kernel.rator(tm_3), t302), th_2),
      ),
    )
  }
  let ldisj_cases : (@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x303 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let th_3 = x303
    fn(x304 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let lth = x304
      fn(x305 : @kernel.Thm) -> @kernel.Thm raise {
        let rth = x305
        let t306 = @bool.disj2(@kernel.concl(lth), rth)
        @bool.disj_cases(th_3, @bool.disj1(lth, @kernel.concl(rth)), t306)
      }
    }
  }
  let t307 = @simp.rewr_conv(@equal.gsym(@theorems.disj_assoc()))
  let associate : (@kernel.Thm) -> @kernel.Thm raise = (x308 : @kernel.Thm) => {
    @equal.conv_rule(t307, x308)
  }
  fn brand_trans(x309 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let th_4 = x309
    let tm_4 = @kernel.concl(th_4)
    try {
      let (l_1, r_1) = @basics.dest_disj(tm_4)
      if @basics.is_eq(l_1) {
        let lth_1 = @kernel.assume_rule(l_1)
        let lth1 = brande(lth_1)
        let lth2 = brande(@equal.sym(lth_1))
        let rth_1 = brand_trans(@kernel.assume_rule(r_1))
        let t312 = ldisj_cases(th_4)(lth2)
        let t314 = @lib.map(
          fn(x313 : @kernel.Thm) -> @kernel.Thm raise { associate(t312(x313)) },
          rth_1,
        )
        let t310 = ldisj_cases(th_4)(lth1)
        @lib.map(
          fn(x311 : @kernel.Thm) -> @kernel.Thm raise { associate(t310(x311)) },
          rth_1,
        ).concat(t314)
      } else {
        let rth_2 = brand_trans(@kernel.assume_rule(r_1))
        let t315 = @kernel.assume_rule(l_1)
        @lib.map(ldisj_cases(th_4)(t315), rth_2)
      }
    } catch {
      Failure(_) =>
        if @basics.is_eq(tm_4) {
          let t316 = brande(@equal.sym(th_4))
          @list.List([brande(th_4), t316])
        } else {
          @list.List([th_4])
        }
      e => raise e
    }
  }
  let find_eqs : (@kernel.Term) -> @list.List[@kernel.Term] raise = (
    x318 : @kernel.Term,
  ) => {
    @basics.find_terms(
      fn(x317 : @kernel.Term) -> Bool raise {
        let t_3 = x317
        try @kernel.dest_const(t_3).0 == "=" catch {
          Failure(_) => false
          e => raise e
        }
      },
      x318,
    )
  }
  let reflexate : (@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise = fn(
    x319 : @list.List[@kernel.Thm],
  ) -> @list.List[@kernel.Thm] raise {
    let ths = x319
    let eqs_1 = @lib.itlist(
      fn(
        x324 : @kernel.Thm,
        x325 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x322 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          (fn(
            x320 : @list.List[@kernel.Term],
          ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
            fn(
              x321 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              @lib.union(x320, x321)
            }
          })(find_eqs(x322))
        })(
          (fn(x323 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x323) })(
            x324,
          ),
        )(x325)
      },
      ths,
      @list.List([]),
    )
    let tys = @lib.map(
      fn(x331 : @kernel.Term) -> @kernel.HolType raise {
        (fn(x330 : (String, @kernel.HolType)) -> @kernel.HolType raise {
          (fn(x328 : @kernel.HolType) -> @kernel.HolType raise {
            (fn(
              x327 : (String, @list.List[@kernel.HolType]),
            ) -> @kernel.HolType raise {
              @lib.hd(
                (fn(
                  x326 : (String, @list.List[@kernel.HolType]),
                ) -> @list.List[@kernel.HolType] raise {
                  x326.1
                })(x327),
              )
            })(@kernel.dest_type(x328))
          })(
            (fn(x329 : (String, @kernel.HolType)) -> @kernel.HolType raise {
              x329.1
            })(x330),
          )
        })(@kernel.dest_const(x331))
      },
      eqs_1,
    )
    let gvs = @lib.map(
      fn(x332 : @kernel.HolType) -> @kernel.Term raise { @basics.genvar(x332) },
      tys,
    )
    @lib.itlist(
      fn(
        x333 : @kernel.Term,
        x334 : @list.List[@kernel.Thm],
      ) -> @list.List[@kernel.Thm] raise {
        let v = x333
        let acc_3 = x334
        acc_3.prepend(@kernel.refl(v))
      },
      gvs,
      ths,
    )
  }
  perform_brand_modification_c.set(fn(
    x335 : @list.List[@kernel.Thm],
  ) -> @list.List[@kernel.Thm] raise {
    let ths_1 = x335
    if @lib.exists(
        (x340 : @kernel.Thm) => {
          @lib.can(
            fn(x339 : @kernel.Thm) -> @kernel.Term raise {
              ((x337 : @kernel.Term) => {
                @basics.find_term(
                  fn(x336 : @kernel.Term) -> Bool raise { @basics.is_eq(x336) },
                  x337,
                )
              })(
                (fn(x338 : @kernel.Thm) -> @kernel.Term raise {
                  @kernel.concl(x338)
                })(x339),
              )
            },
            x340,
          )
        },
        ths_1,
      ) {
      let ths_p = @lib.map(brand_congs, ths_1)
      let ths_p_p = @lib.itlist(
        fn(
          x347 : @kernel.Thm,
          x348 : @list.List[@kernel.Thm],
        ) -> @list.List[@kernel.Thm] raise {
          (fn(
            x345 : @list.List[@kernel.Thm],
          ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
            fn(
              x346 : @list.List[@kernel.Thm],
            ) -> @list.List[@kernel.Thm] raise {
              ((x343 : @list.List[@kernel.Thm], x344 : @list.List[@kernel.Thm]) => {
                @lib.union_eq(
                  fn(x341 : @kernel.Thm, x342 : @kernel.Thm) -> Bool raise {
                    @basics.equals_thm(x341, x342)
                  },
                  x343,
                  x344,
                )
              })(x345, x346)
            }
          })(brand_trans(x347))(x348)
        },
        ths_p,
        @list.List([]),
      )
      reflexate(ths_p_p)
    } else {
      ths_1
    }
  })
}

///|
let perform_brand_modification_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise,
] = @lib.Cell::new("perform_brand_modification")

///|
/// `perform_brand_modification`
pub fn perform_brand_modification(
  x : @list.List[@kernel.Thm],
) -> @list.List[@kernel.Thm] raise {
  perform_brand_modification_c.get()(x)
}

///|
fn subterms_irrefl_l(
  x268 : @list.List[@kernel.Term],
  x269 : @kernel.Term,
  x270 : @list.List[@kernel.Term],
) -> @list.List[@kernel.Term] raise {
  let subterms_refl = (
    x273 : @list.List[@kernel.Term],
    x274 : @kernel.Term,
    x275 : @list.List[@kernel.Term],
  ) => subterms_refl_l(x273, x274, x275)
  let lconsts = x268
  let tm = x269
  let acc = x270
  if @kernel.is_var(tm) || @kernel.is_const(tm) {
    acc
  } else {
    let (fn_, args) = @basics.strip_comb(tm)
    @lib.itlist(
      (x271 : @kernel.Term, x272 : @list.List[@kernel.Term]) => {
        subterms_refl(lconsts, x271, x272)
      },
      args,
      acc,
    )
  }
}

///|
fn subterms_refl_l(
  x273 : @list.List[@kernel.Term],
  x274 : @kernel.Term,
  x275 : @list.List[@kernel.Term],
) -> @list.List[@kernel.Term] raise {
  let subterms_refl = (
    x273 : @list.List[@kernel.Term],
    x274 : @kernel.Term,
    x275 : @list.List[@kernel.Term],
  ) => subterms_refl_l(x273, x274, x275)
  let lconsts_1 = x273
  let tm_1 = x274
  let acc_1 = x275
  if @kernel.is_var(tm_1) {
    if @lib.mem(tm_1, lconsts_1) {
      @lib.insert(tm_1, acc_1)
    } else {
      acc_1
    }
  } else if @kernel.is_const(tm_1) {
    @lib.insert(tm_1, acc_1)
  } else {
    let (fn__1, args_1) = @basics.strip_comb(tm_1)
    @lib.itlist(
      (x276 : @kernel.Term, x277 : @list.List[@kernel.Term]) => {
        subterms_refl(lconsts_1, x276, x277)
      },
      args_1,
      @lib.insert(tm_1, acc_1),
    )
  }
}

///|
/// POLY_ASSUME_TAC
fn step_19() -> Unit raise {
  fn grab_constants(
    x357 : @kernel.Term,
    x358 : @list.List[@kernel.Term],
  ) -> @list.List[@kernel.Term] raise {
    let tm = x357
    let acc = x358
    if @basics.is_forall(tm) || @basics.is_exists(tm) {
      grab_constants(@basics.body(@kernel.rand(tm)), acc)
    } else if @bool.is_iff(tm) ||
      @basics.is_imp(tm) ||
      @basics.is_conj(tm) ||
      @basics.is_disj(tm) {
      let t359 = grab_constants(@equal.lhand(tm), acc)
      grab_constants(@kernel.rand(tm), t359)
    } else if @basics.is_neg(tm) {
      grab_constants(@kernel.rand(tm), acc)
    } else {
      @lib.union(
        @basics.find_terms(
          fn(x360 : @kernel.Term) -> Bool raise { @kernel.is_const(x360) },
          tm,
        ),
        acc,
      )
    }
  }
  let match_consts : ((@kernel.Term, @kernel.Term)) -> @list.List[
    (@kernel.HolType, @kernel.HolType),
  ] raise = fn(
    x361 : (@kernel.Term, @kernel.Term),
  ) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
    let (tm1, tm2) = x361
    let (s1, ty1) = @kernel.dest_const(tm1)
    let (s2, ty2) = @kernel.dest_const(tm2)
    if s1 == s2 {
      @basics.type_match(ty1, ty2, @list.List([]))
    } else {
      raise Failure("match_consts")
    }
  }
  let polymorph : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @list.List[
    @kernel.Thm,
  ] raise) raise = fn(
    x362 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise {
    let mconsts = x362
    fn(x363 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      let th = x363
      let t365 = @lib.unions(
        @lib.map(
          fn(x364 : @kernel.Term) -> @list.List[@kernel.HolType] raise {
            @kernel.type_vars_in_term(x364)
          },
          @kernel.hyp(th),
        ),
      )
      let tvs = @lib.subtract(
        @kernel.type_vars_in_term(@kernel.concl(th)),
        t365,
      )
      if tvs == @list.List([]) {
        @list.List([th])
      } else {
        let pconsts = grab_constants(@kernel.concl(th), @list.List([]))
        let tyins = @lib.mapfilter(
          match_consts,
          @lib.allpairs(
            fn(
              x366 : @kernel.Term,
              x367 : @kernel.Term,
            ) -> (@kernel.Term, @kernel.Term) raise {
              let x_1 = x366
              let y_1 = x367
              (x_1, y_1)
            },
            pconsts,
            mconsts,
          ),
        )
        let ths_p = setify_p_l(
          fn(x368 : @kernel.Thm) -> ((@kernel.Thm) -> Bool raise) raise {
            let th_1 = x368
            fn(x369 : @kernel.Thm) -> Bool raise {
              let th_p = x369
              let t370 = @kernel.dest_thm(th_p)
              @lib.compare(@kernel.dest_thm(th_1), t370) <= 0
            }
          },
          fn(x371 : @kernel.Thm) -> ((@kernel.Thm) -> Bool raise) raise {
            fn(x372 : @kernel.Thm) -> Bool raise {
              @basics.equals_thm(x371, x372)
            }
          },
          @lib.mapfilter(
            fn(
              x375 : @list.List[(@kernel.HolType, @kernel.HolType)],
            ) -> @kernel.Thm raise {
              (fn(
                x373 : @list.List[(@kernel.HolType, @kernel.HolType)],
              ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                fn(x374 : @kernel.Thm) -> @kernel.Thm raise {
                  @kernel.inst_type(x373, x374)
                }
              })(x375)(th)
            },
            tyins,
          ),
        )
        if ths_p == @list.List([]) {
          @lib.warn(true, "No useful-looking instantiations of lemma")
          @list.List([th])
        } else {
          ths_p
        }
      }
    }
  }
  fn polymorph_all(
    x376 : @list.List[@kernel.Term],
    x377 : @list.List[@kernel.Thm],
    x378 : @list.List[@kernel.Thm],
  ) -> @list.List[@kernel.Thm] raise {
    let mconsts_1 = x376
    let ths = x377
    let acc_1 = x378
    if ths == @list.List([]) {
      acc_1
    } else {
      let t379 = @lib.hd(ths)
      let ths_p_1 = polymorph(mconsts_1)(t379)
      let mconsts_p = @lib.itlist(
        grab_constants,
        @lib.map(
          fn(x380 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x380) },
          ths_p_1,
        ),
        mconsts_1,
      )
      let t383 = @lib.union_eq(
        fn(x381 : @kernel.Thm, x382 : @kernel.Thm) -> Bool raise {
          @basics.equals_thm(x381, x382)
        },
        ths_p_1,
        acc_1,
      )
      polymorph_all(mconsts_p, @lib.tl(ths), t383)
    }
  }
  poly_assume_tac_c.set(fn(
    x384 : @list.List[@kernel.Thm],
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
    let ths_1 = x384
    fn(
      x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      let (asl, w) as gl = x385
      let mconsts_2 = @lib.itlist(
        fn(
          x391 : (String, @kernel.Thm),
          x392 : @list.List[@kernel.Term],
        ) -> @list.List[@kernel.Term] raise {
          (fn(
            x389 : @kernel.Thm,
          ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
            (fn(
              x386 : @kernel.Term,
            ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
              fn(
                x387 : @list.List[@kernel.Term],
              ) -> @list.List[@kernel.Term] raise {
                grab_constants(x386, x387)
              }
            })(
              (fn(x388 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x388)
              })(x389),
            )
          })(
            (fn(x390 : (String, @kernel.Thm)) -> @kernel.Thm raise { x390.1 })(
              x391,
            ),
          )(x392)
        },
        asl,
        @list.List([]),
      )
      let ths_p_2 = polymorph_all(mconsts_2, ths_1, @list.List([]))
      @tactics.map_every(
        fn(
          x393 : @kernel.Thm,
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
          let s394 = @tactics.assume_tac(x393)
          fn(
            x395 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s394(x395)
          }
        },
        ths_p_2,
      )(gl)
    }
  })
}

///|
let poly_assume_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> @tactics.Goalstate raise) raise,
] = @lib.Cell::new("POLY_ASSUME_TAC")

///|
/// `POLY_ASSUME_TAC`
pub fn poly_assume_tac(
  x : @list.List[@kernel.Thm],
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  poly_assume_tac_c.get()(x)
}

///|
fn[TA] uniq_p_l(
  x349 : (TA) -> ((TA) -> Bool raise) raise,
  x350 : @list.List[TA],
) -> @list.List[TA] raise {
  let eq = x349
  let l = x350
  match l {
    More(x, tail=More(y, tail=_) as t) => {
      let t_p = uniq_p_l(eq, t)
      if eq(x)(y) {
        t_p
      } else if physical_equal(t_p, t) {
        l
      } else {
        t_p.prepend(x)
      }
    }
    _ => l
  }
}

///|
fn[TB] setify_p_l(
  x351 : (TB) -> ((TB) -> Bool raise) raise,
  x352 : (TB) -> ((TB) -> Bool raise) raise,
  x353 : @list.List[TB],
) -> @list.List[TB] raise {
  let le = x351
  let eq_1 = x352
  let s = x353
  uniq_p_l(
    eq_1,
    @lib.sort(
      fn(x354 : TB, x355 : TB) -> Bool raise {
        let s356 = le(x354)
        s356(x355)
      },
      s,
    ),
  )
}

///|
/// `SIMPLE_MESON_REFUTE`
pub fn simple_meson_refute(
  x396 : Int64,
  x397 : Int64,
  x398 : Int64,
  x399 : @list.List[@kernel.Thm],
) -> @kernel.Thm raise {
  let min = x396
  let max = x397
  let inc = x398
  let ths = x399
  clear_contrapos_cache(())
  {
    inferences().val = 0L
    ()
  }
  let old_dcutin = meson_dcutin().val
  if meson_depth().val {
    meson_dcutin().val = 100001L
    ()
  } else {
    ()
  }
  let ths_p = if meson_brand().val {
    perform_brand_modification(ths)
  } else {
    ths.concat(
      create_equality_axioms(
        @lib.map(
          fn(x400 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x400) },
          ths,
        ),
      ),
    )
  }
  let rules = optimize_rules(fol_of_hol_clauses(ths_p))
  let (proof, (insts, _, _)) = solve_goal(
    rules,
    meson_depth().val,
    min,
    max,
    inc,
  )((1L, @list.List([])))
  {
    meson_dcutin().val = old_dcutin
    ()
  }
  meson_to_hol(insts)(proof)
}

///|
/// `CONJUNCTS_THEN'`
pub fn conjuncts_then_p(
  x401 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise) raise,
  x402 : @kernel.Thm,
) -> @tactics.Tactic raise {
  let ttac = x401
  let cth = x402
  let t404 = ttac(@bool.conjunct2(cth))
  @tactics.then_tac(ttac(@bool.conjunct1(cth)), t404)
}

///|
/// `PURE_MESON_TAC`
pub fn pure_meson_tac(
  x405 : Int64,
  x406 : Int64,
  x407 : Int64,
  x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let min = x405
  let max = x406
  let inc = x407
  let gl = x408
  reset_vars(())
  reset_consts(())
  @tactics.orelse_tac(
    @tactics.first_assum(fn(
      x409 : @kernel.Thm,
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
      let s410 = @tactics.contr_tac(x409)
      fn(
        x411 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s410(x411)
      }
    }),
    fn(
      x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      (fn(
        x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x419 : @list.List[(String, @kernel.Thm)],
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
            x416 : @list.List[@kernel.Thm],
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
              x412 : @kernel.Thm,
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
              let s413 = @tactics.accept_tac(x412)
              fn(
                x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s413(x414)
              }
            })(
              ((x415 : @list.List[@kernel.Thm]) => {
                simple_meson_refute(min, max, inc, x415)
              })(x416),
            )
          })(
            ((x418 : @list.List[(String, @kernel.Thm)]) => {
              @lib.map(
                fn(x417 : (String, @kernel.Thm)) -> @kernel.Thm raise { x417.1 },
                x418,
              )
            })(x419),
          )
        })(
          (fn(
            x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @list.List[(String, @kernel.Thm)] raise {
            x420.0
          })(x421),
        )
      })(x422)(x422)
    },
  )(gl)
}

///|
/// QUANT_BOOL_CONV
fn step_20() -> Unit raise {
  quant_bool_conv_c.set(
    @simp.pure_rewrite_conv(
      @list.List([
        @class.forall_bool_thm(),
        @class.exists_bool_thm(),
        @class.cond_clauses(),
        @class.not_clauses(),
        @theorems.imp_clauses(),
        @theorems.and_clauses(),
        @theorems.or_clauses(),
        @theorems.eq_clauses(),
        @theorems.forall_simp(),
        @theorems.exists_simp(),
      ]),
    ),
  )
}

///|
let quant_bool_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "QUANT_BOOL_CONV",
)

///|
/// `QUANT_BOOL_CONV`
pub fn quant_bool_conv(x : @kernel.Term) -> @kernel.Thm raise {
  quant_bool_conv_c.get()(x)
}

///|
/// `SPLIT_TAC`
pub fn split_tac(
  x423 : Int64,
  x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let n = x423
  let g = x424
  let t432 = if n > 0L {
    let t430 = @lib.sub63(n, 1L)
    @tactics.then_tac(@tactics.first_x_assum(@tactics.disj_cases_tac), (
      x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) => split_tac(t430, x431))
  } else {
    @tactics.no_tac
  }
  @tactics.orelse_tac(
    @tactics.orelse_tac(
      @tactics.then_tac(
        @tactics.first_x_assum((x428 : @kernel.Thm) => {
          conjuncts_then_p(
            fn(
              x425 : @kernel.Thm,
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
              let s426 = @tactics.assume_tac(x425)
              fn(
                x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s426(x427)
              }
            },
            x428,
          )
        }),
        (x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
          split_tac(n, x429)
        },
      ),
      t432,
    ),
    @tactics.all_tac,
  )(g)
}

///|
/// `GEN_MESON_TAC`
pub fn gen_meson_tac(
  x433 : Int64,
  x434 : Int64,
  x435 : Int64,
  x436 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let min = x433
  let max = x434
  let step = x435
  let ths = x436
  let t484 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.subst_var_tac))
  let t481 = @canon.assoc_conv(@theorems.disj_assoc())
  let t483 = @tactics.rule_assum_tac((x482 : @kernel.Thm) => {
    @equal.conv_rule(t481, x482)
  })
  let t480 = @tactics.repeat_tac(
    @tactics.first_x_assum((x479 : @kernel.Thm) => {
      conjuncts_then_p(
        fn(
          x476 : @kernel.Thm,
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
          let s477 = @tactics.assume_tac(x476)
          fn(
            x478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s477(x478)
          }
        },
        x479,
      )
    }),
  )
  let t475 = @tactics.rule_assum_tac((x474 : @kernel.Thm) => {
    @lib.repeat(
      fn(x473 : @kernel.Thm) -> @kernel.Thm raise {
        let th = x473
        @bool.spec(
          @basics.genvar(
            @kernel.type_of(@basics.dest_forall(@kernel.concl(th)).0),
          ),
          th,
        )
      },
      x474,
    )
  })
  let t470 = @equal.thenc(@canon.prenex_conv, @canon.weak_cnf_conv)
  let t472 = @tactics.rule_assum_tac((x471 : @kernel.Thm) => {
    @equal.conv_rule(t470, x471)
  })
  let t468 = meson_split_limit().val
  let t467 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.choose_tac))
  let t464 = @equal.thenc(@canon.nnf_conv, @canon.skolem_conv)
  let t466 = @tactics.rule_assum_tac((x465 : @kernel.Thm) => {
    @equal.conv_rule(t464, x465)
  })
  let t463 = @class.refute_then(fn(
    x460 : @kernel.Thm,
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
    let s461 = @tactics.assume_tac(x460)
    fn(
      x462 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s461(x462)
    }
  })
  let t459 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.gen_tac, @tactics.disch_tac),
  )
  let t458 = @tactics.conv_tac(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @canon.presimp_conv,
            @equal.top_depth_conv(@equal.beta_conv),
          ),
          @canon.lambda_elim_conv,
        ),
        @canon.conds_celim_conv,
      ),
      quant_bool_conv,
    ),
  )
  let t441 = poly_assume_tac(@lib.map(@bool.gen_all, ths))
  @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @class.refute_then(fn(
                                      x438 : @kernel.Thm,
                                    ) -> ((
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> (
                                      (
                                        @list.List[@kernel.Term],
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                      ),
                                      @list.List[
                                        (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ],
                                      (
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                        @list.List[@kernel.Thm],
                                      ) -> @kernel.Thm raise,
                                    ) raise) raise {
                                      let s439 = @tactics.assume_tac(x438)
                                      fn(
                                        x440 : (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ) -> (
                                        (
                                          @list.List[@kernel.Term],
                                          (
                                            @list.List[(Int64, @kernel.Term)],
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
                                          ),
                                        ),
                                        @list.List[
                                          (
                                            @list.List[(String, @kernel.Thm)],
                                            @kernel.Term,
                                          ),
                                        ],
                                        (
                                          (
                                            @list.List[(Int64, @kernel.Term)],
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
                                          ),
                                          @list.List[@kernel.Thm],
                                        ) -> @kernel.Thm raise,
                                      ) raise {
                                        s439(x440)
                                      }
                                    }),
                                    t441,
                                  ),
                                  fn(
                                    x452 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> (
                                    (
                                      @list.List[@kernel.Term],
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                    ),
                                    @list.List[
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ],
                                    (
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise {
                                    (fn(
                                      x451 : (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> ((
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> (
                                      (
                                        @list.List[@kernel.Term],
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                      ),
                                      @list.List[
                                        (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ],
                                      (
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                        @list.List[@kernel.Thm],
                                      ) -> @kernel.Thm raise,
                                    ) raise) raise {
                                      ((
                                        x449 : @list.List[(String, @kernel.Thm)],
                                      ) => {
                                        @tactics.map_every(
                                          fn(
                                            x448 : (String, @kernel.Thm),
                                          ) -> ((
                                            (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ) -> (
                                            (
                                              @list.List[@kernel.Term],
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (@kernel.Term, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (
                                                    @kernel.HolType,
                                                    @kernel.HolType,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            @list.List[
                                              (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
                                            ],
                                            (
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (@kernel.Term, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (
                                                    @kernel.HolType,
                                                    @kernel.HolType,
                                                  ),
                                                ],
                                              ),
                                              @list.List[@kernel.Thm],
                                            ) -> @kernel.Thm raise,
                                          ) raise) raise {
                                            (fn(
                                              x446 : @kernel.Thm,
                                            ) -> ((
                                              (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
                                            ) -> (
                                              (
                                                @list.List[@kernel.Term],
                                                (
                                                  @list.List[
                                                    (Int64, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (@kernel.Term, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (
                                                      @kernel.HolType,
                                                      @kernel.HolType,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              @list.List[
                                                (
                                                  @list.List[
                                                    (String, @kernel.Thm),
                                                  ],
                                                  @kernel.Term,
                                                ),
                                              ],
                                              (
                                                (
                                                  @list.List[
                                                    (Int64, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (@kernel.Term, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (
                                                      @kernel.HolType,
                                                      @kernel.HolType,
                                                    ),
                                                  ],
                                                ),
                                                @list.List[@kernel.Thm],
                                              ) -> @kernel.Thm raise,
                                            ) raise) raise {
                                              (fn(
                                                x442 : @kernel.Term,
                                              ) -> ((
                                                (
                                                  @list.List[
                                                    (String, @kernel.Thm),
                                                  ],
                                                  @kernel.Term,
                                                ),
                                              ) -> (
                                                (
                                                  @list.List[@kernel.Term],
                                                  (
                                                    @list.List[
                                                      (Int64, @kernel.Term),
                                                    ],
                                                    @list.List[
                                                      (
                                                        @kernel.Term,
                                                        @kernel.Term,
                                                      ),
                                                    ],
                                                    @list.List[
                                                      (
                                                        @kernel.HolType,
                                                        @kernel.HolType,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                @list.List[
                                                  (
                                                    @list.List[
                                                      (String, @kernel.Thm),
                                                    ],
                                                    @kernel.Term,
                                                  ),
                                                ],
                                                (
                                                  (
                                                    @list.List[
                                                      (Int64, @kernel.Term),
                                                    ],
                                                    @list.List[
                                                      (
                                                        @kernel.Term,
                                                        @kernel.Term,
                                                      ),
                                                    ],
                                                    @list.List[
                                                      (
                                                        @kernel.HolType,
                                                        @kernel.HolType,
                                                      ),
                                                    ],
                                                  ),
                                                  @list.List[@kernel.Thm],
                                                ) -> @kernel.Thm raise,
                                              ) raise) raise {
                                                let s443 = @tactics.undisch_tac(
                                                  x442,
                                                )
                                                fn(
                                                  x444 : (
                                                    @list.List[
                                                      (String, @kernel.Thm),
                                                    ],
                                                    @kernel.Term,
                                                  ),
                                                ) -> (
                                                  (
                                                    @list.List[@kernel.Term],
                                                    (
                                                      @list.List[
                                                        (Int64, @kernel.Term),
                                                      ],
                                                      @list.List[
                                                        (
                                                          @kernel.Term,
                                                          @kernel.Term,
                                                        ),
                                                      ],
                                                      @list.List[
                                                        (
                                                          @kernel.HolType,
                                                          @kernel.HolType,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  @list.List[
                                                    (
                                                      @list.List[
                                                        (String, @kernel.Thm),
                                                      ],
                                                      @kernel.Term,
                                                    ),
                                                  ],
                                                  (
                                                    (
                                                      @list.List[
                                                        (Int64, @kernel.Term),
                                                      ],
                                                      @list.List[
                                                        (
                                                          @kernel.Term,
                                                          @kernel.Term,
                                                        ),
                                                      ],
                                                      @list.List[
                                                        (
                                                          @kernel.HolType,
                                                          @kernel.HolType,
                                                        ),
                                                      ],
                                                    ),
                                                    @list.List[@kernel.Thm],
                                                  ) -> @kernel.Thm raise,
                                                ) raise {
                                                  s443(x444)
                                                }
                                              })(
                                                (fn(
                                                  x445 : @kernel.Thm,
                                                ) -> @kernel.Term raise {
                                                  @kernel.concl(x445)
                                                })(x446),
                                              )
                                            })(
                                              (fn(
                                                x447 : (String, @kernel.Thm),
                                              ) -> @kernel.Thm raise {
                                                x447.1
                                              })(x448),
                                            )
                                          },
                                          x449,
                                        )
                                      })(
                                        (fn(
                                          x450 : (
                                            @list.List[(String, @kernel.Thm)],
                                            @kernel.Term,
                                          ),
                                        ) -> @list.List[(String, @kernel.Thm)] raise {
                                          x450.0
                                        })(x451),
                                      )
                                    })(x452)(x452)
                                  },
                                ),
                                @canon.select_elim_tac,
                              ),
                              fn(
                                x457 : (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                ),
                                @list.List[
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ],
                                (
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise {
                                (fn(
                                  x453 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                  ),
                                  @list.List[
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ],
                                  (
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  let (asl, w) = x453
                                  @tactics.map_every(
                                    fn(
                                      x455 : @kernel.Term,
                                    ) -> ((
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> (
                                      (
                                        @list.List[@kernel.Term],
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                      ),
                                      @list.List[
                                        (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ],
                                      (
                                        (
                                          @list.List[(Int64, @kernel.Term)],
                                          @list.List[
                                            (@kernel.Term, @kernel.Term),
                                          ],
                                          @list.List[
                                            (@kernel.HolType, @kernel.HolType),
                                          ],
                                        ),
                                        @list.List[@kernel.Thm],
                                      ) -> @kernel.Thm raise,
                                    ) raise) raise {
                                      let v = x455
                                      @tactics.spec_tac(v, v)
                                    },
                                    @kernel.frees(w),
                                  )
                                })(x457)(x457)
                              },
                            ),
                            t458,
                          ),
                          t459,
                        ),
                        t463,
                      ),
                      t466,
                    ),
                    t467,
                  ),
                  @canon.asm_fol_tac,
                ),
                (x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
                  split_tac(t468, x469)
                },
              ),
              t472,
            ),
            t475,
          ),
          t480,
        ),
        t483,
      ),
      t484,
    ),
    (x485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
      pure_meson_tac(min, max, step, x485)
    },
  )
}

///|
/// ASM_MESON_TAC
fn step_21() -> Unit raise {
  asm_meson_tac_c.set((x486 : @list.List[@kernel.Thm]) => {
    gen_meson_tac(0L, 50L, 1L, x486)
  })
}

///|
let asm_meson_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @tactics.Tactic raise,
] = @lib.Cell::new("ASM_MESON_TAC")

///|
/// `ASM_MESON_TAC`
pub fn asm_meson_tac(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  asm_meson_tac_c.get()(x)
}

///|
/// `MESON_TAC`
pub fn meson_tac(x487 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x487
  let t490 = asm_meson_tac(ths)
  @tactics.then_tac(
    @tactics.pop_assum_list(fn(
      x489 : @list.List[@kernel.Thm],
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
      @tactics.all_tac
    }),
    t490,
  )
}

///|
/// `MESON`
pub fn meson(
  x491 : @list.List[@kernel.Thm],
  x492 : @kernel.Term,
) -> @kernel.Thm raise {
  let ths = x491
  let tm = x492
  let th = @tactics.tac_proof((@list.List([]), tm), meson_tac(ths))
  let (asl, tm_p) = @kernel.dest_thm(th)
  if asl != @list.List([]) &&
    !@lib.subset(
      asl,
      @lib.unions(
        @lib.map(
          fn(x493 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
            @kernel.hyp(x493)
          },
          ths,
        ),
      ),
    ) {
    raise Failure("MESON: too many assumptions in result")
  } else if tm_p == tm {
    th
  } else {
    @kernel.eq_mp(@equal.alpha_rule(tm_p, tm), th) catch {
      Failure(_) => raise Failure("MESON: the wrong result")
      e => raise e
    }
  }
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
}
