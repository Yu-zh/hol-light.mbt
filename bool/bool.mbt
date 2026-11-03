// ===========================================================================
// Boolean theory including (intuitionistic) definitions of the logical
// connectives (port of bool.ml).
//
// Its `fn init` runs upstream's load-time steps in order: syntax
// declarations, definitions, and the theorems that derived rules
// precompute. Quotations
// are parsed in OCaml's evaluation order (arguments right to left,
// `let ... and ...` left to right), so the global counters advance exactly
// as upstream.
// ===========================================================================

///|
using @kernel {type Term, type Thm, type HolType}

///|
using @list {type List}

///|
using @lib {type Cell}

///|
fn q(s : String) -> Term raise {
  @parser.parse_term(s)
}

///|
fn th_cell(name : String) -> Cell[Thm] {
  Cell::new(name)
}

///|
fn tm_cell(name : String) -> Cell[Term] {
  Cell::new(name)
}

// ---------------------------------------------------------------------------
// Load state.
// ---------------------------------------------------------------------------

///|
/// Loading: importing this package runs upstream's bool.ml load-time
/// steps, in order, after the theories it imports.
fn init {
  @parser.begin_theory("bool")
  load_steps() catch {
    e => abort("HOL Light: loading bool.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

// ---------------------------------------------------------------------------
// Special syntax for Boolean equations (IFF).
// ---------------------------------------------------------------------------

///|
pub fn is_iff(tm : Term) -> Bool {
  tm
  is Comb(
    Comb(Const("=", Tyapp("fun", More(Tyapp("bool", Empty), tail=_))), _),
    _
  )
}

///|
pub fn dest_iff(tm : Term) -> (Term, Term) raise {
  match tm {
    Comb(
      Comb(Const("=", Tyapp("fun", More(Tyapp("bool", Empty), tail=_))), l),
      r
    ) => (l, r)
    _ => raise Failure("dest_iff")
  }
}

///|
let mk_iff_eq_tm : Cell[Term] = tm_cell("mk_iff")

///|
pub fn mk_iff(l : Term, r : Term) -> Term raise {
  let eq_tm = mk_iff_eq_tm.get()
  @kernel.mk_comb(@kernel.mk_comb(eq_tm, l), r)
}

// ---------------------------------------------------------------------------
// Instantiation of polymorphic proformas; PROVE_HYP.
// ---------------------------------------------------------------------------

///|
/// `PINST`: instantiate types, then terms (whose variables are given at
/// the original types).
pub fn pinst(
  tyin : List[(HolType, HolType)],
  tmin : List[(Term, Term)],
  th : Thm,
) -> Thm raise {
  let theta = @lib.map(
    (p : (Term, Term)) => (p.0, @kernel.inst(tyin, p.1)),
    tmin,
  )
  @kernel.inst_rule(theta, @kernel.inst_type(tyin, th)) catch {
    Failure(_) => raise Failure("PINST")
    e => raise e
  }
}

///|
/// `PROVE_HYP`: discharge an assumption of `bth` using `ath`.
pub fn prove_hyp(ath : Thm, bth : Thm) -> Thm raise {
  if @lib.exists(h => @basics.aconv(@kernel.concl(ath), h), @kernel.hyp(bth)) {
    @kernel.eq_mp(@kernel.deduct_antisym_rule(ath, bth), ath)
  } else {
    bth
  }
}

// ---------------------------------------------------------------------------
// T.
// ---------------------------------------------------------------------------

///|
let t_def_c : Cell[Thm] = th_cell("T_DEF")

///|
/// `T_DEF`: `|- T = ((\p. p) = (\p. p))`
pub fn t_def() -> Thm {
  t_def_c.get()
}

///|
let truth_c : Cell[Thm] = th_cell("TRUTH")

///|
/// `TRUTH`: `|- T`
pub fn truth() -> Thm {
  truth_c.get()
}

///|
/// `EQT_ELIM`: from `|- t = T` derive `|- t`.
pub fn eqt_elim(th : Thm) -> Thm raise {
  @kernel.eq_mp(@equal.sym(th), truth()) catch {
    Failure(_) => raise Failure("EQT_ELIM")
    e => raise e
  }
}

///|
let eqt_intro_t : Cell[Term] = tm_cell("EQT_INTRO")

///|
let eqt_intro_pth : Cell[Thm] = th_cell("EQT_INTRO")

///|
/// `EQT_INTRO`: from `|- t` derive `|- t = T`.
pub fn eqt_intro(th : Thm) -> Thm raise {
  @kernel.eq_mp(
    @kernel.inst_rule(
      @list.singleton((@kernel.concl(th), eqt_intro_t.get())),
      eqt_intro_pth.get(),
    ),
    th,
  )
}

// ---------------------------------------------------------------------------
// Conjunction.
// ---------------------------------------------------------------------------

///|
let and_def_c : Cell[Thm] = th_cell("AND_DEF")

///|
/// `AND_DEF`
pub fn and_def() -> Thm {
  and_def_c.get()
}

///|
pub fn mk_conj(l : Term, r : Term) -> Term raise {
  @basics.mk_binary("/\\", l, r)
}

///|
pub fn list_mk_conj(l : List[Term]) -> Term raise {
  @lib.end_itlist(mk_conj, l)
}

///|
let conj_p : Cell[Term] = tm_cell("CONJ")

///|
let conj_q : Cell[Term] = tm_cell("CONJ")

///|
let conj_pth : Cell[Thm] = th_cell("CONJ")

///|
/// `CONJ`: from `|- p` and `|- q` derive `|- p /\ q`.
pub fn conj(th1 : Thm, th2 : Thm) -> Thm raise {
  let th = @kernel.inst_rule(
    @list.List([
      (@kernel.concl(th1), conj_p.get()),
      (@kernel.concl(th2), conj_q.get()),
    ]),
    conj_pth.get(),
  )
  @kernel.eq_mp(@kernel.eq_mp(@kernel.deduct_antisym_rule(th1, th), th1), th2)
}

///|
let conjunct1_p : Cell[Term] = tm_cell("CONJUNCT1")

///|
let conjunct1_q : Cell[Term] = tm_cell("CONJUNCT1")

///|
let conjunct1_pth : Cell[Thm] = th_cell("CONJUNCT1")

///|
/// `CONJUNCT1`: from `|- p /\ q` derive `|- p`.
pub fn conjunct1(th : Thm) -> Thm raise {
  let result = try {
    let (l, r) = @basics.dest_conj(@kernel.concl(th))
    @kernel.eq_mp(
      @kernel.deduct_antisym_rule(
        th,
        @kernel.inst_rule(
          @list.List([(l, conjunct1_p.get()), (r, conjunct1_q.get())]),
          conjunct1_pth.get(),
        ),
      ),
      th,
    )
  } catch {
    Failure(_) => raise Failure("CONJUNCT1")
    e => raise e
  }
  result
}

///|
let conjunct2_p : Cell[Term] = tm_cell("CONJUNCT2")

///|
let conjunct2_q : Cell[Term] = tm_cell("CONJUNCT2")

///|
let conjunct2_pth : Cell[Thm] = th_cell("CONJUNCT2")

///|
/// `CONJUNCT2`: from `|- p /\ q` derive `|- q`.
pub fn conjunct2(th : Thm) -> Thm raise {
  let result = try {
    let (l, r) = @basics.dest_conj(@kernel.concl(th))
    @kernel.eq_mp(
      @kernel.deduct_antisym_rule(
        th,
        @kernel.inst_rule(
          @list.List([(l, conjunct2_p.get()), (r, conjunct2_q.get())]),
          conjunct2_pth.get(),
        ),
      ),
      th,
    )
  } catch {
    Failure(_) => raise Failure("CONJUNCT2")
    e => raise e
  }
  result
}

///|
/// `CONJ_PAIR`
pub fn conj_pair(th : Thm) -> (Thm, Thm) raise {
  let result = try {
    // OCaml evaluates the tuple right to left.
    let th2 = conjunct2(th)
    (conjunct1(th), th2)
  } catch {
    Failure(_) => raise Failure("CONJ_PAIR: Not a conjunction")
    e => raise e
  }
  result
}

///|
/// `CONJUNCTS`
pub fn conjuncts_rule(th : Thm) -> List[Thm] raise {
  @lib.striplist(conj_pair, th)
}

// ---------------------------------------------------------------------------
// Implication.
// ---------------------------------------------------------------------------

///|
let imp_def_c : Cell[Thm] = th_cell("IMP_DEF")

///|
/// `IMP_DEF`
pub fn imp_def() -> Thm {
  imp_def_c.get()
}

///|
pub fn mk_imp(l : Term, r : Term) -> Term raise {
  @basics.mk_binary("==>", l, r)
}

///|
let mp_p : Cell[Term] = tm_cell("MP")

///|
let mp_q : Cell[Term] = tm_cell("MP")

///|
let mp_rth : Cell[Thm] = th_cell("MP")

///|
/// `MP`: from `|- p ==> q` and `|- p` derive `|- q`.
pub fn mp(ith : Thm, th : Thm) -> Thm raise {
  let (ant, con) = @basics.dest_imp(@kernel.concl(ith))
  if @basics.aconv(ant, @kernel.concl(th)) {
    @kernel.eq_mp(
      @kernel.eq_mp(
        @kernel.deduct_antisym_rule(
          th,
          @kernel.inst_rule(
            @list.List([(ant, mp_p.get()), (con, mp_q.get())]),
            mp_rth.get(),
          ),
        ),
        th,
      ),
      ith,
    )
  } else {
    raise Failure("MP: theorems do not agree")
  }
}

///|
let disch_p : Cell[Term] = tm_cell("DISCH")

///|
let disch_q : Cell[Term] = tm_cell("DISCH")

///|
let disch_pth : Cell[Thm] = th_cell("DISCH")

///|
/// `DISCH`: from `A |- t` derive `A - {a} |- a ==> t`.
pub fn disch(a : Term, th : Thm) -> Thm raise {
  let th1 = conj(@kernel.assume_rule(a), th)
  let th2 = conjunct1(@kernel.assume_rule(@kernel.concl(th1)))
  let th3 = @kernel.deduct_antisym_rule(th1, th2)
  let th4 = @kernel.inst_rule(
    @list.List([(a, disch_p.get()), (@kernel.concl(th), disch_q.get())]),
    disch_pth.get(),
  )
  @kernel.eq_mp(th4, th3)
}

///|
/// `DISCH_ALL`: discharge all assumptions.
pub fn disch_all(th : Thm) -> Thm raise {
  let mut th = th
  while true {
    let next = disch(@lib.hd(@kernel.hyp(th)), th) catch {
      Failure(_) => return th
      e => raise e
    }
    th = next
  }
  th
}

///|
/// `UNDISCH`: from `|- a ==> t` derive `a |- t`.
pub fn undisch(th : Thm) -> Thm raise {
  mp(th, @kernel.assume_rule(@kernel.rand(@kernel.rator(@kernel.concl(th))))) catch {
    Failure(_) => raise Failure("UNDISCH")
    e => raise e
  }
}

///|
/// `UNDISCH_ALL`
pub fn undisch_all(th : Thm) -> Thm raise {
  let mut th = th
  while @basics.is_imp(@kernel.concl(th)) {
    th = undisch(th)
  }
  th
}

///|
let imp_antisym_p : Cell[Term] = tm_cell("IMP_ANTISYM_RULE")

///|
let imp_antisym_q : Cell[Term] = tm_cell("IMP_ANTISYM_RULE")

///|
let imp_antisym_pth : Cell[Thm] = th_cell("IMP_ANTISYM_RULE")

///|
/// `IMP_ANTISYM_RULE`: from `|- p ==> q` and `|- q ==> p` derive `|- p = q`.
pub fn imp_antisym_rule(th1 : Thm, th2 : Thm) -> Thm raise {
  let (p1, q1) = @basics.dest_imp(@kernel.concl(th1))
  @kernel.eq_mp(
    @kernel.inst_rule(
      @list.List([(p1, imp_antisym_p.get()), (q1, imp_antisym_q.get())]),
      imp_antisym_pth.get(),
    ),
    conj(th1, th2),
  )
}

///|
/// `ADD_ASSUM`
pub fn add_assum(tm : Term, th : Thm) -> Thm raise {
  // OCaml evaluates `MP (DISCH tm th) (ASSUME tm)` right to left.
  let a = @kernel.assume_rule(tm)
  mp(disch(tm, th), a)
}

///|
let eq_imp_p : Cell[Term] = tm_cell("EQ_IMP_RULE")

///|
let eq_imp_q : Cell[Term] = tm_cell("EQ_IMP_RULE")

///|
let eq_imp_pth1 : Cell[Thm] = th_cell("EQ_IMP_RULE")

///|
let eq_imp_pth2 : Cell[Thm] = th_cell("EQ_IMP_RULE")

///|
/// `EQ_IMP_RULE`: from `|- p <=> q` derive `|- p ==> q` and `|- q ==> p`.
pub fn eq_imp_rule(th : Thm) -> (Thm, Thm) raise {
  let (l, r) = dest_iff(@kernel.concl(th))
  let theta = @list.List([(l, eq_imp_p.get()), (r, eq_imp_q.get())])
  // The pair is evaluated right to left.
  let second = mp(@kernel.inst_rule(theta, eq_imp_pth2.get()), th)
  (mp(@kernel.inst_rule(theta, eq_imp_pth1.get()), th), second)
}

///|
let imp_trans_p : Cell[Term] = tm_cell("IMP_TRANS")

///|
let imp_trans_q : Cell[Term] = tm_cell("IMP_TRANS")

///|
let imp_trans_r : Cell[Term] = tm_cell("IMP_TRANS")

///|
let imp_trans_pth : Cell[Thm] = th_cell("IMP_TRANS")

///|
/// `IMP_TRANS`: from `|- p ==> q` and `|- q ==> r` derive `|- p ==> r`.
pub fn imp_trans(th1 : Thm, th2 : Thm) -> Thm raise {
  let (x, y) = @basics.dest_imp(@kernel.concl(th1))
  let (y1, z) = @basics.dest_imp(@kernel.concl(th2))
  if y != y1 {
    raise Failure("IMP_TRANS")
  }
  mp(
    mp(
      @kernel.inst_rule(
        @list.List([
          (x, imp_trans_p.get()),
          (y, imp_trans_q.get()),
          (z, imp_trans_r.get()),
        ]),
        imp_trans_pth.get(),
      ),
      th1,
    ),
    th2,
  )
}

// ---------------------------------------------------------------------------
// Universal quantification.
// ---------------------------------------------------------------------------

///|
let forall_def_c : Cell[Thm] = th_cell("FORALL_DEF")

///|
/// `FORALL_DEF`
pub fn forall_def() -> Thm {
  forall_def_c.get()
}

///|
pub fn mk_forall(v : Term, tm : Term) -> Term raise {
  @basics.mk_binder("forall", v, tm)
}

///|
pub fn list_mk_forall(vs : List[Term], bod : Term) -> Term raise {
  @lib.itlist(mk_forall, vs, bod)
}

///|
let spec_p : Cell[Term] = tm_cell("SPEC")

///|
let spec_x : Cell[Term] = tm_cell("SPEC")

///|
let spec_pth : Cell[Thm] = th_cell("SPEC")

///|
/// `SPEC`: from `|- !x. t` derive `|- t[tm/x]`.
pub fn spec(tm : Term, th : Thm) -> Thm raise {
  let result = try {
    let abs = @kernel.rand(@kernel.concl(th))
    @equal.conv_rule(
      @equal.beta_conv,
      mp(
        pinst(
          @list.singleton(
            (@kernel.dest_var(@basics.bndvar(abs)).1, @kernel.aty),
          ),
          @list.List([(abs, spec_p.get()), (tm, spec_x.get())]),
          spec_pth.get(),
        ),
        th,
      ),
    )
  } catch {
    Failure(_) => raise Failure("SPEC")
    e => raise e
  }
  result
}

///|
/// `SPECL`
pub fn specl(tms : List[Term], th : Thm) -> Thm raise {
  @lib.rev_itlist(spec, tms, th) catch {
    Failure(_) => raise Failure("SPECL")
    e => raise e
  }
}

///|
/// `SPEC_VAR`: specialize with a fresh variant of the bound variable.
pub fn spec_var(th : Thm) -> (Term, Thm) raise {
  let bv = @kernel.variant(
    @basics.thm_frees(th),
    @basics.bndvar(@kernel.rand(@kernel.concl(th))),
  )
  (bv, spec(bv, th))
}

///|
/// `SPEC_ALL`
pub fn spec_all(th : Thm) -> Thm raise {
  let mut th = th
  while @basics.is_forall(@kernel.concl(th)) {
    th = spec_var(th).1
  }
  th
}

///|
/// `ISPEC`: specialize, instantiating types as needed.
pub fn ispec(t : Term, th : Thm) -> Thm raise {
  let (x, _) = @basics.dest_forall(@kernel.concl(th)) catch {
    Failure(_) =>
      raise Failure("ISPEC: input theorem not universally quantified")
    e => raise e
  }
  let tyins = @basics.type_match(
    @kernel.dest_var(x).1,
    @kernel.type_of(t),
    @list.List([]),
  ) catch {
    Failure(_) => raise Failure("ISPEC can't type-instantiate input theorem")
    e => raise e
  }
  spec(t, @kernel.inst_type(tyins, th)) catch {
    Failure(_) => raise Failure("ISPEC: type variable(s) free in assumptions")
    e => raise e
  }
}

///|
/// `ISPECL`
pub fn ispecl(tms : List[Term], th : Thm) -> Thm raise {
  let result = try {
    if tms.is_empty() {
      th
    } else {
      let avs = @lib.chop_list(
          tms.length(),
          @basics.strip_forall(@kernel.concl(th)).0,
        ).0
      // `itlist2 type_match (map ...) (map type_of tms) []`: the
      // arguments are evaluated right to left.
      let tys = @lib.map(@kernel.type_of, tms)
      let vtys = @lib.map(v => @kernel.dest_var(v).1, avs)
      let tyins = @lib.itlist2(
        (a, b, acc) => @basics.type_match(a, b, acc),
        vtys,
        tys,
        @list.List([]),
      )
      specl(tms, @kernel.inst_type(tyins, th))
    }
  } catch {
    Failure(_) => raise Failure("ISPECL")
    e => raise e
  }
  result
}

///|
let gen_pth : Cell[Thm] = th_cell("GEN")

///|
/// `GEN`: from `A |- t` derive `A |- !x. t` (x not free in A).
pub fn gen(x : Term, th : Thm) -> Thm raise {
  let qth = @kernel.inst_type(
    @list.singleton((@kernel.dest_var(x).1, @kernel.aty)),
    gen_pth.get(),
  )
  let ptm = @kernel.rand(@kernel.rand(@kernel.concl(qth)))
  let th1 = @kernel.abs_rule(x, eqt_intro(th))
  let phi = @equal.lhand(@kernel.concl(th1))
  let rth = @kernel.inst_rule(@list.singleton((phi, ptm)), qth)
  @kernel.eq_mp(rth, th1)
}

///|
/// `GENL`
pub fn genl(xs : List[Term], th : Thm) -> Thm raise {
  @lib.itlist(gen, xs, th)
}

///|
/// `GEN_ALL`: generalize over all free variables not free in the
/// assumptions.
pub fn gen_all(th : Thm) -> Thm raise {
  let (asl, c) = @kernel.dest_thm(th)
  let vars = @lib.subtract(@kernel.frees(c), @kernel.freesl(asl))
  genl(vars, th)
}

// ---------------------------------------------------------------------------
// Existential quantification.
// ---------------------------------------------------------------------------

///|
let exists_def_c : Cell[Thm] = th_cell("EXISTS_DEF")

///|
/// `EXISTS_DEF`
pub fn exists_def() -> Thm {
  exists_def_c.get()
}

///|
pub fn mk_exists(v : Term, tm : Term) -> Term raise {
  @basics.mk_binder("?", v, tm)
}

///|
pub fn list_mk_exists(vs : List[Term], bod : Term) -> Term raise {
  @lib.itlist(mk_exists, vs, bod)
}

///|
let exists_p : Cell[Term] = tm_cell("EXISTS")

///|
let exists_x : Cell[Term] = tm_cell("EXISTS")

///|
let exists_pth : Cell[Thm] = th_cell("EXISTS")

///|
/// `EXISTS`: from `|- t[s]` derive `|- ?x. t[x]` given `(?x. t[x], s)`.
pub fn exists_rule(etm : Term, stm : Term, th : Thm) -> Thm raise {
  let result = try {
    let (_, abs) = @kernel.dest_comb(etm)
    let bth = @equal.beta_conv(@kernel.mk_comb(abs, stm))
    let cth = pinst(
      @list.singleton((@kernel.type_of(stm), @kernel.aty)),
      @list.List([(abs, exists_p.get()), (stm, exists_x.get())]),
      exists_pth.get(),
    )
    prove_hyp(@kernel.eq_mp(@equal.sym(bth), th), cth)
  } catch {
    Failure(_) => raise Failure("EXISTS")
    e => raise e
  }
  result
}

///|
/// `SIMPLE_EXISTS`
pub fn simple_exists(v : Term, th : Thm) -> Thm raise {
  exists_rule(mk_exists(v, @kernel.concl(th)), v, th)
}

///|
let choose_p : Cell[Term] = tm_cell("CHOOSE")

///|
let choose_q : Cell[Term] = tm_cell("CHOOSE")

///|
let choose_pth : Cell[Thm] = th_cell("CHOOSE")

///|
/// `CHOOSE`: from `|- ?x. p[x]` and `p[v] |- t` derive `|- t`.
pub fn choose_rule(v : Term, th1 : Thm, th2 : Thm) -> Thm raise {
  let result = try {
    let abs = @kernel.rand(@kernel.concl(th1))
    let (bv, bod) = @kernel.dest_abs(abs)
    let cmb = @kernel.mk_comb(abs, v)
    let pat = @kernel.vsubst(@list.singleton((v, bv)), bod)
    let th3 = @equal.conv_rule(@equal.beta_conv, @kernel.assume_rule(cmb))
    let th4 = gen(v, disch(cmb, mp(disch(pat, th2), th3)))
    let th5 = pinst(
      @list.singleton((@kernel.dest_var(v).1, @kernel.aty)),
      @list.List([(abs, choose_p.get()), (@kernel.concl(th2), choose_q.get())]),
      choose_pth.get(),
    )
    mp(mp(th5, th4), th1)
  } catch {
    Failure(_) => raise Failure("CHOOSE")
    e => raise e
  }
  result
}

///|
/// `SIMPLE_CHOOSE`
pub fn simple_choose(v : Term, th : Thm) -> Thm raise {
  choose_rule(
    v,
    @kernel.assume_rule(mk_exists(v, @lib.hd(@kernel.hyp(th)))),
    th,
  )
}

// ---------------------------------------------------------------------------
// Disjunction.
// ---------------------------------------------------------------------------

///|
let or_def_c : Cell[Thm] = th_cell("OR_DEF")

///|
/// `OR_DEF`
pub fn or_def() -> Thm {
  or_def_c.get()
}

///|
pub fn mk_disj(l : Term, r : Term) -> Term raise {
  @basics.mk_binary("\\/", l, r)
}

///|
pub fn list_mk_disj(l : List[Term]) -> Term raise {
  @lib.end_itlist(mk_disj, l)
}

///|
let disj1_p : Cell[Term] = tm_cell("DISJ1")

///|
let disj1_q : Cell[Term] = tm_cell("DISJ1")

///|
let disj1_pth : Cell[Thm] = th_cell("DISJ1")

///|
/// `DISJ1`: from `|- p` derive `|- p \/ q`.
pub fn disj1(th : Thm, tm : Term) -> Thm raise {
  @kernel.eq_mp(
    @kernel.deduct_antisym_rule(
      th,
      @kernel.inst_rule(
        @list.List([(@kernel.concl(th), disj1_p.get()), (tm, disj1_q.get())]),
        disj1_pth.get(),
      ),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("DISJ1")
    e => raise e
  }
}

///|
let disj2_p : Cell[Term] = tm_cell("DISJ2")

///|
let disj2_q : Cell[Term] = tm_cell("DISJ2")

///|
let disj2_pth : Cell[Thm] = th_cell("DISJ2")

///|
/// `DISJ2`: from `|- q` derive `|- p \/ q`.
pub fn disj2(tm : Term, th : Thm) -> Thm raise {
  @kernel.eq_mp(
    @kernel.deduct_antisym_rule(
      th,
      @kernel.inst_rule(
        @list.List([(tm, disj2_p.get()), (@kernel.concl(th), disj2_q.get())]),
        disj2_pth.get(),
      ),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("DISJ2")
    e => raise e
  }
}

///|
let disj_cases_p : Cell[Term] = tm_cell("DISJ_CASES")

///|
let disj_cases_q : Cell[Term] = tm_cell("DISJ_CASES")

///|
let disj_cases_r : Cell[Term] = tm_cell("DISJ_CASES")

///|
let disj_cases_pth : Cell[Thm] = th_cell("DISJ_CASES")

///|
/// `DISJ_CASES`: from `|- p \/ q`, `p |- r` and `q |- r` derive `|- r`.
pub fn disj_cases(th0 : Thm, th1 : Thm, th2 : Thm) -> Thm raise {
  let result = try {
    let c1 = @kernel.concl(th1)
    let c2 = @kernel.concl(th2)
    if !@basics.aconv(c1, c2) {
      raise Failure("DISJ_CASES")
    }
    let (l, r) = @basics.dest_disj(@kernel.concl(th0))
    let th = @kernel.inst_rule(
      @list.List([
        (l, disj_cases_p.get()),
        (r, disj_cases_q.get()),
        (c1, disj_cases_r.get()),
      ]),
      disj_cases_pth.get(),
    )
    // `PROVE_HYP (DISCH r th2) (PROVE_HYP (DISCH l th1) (EQ_MP ...))`:
    // arguments right to left.
    let inner = prove_hyp(
      disch(l, th1),
      @kernel.eq_mp(@kernel.deduct_antisym_rule(th0, th), th0),
    )
    prove_hyp(disch(r, th2), inner)
  } catch {
    Failure(_) => raise Failure("DISJ_CASES")
    e => raise e
  }
  result
}

///|
/// `SIMPLE_DISJ_CASES`
pub fn simple_disj_cases(th1 : Thm, th2 : Thm) -> Thm raise {
  disj_cases(
    @kernel.assume_rule(
      mk_disj(@lib.hd(@kernel.hyp(th1)), @lib.hd(@kernel.hyp(th2))),
    ),
    th1,
    th2,
  )
}

// ---------------------------------------------------------------------------
// Negation and falsity.
// ---------------------------------------------------------------------------

///|
let f_def_c : Cell[Thm] = th_cell("F_DEF")

///|
/// `F_DEF`
pub fn f_def() -> Thm {
  f_def_c.get()
}

///|
let not_def_c : Cell[Thm] = th_cell("NOT_DEF")

///|
/// `NOT_DEF`
pub fn not_def() -> Thm {
  not_def_c.get()
}

///|
let mk_neg_tm : Cell[Term] = tm_cell("mk_neg")

///|
pub fn mk_neg(tm : Term) -> Term raise {
  @kernel.mk_comb(mk_neg_tm.get(), tm) catch {
    Failure(_) => raise Failure("mk_neg")
    e => raise e
  }
}

///|
let not_elim_p : Cell[Term] = tm_cell("NOT_ELIM")

///|
let not_elim_pth : Cell[Thm] = th_cell("NOT_ELIM")

///|
/// `NOT_ELIM`: from `|- ~p` derive `|- p ==> F`.
pub fn not_elim(th : Thm) -> Thm raise {
  @kernel.eq_mp(
    @kernel.inst_rule(
      @list.singleton((@kernel.rand(@kernel.concl(th)), not_elim_p.get())),
      not_elim_pth.get(),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("NOT_ELIM")
    e => raise e
  }
}

///|
let not_intro_p : Cell[Term] = tm_cell("NOT_INTRO")

///|
let not_intro_pth : Cell[Thm] = th_cell("NOT_INTRO")

///|
/// `NOT_INTRO`: from `|- p ==> F` derive `|- ~p`.
pub fn not_intro(th : Thm) -> Thm raise {
  @kernel.eq_mp(
    @kernel.inst_rule(
      @list.singleton(
        (@kernel.rand(@kernel.rator(@kernel.concl(th))), not_intro_p.get()),
      ),
      not_intro_pth.get(),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("NOT_INTRO")
    e => raise e
  }
}

///|
let eqf_intro_p : Cell[Term] = tm_cell("EQF_INTRO")

///|
let eqf_intro_pth : Cell[Thm] = th_cell("EQF_INTRO")

///|
/// `EQF_INTRO`: from `|- ~p` derive `|- p = F`.
pub fn eqf_intro(th : Thm) -> Thm raise {
  mp(
    @kernel.inst_rule(
      @list.singleton((@kernel.rand(@kernel.concl(th)), eqf_intro_p.get())),
      eqf_intro_pth.get(),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("EQF_INTRO")
    e => raise e
  }
}

///|
let eqf_elim_p : Cell[Term] = tm_cell("EQF_ELIM")

///|
let eqf_elim_pth : Cell[Thm] = th_cell("EQF_ELIM")

///|
/// `EQF_ELIM`: from `|- p = F` derive `|- ~p`.
pub fn eqf_elim(th : Thm) -> Thm raise {
  mp(
    @kernel.inst_rule(
      @list.singleton(
        (@kernel.rand(@kernel.rator(@kernel.concl(th))), eqf_elim_p.get()),
      ),
      eqf_elim_pth.get(),
    ),
    th,
  ) catch {
    Failure(_) => raise Failure("EQF_ELIM")
    e => raise e
  }
}

///|
let contr_p : Cell[Term] = tm_cell("CONTR")

///|
let contr_f_tm : Cell[Term] = tm_cell("CONTR")

///|
let contr_pth : Cell[Thm] = th_cell("CONTR")

///|
/// `CONTR`: from `|- F` derive `|- tm`.
pub fn contr(tm : Term, th : Thm) -> Thm raise {
  if @kernel.concl(th) != contr_f_tm.get() {
    raise Failure("CONTR")
  }
  @kernel.eq_mp(
    @kernel.deduct_antisym_rule(
      th,
      @kernel.inst_rule(@list.singleton((tm, contr_p.get())), contr_pth.get()),
    ),
    th,
  )
}

// ---------------------------------------------------------------------------
// Unique existence.
// ---------------------------------------------------------------------------

///|
let exists_unique_def_c : Cell[Thm] = th_cell("EXISTS_UNIQUE_DEF")

///|
/// `EXISTS_UNIQUE_DEF`
pub fn exists_unique_def() -> Thm {
  exists_unique_def_c.get()
}

///|
pub fn mk_uexists(v : Term, tm : Term) -> Term raise {
  @basics.mk_binder("?!", v, tm)
}

///|
let existence_p : Cell[Term] = tm_cell("EXISTENCE")

///|
let existence_pth : Cell[Thm] = th_cell("EXISTENCE")

///|
/// `EXISTENCE`: from `|- ?!x. p[x]` derive `|- ?x. p[x]`.
pub fn existence(th : Thm) -> Thm raise {
  let result = try {
    let abs = @kernel.rand(@kernel.concl(th))
    let ty = @kernel.dest_var(@basics.bndvar(abs)).1
    mp(
      pinst(
        @list.singleton((ty, @kernel.aty)),
        @list.singleton((abs, existence_p.get())),
        existence_pth.get(),
      ),
      th,
    )
  } catch {
    Failure(_) => raise Failure("EXISTENCE")
    e => raise e
  }
  result
}

// ---------------------------------------------------------------------------
// Verbose quantifier syntax.
// ---------------------------------------------------------------------------

///|
/// Install the word spellings `exists`, `existsunique`, `true` and `false`
/// of `?`, `?!`, `T` and `F`: fixed syntax, set once at load. `forall` is
/// the canonical constant name and needs no alias.
fn set_verbose_symbols() -> Unit raise {
  for b in ["exists", "existsunique"] {
    @printer.parse_as_binder(b)
  }
  @preterm.override_interface("true", q("T"))
  @preterm.override_interface("false", q("F"))
  @preterm.override_interface("exists", q("(?):(A->bool)->bool"))
  @preterm.override_interface("existsunique", q("(?!):(A->bool)->bool"))
}

// ---------------------------------------------------------------------------
// Load-time steps, in upstream order.
// ---------------------------------------------------------------------------

///|
fn nbd(s : String) -> Thm raise {
  @kernel.new_basic_definition(q(s))
}

///|
fn rand_beta(th : Thm) -> Thm raise {
  @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), th)
}

///|
fn load_steps() -> Unit raise {
  // Parse status of the logical constants.
  @printer.parse_as_prefix("~")
  @printer.parse_as_binder("\\")
  @printer.parse_as_binder("forall")
  @printer.parse_as_binder("?")
  @printer.parse_as_binder("?!")
  @printer.parse_as_infix("==>", (4, "right"))
  @printer.parse_as_infix("\\/", (6, "right"))
  @printer.parse_as_infix("/\\", (8, "right"))
  @printer.parse_as_infix("<=>", (2, "right"))
  @preterm.override_interface("<=>", q("(=):bool->bool->bool"))
  @printer.parse_as_infix("=", (12, "right"))
  mk_iff_eq_tm.set(q("(<=>)"))
  // T
  t_def_c.set(nbd("T = ((\\p:bool. p) = (\\p:bool. p))"))
  // `EQ_MP (SYM T_DEF) (REFL `\p:bool. p`)`: arguments right to left.
  let refl_id = @kernel.refl(q("\\p:bool. p"))
  truth_c.set(@kernel.eq_mp(@equal.sym(t_def()), refl_id))
  let t = q("t:bool")
  eqt_intro_t.set(t)
  {
    let th1 = @kernel.deduct_antisym_rule(@kernel.assume_rule(t), truth())
    let th2 = eqt_elim(@kernel.assume_rule(@kernel.concl(th1)))
    eqt_intro_pth.set(@kernel.deduct_antisym_rule(th2, th1))
  }
  // /\
  and_def_c.set(
    nbd("(/\\) = \\p q. (\\f:bool->bool->bool. f p q) = (\\f. f T T)"),
  )
  {
    let f = q("f:bool->bool->bool")
    let p = q("p:bool")
    let qv = q("q:bool")
    let pth1 = {
      let th1 = rand_beta(@equal.ap_thm(and_def(), p))
      let th2 = rand_beta(@equal.ap_thm(th1, qv))
      let th3 = @kernel.eq_mp(th2, @kernel.assume_rule(mk_conj(p, qv)))
      eqt_elim(
        @equal.beta_rule(@equal.ap_thm(th3, q("\\(p:bool) (q:bool). q"))),
      )
    }
    let pth2 = {
      let pth = @kernel.assume_rule(p)
      let qth = @kernel.assume_rule(qv)
      let r = eqt_intro(qth)
      let th1 = @kernel.mk_comb_rule(@equal.ap_term(f, eqt_intro(pth)), r)
      let th2 = @kernel.abs_rule(f, th1)
      let th3 = @equal.beta_rule(@equal.ap_thm(@equal.ap_thm(and_def(), p), qv))
      @kernel.eq_mp(@equal.sym(th3), th2)
    }
    conj_p.set(p)
    conj_q.set(qv)
    conj_pth.set(@kernel.deduct_antisym_rule(pth1, pth2))
  }
  let conjunct_pth = (cp : Cell[Term], cq : Cell[Term], sel : String) => {
    let p = q("P:bool")
    let qv = q("Q:bool")
    cp.set(p)
    cq.set(qv)
    let th1 = rand_beta(@equal.ap_thm(and_def(), p))
    let th2 = rand_beta(@equal.ap_thm(th1, qv))
    let th3 = @kernel.eq_mp(th2, @kernel.assume_rule(mk_conj(p, qv)))
    eqt_elim(@equal.beta_rule(@equal.ap_thm(th3, q(sel))))
  }
  conjunct1_pth.set(
    conjunct_pth(conjunct1_p, conjunct1_q, "\\(p:bool) (q:bool). p"),
  )
  conjunct2_pth.set(
    conjunct_pth(conjunct2_p, conjunct2_q, "\\(p:bool) (q:bool). q"),
  )
  // ==>
  imp_def_c.set(nbd("(==>) = \\p q. p /\\ q <=> p"))
  {
    let p = q("p:bool")
    let qv = q("q:bool")
    let pth = {
      let th1 = @equal.beta_rule(@equal.ap_thm(@equal.ap_thm(imp_def(), p), qv))
      let th2 = conj(@kernel.assume_rule(p), @kernel.assume_rule(qv))
      let th3 = conjunct1(@kernel.assume_rule(mk_conj(p, qv)))
      @kernel.eq_mp(@equal.sym(th1), @kernel.deduct_antisym_rule(th2, th3))
    }
    let qth = {
      let th1 = @equal.beta_rule(@equal.ap_thm(@equal.ap_thm(imp_def(), p), qv))
      let th2 = @kernel.eq_mp(th1, @kernel.assume_rule(mk_imp(p, qv)))
      conjunct2(@kernel.eq_mp(@equal.sym(th2), @kernel.assume_rule(p)))
    }
    mp_p.set(p)
    mp_q.set(qv)
    mp_rth.set(@kernel.deduct_antisym_rule(pth, qth))
  }
  {
    let p = q("p:bool")
    let qv = q("q:bool")
    disch_p.set(p)
    disch_q.set(qv)
    disch_pth.set(
      @equal.sym(
        @equal.beta_rule(@equal.ap_thm(@equal.ap_thm(imp_def(), p), qv)),
      ),
    )
  }
  {
    let p = q("p:bool")
    let qv = q("q:bool")
    let imp_tm = q("(==>)")
    let pq = mk_imp(p, qv)
    let qp = mk_imp(qv, p)
    let (pth1, pth2) = conj_pair(@kernel.assume_rule(mk_conj(pq, qp)))
    let pth3 = @kernel.deduct_antisym_rule(undisch(pth2), undisch(pth1))
    let pth4 = disch_all(@kernel.assume_rule(qv))
    let pth5 = @kernel.assume_rule(@basics.mk_eq(p, qv))
    // `CONJ a b`: arguments right to left.
    let b = @kernel.eq_mp(
      @equal.sym(@equal.ap_term(@kernel.mk_comb(imp_tm, qv), pth5)),
      pth4,
    )
    let a = @kernel.eq_mp(
      @equal.sym(@equal.ap_thm(@equal.ap_term(imp_tm, pth5), qv)),
      pth4,
    )
    let pth6 = conj(a, b)
    imp_antisym_p.set(p)
    imp_antisym_q.set(qv)
    imp_antisym_pth.set(@kernel.deduct_antisym_rule(pth6, pth3))
  }
  {
    let peq = q("p <=> q")
    let (p, qv) = dest_iff(peq)
    let pth1 = disch(
      peq,
      disch(p, @kernel.eq_mp(@kernel.assume_rule(peq), @kernel.assume_rule(p))),
    )
    let pth2 = disch(
      peq,
      disch(
        qv,
        @kernel.eq_mp(
          @equal.sym(@kernel.assume_rule(peq)),
          @kernel.assume_rule(qv),
        ),
      ),
    )
    eq_imp_p.set(p)
    eq_imp_q.set(qv)
    eq_imp_pth1.set(pth1)
    eq_imp_pth2.set(pth2)
  }
  {
    let pq = q("p ==> q")
    let qr = q("q ==> r")
    let (p, qv) = @basics.dest_imp(pq)
    let r = @kernel.rand(qr)
    let pth = @lib.itlist(
      disch,
      @list.List([pq, qr, p]),
      mp(
        @kernel.assume_rule(qr),
        mp(@kernel.assume_rule(pq), @kernel.assume_rule(p)),
      ),
    )
    imp_trans_p.set(p)
    imp_trans_q.set(qv)
    imp_trans_r.set(r)
    imp_trans_pth.set(pth)
  }
  // forall
  forall_def_c.set(nbd("(forall) = \\P:A->bool. P = \\x. T"))
  {
    let p = q("P:A->bool")
    let x = q("x:A")
    // `EQ_MP (AP_THM FORALL_DEF `P`) (ASSUME `(!)P`)`: right to left.
    let a = @kernel.assume_rule(q("(forall)(P:A->bool)"))
    let th1 = @kernel.eq_mp(@equal.ap_thm(forall_def(), q("P:A->bool")), a)
    let xv = q("x:A")
    let th2 = @equal.ap_thm(@equal.conv_rule(@equal.beta_conv, th1), xv)
    let th3 = rand_beta(th2)
    spec_p.set(p)
    spec_x.set(x)
    spec_pth.set(disch_all(eqt_elim(th3)))
  }
  gen_pth.set(
    @equal.sym(rand_beta(@equal.ap_thm(forall_def(), q("P:A->bool")))),
  )
  // ?
  exists_def_c.set(
    nbd("(?) = \\P:A->bool. forall q. (forall x. P x ==> q) ==> q"),
  )
  {
    let p = q("P:A->bool")
    let x = q("x:A")
    let th1 = rand_beta(@equal.ap_thm(exists_def(), p))
    // `SPEC `x:A` (ASSUME `!x:A. P x ==> Q`)`: right to left.
    let a = @kernel.assume_rule(q("forall x:A. P x ==> Q"))
    let th2 = spec(q("x:A"), a)
    // `DISCH `!x. ...` (MP th2 (ASSUME `(P:A->bool) x`))`: right to left.
    let m = mp(th2, @kernel.assume_rule(q("(P:A->bool) x")))
    let th3 = disch(q("forall x:A. P x ==> Q"), m)
    // `EQ_MP (SYM th1) (GEN `Q:bool` th3)`: right to left.
    let g = gen(q("Q:bool"), th3)
    exists_p.set(p)
    exists_x.set(x)
    exists_pth.set(@kernel.eq_mp(@equal.sym(th1), g))
  }
  {
    let p = q("P:A->bool")
    let qv = q("Q:bool")
    let th1 = rand_beta(@equal.ap_thm(exists_def(), p))
    let u = undisch(eq_imp_rule(th1).0)
    let th2 = spec(q("Q:bool"), u)
    let u2 = undisch(th2)
    choose_p.set(p)
    choose_q.set(qv)
    choose_pth.set(disch_all(disch(q("(?) (P:A->bool)"), u2)))
  }
  // \/
  or_def_c.set(nbd("(\\/) = \\p q. forall r. (p ==> r) ==> (q ==> r) ==> r"))
  let disj_pth = (left : Bool) => {
    let p = q("P:bool")
    let qv = q("Q:bool")
    let th1 = rand_beta(@equal.ap_thm(or_def(), q("P:bool")))
    let th2 = rand_beta(@equal.ap_thm(th1, q("Q:bool")))
    // `MP (ASSUME `X ==> t`) (ASSUME `X:bool`)`: right to left.
    let (imp_s, x_s) = if left {
      ("P ==> t", "P:bool")
    } else {
      ("Q ==> t", "Q:bool")
    }
    let ax = @kernel.assume_rule(q(x_s))
    let th3 = mp(@kernel.assume_rule(q(imp_s)), ax)
    // `GEN `t` (DISCH `P ==> t` (DISCH `Q ==> t` th3))`: innermost first.
    let d1 = disch(q("Q ==> t"), th3)
    let d2 = disch(q("P ==> t"), d1)
    let th4 = gen(q("t:bool"), d2)
    (p, qv, @kernel.eq_mp(@equal.sym(th2), th4))
  }
  {
    let (p, qv, pth) = disj_pth(true)
    disj1_p.set(p)
    disj1_q.set(qv)
    disj1_pth.set(pth)
  }
  {
    let (p, qv, pth) = disj_pth(false)
    disj2_p.set(p)
    disj2_q.set(qv)
    disj2_pth.set(pth)
  }
  {
    let p = q("P:bool")
    let qv = q("Q:bool")
    let r = q("R:bool")
    let th1 = rand_beta(@equal.ap_thm(or_def(), q("P:bool")))
    let th2 = rand_beta(@equal.ap_thm(th1, q("Q:bool")))
    let e = @kernel.eq_mp(th2, @kernel.assume_rule(q("P \\/ Q")))
    let th3 = spec(q("R:bool"), e)
    disj_cases_p.set(p)
    disj_cases_q.set(qv)
    disj_cases_r.set(r)
    disj_cases_pth.set(undisch(undisch(th3)))
  }
  // F and ~
  f_def_c.set(nbd("F = forall p:bool. p"))
  not_def_c.set(nbd("(~) = \\p. p ==> F"))
  mk_neg_tm.set(q("(~)"))
  {
    let p = q("P:bool")
    not_elim_p.set(p)
    not_elim_pth.set(rand_beta(@equal.ap_thm(not_def(), p)))
  }
  {
    let p = q("P:bool")
    not_intro_p.set(p)
    not_intro_pth.set(@equal.sym(rand_beta(@equal.ap_thm(not_def(), p))))
  }
  {
    let p = q("P:bool")
    let th1 = not_elim(@kernel.assume_rule(q("~ P")))
    // `DISCH `F` (SPEC P (EQ_MP F_DEF (ASSUME `F`)))`: right to left.
    let s = spec(p, @kernel.eq_mp(f_def(), @kernel.assume_rule(q("F"))))
    let th2 = disch(q("F"), s)
    eqf_intro_p.set(p)
    eqf_intro_pth.set(disch_all(imp_antisym_rule(th1, th2)))
  }
  {
    let p = q("P:bool")
    // `EQ_MP (ASSUME `P = F`) (ASSUME `P:bool`)`: right to left.
    let ap = @kernel.assume_rule(q("P:bool"))
    let th1 = @kernel.eq_mp(@kernel.assume_rule(q("P = F")), ap)
    let e = @kernel.eq_mp(f_def(), th1)
    let th2 = disch(p, spec(q("F"), e))
    eqf_elim_p.set(p)
    eqf_elim_pth.set(disch_all(not_intro(th2)))
  }
  {
    let p = q("P:bool")
    let f_tm = q("F")
    contr_p.set(p)
    contr_f_tm.set(f_tm)
    contr_pth.set(spec(p, @kernel.eq_mp(f_def(), @kernel.assume_rule(q("F")))))
  }
  // ?!
  exists_unique_def_c.set(
    nbd("(?!) = \\P:A->bool. ((?) P) /\\ (forall x y. P x /\\ P y ==> x = y)"),
  )
  {
    let p = q("P:A->bool")
    let th1 = rand_beta(@equal.ap_thm(exists_unique_def(), p))
    let th2 = undisch(eq_imp_rule(th1).0)
    existence_p.set(p)
    existence_pth.set(disch_all(conjunct1(th2)))
  }
  set_verbose_symbols()
}
