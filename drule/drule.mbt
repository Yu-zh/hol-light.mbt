// ===========================================================================
// More sophisticated derived rules including definitions and rewriting
// (port of drule.ml).
//
// Where upstream precomputes work before returning a closure
// (`MATCH_MP ith`, `PART_MATCH partfn th`, `HIGHER_REWRITE_CONV ths`), the
// MoonBit function returns a closure too, keeping the same staging.
// ===========================================================================

///|
using @kernel {type Term, type Thm, type HolType}

///|
using @list {type List}

///|
using @lib {type Cell}

///|
using @equal {type Conv}

///|
/// Instantiations: higher-order bindings (number of arguments, pattern
/// head), term bindings and type bindings.
pub type Instantiation = (
  List[(Int64, Term)],
  List[(Term, Term)],
  List[(HolType, HolType)],
)

///|
fn q(s : String) -> Term raise {
  @parser.parse_term(s)
}

///|
/// Loading: importing this package runs upstream's drule.ml load-time
/// steps, in order, after the theories it imports.
fn init {
  @parser.begin_theory("drule")
  load_steps() catch {
    e => abort("HOL Light: loading drule.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

// ---------------------------------------------------------------------------
// The last recourse when all else fails!
// ---------------------------------------------------------------------------

///|
/// `mk_thm`: assert `asl |- c` as an axiom (recorded in `axioms()`).
pub fn mk_thm(asl : List[Term], c : Term) -> Thm raise {
  let ax = @kernel.new_axiom(@lib.itlist(@bool.mk_imp, asl.rev(), c))
  @lib.rev_itlist(
    (t, th) => @bool.mp(th, @kernel.assume_rule(t)),
    asl.rev(),
    ax,
  )
}

// ---------------------------------------------------------------------------
// Derived congruence rules.
// ---------------------------------------------------------------------------

///|
let mk_conj_andtm : Cell[Term] = Cell::new("MK_CONJ")

///|
/// `MK_CONJ`: from `|- a = b` and `|- c = d` derive `|- a /\ c = b /\ d`.
pub fn mk_conj_rule(eq1 : Thm, eq2 : Thm) -> Thm raise {
  @kernel.mk_comb_rule(@equal.ap_term(mk_conj_andtm.get(), eq1), eq2)
}

///|
let mk_disj_ortm : Cell[Term] = Cell::new("MK_DISJ")

///|
/// `MK_DISJ`
pub fn mk_disj_rule(eq1 : Thm, eq2 : Thm) -> Thm raise {
  @kernel.mk_comb_rule(@equal.ap_term(mk_disj_ortm.get(), eq1), eq2)
}

///|
let mk_forall_atm : Cell[Term] = Cell::new("MK_FORALL")

///|
/// `MK_FORALL`: from `|- p = q` derive `|- (!v. p) = (!v. q)`.
pub fn mk_forall_rule(v : Term, th : Thm) -> Thm raise {
  let abs = @kernel.abs_rule(v, th)
  @equal.ap_term(
    @kernel.inst(
      @list.singleton((@kernel.type_of(v), @kernel.aty)),
      mk_forall_atm.get(),
    ),
    abs,
  )
}

///|
let mk_exists_atm : Cell[Term] = Cell::new("MK_EXISTS")

///|
/// `MK_EXISTS`
pub fn mk_exists_rule(v : Term, th : Thm) -> Thm raise {
  let abs = @kernel.abs_rule(v, th)
  @equal.ap_term(
    @kernel.inst(
      @list.singleton((@kernel.type_of(v), @kernel.aty)),
      mk_exists_atm.get(),
    ),
    abs,
  )
}

///|
/// `MP_CONV`: eliminate the antecedent of a theorem using a conversion.
pub fn mp_conv(cnv : Conv, th : Thm) -> Thm raise {
  let (l, _) = @basics.dest_imp(@kernel.concl(th))
  let ath = cnv(l)
  @bool.mp(th, @bool.eqt_elim(ath)) catch {
    Failure(_) => @bool.mp(th, ath)
    e => raise e
  }
}

///|
/// `BETAS_CONV`: multiple beta-reduction.
pub fn betas_conv(tm : Term) -> Thm raise {
  match tm {
    Comb(Abs(_), _) => @equal.beta_conv(tm)
    Comb(Comb(_), _) =>
      @equal.thenc(@equal.rator_conv(betas_conv), @equal.beta_conv)(tm)
    _ => raise Failure("BETAS_CONV")
  }
}

// ---------------------------------------------------------------------------
// Instantiators.
// ---------------------------------------------------------------------------

///|
fn betas(n : Int32, tm : Term) -> Term raise {
  let (args, lam) = @lib.funpow(
    n,
    (p : (List[Term], Term)) => {
      let (l, t) = p
      // `(rand t)::l, rator t`: the tuple is evaluated right to left.
      let r = @kernel.rator(t)
      (l.prepend(@kernel.rand(t)), r)
    },
    (@list.List([]), tm),
  )
  @lib.rev_itlist(
    (a, l) => {
      let (v, b) = @kernel.dest_abs(l)
      @kernel.vsubst(@list.singleton((a, v)), b)
    },
    args,
    lam,
  )
}

///|
fn[T] fail_() -> T raise {
  raise Failure("")
}

///|
fn ho_betas(bcs : List[(Int64, Term)], pat : Term, tm : Term) -> Term raise {
  if @kernel.is_var(pat) || @kernel.is_const(pat) {
    fail_()
  }
  try {
    let (bv, bod) = @kernel.dest_abs(tm)
    let b = ho_betas(bcs, @basics.body(pat), bod)
    @kernel.mk_abs(bv, b)
  } catch {
    Failure(_) => {
      let (hop, args) = @basics.strip_comb(pat)
      try {
        let n = @lib.rev_assoc(hop, bcs)
        if args.length().to_int64() == n {
          betas(n.to_int(), tm)
        } else {
          fail_()
        }
      } catch {
        Failure(_) => {
          let (lpat, rpat) = @kernel.dest_comb(pat)
          let (ltm, rtm) = @kernel.dest_comb(tm)
          try {
            let lth = ho_betas(bcs, lpat, ltm)
            try {
              let rth = ho_betas(bcs, rpat, rtm)
              @kernel.mk_comb(lth, rth)
            } catch {
              Failure(_) => @kernel.mk_comb(lth, rtm)
              e => raise e
            }
          } catch {
            Failure(_) => {
              let rth = ho_betas(bcs, rpat, rtm)
              @kernel.mk_comb(ltm, rth)
            }
            e => raise e
          }
        }
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `instantiate`: apply an instantiation to a term.
pub fn instantiate(i : Instantiation, tm : Term) -> Term raise {
  let (bcs, tmin, tyin) = i
  let itm = if tyin.is_empty() { tm } else { @kernel.inst(tyin, tm) }
  if tmin.is_empty() {
    return itm
  }
  let ttm = @kernel.vsubst(tmin, itm)
  if bcs.is_empty() {
    return ttm
  }
  ho_betas(bcs, itm, ttm) catch {
    Failure(_) => ttm
    e => raise e
  }
}

///|
fn betas_conv_n(n : Int32, tm : Term) -> Thm raise {
  if n == 1 {
    @equal.try_conv(@equal.beta_conv)(tm)
  } else {
    @equal.thenc(
      @equal.rator_conv(t => betas_conv_n(n - 1, t)),
      @equal.try_conv(@equal.beta_conv),
    )(tm)
  }
}

///|
fn ho_betas_thm(bcs : List[(Int64, Term)], pat : Term, tm : Term) -> Thm raise {
  if @kernel.is_var(pat) || @kernel.is_const(pat) {
    fail_()
  }
  try {
    let (bv, bod) = @kernel.dest_abs(tm)
    let th = ho_betas_thm(bcs, @basics.body(pat), bod)
    @kernel.abs_rule(bv, th)
  } catch {
    Failure(_) => {
      let (hop, args) = @basics.strip_comb(pat)
      try {
        let n = @lib.rev_assoc(hop, bcs)
        if args.length().to_int64() == n {
          betas_conv_n(n.to_int(), tm)
        } else {
          fail_()
        }
      } catch {
        Failure(_) => {
          let (lpat, rpat) = @kernel.dest_comb(pat)
          let (ltm, rtm) = @kernel.dest_comb(tm)
          try {
            let lth = ho_betas_thm(bcs, lpat, ltm)
            try {
              let rth = ho_betas_thm(bcs, rpat, rtm)
              @kernel.mk_comb_rule(lth, rth)
            } catch {
              Failure(_) => @equal.ap_thm(lth, rtm)
              e => raise e
            }
          } catch {
            Failure(_) => {
              let rth = ho_betas_thm(bcs, rpat, rtm)
              @equal.ap_term(ltm, rth)
            }
            e => raise e
          }
        }
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `INSTANTIATE`: apply an instantiation to a theorem.
pub fn instantiate_rule(i : Instantiation, th : Thm) -> Thm raise {
  let (bcs, tmin, tyin) = i
  let ith = if tyin.is_empty() { th } else { @kernel.inst_type(tyin, th) }
  if tmin.is_empty() {
    return ith
  }
  let tth = @kernel.inst_rule(tmin, ith)
  if @kernel.hyp(tth) == @kernel.hyp(th) {
    if bcs.is_empty() {
      tth
    } else {
      try {
        let eth = ho_betas_thm(bcs, @kernel.concl(ith), @kernel.concl(tth))
        @kernel.eq_mp(eth, tth)
      } catch {
        Failure(_) => tth
        e => raise e
      }
    }
  } else {
    raise Failure("INSTANTIATE: term or type var free in assumptions")
  }
}

///|
/// `INSTANTIATE_ALL`: instantiate, also in the relevant assumptions.
pub fn instantiate_all(i : Instantiation, th : Thm) -> Thm raise {
  let (_, tmin, tyin) = i
  if tmin.is_empty() && tyin.is_empty() {
    return th
  }
  let hyps = @kernel.hyp(th)
  if hyps.is_empty() {
    return instantiate_rule(i, th)
  }
  let (tyrel, tyiirel) = if tyin.is_empty() {
    (@list.List([]), hyps)
  } else {
    let tvs = @lib.itlist(
      (p : (HolType, HolType), acc) => @lib.union(@kernel.tyvars(p.1), acc),
      tyin,
      @list.List([]),
    )
    @lib.partition(
      tm => !@lib.intersect(tvs, @kernel.type_vars_in_term(tm)).is_empty(),
      hyps,
    )
  }
  let (tmrel, _) = if tmin.is_empty() {
    (@list.List([]), tyiirel)
  } else {
    let vs = @lib.itlist(
      (p : (Term, Term), acc) => @lib.union(@kernel.frees(p.1), acc),
      tmin,
      @list.List([]),
    )
    @lib.partition(
      tm => !@lib.intersect(vs, @kernel.frees(tm)).is_empty(),
      tyiirel,
    )
  }
  let rhyps = @lib.union(tyrel, tmrel)
  let th1 = @lib.rev_itlist(@bool.disch, rhyps, th)
  let th2 = instantiate_rule(i, th1)
  @lib.funpow(rhyps.length(), @bool.undisch, th2)
}

// ---------------------------------------------------------------------------
// Higher order matching of terms.
//
// In the event of spillover patterns this may return false results, but
// there is usually an implicit check outside that the match worked.
// ---------------------------------------------------------------------------

///|
/// `rev_assoc` that distinguishes "not found" (OCaml's `Failure "find"`).
fn[A, B : @lib.OCompare] rev_assoc_opt(x : B, l : List[(A, B)]) -> A? {
  for p in l {
    if p.1.ocompare(x) == 0 {
      return Some(p.0)
    }
  }
  None
}

///|
fn safe_inserta(
  n : (Term, Term),
  l : List[(Term, Term)],
) -> List[(Term, Term)] raise {
  let (y, x) = n
  match rev_assoc_opt(x, l) {
    Some(z) =>
      if @basics.aconv(y, z) {
        l
      } else {
        raise Failure("safe_inserta")
      }
    None => l.prepend(n)
  }
}

///|
fn[A : @lib.OCompare, B : @lib.OCompare] safe_insert(
  n : (A, B),
  l : List[(A, B)],
) -> List[(A, B)] raise {
  let (y, x) = n
  match rev_assoc_opt(x, l) {
    Some(z) => if y.ocompare(z) == 0 { l } else { raise Failure("safe_insert") }
    None => l.prepend(n)
  }
}

///|
/// The name of the dummy variable used for type instantiations (a
/// `genvar` taken when drule.ml loads).
let dummy_name : Cell[String] = Cell::new("term_match")

///|
fn mk_dummy(ty : HolType) -> Term {
  @kernel.mk_var(dummy_name.get(), ty)
}

///|
type Hom = (List[(Term, Term)], Term, Term)

///|
fn term_pmatch(
  lconsts : List[Term],
  env : List[(Term, Term)],
  vtm : Term,
  ctm : Term,
  sofar : (List[(Term, Term)], List[Hom]),
) -> (List[(Term, Term)], List[Hom]) raise {
  let (insts, homs) = sofar
  match (vtm, ctm) {
    (Var(_), _) =>
      match rev_assoc_opt(vtm, env) {
        Some(ctm1) =>
          if ctm1 == ctm {
            sofar
          } else {
            raise Failure("term_pmatch")
          }
        None =>
          if @lib.mem(vtm, lconsts) {
            if ctm == vtm {
              sofar
            } else {
              raise Failure("term_pmatch: can't instantiate local constant")
            }
          } else {
            (safe_inserta((ctm, vtm), insts), homs)
          }
      }
    (Const(vname, vty), Const(cname, cty)) =>
      if vname == cname {
        if vty == cty {
          sofar
        } else {
          (safe_insert((mk_dummy(cty), mk_dummy(vty)), insts), homs)
        }
      } else {
        raise Failure("term_pmatch")
      }
    (Abs(vv, vbod), Abs(cv, cbod)) => {
      let sofar1 = (
        safe_insert(
          (mk_dummy(@kernel.dest_var(cv).1), mk_dummy(@kernel.dest_var(vv).1)),
          insts,
        ),
        homs,
      )
      term_pmatch(lconsts, env.prepend((cv, vv)), vbod, cbod, sofar1)
    }
    _ => {
      let vhop = @lib.repeat(@kernel.rator, vtm)
      if @kernel.is_var(vhop) &&
        !@lib.mem(vhop, lconsts) &&
        rev_assoc_opt(vhop, env) is None {
        let vty = @kernel.type_of(vtm)
        let cty = @kernel.type_of(ctm)
        let insts1 = if vty == cty {
          insts
        } else {
          safe_insert((mk_dummy(cty), mk_dummy(vty)), insts)
        }
        (insts1, homs.prepend((env, ctm, vtm)))
      } else {
        let (lv, rv) = @kernel.dest_comb(vtm)
        let (lc, rc) = @kernel.dest_comb(ctm)
        let sofar1 = term_pmatch(lconsts, env, lv, lc, sofar)
        term_pmatch(lconsts, env, rv, rc, sofar1)
      }
    }
  }
}

///|
fn get_type_insts(
  insts : List[(Term, Term)],
  sofar : List[(HolType, HolType)],
) -> List[(HolType, HolType)] raise {
  @lib.itlist(
    (p : (Term, Term), acc) => {
      @basics.type_match(@kernel.dest_var(p.1).1, @kernel.type_of(p.0), acc)
    },
    insts,
    sofar,
  )
}

///|
fn separate_insts(insts : List[(Term, Term)]) -> Instantiation raise {
  let (realinsts, patterns) = @lib.partition(
    (p : (Term, Term)) => @kernel.is_var(p.1),
    insts,
  )
  let betacounts = if patterns.is_empty() {
    @list.List([])
  } else {
    @lib.itlist(
      (p : (Term, Term), sof : List[(Int64, Term)]) => {
        let (hop, args) = @basics.strip_comb(p.1)
        safe_insert((args.length().to_int64(), hop), sof) catch {
          Failure(_) => {
            @lib.warn(true, "Inconsistent patterning in higher order match")
            sof
          }
          e => raise e
        }
      },
      patterns,
      @list.List([]),
    )
  }
  let tyins = get_type_insts(realinsts, @list.List([]))
  let tmins = @lib.mapfilter(
    (p : (Term, Term)) => {
      let (t, x) = p
      let (xn, xty) = @kernel.dest_var(x)
      let x1 = @kernel.mk_var(xn, @kernel.type_subst(tyins, xty))
      if t == x1 {
        fail_()
      } else {
        (t, x1)
      }
    },
    realinsts,
  )
  (betacounts, tmins, tyins)
}

///|
fn term_homatch(
  lconsts : List[Term],
  tyins : List[(HolType, HolType)],
  ih : (List[(Term, Term)], List[Hom]),
) -> List[(Term, Term)] raise {
  let (insts, homs) = ih
  if homs.is_empty() {
    return insts
  }
  let (env, ctm, vtm) = @lib.hd(homs)
  if @kernel.is_var(vtm) {
    if ctm == vtm {
      return term_homatch(lconsts, tyins, (insts, @lib.tl(homs)))
    }
    let newtyins = safe_insert(
      (@kernel.type_of(ctm), @kernel.dest_var(vtm).1),
      tyins,
    )
    let newinsts = insts.prepend((ctm, vtm))
    return term_homatch(lconsts, newtyins, (newinsts, @lib.tl(homs)))
  }
  let (vhop, vargs) = @basics.strip_comb(vtm)
  let afvs = @kernel.freesl(vargs)
  let inst_fn = (t : Term) => @kernel.inst(tyins, t)
  // The handler below also covers the recursive call: a failure later on
  // backtracks to treating this pattern first-order.
  try {
    let tmins = @lib.map(
      (a : Term) => {
        let ia = inst_fn(a)
        let image = match rev_assoc_opt(a, env) {
          Some(t) => t
          None =>
            match rev_assoc_opt(a, insts) {
              Some(t) => t
              None => if @lib.mem(a, lconsts) { a } else { fail_() }
            }
        }
        (image, ia)
      },
      afvs,
    )
    let pats0 = @lib.map(inst_fn, vargs)
    let pats = @lib.map(p => @kernel.vsubst(tmins, p), pats0)
    let vhop1 = inst_fn(vhop)
    let ni = {
      let (chop, cargs) = @basics.strip_comb(ctm)
      if cargs == pats {
        if chop == vhop {
          insts
        } else {
          safe_inserta((chop, vhop), insts)
        }
      } else {
        let ginsts = @lib.map(
          (p : Term) => {
            (
              if @kernel.is_var(p) {
                p
              } else {
                @basics.genvar(@kernel.type_of(p))
              },
              p,
            )
          },
          pats,
        )
        let ctm1 = @basics.subst(ginsts, ctm)
        let gvs = @lib.map((g : (Term, Term)) => g.0, ginsts)
        let abstm = @basics.list_mk_abs(gvs, ctm1)
        let vinsts = safe_inserta((abstm, vhop), insts)
        let icpair = (ctm1, @basics.list_mk_comb(vhop1, gvs))
        vinsts.prepend(icpair)
      }
    }
    term_homatch(lconsts, tyins, (ni, @lib.tl(homs)))
  } catch {
    Failure(_) => {
      let (lc, rc) = @kernel.dest_comb(ctm)
      let (lv, rv) = @kernel.dest_comb(vtm)
      let pinsts_homs1 = term_pmatch(
        lconsts,
        env,
        rv,
        rc,
        (insts, @lib.tl(homs).prepend((env, lc, lv))),
      )
      let tyins1 = get_type_insts(pinsts_homs1.0, @list.List([]))
      term_homatch(lconsts, tyins1, pinsts_homs1)
    }
    e => raise e
  }
}

///|
/// `term_match lconsts vtm ctm`: higher-order matching of `vtm` against
/// `ctm`, treating the variables in `lconsts` as constants.
pub fn term_match(
  lconsts : List[Term],
  vtm : Term,
  ctm : Term,
) -> Instantiation raise {
  let pinsts_homs = term_pmatch(
    lconsts,
    @list.List([]),
    vtm,
    ctm,
    (@list.List([]), @list.List([])),
  )
  let tyins = get_type_insts(pinsts_homs.0, @list.List([]))
  let insts = term_homatch(lconsts, tyins, pinsts_homs)
  separate_insts(insts)
}

// ---------------------------------------------------------------------------
// First order unification of terms of the same type.
// ---------------------------------------------------------------------------

///|
fn tu_augment1(
  sofar : List[(Term, Term)],
  sx : (Term, Term),
) -> (Term, Term) raise {
  let (s, x) = sx
  let s1 = @basics.subst(sofar, s)
  if @kernel.vfree_in(x, s1) && s != x {
    raise Failure("term_unify: augment1")
  }
  (s1, x)
}

///|
fn tu_augment_insts(
  tv : (Term, Term),
  insts : List[(Term, Term)],
) -> List[(Term, Term)] raise {
  let (t, v) = tv
  let t1 = @kernel.vsubst(insts, t)
  if t1 == v {
    insts
  } else if @kernel.vfree_in(v, t1) {
    raise Failure("augment_insts")
  } else {
    let p = (t1, v)
    @lib.map(i => tu_augment1(@list.singleton(p), i), insts).prepend(p)
  }
}

///|
fn tu_unify(
  vars : List[Term],
  tm1 : Term,
  tm2 : Term,
  sofar : List[(Term, Term)],
) -> List[(Term, Term)] raise {
  if tm1 == tm2 {
    sofar
  } else if @kernel.is_var(tm1) && @lib.mem(tm1, vars) {
    match rev_assoc_opt(tm1, sofar) {
      Some(tm11) => tu_unify(vars, tm11, tm2, sofar)
      None => tu_augment_insts((tm2, tm1), sofar)
    }
  } else if @kernel.is_var(tm2) && @lib.mem(tm2, vars) {
    match rev_assoc_opt(tm2, sofar) {
      Some(tm21) => tu_unify(vars, tm1, tm21, sofar)
      None => tu_augment_insts((tm1, tm2), sofar)
    }
  } else if @kernel.is_abs(tm1) {
    let tm11 = @basics.body(tm1)
    // `subst [bndvar tm1,bndvar tm2] (body tm2)`: OCaml evaluates the
    // argument first, then the tuple right to left.
    let b2 = @basics.body(tm2)
    let v2 = @basics.bndvar(tm2)
    let tm21 = @basics.subst(@list.singleton((@basics.bndvar(tm1), v2)), b2)
    tu_unify(vars, tm11, tm21, sofar)
  } else {
    let (l1, r1) = @kernel.dest_comb(tm1)
    let (l2, r2) = @kernel.dest_comb(tm2)
    tu_unify(vars, l1, l2, tu_unify(vars, r1, r2, sofar))
  }
}

///|
/// `term_unify vars tm1 tm2`: first-order unification of terms of the same
/// type, instantiating only the variables in `vars`.
pub fn term_unify(
  vars : List[Term],
  tm1 : Term,
  tm2 : Term,
) -> Instantiation raise {
  (@list.List([]), tu_unify(vars, tm1, tm2, @list.List([])), @list.List([]))
}

// ---------------------------------------------------------------------------
// Unification of types.
// ---------------------------------------------------------------------------

///|
fn ty_augment_insts(
  tv : (HolType, HolType),
  insts : List[(HolType, HolType)],
) -> List[(HolType, HolType)] raise {
  let (ty, v) = tv
  let ty1 = @kernel.type_subst(insts, ty)
  if ty1 == v {
    insts
  } else if @basics.occurs_in(v, ty1) {
    raise Failure("type_unify: augment_insts")
  } else {
    let p = (ty1, v)
    let augment1 = (sx : (HolType, HolType)) => {
      let (s, x) = sx
      let s1 = @kernel.type_subst(@list.singleton(p), s)
      if @basics.occurs_in(x, s1) && s != x {
        raise Failure("type_unify: augment1")
      }
      (s1, x)
    }
    @lib.map(augment1, insts).prepend(p)
  }
}

///|
/// `type_unify ty1 ty2 sofar`: unification of types.
pub fn type_unify(
  ty1 : HolType,
  ty2 : HolType,
  sofar : List[(HolType, HolType)],
) -> List[(HolType, HolType)] raise {
  if ty1 == ty2 {
    sofar
  } else if @kernel.is_vartype(ty1) {
    match rev_assoc_opt(ty1, sofar) {
      Some(ty11) => type_unify(ty11, ty2, sofar)
      None => ty_augment_insts((ty2, ty1), sofar)
    }
  } else if @kernel.is_vartype(ty2) {
    match rev_assoc_opt(ty2, sofar) {
      Some(ty21) => type_unify(ty1, ty21, sofar)
      None => ty_augment_insts((ty1, ty2), sofar)
    }
  } else {
    let (l1, r1) = @kernel.dest_type(ty1)
    let (l2, r2) = @kernel.dest_type(ty2)
    if l1 == l2 {
      @lib.itlist2(type_unify, r1, r2, sofar)
    } else {
      raise Failure("unify_type")
    }
  }
}

// ---------------------------------------------------------------------------
// Unification of terms and their types together.
// ---------------------------------------------------------------------------

///|
fn augment_tyinsts(
  st : (Term, Term),
  tyinsts : List[(HolType, HolType)],
) -> List[(HolType, HolType)] raise {
  let (s, t) = st
  let sty = @kernel.type_of(@kernel.inst(tyinsts, s))
  let tty = @kernel.type_of(@kernel.inst(tyinsts, t))
  let tyinsts1 = type_unify(sty, tty, @list.List([]))
  tyinsts1.concat(
    @lib.map(
      (p : (HolType, HolType)) => (@kernel.type_subst(tyinsts1, p.0), p.1),
      tyinsts,
    ),
  )
}

///|
fn ttu_augment_insts(
  tv : (Term, Term),
  sofar : (List[(Term, Term)], List[(HolType, HolType)]),
) -> (List[(Term, Term)], List[(HolType, HolType)]) raise {
  let (t, v) = tv
  let (tminsts, tyinsts) = sofar
  let tminsts1 = @lib.map(
    (p : (Term, Term)) => {
      // `inst tyinsts t, inst tyinsts v`: right to left.
      let b = @kernel.inst(tyinsts, p.1)
      (@kernel.inst(tyinsts, p.0), b)
    },
    tminsts,
  )
  let t1 = @kernel.inst(tyinsts, @kernel.vsubst(tminsts1, t))
  let v1 = @kernel.inst(tyinsts, v)
  if t1 == v1 {
    (tminsts1, tyinsts)
  } else if @kernel.vfree_in(v1, t1) {
    raise Failure("term_unify: augment_insts")
  } else {
    let p = (t1, v1)
    (
      @lib.map(i => tu_augment1(@list.singleton(p), i), tminsts1).prepend(p),
      tyinsts,
    )
  }
}

///|
fn ttu_unify(
  tm1 : Term,
  tm2 : Term,
  sofar : (List[(Term, Term)], List[(HolType, HolType)]),
) -> (List[(Term, Term)], List[(HolType, HolType)]) raise {
  let (tminsts, tyinsts) = sofar
  if tm1 == tm2 {
    sofar
  } else if @kernel.is_var(tm1) {
    match rev_assoc_opt(tm1, tminsts) {
      Some(tm11) => ttu_unify(tm11, tm2, sofar)
      None => {
        let tys = augment_tyinsts((tm1, tm2), tyinsts)
        ttu_augment_insts((tm2, tm1), (tminsts, tys))
      }
    }
  } else if @kernel.is_var(tm2) {
    match rev_assoc_opt(tm2, tminsts) {
      Some(tm21) => ttu_unify(tm1, tm21, sofar)
      None => {
        let tys = augment_tyinsts((tm1, tm2), tyinsts)
        ttu_augment_insts((tm1, tm2), (tminsts, tys))
      }
    }
  } else if @kernel.is_abs(tm1) {
    let tm11 = @basics.body(tm1)
    // `subst [bndvar tm1,bndvar tm2] (body tm2)`: OCaml evaluates the
    // argument first, then the tuple right to left.
    let b2 = @basics.body(tm2)
    let v2 = @basics.bndvar(tm2)
    let tm21 = @basics.subst(@list.singleton((@basics.bndvar(tm1), v2)), b2)
    ttu_unify(tm11, tm21, sofar)
  } else if @kernel.is_const(tm1) {
    if @printer.name_of(tm1) != @printer.name_of(tm2) {
      raise Failure("term_unify")
    }
    (tminsts, augment_tyinsts((tm1, tm2), tyinsts))
  } else {
    let (l1, r1) = @kernel.dest_comb(tm1)
    let (l2, r2) = @kernel.dest_comb(tm2)
    ttu_unify(l1, l2, ttu_unify(r1, r2, sofar))
  }
}

///|
/// `term_type_unify tm1 tm2 i`: unify terms and their types together.
pub fn term_type_unify(
  tm1 : Term,
  tm2 : Term,
  i : Instantiation,
) -> Instantiation raise {
  let (it, tminsts, tyinsts) = i
  let (tminsts1, tyinsts1) = ttu_unify(tm1, tm2, (tminsts, tyinsts))
  (it, tminsts1, tyinsts1)
}

// ---------------------------------------------------------------------------
// Modify bound variable names at depth.
// ---------------------------------------------------------------------------

///|
fn tryalpha(v : Term, tm : Term) -> Term raise {
  @basics.alpha(v, tm) catch {
    Failure(_) =>
      try {
        let v1 = @kernel.variant(@kernel.frees(tm), v)
        @basics.alpha(v1, tm)
      } catch {
        Failure(_) => tm
        e => raise e
      }
    e => raise e
  }
}

///|
/// `deep_alpha env tm`: rename bound variables at depth according to
/// `env`, a list of `(new name, old name)` pairs.
pub fn deep_alpha(env : List[(String, String)], tm : Term) -> Term raise {
  if env.is_empty() {
    return tm
  }
  try {
    let (v, bod) = @kernel.dest_abs(tm)
    let (vn, vty) = @kernel.dest_var(v)
    try {
      let ((vn1, _), newenv) = @lib.remove(
        (p : (String, String)) => p.1 == vn,
        env,
      )
      let v1 = @kernel.mk_var(vn1, vty)
      let tm1 = tryalpha(v1, tm)
      let (iv, ib) = @kernel.dest_abs(tm1)
      @kernel.mk_abs(iv, deep_alpha(newenv, ib))
    } catch {
      Failure(_) => @kernel.mk_abs(v, deep_alpha(env, bod))
      e => raise e
    }
  } catch {
    Failure(_) =>
      try {
        let (l, r) = @kernel.dest_comb(tm)
        // `mk_comb(deep_alpha env l, deep_alpha env r)`: right to left.
        let r1 = deep_alpha(env, r)
        @kernel.mk_comb(deep_alpha(env, l), r1)
      } catch {
        Failure(_) => tm
        e => raise e
      }
    e => raise e
  }
}

// ---------------------------------------------------------------------------
// Instantiate a theorem by matching part of it to a term.
// ---------------------------------------------------------------------------

///|
fn match_bvs(
  t1 : Term,
  t2 : Term,
  acc : List[(String, String)],
) -> List[(String, String)] raise {
  try {
    let (v1, b1) = @kernel.dest_abs(t1)
    let (v2, b2) = @kernel.dest_abs(t2)
    let n1 = @kernel.dest_var(v1).0
    let n2 = @kernel.dest_var(v2).0
    let newacc = if n1 == n2 { acc } else { @lib.insert((n1, n2), acc) }
    match_bvs(b1, b2, newacc)
  } catch {
    Failure(_) =>
      try {
        let (l1, r1) = @kernel.dest_comb(t1)
        let (l2, r2) = @kernel.dest_comb(t2)
        match_bvs(l1, l2, match_bvs(r1, r2, acc))
      } catch {
        Failure(_) => acc
        e => raise e
      }
    e => raise e
  }
}

///|
/// `PART_MATCH partfn th`: a function instantiating `th` so that
/// `partfn` of its conclusion matches a given term.
pub fn part_match(
  partfn : (Term) -> Term raise,
  th : Thm,
) -> ((Term) -> Thm raise) raise {
  let sth = @bool.spec_all(th)
  let bod = @kernel.concl(sth)
  let pbod = partfn(bod)
  let lconsts = @lib.intersect(
    @kernel.frees(@kernel.concl(th)),
    @kernel.freesl(@kernel.hyp(th)),
  )
  tm => {
    let bvms = match_bvs(tm, pbod, @list.List([]))
    let abod = deep_alpha(bvms, bod)
    let ath = @kernel.eq_mp(@equal.alpha_rule(bod, abod), sth)
    let insts = term_match(lconsts, partfn(abod), tm)
    let fth = instantiate_rule(insts, ath)
    if @kernel.hyp(fth) != @kernel.hyp(ath) {
      raise Failure("PART_MATCH: instantiated hyps")
    }
    let tm1 = partfn(@kernel.concl(fth))
    if tm1 == tm {
      fth
    } else {
      @equal.subs(@list.singleton(@equal.alpha_rule(tm1, tm)), fth) catch {
        Failure(_) => raise Failure("PART_MATCH: Sanity check failure")
        e => raise e
      }
    }
  }
}

///|
/// `GEN_PART_MATCH`: like `PART_MATCH`, renaming free variables of the
/// theorem to avoid clashes.
pub fn gen_part_match(
  partfn : (Term) -> Term raise,
  th : Thm,
) -> ((Term) -> Thm raise) raise {
  let sth = @bool.spec_all(th)
  let bod = @kernel.concl(sth)
  let pbod = partfn(bod)
  let lconsts = @lib.intersect(
    @kernel.frees(@kernel.concl(th)),
    @kernel.freesl(@kernel.hyp(th)),
  )
  let fvs = @lib.subtract(
    @lib.subtract(@kernel.frees(bod), @kernel.frees(pbod)),
    lconsts,
  )
  tm => {
    let bvms = match_bvs(tm, pbod, @list.List([]))
    let abod = deep_alpha(bvms, bod)
    let ath = @kernel.eq_mp(@equal.alpha_rule(bod, abod), sth)
    let insts = term_match(lconsts, partfn(abod), tm)
    let eth = instantiate_rule(insts, @bool.genl(fvs, ath))
    let fth = @lib.itlist((_, th) => @bool.spec_var(th).1, fvs, eth)
    if @kernel.hyp(fth) != @kernel.hyp(ath) {
      raise Failure("PART_MATCH: instantiated hyps")
    }
    let tm1 = partfn(@kernel.concl(fth))
    if tm1 == tm {
      fth
    } else {
      @equal.subs(@list.singleton(@equal.alpha_rule(tm1, tm)), fth) catch {
        Failure(_) => raise Failure("PART_MATCH: Sanity check failure")
        e => raise e
      }
    }
  }
}

///|
/// `MATCH_MP ith`: matching modus ponens.
pub fn match_mp(ith : Thm) -> ((Thm) -> Thm raise) raise {
  let sth = try {
    let tm = @kernel.concl(ith)
    let (avs, bod) = @basics.strip_forall(tm)
    let (ant, _) = @basics.dest_imp(bod)
    let (svs, pvs) = @lib.partition(v => @kernel.vfree_in(v, ant), avs)
    if pvs.is_empty() {
      ith
    } else {
      let th1 = @bool.specl(avs, @kernel.assume_rule(tm))
      let th2 = @bool.genl(
        svs,
        @bool.disch(ant, @bool.genl(pvs, @bool.undisch(th1))),
      )
      @bool.mp(@bool.disch(tm, th2), ith)
    }
  } catch {
    Failure(_) => raise Failure("MATCH_MP: Not an implication")
    e => raise e
  }
  let match_fun = part_match(t => @basics.dest_imp(t).0, sth)
  th => {
    @bool.mp(match_fun(@kernel.concl(th)), th) catch {
      Failure(_) => raise Failure("MATCH_MP: No match")
      e => raise e
    }
  }
}

// ---------------------------------------------------------------------------
// Useful instance of more general higher order matching.
// ---------------------------------------------------------------------------

///|
fn beta_convs(n : Int32) -> Conv {
  if n == 1 {
    @equal.try_conv(@equal.beta_conv)
  } else {
    @equal.thenc(
      @equal.rator_conv(beta_convs(n - 1)),
      @equal.try_conv(@equal.beta_conv),
    )
  }
}

///|
fn free_beta(v : Term, tm : Term) -> Conv raise {
  if @kernel.is_abs(tm) {
    let (bv, bod) = @kernel.dest_abs(tm)
    if v == bv {
      raise Failure("unchanged")
    }
    return @equal.abs_conv(free_beta(v, bod))
  }
  let (op, args) = @basics.strip_comb(tm)
  if args.is_empty() {
    raise Failure("unchanged")
  }
  if op == v {
    return beta_convs(args.length())
  }
  let (l, r) = @kernel.dest_comb(tm)
  try {
    let lconv = free_beta(v, l)
    try free_beta(v, r) catch {
      Failure(_) => @equal.rator_conv(lconv)
      e => raise e
    } noraise {
      rconv => @equal.comb2_conv(lconv, rconv)
    }
  } catch {
    Failure(_) => @equal.rand_conv(free_beta(v, r))
    e => raise e
  }
}

///|
/// `HIGHER_REWRITE_CONV ths top`: rewrite with higher-order equations
/// `|- P (f x) = ...`, at the top-most (`top`) or an innermost match.
pub fn higher_rewrite_conv(ths : List[Thm]) -> ((Bool) -> Conv) raise {
  let ginst = (th : Thm) => {
    let fvs = @lib.subtract(
      @kernel.frees(@kernel.concl(th)),
      @kernel.freesl(@kernel.hyp(th)),
    )
    let gvs = @lib.map(v => @basics.genvar(@kernel.type_of(v)), fvs)
    @kernel.inst_rule(@lib.zip(gvs, fvs), th)
  }
  let thl = @lib.map(th => ginst(@bool.spec_all(th)), ths)
  let concs = @lib.map(@kernel.concl, thl)
  let lefts = @lib.map(@equal.lhs, concs)
  let (preds, pats) = @lib.unzip(@lib.map(@kernel.dest_comb, lefts))
  let beta_fns = @lib.map2(free_beta, preds, concs)
  let ass_list = @lib.zip(pats, @lib.zip(preds, @lib.zip(thl, beta_fns)))
  let mnet = @lib.itlist(
    (p, n) => @nets.enter(@list.List([]), p, p, n),
    pats,
    @nets.empty_net(),
  )
  let look_fn = (t : Term) => {
    @lib.mapfilter(
      (p : Term) => {
        if @lib.can(x => term_match(@list.List([]), p, x), t) {
          p
        } else {
          fail_()
        }
      },
      @nets.lookup(t, mnet),
    )
  }
  top => {
    tm => {
      let pred = (t : Term) => !look_fn(t).is_empty() && @basics.free_in(t, tm)
      let stm = if top {
        @basics.find_term(pred, tm)
      } else {
        @lib.hd(@lib.sort(@basics.free_in, @basics.find_terms(pred, tm)))
      }
      let pat = @lib.hd(look_fn(stm))
      let (_, tmin, _tyin) = term_match(@list.List([]), pat, stm)
      let (pred1, (th, beta_fn)) = @lib.assoc(pat, ass_list)
      let gv = @basics.genvar(@kernel.type_of(stm))
      let abs = @kernel.mk_abs(
        gv,
        @basics.subst(@list.singleton((gv, stm)), tm),
      )
      let (_, tmin0, tyin0) = term_match(@list.List([]), pred1, abs)
      @equal.conv_rule(
        beta_fn,
        @kernel.inst_rule(
          tmin,
          @kernel.inst_rule(tmin0, @kernel.inst_type(tyin0, th)),
        ),
      )
    }
  }
}

// ---------------------------------------------------------------------------
// Definitions.
// ---------------------------------------------------------------------------

///|
/// `new_definition`: define a constant by `|- !x1..xn. c x1 .. xn = t`.
pub fn new_definition(tm : Term) -> Thm raise {
  let (avs, bod) = @basics.strip_forall(tm)
  let (l, r) = @kernel.dest_eq(bod) catch {
    Failure(_) => raise Failure("new_definition: Not an equation")
    e => raise e
  }
  let (lv, largs) = @basics.strip_comb(l)
  let rtm = @basics.list_mk_abs(largs, r) catch {
    Failure(_) => raise Failure("new_definition: Non-variable in LHS pattern")
    e => raise e
  }
  let def = @basics.mk_eq(lv, rtm)
  let th1 = @kernel.new_basic_definition(def)
  let th2 = @lib.rev_itlist(
    (t, th) => {
      let ith = @equal.ap_thm(th, t)
      @kernel.trans(ith, @equal.beta_conv(@kernel.rand(@kernel.concl(ith))))
    },
    largs,
    th1,
  )
  let rvs = @lib.filter(v => !@lib.mem(v, avs), largs)
  @lib.itlist(@bool.gen, rvs, @lib.itlist(@bool.gen, avs, th2))
}

///|
fn load_steps() -> Unit raise {
  mk_conj_andtm.set(q("(/\\)"))
  mk_disj_ortm.set(q("(\\/)"))
  mk_forall_atm.set(@kernel.mk_const("forall", @list.List([])))
  mk_exists_atm.set(@kernel.mk_const("?", @list.List([])))
  // `term_match`'s dummy variable name.
  dummy_name.set(@kernel.dest_var(@basics.genvar(@kernel.aty)).0)
}
