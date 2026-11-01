// Translated from upstream impconv.ml; edit this file directly.

///|
/// `t`
pub type TsetT = @list.List[@kernel.Term]

///|
/// `t`
pub(all) enum TypeAnnotedTermT {
  Var_(String, @kernel.HolType)
  Const_(String, @kernel.HolType, @kernel.Term)
  Comb_(TypeAnnotedTermT, TypeAnnotedTermT, @kernel.HolType)
  Abs_(TypeAnnotedTermT, TypeAnnotedTermT, @kernel.HolType)
} derive(Eq, Debug)

///|
pub extend TypeAnnotedTermT with Eq::{not_equal, equal}

///|
pub extend TypeAnnotedTermT with Debug::{to_repr}

///|
pub extend TypeAnnotedTermT with @lib.OCompare::{ocompare}

///|
pub extend TypeAnnotedTermT with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_TypeAnnotedTermT(x : TypeAnnotedTermT) -> Int {
  match x {
    Var_(_, _) => 1000000
    Const_(_, _, _) => 1000001
    Comb_(_, _, _) => 1000002
    Abs_(_, _, _) => 1000003
  }
}

///|
pub impl @lib.OCompare for TypeAnnotedTermT with fn ocompare(self, other) {
  match (self, other) {
    (Var_(a0, a1), Var_(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Const_(a0, a1, a2), Const_(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    (Comb_(a0, a1, a2), Comb_(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    (Abs_(a0, a1, a2), Abs_(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ =>
      ocaml_rank_TypeAnnotedTermT(self).compare(
        ocaml_rank_TypeAnnotedTermT(other),
      )
  }
}

///|
pub impl @lib.OHash for TypeAnnotedTermT with fn ohash_visit(self, h) {
  match self {
    Var_(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Const_(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    Comb_(a0, a1, a2) => {
      h.block(2, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    Abs_(a0, a1, a2) => {
      h.block(3, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `term_label`
pub(all) enum FoNetsTermLabel {
  Vnet(Int64)
  Lcnet(String, Int64)
  Cnet(String, Int64)
  Lnet(Int64)
} derive(Eq, Debug)

///|
pub extend FoNetsTermLabel with Eq::{not_equal, equal}

///|
pub extend FoNetsTermLabel with Debug::{to_repr}

///|
pub extend FoNetsTermLabel with @lib.OCompare::{ocompare}

///|
pub extend FoNetsTermLabel with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_FoNetsTermLabel(x : FoNetsTermLabel) -> Int {
  match x {
    Vnet(_) => 1000000
    Lcnet(_, _) => 1000001
    Cnet(_, _) => 1000002
    Lnet(_) => 1000003
  }
}

///|
pub impl @lib.OCompare for FoNetsTermLabel with fn ocompare(self, other) {
  match (self, other) {
    (Vnet(a0), Vnet(b0)) => @lib.compare(a0, b0)
    (Lcnet(a0, a1), Lcnet(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Cnet(a0, a1), Cnet(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Lnet(a0), Lnet(b0)) => @lib.compare(a0, b0)
    _ =>
      ocaml_rank_FoNetsTermLabel(self).compare(
        ocaml_rank_FoNetsTermLabel(other),
      )
  }
}

///|
pub impl @lib.OHash for FoNetsTermLabel with fn ohash_visit(self, h) {
  match self {
    Vnet(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Lcnet(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    Cnet(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
    Lnet(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
  }
}

///|
/// `t`
pub(all) enum FoNetsT[TA] {
  Netnode(@list.List[(FoNetsTermLabel, FoNetsT[TA])], @list.List[TA])
} derive(Eq, Debug)

///|
pub extend FoNetsT with Eq::{not_equal, equal}

///|
pub extend FoNetsT with Debug::{to_repr}

///|
pub extend FoNetsT with @lib.OCompare::{ocompare}

///|
pub extend FoNetsT with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_FoNetsT(x : FoNetsT[TA]) -> Int {
  match x {
    Netnode(_, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for FoNetsT[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Netnode(a0, a1), Netnode(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_FoNetsT(self).compare(ocaml_rank_FoNetsT(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for FoNetsT[TA] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Netnode(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `t`
pub(all) enum VarianceT {
  Co
  Contra
} derive(Eq, Debug)

///|
pub extend VarianceT with Eq::{not_equal, equal}

///|
pub extend VarianceT with Debug::{to_repr}

///|
pub extend VarianceT with @lib.OCompare::{ocompare}

///|
pub extend VarianceT with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_VarianceT(x : VarianceT) -> Int {
  match x {
    Co => 0
    Contra => 1
  }
}

///|
pub impl @lib.OCompare for VarianceT with fn ocompare(self, other) {
  match (self, other) {
    _ => ocaml_rank_VarianceT(self).compare(ocaml_rank_VarianceT(other))
  }
}

///|
pub impl @lib.OHash for VarianceT with fn ohash_visit(self, h) {
  match self {
    Co => h.int(0L)
    Contra => h.int(1L)
  }
}

///|
/// `imp_conv`
pub type ImpconvImpConv = (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise

///|
/// `with_context`
pub(all) enum ImpconvWithContext[TA] {
  With_context(
    TA,
    (TsetT) -> ImpconvWithContext[TA] raise,
    (@kernel.Term) -> ImpconvWithContext[TA] raise
  )
}

///|
/// `atomic`
pub(all) enum ImpconvAtomic {
  Atomic
  Non_atomic
} derive(Eq, Debug)

///|
pub extend ImpconvAtomic with Eq::{not_equal, equal}

///|
pub extend ImpconvAtomic with Debug::{to_repr}

///|
pub extend ImpconvAtomic with @lib.OCompare::{ocompare}

///|
pub extend ImpconvAtomic with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_ImpconvAtomic(x : ImpconvAtomic) -> Int {
  match x {
    Atomic => 0
    Non_atomic => 1
  }
}

///|
pub impl @lib.OCompare for ImpconvAtomic with fn ocompare(self, other) {
  match (self, other) {
    _ => ocaml_rank_ImpconvAtomic(self).compare(ocaml_rank_ImpconvAtomic(other))
  }
}

///|
pub impl @lib.OHash for ImpconvAtomic with fn ohash_visit(self, h) {
  match self {
    Atomic => h.int(0L)
    Non_atomic => h.int(1L)
  }
}

///|
/// `annot_conv`
pub type ImpconvAnnotConv = (@kernel.Term) -> (
  @kernel.Thm,
  @kernel.Term?,
  @list.List[@kernel.Term],
) raise

///|
/// `imp_mconv`
pub type ImpconvImpMconv = (VarianceT) -> ((@kernel.Term) -> @list.List[
  @kernel.Thm,
] raise) raise

///|
/// `annot_mconv`
pub type ImpconvAnnotMconv = (@kernel.Term) -> @list.List[
  (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
] raise

///|
let imp_rewrite_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise,
] = @lib.Cell::new("IMP_REWRITE_TAC")

///|
/// `IMP_REWRITE_TAC`
pub fn imp_rewrite_tac(
  x : @list.List[@kernel.Thm],
) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  imp_rewrite_tac_c.get()(x)
}

///|
let target_rewrite_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise,
] = @lib.Cell::new("TARGET_REWRITE_TAC")

///|
/// `TARGET_REWRITE_TAC`
pub fn target_rewrite_tac(
  x : @list.List[@kernel.Thm],
) -> ((@kernel.Thm) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise {
  target_rewrite_tac_c.get()(x)
}

///|
let hint_exists_tac_c : @lib.Cell[(@tactics.Goal) -> @tactics.Goalstate raise] = @lib.Cell::new(
  "HINT_EXISTS_TAC",
)

///|
/// `HINT_EXISTS_TAC`
pub fn hint_exists_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  hint_exists_tac_c.get()(x)
}

///|
let seq_imp_rewrite_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise,
] = @lib.Cell::new("SEQ_IMP_REWRITE_TAC")

///|
/// `SEQ_IMP_REWRITE_TAC`
pub fn seq_imp_rewrite_tac(
  x : @list.List[@kernel.Thm],
) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  seq_imp_rewrite_tac_c.get()(x)
}

///|
let case_rewrite_tac_c : @lib.Cell[(@kernel.Thm) -> @tactics.Tactic raise] = @lib.Cell::new(
  "CASE_REWRITE_TAC",
)

///|
/// `CASE_REWRITE_TAC`
pub fn case_rewrite_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  case_rewrite_tac_c.get()(x)
}

///|
/// IMP_REWRITE_TAC, TARGET_REWRITE_TAC, HINT_EXISTS_TAC, SEQ_IMP_REWRITE_TAC, CASE_REWRITE_TAC
fn step_1() -> Unit raise {
  let undisch_term : (@kernel.Thm) -> (@kernel.Term, @kernel.Thm) raise = fn(
    x2 : @kernel.Thm,
  ) -> (@kernel.Term, @kernel.Thm) raise {
    let th = x2
    let p = (fn(x4 : @kernel.Term) -> @kernel.Term raise {
      (fn(x3 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise { x3.0 })(
        @basics.dest_imp(x4),
      )
    })((fn(x5 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x5) })(th))
    (p, @bool.undisch(th))
  }
  fn undisch_terms(
    x6 : @kernel.Thm,
  ) -> (@list.List[@kernel.Term], @kernel.Thm) raise {
    let th_1 = x6
    try {
      let (t, th_p) = undisch_term(th_1)
      let (ts, th_p_p) = undisch_terms(th_p)
      (ts.prepend(t), th_p_p)
    } catch {
      Failure(_) => (@list.List([]), th_1)
      e => raise e
    }
  }
  let map_conclusion : ((@kernel.Thm) -> @kernel.Thm raise) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x7 : (@kernel.Thm) -> @kernel.Thm raise,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let f = x7
    fn(x8 : @kernel.Thm) -> @kernel.Thm raise {
      let th_2 = x8
      let (p_1, th_3) = undisch_term(th_2)
      @bool.disch(p_1, f(th_3))
    }
  }
  let t9 = @term_syntax.parse_term("op_slash_bslash")
  let strip_conj : (@kernel.Term) -> @list.List[@kernel.Term] raise = fn(
    x11 : @kernel.Term,
  ) -> @list.List[@kernel.Term] raise {
    ((x10 : @kernel.Term) => @basics.binops(t9, x10))(x11)
  }
  let a_ = @term_syntax.parse_term("(A : Bool)")
  let b_ = @term_syntax.parse_term("(B : Bool)")
  let c_ = @term_syntax.parse_term("(C : Bool)")
  let d_ = @term_syntax.parse_term("(D : Bool)")
  let t_ = @term_syntax.parse_term("true")
  let lem = @class.taut(@term_syntax.parse_term("(A : Bool) → A"))
  let imp_refl : (@kernel.Term) -> @kernel.Thm raise = fn(
    x24 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let t_2 = x24
    @kernel.inst_rule(@list.List([(t_2, a_)]), lem)
  }
  let variant_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x25 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let av = x25
    fn(x26 : @kernel.Term) -> @kernel.Thm raise {
      let t_3 = x26
      let vs = @basics.variables(t_3)
      let mapping = @lib.filter(
        fn(x27 : (@kernel.Term, @kernel.Term)) -> Bool raise {
          let (x_5, y) = x27
          x_5 != y
        },
        @lib.zip(vs, @basics.variants(av, vs)),
      )
      @equal.depth_conv(fn(x28 : @kernel.Term) -> @kernel.Thm raise {
        let u = x28
        @equal.alpha_conv(@lib.assoc(@basics.bndvar(u), mapping))(u)
      })(t_3)
    }
  }
  let variant_rule : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x31 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    (fn(
      x29 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x30 : @kernel.Thm) -> @kernel.Thm raise { @equal.conv_rule(x29, x30) }
    })(variant_conv(x31))
  }
  let disch_hd : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x32 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_4 = x32
    @bool.disch(@lib.hd(@kernel.hyp(th_4)), th_4)
  }
  let rewr_rule : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x35 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    (fn(
      x33 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x34 : @kernel.Thm) -> @kernel.Thm raise { @equal.conv_rule(x33, x34) }
    })(@simp.rewr_conv(x35))
  }
  let f_5 : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x36 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    match x36 {
      Empty => i_l
      More(t_4, tail=ts_1) =>
        fn(x46 : @kernel.Thm) -> @kernel.Thm raise {
          ((x44 : @kernel.Thm) => {
            @lib.rev_itlist(
              fn(x39 : @kernel.Term, x40 : @kernel.Thm) -> @kernel.Thm raise {
                let t_5 = x39
                let t42 = rewr_rule(@theorems.imp_imp())
                (fn(x43 : @kernel.Thm) -> @kernel.Thm raise {
                  t42(((x41 : @kernel.Thm) => @bool.disch(t_5, x41))(x43))
                })(x40)
              },
              ts_1,
              x44,
            )
          })(((x45 : @kernel.Thm) => @bool.disch(t_4, x45))(x46))
        }
    }
  }
  let disch_imp_imp : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x48 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    f_5(
      (fn(x47 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.rev(x47)
      })(x48),
    )
  }
  fn disch_conj(x49 : @kernel.Term, x50 : @kernel.Thm) -> @kernel.Thm raise {
    let t_6 = x49
    let th_5 = x50
    try {
      let (t1, t2) = @basics.dest_conj(t_6)
      let t51 = disch_conj(t1, disch_conj(t2, th_5))
      rewr_rule(@theorems.imp_imp())(t51)
    } catch {
      Failure(_) => @bool.disch(t_6, th_5)
      e => raise e
    }
  }
  fn spec_vars(
    x52 : @kernel.Thm,
  ) -> (@list.List[@kernel.Term], @kernel.Thm) raise {
    let th_6 = x52
    try {
      let (v, th_p_1) = @bool.spec_var(th_6)
      let (vs_1, th_p_p_1) = spec_vars(th_p_1)
      (vs_1.prepend(v), th_p_p_1)
    } catch {
      Failure(_) => (@list.List([]), th_6)
      e => raise e
    }
  }
  let map_forall_body : ((@kernel.Thm) -> @kernel.Thm raise) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x53 : (@kernel.Thm) -> @kernel.Thm raise,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let f_6 = x53
    fn(x54 : @kernel.Thm) -> @kernel.Thm raise {
      let th_7 = x54
      let (vs_2, th_8) = spec_vars(th_7)
      @bool.genl(vs_2, f_6(th_8))
    }
  }
  let gen_map_conclusion : ((@kernel.Thm) -> @kernel.Thm raise) -> ((
    @kernel.Thm,
  ) -> @kernel.Thm raise) raise = fn(
    x56 : (@kernel.Thm) -> @kernel.Thm raise,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    (fn(
      x55 : (@kernel.Thm) -> @kernel.Thm raise,
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      map_forall_body(map_conclusion(x55))
    })(map_forall_body(x56))
  }
  let imply_and_rdistrib = @class.taut(
    @term_syntax.parse_term("((x : Bool) → (y : Bool) && (z : Bool)) == ((x → y) && (x → z))"),
  )
  let t57 = @equal.gsym(@theorems.conj_assoc())
  let imply_and : (@kernel.Thm) -> @kernel.Thm raise = @simp.pure_rewrite_rule(
    @list.List([
      @equal.gsym(@theorems.and_forall_thm()),
      @theorems.imp_imp(),
      @theorems.right_imp_forall_thm(),
      imply_and_rdistrib,
      t57,
    ]),
  )
  let dest_binary_blind : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(
    x58 : @kernel.Term,
  ) -> (@kernel.Term, @kernel.Term) raise {
    match x58 {
      @kernel.Term::Comb(@kernel.Term::Comb(_, l), r) => (l, r)
      _ => raise Failure("dest_binary_blind")
    }
  }
  let spec_all : (@kernel.Term) -> @kernel.Term raise = (x61 : @kernel.Term) => {
    @lib.repeat(
      fn(x60 : @kernel.Term) -> @kernel.Term raise {
        (fn(x59 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise { x59.1 })(
          @basics.dest_forall(x60),
        )
      },
      x61,
    )
  }
  let thm_lt : (@kernel.Thm) -> ((@kernel.Thm) -> Bool raise) raise = fn(
    x62 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> Bool raise) raise {
    let _ as th1 = x62
    fn(x63 : @kernel.Thm) -> Bool raise {
      let th2 = x63
      @lib.compare(th1, th2) < 0
    }
  }
  let t64 = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → (r : Bool)) == (q → p → r)")),
  )
  let swap : (@kernel.Thm) -> @kernel.Thm raise = (x65 : @kernel.Thm) => {
    @equal.conv_rule(t64, x65)
  }
  let gmatch_mp : (@kernel.Thm) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise = fn(
    x66 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise {
    let th1_1 = x66
    let (vs_3, th1_p) = spec_vars(th1_1)
    let (hs, th1_p_p) = undisch_terms(
      @simp.pure_rewrite_rule(@list.List([@theorems.imp_conj()]))(th1_p),
    )
    fn(x68 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      let th2_1 = x68
      let f_7 : (@kernel.Term) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise = fn(
        x69 : @kernel.Term,
      ) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise {
        let h_1 = x69
        fn(x70 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
          let hs_1 = x70
          let th1_p_p_p = @bool.disch(h_1, th1_p_p)
          let th1_p_p_p_p = swap(disch_imp_imp(hs_1)(th1_p_p_p)) catch {
            Failure(_) => th1_p_p_p
            e => raise e
          }
          @drule.match_mp(@bool.genl(vs_3, th1_p_p_p_p))(th2_1)
        }
      }
      fn loop_(
        x71 : @list.List[@kernel.Term],
        x72 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Thm] raise {
        let acc = x71
        match x72 {
          Empty => @list.List([])
          More(h_2, tail=hs_2) => {
            let t73 = loop_(acc.prepend(h_2), hs_2)
            (@list.List([f_7(h_2)(acc.concat(hs_2))]) catch {
              Failure(_) => @list.List([])
              e => raise e
            }).concat(t73)
          }
        }
      }
      loop_(@list.List([]), hs)
    }
  }
  let gmatch_mps : (@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[
    @kernel.Thm,
  ] raise) raise = fn(
    x74 : @list.List[@kernel.Thm],
  ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
    let ths1 = x74
    fn(x75 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      let ths2 = x75
      let insert : (@kernel.Thm) -> ((@list.List[@kernel.Thm]) -> @list.List[
        @kernel.Thm,
      ] raise) raise = fn(
        x76 : @kernel.Thm,
      ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
        let _ as y_1 = x76
        fn(x77 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          match x77 {
            Empty => @list.List([y_1])
            More(x_6, tail=_) as xs if @basics.equals_thm(x_6, y_1) => xs
            More(x_7, tail=xs_1) if thm_lt(x_7)(y_1) =>
              @lib.insert(y_1, xs_1).prepend(x_7)
            More(_, tail=_) as xs_2 => xs_2.prepend(y_1)
          }
        }
      }
      let inserts : (@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[
        @kernel.Thm,
      ] raise) raise = fn(
        x78 : @list.List[@kernel.Thm],
      ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
        let ys = x78
        (x83 : @list.List[@kernel.Thm]) => {
          @lib.itlist(
            fn(
              x80 : @kernel.Thm,
              x81 : @list.List[@kernel.Thm],
            ) -> @list.List[@kernel.Thm] raise {
              let s82 = insert(x80)
              s82(x81)
            },
            ys,
            x83,
          )
        }
      }
      match ths1 {
        Empty => @list.List([])
        More(th1_2, tail=ths1_p) => {
          fn self__1(
            x84 : @list.List[@kernel.Thm],
            x85 : @kernel.Thm,
            x86 : @list.List[@kernel.Thm],
            x87 : @list.List[@kernel.Thm],
          ) -> @list.List[@kernel.Thm] raise {
            let acc_1 = x84
            let th1_3 = x85
            let ths1_1 = x86
            match x87 {
              Empty =>
                match ths1_1 {
                  Empty => acc_1
                  More(th_9, tail=ths1_p_1) =>
                    self__1(acc_1, th_9, ths1_p_1, ths2)
                }
              More(th2_2, tail=ths2_p) =>
                self__1(
                  inserts(gmatch_mp(th1_3)(th2_2))(acc_1),
                  th1_3,
                  ths1_1,
                  ths2_p,
                )
            }
          }
          self__1(@list.List([]), th1_2, ths1_p, ths2)
        }
      }
    }
  }
  let mp_closure : (@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[
    @kernel.Thm,
  ] raise) raise = fn(
    x88 : @list.List[@kernel.Thm],
  ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
    let ths1_2 = x88
    fn(x89 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      let ths2_1 = x89
      let ths1_3 = @lib.filter(
        fn(x93 : @kernel.Thm) -> Bool raise {
          (fn(x91 : @kernel.Term) -> Bool raise {
            (fn(x90 : @kernel.Term) -> Bool raise { @basics.is_imp(x90) })(
              spec_all(x91),
            )
          })(
            (fn(x92 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x92) })(
              x93,
            ),
          )
        },
        ths1_2,
      )
      fn self__2(
        x94 : @list.List[@kernel.Thm],
        x95 : @list.List[@kernel.Thm],
      ) -> @list.List[@kernel.Thm] raise {
        let ths2_2 = x94
        match x95 {
          Empty => @list.List([])
          More(_, tail=_) as ths1_4 => {
            let ths1_p_p = gmatch_mps(ths1_4)(ths2_2)
            self__2(ths2_2, ths1_p_p).concat(ths1_p_p)
          }
        }
      }
      self__2(ths2_1, ths1_3)
    }
  }
  let cmp : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise = fn(
    x96 : @kernel.Term,
  ) -> ((@kernel.Term) -> Int64 raise) raise {
    let _ as x_8 = x96
    fn(x97 : @kernel.Term) -> Int64 raise {
      let y_2 = x97
      Int::to_int64(@lib.compare(x_8, y_2))
    }
  }
  let lt : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(
    x98 : @kernel.Term,
  ) -> ((@kernel.Term) -> Bool raise) raise {
    let _ as x_9 = x98
    fn(x99 : @kernel.Term) -> Bool raise {
      let y_3 = x99
      Int::to_int64(@lib.compare(x_9, y_3)) < 0L
    }
  }
  let of_list : (@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise = (x100 => {
    lift_l(cmp, x100)
  })(i_l)
  let insert_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    @kernel.Term,
  ] raise) raise = fn(
    x107 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
    let ts_2 = x107
    fn(x108 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      let t_7 = x108
      fn self__3(
        x109 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        match x109 {
          Empty => @list.List([t_7])
          More(x_10, tail=xs_3) if lt(x_10)(t_7) => self__3(xs_3).prepend(x_10)
          More(x_11, tail=_) as xs_4 if x_11 == t_7 => xs_4
          xs_5 => xs_5.prepend(t_7)
        }
      }
      if t_7 == t_ {
        ts_2
      } else {
        self__3(ts_2)
      }
    }
  }
  let remove : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    @kernel.Term,
  ] raise) raise = fn(
    x110 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
    let ts_3 = x110
    fn(x111 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      let t_8 = x111
      fn self__4(
        x112 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        match x112 {
          Empty => @list.List([])
          More(x_12, tail=xs_6) if lt(x_12)(t_8) => self__4(xs_6).prepend(x_12)
          More(x_13, tail=xs_7) if x_13 == t_8 => xs_7
          More(_, tail=_) as xs_8 => xs_8
        }
      }
      self__4(ts_3)
    }
  }
  fn self__5(
    x113 : @list.List[@kernel.Term],
    x114 : @kernel.Term,
  ) -> @list.List[@kernel.Term] raise {
    let acc_2 = x113
    let t_9 = x114
    try {
      let (t1_1, t2_1) = @basics.dest_conj(t_9)
      self__5(self__5(acc_2, t1_1), t2_1)
    } catch {
      Failure(_) => insert_1(acc_2)(t_9)
      e => raise e
    }
  }
  let strip_conj_1 : (@kernel.Term) -> @list.List[@kernel.Term] raise = (
    x115 : @kernel.Term,
  ) => self__5(@list.List([]), x115)
  fn union(
    x116 : @list.List[@kernel.Term],
    x117 : @list.List[@kernel.Term],
  ) -> @list.List[@kernel.Term] raise {
    let l1 = x116
    let l2 = x117
    match l1 {
      Empty => l2
      More(h1, tail=t1_2) =>
        match l2 {
          Empty => l1
          More(h2, tail=t2_2) if lt(h1)(h2) => union(t1_2, l2).prepend(h1)
          More(h2_1, tail=t2_3) if h1 == h2_1 => union(t1_2, t2_3).prepend(h1)
          More(h2_2, tail=t2_4) => union(l1, t2_4).prepend(h2_2)
        }
    }
  }
  fn mem(x118 : @kernel.Term, x119 : @list.List[@kernel.Term]) -> Bool raise {
    let x_14 = x118
    match x119 {
      More(x_p, tail=xs_9) if x_p == x_14 => true
      More(x_p_1, tail=xs_10) if lt(x_p_1)(x_14) => mem(x_14, xs_10)
      _ => false
    }
  }
  let subtract : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise) raise = fn(
    x120 : @list.List[@kernel.Term],
  ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
    let l1_1 = x120
    fn(x121 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
      let l2_1 = x121
      @lib.filter(
        fn(x122 : @kernel.Term) -> Bool raise {
          let x_15 = x122
          !mem(x_15, l2_1)
        },
        l1_1,
      )
    }
  }
  let empty = @list.List([])
  fn frees(
    x133 : @list.List[@kernel.Term],
    x134 : @kernel.Term,
  ) -> @list.List[@kernel.Term] raise {
    let acc_4 = x133
    match x134 {
      @kernel.Term::Var(_, _) as t_10 => insert_1(acc_4)(t_10)
      @kernel.Term::Const(_, _) => acc_4
      @kernel.Term::Abs(v_1, b) => remove(frees(acc_4, b))(v_1)
      @kernel.Term::Comb(u_1, v_2) => frees(frees(acc_4, u_1), v_2)
    }
  }
  let freesl : (@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise = fn(
    x135 : @list.List[@kernel.Term],
  ) -> @list.List[@kernel.Term] raise {
    let ts_4 = x135
    @lib.itlist(
      fn(
        x138 : @kernel.Term,
        x139 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x136 : @list.List[@kernel.Term],
        ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
          fn(x137 : @kernel.Term) -> @list.List[@kernel.Term] raise {
            frees(x136, x137)
          }
        })(x139)(x138)
      },
      ts_4,
      empty,
    )
  }
  let frees_1 : (@kernel.Term) -> @list.List[@kernel.Term] raise = (
    x140 : @kernel.Term,
  ) => frees(empty, x140)
  let type_of : (TypeAnnotedTermT) -> @kernel.HolType raise = fn(
    x141 : TypeAnnotedTermT,
  ) -> @kernel.HolType raise {
    match x141 {
      TypeAnnotedTermT::Var_(_, ty) => ty
      TypeAnnotedTermT::Const_(_, ty_1, _) => ty_1
      TypeAnnotedTermT::Comb_(_, _, ty_2) => ty_2
      TypeAnnotedTermT::Abs_(_, _, ty_3) => ty_3
    }
  }
  fn of_term(x142 : @kernel.Term) -> TypeAnnotedTermT raise {
    match x142 {
      @kernel.Term::Var(s, ty_4) => TypeAnnotedTermT::Var_(s, ty_4)
      @kernel.Term::Const(s_1, ty_5) as t_11 =>
        TypeAnnotedTermT::Const_(s_1, ty_5, t_11)
      @kernel.Term::Comb(u_2, v_3) => {
        let u_p = of_term(u_2)
        let v_p = of_term(v_3)
        TypeAnnotedTermT::Comb_(u_p, v_p, @basics.dest_fun_ty(type_of(u_p)).1)
      }
      @kernel.Term::Abs(x_17, b_1) => {
        let x_p_2 = of_term(x_17)
        let b_p = of_term(b_1)
        let t143 = type_of(b_p)
        TypeAnnotedTermT::Abs_(
          x_p_2,
          b_p,
          @basics.mk_fun_ty(type_of(x_p_2), t143),
        )
      }
    }
  }
  fn equal(x144 : TypeAnnotedTermT, x145 : TypeAnnotedTermT) -> Bool raise {
    let t1_3 = x144
    let t2_5 = x145
    match (t1_3, t2_5) {
      (TypeAnnotedTermT::Var_(s1, ty1), TypeAnnotedTermT::Var_(s2, ty2))
      | (
        TypeAnnotedTermT::Const_(s1, ty1, _),
        TypeAnnotedTermT::Const_(s2, ty2, _),
      ) => s1 == s2 && ty1 == ty2
      (TypeAnnotedTermT::Comb_(u1, v1, _), TypeAnnotedTermT::Comb_(u2, v2, _)) =>
        equal(u1, u2) && equal(v1, v2)
      (TypeAnnotedTermT::Abs_(v1_1, b1, _), TypeAnnotedTermT::Abs_(v2_1, b2, _)) =>
        equal(v1_1, v2_1) && equal(b1, b2)
      _ => false
    }
  }
  fn to_term(x146 : TypeAnnotedTermT) -> @kernel.Term raise {
    match x146 {
      TypeAnnotedTermT::Var_(s_2, ty_6) => @kernel.mk_var(s_2, ty_6)
      TypeAnnotedTermT::Const_(_, _, t_12) => t_12
      TypeAnnotedTermT::Comb_(u_3, v_4, _) => {
        let t147 = to_term(v_4)
        @kernel.mk_comb(to_term(u_3), t147)
      }
      TypeAnnotedTermT::Abs_(v_5, b_2, _) => {
        let t148 = to_term(b_2)
        @kernel.mk_abs(to_term(v_5), t148)
      }
    }
  }
  let dummy = TypeAnnotedTermT::Var_("", @kernel.aty)
  fn find_term(
    x149 : (TypeAnnotedTermT) -> Bool raise,
    x150 : TypeAnnotedTermT,
  ) -> TypeAnnotedTermT raise {
    let p_2 = x149
    let t_13 = x150
    if p_2(t_13) {
      t_13
    } else {
      match t_13 {
        TypeAnnotedTermT::Abs_(_, b_3, _) => find_term(p_2, b_3)
        TypeAnnotedTermT::Comb_(u_4, v_6, _) =>
          find_term(p_2, u_4) catch {
            Failure(_) => find_term(p_2, v_6)
            _ => raise Failure("Annot.find_term")
          }
        _ => raise @lib.MatchFailure("tscript.ml:318")
      }
    }
  }
  let fo_term_match : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> ((
    @kernel.Term,
  ) -> (
    @list.List[(@kernel.Term, @kernel.Term)],
    @list.List[(@kernel.HolType, @kernel.HolType)],
  ) raise) raise) raise = fn(
    x151 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> ((@kernel.Term) -> (
    @list.List[(@kernel.Term, @kernel.Term)],
    @list.List[(@kernel.HolType, @kernel.HolType)],
  ) raise) raise) raise {
    let lcs = x151
    fn(
      x152 : @kernel.Term,
    ) -> ((@kernel.Term) -> (
      @list.List[(@kernel.Term, @kernel.Term)],
      @list.List[(@kernel.HolType, @kernel.HolType)],
    ) raise) raise {
      let p_3 = x152
      fn(
        x153 : @kernel.Term,
      ) -> (
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ) raise {
        let t_14 = x153
        fn self__7(
          x155 : @list.List[(TypeAnnotedTermT, @kernel.Term)],
          x156 : (
            @list.List[(TypeAnnotedTermT, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          x157 : @kernel.Term,
          x158 : TypeAnnotedTermT,
        ) -> (
          @list.List[(TypeAnnotedTermT, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ) raise {
          let bnds = x155
          let (tenv, tyenv) as env = x156
          let p_4 = x157
          let t_15 = x158
          match (p_4, t_15) {
            (@kernel.Term::Comb(p1, p2), TypeAnnotedTermT::Comb_(t1_4, t2_6, _)) =>
              self__7(bnds, self__7(bnds, env, p1, t1_4), p2, t2_6)
            (@kernel.Term::Abs(v_7, p_5), TypeAnnotedTermT::Abs_(v_p_1, t_16, _)
            ) => {
              let t159 = type_of(v_p_1)
              let tyenv_p = @basics.type_match(
                @kernel.type_of(v_7),
                t159,
                tyenv,
              )
              self__7(bnds.prepend((v_p_1, v_7)), (tenv, tyenv_p), p_5, t_16)
            }
            (
              @kernel.Term::Const(n, ty_7),
              TypeAnnotedTermT::Const_(n_p, ty_p, _),
            ) =>
              if n != n_p {
                fail_l(())
              } else {
                let tyenv_p_1 = @basics.type_match(ty_7, ty_p, tyenv)
                (tenv, tyenv_p_1)
              }
            (@kernel.Term::Var(n_1, ty_8) as v_8, t_17) =>
              try {
                if equal(t_17, @lib.rev_assoc(v_8, bnds)) {
                  env
                } else {
                  fail_l(())
                }
              } catch {
                Failure(_) =>
                  if @lib.mem(v_8, lcs) {
                    match t_17 {
                      TypeAnnotedTermT::Var_(n_p_1, ty_p_1) if n_p_1 == n_1 &&
                        ty_p_1 == ty_8 => env
                      _ => fail_l(())
                    }
                  } else {
                    let tyenv_p_2 = @basics.type_match(
                      ty_8,
                      type_of(t_17),
                      tyenv,
                    )
                    let t_p = Some(@lib.rev_assoc(v_8, tenv)) catch {
                      Failure(_) => None
                      e => raise e
                    }
                    match t_p {
                      Some(t_p_1) =>
                        if t_17 == t_p_1 {
                          (tenv, tyenv_p_2)
                        } else {
                          fail_l(())
                        }
                      None => (tenv.prepend((t_17, v_8)), tyenv_p_2)
                    }
                  }
                e => raise e
              }
            _ => fail_l(())
          }
        }
        let (tenv_1, tyenv_1) = self__7(
          @list.List([]),
          (@list.List([]), @list.List([])),
          p_3,
          of_term(t_14),
        )
        let inst : (@kernel.Term) -> @kernel.Term raise = fn(
          x161 : @kernel.Term,
        ) -> @kernel.Term raise {
          ((x160 : @kernel.Term) => @kernel.inst(tyenv_1, x160))(x161)
        }
        (
          @lib.list_rev_map(
            fn(
              x162 : (TypeAnnotedTermT, @kernel.Term),
            ) -> (@kernel.Term, @kernel.Term) raise {
              let (t_18, v_9) = x162
              let t163 = inst(v_9)
              (to_term(t_18), t163)
            },
            tenv_1,
          ),
          tyenv_1,
        )
      }
    }
  }
  fn match_bvs(
    x164 : @kernel.Term,
    x165 : @kernel.Term,
    x166 : @list.List[(String, String)],
  ) -> @list.List[(String, String)] raise {
    let t1_5 = x164
    let t2_7 = x165
    let acc_5 = x166
    try {
      let (v1_2, b1_1) = @kernel.dest_abs(t1_5)
      let (v2_2, b2_1) = @kernel.dest_abs(t2_7)
      let n1 = @kernel.dest_var(v1_2).0
      let n2 = @kernel.dest_var(v2_2).0
      let newacc = if n1 == n2 { acc_5 } else { @lib.insert((n1, n2), acc_5) }
      match_bvs(b1_1, b2_1, newacc)
    } catch {
      Failure(_) =>
        try {
          let (l1_2, r1) = @kernel.dest_comb(t1_5)
          let (l2_2, r2) = @kernel.dest_comb(t2_7)
          match_bvs(l1_2, l2_2, match_bvs(r1, r2, acc_5))
        } catch {
          Failure(_) => acc_5
          e => raise e
        }
      e => raise e
    }
  }
  let gen_part_match_all : ((@kernel.Term) -> @kernel.Term raise) -> ((
    @kernel.Thm,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(
    x167 : (@kernel.Term) -> @kernel.Term raise,
  ) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let partfn = x167
    fn(x168 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_10 = x168
      let sth = @bool.spec_all(th_10)
      let bod = @kernel.concl(sth)
      let pbod = partfn(bod)
      let t170 = @kernel.freesl(@kernel.hyp(th_10))
      let lcs_1 = @lib.intersect(@kernel.frees(@kernel.concl(th_10)), t170)
      let t171 = @kernel.frees(pbod)
      let fvs = @lib.subtract(@lib.subtract(@kernel.frees(bod), t171), lcs_1)
      fn(x172 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x172
        let bvms = match_bvs(tm, pbod, @list.List([]))
        let abod = @drule.deep_alpha(bvms, bod)
        let ath = @kernel.eq_mp(@equal.alpha_rule(bod, abod), sth)
        let t173 = partfn(abod)
        let (insts, tyinsts) = fo_term_match(lcs_1)(t173)(tm)
        let eth = @drule.instantiate_all(
          (@list.List([]), insts, tyinsts),
          @bool.genl(fvs, ath),
        )
        let fth = @lib.itlist(
          fn(x174 : @kernel.Term, x175 : @kernel.Thm) -> @kernel.Thm raise {
            let v_10 = x174
            let th_11 = x175
            @bool.spec_var(th_11).1
          },
          fvs,
          eth,
        )
        let tm_p = partfn(@kernel.concl(fth))
        if Int::to_int64(@lib.compare(tm_p, tm)) == 0L {
          fth
        } else {
          @equal.subs(@list.List([@equal.alpha_rule(tm_p, tm)]), fth) catch {
            Failure(_) => raise Failure("PART_MATCH: Sanity check failure")
            e => raise e
          }
        }
      }
    }
  }
  let empty_net = FoNetsT::Netnode(@list.List([]), @list.List([]))
  let label_to_store : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    FoNetsTermLabel,
    @list.List[@kernel.Term],
  ) raise) raise = fn(
    x176 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> (FoNetsTermLabel, @list.List[@kernel.Term]) raise) raise {
    let lcs_2 = x176
    fn(
      x177 : @kernel.Term,
    ) -> (FoNetsTermLabel, @list.List[@kernel.Term]) raise {
      let t_19 = x177
      let (op, args) = @basics.strip_comb(t_19)
      let nargs = Int::to_int64(@lib.length(args))
      match op {
        @kernel.Term::Const(n_2, _) => (FoNetsTermLabel::Cnet(n_2, nargs), args)
        @kernel.Term::Abs(v_11, b_4) => {
          let b_p_1 = if @lib.mem(v_11, lcs_2) {
            @kernel.vsubst(
              @list.List([(@basics.genvar(@kernel.type_of(v_11)), v_11)]),
              b_4,
            )
          } else {
            b_4
          }
          (FoNetsTermLabel::Lnet(nargs), args.prepend(b_p_1))
        }
        @kernel.Term::Var(n_3, _) if @lib.mem(op, lcs_2) =>
          (FoNetsTermLabel::Lcnet(n_3, nargs), args)
        @kernel.Term::Var(_, _) => (FoNetsTermLabel::Vnet(nargs), args)
        _ => raise @lib.AssertFailure("tscript.ml:425:14")
      }
    }
  }
  let enter : (@list.List[@kernel.Term]) -> (((@kernel.Term, _)) -> ((
    FoNetsT[_],
  ) -> FoNetsT[_] raise) raise) raise = (x186 : @list.List[@kernel.Term]) => {
    let lcs_4 = x186
    x187 => {
      let (t_21, elem_1) = x187
      x188 => {
        let net = x188
        ((x178, x179, x180) => {
          net_update_l(label_to_store, empty_net, x178, x179, x180)
        })(lcs_4, elem_1, net)(@list.List([t_21]))
      }
    }
  }
  let label_for_lookup : (@kernel.Term) -> (
    FoNetsTermLabel,
    @list.List[@kernel.Term],
  ) raise = fn(
    x189 : @kernel.Term,
  ) -> (FoNetsTermLabel, @list.List[@kernel.Term]) raise {
    let t_22 = x189
    let (op_1, args_1) = @basics.strip_comb(t_22)
    let nargs_1 = Int::to_int64(@lib.length(args_1))
    match op_1 {
      @kernel.Term::Const(n_4, _) =>
        (FoNetsTermLabel::Cnet(n_4, nargs_1), args_1)
      @kernel.Term::Abs(_, b_5) =>
        (FoNetsTermLabel::Lnet(nargs_1), args_1.prepend(b_5))
      @kernel.Term::Var(n_5, _) =>
        (FoNetsTermLabel::Lcnet(n_5, nargs_1), args_1)
      @kernel.Term::Comb(_, _) => raise @lib.AssertFailure("tscript.ml:447:19")
    }
  }
  let lookup : (@kernel.Term) -> ((FoNetsT[_]) -> @list.List[_] raise) raise = (
    x194 : @kernel.Term,
  ) => {
    let t_25 = x194
    x195 => {
      let net_1 = x195
      (x190 => follow_l(label_for_lookup, x190))(net_1)(@list.List([t_25]))
    }
  }
  let neg : (VarianceT) -> VarianceT raise = fn(
    x200 : VarianceT,
  ) -> VarianceT raise {
    match x200 {
      VarianceT::Co => VarianceT::Contra
      VarianceT::Contra => VarianceT::Co
    }
  }
  let mkimp_common : (@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x201 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let lem_1 = x201
    fn(x202 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let th1_4 = x202
      fn(x203 : @kernel.Thm) -> @kernel.Thm raise {
        let th2_3 = x203
        let (a, b_6) = @basics.dest_imp(@kernel.concl(th1_4))
        let (c, d) = @basics.dest_imp(@kernel.concl(th2_3))
        let t204 = @bool.conj(th1_4, th2_3)
        @bool.mp(
          @kernel.inst_rule(
            @list.List([(a, a_), (b_6, b_), (c, c_), (d, d_)]),
            lem_1,
          ),
          t204,
        )
      }
    }
  }
  let mkimp_conj : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimp_common(
    @theorems.mono_and(),
  )
  let mkimp_disj : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimp_common(
    @theorems.mono_or(),
  )
  let lem_2 = @class.taut(
    @term_syntax.parse_term("(((A : Bool) → (B : Bool)) → (C : Bool) → (D : Bool)) && ((B → A) → D → C) → A == B → C == D"),
  )
  let mkimp_iff : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x205 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_5 = x205
    fn(x206 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_4 = x206
      let (ab, cd) = @basics.dest_imp(@kernel.concl(th1_5))
      let (a_1, b_7) = @basics.dest_imp(ab)
      let (c_1, d_1) = @basics.dest_imp(cd)
      let t207 = @bool.conj(th1_5, th2_4)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_1, a_), (b_7, b_), (c_1, c_), (d_1, d_)]),
          lem_2,
        ),
        t207,
      )
    }
  }
  let lem_3 = @class.taut(
    @term_syntax.parse_term("(((A : Bool) → (B : Bool)) → (C : Bool)) && ((B → A) → (D : Bool)) → A == B → C && D"),
  )
  let mkimp_contra_iff : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x208 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_6 = x208
    fn(x209 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_5 = x209
      let (ab_1, c_2) = @basics.dest_imp(@kernel.concl(th1_6))
      let (_, d_2) = @basics.dest_imp(@kernel.concl(th2_5))
      let (a_2, b_8) = @basics.dest_imp(ab_1)
      let t210 = @bool.conj(th1_6, th2_5)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_2, a_), (b_8, b_), (c_2, c_), (d_2, d_)]),
          lem_3,
        ),
        t210,
      )
    }
  }
  let lem_4 = @class.taut(
    @term_syntax.parse_term("(((A : Bool) → (B : Bool)) → (C : Bool)) → A == B → C && (B → A)"),
  )
  let mkimpl_contra_iff : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x211 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_12 = x211
    let (ab_2, c_3) = @basics.dest_imp(@kernel.concl(th_12))
    let (a_3, b_9) = @basics.dest_imp(ab_2)
    @bool.mp(
      @kernel.inst_rule(@list.List([(a_3, a_), (b_9, b_), (c_3, c_)]), lem_4),
      th_12,
    )
  }
  let lem_5 = @class.taut(
    @term_syntax.parse_term("(((B : Bool) → (A : Bool)) → (D : Bool)) → A == B → (A → B) && D"),
  )
  let mkimpr_contra_iff : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x212 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_13 = x212
    let (ba, d_3) = @basics.dest_imp(@kernel.concl(th_13))
    let (b_10, a_4) = @basics.dest_imp(ba)
    @bool.mp(
      @kernel.inst_rule(@list.List([(a_4, a_), (b_10, b_), (d_3, d_)]), lem_5),
      th_13,
    )
  }
  let lem_6 = @class.taut(
    @term_syntax.parse_term("((C : Bool) → (A : Bool) → (B : Bool)) && ((D : Bool) → B → A) → C && D → A == B"),
  )
  let mkimp_co_iff : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x213 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_7 = x213
    fn(x214 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_6 = x214
      let (c_4, ab_3) = @basics.dest_imp(@kernel.concl(th1_7))
      let (d_4, _) = @basics.dest_imp(@kernel.concl(th2_6))
      let (a_5, b_11) = @basics.dest_imp(ab_3)
      let t215 = @bool.conj(th1_7, th2_6)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_5, a_), (b_11, b_), (c_4, c_), (d_4, d_)]),
          lem_6,
        ),
        t215,
      )
    }
  }
  let lem_7 = @class.taut(
    @term_syntax.parse_term("((C : Bool) → (A : Bool) → (B : Bool)) → C && (B → A) → A == B"),
  )
  let mkimpl_co_iff : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x216 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_14 = x216
    let (c_5, ab_4) = @basics.dest_imp(@kernel.concl(th_14))
    let (a_6, b_12) = @basics.dest_imp(ab_4)
    @bool.mp(
      @kernel.inst_rule(@list.List([(a_6, a_), (b_12, b_), (c_5, c_)]), lem_7),
      th_14,
    )
  }
  let lem_8 = @class.taut(
    @term_syntax.parse_term("((D : Bool) → (B : Bool) → (A : Bool)) → (A → B) && D → A == B"),
  )
  let mkimpr_co_iff : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x217 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_15 = x217
    let (d_5, ba_1) = @basics.dest_imp(@kernel.concl(th_15))
    let (b_13, a_7) = @basics.dest_imp(ba_1)
    @bool.mp(
      @kernel.inst_rule(@list.List([(a_7, a_), (b_13, b_), (d_5, d_)]), lem_8),
      th_15,
    )
  }
  let mkimp_imp : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x218 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_8 = x218
    fn(x219 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_7 = x219
      let (b_14, a_8) = @basics.dest_imp(@kernel.concl(th1_8))
      let (c_6, d_6) = @basics.dest_imp(@kernel.concl(th2_7))
      let t220 = @bool.conj(th1_8, th2_7)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_8, a_), (b_14, b_), (c_6, c_), (d_6, d_)]),
          @theorems.mono_imp(),
        ),
        t220,
      )
    }
  }
  let mkimpl_common : (@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(
    x221 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let lem_9 = x221
    let t223 = @kernel.inst_rule(@list.List([(c_, d_)]), lem_9)
    let lem_p = @simp.rewrite_rule(@list.List([]))(t223)
    fn(x224 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_16 = x224
      fn(x225 : @kernel.Term) -> @kernel.Thm raise {
        let t_26 = x225
        let (a_9, b_15) = @basics.dest_imp(@kernel.concl(th_16))
        @bool.mp(
          @kernel.inst_rule(
            @list.List([(a_9, a_), (b_15, b_), (t_26, c_)]),
            lem_p,
          ),
          th_16,
        )
      }
    }
  }
  let mkimpl_conj : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = mkimpl_common(
    @theorems.mono_and(),
  )
  let mkimpl_disj : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = mkimpl_common(
    @theorems.mono_or(),
  )
  let t226 = @kernel.inst_rule(@list.List([(c_, d_)]), @theorems.mono_imp())
  let mono_imp_p = @simp.rewrite_rule(@list.List([]))(t226)
  let mkimpl_imp : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x227 : @kernel.Thm,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let th_17 = x227
    fn(x228 : @kernel.Term) -> @kernel.Thm raise {
      let t_27 = x228
      let (b_16, a_10) = @basics.dest_imp(@kernel.concl(th_17))
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_10, a_), (b_16, b_), (t_27, c_)]),
          mono_imp_p,
        ),
        th_17,
      )
    }
  }
  let mkimpr_common : (@kernel.Thm) -> ((@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x229 : @kernel.Thm,
  ) -> ((@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let lem_10 = x229
    let t231 = @kernel.inst_rule(@list.List([(a_, b_)]), lem_10)
    let lem_p_1 = @simp.rewrite_rule(@list.List([]))(t231)
    fn(x232 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let t_28 = x232
      fn(x233 : @kernel.Thm) -> @kernel.Thm raise {
        let th_18 = x233
        let (c_7, d_7) = @basics.dest_imp(@kernel.concl(th_18))
        @bool.mp(
          @kernel.inst_rule(
            @list.List([(c_7, c_), (d_7, d_), (t_28, a_)]),
            lem_p_1,
          ),
          th_18,
        )
      }
    }
  }
  let mkimpr_conj : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimpr_common(
    @theorems.mono_and(),
  )
  let mkimpr_disj : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimpr_common(
    @theorems.mono_or(),
  )
  let mkimpr_imp : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimpr_common(
    @theorems.mono_imp(),
  )
  let mkimp_not : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x234 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_19 = x234
    let (b_17, a_11) = @basics.dest_imp(@kernel.concl(th_19))
    @bool.mp(
      @kernel.inst_rule(
        @list.List([(a_11, a_), (b_17, b_)]),
        @theorems.mono_not(),
      ),
      th_19,
    )
  }
  let mkimp_quant : (@kernel.Thm) -> ((@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x235 : @kernel.Thm,
  ) -> ((@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let lem_11 = x235
    fn(x236 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let x_19 = x236
      fn(x237 : @kernel.Thm) -> @kernel.Thm raise {
        let th_20 = x237
        let x_ty = @kernel.type_of(x_19)
        let (p_7, q) = @basics.dest_imp(@kernel.concl(th_20))
        let p_p = @kernel.mk_abs(x_19, p_7)
        let q_p = @kernel.mk_abs(x_19, q)
        let p_8 = @kernel.mk_var("P", @basics.mk_fun_ty(x_ty, @kernel.bool_ty))
        let q_1 = @kernel.mk_var("Q", @basics.mk_fun_ty(x_ty, @kernel.bool_ty))
        let lem_12 = @kernel.inst_rule(
          @list.List([(p_p, p_8), (q_p, q_1)]),
          @kernel.inst_type(@list.List([(x_ty, @kernel.aty)]), lem_11),
        )
        let t238 = @equal.once_depth_conv(@equal.beta_conv)
        let c_8 : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
          @equal.once_depth_conv(@equal.alpha_conv(x_19)),
          t238,
        )
        let t239 = @bool.gen(x_19, th_20)
        @bool.mp(@equal.conv_rule(c_8, lem_12), t239)
      }
    }
  }
  let mkimp_forall : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimp_quant(
    @theorems.mono_forall(),
  )
  let mkimp_exists : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = mkimp_quant(
    @theorems.mono_exists(),
  )
  let lem_13 = @class.taut(
    @term_syntax.parse_term("((B : Bool) → (A : Bool)) && (A → B → (C : Bool) → (D : Bool)) → (A → C) → B → D"),
  )
  let mkimp_imp_contra_ctxt : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x240 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_9 = x240
    fn(x241 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_8 = x241
      let (a_12, bcd) = @basics.dest_imp(@kernel.concl(th2_8))
      let (b_18, cd_1) = @basics.dest_imp(bcd)
      let (c_9, d_8) = @basics.dest_imp(cd_1)
      let t242 = @bool.conj(th1_9, th2_8)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_12, a_), (b_18, b_), (c_9, c_), (d_8, d_)]),
          lem_13,
        ),
        t242,
      )
    }
  }
  let lem_14 = @class.taut(
    @term_syntax.parse_term("((A : Bool) → (B : Bool)) && (A → B → (D : Bool) → (C : Bool)) → (B → D) → A → C"),
  )
  let mkimp_imp_co_ctxt : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x243 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_10 = x243
    fn(x244 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_9 = x244
      let (a_13, bdc) = @basics.dest_imp(@kernel.concl(th2_9))
      let (b_19, dc) = @basics.dest_imp(bdc)
      let (d_9, c_10) = @basics.dest_imp(dc)
      let t245 = @bool.conj(th1_10, th2_9)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_13, a_), (b_19, b_), (c_10, c_), (d_9, d_)]),
          lem_14,
        ),
        t245,
      )
    }
  }
  let lem_15 = @class.taut(
    @term_syntax.parse_term("((A : Bool) → (C : Bool) → (D : Bool)) → (A → C) → A → D"),
  )
  let mkimpr_imp_ctxt : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x246 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_21 = x246
    let (a_14, cd_2) = @basics.dest_imp(@kernel.concl(th_21))
    let (c_11, d_10) = @basics.dest_imp(cd_2)
    @bool.mp(
      @kernel.inst_rule(
        @list.List([(c_11, c_), (d_10, d_), (a_14, a_)]),
        lem_15,
      ),
      th_21,
    )
  }
  let lem_16 = @class.taut(
    @term_syntax.parse_term("((C : Bool) → (A : Bool) → (B : Bool)) && (A → B → C → (D : Bool)) → A && C → B && D"),
  )
  let mkimp_conj_contra_ctxt : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x247 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_11 = x247
    fn(x248 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_10 = x248
      let (a_15, bcd_1) = @basics.dest_imp(@kernel.concl(th2_10))
      let (b_20, cd_3) = @basics.dest_imp(bcd_1)
      let (c_12, d_11) = @basics.dest_imp(cd_3)
      let t249 = @bool.conj(th1_11, th2_10)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_15, a_), (b_20, b_), (c_12, c_), (d_11, d_)]),
          lem_16,
        ),
        t249,
      )
    }
  }
  let lem_17 = @class.taut(
    @term_syntax.parse_term("((C : Bool) → (A : Bool) → (B : Bool)) → A && C → B && C"),
  )
  let mkimpl_conj_contra_ctxt : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x250 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_22 = x250
    let (c_13, ab_5) = @basics.dest_imp(@kernel.concl(th_22))
    let (a_16, b_21) = @basics.dest_imp(ab_5)
    @bool.mp(
      @kernel.inst_rule(
        @list.List([(a_16, a_), (b_21, b_), (c_13, c_)]),
        lem_17,
      ),
      th_22,
    )
  }
  let lem_18 = @class.taut(
    @term_syntax.parse_term("((A : Bool) → (C : Bool) → (D : Bool)) → A && C → A && D"),
  )
  let mkimpr_conj_contra_ctxt : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x251 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_23 = x251
    let (a_17, cd_4) = @basics.dest_imp(@kernel.concl(th_23))
    let (c_14, d_12) = @basics.dest_imp(cd_4)
    @bool.mp(
      @kernel.inst_rule(
        @list.List([(a_17, a_), (c_14, c_), (d_12, d_)]),
        lem_18,
      ),
      th_23,
    )
  }
  let lem_19 = @class.taut(
    @term_syntax.parse_term("((B : Bool) → (A : Bool)) && (B → (D : Bool) → (C : Bool)) → B && D → A && C"),
  )
  let mkimp_conj_co_ctxt : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x252 : @kernel.Thm,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1_12 = x252
    fn(x253 : @kernel.Thm) -> @kernel.Thm raise {
      let th2_11 = x253
      let (b_22, a_18) = @basics.dest_imp(@kernel.concl(th1_12))
      let (d_13, c_15) = @basics.dest_imp(
        @basics.dest_imp(@kernel.concl(th2_11)).1,
      )
      let t254 = @bool.conj(th1_12, th2_11)
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_18, a_), (b_22, b_), (c_15, c_), (d_13, d_)]),
          lem_19,
        ),
        t254,
      )
    }
  }
  let lem_20 = @class.taut(@term_syntax.parse_term("((B : Bool) → (A : Bool)) → B && (C : Bool) → A && C"))
  let mkimpl_conj_co_ctxt : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x255 : @kernel.Thm,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let th_24 = x255
    let (b_23, a_19) = @basics.dest_imp(@kernel.concl(th_24))
    fn(x257 : @kernel.Term) -> @kernel.Thm raise {
      let c_16 = x257
      @bool.mp(
        @kernel.inst_rule(
          @list.List([(a_19, a_), (b_23, b_), (c_16, c_)]),
          lem_20,
        ),
        th_24,
      )
    }
  }
  let lem_21 = @class.taut(
    @term_syntax.parse_term("((C : Bool) → (B : Bool) → (A : Bool)) → B && C → A && C"),
  )
  let mkimpl_conj_co2_ctxt : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x258 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_25 = x258
    let (c_17, ba_2) = @basics.dest_imp(@kernel.concl(th_25))
    let (b_24, a_20) = @basics.dest_imp(ba_2)
    @bool.mp(
      @kernel.inst_rule(
        @list.List([(a_20, a_), (b_24, b_), (c_17, c_)]),
        lem_21,
      ),
      th_25,
    )
  }
  let mkimpr_conj_co_ctxt : (@kernel.Thm) -> @kernel.Thm raise = mkimpr_conj_contra_ctxt
  let imp_conv_of_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((VarianceT) -> ((
    @kernel.Term,
  ) -> @kernel.Thm raise) raise) raise = fn(
    x259 : (@kernel.Term) -> @kernel.Thm raise,
  ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let c_18 = x259
    fn(x260 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let v_12 = x260
      fn(x261 : @kernel.Term) -> @kernel.Thm raise {
        let t_29 = x261
        let (th1_13, th2_12) = @bool.eq_imp_rule(c_18(t_29))
        match v_12 {
          VarianceT::Co => th2_12
          VarianceT::Contra => th1_13
        }
      }
    }
  }
  let imp_conv_outcome : (@kernel.Thm) -> ((VarianceT) -> @kernel.Term raise) raise = fn(
    x262 : @kernel.Thm,
  ) -> ((VarianceT) -> @kernel.Term raise) raise {
    let th_26 = x262
    fn(x263 : VarianceT) -> @kernel.Term raise {
      let v_13 = x263
      let (t1_6, t2_8) = dest_binary_blind(@kernel.concl(th_26))
      match v_13 {
        VarianceT::Co => t1_6
        VarianceT::Contra => t2_8
      }
    }
  }
  let all_impconv : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x264 : VarianceT,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    imp_refl
  }
  let no_impconv : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x266 : VarianceT,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x267 : @kernel.Term) -> @kernel.Thm raise { raise Failure("NO_IMPCONV") }
  }
  let bind_impconv : (
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x268 : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let _ as c_19 = x268
    fn(x269 : VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let v_14 = x269
      fn(x270 : @kernel.Thm) -> @kernel.Thm raise {
        let th_27 = x270
        let (t1_7, t2_9) = @basics.dest_imp(@kernel.concl(th_27))
        match v_14 {
          VarianceT::Co => @bool.imp_trans(c_19(v_14)(t1_7), th_27)
          VarianceT::Contra => @bool.imp_trans(th_27, c_19(v_14)(t2_9))
        }
      }
    }
  }
  let then_impconv : (
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> (((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((
    VarianceT,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise = fn(
    x271 : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> (((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((
    VarianceT,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
    let _ as c1 = x271
    fn(
      x272 : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
      let c2 = x272
      fn(x273 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_15 = x273
        fn(x274 : @kernel.Term) -> @kernel.Thm raise {
          let t_30 = x274
          let t275 = c1(v_15)(t_30)
          bind_impconv(c2)(v_15)(t275)
        }
      }
    }
  }
  let match_mp_impconv : (@kernel.Thm) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(
    x276 : @kernel.Thm,
  ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let th_28 = x276
    fn(x277 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      match x277 {
        VarianceT::Co => @drule.gen_part_match(@kernel.rand, th_28)
        VarianceT::Contra => @drule.gen_part_match(@equal.lhand, th_28)
      }
    }
  }
  let impconv_rule : (
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x280 : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let c_20 = x280
    fn(x281 : @kernel.Thm) -> @kernel.Thm raise {
      let th_29 = x281
      let t_31 = @kernel.concl(th_29)
      @drule.match_mp(c_20(VarianceT::Contra)(t_31))(th_29)
    }
  }
  let impconv_tac : ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise = fn(
    x282 : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
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
    let cnv = x282
    fn(
      x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      let (_, c_21) as g = x283
      let t284 = @tactics.try_tac(@tactics.accept_tac(@bool.truth()))
      @tactics.then_tac(@tactics.match_mp_tac(cnv(VarianceT::Co)(c_21)), t284)(
        g,
      )
    }
  }
  let imp_conv_of_ctx_imp_conv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = apply_l
  fn conj_ctximpconv(
    x295 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_24 = x295
    let t301 = diminish_l(c_24)
    let t299 = augment_l(c_24)
    ImpconvWithContext::With_context(
      fn(x296 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_17 = x296
        fn(x297 : @kernel.Term) -> @kernel.Thm raise {
          let t_33 = x297
          let (t1_8, t2_10) = @basics.dest_conj(t_33)
          match v_17 {
            VarianceT::Co =>
              try {
                let th1_14 = apply_l(c_24)(VarianceT::Co)(t1_8)
                try {
                  let t1_p = imp_conv_outcome(th1_14)(VarianceT::Co)
                  let t298 = ((x290, x291, x292, x293) => {
                    apply_with_context_l(
                      disch_conj, strip_conj_1, x290, x291, x292, x293,
                    )
                  })(c_24, t1_p, VarianceT::Co, t2_10)
                  mkimp_conj_co_ctxt(th1_14)(t298)
                } catch {
                  Failure(_) => mkimpl_conj_co_ctxt(th1_14)(t2_10)
                  e => raise e
                }
              } catch {
                Failure(_) =>
                  mkimpr_conj_co_ctxt(
                    ((x290, x291, x292, x293) => {
                      apply_with_context_l(
                        disch_conj, strip_conj_1, x290, x291, x292, x293,
                      )
                    })(c_24, t1_8, VarianceT::Co, t2_10),
                  )
                e => raise e
              }
            VarianceT::Contra =>
              try {
                let t2s = remove(strip_conj_1(t2_10))(t1_8)
                let th1_15 = apply_l(augment_l(c_24)(t2s))(VarianceT::Contra)(
                  t1_8,
                )
                try {
                  let t1_p_1 = imp_conv_outcome(th1_15)(VarianceT::Contra)
                  let t1s = strip_conj_1(t1_8)
                  let t1s_p = strip_conj_1(t1_p_1)
                  let t1s_p_p = union(t1s, t1s_p)
                  let th2_13 = apply_l(augment_l(c_24)(t1s_p_p))(
                    VarianceT::Contra,
                  )(t2_10)
                  let th2_p = disch_conj(t1_8, disch_conj(t1_p_1, th2_13))
                  mkimp_conj_contra_ctxt(disch_conj(t2_10, th1_15))(th2_p)
                } catch {
                  Failure(_) =>
                    mkimpl_conj_contra_ctxt(disch_conj(t2_10, th1_15))
                  e => raise e
                }
              } catch {
                Failure(_) =>
                  mkimpr_conj_contra_ctxt(
                    ((x290, x291, x292, x293) => {
                      apply_with_context_l(
                        disch_conj, strip_conj_1, x290, x291, x292, x293,
                      )
                    })(c_24, t1_8, VarianceT::Contra, t2_10),
                  )
                e => raise e
              }
          }
        }
      },
      fn(
        x300 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        conj_ctximpconv(t299(x300))
      },
      fn(
        x302 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        conj_ctximpconv(t301(x302))
      },
    )
  }
  fn disj_ctximpconv(
    x303 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_25 = x303
    let t310 = diminish_l(c_25)
    let t308 = augment_l(c_25)
    ImpconvWithContext::With_context(
      fn(x304 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_18 = x304
        fn(x305 : @kernel.Term) -> @kernel.Thm raise {
          let t_34 = x305
          let (t1_9, t2_11) = @basics.dest_disj(t_34)
          try {
            let th1_16 = apply_l(c_25)(v_18)(t1_9)
            try {
              let t306 = apply_l(c_25)(v_18)(t2_11)
              mkimp_disj(th1_16)(t306)
            } catch {
              Failure(_) => mkimpl_disj(th1_16)(t2_11)
              e => raise e
            }
          } catch {
            Failure(_) => {
              let t307 = apply_l(c_25)(v_18)(t2_11)
              mkimpr_disj(t1_9)(t307)
            }
            e => raise e
          }
        }
      },
      fn(
        x309 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        disj_ctximpconv(t308(x309))
      },
      fn(
        x311 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        disj_ctximpconv(t310(x311))
      },
    )
  }
  fn imp_ctximpconv(
    x312 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_26 = x312
    let t319 = diminish_l(c_26)
    let t317 = augment_l(c_26)
    ImpconvWithContext::With_context(
      fn(x313 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_19 = x313
        fn(x314 : @kernel.Term) -> @kernel.Thm raise {
          let t_35 = x314
          let (t1_10, t2_12) = @basics.dest_imp(t_35)
          try {
            let v_p_2 = neg(v_19)
            let th1_17 = apply_l(c_26)(v_p_2)(t1_10)
            let t1_p_2 = imp_conv_outcome(th1_17)(v_p_2)
            let t315 = strip_conj_1(t1_p_2)
            let t1s_1 = union(strip_conj_1(t1_10), t315)
            let c_p = augment_l(c_26)(t1s_1)
            let mk : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = match
              v_19 {
              VarianceT::Co => mkimp_imp_co_ctxt
              VarianceT::Contra => mkimp_imp_contra_ctxt
            }
            try {
              let t316 = disch_conj(
                t1_10,
                disch_conj(t1_p_2, apply_l(c_p)(v_19)(t2_12)),
              )
              mk(th1_17)(t316)
            } catch {
              Failure(_) => mkimpl_imp(th1_17)(t2_12)
              e => raise e
            }
          } catch {
            Failure(_) =>
              mkimpr_imp_ctxt(
                ((x290, x291, x292, x293) => {
                  apply_with_context_l(
                    disch_conj, strip_conj_1, x290, x291, x292, x293,
                  )
                })(c_26, t1_10, v_19, t2_12),
              )
            e => raise e
          }
        }
      },
      fn(
        x318 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        imp_ctximpconv(t317(x318))
      },
      fn(
        x320 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        imp_ctximpconv(t319(x320))
      },
    )
  }
  fn iff_ctximpconv(
    x321 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_27 = x321
    let t329 = diminish_l(c_27)
    let t327 = augment_l(c_27)
    ImpconvWithContext::With_context(
      fn(x322 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_20 = x322
        fn(x323 : @kernel.Term) -> @kernel.Thm raise {
          let t_36 = x323
          let (t1_11, t2_13) = @bool.dest_iff(t_36)
          let (lr, l_2, r_1) = match v_20 {
            VarianceT::Co => (mkimp_co_iff, mkimpl_co_iff, mkimpr_co_iff)
            VarianceT::Contra =>
              (mkimp_contra_iff, mkimpl_contra_iff, mkimpr_contra_iff)
          }
          try {
            let t324 = @bool.mk_imp(t1_11, t2_13)
            let th1_18 = apply_l(c_27)(v_20)(t324)
            try {
              let t325 = @bool.mk_imp(t2_13, t1_11)
              let th2_14 = apply_l(c_27)(v_20)(t325)
              mkimp_iff(th1_18)(th2_14) catch {
                Failure(_) => lr(th1_18)(th2_14)
                e => raise e
              }
            } catch {
              Failure(_) => l_2(th1_18)
              e => raise e
            }
          } catch {
            Failure(_) => {
              let t326 = @bool.mk_imp(t2_13, t1_11)
              r_1(apply_l(c_27)(v_20)(t326))
            }
            e => raise e
          }
        }
      },
      fn(
        x328 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        iff_ctximpconv(t327(x328))
      },
      fn(
        x330 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        iff_ctximpconv(t329(x330))
      },
    )
  }
  fn not_ctximpconv(
    x331 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_28 = x331
    let t338 = diminish_l(c_28)
    let t336 = augment_l(c_28)
    ImpconvWithContext::With_context(
      fn(x332 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_21 = x332
        fn(x333 : @kernel.Term) -> @kernel.Thm raise {
          let t_37 = x333
          let t334 = @basics.dest_neg(t_37)
          let t335 = neg(v_21)
          mkimp_not(apply_l(c_28)(t335)(t334))
        }
      },
      fn(
        x337 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        not_ctximpconv(t336(x337))
      },
      fn(
        x339 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        not_ctximpconv(t338(x339))
      },
    )
  }
  fn quant_ctximpconv(
    x340 : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
    x341 : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
    x342 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let mkimp = x340
    let sel = x341
    let _ as c_29 = x342
    let t350 = diminish_l(c_29)
    let t347 = augment_l(c_29)
    ImpconvWithContext::With_context(
      fn(x343 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_22 = x343
        fn(x344 : @kernel.Term) -> @kernel.Thm raise {
          let t_38 = x344
          let (x_20, b_25) = sel(t_38)
          let c_p_1 = diminish_l(c_29)(x_20)
          let t345 = apply_l(c_p_1)(v_22)(b_25)
          mkimp(x_20)(t345)
        }
      },
      fn(
        x348 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        ((x346 : ImpconvWithContext[ImpconvImpConv]) => {
          quant_ctximpconv(mkimp, sel, x346)
        })(t347(x348))
      },
      fn(
        x351 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        ((x349 : ImpconvWithContext[ImpconvImpConv]) => {
          quant_ctximpconv(mkimp, sel, x349)
        })(t350(x351))
      },
    )
  }
  let forall_ctximpconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = (x352 : ImpconvWithContext[ImpconvImpConv]) => {
    quant_ctximpconv(mkimp_forall, @basics.dest_forall, x352)
  }
  let exists_ctximpconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = (x353 : ImpconvWithContext[ImpconvImpConv]) => {
    quant_ctximpconv(mkimp_exists, @basics.dest_exists, x353)
  }
  let iff_ty = @parser.parse_type("bool->bool->bool")
  fn sub_ctximpconv(
    x354 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let c_30 = x354
    let t359 = diminish_l(c_30)
    let t357 = augment_l(c_30)
    ImpconvWithContext::With_context(
      fn(x355 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_23 = x355
        fn(x356 : @kernel.Term) -> @kernel.Thm raise {
          let t_39 = x356
          let (n_7, ty_9) = @kernel.dest_const(@basics.strip_comb(t_39).0)
          apply_l(
            (match n_7 {
              "==>" => imp_ctximpconv
              "/\\" => conj_ctximpconv
              "\\/" => disj_ctximpconv
              "=" if ty_9 == iff_ty => iff_ctximpconv
              "forall" => forall_ctximpconv
              "?" => exists_ctximpconv
              "~" => not_ctximpconv
              _ => raise Failure("SUB_CTXIMPCONV")
            })(c_30),
          )(v_23)(t_39)
        }
      },
      fn(
        x358 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        sub_ctximpconv(t357(x358))
      },
      fn(
        x360 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        sub_ctximpconv(t359(x360))
      },
    )
  }
  let bind_ctximpconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(
    x361 : ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let _ as c_31 = x361
    fn(x362 : VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let v_24 = x362
      fn(x363 : @kernel.Thm) -> @kernel.Thm raise {
        let th_30 = x363
        let (t1_12, t2_14) = @basics.dest_imp(@kernel.concl(th_30))
        match v_24 {
          VarianceT::Co => @bool.imp_trans(apply_l(c_31)(v_24)(t1_12), th_30)
          VarianceT::Contra =>
            @bool.imp_trans(th_30, apply_l(c_31)(v_24)(t2_14))
        }
      }
    }
  }
  fn bind_ctximpconv_1(
    x364 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
  ] raise {
    let _ as c_32 = x364
    let t369 = diminish_l(c_32)
    let t367 = augment_l(c_32)
    ImpconvWithContext::With_context(
      fn(x365 : VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let v_25 = x365
        fn(x366 : @kernel.Thm) -> @kernel.Thm raise {
          let th_31 = x366
          bind_ctximpconv(c_32)(v_25)(th_31)
        }
      },
      fn(
        x368 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      ] raise {
        bind_ctximpconv_1(t367(x368))
      },
      fn(
        x370 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
      ] raise {
        bind_ctximpconv_1(t369(x370))
      },
    )
  }
  fn then_ctximpconv(
    x371 : ImpconvWithContext[ImpconvImpConv],
    x372 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c1_1 = x371
    let _ as c2_1 = x372
    ImpconvWithContext::With_context(
      fn(x373 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_26 = x373
        fn(x374 : @kernel.Term) -> @kernel.Thm raise {
          let t_40 = x374
          let t375 = apply_l(c1_1)(v_26)(t_40)
          bind_ctximpconv(c2_1)(v_26)(t375)
        }
      },
      fn(
        x376 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        let x_21 = x376
        let t377 = augment_l(c2_1)(x_21)
        then_ctximpconv(augment_l(c1_1)(x_21), t377)
      },
      fn(
        x378 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        let x_22 = x378
        let t379 = diminish_l(c2_1)(x_22)
        then_ctximpconv(diminish_l(c1_1)(x_22), t379)
      },
    )
  }
  fn try_ctximpconv(
    x380 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_33 = x380
    let t385 = diminish_l(c_33)
    let t383 = augment_l(c_33)
    ImpconvWithContext::With_context(
      fn(x381 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_27 = x381
        fn(x382 : @kernel.Term) -> @kernel.Thm raise {
          let t_41 = x382
          apply_l(c_33)(v_27)(t_41) catch {
            Failure(_) | @lib.Unchanged => all_impconv(v_27)(t_41)
            e => raise e
          }
        }
      },
      fn(
        x384 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        try_ctximpconv(t383(x384))
      },
      fn(
        x386 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        try_ctximpconv(t385(x386))
      },
    )
  }
  fn orelse_ctximpconv(
    x387 : ImpconvWithContext[ImpconvImpConv],
    x388 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c1_2 = x387
    let _ as c2_2 = x388
    ImpconvWithContext::With_context(
      fn(x389 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_28 = x389
        fn(x390 : @kernel.Term) -> @kernel.Thm raise {
          let t_42 = x390
          apply_l(c1_2)(v_28)(t_42) catch {
            Failure(_) => apply_l(c2_2)(v_28)(t_42)
            e => raise e
          }
        }
      },
      fn(
        x391 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        let x_23 = x391
        let t392 = augment_l(c2_2)(x_23)
        orelse_ctximpconv(augment_l(c1_2)(x_23), t392)
      },
      fn(
        x393 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        let x_24 = x393
        let t394 = diminish_l(c2_2)(x_24)
        orelse_ctximpconv(diminish_l(c1_2)(x_24), t394)
      },
    )
  }
  fn changed_ctximpconv(
    x395 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_34 = x395
    let t400 = diminish_l(c_34)
    let t398 = augment_l(c_34)
    ImpconvWithContext::With_context(
      fn(x396 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_29 = x396
        fn(x397 : @kernel.Term) -> @kernel.Thm raise {
          let t_43 = x397
          let th_32 = apply_l(c_34)(v_29)(t_43)
          let (l_3, r_2) = @basics.dest_imp(@kernel.concl(th_32))
          if @basics.aconv(l_3, r_2) {
            raise Failure("CHANGED_CTXIMPCONV")
          } else {
            th_32
          }
        }
      },
      fn(
        x399 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        changed_ctximpconv(t398(x399))
      },
      fn(
        x401 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        changed_ctximpconv(t400(x401))
      },
    )
  }
  fn unchanged_of_fail_ctximpconv(
    x402 : ImpconvWithContext[ImpconvImpConv],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_35 = x402
    let t407 = diminish_l(c_35)
    let t405 = augment_l(c_35)
    ImpconvWithContext::With_context(
      fn(x403 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_30 = x403
        fn(x404 : @kernel.Term) -> @kernel.Thm raise {
          let t_44 = x404
          apply_l(c_35)(v_30)(t_44) catch {
            Failure(_) => raise @lib.Unchanged
            e => raise e
          }
        }
      },
      fn(
        x406 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        unchanged_of_fail_ctximpconv(t405(x406))
      },
      fn(
        x408 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        unchanged_of_fail_ctximpconv(t407(x408))
      },
    )
  }
  fn repeat_unchanged_ctximpconv(
    x413 : @list.List[ImpconvWithContext[ImpconvImpConv]],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as cs = x413
    ImpconvWithContext::With_context(
      fn(x414 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_31 = x414
        fn(x415 : @kernel.Term) -> @kernel.Thm raise {
          let t_45 = x415
          fn loop__1(
            x416 : Bool,
            x417 : @kernel.Thm,
            x418 : @list.List[
              ImpconvWithContext[
                (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
              ],
            ],
          ) -> @kernel.Thm raise {
            let changed = x416
            let acc_6 = x417
            match x418 {
              Empty if changed => loop__1(false, acc_6, cs)
              Empty => acc_6
              More(c_36, tail=cs_p) =>
                try {
                  let acc_p = bind_ctximpconv(c_36)(v_31)(acc_6)
                  loop__1(true, acc_p, cs_p)
                } catch {
                  @lib.Unchanged => loop__1(changed, acc_6, cs_p)
                  e => raise e
                }
            }
          }
          loop__1(false, imp_refl(t_45), cs)
        }
      },
      fn(
        x420 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        repeat_unchanged_ctximpconv(
          ((x419 : @list.List[@kernel.Term]) => map_all_l(augment_l, cs, x419))(
            x420,
          ),
        )
      },
      fn(
        x422 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        repeat_unchanged_ctximpconv(
          ((x421 : @kernel.Term) => map_all_l(diminish_l, cs, x421))(x422),
        )
      },
    )
  }
  fn self__8(
    x427 : ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_38 = x427
    let t432 = diminish_l(c_38)
    let t430 = augment_l(c_38)
    ImpconvWithContext::With_context(
      fn(x428 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_33 = x428
        fn(x429 : @kernel.Term) -> @kernel.Thm raise {
          let t_46 = x429
          try {
            let th1_19 = apply_l(sub_ctximpconv(self__8(c_38)))(v_33)(t_46)
            bind_l(c_38, ImpconvAtomic::Non_atomic, v_33, th1_19) catch {
              Failure(_) => th1_19
              e => raise e
            }
          } catch {
            Failure("SUB_CTXIMPCONV") => {
              let th1_20 = apply_l(c_38)(ImpconvAtomic::Atomic)(v_33)(t_46)
              bind_ctximpconv(self__8(c_38))(v_33)(th1_20) catch {
                Failure(_) => th1_20
                e => raise e
              }
            }
            Failure(_) => apply_l(c_38)(ImpconvAtomic::Non_atomic)(v_33)(t_46)
            e => raise e
          }
        }
      },
      fn(
        x431 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__8(t430(x431))
      },
      fn(
        x433 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__8(t432(x433))
      },
    )
  }
  let depth_ctximpconv : (
    ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = fn(
    x434 : ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    unchanged_of_fail_ctximpconv(self__8(x434))
  }
  fn self__9(
    x435 : ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_39 = x435
    let t440 = diminish_l(c_39)
    let t438 = augment_l(c_39)
    ImpconvWithContext::With_context(
      fn(x436 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_34 = x436
        fn(x437 : @kernel.Term) -> @kernel.Thm raise {
          let t_47 = x437
          try {
            let th_34 = apply_l(c_39)(v_34)(t_47)
            bind_ctximpconv(self__9(c_39))(v_34)(th_34) catch {
              Failure(_) => th_34
              e => raise e
            }
          } catch {
            Failure(_) => apply_l(sub_ctximpconv(self__9(c_39)))(v_34)(t_47)
            e => raise e
          }
        }
      },
      fn(
        x439 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__9(t438(x439))
      },
      fn(
        x441 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__9(t440(x441))
      },
    )
  }
  let top_depth_ctximpconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = fn(
    x442 : ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    unchanged_of_fail_ctximpconv(self__9(x442))
  }
  fn self__10(
    x443 : ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[ImpconvImpConv] raise {
    let _ as c_40 = x443
    let t448 = diminish_l(c_40)
    let t446 = augment_l(c_40)
    ImpconvWithContext::With_context(
      fn(x444 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_35 = x444
        fn(x445 : @kernel.Term) -> @kernel.Thm raise {
          let t_48 = x445
          apply_l(sub_ctximpconv(self__10(c_40)))(v_35)(t_48) catch {
            Failure("SUB_CTXIMPCONV") =>
              apply_l(c_40)(ImpconvAtomic::Atomic)(v_35)(t_48)
            Failure(_) => apply_l(c_40)(ImpconvAtomic::Non_atomic)(v_35)(t_48)
            e => raise e
          }
        }
      },
      fn(
        x447 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__10(t446(x447))
      },
      fn(
        x449 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__10(t448(x449))
      },
    )
  }
  let once_depth_ctximpconv : (
    ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = fn(
    x450 : ImpconvWithContext[
      (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    unchanged_of_fail_ctximpconv(self__10(x450))
  }
  let ctximpconv_rule : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x451 : ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let _ as c_41 = x451
    fn(x452 : @kernel.Thm) -> @kernel.Thm raise {
      let th_35 = x452
      let t453 = @kernel.concl(th_35)
      @drule.match_mp(apply_l(c_41)(VarianceT::Contra)(t453))(th_35)
    }
  }
  let ctximpconv_tac : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
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
  ) raise) raise = fn(
    x454 : ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ],
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
    let _ as cnv_1 = x454
    fn(
      x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      let (asms, c_42) as g_1 = x455
      let t459 = @lib.map(
        fn(x458 : (String, @kernel.Thm)) -> @kernel.Term raise {
          (fn(x456 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x456) })(
            (fn(x457 : (String, @kernel.Thm)) -> @kernel.Thm raise { x457.1 })(
              x458,
            ),
          )
        },
        asms,
      )
      let cnv_p = augment_l(cnv_1)(t459)
      let t460 = @tactics.try_tac(@tactics.accept_tac(@bool.truth()))
      @tactics.then_tac(
        @tactics.match_mp_tac(apply_l(cnv_p)(VarianceT::Co)(c_42)),
        t460,
      )(g_1)
    }
  }
  let indep_vars : (@kernel.Thm) -> @list.List[@kernel.Term] raise = fn(
    x461 : @kernel.Thm,
  ) -> @list.List[@kernel.Term] raise {
    let th_36 = x461
    let (hs_3, c_43) = @kernel.dest_thm(@bool.spec_all(th_36))
    let (p_9, c_44) = @basics.dest_imp(c_43)
    let t462 = @kernel.frees(@equal.rhs(c_44))
    let all_vars = @lib.union(@kernel.frees(p_9), t462)
    let t463 = @kernel.freesl(hs_3)
    let dep_vars = @lib.union(@kernel.frees(@equal.lhs(c_44)), t463)
    @lib.subtract(all_vars, dep_vars)
  }
  let gen_imprewr_conv : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((
    @kernel.Term,
  ) -> @kernel.Thm raise) raise) raise = fn(
    x464 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let avs = x464
    let sel_1 : (@kernel.Term) -> @kernel.Term raise = fn(
      x472 : @kernel.Term,
    ) -> @kernel.Term raise {
      (fn(x471 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        (fn(x469 : @kernel.Term) -> @kernel.Term raise {
          (fn(
            x467 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            @equal.lhs(
              (fn(
                x466 : (@list.List[@kernel.Term], @kernel.Term),
              ) -> @kernel.Term raise {
                x466.1
              })(x467),
            )
          })(
            (fn(
              x468 : @kernel.Term,
            ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
              @basics.strip_forall(x468)
            })(x469),
          )
        })(
          (fn(x470 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x470.1
          })(x471),
        )
      })(@basics.dest_imp(x472))
    }
    let pmatch : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = gen_part_match_all(
      sel_1,
    )
    fn(x473 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_37 = x473
      let pmatch_p : (@kernel.Term) -> @kernel.Thm raise = pmatch(th_37)
      fn(x475 : @kernel.Term) -> @kernel.Thm raise {
        let t_49 = x475
        let th_p_2 = pmatch_p(t_49)
        let t476 = @bool.genl(indep_vars(th_p_2), th_p_2)
        variant_rule(avs)(t476)
      }
    }
  }
  let imprewr_conv : (@list.List[@kernel.Term]) -> ((@kernel.Thm) -> ((
    @kernel.Term,
  ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise) raise) raise = fn(
    x477 : @list.List[@kernel.Term],
  ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
    @kernel.Thm,
    @kernel.Term?,
    @list.List[@kernel.Term],
  ) raise) raise) raise {
    let avs_1 = x477
    fn(
      x478 : @kernel.Thm,
    ) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise {
      let th_38 = x478
      let f_13 : (@kernel.Term) -> (@list.List[@kernel.Term], @kernel.Thm) raise = fn(
        x480 : @kernel.Term,
      ) -> (@list.List[@kernel.Term], @kernel.Thm) raise {
        let t_50 = x480
        spec_vars(gen_imprewr_conv(avs_1)(th_38)(t_50))
      }
      fn(
        x481 : @kernel.Term,
      ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
        let t_51 = x481
        let (vs_4, uh) = f_13(t_51)
        let u_5 = @basics.dest_imp(@kernel.concl(uh)).0
        let t482 = of_list(vs_4)
        let t483 = Some(u_5)
        (@bool.undisch(uh), t483, t482)
      }
    }
  }
  let pat_cnv_of_thm : (@kernel.Thm) -> (
    @kernel.Term,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ) raise = fn(
    x490 : @kernel.Thm,
  ) -> (
    @kernel.Term,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ) raise {
    let th_41 = x490
    let th_42 = @bool.spec_all(th_41)
    let lconsts = @kernel.freesl(@kernel.hyp(th_42))
    let c_45 = @kernel.concl(th_42)
    match c_45 {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("=", _), l_5),
        r_4
      ) as t_54 => {
        let matches : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(
          x498 : @kernel.Term,
        ) -> ((@kernel.Term) -> Bool raise) raise {
          fn(x499 : @kernel.Term) -> Bool raise {
            (fn(x497 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
              (fn(
                x491 : (@kernel.Term) -> (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise,
              ) -> ((@kernel.Term) -> Bool raise) raise {
                fn(x492 : @kernel.Term) -> Bool raise { @lib.can(x491, x492) }
              })(
                (fn(
                  x495 : @kernel.Term,
                ) -> ((@kernel.Term) -> (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise) raise {
                  fn(
                    x496 : @kernel.Term,
                  ) -> (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ) raise {
                    ((x493 : @kernel.Term, x494 : @kernel.Term) => {
                      @drule.term_match(lconsts, x493, x494)
                    })(x495, x496)
                  }
                })(x497),
              )
            })(x499)(x498)
          }
        }
        if @basics.free_in(l_5, r_4) || (matches(l_5)(r_4) && matches(r_4)(l_5)) {
          let t503 = map_forall_body(@bool.eqt_intro)(th_42)
          (
            t_54,
            fn(
              x504 : @list.List[@kernel.Term],
            ) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise {
              (fn(
                x500 : @list.List[@kernel.Term],
              ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise) raise {
                fn(
                  x501 : @kernel.Thm,
                ) -> ((@kernel.Term) -> (
                  @kernel.Thm,
                  @kernel.Term?,
                  @list.List[@kernel.Term],
                ) raise) raise {
                  fn(
                    x502 : @kernel.Term,
                  ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                    ((x484, x485, x486) => {
                      rewr_annotconv_l(
                        dest_binary_blind, frees_1, union, freesl, subtract, x484,
                        x485, x486,
                      )
                    })(x500, x501, x502)
                  }
                }
              })(x504)(t503)
            },
          )
        } else {
          (
            l_5,
            fn(
              x508 : @list.List[@kernel.Term],
            ) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise {
              (fn(
                x505 : @list.List[@kernel.Term],
              ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise) raise {
                fn(
                  x506 : @kernel.Thm,
                ) -> ((@kernel.Term) -> (
                  @kernel.Thm,
                  @kernel.Term?,
                  @list.List[@kernel.Term],
                ) raise) raise {
                  fn(
                    x507 : @kernel.Term,
                  ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                    ((x484, x485, x486) => {
                      rewr_annotconv_l(
                        dest_binary_blind, frees_1, union, freesl, subtract, x484,
                        x485, x486,
                      )
                    })(x505, x506, x507)
                  }
                }
              })(x508)(th_42)
            },
          )
        }
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("==>", _), p_10),
        c_46
      ) as t_55 => {
        let t511 = fo_term_match(lconsts)
        let matches_1 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(
          x513 : @kernel.Term,
        ) -> ((@kernel.Term) -> Bool raise) raise {
          fn(x514 : @kernel.Term) -> Bool raise {
            (fn(x512 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
              (fn(
                x509 : (@kernel.Term) -> (
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise,
              ) -> ((@kernel.Term) -> Bool raise) raise {
                fn(x510 : @kernel.Term) -> Bool raise { @lib.can(x509, x510) }
              })(t511(x512))
            })(x514)(x513)
          }
        }
        let imprewr_concl : ((@kernel.Thm) -> @kernel.Thm raise) -> ((
          @list.List[@kernel.Term],
        ) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise) raise = fn(
          x515 : (@kernel.Thm) -> @kernel.Thm raise,
        ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise) raise {
          let f_14 = x515
          let t517 = gen_map_conclusion(f_14)(th_42)
          fn(
            x518 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            imprewr_conv(x518)(t517)
          }
        }
        match c_46 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("=", _), l_6),
            r_5
          ) =>
            if @basics.free_in(l_6, r_5) ||
              (matches_1(l_6)(r_5) && matches_1(r_5)(l_6)) ||
              @kernel.is_var(l_6) {
              if matches_1(p_10)(c_46) {
                let t522 = @bool.eqt_intro(th_42)
                (
                  t_55,
                  fn(
                    x523 : @list.List[@kernel.Term],
                  ) -> ((@kernel.Term) -> (
                    @kernel.Thm,
                    @kernel.Term?,
                    @list.List[@kernel.Term],
                  ) raise) raise {
                    (fn(
                      x519 : @list.List[@kernel.Term],
                    ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
                      @kernel.Thm,
                      @kernel.Term?,
                      @list.List[@kernel.Term],
                    ) raise) raise) raise {
                      fn(
                        x520 : @kernel.Thm,
                      ) -> ((@kernel.Term) -> (
                        @kernel.Thm,
                        @kernel.Term?,
                        @list.List[@kernel.Term],
                      ) raise) raise {
                        fn(
                          x521 : @kernel.Term,
                        ) -> (
                          @kernel.Thm,
                          @kernel.Term?,
                          @list.List[@kernel.Term],
                        ) raise {
                          ((x484, x485, x486) => {
                            rewr_annotconv_l(
                              dest_binary_blind, frees_1, union, freesl, subtract,
                              x484, x485, x486,
                            )
                          })(x519, x520, x521)
                        }
                      }
                    })(x523)(t522)
                  },
                )
              } else {
                (c_46, imprewr_concl(@bool.eqt_intro))
              }
            } else {
              (
                l_6,
                fn(
                  x524 : @list.List[@kernel.Term],
                ) -> ((@kernel.Term) -> (
                  @kernel.Thm,
                  @kernel.Term?,
                  @list.List[@kernel.Term],
                ) raise) raise {
                  imprewr_conv(x524)(th_42)
                },
              )
            }
          @kernel.Term::Comb(@kernel.Term::Const("~", _), l_7) =>
            (l_7, imprewr_concl(@bool.eqf_intro))
          l_8 => (l_8, imprewr_concl(@bool.eqt_intro))
        }
      }
      @kernel.Term::Comb(@kernel.Term::Const("~", _), l_9) => {
        let t528 = @bool.eqf_intro(th_42)
        (
          l_9,
          fn(
            x529 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            (fn(
              x525 : @list.List[@kernel.Term],
            ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise) raise {
              fn(
                x526 : @kernel.Thm,
              ) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise {
                fn(
                  x527 : @kernel.Term,
                ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                  ((x484, x485, x486) => {
                    rewr_annotconv_l(
                      dest_binary_blind, frees_1, union, freesl, subtract, x484,
                      x485, x486,
                    )
                  })(x525, x526, x527)
                }
              }
            })(x529)(t528)
          },
        )
      }
      @kernel.Term::Const("T", bool_ty) => raise Failure("pat_cnv_of_thm")
      l_10 => {
        let t533 = @bool.eqt_intro(th_42)
        (
          l_10,
          fn(
            x534 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            (fn(
              x530 : @list.List[@kernel.Term],
            ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise) raise {
              fn(
                x531 : @kernel.Thm,
              ) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise {
                fn(
                  x532 : @kernel.Term,
                ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                  ((x484, x485, x486) => {
                    rewr_annotconv_l(
                      dest_binary_blind, frees_1, union, freesl, subtract, x484,
                      x485, x486,
                    )
                  })(x530, x531, x532)
                }
              }
            })(x534)(t533)
          },
        )
      }
    }
  }
  let impconv_net_of_thm : (@kernel.Thm) -> ((
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> FoNetsT[
    (
      (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
        @kernel.Thm,
        @kernel.Term?,
        @list.List[@kernel.Term],
      ) raise) raise,
      @list.List[@kernel.Term],
      @kernel.Thm,
    ),
  ] raise) raise = fn(
    x535 : @kernel.Thm,
  ) -> ((
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> FoNetsT[
    (
      (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
        @kernel.Thm,
        @kernel.Term?,
        @list.List[@kernel.Term],
      ) raise) raise,
      @list.List[@kernel.Term],
      @kernel.Thm,
    ),
  ] raise) raise {
    let th_43 = x535
    try {
      let (p_11, c_47) = pat_cnv_of_thm(th_43)
      let vs_5 = freesl(@kernel.hyp(th_43))
      enter(vs_5)((p_11, (c_47, vs_5, th_43)))
    } catch {
      Failure(_) => i_l
      e => raise e
    }
  }
  let patterns_of_thm : (@kernel.Thm) -> @kernel.Term raise = fn(
    x538 : @kernel.Thm,
  ) -> @kernel.Term raise {
    (fn(
      x537 : (
        @kernel.Term,
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ),
    ) -> @kernel.Term raise {
      x537.0
    })(pat_cnv_of_thm(x538))
  }
  let rewrites_impconv : (
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    @kernel.Term?,
    @list.List[@kernel.Term],
  ) raise) raise) raise = fn(
    x539 : FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    @kernel.Term?,
    @list.List[@kernel.Term],
  ) raise) raise) raise {
    let _ as net_2 = x539
    fn(
      x540 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise {
      let avs_3 = x540
      fn(
        x541 : @kernel.Term,
      ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
        let t_56 = x541
        @lib.tryfind(
          fn(
            x542 : (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
            let (c_48, _, _) = x542
            c_48(avs_3)(t_56)
          },
          lookup(t_56)(net_2),
        )
      }
    }
  }
  let extra_basic_rewrites = @lib.itlist(
    (x543 : @kernel.Thm, x544 : @list.List[@kernel.Thm]) => {
      @simp.mk_rewrites(false, x543, x544)
    },
    @list.List([@class.not_forall_thm(), @class.not_imp()]),
    @list.List([]),
  )
  let bigger_net : (Unit) -> @nets.Net[
    @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
  ] raise = fn(
    x595 : Unit,
  ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let _ = x595
    @lib.itlist(
      (
        x596 : @kernel.Thm,
        x597 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
      ) => @simp.net_of_thm(false, x596, x597),
      extra_basic_rewrites,
      @simp.basic_net(),
    )
  }
  fn self__11(
    x599 : FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
    x600 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ] raise {
    let net_3 = x599
    let ths = x600
    let avs_10 = (x123 => flat_revmap_l(union, x123))(fn(
      x602 : @kernel.Thm,
    ) -> @list.List[@kernel.Term] raise {
      freesl(
        (fn(x601 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
          @kernel.hyp(x601)
        })(x602),
      )
    })(ths)
    let cnv_3 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise = fn(
      x603 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise {
      let avs_11 = x603
      fn(
        x604 : @kernel.Term,
      ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
        let t_64 = x604
        rewrites_impconv(net_3)(avs_11)(t_64) catch {
          Failure(_) => (x598 => basic_cnv_l(bigger_net, x598))(t_64)
          e => raise e
        }
      }
    }
    ImpconvWithContext::With_context(
      fn(
        x605 : ImpconvAtomic,
      ) -> ((@kernel.Term) -> (
        @kernel.Thm,
        @kernel.Term?,
        @list.List[@kernel.Term],
      ) raise) raise {
        let a_22 = x605
        fn(
          x606 : @kernel.Term,
        ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
          let t_65 = x606
          let f_15 : (
            (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
              @kernel.Thm,
              _?,
              @list.List[@kernel.Term],
            ) raise) raise,
          ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
            @kernel.Thm,
            _?,
            @list.List[@kernel.Term],
          ) raise) raise) raise = match a_22 {
            ImpconvAtomic::Atomic =>
              x607 => {
                (x608 : @list.List[@kernel.Term]) => {
                  (x609 : @kernel.Term) => {
                    ((x545, x546, x547) => {
                      top_depth_l(union, insert_1, x545, x546, x547)
                    })(x607, x608, x609)
                  }
                }
              }
            ImpconvAtomic::Non_atomic => i_l
          }
          let t610 = union(frees_1(t_65), avs_10)
          f_15(cnv_3)(t610)(t_65)
        }
      },
      fn(
        x611 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ] raise {
        let ts_6 = x611
        let ths_p = @lib.map(@kernel.assume_rule, ts_6)
        let t612 = ths_p.concat(mp_closure(ths)(ths_p))
        let ths_p_p = mp_closure(ths_p)(ths_p).concat(t612)
        self__11(
          @lib.itlist(
            fn(
              x613 : @kernel.Thm,
              x614 : FoNetsT[
                (
                  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                    @kernel.Thm,
                    @kernel.Term?,
                    @list.List[@kernel.Term],
                  ) raise) raise,
                  @list.List[@kernel.Term],
                  @kernel.Thm,
                ),
              ],
            ) -> FoNetsT[
              (
                (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                  @kernel.Thm,
                  @kernel.Term?,
                  @list.List[@kernel.Term],
                ) raise) raise,
                @list.List[@kernel.Term],
                @kernel.Thm,
              ),
            ] raise {
              let s615 = impconv_net_of_thm(x613)
              s615(x614)
            },
            ths_p_p,
            net_3,
          ),
          ths_p_p.concat(ths),
        )
      },
      fn(
        x616 : @kernel.Term,
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ] raise {
        let v_37 = x616
        let ths_1 = Ref::{ val: @list.List([]), }
        let net_p = filter_l(
          fn(
            x620 : (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ) -> Bool raise {
            ((x617, x618, x619) => f_16_l(mem, v_37, ths_1, x617, x618, x619))(
              x620.0,
              x620.1,
              x620.2,
            )
          },
          net_3,
        )
        self__11(net_p, ths_1.val)
      },
    )
  }
  let imprewr_ctxconv : (@list.List[@kernel.Thm]) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ] raise = fn(
    x621 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ] raise {
    let ths_2 = x621
    self__11(
      @lib.itlist(
        fn(
          x622 : @kernel.Thm,
          x623 : FoNetsT[
            (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ],
        ) -> FoNetsT[
          (
            (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise,
            @list.List[@kernel.Term],
            @kernel.Thm,
          ),
        ] raise {
          let s624 = impconv_net_of_thm(x622)
          s624(x623)
        },
        ths_2,
        empty_net,
      ),
      ths_2,
    )
  }
  let imp_sym : (@kernel.Thm) -> @kernel.Thm raise = rewr_rule(
    @class.taut(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) == (B → A → C)")),
  )
  let imp_exist = @equal.gsym(@theorems.left_imp_exists_thm())
  let try_gen : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x625 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let v_38 = x625
    fn(x626 : @kernel.Thm) -> @kernel.Thm raise {
      let th_47 = x626
      @bool.gen(v_38, th_47) catch {
        Failure(_) => th_47
        e => raise e
      }
    }
  }
  fn rewr_impconv_of_conv(
    x627 : ImpconvWithContext[(ImpconvAtomic) -> ImpconvAnnotConv raise],
  ) -> ImpconvWithContext[(ImpconvAtomic) -> ImpconvImpConv raise] raise {
    let _ as c_53 = x627
    let t639 = diminish_l(c_53)
    let t637 = augment_l(c_53)
    ImpconvWithContext::With_context(
      fn(
        x628 : ImpconvAtomic,
      ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
        let a_23 = x628
        fn(x629 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let v_39 = x629
          fn(x630 : @kernel.Term) -> @kernel.Thm raise {
            let t_66 = x630
            let (th_48, ho_2, new_vars_1) = apply_l(c_53)(a_23)(t_66)
            let (th1_23, th2_18) = @bool.eq_imp_rule(th_48)
            let res_3 = match v_39 {
              VarianceT::Co => {
                let (p_12, th2_p_1) = undisch_term(th2_18)
                fn exists_intro(
                  x631 : @list.List[@kernel.Term],
                ) -> @kernel.Thm raise {
                  match x631 {
                    Empty =>
                      disch_imp_imp(list_of_option_l(ho_2).prepend(p_12))(
                        th2_p_1,
                      )
                    More(v_40, tail=vs_9) => {
                      let th_49 = exists_intro(vs_9)
                      try {
                        let t632 = @bool.gen(v_40, th_49)
                        rewr_rule(imp_exist)(t632)
                      } catch {
                        Failure(_) => th_49
                        e => raise e
                      }
                    }
                  }
                }
                exists_intro(new_vars_1)
              }
              VarianceT::Contra => {
                let th1_p_1 = match ho_2 {
                  None => th1_23
                  Some(h_3) => imp_sym(@bool.disch(h_3, th1_23))
                }
                match new_vars_1 {
                  Empty => th1_p_1
                  More(_, tail=_) =>
                    map_conclusion((x636 : @kernel.Thm) => {
                      @lib.itlist(
                        fn(
                          x633 : @kernel.Term,
                          x634 : @kernel.Thm,
                        ) -> @kernel.Thm raise {
                          let s635 = try_gen(x633)
                          s635(x634)
                        },
                        new_vars_1,
                        x636,
                      )
                    })(th1_p_1)
                }
              }
            }
            let (t1_14, t2_16) = @basics.dest_imp(@kernel.concl(res_3))
            if t1_14 == t2_16 {
              raise @lib.Unchanged
            } else {
              res_3
            }
          }
        }
      },
      fn(
        x638 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
      ] raise {
        rewr_impconv_of_conv(t637(x638))
      },
      fn(
        x640 : @kernel.Term,
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
      ] raise {
        rewr_impconv_of_conv(t639(x640))
      },
    )
  }
  let rewrite_ctximpconv : (@list.List[@kernel.Thm]) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = fn(
    x642 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    (fn(
      x641 : ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ],
    ) -> ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ] raise {
      depth_ctximpconv(rewr_impconv_of_conv(x641))
    })(imprewr_ctxconv(x642))
  }
  let preprocess : (@kernel.Thm) -> @list.List[@kernel.Thm] raise = fn(
    x643 : @kernel.Thm,
  ) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(imply_and(x643))
  }
  let imp_rewrite_tac : (@list.List[@kernel.Thm]) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise = fn(
    x644 : @list.List[@kernel.Thm],
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
    let ths_3 = x644
    let t646 = ctximpconv_tac(
      rewrite_ctximpconv(@lib.flat(@lib.map(preprocess, ths_3))),
    )
    (x647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
      fail_if_unchanged_l(t646, x647)
    }
  }
  let seq_imp_rewrite_tac : (@list.List[@kernel.Thm]) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise = fn(
    x648 : @list.List[@kernel.Thm],
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
    let ths_4 = x648
    let cnv_4 = match ths_4 {
      Empty => rewrite_ctximpconv(@list.List([@bool.truth()]))
      More(th_50, tail=Empty) => rewrite_ctximpconv(preprocess(th_50))
      More(_, tail=_) => {
        let fcnv : (@kernel.Thm) -> ImpconvWithContext[
          (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
        ] raise = fn(
          x650 : @kernel.Thm,
        ) -> ImpconvWithContext[
          (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
        ] raise {
          rewrite_ctximpconv(preprocess(x650))
        }
        repeat_unchanged_ctximpconv(@lib.map(fcnv, ths_4))
      }
    }
    let t651 = ctximpconv_tac(cnv_4)
    (x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
      fail_if_unchanged_l(t651, x652)
    }
  }
  let asm_imp_rewrite_tac : (@list.List[@kernel.Thm]) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise = @tactics.asm_tac(imp_rewrite_tac)
  let mp_taut : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x653 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th_51 = x653
    @drule.match_mp(@class.taut(th_51))
  }
  let mp_lem1 : (@kernel.Thm) -> @kernel.Thm raise = mp_taut(
    @term_syntax.parse_term("(!(P : Bool) → (Q : Bool) == (R : Bool)) → Q == ((!P → R) && (P → Q))"),
  )
  let mp_lem2 : (@kernel.Thm) -> @kernel.Thm raise = mp_taut(
    @term_syntax.parse_term("((P : Bool) → (Q : Bool) == (R : Bool)) → Q == ((P → R) && (!P → Q))"),
  )
  fn case_rewr_impconv_of_conv(
    x655 : ImpconvWithContext[(ImpconvAtomic) -> ImpconvAnnotConv raise],
  ) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
  ] raise {
    let _ as c_54 = x655
    let t661 = diminish_l(c_54)
    let t659 = augment_l(c_54)
    ImpconvWithContext::With_context(
      fn(
        x656 : ImpconvAtomic,
      ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
        let a_24 = x656
        fn(x657 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let v_41 = x657
          fn(x658 : @kernel.Term) -> @kernel.Thm raise {
            let t_67 = x658
            match apply_l(c_54)(a_24)(t_67) {
              (_, None, _) => raise Failure("CASE_REWR_IMPCONV_OF_CONV")
              (th_52, Some(h_4), _) => {
                let th_p_4 = @bool.disch(h_4, th_52)
                let th_p_p_2 = mp_lem1(th_p_4) catch {
                  Failure(_) => mp_lem2(th_p_4)
                  e => raise e
                }
                imp_conv_of_conv(@simp.rewr_conv(th_p_p_2))(v_41)(t_67)
              }
            }
          }
        }
      },
      fn(
        x660 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
      ] raise {
        case_rewr_impconv_of_conv(t659(x660))
      },
      fn(
        x662 : @kernel.Term,
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
      ] raise {
        case_rewr_impconv_of_conv(t661(x662))
      },
    )
  }
  let case_rewrite_ctximpconv : (@list.List[@kernel.Thm]) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise = fn(
    x664 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    (fn(
      x663 : ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ],
    ) -> ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
    ] raise {
      once_depth_ctximpconv(case_rewr_impconv_of_conv(x663))
    })(imprewr_ctxconv(x664))
  }
  let case_rewrite_tac : (@kernel.Thm) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise = (x667 : @kernel.Thm) => {
    fail_if_unchanged_l(
      fn(
        x666 : @kernel.Thm,
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
          x665 : @list.List[@kernel.Thm],
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
          ctximpconv_tac(case_rewrite_ctximpconv(x665))
        })(preprocess(x666))
      },
      x667,
    )
  }
  fn conj_ctximpmconv(
    x674 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_56 = x674
    let t679 = diminish_l(c_56)
    let t677 = augment_l(c_56)
    ImpconvWithContext::With_context(
      fn(
        x675 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_43 = x675
        fn(x676 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_69 = x676
          let (t1_15, t2_17) = @basics.dest_conj(t_69)
          let (left, right) = match v_43 {
            VarianceT::Co => (mkimpl_conj_co2_ctxt, mkimpr_conj_co_ctxt)
            VarianceT::Contra =>
              (mkimpl_conj_contra_ctxt, mkimpr_conj_contra_ctxt)
          }
          let th1s = @lib.map(
            left,
            ((x668, x669, x670, x671) => {
              mapply_with_context_l(
                disch_conj, strip_conj_1, x668, x669, x670, x671,
              )
            })(c_56, t2_17, v_43, t1_15),
          )
          let th2s = @lib.map(
            right,
            ((x668, x669, x670, x671) => {
              mapply_with_context_l(
                disch_conj, strip_conj_1, x668, x669, x670, x671,
              )
            })(c_56, t1_15, v_43, t2_17),
          )
          th1s.concat(th2s)
        }
      },
      fn(
        x678 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        conj_ctximpmconv(t677(x678))
      },
      fn(
        x680 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        conj_ctximpmconv(t679(x680))
      },
    )
  }
  fn disj_ctximpmconv(
    x681 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_57 = x681
    let t688 = diminish_l(c_57)
    let t686 = augment_l(c_57)
    ImpconvWithContext::With_context(
      fn(
        x682 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_44 = x682
        fn(x683 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_70 = x683
          let (t1_16, t2_18) = @basics.dest_disj(t_70)
          let th1s_1 = @lib.map(
            fn(x684 : @kernel.Thm) -> @kernel.Thm raise {
              mkimpl_disj(x684)(t2_18)
            },
            apply_l(c_57)(v_44)(t1_16),
          )
          let t685 = apply_l(c_57)(v_44)(t2_18)
          let th2s_1 = @lib.map(mkimpr_disj(t1_16), t685)
          th1s_1.concat(th2s_1)
        }
      },
      fn(
        x687 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        disj_ctximpmconv(t686(x687))
      },
      fn(
        x689 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        disj_ctximpmconv(t688(x689))
      },
    )
  }
  fn imp_ctximpmconv(
    x690 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_58 = x690
    let t697 = diminish_l(c_58)
    let t695 = augment_l(c_58)
    ImpconvWithContext::With_context(
      fn(
        x691 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_45 = x691
        fn(x692 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_71 = x692
          let (t1_17, t2_19) = @basics.dest_imp(t_71)
          let t694 = neg(v_45)
          let th1s_2 = @lib.map(
            fn(x693 : @kernel.Thm) -> @kernel.Thm raise {
              mkimpl_imp(x693)(t2_19)
            },
            apply_l(c_58)(t694)(t1_17),
          )
          let th2s_2 = @lib.map(
            mkimpr_imp_ctxt,
            ((x668, x669, x670, x671) => {
              mapply_with_context_l(
                disch_conj, strip_conj_1, x668, x669, x670, x671,
              )
            })(c_58, t1_17, v_45, t2_19),
          )
          th1s_2.concat(th2s_2)
        }
      },
      fn(
        x696 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        conj_ctximpmconv(t695(x696))
      },
      fn(
        x698 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        conj_ctximpmconv(t697(x698))
      },
    )
  }
  fn iff_ctximpconv_1(
    x699 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_59 = x699
    let t706 = diminish_l(c_59)
    let t704 = augment_l(c_59)
    ImpconvWithContext::With_context(
      fn(
        x700 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_46 = x700
        fn(x701 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_72 = x701
          let (t1_18, t2_20) = @bool.dest_iff(t_72)
          let (left_1, right_1) = match v_46 {
            VarianceT::Co => (mkimpl_co_iff, mkimpr_co_iff)
            VarianceT::Contra => (mkimpl_contra_iff, mkimpr_contra_iff)
          }
          let t702 = @bool.mk_imp(t1_18, t2_20)
          let th1s_3 = @lib.map(left_1, apply_l(c_59)(v_46)(t702))
          let t703 = @bool.mk_imp(t2_20, t1_18)
          let th2s_3 = @lib.map(right_1, apply_l(c_59)(v_46)(t703))
          th1s_3.concat(th2s_3)
        }
      },
      fn(
        x705 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        iff_ctximpconv_1(t704(x705))
      },
      fn(
        x707 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        iff_ctximpconv_1(t706(x707))
      },
    )
  }
  fn not_ctximpmconv(
    x708 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_60 = x708
    let t715 = diminish_l(c_60)
    let t713 = augment_l(c_60)
    ImpconvWithContext::With_context(
      fn(
        x709 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_47 = x709
        fn(x710 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_73 = x710
          let t712 = @basics.dest_neg(t_73)
          let t711 = neg(v_47)
          @lib.map(mkimp_not, try_list_l(apply_l(c_60)(t711), t712))
        }
      },
      fn(
        x714 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        not_ctximpmconv(t713(x714))
      },
      fn(
        x716 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        not_ctximpmconv(t715(x716))
      },
    )
  }
  fn quant_ctximpmconv(
    x717 : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
    x718 : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
    x719 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let mkimp_1 = x717
    let sel_2 = x718
    let _ as c_61 = x719
    let t727 = diminish_l(c_61)
    let t724 = augment_l(c_61)
    ImpconvWithContext::With_context(
      fn(
        x720 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_48 = x720
        fn(x721 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_74 = x721
          let (x_26, b_26) = sel_2(t_74)
          let c_p_3 = diminish_l(c_61)(x_26)
          let t722 = try_list_l(apply_l(c_p_3)(v_48), b_26)
          @lib.map(mkimp_1(x_26), t722)
        }
      },
      fn(
        x725 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        ((x723 : ImpconvWithContext[ImpconvImpMconv]) => {
          quant_ctximpmconv(mkimp_1, sel_2, x723)
        })(t724(x725))
      },
      fn(
        x728 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        ((x726 : ImpconvWithContext[ImpconvImpMconv]) => {
          quant_ctximpmconv(mkimp_1, sel_2, x726)
        })(t727(x728))
      },
    )
  }
  let forall_ctximpmconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
  ] raise = (x729 : ImpconvWithContext[ImpconvImpMconv]) => {
    quant_ctximpmconv(mkimp_forall, @basics.dest_forall, x729)
  }
  let exists_ctximpmconv : (
    ImpconvWithContext[
      (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
    ],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
  ] raise = (x730 : ImpconvWithContext[ImpconvImpMconv]) => {
    quant_ctximpmconv(mkimp_exists, @basics.dest_exists, x730)
  }
  let iff_ty_1 = @parser.parse_type("bool->bool->bool")
  fn sub_ctximpmconv(
    x731 : ImpconvWithContext[ImpconvImpMconv],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let c_62 = x731
    let t736 = diminish_l(c_62)
    let t734 = augment_l(c_62)
    ImpconvWithContext::With_context(
      fn(
        x732 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_49 = x732
        fn(x733 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_75 = x733
          let (n_8, ty_10) = @kernel.dest_const(@basics.strip_comb(t_75).0)
          apply_l(
            (match n_8 {
              "==>" => imp_ctximpmconv
              "/\\" => conj_ctximpmconv
              "\\/" => disj_ctximpmconv
              "forall" => forall_ctximpmconv
              "?" => exists_ctximpmconv
              "~" => not_ctximpmconv
              "=" if ty_10 == iff_ty_1 => iff_ctximpconv_1
              _ => raise Failure("SUB_CTXIMPMCONV")
            })(c_62),
          )(v_49)(t_75)
        }
      },
      fn(
        x735 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        sub_ctximpmconv(t734(x735))
      },
      fn(
        x737 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        sub_ctximpmconv(t736(x737))
      },
    )
  }
  fn depth_ctximpmconv(
    x738 : ImpconvWithContext[(ImpconvAtomic) -> ImpconvImpMconv raise],
  ) -> ImpconvWithContext[ImpconvImpMconv] raise {
    let _ as c_63 = x738
    let t743 = diminish_l(c_63)
    let t741 = augment_l(c_63)
    ImpconvWithContext::With_context(
      fn(
        x739 : VarianceT,
      ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
        let v_50 = x739
        fn(x740 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
          let t_76 = x740
          try {
            let ths_5 = apply_l(sub_ctximpmconv(depth_ctximpmconv(c_63)))(v_50)(
              t_76,
            )
            apply_l(c_63)(ImpconvAtomic::Non_atomic)(v_50)(t_76).concat(ths_5)
          } catch {
            Failure("SUB_CTXIMPMCONV") =>
              apply_l(c_63)(ImpconvAtomic::Atomic)(v_50)(t_76)
            e => raise e
          }
        }
      },
      fn(
        x742 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        depth_ctximpmconv(t741(x742))
      },
      fn(
        x744 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
      ] raise {
        depth_ctximpmconv(t743(x744))
      },
    )
  }
  let target_pat_cnv_of_thm : (@kernel.Thm) -> (
    @kernel.Term,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ) raise = fn(
    x745 : @kernel.Thm,
  ) -> (
    @kernel.Term,
    (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      @kernel.Term?,
      @list.List[@kernel.Term],
    ) raise) raise,
  ) raise {
    let th_53 = x745
    let th_54 = @bool.spec_all(th_53)
    match @kernel.concl(th_54) {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("=", _), l_13),
        _
      ) =>
        (
          l_13,
          fn(
            x749 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            (fn(
              x746 : @list.List[@kernel.Term],
            ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise) raise {
              fn(
                x747 : @kernel.Thm,
              ) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise {
                fn(
                  x748 : @kernel.Term,
                ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                  ((x484, x485, x486) => {
                    rewr_annotconv_l(
                      dest_binary_blind, frees_1, union, freesl, subtract, x484,
                      x485, x486,
                    )
                  })(x746, x747, x748)
                }
              }
            })(x749)(th_54)
          },
        )
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("==>", _), _),
        c_64
      ) => {
        let (pat, th_p_5) = match c_64 {
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("=", _), l_14),
            _
          ) => (l_14, th_54)
          @kernel.Term::Comb(@kernel.Term::Const("~", _), l_15) =>
            (l_15, gen_map_conclusion(@bool.eqf_intro)(th_54))
          l_16 => (c_64, gen_map_conclusion(@bool.eqt_intro)(th_54))
        }
        (
          pat,
          fn(
            x750 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            imprewr_conv(x750)(th_p_5)
          },
        )
      }
      @kernel.Term::Comb(@kernel.Term::Const("~", _), l_17) => {
        let t754 = @bool.eqf_intro(th_54)
        (
          l_17,
          fn(
            x755 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            (fn(
              x751 : @list.List[@kernel.Term],
            ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise) raise {
              fn(
                x752 : @kernel.Thm,
              ) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise {
                fn(
                  x753 : @kernel.Term,
                ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                  ((x484, x485, x486) => {
                    rewr_annotconv_l(
                      dest_binary_blind, frees_1, union, freesl, subtract, x484,
                      x485, x486,
                    )
                  })(x751, x752, x753)
                }
              }
            })(x755)(t754)
          },
        )
      }
      @kernel.Term::Const("T", bool_ty_1) =>
        raise Failure("target_pat_cnv_of_thm")
      l_18 => {
        let t759 = @bool.eqt_intro(th_54)
        (
          l_18,
          fn(
            x760 : @list.List[@kernel.Term],
          ) -> ((@kernel.Term) -> (
            @kernel.Thm,
            @kernel.Term?,
            @list.List[@kernel.Term],
          ) raise) raise {
            (fn(
              x756 : @list.List[@kernel.Term],
            ) -> ((@kernel.Thm) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise) raise {
              fn(
                x757 : @kernel.Thm,
              ) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise {
                fn(
                  x758 : @kernel.Term,
                ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
                  ((x484, x485, x486) => {
                    rewr_annotconv_l(
                      dest_binary_blind, frees_1, union, freesl, subtract, x484,
                      x485, x486,
                    )
                  })(x756, x757, x758)
                }
              }
            })(x760)(t759)
          },
        )
      }
    }
  }
  let target_impconv_net_of_thm : (@kernel.Thm) -> ((
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> FoNetsT[
    (
      (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
        @kernel.Thm,
        @kernel.Term?,
        @list.List[@kernel.Term],
      ) raise) raise,
      @list.List[@kernel.Term],
      @kernel.Thm,
    ),
  ] raise) raise = fn(
    x761 : @kernel.Thm,
  ) -> ((
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> FoNetsT[
    (
      (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
        @kernel.Thm,
        @kernel.Term?,
        @list.List[@kernel.Term],
      ) raise) raise,
      @list.List[@kernel.Term],
      @kernel.Thm,
    ),
  ] raise) raise {
    let th_55 = x761
    try {
      let (p_13, c_65) = target_pat_cnv_of_thm(th_55)
      let vs_10 = freesl(@kernel.hyp(th_55))
      enter(vs_10)((p_13, (c_65, vs_10, th_55)))
    } catch {
      Failure(_) => i_l
      e => raise e
    }
  }
  let target_patterns_of_thm : (@kernel.Thm) -> @kernel.Term raise = fn(
    x764 : @kernel.Thm,
  ) -> @kernel.Term raise {
    (fn(
      x763 : (
        @kernel.Term,
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
      ),
    ) -> @kernel.Term raise {
      x763.0
    })(target_pat_cnv_of_thm(x764))
  }
  let rewrites_impconv_1 : (
    FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
  ] raise) raise) raise = fn(
    x794 : FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
  ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
  ] raise) raise) raise {
    let _ as net_4 = x794
    fn(
      x795 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> @list.List[
      (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
    ] raise) raise {
      let avs_12 = x795
      fn(
        x796 : @kernel.Term,
      ) -> @list.List[(@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term])] raise {
        let t_78 = x796
        @lib.mapfilter(
          fn(
            x797 : (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ) -> (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]) raise {
            let (c_70, _, _) = x797
            c_70(avs_12)(t_78)
          },
          lookup(t_78)(net_4),
        )
      }
    }
  }
  fn self__12(
    x798 : FoNetsT[
      (
        (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
          @kernel.Thm,
          @kernel.Term?,
          @list.List[@kernel.Term],
        ) raise) raise,
        @list.List[@kernel.Term],
        @kernel.Thm,
      ),
    ],
    x799 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
      (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
    ] raise) raise,
  ] raise {
    let net_5 = x798
    let ths_7 = x799
    let avs_13 = (x123 => flat_revmap_l(union, x123))(fn(
      x801 : @kernel.Thm,
    ) -> @list.List[@kernel.Term] raise {
      freesl(
        (fn(x800 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
          @kernel.hyp(x800)
        })(x801),
      )
    })(ths_7)
    ImpconvWithContext::With_context(
      fn(
        x802 : ImpconvAtomic,
      ) -> ((@kernel.Term) -> @list.List[
        (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
      ] raise) raise {
        let a_25 = x802
        fn(
          x803 : @kernel.Term,
        ) -> @list.List[(@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term])] raise {
          let t_79 = x803
          let avs_p = union(frees_1(t_79), avs_13)
          let cnv_5 : (@kernel.Term) -> @list.List[
            (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
          ] raise = fn(
            x804 : @kernel.Term,
          ) -> @list.List[
            (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
          ] raise {
            let t_80 = x804
            rewrites_impconv_1(net_5)(avs_p)(t_80)
          }
          let f_19 : ((@kernel.Term) -> @list.List[(@kernel.Thm, _, _)] raise) -> ((
            @kernel.Term,
          ) -> @list.List[(@kernel.Thm, _, _)] raise) raise = match a_25 {
            ImpconvAtomic::Atomic =>
              x805 => (x806 : @kernel.Term) => top_depth_l_1(x805, x806)
            ImpconvAtomic::Non_atomic =>
              x807 => {
                let cnv_6 = x807
                (x808 : @kernel.Term) => {
                  let avs_14 = x808
                  cnv_6(avs_14)
                }
              }
          }
          f_19(cnv_5)(t_79)
        }
      },
      fn(
        x809 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
          (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
        ] raise) raise,
      ] raise {
        self__12(net_5, ths_7)
      },
      fn(
        x810 : @kernel.Term,
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
          (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
        ] raise) raise,
      ] raise {
        let v_53 = x810
        let ths_8 = Ref::{ val: @list.List([]), }
        let net_p_1 = filter_l(
          fn(
            x814 : (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ) -> Bool raise {
            ((x811, x812, x813) => f_20_l(mem, v_53, ths_8, x811, x812, x813))(
              x814.0,
              x814.1,
              x814.2,
            )
          },
          net_5,
        )
        self__12(net_p_1, ths_8.val)
      },
    )
  }
  let deep_imp_rewr_mconv : (@list.List[@kernel.Thm]) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
      (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
    ] raise) raise,
  ] raise = fn(
    x815 : @list.List[@kernel.Thm],
  ) -> ImpconvWithContext[
    (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
      (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
    ] raise) raise,
  ] raise {
    let ths_9 = x815
    self__12(
      @lib.itlist(
        fn(
          x816 : @kernel.Thm,
          x817 : FoNetsT[
            (
              (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
                @kernel.Thm,
                @kernel.Term?,
                @list.List[@kernel.Term],
              ) raise) raise,
              @list.List[@kernel.Term],
              @kernel.Thm,
            ),
          ],
        ) -> FoNetsT[
          (
            (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
              @kernel.Thm,
              @kernel.Term?,
              @list.List[@kernel.Term],
            ) raise) raise,
            @list.List[@kernel.Term],
            @kernel.Thm,
          ),
        ] raise {
          let s818 = target_impconv_net_of_thm(x816)
          s818(x817)
        },
        ths_9,
        empty_net,
      ),
      ths_9,
    )
  }
  let imp_sym_1 : (@kernel.Thm) -> @kernel.Thm raise = rewr_rule(
    @class.taut(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) == (B → A → C)")),
  )
  let imp_exist_1 = @equal.gsym(@theorems.left_imp_exists_thm())
  let try_gen_1 : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x819 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let v_54 = x819
    fn(x820 : @kernel.Thm) -> @kernel.Thm raise {
      let th_57 = x820
      @bool.gen(v_54, th_57) catch {
        Failure(_) => th_57
        e => raise e
      }
    }
  }
  fn rewr_impmconv_of_mconv(
    x821 : ImpconvWithContext[(ImpconvAtomic) -> ImpconvAnnotMconv raise],
  ) -> ImpconvWithContext[(ImpconvAtomic) -> ImpconvImpMconv raise] raise {
    let _ as c_71 = x821
    let t834 = diminish_l(c_71)
    let t832 = augment_l(c_71)
    ImpconvWithContext::With_context(
      fn(
        x822 : ImpconvAtomic,
      ) -> ((VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise) raise {
        let a_26 = x822
        fn(
          x823 : VarianceT,
        ) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise {
          let v_55 = x823
          fn(x824 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
            let t_81 = x824
            let f_21 : ((@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term])) -> @kernel.Thm raise = fn(
              x825 : (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
            ) -> @kernel.Thm raise {
              let (th_58, ho_4, new_vars_2) = x825
              let (th1_24, th2_19) = @bool.eq_imp_rule(th_58)
              match v_55 {
                VarianceT::Co => {
                  let (p_14, th2_p_2) = undisch_term(th2_19)
                  fn exists_intro_1(
                    x826 : @list.List[@kernel.Term],
                  ) -> @kernel.Thm raise {
                    match x826 {
                      Empty =>
                        disch_imp_imp(list_of_option_l(ho_4).prepend(p_14))(
                          th2_p_2,
                        )
                      More(v_56, tail=vs_13) => {
                        let th_59 = exists_intro_1(vs_13)
                        try {
                          let t827 = @bool.gen(v_56, th_59)
                          rewr_rule(imp_exist_1)(t827)
                        } catch {
                          Failure(_) => th_59
                          e => raise e
                        }
                      }
                    }
                  }
                  exists_intro_1(new_vars_2)
                }
                VarianceT::Contra => {
                  let th1_p_2 = match ho_4 {
                    None => th1_24
                    Some(h_5) => imp_sym_1(@bool.disch(h_5, th1_24))
                  }
                  match new_vars_2 {
                    Empty => th1_p_2
                    More(_, tail=_) =>
                      map_conclusion((x831 : @kernel.Thm) => {
                        @lib.itlist(
                          fn(
                            x828 : @kernel.Term,
                            x829 : @kernel.Thm,
                          ) -> @kernel.Thm raise {
                            let s830 = try_gen_1(x828)
                            s830(x829)
                          },
                          new_vars_2,
                          x831,
                        )
                      })(th1_p_2)
                  }
                }
              }
            }
            @lib.map(f_21, apply_l(c_71)(a_26)(t_81))
          }
        }
      },
      fn(
        x833 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @list.List[
          @kernel.Thm,
        ] raise) raise) raise,
      ] raise {
        rewr_impmconv_of_mconv(t832(x833))
      },
      fn(
        x835 : @kernel.Term,
      ) -> ImpconvWithContext[
        (ImpconvAtomic) -> ((VarianceT) -> ((@kernel.Term) -> @list.List[
          @kernel.Thm,
        ] raise) raise) raise,
      ] raise {
        rewr_impmconv_of_mconv(t834(x835))
      },
    )
  }
  let existss : (@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x836 : @list.List[(@kernel.Term, @kernel.Term)],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let i_1 = x836
    fn(x837 : @kernel.Term) -> @kernel.Thm raise {
      let p_15 = x837
      let (codom, dom) = @lib.unzip(i_1)
      let f_22 : ((@kernel.Term, @kernel.Term)) -> ((@list.List[@kernel.Term]) -> @list.List[
        @kernel.Term,
      ] raise) raise = fn(
        x838 : (@kernel.Term, @kernel.Term),
      ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
        let i_2 = x838
        fn(x839 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
          let ps = x839
          ps.prepend(
            @kernel.vsubst(
              @list.List([i_2]),
              @basics.dest_exists(@lib.hd(ps)).1,
            ),
          )
        }
      }
      match
        @lib.rev_itlist(
          fn(
            x840 : (@kernel.Term, @kernel.Term),
            x841 : @list.List[@kernel.Term],
          ) -> @list.List[@kernel.Term] raise {
            let s842 = f_22(x840)
            s842(x841)
          },
          i_1,
          @list.List([@bool.list_mk_exists(dom, p_15)]),
        ) {
        More(h_6, tail=ps_1) => {
          let t845 = @kernel.assume_rule(h_6)
          @lib.rev_itlist(
            fn(
              x843 : (@kernel.Term, @kernel.Term),
              x844 : @kernel.Thm,
            ) -> @kernel.Thm raise {
              @bool.exists_rule(x843.0, x843.1, x844)
            },
            @lib.zip(ps_1, @lib.rev(codom)),
            t845,
          )
        }
        _ => raise @lib.MatchFailure("tscript.ml:1755")
      }
    }
  }
  let left_forall_imp : (@kernel.Thm) -> @kernel.Thm raise = rewr_rule(
    @theorems.left_forall_imp_thm(),
  )
  fn self__13(
    x846 : @list.List[@kernel.Term],
  ) -> ImpconvWithContext[
    (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
  ] raise {
    let ts_7 = x846
    ImpconvWithContext::With_context(
      fn(x847 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_57 = x847
        fn(x848 : @kernel.Term) -> @kernel.Thm raise {
          let t_82 = x848
          match (v_57, t_82) {
            (VarianceT::Co, @kernel.Term::Comb(@kernel.Term::Const("?", _), _)) => {
              let (vs_14, b_29) = @basics.strip_exists(t_82)
              let bs = strip_conj(b_29)
              let (s_3, n_10) = tryfind_fun_l(
                mapfilteri_l(fn(
                  x870 : Int64,
                ) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> (
                  @list.List[(@kernel.Term, @kernel.Term)],
                  Int64,
                ) raise) raise) raise {
                  fn(
                    x871 : @kernel.Term,
                  ) -> ((@list.List[@kernel.Term]) -> (
                    @list.List[(@kernel.Term, @kernel.Term)],
                    Int64,
                  ) raise) raise {
                    let s872 = ((x868 : Int64, x869 : @kernel.Term) => {
                      @lib.curry(
                        fn(
                          x867 : (Int64, @kernel.Term),
                        ) -> ((@list.List[@kernel.Term]) -> (
                          @list.List[(@kernel.Term, @kernel.Term)],
                          Int64,
                        ) raise) raise {
                          (fn(
                            x862 : (@kernel.Term) -> (
                              @list.List[(@kernel.Term, @kernel.Term)],
                              Int64,
                            ) raise,
                          ) -> ((@list.List[@kernel.Term]) -> (
                            @list.List[(@kernel.Term, @kernel.Term)],
                            Int64,
                          ) raise) raise {
                            fn(
                              x863 : @list.List[@kernel.Term],
                            ) -> (
                              @list.List[(@kernel.Term, @kernel.Term)],
                              Int64,
                            ) raise {
                              @lib.tryfind(x862, x863)
                            }
                          })(
                            (fn(
                              x864 : (Int64, @kernel.Term),
                            ) -> ((@kernel.Term) -> (
                              @list.List[(@kernel.Term, @kernel.Term)],
                              Int64,
                            ) raise) raise {
                              let s865 = ((x849, x850) => {
                                hmatch_l(vs_14, x849, x850)
                              })(x864.0, x864.1)
                              fn(
                                x866 : @kernel.Term,
                              ) -> (
                                @list.List[(@kernel.Term, @kernel.Term)],
                                Int64,
                              ) raise {
                                s865(x866)
                              }
                            })(x867),
                          )
                        },
                        x868,
                        x869,
                      )
                    })(x870, x871)
                    fn(
                      x873 : @list.List[@kernel.Term],
                    ) -> (@list.List[(@kernel.Term, @kernel.Term)], Int64) raise {
                      s872(x873)
                    }
                  }
                })(bs),
                ts_7,
              )
              let th_60 = existss(
                @lib.map(
                  fn(
                    x874 : @kernel.Term,
                  ) -> (@kernel.Term, @kernel.Term) raise {
                    let v_58 = x874
                    (@lib.rev_assocd(v_58, s_3, v_58), v_58)
                  },
                  vs_14,
                ),
              )(b_29)
              let th_p_6 = disch_hd(th_60)
              let h_8 = @basics.dest_imp(@kernel.concl(th_p_6)).0
              match strip_conj(h_8) {
                Empty => raise @lib.AssertFailure("tscript.ml:1781:17")
                More(h_9, tail=Empty) => @bool.disch(t_, th_60)
                More(_, tail=_) as hs_4 =>
                  match @lib.chop_list(@lib.int63_to_int(n_10), hs_4) {
                    (hs1, More(h_p, tail=hs2)) => {
                      let hs_th = @canon.conj_aci_rule(
                        @basics.mk_eq(
                          h_8,
                          @bool.list_mk_conj(hs1.concat(hs2).prepend(h_p)),
                        ),
                      )
                      let th1_25 = @equal.conv_rule(
                        @equal.land_conv(@simp.rewr_conv(hs_th)),
                        th_p_6,
                      )
                      let th2_20 = @bool.undisch(
                        @equal.conv_rule(
                          @simp.rewr_conv(@theorems.imp_conj()),
                          th1_25,
                        ),
                      )
                      let vs_p_1 = @lib.subtract(
                        vs_14,
                        @lib.map(
                          fn(
                            x875 : (@kernel.Term, @kernel.Term),
                          ) -> @kernel.Term raise {
                            x875.1
                          },
                          s_3,
                        ),
                      )
                      let f_23 : (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
                        x876 : @kernel.Term,
                      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                        let v_59 = x876
                        fn(x877 : @kernel.Thm) -> @kernel.Thm raise {
                          let th_61 = x877
                          left_forall_imp(@bool.gen(v_59, th_61)) catch {
                            Failure(_) => th_61
                            e => raise e
                          }
                        }
                      }
                      @lib.itlist(
                        fn(
                          x878 : @kernel.Term,
                          x879 : @kernel.Thm,
                        ) -> @kernel.Thm raise {
                          let s880 = f_23(x878)
                          s880(x879)
                        },
                        vs_p_1,
                        th2_20,
                      )
                    }
                    _ => raise @lib.MatchFailure("tscript.ml:1784")
                  }
              }
            }
            _ => raise Failure("EXISTS_CTXIMPCONV")
          }
        }
      },
      fn(
        x881 : @list.List[@kernel.Term],
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        let ts_p = x881
        self__13(union(ts_p, ts_7))
      },
      fn(
        x882 : @kernel.Term,
      ) -> ImpconvWithContext[
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ] raise {
        self__13(ts_7)
      },
    )
  }
  let exists_ctximpconv_1 = self__13(@list.List([]))
  let bind_impmconv : (
    (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise) raise = fn(
    x883 : (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
  ) -> ((VarianceT) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise) raise {
    let _ as c_72 = x883
    fn(
      x884 : VarianceT,
    ) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise {
      let v_60 = x884
      fn(x885 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        let th_62 = x885
        let (t1_19, t2_21) = @basics.dest_imp(@kernel.concl(th_62))
        match v_60 {
          VarianceT::Co =>
            @lib.map(
              fn(x888 : @kernel.Thm) -> @kernel.Thm raise {
                (fn(
                  x886 : @kernel.Thm,
                ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                  fn(x887 : @kernel.Thm) -> @kernel.Thm raise {
                    @bool.imp_trans(x886, x887)
                  }
                })(x888)(th_62)
              },
              c_72(v_60)(t1_19),
            )
          VarianceT::Contra =>
            @lib.map(
              (x889 : @kernel.Thm) => @bool.imp_trans(th_62, x889),
              c_72(v_60)(t2_21),
            )
        }
      }
    }
  }
  let pre : (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise = apply_l(
    try_ctximpconv(rewrite_ctximpconv(@list.List([]))),
  )
  let post = try_ctximpconv(top_depth_ctximpconv(exists_ctximpconv_1))
  let target_rewrite_impconv : (@list.List[@kernel.Thm]) -> ((
    @list.List[@kernel.Term],
  ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise = fn(
    x890 : @list.List[@kernel.Thm],
  ) -> ((@list.List[@kernel.Term]) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
    let sths = x890
    let one_step_sths : (VarianceT) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise = fn(
      x892 : VarianceT,
    ) -> ((@kernel.Thm) -> @list.List[@kernel.Thm] raise) raise {
      let v_61 = x892
      fn(x893 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        let uh_1 = x893
        let pre_1 : (VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
          x894 : VarianceT,
        ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          let v_62 = x894
          fn(x895 : @kernel.Thm) -> @kernel.Thm raise {
            let th_63 = x895
            bind_impconv(pre)(v_62)(th_63) catch {
              @lib.Unchanged => th_63
              e => raise e
            }
          }
        }
        let post_1 : (VarianceT) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
          x896 : VarianceT,
        ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          let v_63 = x896
          bind_ctximpconv(post)(v_63)
        }
        let f_24 : (@list.List[@kernel.Thm]) -> ImpconvWithContext[
          (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
        ] raise = fn(
          x899 : @list.List[@kernel.Thm],
        ) -> ImpconvWithContext[
          (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
        ] raise {
          (fn(
            x898 : ImpconvWithContext[
              (ImpconvAtomic) -> ((@kernel.Term) -> @list.List[
                (@kernel.Thm, @kernel.Term?, @list.List[@kernel.Term]),
              ] raise) raise,
            ],
          ) -> ImpconvWithContext[
            (VarianceT) -> ((@kernel.Term) -> @list.List[@kernel.Thm] raise) raise,
          ] raise {
            depth_ctximpmconv(rewr_impmconv_of_mconv(x898))
          })(deep_imp_rewr_mconv(x899))
        }
        let t900 = pre_1(v_61)(uh_1)
        let t901 = bind_impmconv(apply_l(f_24(sths)))(v_61)(t900)
        @lib.map(post_1(v_61), t901)
      }
    }
    let flat : (@list.List[@list.List[@kernel.Thm]]) -> @list.List[@kernel.Thm] raise = fn(
      x902 : @list.List[@list.List[@kernel.Thm]],
    ) -> @list.List[@kernel.Thm] raise {
      let l_22 = x902
      @lib.uniq(
        @lib.itlist(
          (x906 : @list.List[@kernel.Thm], x907 : @list.List[@kernel.Thm]) => {
            @lib.merge(
              fn(x903 : @kernel.Thm, x904 : @kernel.Thm) -> Bool raise {
                let s905 = thm_lt(x903)
                s905(x904)
              },
              x906,
              x907,
            )
          },
          l_22,
          @list.List([]),
        ),
      )
    }
    fn(
      x908 : @list.List[@kernel.Term],
    ) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
      let ts_8 = x908
      fn(x909 : VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let v_64 = x909
        fn(x910 : @kernel.Term) -> @kernel.Thm raise {
          let t_83 = x910
          fn self__14(x911 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
            let ths_10 = x911
            let t916 = one_step_sths(v_64)
            let pool = flat(
              @lib.map(
                fn(x917 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
                  ((x915 : @list.List[@kernel.Thm]) => {
                    @lib.mergesort(
                      fn(x912 : @kernel.Thm, x913 : @kernel.Thm) -> Bool raise {
                        let s914 = thm_lt(x912)
                        s914(x913)
                      },
                      x915,
                    )
                  })(t916(x917))
                },
                ths_10,
              ),
            )
            let sel_3 : (@kernel.Thm) -> @kernel.Term raise = fn(
              x918 : @kernel.Thm,
            ) -> @kernel.Term raise {
              let th_64 = x918
              imp_conv_outcome(th_64)(v_64)
            }
            let is_one_sol : (@kernel.Term) -> ((@kernel.Thm) -> Bool raise) raise = fn(
              x919 : @kernel.Term,
            ) -> ((@kernel.Thm) -> Bool raise) raise {
              let g_2 = x919
              let t929 = fo_term_match(@list.List([]))
              let t930 = (fn(
                x928 : (@kernel.Term) -> (
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ) raise,
              ) -> ((@kernel.Term) -> Bool raise) raise {
                (fn(
                  x925 : (@kernel.Term) -> Bool raise,
                ) -> ((@kernel.Term) -> Bool raise) raise {
                  (fn(
                    x921 : (@kernel.Term) -> @kernel.Term raise,
                  ) -> ((@kernel.Term) -> Bool raise) raise {
                    fn(x922 : @kernel.Term) -> Bool raise {
                      @lib.can(x921, x922)
                    }
                  })(
                    (fn(
                      x923 : (@kernel.Term) -> Bool raise,
                    ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                      fn(x924 : @kernel.Term) -> @kernel.Term raise {
                        @basics.find_term(x923, x924)
                      }
                    })(x925),
                  )
                })(
                  (fn(
                    x926 : (@kernel.Term) -> (
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ) raise,
                  ) -> ((@kernel.Term) -> Bool raise) raise {
                    fn(x927 : @kernel.Term) -> Bool raise {
                      @lib.can(x926, x927)
                    }
                  })(x928),
                )
              })(t929(g_2))
              fn(x931 : @kernel.Thm) -> Bool raise { t930(sel_3(x931)) }
            }
            let is_sol : (@kernel.Thm) -> Bool raise = fn(
              x932 : @kernel.Thm,
            ) -> Bool raise {
              let th_65 = x932
              @lib.tryfind(is_one_sol, ts_8)(th_65)
            }
            try {
              let t933 = @lib.find(is_sol, pool)
              bind_ctximpconv(post)(v_64)(t933)
            } catch {
              _ =>
                match pool {
                  Empty =>
                    raise Failure("TARGET_REWRITE_IMPCONV: no path found")
                  More(_, tail=_) =>
                    self__14(@lib.map(bind_ctximpconv(post)(v_64), pool))
                }
            }
          }
          self__14(@list.List([imp_refl(t_83)]))
        }
      }
    }
  }
  let target_rewrite_tac : (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
  ) raise) raise) raise = fn(
    x934 : @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise) raise) raise {
    let sths_1 = x934
    fn(
      x935 : @kernel.Thm,
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
      let th_66 = x935
      let sths_p = @lib.flat(@lib.map(preprocess, sths_1))
      let ths_11 = preprocess(th_66)
      let op_plus_1 : (
        (VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
      ) -> (((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((
        VarianceT,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise = then_impconv
      let t938 = imp_conv_of_ctx_imp_conv(rewrite_ctximpconv(ths_11))
      let t937 = @lib.map(patterns_of_thm, ths_11)
      let t939 = impconv_tac(
        op_plus_1(target_rewrite_impconv(sths_p)(t937))(t938),
      )
      (x940 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
        fail_if_unchanged_l(t939, x940)
      }
    }
  }
  let t941 = ctximpconv_tac(top_depth_ctximpconv(exists_ctximpconv_1))
  let hint_exists_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise = (x942 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
    fail_if_unchanged_l(t941, x942)
  }
  let (
    imp_rewrite_tac_1,
    target_rewrite_tac_1,
    hint_exists_tac_1,
    seq_imp_rewrite_tac_1,
    case_rewrite_tac_1,
  ) = (
    imp_rewrite_tac, target_rewrite_tac, hint_exists_tac, seq_imp_rewrite_tac, case_rewrite_tac,
  )
  imp_rewrite_tac_c.set(imp_rewrite_tac_1)
  target_rewrite_tac_c.set(target_rewrite_tac_1)
  hint_exists_tac_c.set(hint_exists_tac_1)
  seq_imp_rewrite_tac_c.set(seq_imp_rewrite_tac_1)
  case_rewrite_tac_c.set(case_rewrite_tac_1)
}

///|
fn[TA] i_l(x1 : TA) -> TA raise {
  let x = x1
  x
}

///|
fn[TB, TC] tryfind_fun_l(
  x12 : @list.List[(TC) -> TB raise],
  x13 : TC,
) -> TB raise {
  let fs = x12
  let x_1 = x13
  match fs {
    Empty => raise Failure("tryfind_fun")
    More(f_1, tail=fs_p) =>
      f_1(x_1) catch {
        Failure(_) => tryfind_fun_l(fs_p, x_1)
        e => raise e
      }
  }
}

///|
fn[TD, TE] mapfilteri_l(
  x14 : (Int64) -> ((TE) -> TD raise) raise,
) -> ((@list.List[TE]) -> @list.List[TD] raise) raise {
  let f_2 = x14
  fn self_(x16 : Int64, x17 : @list.List[TE]) -> @list.List[TD] raise {
    let i = x16
    match x17 {
      Empty => @list.List([])
      More(h, tail=t_1) => {
        let rest = self_(@lib.add63(i, 1L), t_1)
        rest.prepend(f_2(i)(h)) catch {
          Failure(_) => rest
          e => raise e
        }
      }
    }
  }
  (x18 : @list.List[TE]) => self_(0L, x18)
}

///|
fn[TF] list_of_option_l(x19 : TF?) -> @list.List[TF] raise {
  match x19 {
    None => @list.List([])
    Some(x_2) => @list.List([x_2])
  }
}

///|
fn[TG, TH] try_list_l(
  x20 : (TH) -> @list.List[TG] raise,
  x21 : TH,
) -> @list.List[TG] raise {
  let f_3 = x20
  let x_3 = x21
  f_3(x_3) catch {
    Failure(_) => @list.List([])
    e => raise e
  }
}

///|
fn[TI, TJ] fail_if_unchanged_l(x22 : (TJ) -> TI raise, x23 : TJ) -> TI raise {
  let f_4 = x22
  let x_4 = x23
  f_4(x_4) catch {
    @lib.Unchanged => raise Failure("Unchanged")
    e => raise e
  }
}

///|
fn[TK] lift_l(
  cmp : (@kernel.Term) -> ((@kernel.Term) -> Int64 raise) raise,
  x100 : (TK) -> @list.List[@kernel.Term] raise,
) -> ((TK) -> @list.List[@kernel.Term] raise) raise {
  let f_8 = x100
  fn(x106 : TK) -> @list.List[@kernel.Term] raise {
    (x105 => {
      @lib.list_sort(
        fn(x102 : @kernel.Term, x103 : @kernel.Term) -> Int raise {
          let s104 = cmp(x102)
          @lib.int63_to_int(s104(x103))
        },
        x105,
      )
    })(f_8(x106))
  }
}

///|
fn[TM] flat_revmap_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x123 : (TM) -> @list.List[@kernel.Term] raise,
) -> ((@list.List[TM]) -> @list.List[@kernel.Term] raise) raise {
  let f_9 = x123
  fn self__6(
    x125 : @list.List[@kernel.Term],
    x126 : @list.List[TM],
  ) -> @list.List[@kernel.Term] raise {
    let acc_3 = x125
    match x126 {
      Empty => acc_3
      More(x_16, tail=xs_11) => self__6(union(f_9(x_16), acc_3), xs_11)
    }
  }
  (x127 : @list.List[TM]) => self__6(@list.List([]), x127)
}

///|
fn[TN] flat_map_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x128 : (TN) -> @list.List[@kernel.Term] raise,
) -> ((@list.List[TN]) -> @list.List[@kernel.Term] raise) raise {
  let f_10 = x128
  let t131 = (x123 => flat_revmap_l(union, x123))(f_10)
  fn(x132 : @list.List[TN]) -> @list.List[@kernel.Term] raise {
    t131(
      (fn(x130 : @list.List[TN]) -> @list.List[TN] raise { @lib.rev(x130) })(
        x132,
      ),
    )
  }
}

///|
fn[TO] fail_l(x154 : Unit) -> TO raise {
  let _ = x154
  raise Failure("fo_term_match")
}

///|
fn[TQ] net_update_l(
  label_to_store : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    FoNetsTermLabel,
    @list.List[@kernel.Term],
  ) raise) raise,
  empty_net : FoNetsT[TQ],
  x178 : @list.List[@kernel.Term],
  x179 : TQ,
  x180 : FoNetsT[TQ],
) -> ((@list.List[@kernel.Term]) -> FoNetsT[TQ] raise) raise {
  let net_update = (
    x178 : @list.List[@kernel.Term],
    x179 : TQ,
    x180 : FoNetsT[TQ],
  ) => net_update_l(label_to_store, empty_net, x178, x179, x180)
  let lcs_3 = x178
  let elem = x179
  match x180 {
    FoNetsT::Netnode(edges, tips) =>
      fn(x181 : @list.List[@kernel.Term]) -> FoNetsT[TQ] raise {
        match x181 {
          Empty => FoNetsT::Netnode(edges, tips.prepend(elem))
          More(t_20, tail=rts) => {
            let (label, nts) = label_to_store(lcs_3)(t_20)
            let (child, others) = try {
              let t184 = @lib.remove(
                fn(x183 : (FoNetsTermLabel, FoNetsT[TQ])) -> Bool raise {
                  let (x_18, y_4) = x183
                  x_18 == label
                },
                edges,
              )
              let t185 = i_l(t184.1)
              (
                (fn(
                  x182 : (FoNetsTermLabel, FoNetsT[TQ]),
                ) -> FoNetsT[TQ] raise {
                  x182.1
                })(t184.0),
                t185,
              )
            } catch {
              Failure(_) => (empty_net, edges)
              e => raise e
            }
            let new_child = net_update(lcs_3, elem, child)(nts.concat(rts))
            FoNetsT::Netnode(others.prepend((label, new_child)), tips)
          }
        }
      }
  }
}

///|
fn[TS] follow_l(
  label_for_lookup : (@kernel.Term) -> (
    FoNetsTermLabel,
    @list.List[@kernel.Term],
  ) raise,
  x190 : FoNetsT[TS],
) -> ((@list.List[@kernel.Term]) -> @list.List[TS] raise) raise {
  let follow = (x190 : FoNetsT[TS]) => follow_l(label_for_lookup, x190)
  match x190 {
    FoNetsT::Netnode(edges_1, tips_1) =>
      fn(x191 : @list.List[@kernel.Term]) -> @list.List[TS] raise {
        match x191 {
          Empty => tips_1
          More(t_23, tail=rts_1) => {
            let (label_1, nts_1) = label_for_lookup(t_23)
            let collection = follow(@lib.assoc(label_1, edges_1))(
              nts_1.concat(rts_1),
            ) catch {
              Failure(_) => @list.List([])
              e => raise e
            }
            fn support(
              x192 : @list.List[@kernel.Term],
            ) -> @list.List[(Int64, @list.List[@kernel.Term])] raise {
              match x192 {
                Empty => @list.List([(0L, rts_1)])
                More(t_24, tail=ts_5) =>
                  match support(ts_5) {
                    More((k, nts_p), tail=res_p) as res =>
                      res.prepend((@lib.add63(k, 1L), nts_p.prepend(t_24)))
                    _ => raise @lib.MatchFailure("tscript.ml:459")
                  }
              }
            }
            let f_11 : ((Int64, @list.List[@kernel.Term])) -> @list.List[TS] raise = fn(
              x193 : (Int64, @list.List[@kernel.Term]),
            ) -> @list.List[TS] raise {
              let (k_1, nts_2) = x193
              follow(@lib.assoc(FoNetsTermLabel::Vnet(k_1), edges_1))(nts_2) catch {
                Failure(_) => @list.List([])
                e => raise e
              }
            }
            let follows = @lib.map(f_11, support(nts_1))
            collection.concat(@lib.flat(follows))
          }
        }
      }
  }
}

///|
fn[TU] filter_l(
  x196 : (TU) -> Bool raise,
  x197 : FoNetsT[TU],
) -> FoNetsT[TU] raise {
  let p_6 = x196
  match x197 {
    FoNetsT::Netnode(edges_2, tips_2) => {
      let t199 = @lib.list_filter(p_6, tips_2)
      FoNetsT::Netnode(
        @lib.map(
          fn(
            x198 : (FoNetsTermLabel, FoNetsT[TU]),
          ) -> (FoNetsTermLabel, FoNetsT[TU]) raise {
            let (l_1, n_6) = x198
            (l_1, filter_l(p_6, n_6))
          },
          edges_2,
        ),
        t199,
      )
    }
  }
}

///|
fn[TV] apply_l(x285 : ImpconvWithContext[TV]) -> TV raise {
  match x285 {
    ImpconvWithContext::With_context(c_22, _, _) => c_22
  }
}

///|
fn[TW] augment_l(
  x286 : ImpconvWithContext[TW],
) -> ((TsetT) -> ImpconvWithContext[TW] raise) raise {
  match x286 {
    ImpconvWithContext::With_context(_, a_21, _) => a_21
  }
}

///|
fn[TX] diminish_l(
  x288 : ImpconvWithContext[TX],
) -> ((@kernel.Term) -> ImpconvWithContext[TX] raise) raise {
  match x288 {
    ImpconvWithContext::With_context(_, _, d_14) => d_14
  }
}

///|
fn[TY, TZ] apply_with_context_l(
  disch_conj : (@kernel.Term, @kernel.Thm) -> @kernel.Thm raise,
  strip_conj_1 : (@kernel.Term) -> @list.List[@kernel.Term] raise,
  x290 : ImpconvWithContext[(TZ) -> ((TY) -> @kernel.Thm raise) raise],
  x291 : @kernel.Term,
  x292 : TZ,
  x293 : TY,
) -> @kernel.Thm raise {
  let c_23 = x290
  let ctx = x291
  let v_16 = x292
  let t_32 = x293
  let t294 = strip_conj_1(ctx)
  disch_conj(ctx, apply_l(augment_l(c_23)(t294))(v_16)(t_32))
}

///|
fn[TBA, TBB, TBC] map_all_l(
  x409 : (TBC) -> ((TBB) -> TBA raise) raise,
  x410 : @list.List[TBC],
  x411 : TBB,
) -> @list.List[TBA] raise {
  let f_12 = x409
  let xs_12 = x410
  let x_25 = x411
  match xs_12 {
    Empty => @list.List([])
    More(y_5, tail=ys_1) => {
      let t412 = map_all_l(f_12, ys_1, x_25)
      t412.prepend(f_12(y_5)(x_25))
    }
  }
}

///|
fn[TBD] bind_l(
  x423 : ImpconvWithContext[
    (TBD) -> ((VarianceT) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise,
  ],
  x424 : TBD,
  x425 : VarianceT,
  x426 : @kernel.Thm,
) -> @kernel.Thm raise {
  let c_37 = x423
  let na = x424
  let v_32 = x425
  let th_33 = x426
  let (t1_13, t2_15) = @basics.dest_imp(@kernel.concl(th_33))
  match v_32 {
    VarianceT::Co => @bool.imp_trans(apply_l(c_37)(na)(v_32)(t1_13), th_33)
    VarianceT::Contra => @bool.imp_trans(th_33, apply_l(c_37)(na)(v_32)(t2_15))
  }
}

///|
fn[TBE, TBF] rewr_annotconv_l(
  dest_binary_blind : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
  frees_1 : (@kernel.Term) -> @list.List[@kernel.Term] raise,
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  freesl : (@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise,
  subtract : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise) raise,
  x484 : TBF,
  x485 : @kernel.Thm,
  x486 : @kernel.Term,
) -> (@kernel.Thm, TBE?, @list.List[@kernel.Term]) raise {
  let avs_2 = x484
  let th_39 = x485
  let t_52 = x486
  let th_p_3 = @drule.part_match(@equal.lhs, th_39)(t_52)
  let (_, t_p_2) = dest_binary_blind(@kernel.concl(th_p_3))
  let new_vars = frees_1(t_p_2)
  let t487 = freesl(@kernel.hyp(th_p_3))
  let old_vars = union(frees_1(t_52), t487)
  (th_p_3, None, subtract(new_vars)(old_vars))
}

///|
fn[TBG, TBH, TBI] order_annotconv_l(
  dest_binary_blind : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
  x488 : (TBI) -> (@kernel.Thm, TBG, TBH) raise,
  x489 : TBI,
) -> (@kernel.Thm, TBG, TBH) raise {
  let cnv_2 = x488
  let t_53 = x489
  let (th_40, _, _) as res_1 = cnv_2(t_53)
  let (l_4, r_3) = dest_binary_blind(@kernel.concl(th_40))
  if @simp.term_order(l_4, r_3) {
    res_1
  } else {
    raise Failure("ORDER_ANNOTCONV")
  }
}

///|
fn[TBK] op_plus_plus_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x548 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBK?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x549 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBK?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x550 : @list.List[@kernel.Term],
  x551 : @kernel.Term,
) -> (@kernel.Thm, TBK?, @list.List[@kernel.Term]) raise {
  let c1_3 = x548
  let c2_3 = x549
  let avs_5 = x550
  let t_58 = x551
  match c1_3(avs_5)(t_58) {
    (_, Some(_), _) as c1t => c1t
    (th1_21, None, vs1) as c1t_1 =>
      try {
        let t552 = @kernel.rand(@kernel.concl(th1_21))
        let (th2_15, ho2, vs2) = c2_3(union(vs1, avs_5))(t552)
        let t553 = union(vs1, vs2)
        (@kernel.trans(th1_21, th2_15), ho2, t553)
      } catch {
        Failure(_) => c1t_1
        e => raise e
      }
  }
}

///|
fn[TBK] op_plus_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x554 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBK?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x555 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBK?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x556 : @list.List[@kernel.Term],
  x557 : @kernel.Term,
) -> (@kernel.Thm, TBK?, @list.List[@kernel.Term]) raise {
  let op_plus_plus = (
    x548 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      TBK?,
      @list.List[@kernel.Term],
    ) raise) raise,
    x549 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      TBK?,
      @list.List[@kernel.Term],
    ) raise) raise,
    x550 : @list.List[@kernel.Term],
    x551 : @kernel.Term,
  ) => op_plus_plus_l(union, x548, x549, x550, x551)
  let c1_4 = x554
  let c2_4 = x555
  let avs_6 = x556
  let t_59 = x557
  op_plus_plus(c1_4, c2_4, avs_6, t_59) catch {
    Failure(_) => c2_4(avs_6)(t_59)
    e => raise e
  }
}

///|
fn[TBL] comb_qconv_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x558 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBL?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x559 : @list.List[@kernel.Term],
  x560 : @kernel.Term,
  x561 : @kernel.Term,
) -> (@kernel.Thm, TBL?, @list.List[@kernel.Term]) raise {
  let c_50 = x558
  let avs_7 = x559
  let l_11 = x560
  let r_6 = x561
  try {
    match c_50(avs_7)(l_11) {
      (th_44, Some(_) as ho, vs_6) => (@equal.ap_thm(th_44, r_6), ho, vs_6)
      (th1_22, None, vs1_1) =>
        try {
          let (th2_16, ho2_1, vs2_1) = c_50(union(vs1_1, avs_7))(r_6)
          let t562 = union(vs1_1, vs2_1)
          (@kernel.mk_comb_rule(th1_22, th2_16), ho2_1, t562)
        } catch {
          Failure(_) => (@equal.ap_thm(th1_22, r_6), None, vs1_1)
          e => raise e
        }
    }
  } catch {
    Failure(_) => {
      let (th2_17, ho2_2, vs2_2) = c_50(avs_7)(r_6)
      (@equal.ap_term(l_11, th2_17), ho2_2, vs2_2)
    }
    e => raise e
  }
}

///|
fn[TBM] sub_qconv_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  insert_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    @kernel.Term,
  ] raise) raise,
  x563 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBM?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x564 : @list.List[@kernel.Term],
  x565 : @kernel.Term,
) -> (@kernel.Thm, TBM?, @list.List[@kernel.Term]) raise {
  let c_51 = x563
  let avs_8 = x564
  let t_60 = x565
  match t_60 {
    @kernel.Term::Comb(l_12, r_7) =>
      ((x558, x559, x560, x561) => comb_qconv_l(union, x558, x559, x560, x561))(
        c_51, avs_8, l_12, r_7,
      )
    @kernel.Term::Abs(v_36, _) => {
      let ho_1 = Ref::{ val: None, }
      let vs_7 = Ref::{ val: @list.List([]), }
      let c_p_2 : (@kernel.Term) -> @kernel.Thm raise = fn(
        x566 : @kernel.Term,
      ) -> @kernel.Thm raise {
        let t_61 = x566
        let (th_45, ho_p, vs_p) = c_51(insert_1(avs_8)(v_36))(t_61)
        {
          ho_1.val = ho_p
          ()
        }
        {
          vs_7.val = vs_p
          ()
        }
        th_45
      }
      let res_2 = @equal.abs_conv(c_p_2)(t_60)
      let t567 = vs_7.val
      (res_2, ho_1.val, t567)
    }
    _ => raise Failure("SUB_QCONV")
  }
}

///|
fn[TBN] op_bang_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  x568 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBN?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x569 : @list.List[@kernel.Term],
  x570 : @kernel.Term,
) -> (@kernel.Thm, TBN?, @list.List[@kernel.Term]) raise {
  let op_bang = (
    x568 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      TBN?,
      @list.List[@kernel.Term],
    ) raise) raise,
    x569 : @list.List[@kernel.Term],
    x570 : @kernel.Term,
  ) => op_bang_l(union, x568, x569, x570)
  let c_52 = x568
  let avs_9 = x569
  let t_62 = x570
  ((x548, x549, x550, x551) => op_plus_plus_l(union, x548, x549, x550, x551))(
    c_52,
    fn(
      x573 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (@kernel.Thm, TBN?, @list.List[@kernel.Term]) raise) raise {
      fn(
        x574 : @kernel.Term,
      ) -> (@kernel.Thm, TBN?, @list.List[@kernel.Term]) raise {
        ((x571 : @list.List[@kernel.Term], x572 : @kernel.Term) => {
          op_bang(c_52, x571, x572)
        })(x573, x574)
      }
    },
    avs_9,
    t_62,
  )
}

///|
fn[TBJ] top_depth_l(
  union : (@list.List[@kernel.Term], @list.List[@kernel.Term]) -> @list.List[
    @kernel.Term,
  ] raise,
  insert_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[
    @kernel.Term,
  ] raise) raise,
  x545 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Thm,
    TBJ?,
    @list.List[@kernel.Term],
  ) raise) raise,
  x546 : @list.List[@kernel.Term],
  x547 : @kernel.Term,
) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
  let top_depth = (
    x545 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
      @kernel.Thm,
      TBJ?,
      @list.List[@kernel.Term],
    ) raise) raise,
    x546 : @list.List[@kernel.Term],
    x547 : @kernel.Term,
  ) => top_depth_l(union, insert_1, x545, x546, x547)
  let c_49 = x545
  let avs_4 = x546
  let t_57 = x547
  ((x554, x555, x556, x557) => op_plus_l(union, x554, x555, x556, x557))(
    fn(
      x577 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise) raise {
      fn(
        x578 : @kernel.Term,
      ) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
        ((x575 : @list.List[@kernel.Term], x576 : @kernel.Term) => {
          ((x568, x569, x570) => op_bang_l(union, x568, x569, x570))(
            c_49, x575, x576,
          )
        })(x577, x578)
      }
    },
    fn(
      x593 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise) raise {
      fn(
        x594 : @kernel.Term,
      ) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
        ((x591 : @list.List[@kernel.Term], x592 : @kernel.Term) => {
          ((x548, x549, x550, x551) => {
            op_plus_plus_l(union, x548, x549, x550, x551)
          })(
            fn(
              x585 : @list.List[@kernel.Term],
            ) -> ((@kernel.Term) -> (
              @kernel.Thm,
              TBJ?,
              @list.List[@kernel.Term],
            ) raise) raise {
              fn(
                x586 : @kernel.Term,
              ) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
                ((x583 : @list.List[@kernel.Term], x584 : @kernel.Term) => {
                  ((x563, x564, x565) => {
                    sub_qconv_l(union, insert_1, x563, x564, x565)
                  })(
                    fn(
                      x581 : @list.List[@kernel.Term],
                    ) -> ((@kernel.Term) -> (
                      @kernel.Thm,
                      TBJ?,
                      @list.List[@kernel.Term],
                    ) raise) raise {
                      fn(
                        x582 : @kernel.Term,
                      ) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
                        ((x579 : @list.List[@kernel.Term], x580 : @kernel.Term) => {
                          top_depth(c_49, x579, x580)
                        })(x581, x582)
                      }
                    },
                    x583,
                    x584,
                  )
                })(x585, x586)
              }
            },
            fn(
              x589 : @list.List[@kernel.Term],
            ) -> ((@kernel.Term) -> (
              @kernel.Thm,
              TBJ?,
              @list.List[@kernel.Term],
            ) raise) raise {
              fn(
                x590 : @kernel.Term,
              ) -> (@kernel.Thm, TBJ?, @list.List[@kernel.Term]) raise {
                ((x587 : @list.List[@kernel.Term], x588 : @kernel.Term) => {
                  top_depth(c_49, x587, x588)
                })(x589, x590)
              }
            },
            x591,
            x592,
          )
        })(x593, x594)
      }
    },
    avs_4,
    t_57,
  )
}

///|
fn[TBO, TBP] basic_cnv_l(
  bigger_net : (Unit) -> @nets.Net[
    @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
  ] raise,
  x598 : @kernel.Term,
) -> (@kernel.Thm, TBO?, @list.List[TBP]) raise {
  let t_63 = x598
  (@simp.rewrites_conv(bigger_net(()))(t_63), None, @list.List([]))
}

///|
fn[TBR] f_16_l(
  mem : (@kernel.Term, @list.List[@kernel.Term]) -> Bool raise,
  v_37 : @kernel.Term,
  ths_1 : Ref[@list.List[@kernel.Thm]],
  x617 : TBR,
  x618 : @list.List[@kernel.Term],
  x619 : @kernel.Thm,
) -> Bool raise {
  let (_, vs_8, th_46) = (x617, x618, x619)
  if !mem(v_37, vs_8) {
    {
      ths_1.val = ths_1.val.prepend(th_46)
      ()
    }
    true
  } else {
    false
  }
}

///|
fn[TBS, TBT] mapply_with_context_l(
  disch_conj : (@kernel.Term, @kernel.Thm) -> @kernel.Thm raise,
  strip_conj_1 : (@kernel.Term) -> @list.List[@kernel.Term] raise,
  x668 : ImpconvWithContext[
    (TBT) -> ((TBS) -> @list.List[@kernel.Thm] raise) raise,
  ],
  x669 : @kernel.Term,
  x670 : TBT,
  x671 : TBS,
) -> @list.List[@kernel.Thm] raise {
  let c_55 = x668
  let ctx_1 = x669
  let v_42 = x670
  let t_68 = x671
  let t673 = strip_conj_1(ctx_1)
  @lib.map(
    (x672 : @kernel.Thm) => disch_conj(ctx_1, x672),
    apply_l(augment_l(c_55)(t673))(v_42)(t_68),
  )
}

///|
fn[TBU, TBV, TBW, TBX] map_fst_l(
  x765 : (TBX) -> TBU raise,
  x766 : (TBX, TBV, TBW),
) -> (TBU, TBV, TBW) raise {
  let f_17 = x765
  let (x_27, y_6, z) = x766
  (f_17(x_27), y_6, z)
}

///|
fn[TBY, TBZ] comb_mconv_l(
  x767 : (@kernel.Term) -> @list.List[(@kernel.Thm, TBY, TBZ)] raise,
  x768 : @kernel.Term,
  x769 : @kernel.Term,
) -> @list.List[(@kernel.Thm, TBY, TBZ)] raise {
  let c_66 = x767
  let l_19 = x768
  let r_8 = x769
  let t776 = @lib.map(
    (x775 : (@kernel.Thm, TBY, TBZ)) => {
      map_fst_l((x774 : @kernel.Thm) => @equal.ap_term(l_19, x774), x775)
    },
    c_66(r_8),
  )
  @lib.map(
    (x773 : (@kernel.Thm, TBY, TBZ)) => {
      map_fst_l(
        fn(x772 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x770 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x771 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x770, x771)
            }
          })(x772)(r_8)
        },
        x773,
      )
    },
    c_66(l_19),
  ).concat(t776)
}

///|
fn[TCC, TCD] f_18_l(
  v_51 : @kernel.Term,
  x782 : @kernel.Thm,
  x783 : TCC,
  x784 : TCD,
) -> (@kernel.Thm, TCC, TCD) raise {
  let (gth, ho_3, vs_11) = (x782, x783, x784)
  let gtm = @kernel.concl(gth)
  let (l_20, r_9) = @kernel.dest_eq(gtm)
  let v_p_3 = @kernel.variant(@kernel.frees(gtm), v_51)
  let l_p = @basics.alpha(v_p_3, l_20)
  let r_p = @basics.alpha(v_p_3, r_9)
  (
    @kernel.eq_mp(@equal.alpha_rule(gtm, @basics.mk_eq(l_p, r_p)), gth),
    ho_3,
    vs_11,
  )
}

///|
fn[TCA, TCB] abs_mconv_l(
  x777 : (@kernel.Term) -> @list.List[(@kernel.Thm, TCA, TCB)] raise,
  x778 : @kernel.Term,
  x779 : @kernel.Term,
) -> @list.List[(@kernel.Thm, TCA, TCB)] raise {
  let c_67 = x777
  let v_51 = x778
  let b_27 = x779
  let ths_6 = c_67(b_27)
  @lib.map(
    (x781 : (@kernel.Thm, TCA, TCB)) => {
      map_fst_l((x780 : @kernel.Thm) => @kernel.abs_rule(v_51, x780), x781)
    },
    ths_6,
  ) catch {
    Failure(_) => {
      let gv = @basics.genvar(@kernel.type_of(v_51))
      let b_p_2 = @kernel.vsubst(@list.List([(gv, v_51)]), b_27)
      @lib.map(
        fn(x785 : (@kernel.Thm, TCA, TCB)) -> (@kernel.Thm, TCA, TCB) raise {
          ((x782, x783, x784) => f_18_l(v_51, x782, x783, x784))(
            x785.0,
            x785.1,
            x785.2,
          )
        },
        @lib.map(
          (x787 : (@kernel.Thm, TCA, TCB)) => {
            map_fst_l((x786 : @kernel.Thm) => @kernel.abs_rule(gv, x786), x787)
          },
          c_67(b_p_2),
        ),
      )
    }
    e => raise e
  }
}

///|
fn[TCE, TCF] sub_mconv_l(
  x788 : (@kernel.Term) -> @list.List[(@kernel.Thm, TCE, TCF)] raise,
  x789 : @kernel.Term,
) -> @list.List[(@kernel.Thm, TCE, TCF)] raise {
  let c_68 = x788
  match x789 {
    @kernel.Term::Comb(l_21, r_10) => comb_mconv_l(c_68, l_21, r_10)
    @kernel.Term::Abs(v_52, b_28) => abs_mconv_l(c_68, v_52, b_28)
    @kernel.Term::Const(_, _) | @kernel.Term::Var(_, _) => @list.List([])
  }
}

///|
fn[TCG, TCH] top_depth_l_1(
  x790 : (@kernel.Term) -> @list.List[(@kernel.Thm, TCG, TCH)] raise,
  x791 : @kernel.Term,
) -> @list.List[(@kernel.Thm, TCG, TCH)] raise {
  let c_69 = x790
  let t_77 = x791
  let t793 = c_69(t_77)
  sub_mconv_l((x792 : @kernel.Term) => top_depth_l_1(c_69, x792), t_77).concat(
    t793,
  )
}

///|
fn[TCK] f_20_l(
  mem : (@kernel.Term, @list.List[@kernel.Term]) -> Bool raise,
  v_53 : @kernel.Term,
  ths_8 : Ref[@list.List[@kernel.Thm]],
  x811 : TCK,
  x812 : @list.List[@kernel.Term],
  x813 : @kernel.Thm,
) -> Bool raise {
  let (_, vs_12, th_56) = (x811, x812, x813)
  if !mem(v_53, vs_12) {
    {
      ths_8.val = ths_8.val.prepend(th_56)
      ()
    }
    true
  } else {
    false
  }
}

///|
fn[TCL] hmatch_l(
  vs_14 : @list.List[@kernel.Term],
  x849 : TCL,
  x850 : @kernel.Term,
) -> ((@kernel.Term) -> (@list.List[(@kernel.Term, @kernel.Term)], TCL) raise) raise {
  let (n_9, b_30) = (x849, x850)
  match
    @lib.partition(
      fn(x854 : @kernel.Term) -> Bool raise {
        (fn(
          x852 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
          fn(x853 : @list.List[@kernel.Term]) -> Bool raise {
            @lib.mem(x852, x853)
          }
        })(x854)(vs_14)
      },
      @basics.variables(b_30),
    ) {
    (Empty, _) => raise Failure("EXISTS_CTXIMPCONV")
    (More(_, tail=_) as lvs, lcs_5) =>
      fn(
        x855 : @kernel.Term,
      ) -> (@list.List[(@kernel.Term, @kernel.Term)], TCL) raise {
        let h_7 = x855
        match @drule.term_match(lcs_5, b_30, h_7) {
          (_, i_3, j) if @lib.filter(
              (x861 : (@kernel.HolType, @kernel.HolType)) => {
                @lib.uncurry(
                  fn(
                    x858 : @kernel.HolType,
                    x859 : @kernel.HolType,
                  ) -> Bool raise {
                    let s860 = (fn(
                      x856 : @kernel.HolType,
                    ) -> ((@kernel.HolType) -> Bool raise) raise {
                      fn(x857 : @kernel.HolType) -> Bool raise { x856 != x857 }
                    })(x858)
                    s860(x859)
                  },
                  x861,
                )
              },
              j,
            ) ==
            @list.List([]) =>
            (if i_3 == @list.List([]) { @lib.zip(lvs, lvs) } else { i_3 }, n_9)
          _ => raise Failure("EXISTS_CTXIMPCONV")
        }
      }
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
