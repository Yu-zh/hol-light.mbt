// Translated from upstream Library/wo.ml; edit this file directly.

///|
/// PBETA_TAC
fn step_1() -> Unit raise {
  pbeta_tac_c.set(
    @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv)),
  )
}

///|
let pbeta_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("PBETA_TAC")

///|
/// `PBETA_TAC`
pub fn pbeta_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  pbeta_tac_c.get()(x)
}

///|
/// SUBSET_PRED
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_()]))
  subset_pred_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : (_) -> Bool, SUBSET(P, Q) == (∀ x : _, P(x) → Q(x))"),
      t1,
    ),
  )
}

///|
let subset_pred_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_PRED")

///|
/// `SUBSET_PRED`
pub fn subset_pred() -> @kernel.Thm {
  subset_pred_c.get()
}

///|
/// UNIONS_PRED
fn step_3() -> Unit raise {
  let t2 = @simp.rewrite_tac(
    @list.List([
      @sets.unions(),
      @class.fun_eq_thm(),
      @sets.in_elim_thm(),
      @sets.in_(),
    ]),
  )
  unions_pred_c.set(
    @tactics.prove(@term_syntax.parse_term("UNIONS((P : ((_) -> Bool) -> Bool)) == ((x : _) => ∃ p : (_) -> Bool, P(p) && p(x))"), t2),
  )
}

///|
let unions_pred_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_PRED")

///|
/// `UNIONS_PRED`
pub fn unions_pred() -> @kernel.Thm {
  unions_pred_c.get()
}

///|
/// fld
fn step_4() -> Unit raise {
  fld_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(fld : ((A, A) -> Bool, A) -> Bool)((R : (A, A) -> Bool)) == {(x : A) | ∃ y : A, R(x, y) || R(y, x)}"),
    ),
  )
}

///|
let fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fld")

///|
/// `fld`
pub fn fld() -> @kernel.Thm {
  fld_c.get()
}

///|
/// IN_FLD
fn step_5() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([fld(), @sets.in_elim_thm()]))
  in_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ x : A, IN(x, fld(l)) == (∃ y : A, l(x, y) || l(y, x))"),
      t3,
    ),
  )
}

///|
let in_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_FLD")

///|
/// `IN_FLD`
pub fn in_fld() -> @kernel.Thm {
  in_fld_c.get()
}

///|
/// FLD_EQ_EMPTY
fn step_6() -> Unit raise {
  let t9 = @sets.set_tac(@list.List([]))
  let t8 = @simp.rewrite_tac(@list.List([fld()]))
  let t7 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t10 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.gen_rewrite_tac(
            fn(
              x4 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s5 = @equal.land_conv(x4)
              fn(x6 : @kernel.Term) -> @kernel.Thm raise { s5(x6) }
            },
            @list.List([@sets.extension()]),
          ),
        ),
        t7,
      ),
      t8,
    ),
    t9,
  )
  fld_eq_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, (fld(R) == {}) == (R == ((x : A) => (y : A) => false))"),
      t10,
    ),
  )
}

///|
let fld_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_EQ_EMPTY")

///|
/// `FLD_EQ_EMPTY`
pub fn fld_eq_empty() -> @kernel.Thm {
  fld_eq_empty_c.get()
}

///|
/// FLD_SUBSET
fn step_7() -> Unit raise {
  let t11 = @sets.set_tac(@list.List([]))
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([fld()])), t11)
  fld_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (_, _) -> Bool, ∀ r : (_, _) -> Bool, (∀ x : _, ∀ y : _, l(x, y) → r(x, y)) → SUBSET(fld(l), fld(r))"),
      t12,
    ),
  )
}

///|
let fld_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_SUBSET")

///|
/// `FLD_SUBSET`
pub fn fld_subset() -> @kernel.Thm {
  fld_subset_c.get()
}

///|
/// FINITE_FLD
fn step_8() -> Unit raise {
  let t34 = @sets.set_tac(@list.List([]))
  let t33 = @simp.rewrite_tac(
    @list.List([@pair.exists_pair_thm(), @pair.pair_eq()]),
  )
  let t32 = @simp.rewrite_tac(
    @list.List([
      @sets.in_cross(),
      fld(),
      @sets.in_image(),
      @sets.in_elim_thm(),
      @sets.in_union(),
    ]),
  )
  let t31 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @pair.forall_pair_thm(),
      @sets.in_elim_pair_thm(),
    ]),
  )
  let t30 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.finite_subset(),
    ),
  )
  let t27 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @equal.gsym(@sets.finite_union())]),
  )
  let t25 = @drule.match_mp(@sets.finite_image())
  let t28 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x26 : @kernel.Thm,
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
        x22 : @kernel.Thm,
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
        let th = x22
        let t24 = @tactics.mp_tac(
          @bool.ispec(@term_syntax.parse_term("(SND : ((A, A)) -> A)"), th),
        )
        @tactics.then_tac(
          @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(FST : ((A, A)) -> A)"), th)),
          t24,
        )
      })(t25(x26))
    }),
    t27,
  )
  let t16 = @drule.match_mp(@sets.finite_cross())
  let t29 = @list.List([
    @tactics.disch_then(fn(
      x21 : @kernel.Thm,
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
        x17 : @kernel.Thm,
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
          x13 : @kernel.Thm,
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
          let s14 = @tactics.mp_tac(x13)
          fn(
            x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s14(x15)
          }
        })(t16(x17))
      })(
        (fn(x20 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x18 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x19 : @kernel.Thm) -> @kernel.Thm raise { @bool.conj(x18, x19) }
          })(x20)(x20)
        })(x21),
      )
    }),
    t28,
  ])
  let t35 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
              t29,
            ),
            t30,
          ),
          t31,
        ),
        t32,
      ),
      t33,
    ),
    t34,
  )
  finite_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, FINITE(fld(l)) == FINITE({((x : A), (y : A)) | l(x, y)})"),
      t35,
    ),
  )
}

///|
let finite_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_FLD")

///|
/// `FINITE_FLD`
pub fn finite_fld() -> @kernel.Thm {
  finite_fld_c.get()
}

///|
/// qoset
fn step_9() -> Unit raise {
  qoset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(qoset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((∀ x : A, IN(x, fld(l)) → l(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)))"),
    ),
  )
}

///|
let qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qoset")

///|
/// `qoset`
pub fn qoset() -> @kernel.Thm {
  qoset_c.get()
}

///|
/// poset
fn step_10() -> Unit raise {
  poset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(poset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((∀ x : A, IN(x, fld(l)) → l(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y))"),
    ),
  )
}

///|
let poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poset")

///|
/// `poset`
pub fn poset() -> @kernel.Thm {
  poset_c.get()
}

///|
/// toset
fn step_11() -> Unit raise {
  toset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(toset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((∀ x : A, IN(x, fld(l)) → l(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y) && (∀ x : A, ∀ y : A, IN(x, fld(l)) && IN(y, fld(l)) → l(x, y) || l(y, x)))"),
    ),
  )
}

///|
let toset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("toset")

///|
/// `toset`
pub fn toset() -> @kernel.Thm {
  toset_c.get()
}

///|
/// woset
fn step_12() -> Unit raise {
  woset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(woset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((∀ x : A, IN(x, fld(l)) → l(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y) && (∀ x : A, ∀ y : A, IN(x, fld(l)) && IN(y, fld(l)) → l(x, y) || l(y, x)) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) → (∃ x : A, IN(x, s) && (∀ y : A, IN(y, s) → l(x, y)))))"),
    ),
  )
}

///|
let woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("woset")

///|
/// `woset`
pub fn woset() -> @kernel.Thm {
  woset_c.get()
}

///|
/// wqoset
fn step_13() -> Unit raise {
  wqoset_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(wqoset : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == ((∀ x : A, IN(x, fld(l)) → l(x, x)) && (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ y : A, IN(y, s) → (∃ x : A, IN(x, t) && l(x, y))))))"),
    ),
  )
}

///|
let wqoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wqoset")

///|
/// `wqoset`
pub fn wqoset() -> @kernel.Thm {
  wqoset_c.get()
}

///|
/// chain
fn step_14() -> Unit raise {
  chain_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(chain : ((A, A) -> Bool, (A) -> Bool) -> Bool)((l : (A, A) -> Bool), (s : (A) -> Bool)) == (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → l(x, y) || l(y, x))"),
    ),
  )
}

///|
let chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("chain")

///|
/// `chain`
pub fn chain() -> @kernel.Thm {
  chain_c.get()
}

///|
/// antichain
fn step_15() -> Unit raise {
  antichain_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(antichain : ((A, A) -> Bool, (A) -> Bool) -> Bool)((l : (A, A) -> Bool), (s : (A) -> Bool)) == (SUBSET(s, fld(l)) && pairwise((x : A) => (y : A) => !l(x, y), s))"),
    ),
  )
}

///|
let antichain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("antichain")

///|
/// `antichain`
pub fn antichain() -> @kernel.Thm {
  antichain_c.get()
}

///|
/// CHAIN
fn step_16() -> Unit raise {
  let t36 = @sets.set_tac(@list.List([]))
  let t37 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([chain(), fld()])),
    t36,
  )
  chain_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, chain(l, s) == (SUBSET(s, fld(l)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → l(x, y) || l(y, x)))"),
      t37,
    ),
  )
}

///|
let chain_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CHAIN")

///|
/// `CHAIN`
pub fn chain_v1() -> @kernel.Thm {
  chain_v1_c.get()
}

///|
/// ANTICHAIN
fn step_17() -> Unit raise {
  let t38 = @sets.set_tac(@list.List([]))
  let t39 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([antichain(), @sets.pairwise(), fld()])),
    t38,
  )
  antichain_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, antichain(l, s) == (SUBSET(s, fld(l)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) → !l(x, y)))"),
      t39,
    ),
  )
}

///|
let antichain_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANTICHAIN")

///|
/// `ANTICHAIN`
pub fn antichain_v1() -> @kernel.Thm {
  antichain_v1_c.get()
}

///|
/// CHAIN_SUBSET
fn step_18() -> Unit raise {
  let t40 = @sets.set_tac(@list.List([]))
  let t41 = @tactics.then_tac(@simp.rewrite_tac(@list.List([chain()])), t40)
  chain_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, chain(l, s) && SUBSET(t, s) → chain(l, t)"),
      t41,
    ),
  )
}

///|
let chain_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CHAIN_SUBSET")

///|
/// `CHAIN_SUBSET`
pub fn chain_subset() -> @kernel.Thm {
  chain_subset_c.get()
}

///|
/// ANTICHAIN_SUBSET
fn step_19() -> Unit raise {
  let t42 = @sets.set_tac(@list.List([]))
  let t43 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([antichain_v1()])),
    t42,
  )
  antichain_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, antichain(l, s) && SUBSET(t, s) → antichain(l, t)"),
      t43,
    ),
  )
}

///|
let antichain_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ANTICHAIN_SUBSET",
)

///|
/// `ANTICHAIN_SUBSET`
pub fn antichain_subset() -> @kernel.Thm {
  antichain_subset_c.get()
}

///|
/// QOSET_REFL
fn step_20() -> Unit raise {
  let t44 = @meson.meson_tac(@list.List([]))
  let t45 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([qoset(), @sets.in_()])),
    t44,
  )
  qoset_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) → (∀ x : A, fld(l, x) → l(x, x))"),
      t45,
    ),
  )
}

///|
let qoset_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_REFL")

///|
/// `QOSET_REFL`
pub fn qoset_refl() -> @kernel.Thm {
  qoset_refl_c.get()
}

///|
/// QOSET_TRANS
fn step_21() -> Unit raise {
  let t46 = @meson.meson_tac(@list.List([]))
  let t47 = @tactics.then_tac(@simp.rewrite_tac(@list.List([qoset()])), t46)
  qoset_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) → (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z))"),
      t47,
    ),
  )
}

///|
let qoset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_TRANS")

///|
/// `QOSET_TRANS`
pub fn qoset_trans() -> @kernel.Thm {
  qoset_trans_c.get()
}

///|
/// QOSET_REFL_EQ
fn step_22() -> Unit raise {
  let t48 = @meson.meson_tac(@list.List([]))
  let t49 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([qoset(), fld(), @sets.in_elim_thm()])),
    t48,
  )
  qoset_refl_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ x : A, qoset(l) → l(x, x) == IN(x, fld(l))"),
      t49,
    ),
  )
}

///|
let qoset_refl_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_REFL_EQ")

///|
/// `QOSET_REFL_EQ`
pub fn qoset_refl_eq() -> @kernel.Thm {
  qoset_refl_eq_c.get()
}

///|
/// QOSET_FLDEQ
fn step_23() -> Unit raise {
  let t50 = @meson.meson_tac(@list.List([qoset_refl_eq(), @sets.in_()]))
  qoset_fldeq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) → (∀ x : A, fld(l, x) == l(x, x))"),
      t50,
    ),
  )
}

///|
let qoset_fldeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_FLDEQ")

///|
/// `QOSET_FLDEQ`
pub fn qoset_fldeq() -> @kernel.Thm {
  qoset_fldeq_c.get()
}

///|
/// QOSET_FLD
fn step_24() -> Unit raise {
  let t51 = @sets.set_tac(@list.List([]))
  let t52 = @tactics.then_tac(
    @simp.simp_tac(@list.List([qoset_refl_eq()])),
    t51,
  )
  qoset_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) → fld(l) == {(x : A) | l(x, x)}"),
      t52,
    ),
  )
}

///|
let qoset_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_FLD")

///|
/// `QOSET_FLD`
pub fn qoset_fld() -> @kernel.Thm {
  qoset_fld_c.get()
}

///|
/// WOSET_IMP_TOSET
fn step_25() -> Unit raise {
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t54 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([woset(), toset()])),
      ),
      @tactics.strip_tac,
    ),
    t53,
  )
  woset_imp_toset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → toset(l)"),
      t54,
    ),
  )
}

///|
let woset_imp_toset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_IMP_TOSET",
)

///|
/// `WOSET_IMP_TOSET`
pub fn woset_imp_toset() -> @kernel.Thm {
  woset_imp_toset_c.get()
}

///|
/// WOSET_IMP_POSET
fn step_26() -> Unit raise {
  let t55 = @simp.asm_rewrite_tac(@list.List([]))
  let t56 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([woset(), poset()])),
      ),
      @tactics.strip_tac,
    ),
    t55,
  )
  woset_imp_poset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → poset(l)"),
      t56,
    ),
  )
}

///|
let woset_imp_poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_IMP_POSET",
)

///|
/// `WOSET_IMP_POSET`
pub fn woset_imp_poset() -> @kernel.Thm {
  woset_imp_poset_c.get()
}

///|
/// WOSET_IMP_QOSET
fn step_27() -> Unit raise {
  let t57 = @simp.asm_rewrite_tac(@list.List([]))
  let t58 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([woset(), qoset()])),
      ),
      @tactics.strip_tac,
    ),
    t57,
  )
  woset_imp_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → qoset(l)"),
      t58,
    ),
  )
}

///|
let woset_imp_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_IMP_QOSET",
)

///|
/// `WOSET_IMP_QOSET`
pub fn woset_imp_qoset() -> @kernel.Thm {
  woset_imp_qoset_c.get()
}

///|
/// TOSET_IMP_POSET
fn step_28() -> Unit raise {
  let t59 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([toset(), poset()])),
      ),
      @tactics.strip_tac,
    ),
    t59,
  )
  toset_imp_poset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) → poset(l)"),
      t60,
    ),
  )
}

///|
let toset_imp_poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TOSET_IMP_POSET",
)

///|
/// `TOSET_IMP_POSET`
pub fn toset_imp_poset() -> @kernel.Thm {
  toset_imp_poset_c.get()
}

///|
/// TOSET_IMP_QOSET
fn step_29() -> Unit raise {
  let t61 = @simp.asm_rewrite_tac(@list.List([]))
  let t62 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([toset(), qoset()])),
      ),
      @tactics.strip_tac,
    ),
    t61,
  )
  toset_imp_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) → qoset(l)"),
      t62,
    ),
  )
}

///|
let toset_imp_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TOSET_IMP_QOSET",
)

///|
/// `TOSET_IMP_QOSET`
pub fn toset_imp_qoset() -> @kernel.Thm {
  toset_imp_qoset_c.get()
}

///|
/// POSET_IMP_QOSET
fn step_30() -> Unit raise {
  let t63 = @simp.asm_rewrite_tac(@list.List([]))
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([poset(), qoset()])),
      ),
      @tactics.strip_tac,
    ),
    t63,
  )
  poset_imp_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) → qoset(l)"),
      t64,
    ),
  )
}

///|
let poset_imp_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POSET_IMP_QOSET",
)

///|
/// `POSET_IMP_QOSET`
pub fn poset_imp_qoset() -> @kernel.Thm {
  poset_imp_qoset_c.get()
}

///|
/// WQOSET_IMP_QOSET
fn step_31() -> Unit raise {
  let t65 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([wqoset(), qoset()])),
      ),
      @tactics.strip_tac,
    ),
    t65,
  )
  wqoset_imp_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, wqoset(l) → qoset(l)"),
      t66,
    ),
  )
}

///|
let wqoset_imp_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_IMP_QOSET",
)

///|
/// `WQOSET_IMP_QOSET`
pub fn wqoset_imp_qoset() -> @kernel.Thm {
  wqoset_imp_qoset_c.get()
}

///|
/// strictly
fn step_32() -> Unit raise {
  strictly_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(strictly : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == ((x : A) => (y : A) => R(x, y) && !R(y, x))"),
    ),
  )
}

///|
let strictly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strictly")

///|
/// `strictly`
pub fn strictly() -> @kernel.Thm {
  strictly_c.get()
}

///|
/// properly
fn step_33() -> Unit raise {
  properly_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(properly : ((A, A) -> Bool, A, A) -> Bool)((R : (A, A) -> Bool)) == ((x : A) => (y : A) => R(x, y) && !(x == y))"),
    ),
  )
}

///|
let properly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("properly")

///|
/// `properly`
pub fn properly() -> @kernel.Thm {
  properly_c.get()
}

///|
/// PROPERLY_EQ_STRICTLY
fn step_34() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([]))
  let t68 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([poset(), properly(), strictly(), @class.fun_eq_thm()]),
    ),
    t67,
  )
  properly_eq_strictly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) → properly(l) == strictly(l)"),
      t68,
    ),
  )
}

///|
let properly_eq_strictly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PROPERLY_EQ_STRICTLY",
)

///|
/// `PROPERLY_EQ_STRICTLY`
pub fn properly_eq_strictly() -> @kernel.Thm {
  properly_eq_strictly_c.get()
}

///|
/// STRICTLY_EQ_PROPERLY
fn step_35() -> Unit raise {
  let t69 = @meson.meson_tac(@list.List([]))
  let t70 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([poset(), properly(), strictly(), @class.fun_eq_thm()]),
    ),
    t69,
  )
  strictly_eq_properly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) → strictly(l) == properly(l)"),
      t70,
    ),
  )
}

///|
let strictly_eq_properly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_EQ_PROPERLY",
)

///|
/// `STRICTLY_EQ_PROPERLY`
pub fn strictly_eq_properly() -> @kernel.Thm {
  strictly_eq_properly_c.get()
}

///|
/// STRICTLY_IMP_PROPERLY
fn step_36() -> Unit raise {
  let t71 = @meson.meson_tac(@list.List([]))
  let t72 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([qoset(), properly(), strictly(), @class.fun_eq_thm()]),
    ),
    t71,
  )
  strictly_imp_properly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ x : A, ∀ y : A, qoset(l) && strictly(l, x, y) → properly(l, x, y)"),
      t72,
    ),
  )
}

///|
let strictly_imp_properly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_IMP_PROPERLY",
)

///|
/// `STRICTLY_IMP_PROPERLY`
pub fn strictly_imp_properly() -> @kernel.Thm {
  strictly_imp_properly_c.get()
}

///|
/// STRICTLY_STRICTLY
fn step_37() -> Unit raise {
  let t73 = @meson.meson_tac(@list.List([]))
  let t74 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), strictly()])),
    t73,
  )
  strictly_strictly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, strictly(strictly(R)) == strictly(R)"),
      t74,
    ),
  )
}

///|
let strictly_strictly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_STRICTLY",
)

///|
/// `STRICTLY_STRICTLY`
pub fn strictly_strictly() -> @kernel.Thm {
  strictly_strictly_c.get()
}

///|
/// PROPERLY_PROPERLY
fn step_38() -> Unit raise {
  let t75 = @meson.meson_tac(@list.List([]))
  let t76 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), properly()])),
    t75,
  )
  properly_properly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, properly(properly(R)) == properly(R)"),
      t76,
    ),
  )
}

///|
let properly_properly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PROPERLY_PROPERLY",
)

///|
/// `PROPERLY_PROPERLY`
pub fn properly_properly() -> @kernel.Thm {
  properly_properly_c.get()
}

///|
/// STRICTLY_PROPERLY
fn step_39() -> Unit raise {
  let t77 = @meson.meson_tac(@list.List([]))
  let t78 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), strictly(), properly()])),
    t77,
  )
  strictly_properly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, strictly(properly(R)) == strictly(R)"),
      t78,
    ),
  )
}

///|
let strictly_properly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRICTLY_PROPERLY",
)

///|
/// `STRICTLY_PROPERLY`
pub fn strictly_properly() -> @kernel.Thm {
  strictly_properly_c.get()
}

///|
/// PROPERLY_STRICTLY
fn step_40() -> Unit raise {
  let t79 = @meson.meson_tac(@list.List([]))
  let t80 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), strictly(), properly()])),
    t79,
  )
  properly_strictly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, properly(strictly(R)) == strictly(R)"),
      t80,
    ),
  )
}

///|
let properly_strictly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PROPERLY_STRICTLY",
)

///|
/// `PROPERLY_STRICTLY`
pub fn properly_strictly() -> @kernel.Thm {
  properly_strictly_c.get()
}

///|
/// PROPERLY_MONO
fn step_41() -> Unit raise {
  let t81 = @meson.meson_tac(@list.List([]))
  let t82 = @tactics.then_tac(@simp.rewrite_tac(@list.List([properly()])), t81)
  properly_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ S : (_, _) -> Bool, (∀ x : _, ∀ y : _, R(x, y) → S(x, y)) → (∀ x : _, ∀ y : _, properly(R, x, y) → properly(S, x, y))"),
      t82,
    ),
  )
}

///|
let properly_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROPERLY_MONO")

///|
/// `PROPERLY_MONO`
pub fn properly_mono() -> @kernel.Thm {
  properly_mono_c.get()
}

///|
/// POSET_QOSET
fn step_42() -> Unit raise {
  let t83 = @simp.rewrite_tac(
    @list.List([poset(), qoset(), @equal.gsym(@theorems.conj_assoc())]),
  )
  poset_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) == (qoset(l) && (∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y))"),
      t83,
    ),
  )
}

///|
let poset_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_QOSET")

///|
/// `POSET_QOSET`
pub fn poset_qoset() -> @kernel.Thm {
  poset_qoset_c.get()
}

///|
/// TOSET
fn step_43() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([]))
  let t85 = @tactics.then_tac(@simp.rewrite_tac(@list.List([toset()])), t84)
  toset_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) == ((∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y) && (∀ x : A, ∀ y : A, IN(x, fld(l)) && IN(y, fld(l)) → l(x, y) || l(y, x)))"),
      t85,
    ),
  )
}

///|
let toset_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET")

///|
/// `TOSET`
pub fn toset_v1() -> @kernel.Thm {
  toset_v1_c.get()
}

///|
/// TOSET_POSET
fn step_44() -> Unit raise {
  let t86 = @simp.rewrite_tac(
    @list.List([toset(), poset(), @equal.gsym(@theorems.conj_assoc())]),
  )
  toset_poset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) == (poset(l) && (∀ x : A, ∀ y : A, IN(x, fld(l)) && IN(y, fld(l)) → l(x, y) || l(y, x)))"),
      t86,
    ),
  )
}

///|
let toset_poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_POSET")

///|
/// `TOSET_POSET`
pub fn toset_poset() -> @kernel.Thm {
  toset_poset_c.get()
}

///|
/// WOSET_TOSET
fn step_45() -> Unit raise {
  let t87 = @simp.rewrite_tac(
    @list.List([woset(), toset(), @equal.gsym(@theorems.conj_assoc())]),
  )
  woset_toset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) == (toset(l) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) → (∃ x : A, IN(x, s) && (∀ y : A, IN(y, s) → l(x, y)))))"),
      t87,
    ),
  )
}

///|
let woset_toset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TOSET")

///|
/// `WOSET_TOSET`
pub fn woset_toset() -> @kernel.Thm {
  woset_toset_c.get()
}

///|
/// WQOSET
fn step_46() -> Unit raise {
  let t97 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t93 = @term_syntax.parse_term("{(x : A)}")
  let t96 = @tactics.first_x_assum(fn(
    x95 : @kernel.Thm,
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
      x90 : @kernel.Thm,
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
      let s91 = @tactics.mp_tac(x90)
      fn(
        x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s91(x92)
      }
    })(((x94 : @kernel.Thm) => @bool.spec(t93, x94))(x95))
  })
  let t89 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t88 = @simp.asm_rewrite_tac(@list.List([]))
  let t98 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @simp.rewrite_tac(@list.List([wqoset()])),
                ),
                @tactics.eq_tac,
              ),
              @tactics.strip_tac,
            ),
            t88,
          ),
          t89,
        ),
        @tactics.disch_tac,
      ),
      t96,
    ),
    t97,
  )
  wqoset_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, wqoset(l) == ((∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && l(y, z) → l(x, z)) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ y : A, IN(y, s) → (∃ x : A, IN(x, t) && l(x, y))))))"),
      t98,
    ),
  )
}

///|
let wqoset_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET")

///|
/// `WQOSET`
pub fn wqoset_v1() -> @kernel.Thm {
  wqoset_v1_c.get()
}

///|
/// WQOSET_QOSET
fn step_47() -> Unit raise {
  let t99 = @simp.rewrite_tac(
    @list.List([wqoset(), qoset(), @equal.gsym(@theorems.conj_assoc())]),
  )
  wqoset_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ y : A, IN(y, s) → (∃ x : A, IN(x, t) && l(x, y))))))"),
      t99,
    ),
  )
}

///|
let wqoset_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET_QOSET")

///|
/// `WQOSET_QOSET`
pub fn wqoset_qoset() -> @kernel.Thm {
  wqoset_qoset_c.get()
}

///|
/// WOSET_POSET
fn step_48() -> Unit raise {
  let t110 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t106 = @term_syntax.parse_term("{(x : A), (y : A)}")
  let t109 = @tactics.first_x_assum(fn(
    x108 : @kernel.Thm,
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
      x103 : @kernel.Thm,
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
      let s104 = @tactics.mp_tac(x103)
      fn(
        x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s104(x105)
      }
    })(((x107 : @kernel.Thm) => @bool.spec(t106, x107))(x108))
  })
  let t101 = @term_syntax.parse_term("(y : A)")
  let t102 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t101]),
  )
  let t100 = @simp.asm_rewrite_tac(@list.List([]))
  let t111 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @simp.rewrite_tac(@list.List([woset(), poset()])),
                ),
                @tactics.eq_tac,
              ),
              @tactics.strip_tac,
            ),
            t100,
          ),
          t102,
        ),
        @tactics.strip_tac,
      ),
      t109,
    ),
    t110,
  )
  woset_poset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) == (poset(l) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) → (∃ x : A, IN(x, s) && (∀ y : A, IN(y, s) → l(x, y)))))"),
      t111,
    ),
  )
}

///|
let woset_poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_POSET")

///|
/// `WOSET_POSET`
pub fn woset_poset() -> @kernel.Thm {
  woset_poset_c.get()
}

///|
/// WOSET
fn step_49() -> Unit raise {
  let t134 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t133 = @simp.rewrite_tac(@list.List([fld()]))
  let t129 = @term_syntax.parse_term("{(x : A), (y : A), (z : A)}")
  let t132 = @tactics.first_x_assum(fn(
    x131 : @kernel.Thm,
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
      x126 : @kernel.Thm,
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
      let s127 = @tactics.mp_tac(x126)
      fn(
        x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s127(x128)
      }
    })(((x130 : @kernel.Thm) => @bool.spec(t129, x130))(x131))
  })
  let t124 = @term_syntax.parse_term("(z : A)")
  let t125 = @term_syntax.parse_term("(y : A)")
  let t135 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(x : A)"), t125, t124]),
          ),
          @tactics.strip_tac,
        ),
        t132,
      ),
      t133,
    ),
    t134,
  )
  let t123 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t119 = @term_syntax.parse_term("{(x : A), (y : A)}")
  let t122 = @tactics.first_x_assum(fn(
    x121 : @kernel.Thm,
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
      x116 : @kernel.Thm,
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
      let s117 = @tactics.mp_tac(x116)
      fn(
        x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s117(x118)
      }
    })(((x120 : @kernel.Thm) => @bool.spec(t119, x120))(x121))
  })
  let t115 = @term_syntax.parse_term("(y : A)")
  let t136 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          @tactics.x_gen_tac,
          @list.List([@term_syntax.parse_term("(x : A)"), t115]),
        ),
        @tactics.strip_tac,
      ),
      t122,
    ),
    t123,
  )
  let t137 = @list.List([@meson.meson_tac(@list.List([])), t136, t135])
  let t114 = @tactics.repeat_tac(@tactics.conj_tac)
  let t113 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("((r : Bool) → (p : Bool)) && r && (q : Bool) → p && q && r")),
  )
  let t112 = @simp.asm_rewrite_tac(@list.List([]))
  let t138 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(@list.List([woset()])),
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t112,
        ),
        t113,
      ),
      t114,
    ),
    t137,
  )
  woset_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) == ((∀ x : A, ∀ y : A, l(x, y) && l(y, x) → x == y) && (∀ s : (A) -> Bool, SUBSET(s, fld(l)) && !(s == {}) → (∃ x : A, IN(x, s) && (∀ y : A, IN(y, s) → l(x, y)))))"),
      t138,
    ),
  )
}

///|
let woset_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET")

///|
/// `WOSET`
pub fn woset_v1() -> @kernel.Thm {
  woset_v1_c.get()
}

///|
/// WOSET_WF
fn step_50() -> Unit raise {
  let t168 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t167 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([fld()])))
  let t166 = @simp.rewrite_tac(@list.List([fld()]))
  let t162 = @term_syntax.parse_term("{(x : A) | IN(x, fld((l : (A, A) -> Bool))) && (P : (A) -> Bool)(x)}")
  let t165 = @tactics.first_x_assum(fn(
    x164 : @kernel.Thm,
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
      x159 : @kernel.Thm,
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
      let s160 = @tactics.mp_tac(x159)
      fn(
        x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s160(x161)
      }
    })(((x163 : @kernel.Thm) => @bool.spec(t162, x163))(x164))
  })
  let t169 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)")),
            @tactics.disch_tac,
          ),
          t165,
        ),
        t166,
      ),
      t167,
    ),
    t168,
  )
  let t158 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t154 = @term_syntax.parse_term("(x : A) => IN(x, (s : (A) -> Bool))")
  let t157 = @tactics.first_x_assum(fn(
    x156 : @kernel.Thm,
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
      x151 : @kernel.Thm,
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
      let s152 = @tactics.mp_tac(x151)
      fn(
        x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s152(x153)
      }
    })(((x155 : @kernel.Thm) => @bool.spec(t154, x155))(x156))
  })
  let t170 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)")),
          @tactics.strip_tac,
        ),
        t157,
      ),
      t158,
    ),
    t169,
  ])
  let t150 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t148 = @meson.meson_tac(@list.List([]))
  let t146 = @drule.match_mp(@wf.wf_antisym())
  let t149 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x147 : @kernel.Thm,
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
          x143 : @kernel.Thm,
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
          let s144 = @tactics.mp_tac(x143)
          fn(
            x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s144(x145)
          }
        })(t146(x147))
      }),
      t148,
    ),
    @tactics.disch_tac,
  ])
  let t142 = @simp.rewrite_tac(@list.List([properly()]))
  let t141 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool)) && (q → p == (r : Bool)) → (q && r) == p"),
    ),
  )
  let t139 = @tactics.then_tac(
    @tactics.disch_tac,
    @simp.rewrite_tac(@list.List([woset_v1()])),
  )
  let t140 = @list.List([@simp.simp_tac(@list.List([woset()])), t139])
  let t171 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.gen_tac,
                        @tactics.match_mp_tac(
                          @class.taut(
                            @term_syntax.parse_term("((p : Bool) → (q : Bool)) && (q → p == (r : Bool)) → p == (q && r)"),
                          ),
                        ),
                      ),
                      @tactics.conj_tac,
                    ),
                    t140,
                  ),
                  t141,
                ),
                t142,
              ),
              @tactics.conj_tac,
            ),
            t149,
          ),
          t150,
        ),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t170,
  )
  woset_wf_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) == ((∀ x : A, ∀ y : A, IN(x, fld(l)) && IN(y, fld(l)) → l(x, y) || l(y, x)) && WF(properly(l)))"),
      t171,
    ),
  )
}

///|
let woset_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_WF")

///|
/// `WOSET_WF`
pub fn woset_wf() -> @kernel.Thm {
  woset_wf_c.get()
}

///|
/// WOSET_IMP_WQOSET
fn step_51() -> Unit raise {
  let t188 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t187 = @simp.asm_rewrite_tac(@list.List([@sets.finite_sing()]))
  let t186 = @tactics.exists_tac(@term_syntax.parse_term("{(x : A)}"))
  let t185 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(@tactics.strip_assume_tac),
  )
  let t184 = @simp.asm_rewrite_tac(@list.List([]))
  let t180 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t183 = @tactics.first_x_assum(fn(
    x182 : @kernel.Thm,
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
      x177 : @kernel.Thm,
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
      let s178 = @tactics.mp_tac(x177)
      fn(
        x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s178(x179)
      }
    })(((x181 : @kernel.Thm) => @bool.spec(t180, x181))(x182))
  })
  let t176 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@sets.finite_empty(), @sets.subset_empty()]),
    ),
    @tactics.all_tac,
  ])
  let t175 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t174 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t173 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t172 = @simp.asm_rewrite_tac(@list.List([]))
  let t189 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.gen_tac,
                              @simp.rewrite_tac(@list.List([woset(), wqoset()])),
                            ),
                            @tactics.strip_tac,
                          ),
                          t172,
                        ),
                        t173,
                      ),
                      @tactics.disch_tac,
                    ),
                    t174,
                  ),
                  t175,
                ),
                t176,
              ),
              t183,
            ),
            t184,
          ),
          t185,
        ),
        t186,
      ),
      t187,
    ),
    t188,
  )
  woset_imp_wqoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → wqoset(l)"),
      t189,
    ),
  )
}

///|
let woset_imp_wqoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_IMP_WQOSET",
)

///|
/// `WOSET_IMP_WQOSET`
pub fn woset_imp_wqoset() -> @kernel.Thm {
  woset_imp_wqoset_c.get()
}

///|
/// WQOSET_SUPERSET
fn step_52() -> Unit raise {
  let t200 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t196 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t199 = @tactics.first_x_assum(fn(
    x198 : @kernel.Thm,
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
      x193 : @kernel.Thm,
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
      let s194 = @tactics.mp_tac(x193)
      fn(
        x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s194(x195)
      }
    })(((x197 : @kernel.Thm) => @bool.spec(t196, x197))(x198))
  })
  let t192 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @simp.rewrite_tac(@list.List([wqoset_qoset()]))
  let t201 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t190),
            @tactics.strip_tac,
          ),
          t191,
        ),
        t192,
      ),
      t199,
    ),
    t200,
  )
  wqoset_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, wqoset(l) && qoset(m) && SUBSET(fld(m), fld(l)) && (∀ x : A, ∀ y : A, l(x, y) → m(x, y)) → wqoset(m)"),
      t201,
    ),
  )
}

///|
let wqoset_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_SUPERSET",
)

///|
/// `WQOSET_SUPERSET`
pub fn wqoset_superset() -> @kernel.Thm {
  wqoset_superset_c.get()
}

///|
let wqoset_nobad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET_NOBAD")

///|
/// `WQOSET_NOBAD`
pub fn wqoset_nobad() -> @kernel.Thm {
  wqoset_nobad_c.get()
}

///|
let wqoset_nobad_subseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_NOBAD_SUBSEQ",
)

///|
/// `WQOSET_NOBAD_SUBSEQ`
pub fn wqoset_nobad_subseq() -> @kernel.Thm {
  wqoset_nobad_subseq_c.get()
}

///|
let wqoset_antichain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_ANTICHAIN",
)

///|
/// `WQOSET_ANTICHAIN`
pub fn wqoset_antichain() -> @kernel.Thm {
  wqoset_antichain_c.get()
}

///|
/// WQOSET_NOBAD, WQOSET_NOBAD_SUBSEQ, WQOSET_ANTICHAIN
fn step_53() -> Unit raise {
  let t394 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t393 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t390 = @simp.rewrite_tac(
    @list.List([@sets.num_infinite(), @sets.in_univ()]),
  )
  let t389 = @tactics.match_mp_tac(@sets.infinite_image())
  let t391 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@sets.infinite())])),
      t389,
    ),
    t390,
  )
  let t388 = @simp.rewrite_tac(@list.List([@sets.pairwise(), @sets.in_univ()]))
  let t387 = @simp.rewrite_tac(@list.List([@sets.pairwise_image()]))
  let t386 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t392 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.first_x_assum(@tactics.match_mp_tac),
            @tactics.conj_tac,
          ),
          t386,
        ),
        t387,
      ),
      t388,
    ),
    t391,
  ])
  let t385 = @tactics.subgoal_then(
    @term_syntax.parse_term("FINITE(IMAGE((x : (Num) -> A), UNIV))"),
    fn(
      x382 : @kernel.Thm,
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
      let s383 = @tactics.mp_tac(x382)
      fn(
        x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s383(x384)
      }
    },
  )
  let t381 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : (Num) -> A)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t380 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t395 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([
                  @sets.in_diff(),
                  @sets.unions_gspec(),
                  @sets.in_elim_thm(),
                ]),
              ),
              t380,
            ),
            t381,
          ),
          t385,
        ),
        t392,
      ),
      t393,
    ),
    t394,
  )
  let t379 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t378 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t377 = @simp.asm_rewrite_tac(@list.List([strictly()]))
  let t374 = @simp.gen_rewrite_rule(
    fn(
      x373 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x373
    },
    @list.List([@wf.wf()]),
  )
  let t370 = @term_syntax.parse_term("(y : A) => IN(y, (s : (A) -> Bool)) && (∀ m : Num, m < (n : Num) → !(l : (A, A) -> Bool)((x : (Num) -> A)(m), y))")
  let t376 = @tactics.first_x_assum(fn(
    x375 : @kernel.Thm,
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
      x372 : @kernel.Thm,
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
        x367 : @kernel.Thm,
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
        let s368 = @tactics.mp_tac(x367)
        fn(
          x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s368(x369)
        }
      })(((x371 : @kernel.Thm) => @bool.spec(t370, x371))(x372))
    })(t374(x375))
  })
  let t366 = @simp.asm_simp_tac(
    @list.List([@sets.forall_in_image(), @sets.in_elim_thm()]),
  )
  let t365 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)")),
    ]),
  )
  let t364 = @simp.simp_tac(
    @list.List([@sets.finite_image(), @sets.finite_numseg_lt()]),
  )
  let t360 = @term_syntax.parse_term("IMAGE((x : (Num) -> A), {(m : Num) | m < (n : Num)})")
  let t363 = @tactics.first_x_assum(fn(
    x362 : @kernel.Thm,
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
      x357 : @kernel.Thm,
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
      let s358 = @tactics.mp_tac(x357)
      fn(
        x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s358(x359)
      }
    })(((x361 : @kernel.Thm) => @bool.spec(t360, x361))(x362))
  })
  let t356 = @tactics.disch_then(fn(
    x353 : @kernel.Thm,
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
    let s354 = ((x352 : @kernel.Thm) => @tactics.label_tac("*", x352))(x353)
    fn(
      x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s354(x355)
    }
  })
  let t351 = @simp.rewrite_tac(
    @list.List([@sets.in_diff(), @sets.in_elim_thm()]),
  )
  let t349 = @term_syntax.parse_term("(n : Num)")
  let t350 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : (Num) -> A)"), t349]),
  )
  let t348 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t347 = @simp.rewrite_tac(@list.List([@sets.unions_gspec()]))
  let t396 = @list.List([
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
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.match_mp_tac(
                                    @drule.match_mp(@wf.wf_rec_exists())(
                                      @wf.wf_num(),
                                    ),
                                  ),
                                  t347,
                                ),
                                @tactics.conj_tac,
                              ),
                              t348,
                            ),
                            t350,
                          ),
                          t351,
                        ),
                        t356,
                      ),
                      t363,
                    ),
                    t364,
                  ),
                  t365,
                ),
                t366,
              ),
              @tactics.disch_tac,
            ),
            t376,
          ),
          t377,
        ),
        t378,
      ),
      t379,
    ),
    t395,
  ])
  let t346 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : (Num) -> A, ∀ n : Num, IN(x(n), DIFF((s : (A) -> Bool), UNIONS({{(y : A) | (l : (A, A) -> Bool)(x((m : Num)), y)} | m < n}))) && (∀ z : A, IN(z, DIFF(s, UNIONS({{(y : A) | l(x((m : Num)), y)} | m < n}))) → !(l(z, x(n)) && !l(x(n), z)))"),
    fn(
      x343 : @kernel.Thm,
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
      let s344 = @tactics.mp_tac(x343)
      fn(
        x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s344(x345)
      }
    },
  )
  let t342 = @simp.gen_rewrite_tac(
    fn(
      x341 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x335 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s336 = @equal.rand_conv(x335)
        fn(x337 : @kernel.Term) -> @kernel.Thm raise { s336(x337) }
      })(
        (fn(
          x338 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s339 = @equal.top_depth_conv(x338)
          fn(x340 : @kernel.Term) -> @kernel.Thm raise { s339(x340) }
        })(x341),
      )
    },
    @list.List([
      @class.not_forall_thm(),
      @class.not_imp(),
      @class.not_exists_thm(),
    ]),
  )
  let t334 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)) == !(∀ x : _, P(x) && Q(x) → !R(x))"),
      ),
    ]),
  )
  let t397 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.strip_tac,
                @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)")),
              ),
              @tactics.disch_tac,
            ),
            t334,
          ),
          t342,
        ),
        @tactics.disch_tac,
      ),
      t346,
    ),
    t396,
  )
  let t331 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_ne()]))
  let t326 = @term_syntax.parse_term("(x : (Num) -> A)((r : (Num) -> Num)(SUC((n : Num))))")
  let t327 = @list.List([@term_syntax.parse_term("(x : (Num) -> A)((r : (Num) -> Num)((n : Num)))"), t326])
  let t330 = @tactics.disch_then(fn(
    x329 : @kernel.Thm,
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
      x323 : @kernel.Thm,
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
      let s324 = @tactics.mp_tac(x323)
      fn(
        x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s324(x325)
      }
    })(((x328 : @kernel.Thm) => @bool.specl(t327, x328))(x329))
  })
  let t320 = @simp.gen_rewrite_rule(
    fn(
      x319 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x319
    },
    @list.List([@sets.pairwise()]),
  )
  let t322 = @tactics.first_x_assum(fn(
    x321 : @kernel.Thm,
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
      x316 : @kernel.Thm,
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
      let s317 = @tactics.mp_tac(x316)
      fn(
        x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s317(x318)
      }
    })(t320(x321))
  })
  let t315 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.ants_tac,
      @list.List([@int.arith_tac, @tactics.disch_tac]),
    ),
  )
  let t309 = @term_syntax.parse_term("SUC((n : Num))")
  let t310 = @list.List([@term_syntax.parse_term("(n : Num)"), t309])
  let t313 = @tactics.conjuncts_then(fn(
    x312 : @kernel.Thm,
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
      x306 : @kernel.Thm,
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
      let s307 = @tactics.mp_tac(x306)
      fn(
        x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s307(x308)
      }
    })(((x311 : @kernel.Thm) => @bool.specl(t310, x311))(x312))
  })
  let t314 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : (Num) -> Num)"))(t313),
  )
  let t305 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t304 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t300 = @term_syntax.parse_term("(x : (Num) -> A)")
  let t303 = @tactics.first_x_assum(fn(
    x302 : @kernel.Thm,
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
      x297 : @kernel.Thm,
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
      let s298 = @tactics.mp_tac(x297)
      fn(
        x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s298(x299)
      }
    })(((x301 : @kernel.Thm) => @bool.spec(t300, x301))(x302))
  })
  let t296 = @tactics.repeat_tac(@tactics.strip_tac)
  let t295 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t294 = @simp.rewrite_tac(
    @list.List([@sets.injective_alt(), @theorems.left_imp_exists_thm()]),
  )
  let t293 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.infinite()]))(
        @sets.infinite_enumerate_subset(),
      ),
    ]),
  )
  let t292 = @simp.gen_rewrite_tac(
    fn(
      x291 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x291
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t332 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.x_gen_tac(
                                @term_syntax.parse_term("(s : (A) -> Bool)"),
                              ),
                              t292,
                            ),
                            t293,
                          ),
                          t294,
                        ),
                        t295,
                      ),
                      t296,
                    ),
                    t303,
                  ),
                  t304,
                ),
                @tactics.conj_tac,
              ),
              t305,
            ),
            t314,
          ),
          t315,
        ),
        t322,
      ),
      t330,
    ),
    t331,
  )
  let t288 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)")),
      @arith.lt_imp_le(),
    ]),
  )
  let t287 = @simp.rewrite_tac(
    @list.List([fld(), @sets.in_elim_thm(), @class.not_imp()]),
  )
  let t284 = @term_syntax.parse_term("(x : (Num) -> A)")
  let t289 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
        x286 : @kernel.Thm,
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
          x281 : @kernel.Thm,
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
          let s282 = @tactics.mp_tac(x281)
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
            s282(x283)
          }
        })(((x285 : @kernel.Thm) => @bool.spec(t284, x285))(x286))
      }),
      t287,
    ),
    t288,
  )
  let t280 = @meson.asm_meson_tac(@list.List([]))
  let t290 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(@arith.transitive_stepwise_lt()),
      t280,
    ),
    t289,
  ])
  let t279 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (l : (A, A) -> Bool)((x : (Num) -> A)(n), x(m)) && !l(x(m), x(n))"),
    fn(
      x276 : @kernel.Thm,
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
      let s277 = @tactics.assume_tac(x276)
      fn(
        x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s277(x278)
      }
    },
  )
  let t275 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t333 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @wf.wf_dchain(),
                strictly(),
                @class.not_exists_thm(),
                @theorems.forall_and_thm(),
              ]),
            ),
            t275,
          ),
          @tactics.strip_tac,
        ),
        t279,
      ),
      t290,
    ),
    t332,
  ])
  let t398 = @tactics.thenl(
    @tactics.then_tac(@tactics.disch_tac, @tactics.conj_tac),
    t333,
  )
  let t270 = @meson.asm_meson_tac(@list.List([]))
  let t269 = @simp.asm_rewrite_tac(@list.List([]))
  let t271 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@arith.transitive_stepwise_le()),
      t269,
    ),
    t270,
  )
  let t268 = @simp.asm_rewrite_tac(@list.List([@arith.lt_add_rcancel()]))
  let t272 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(@arith.transitive_stepwise_lt()),
        t268,
      ),
      @int.arith_tac,
    ),
    t271,
  ])
  let t267 = @simp.rewrite_tac(@list.List([]))
  let t266 = @tactics.exists_tac(
    @term_syntax.parse_term("(i : Num) => (t : (Num) -> Num)(i) + ((p : Num) + 1)"),
  )
  let t265 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (Num) -> Num)"))
  let t273 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])),
              t265,
            ),
            @tactics.strip_tac,
          ),
          t266,
        ),
        t267,
      ),
      @tactics.conj_tac,
    ),
    t272,
  )
  let t264 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac),
  ])
  let t263 = @tactics.repeat_tac(@tactics.strip_tac)
  let t262 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool)) && (p → (r : Bool) == (s : Bool)) → p && r → q && s"),
    ),
  )
  let t261 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t260 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t259 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("∀ p : Num, (∀ m : Num, (P : (Num) -> Bool)(m) → (Q : (Num) -> Bool)(m - (p + 1))) → (∃ m : Num, P(m)) → (∃ m : Num, Q(m))"),
    ),
  )
  let t258 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @class.not_imp(),
      @int.arith_rule(@term_syntax.parse_term("!((n : Num) + ((p : Num) + 1) <= p)")),
    ]),
  )
  let t254 = @term_syntax.parse_term("(n : Num) + ((p : Num) + 1)")
  let t252 = @simp.gen_rewrite_rule(
    fn(
      x251 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x251
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t257 = @tactics.first_x_assum(fn(
    x256 : @kernel.Thm,
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
      x253 : @kernel.Thm,
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
        x248 : @kernel.Thm,
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
        let s249 = @tactics.mp_tac(x248)
        fn(
          x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s249(x250)
        }
      })(t252(x253))
    })(((x255 : @kernel.Thm) => @bool.spec(t254, x255))(x256))
  })
  let t247 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t246 = @simp.rewrite_tac(@list.List([]))
  let t274 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.match_mp_tac(@arith.dependent_choice()),
                          t246,
                        ),
                        t247,
                      ),
                      t257,
                    ),
                    t258,
                  ),
                  t259,
                ),
                t260,
              ),
              t261,
            ),
            t262,
          ),
          t263,
        ),
        t264,
      ),
      @int.asm_arith_tac,
    ),
    t273,
  ])
  let t245 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ t : (Num) -> Num, (∀ n : Num, true) && (∀ n : Num, t(n) < t(SUC(n)) && (l : (A, A) -> Bool)((x : (Num) -> A)(t(n) + ((p : Num) + 1)), x(t(SUC(n)) + (p + 1))))"),
    fn(
      x242 : @kernel.Thm,
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
      let s243 = @tactics.mp_tac(x242)
      fn(
        x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s243(x244)
      }
    },
  )
  let t239 = @term_syntax.parse_term("(p : Num)")
  let t241 = @tactics.disch_then((x240 : @kernel.Thm) => {
    @tactics.x_choose_tac(t239, x240)
  })
  let t237 = @simp.rewrite_tac(
    @list.List([@sets.infinite(), @sets.num_finite(), @sets.in_elim_thm()]),
  )
  let t236 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t235 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t231 = @term_syntax.parse_term("o((x : (Num) -> A), (r : (Num) -> Num))")
  let t234 = @tactics.first_x_assum(fn(
    x233 : @kernel.Thm,
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
      x228 : @kernel.Thm,
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
      let s229 = @tactics.mp_tac(x228)
      fn(
        x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s229(x230)
      }
    })(((x232 : @kernel.Thm) => @bool.spec(t231, x232))(x233))
  })
  let t227 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (Num) -> Num)"))
  let t238 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([
                  @sets.infinite_enumerate_eq(),
                  @class.not_exists_thm(),
                ]),
              ),
              t227,
            ),
            @tactics.strip_tac,
          ),
          t234,
        ),
        t235,
      ),
      t236,
    ),
    t237,
  ])
  let t226 = @tactics.subgoal_then(
    @term_syntax.parse_term("!INFINITE({(n : Num) | ∀ p : Num, n < p → !(l : (A, A) -> Bool)((x : (Num) -> A)(n), x(p))})"),
    fn(
      x223 : @kernel.Thm,
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
      let s224 = @tactics.mp_tac(x223)
      fn(
        x225 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s224(x225)
      }
    },
  )
  let t399 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_tac,
                @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)")),
              ),
              @tactics.disch_tac,
            ),
            t226,
          ),
          t238,
        ),
        t241,
      ),
      t245,
    ),
    t274,
  )
  let t222 = @meson.asm_meson_tac(@list.List([@arith.lt_suc_le()]))
  let t221 = @simp.rewrite_tac(@list.List([@sets.num_finite()]))
  let t220 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_image(),
      @sets.exists_in_image(),
      @sets.subset_univ(),
      @sets.in_univ(),
    ]),
  )
  let t218 = @simp.rewrite_tac(@list.List([@sets.exists_finite_subset_image()]))
  let t219 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t218])
  let t214 = @term_syntax.parse_term("IMAGE((x : (Num) -> A), UNIV)")
  let t217 = @tactics.first_x_assum(fn(
    x216 : @kernel.Thm,
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
      x211 : @kernel.Thm,
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
      let s212 = @tactics.mp_tac(x211)
      fn(
        x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s212(x213)
      }
    })(((x215 : @kernel.Thm) => @bool.spec(t214, x215))(x216))
  })
  let t400 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.disch_tac,
                    @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)")),
                  ),
                  @tactics.disch_tac,
                ),
                t217,
              ),
              @tactics.ants_tac,
            ),
            t219,
          ),
          t220,
        ),
        t221,
      ),
      t222,
    ),
    t399,
    t398,
    t397,
  ])
  let t210 = @tactics.repeat_tac(@tactics.conj_tac)
  let t209 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool)) && (q → (r : Bool)) && (r → (s : Bool)) && (s → p) → p == q && p == r && p == s"),
    ),
  )
  let t208 = @simp.asm_rewrite_tac(@list.List([]))
  let t207 = @class.asm_cases_tac(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, ∀ z : A, (l : (A, A) -> Bool)(x, y) && l(y, z) → l(x, z)"),
  )
  let t206 = @simp.asm_rewrite_tac(@list.List([]))
  let t205 = @class.asm_cases_tac(
    @term_syntax.parse_term("∀ x : A, IN(x, fld((l : (A, A) -> Bool))) → l(x, x)"),
  )
  let t204 = @simp.rewrite_tac(
    @list.List([wqoset(), qoset(), antichain(), @theorems.forall_and_thm()]),
  )
  let t203 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : (A, A) -> Bool)"))
  let t401 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                    t203,
                  ),
                  t204,
                ),
                t205,
              ),
              t206,
            ),
            t207,
          ),
          t208,
        ),
        t209,
      ),
      t210,
    ),
    t400,
  )
  let t402 = (
    @term_syntax.parse_term("(∀ l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (∀ x : (Num) -> A, (∀ n : Num, IN(x(n), fld(l))) → (∃ i : Num, ∃ j : Num, i < j && l(x(i), x(j)))))) && (∀ l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (∀ x : (Num) -> A, (∀ n : Num, IN(x(n), fld(l))) → (∃ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && (∀ i : Num, ∀ j : Num, i <= j → l(x(r(i)), x(r(j)))))))) && (∀ l : (A, A) -> Bool, wqoset(l) == (qoset(l) && WF(strictly(l)) && (∀ s : (A) -> Bool, antichain(l, s) → FINITE(s))))"),
    t401,
  )
  match
    @bool.conjuncts_rule(
      (fn(
        x202 : (
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
        @tactics.prove(x202.0, x202.1)
      })(t402),
    ) {
    More(
      wqoset_nobad,
      tail=More(wqoset_nobad_subseq, tail=More(wqoset_antichain, tail=Empty))
    ) => {
      wqoset_nobad_c.set(wqoset_nobad)
      wqoset_nobad_subseq_c.set(wqoset_nobad_subseq)
      wqoset_antichain_c.set(wqoset_antichain)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:347:4")
  }
}

///|
/// WQOSET_IMP_WF
fn step_54() -> Unit raise {
  let t403 = @simp.simp_tac(@list.List([wqoset_antichain()]))
  wqoset_imp_wf_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, wqoset(l) → WF(strictly(l))"),
      t403,
    ),
  )
}

///|
let wqoset_imp_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET_IMP_WF")

///|
/// `WQOSET_IMP_WF`
pub fn wqoset_imp_wf() -> @kernel.Thm {
  wqoset_imp_wf_c.get()
}

///|
/// WQOSET_WF_SUPERSET
fn step_55() -> Unit raise {
  let t404 = @meson.meson_tac(@list.List([wqoset_superset(), wqoset_imp_wf()]))
  wqoset_wf_superset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, wqoset(l) && qoset(m) && SUBSET(fld(m), fld(l)) && (∀ x : A, ∀ y : A, l(x, y) → m(x, y)) → WF(strictly(m))"),
      t404,
    ),
  )
}

///|
let wqoset_wf_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_WF_SUPERSET",
)

///|
/// `WQOSET_WF_SUPERSET`
pub fn wqoset_wf_superset() -> @kernel.Thm {
  wqoset_wf_superset_c.get()
}

///|
/// WQOSET_WF_SUPERSET_EQ
fn step_56() -> Unit raise {
  let t439 = @meson.asm_meson_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("!((n : Num) < (l : Num)) && !((k : Num) < SUC(n)) → !(k < l)"),
      ),
    ]),
  )
  let t437 = @term_syntax.parse_term("(l : Num)")
  let t438 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(k : Num)"), t437]),
  )
  let t436 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)")),
      @class.not_exists_thm(),
    ]),
  )
  let t435 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)"))]),
    ),
    @tactics.all_tac,
  ])
  let t434 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t433 = @tactics.exists_tac(@term_syntax.parse_term("(a : (Num) -> A)"))
  let t432 = @simp.rewrite_tac(@list.List([@wf.wf_dchain(), strictly()]))
  let t431 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.lt_trans(), @arith.lt_cases()])),
    @tactics.all_tac,
  ])
  let t430 = @simp.asm_simp_tac(@list.List([]))
  let t427 = @simp.gen_rewrite_rule(
    fn(
      x426 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x426
    },
    @list.List([qoset()]),
  )
  let t429 = @tactics.first_x_assum(fn(
    x428 : @kernel.Thm,
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
    @tactics.strip_assume_tac(t427(x428))
  })
  let t424 = @tactics.disch_then(fn(
    x421 : @kernel.Thm,
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
    let s422 = @tactics.subst1_tac(x421)
    fn(
      x423 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s422(x423)
    }
  })
  let t420 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t419 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([fld()])))
  let t425 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([fld()])), t419),
      t420,
    ),
    t424,
  ])
  let t418 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(r : Bool) && (r → (p : Bool) && (q : Bool) && (s : Bool)) → p && q && r && s"),
    ),
  )
  let t417 = @simp.simp_tac(@list.List([]))
  let t416 = @simp.rewrite_tac(
    @list.List([qoset(), @class.not_imp(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t412 = @term_syntax.parse_term("(x : A) => (y : A) => (l : (A, A) -> Bool)(x, y) || (∃ i : Num, ∃ j : Num, i < j && l(x, (a : (Num) -> A)(j)) && l(a(i), y))")
  let t415 = @tactics.first_x_assum(fn(
    x414 : @kernel.Thm,
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
      let s410 = @tactics.mp_tac(x409)
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
    })(((x413 : @kernel.Thm) => @bool.spec(t412, x413))(x414))
  })
  let t408 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("!(∀ i : _, ∀ j : _, (P : (_, _) -> Bool)(i, j) → !(Q : (_, _) -> Bool)(i, j)) → (∃ i : _, ∃ j : _, P(i, j) && Q(i, j))"),
    ),
  )
  let t407 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : (Num) -> A)"))
  let t405 = @tactics.then_tac(
    @tactics.strip_tac,
    @simp.asm_rewrite_tac(@list.List([wqoset_nobad()])),
  )
  let t406 = @list.List([
    @meson.meson_tac(
      @list.List([wqoset_wf_superset(), wqoset_imp_qoset(), @sets.subset_refl()]),
    ),
    t405,
  ])
  let t440 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.thenl(
                                                  @tactics.then_tac(
                                                    @tactics.gen_tac, @tactics.eq_tac,
                                                  ),
                                                  t406,
                                                ),
                                                t407,
                                              ),
                                              @tactics.disch_tac,
                                            ),
                                            t408,
                                          ),
                                          @tactics.disch_tac,
                                        ),
                                        t415,
                                      ),
                                      t416,
                                    ),
                                    t417,
                                  ),
                                  t418,
                                ),
                                @tactics.conj_tac,
                              ),
                              t425,
                            ),
                            t429,
                          ),
                          t430,
                        ),
                        @tactics.conj_tac,
                      ),
                      t431,
                    ),
                    t432,
                  ),
                  t433,
                ),
                t434,
              ),
              @tactics.conj_tac,
            ),
            t435,
          ),
          t436,
        ),
        t438,
      ),
      @tactics.strip_tac,
    ),
    t439,
  )
  wqoset_wf_superset_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, wqoset(l) == (qoset(l) && (∀ m : (A, A) -> Bool, qoset(m) && fld(m) == fld(l) && (∀ x : A, ∀ y : A, l(x, y) → m(x, y)) → WF(strictly(m))))"),
      t440,
    ),
  )
}

///|
let wqoset_wf_superset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_WF_SUPERSET_EQ",
)

///|
/// `WQOSET_WF_SUPERSET_EQ`
pub fn wqoset_wf_superset_eq() -> @kernel.Thm {
  wqoset_wf_superset_eq_c.get()
}

///|
/// WOSET_WQOSET
fn step_57() -> Unit raise {
  let t444 = @simp.asm_rewrite_tac(@list.List([]))
  let t443 = @simp.rewrite_tac(@list.List([toset()]))
  let t442 = @simp.simp_tac(
    @list.List([
      woset_wf(),
      properly_eq_strictly(),
      wqoset_imp_wf(),
      toset_imp_poset(),
    ]),
  )
  let t441 = @simp.simp_tac(@list.List([woset_imp_toset(), woset_imp_wqoset()]))
  let t445 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t441,
          ),
          t442,
        ),
        t443,
      ),
      @tactics.strip_tac,
    ),
    t444,
  )
  woset_wqoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) == (toset(l) && wqoset(l))"),
      t445,
    ),
  )
}

///|
let woset_wqoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_WQOSET")

///|
/// `WOSET_WQOSET`
pub fn woset_wqoset() -> @kernel.Thm {
  woset_wqoset_c.get()
}

///|
/// FLD_RESTRICT_QOSET
fn step_58() -> Unit raise {
  let t446 = @sets.set_tac(@list.List([]))
  let t447 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([qoset(), fld()])),
    t446,
  )
  fld_restrict_qoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, qoset(l) → fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}"),
      t447,
    ),
  )
}

///|
let fld_restrict_qoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICT_QOSET",
)

///|
/// `FLD_RESTRICT_QOSET`
pub fn fld_restrict_qoset() -> @kernel.Thm {
  fld_restrict_qoset_c.get()
}

///|
/// FLD_RESTRICT_POSET
fn step_59() -> Unit raise {
  let t448 = @simp.simp_tac(
    @list.List([fld_restrict_qoset(), poset_imp_qoset()]),
  )
  fld_restrict_poset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, poset(l) → fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}"),
      t448,
    ),
  )
}

///|
let fld_restrict_poset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICT_POSET",
)

///|
/// `FLD_RESTRICT_POSET`
pub fn fld_restrict_poset() -> @kernel.Thm {
  fld_restrict_poset_c.get()
}

///|
/// FLD_RESTRICT_TOSET
fn step_60() -> Unit raise {
  let t449 = @simp.simp_tac(
    @list.List([fld_restrict_qoset(), toset_imp_qoset()]),
  )
  fld_restrict_toset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, toset(l) → fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}"),
      t449,
    ),
  )
}

///|
let fld_restrict_toset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICT_TOSET",
)

///|
/// `FLD_RESTRICT_TOSET`
pub fn fld_restrict_toset() -> @kernel.Thm {
  fld_restrict_toset_c.get()
}

///|
/// FLD_RESTRICT_WOSET
fn step_61() -> Unit raise {
  let t450 = @simp.simp_tac(
    @list.List([fld_restrict_qoset(), woset_imp_qoset()]),
  )
  fld_restrict_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, woset(l) → fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}"),
      t450,
    ),
  )
}

///|
let fld_restrict_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICT_WOSET",
)

///|
/// `FLD_RESTRICT_WOSET`
pub fn fld_restrict_woset() -> @kernel.Thm {
  fld_restrict_woset_c.get()
}

///|
/// FLD_RESTRICT_WQOSET
fn step_62() -> Unit raise {
  let t451 = @simp.simp_tac(
    @list.List([fld_restrict_qoset(), wqoset_imp_qoset()]),
  )
  fld_restrict_wqoset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, wqoset(l) → fld((x : A) => (y : A) => P(x) && P(y) && l(x, y)) == {(x : A) | IN(x, fld(l)) && P(x)}"),
      t451,
    ),
  )
}

///|
let fld_restrict_wqoset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICT_WQOSET",
)

///|
/// `FLD_RESTRICT_WQOSET`
pub fn fld_restrict_wqoset() -> @kernel.Thm {
  fld_restrict_wqoset_c.get()
}

///|
/// QOSET_RESTRICT
fn step_63() -> Unit raise {
  let t452 = @sets.set_tac(@list.List([]))
  let t453 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([qoset(), fld()])),
    t452,
  )
  qoset_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, qoset(l) → qoset((x : A) => (y : A) => P(x) && P(y) && l(x, y))"),
      t453,
    ),
  )
}

///|
let qoset_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_RESTRICT")

///|
/// `QOSET_RESTRICT`
pub fn qoset_restrict() -> @kernel.Thm {
  qoset_restrict_c.get()
}

///|
/// POSET_RESTRICT
fn step_64() -> Unit raise {
  let t454 = @sets.set_tac(@list.List([]))
  let t455 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([poset(), fld()])),
    t454,
  )
  poset_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, poset(l) → poset((x : A) => (y : A) => P(x) && P(y) && l(x, y))"),
      t455,
    ),
  )
}

///|
let poset_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_RESTRICT")

///|
/// `POSET_RESTRICT`
pub fn poset_restrict() -> @kernel.Thm {
  poset_restrict_c.get()
}

///|
/// TOSET_RESTRICT
fn step_65() -> Unit raise {
  let t456 = @sets.set_tac(@list.List([]))
  let t457 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([toset(), fld()])),
    t456,
  )
  toset_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, toset(l) → toset((x : A) => (y : A) => P(x) && P(y) && l(x, y))"),
      t457,
    ),
  )
}

///|
let toset_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_RESTRICT")

///|
/// `TOSET_RESTRICT`
pub fn toset_restrict() -> @kernel.Thm {
  toset_restrict_c.get()
}

///|
/// WOSET_RESTRICT
fn step_66() -> Unit raise {
  let t459 = @sets.set_tac(@list.List([]))
  let t458 = @simp.simp_tac(
    @list.List([woset_poset(), fld_restrict_poset(), poset_restrict()]),
  )
  let t460 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t458),
    t459,
  )
  woset_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, woset(l) → woset((x : A) => (y : A) => P(x) && P(y) && l(x, y))"),
      t460,
    ),
  )
}

///|
let woset_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_RESTRICT")

///|
/// `WOSET_RESTRICT`
pub fn woset_restrict() -> @kernel.Thm {
  woset_restrict_c.get()
}

///|
/// WQOSET_RESTRICT
fn step_67() -> Unit raise {
  let t462 = @sets.set_tac(@list.List([]))
  let t461 = @simp.simp_tac(
    @list.List([wqoset_nobad_subseq(), fld_restrict_qoset(), qoset_restrict()]),
  )
  let t463 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t461),
    t462,
  )
  wqoset_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ P : (A) -> Bool, wqoset(l) → wqoset((x : A) => (y : A) => P(x) && P(y) && l(x, y))"),
      t463,
    ),
  )
}

///|
let wqoset_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_RESTRICT",
)

///|
/// `WQOSET_RESTRICT`
pub fn wqoset_restrict() -> @kernel.Thm {
  wqoset_restrict_c.get()
}

///|
let qoset_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_MIN")

///|
/// `QOSET_MIN`
pub fn qoset_min() -> @kernel.Thm {
  qoset_min_c.get()
}

///|
let qoset_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_MAX")

///|
/// `QOSET_MAX`
pub fn qoset_max() -> @kernel.Thm {
  qoset_max_c.get()
}

///|
/// QOSET_MIN, QOSET_MAX
fn step_68() -> Unit raise {
  let t477 = @tactics.asm_tac(@metis.metis_tac)(@list.List([]))
  let t476 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([qoset(), @sets.subset(), fld(), @sets.in_elim_thm()]),
    ),
  )
  let t475 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.not_in_empty(),
      strictly(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && !p)")),
    ]),
  )
  let t474 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t473 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x470 : @kernel.Thm,
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
        let s471 = @tactics.mp_tac(x470)
        fn(
          x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s471(x472)
        }
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t468 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t469 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t468]),
  )
  let t467 = @simp.rewrite_tac(
    @list.List([
      @sets.forall_in_insert(),
      @sets.exists_in_insert(),
      @sets.insert_subset(),
    ]),
  )
  let t466 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @sets.not_insert_empty()]),
  )
  let t465 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t478 = @tactics.then_tac(
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
                          @simp.rewrite_tac(
                            @list.List([
                              @theorems.imp_conj(),
                              @theorems.right_forall_imp_thm(),
                            ]),
                          ),
                          @tactics.conj_tac,
                        ),
                        @tactics.gen_tac,
                      ),
                      @tactics.disch_tac,
                    ),
                    t465,
                  ),
                  t466,
                ),
                t467,
              ),
              t469,
            ),
            t473,
          ),
          t474,
        ),
        t475,
      ),
      t476,
    ),
    t477,
  )
  let t479 = (
    @term_syntax.parse_term("(∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, qoset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → !strictly(l, x, a)))) && (∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, qoset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → !strictly(l, a, x))))"),
    t478,
  )
  let (qoset_min, qoset_max) = @bool.conj_pair(
    (fn(
      x464 : (
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
      @tactics.prove(x464.0, x464.1)
    })(t479),
  )
  qoset_min_c.set(qoset_min)
  qoset_max_c.set(qoset_max)
}

///|
let poset_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_MIN")

///|
/// `POSET_MIN`
pub fn poset_min() -> @kernel.Thm {
  poset_min_c.get()
}

///|
let poset_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_MAX")

///|
/// `POSET_MAX`
pub fn poset_max() -> @kernel.Thm {
  poset_max_c.get()
}

///|
/// POSET_MIN, POSET_MAX
fn step_69() -> Unit raise {
  let t481 = @simp.simp_tac(
    @list.List([
      properly_eq_strictly(),
      qoset_min(),
      qoset_max(),
      poset_imp_qoset(),
    ]),
  )
  let t482 = (
    @term_syntax.parse_term("(∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, poset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → !properly(l, x, a)))) && (∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, poset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → !properly(l, a, x))))"),
    t481,
  )
  let (poset_min, poset_max) = @bool.conj_pair(
    (fn(
      x480 : (
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
      @tactics.prove(x480.0, x480.1)
    })(t482),
  )
  poset_min_c.set(poset_min)
  poset_max_c.set(poset_max)
}

///|
let toset_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_MIN")

///|
/// `TOSET_MIN`
pub fn toset_min() -> @kernel.Thm {
  toset_min_c.get()
}

///|
let toset_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_MAX")

///|
/// `TOSET_MAX`
pub fn toset_max() -> @kernel.Thm {
  toset_max_c.get()
}

///|
/// TOSET_MIN, TOSET_MAX
fn step_70() -> Unit raise {
  let t493 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t492 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([toset()])))
  let t491 = @simp.rewrite_tac(@list.List([properly()]))
  let t490 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t489 = @simp.asm_simp_tac(@list.List([toset_imp_poset()]))
  let t488 = @tactics.disch_then(fn(
    x486 : @kernel.Thm,
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
    let th = x486
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t485 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t484 = @tactics.mp_tac(poset_max())
  let t494 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.conj_tac,
                  @list.List([@tactics.mp_tac(poset_min()), t484]),
                ),
                t485,
              ),
              t488,
            ),
            t489,
          ),
          t490,
        ),
        t491,
      ),
      t492,
    ),
    t493,
  )
  let t495 = (
    @term_syntax.parse_term("(∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, toset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → l(a, x)))) && (∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, toset(l) && FINITE(s) && !(s == {}) && SUBSET(s, fld(l)) → (∃ a : A, IN(a, s) && (∀ x : A, IN(x, s) → l(x, a))))"),
    t494,
  )
  let (toset_min, toset_max) = @bool.conj_pair(
    (fn(
      x483 : (
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
      @tactics.prove(x483.0, x483.1)
    })(t495),
  )
  toset_min_c.set(toset_min)
  toset_max_c.set(toset_max)
}

///|
/// FLD_TRIVIAL
fn step_71() -> Unit raise {
  let t496 = @simp.rewrite_tac(@list.List([fld_eq_empty()]))
  fld_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("fld((x : A) => (y : A) => false) == {}"), t496),
  )
}

///|
let fld_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_TRIVIAL")

///|
/// `FLD_TRIVIAL`
pub fn fld_trivial() -> @kernel.Thm {
  fld_trivial_c.get()
}

///|
/// WOSET_TRIVIAL
fn step_72() -> Unit raise {
  let t497 = @sets.set_tac(@list.List([]))
  let t498 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([woset(), fld_trivial(), @sets.not_in_empty()]),
    ),
    t497,
  )
  woset_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("woset((x : A) => (y : A) => false)"), t498),
  )
}

///|
let woset_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TRIVIAL")

///|
/// `WOSET_TRIVIAL`
pub fn woset_trivial() -> @kernel.Thm {
  woset_trivial_c.get()
}

///|
/// WQOSET_TRIVIAL
fn step_73() -> Unit raise {
  let t499 = @simp.simp_tac(@list.List([woset_imp_wqoset(), woset_trivial()]))
  wqoset_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("wqoset((x : A) => (y : A) => false)"), t499),
  )
}

///|
let wqoset_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET_TRIVIAL")

///|
/// `WQOSET_TRIVIAL`
pub fn wqoset_trivial() -> @kernel.Thm {
  wqoset_trivial_c.get()
}

///|
/// TOSET_TRIVIAL
fn step_74() -> Unit raise {
  let t500 = @simp.simp_tac(@list.List([woset_imp_toset(), woset_trivial()]))
  toset_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("toset((x : A) => (y : A) => false)"), t500),
  )
}

///|
let toset_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_TRIVIAL")

///|
/// `TOSET_TRIVIAL`
pub fn toset_trivial() -> @kernel.Thm {
  toset_trivial_c.get()
}

///|
/// POSET_TRIVIAL
fn step_75() -> Unit raise {
  let t501 = @simp.simp_tac(@list.List([woset_imp_poset(), woset_trivial()]))
  poset_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("poset((x : A) => (y : A) => false)"), t501),
  )
}

///|
let poset_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_TRIVIAL")

///|
/// `POSET_TRIVIAL`
pub fn poset_trivial() -> @kernel.Thm {
  poset_trivial_c.get()
}

///|
/// QOSET_TRIVIAL
fn step_76() -> Unit raise {
  let t502 = @simp.simp_tac(@list.List([woset_imp_qoset(), woset_trivial()]))
  qoset_trivial_c.set(
    @tactics.prove(@term_syntax.parse_term("qoset((x : A) => (y : A) => false)"), t502),
  )
}

///|
let qoset_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_TRIVIAL")

///|
/// `QOSET_TRIVIAL`
pub fn qoset_trivial() -> @kernel.Thm {
  qoset_trivial_c.get()
}

///|
/// FLD_num
fn step_77() -> Unit raise {
  let t503 = @sets.set_tac(@list.List([]))
  let t504 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([fld(), @sets.in_elim_thm(), @arith.le_cases()]),
    ),
    t503,
  )
  fld_num_c.set(@tactics.prove(@term_syntax.parse_term("fld(op_lt_eq) == UNIV"), t504))
}

///|
let fld_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_num")

///|
/// `FLD_num`
pub fn fld_num() -> @kernel.Thm {
  fld_num_c.get()
}

///|
/// WOSET_num
fn step_78() -> Unit raise {
  let t505 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.lt_le()), @class.eta_ax(), @wf.wf_num()]),
  )
  let t506 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        woset_wf(),
        fld(),
        @sets.in_elim_thm(),
        @arith.le_cases(),
        properly(),
      ]),
    ),
    t505,
  )
  woset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("woset(op_lt_eq)"), t506),
  )
}

///|
let woset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_num")

///|
/// `WOSET_num`
pub fn woset_num() -> @kernel.Thm {
  woset_num_c.get()
}

///|
/// WQOSET_num
fn step_79() -> Unit raise {
  let t507 = @simp.simp_tac(@list.List([woset_imp_wqoset(), woset_num()]))
  wqoset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("wqoset(op_lt_eq)"), t507),
  )
}

///|
let wqoset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WQOSET_num")

///|
/// `WQOSET_num`
pub fn wqoset_num() -> @kernel.Thm {
  wqoset_num_c.get()
}

///|
/// TOSET_num
fn step_80() -> Unit raise {
  let t508 = @simp.simp_tac(@list.List([woset_imp_toset(), woset_num()]))
  toset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("toset(op_lt_eq)"), t508),
  )
}

///|
let toset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOSET_num")

///|
/// `TOSET_num`
pub fn toset_num() -> @kernel.Thm {
  toset_num_c.get()
}

///|
/// POSET_num
fn step_81() -> Unit raise {
  let t509 = @simp.simp_tac(@list.List([woset_imp_poset(), woset_num()]))
  poset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("poset(op_lt_eq)"), t509),
  )
}

///|
let poset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_num")

///|
/// `POSET_num`
pub fn poset_num() -> @kernel.Thm {
  poset_num_c.get()
}

///|
/// QOSET_num
fn step_82() -> Unit raise {
  let t510 = @simp.simp_tac(@list.List([woset_imp_qoset(), woset_num()]))
  qoset_num_c.set(
    @tactics.prove(@term_syntax.parse_term("qoset(op_lt_eq)"), t510),
  )
}

///|
let qoset_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QOSET_num")

///|
/// `QOSET_num`
pub fn qoset_num() -> @kernel.Thm {
  qoset_num_c.get()
}

///|
/// QOSET_POINTWISE
fn step_83() -> Unit raise {
  let t526 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t525 = @tactics.exists_tac(@term_syntax.parse_term("(i : K) => (y : A)"))
  let t522 = @term_syntax.parse_term("(y : A)")
  let t524 = @tactics.disch_then((x523 : @kernel.Thm) => {
    @tactics.x_choose_tac(t522, x523)
  })
  let t521 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t520 = @simp.rewrite_tac(@list.List([]))
  let t519 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t518 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t517 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(∀ a : _, (P : ((_) -> _) -> Bool)((i : _) => a) → (Q : (_) -> Bool)(a)) → (∀ a : (_) -> _, P(a)) → (∀ b : _, Q(b))"),
        ),
      ),
      @tactics.gen_tac,
    ),
  )
  let t516 = @tactics.match_mp_tac(@theorems.mono_and())
  let t515 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t514 = @simp.asm_rewrite_tac(
    @list.List([qoset(), fld(), @sets.in_elim_thm()]),
  )
  let t512 = @simp.asm_rewrite_tac(@list.List([]))
  let t513 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty(), qoset()])),
    t512,
  ])
  let t511 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (K) -> Bool) == {}"))
  let t527 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  t511,
                                ),
                                t513,
                              ),
                              t514,
                            ),
                            @tactics.eq_tac,
                          ),
                          t515,
                        ),
                        t516,
                      ),
                      @tactics.conj_tac,
                    ),
                    t517,
                  ),
                  t518,
                ),
                t519,
              ),
              t520,
            ),
            @tactics.conj_tac,
          ),
          t521,
        ),
        t524,
      ),
      t525,
    ),
    t526,
  )
  qoset_pointwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (K) -> Bool, qoset((x : (K) -> A) => (y : (K) -> A) => ∀ i : K, IN(i, s) → l(x(i), y(i))) == (s == {} || qoset(l))"),
      t527,
    ),
  )
}

///|
let qoset_pointwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "QOSET_POINTWISE",
)

///|
/// `QOSET_POINTWISE`
pub fn qoset_pointwise() -> @kernel.Thm {
  qoset_pointwise_c.get()
}

///|
/// FLD_POINTWISE
fn step_84() -> Unit raise {
  let t545 = @simp.asm_simp_tac(@list.List([qoset_pointwise()]))
  let t544 = @tactics.pop_assum(fn(
    x541 : @kernel.Thm,
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
    let s542 = @tactics.mp_tac(x541)
    fn(
      x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s542(x543)
    }
  })
  let t540 = @tactics.disch_then(@tactics.match_mp_tac)
  let t539 = @simp.rewrite_tac(@list.List([]))
  let t533 = @drule.part_match(
    fn(x532 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x532))
    },
    qoset_fld(),
  )
  let t528 = @tactics.repeat_tac(@tactics.strip_tac)
  let t546 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.simp_tac(@list.List([qoset_fld(), @sets.in_elim_thm()])),
              t528,
            ),
            fn(
              x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x535 : @kernel.Term,
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
                    x534 : @kernel.Term,
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
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
                      x529 : @kernel.Thm,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
                      (
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                        @list.List[@kernel.Thm],
                      ) -> @kernel.Thm raise,
                    ) raise) raise {
                      let s530 = @tactics.mp_tac(x529)
                      fn(
                        x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise {
                        s530(x531)
                      }
                    })(t533(x534))
                  })(@equal.lhand(x535))
                })(
                  (fn(
                    x536 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x536.1
                  })(x537),
                )
              })(x538)(x538)
            },
          ),
          t539,
        ),
        t540,
      ),
      t544,
    ),
    t545,
  )
  fld_pointwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (K) -> Bool, qoset(l) → fld((x : (K) -> A) => (y : (K) -> A) => ∀ i : K, IN(i, s) → l(x(i), y(i))) == {(x : (K) -> A) | ∀ i : K, IN(i, s) → IN(x(i), fld(l))}"),
      t546,
    ),
  )
}

///|
let fld_pointwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_POINTWISE")

///|
/// `FLD_POINTWISE`
pub fn fld_pointwise() -> @kernel.Thm {
  fld_pointwise_c.get()
}

///|
/// WQOSET_POINTWISE
fn step_85() -> Unit raise {
  let t576 = @meson.asm_meson_tac(@list.List([@arith.le_lt()]))
  let t575 = @simp.asm_simp_tac(@list.List([@trivia.o_thm()]))
  let t574 = @tactics.exists_tac(
    @term_syntax.parse_term("o((l : (Num) -> Num), (r : (Num) -> Num))"),
  )
  let t573 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : (Num) -> Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t572 = @simp.asm_rewrite_tac(@list.List([]))
  let t568 = @term_syntax.parse_term("(i : Num) => (x : (Num, K) -> A)((l : (Num) -> Num)(i), (a : K))")
  let t571 = @tactics.first_x_assum(fn(
    x570 : @kernel.Thm,
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
      x565 : @kernel.Thm,
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
      let s566 = @tactics.mp_tac(x565)
      fn(
        x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s566(x567)
      }
    })(((x569 : @kernel.Thm) => @bool.spec(t568, x569))(x570))
  })
  let t564 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : (Num) -> Num)"))
  let t563 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t562 = @tactics.disch_then(fn(
    x559 : @kernel.Thm,
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
    let th = x559
    let t561 = @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("(x : (Num, K) -> A)"), th),
    )
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num, K) -> A)")),
        @tactics.strip_tac,
      ),
      t561,
    )
  })
  let t558 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x555 : @kernel.Thm,
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
        let s556 = @tactics.mp_tac(x555)
        fn(
          x557 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s556(x557)
        }
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t554 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_insert(), @theorems.forall_and_thm()]),
  )
  let t551 = @term_syntax.parse_term("(s : (K) -> Bool)")
  let t552 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : K)"), t551]),
  )
  let t550 = @simp.rewrite_tac(@list.List([]))
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => n"))
  let t553 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.not_in_empty()])),
        t549,
      ),
      t550,
    ),
    t552,
  ])
  let t548 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t547 = @simp.asm_simp_tac(
    @list.List([
      qoset_pointwise(),
      fld_pointwise(),
      @sets.in_univ(),
      @sets.in_elim_thm(),
    ]),
  )
  let t577 = @tactics.then_tac(
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
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @simp.rewrite_tac(
                                          @list.List([
                                            @theorems.imp_conj(),
                                            @theorems.right_forall_imp_thm(),
                                            wqoset_nobad_subseq(),
                                          ]),
                                        ),
                                        @tactics.gen_tac,
                                      ),
                                      @tactics.strip_tac,
                                    ),
                                    @tactics.disch_tac,
                                  ),
                                  t547,
                                ),
                                t548,
                              ),
                              @tactics.conj_tac,
                            ),
                            t553,
                          ),
                          t554,
                        ),
                        t558,
                      ),
                      t562,
                    ),
                    t563,
                  ),
                  t564,
                ),
                @tactics.strip_tac,
              ),
              t571,
            ),
            t572,
          ),
          t573,
        ),
        t574,
      ),
      t575,
    ),
    t576,
  )
  wqoset_pointwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (K) -> Bool, wqoset(l) && FINITE(s) → wqoset((x : (K) -> A) => (y : (K) -> A) => ∀ i : K, IN(i, s) → l(x(i), y(i)))"),
      t577,
    ),
  )
}

///|
let wqoset_pointwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WQOSET_POINTWISE",
)

///|
/// `WQOSET_POINTWISE`
pub fn wqoset_pointwise() -> @kernel.Thm {
  wqoset_pointwise_c.get()
}

///|
/// DICKSON
fn step_86() -> Unit raise {
  let t589 = @simp.simp_tac(@list.List([@sets.finite_numseg_lt()]))
  let t588 = @simp.simp_tac(
    @list.List([
      woset_imp_wqoset(),
      woset_num(),
      fld_num(),
      @sets.in_univ(),
      @sets.in_elim_thm(),
    ]),
  )
  let t587 = @simp.simp_tac(
    @list.List([fld_pointwise(), wqoset_imp_qoset(), qoset_pointwise()]),
  )
  let t586 = @simp.gen_rewrite_tac(
    fn(
      x585 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x579 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s580 = @equal.land_conv(x579)
        fn(x581 : @kernel.Term) -> @kernel.Thm raise { s580(x581) }
      })(
        (fn(
          x582 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s583 = @equal.rand_conv(x582)
          fn(x584 : @kernel.Term) -> @kernel.Thm raise { s583(x584) }
        })(x585),
      )
    },
    @list.List([wqoset_nobad()]),
  )
  let t578 = @term_syntax.parse_term("{(m : Num) | m < (n : Num)}")
  let t590 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.mp_tac(
              @bool.ispecl(
                @list.List([@term_syntax.parse_term("op_lt_eq"), t578]),
                wqoset_pointwise(),
              ),
            ),
          ),
          t586,
        ),
        t587,
      ),
      t588,
    ),
    t589,
  )
  dickson_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : (Num, Num) -> Num, ∃ i : Num, ∃ j : Num, i < j && (∀ k : Num, k < n → x(i, k) <= x(j, k))"),
      t590,
    ),
  )
}

///|
let dickson_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DICKSON")

///|
/// `DICKSON`
pub fn dickson() -> @kernel.Thm {
  dickson_c.get()
}

///|
/// Library/wo.ml:733
fn step_87() -> Unit raise {
  @printer.parse_as_infix("inseg", (12L, "right"))
}

///|
/// inseg
fn step_88() -> Unit raise {
  inseg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(inseg : ((A, A) -> Bool, (A, A) -> Bool) -> Bool)((l : (A, A) -> Bool), (m : (A, A) -> Bool)) == (∀ x : A, ∀ y : A, l(x, y) == (m(x, y) && fld(l, y)))"),
    ),
  )
}

///|
let inseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inseg")

///|
/// `inseg`
pub fn inseg() -> @kernel.Thm {
  inseg_c.get()
}

///|
/// INSEG_ANTISYM
fn step_89() -> Unit raise {
  let t592 = @meson.meson_tac(@list.List([]))
  let t591 = @simp.rewrite_tac(@list.List([inseg()]))
  let t593 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
      ),
      t591,
    ),
    t592,
  )
  inseg_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(l, m) && inseg(m, l) → l == m"),
      t593,
    ),
  )
}

///|
let inseg_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_ANTISYM")

///|
/// `INSEG_ANTISYM`
pub fn inseg_antisym() -> @kernel.Thm {
  inseg_antisym_c.get()
}

///|
/// INSEG_REFL
fn step_90() -> Unit raise {
  let t594 = @meson.meson_tac(@list.List([]))
  let t595 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        inseg(),
        @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
      ]),
    ),
    t594,
  )
  inseg_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : (A, A) -> Bool, inseg(l, l)"), t595),
  )
}

///|
let inseg_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_REFL")

///|
/// `INSEG_REFL`
pub fn inseg_refl() -> @kernel.Thm {
  inseg_refl_c.get()
}

///|
/// INSEG_TRANS
fn step_91() -> Unit raise {
  let t596 = @meson.meson_tac(@list.List([]))
  let t597 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        inseg(),
        @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
      ]),
    ),
    t596,
  )
  inseg_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ∀ n : (A, A) -> Bool, inseg(l, m) && inseg(m, n) → inseg(l, n)"),
      t597,
    ),
  )
}

///|
let inseg_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_TRANS")

///|
/// `INSEG_TRANS`
pub fn inseg_trans() -> @kernel.Thm {
  inseg_trans_c.get()
}

///|
/// linseg
fn step_92() -> Unit raise {
  linseg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(linseg : ((A, A) -> Bool, A, A, A) -> Bool)((l : (A, A) -> Bool), (a : A)) == ((x : A) => (y : A) => l(x, y) && properly(l, y, a))"),
    ),
  )
}

///|
let linseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("linseg")

///|
/// `linseg`
pub fn linseg() -> @kernel.Thm {
  linseg_c.get()
}

///|
/// ordinal
fn step_93() -> Unit raise {
  ordinal_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(ordinal : ((A, A) -> Bool) -> Bool)((l : (A, A) -> Bool)) == (woset(l) && (∀ x : A, fld(l, x) → x == select((y : A) => !properly(l, y, x))))"),
    ),
  )
}

///|
let ordinal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ordinal")

///|
/// `ordinal`
pub fn ordinal() -> @kernel.Thm {
  ordinal_c.get()
}

///|
let poset_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_REFL")

///|
/// `POSET_REFL`
pub fn poset_refl() -> @kernel.Thm {
  poset_refl_c.get()
}

///|
let poset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_TRANS")

///|
/// `POSET_TRANS`
pub fn poset_trans() -> @kernel.Thm {
  poset_trans_c.get()
}

///|
let poset_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_ANTISYM")

///|
/// `POSET_ANTISYM`
pub fn poset_antisym() -> @kernel.Thm {
  poset_antisym_c.get()
}

///|
/// POSET_REFL, POSET_TRANS, POSET_ANTISYM
fn step_94() -> Unit raise {
  let t601 = @kernel.assume_rule(@term_syntax.parse_term("poset((l : (A, A) -> Bool))"))
  let t602 = @bool.conjuncts_rule(
    @simp.rewrite_rule(@list.List([poset(), @sets.in_()]))(t601),
  )
  let t598 = @term_syntax.parse_term("(l : (A, A) -> Bool)")
  match
    @lib.map(
      fn(x600 : @kernel.Thm) -> @kernel.Thm raise {
        ((x599 : @kernel.Thm) => @bool.gen(t598, x599))(@bool.disch_all(x600))
      },
      t602,
    ) {
    More(
      poset_refl,
      tail=More(poset_trans, tail=More(poset_antisym, tail=Empty))
    ) => {
      poset_refl_c.set(poset_refl)
      poset_trans_c.set(poset_trans)
      poset_antisym_c.set(poset_antisym)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:770:4")
  }
}

///|
/// POSET_FLDEQ
fn step_95() -> Unit raise {
  let t603 = @meson.meson_tac(
    @list.List([
      poset_refl(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  poset_fldeq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) → (∀ x : A, fld(l, x) == l(x, x))"),
      t603,
    ),
  )
}

///|
let poset_fldeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSET_FLDEQ")

///|
/// `POSET_FLDEQ`
pub fn poset_fldeq() -> @kernel.Thm {
  poset_fldeq_c.get()
}

///|
let woset_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_REFL")

///|
/// `WOSET_REFL`
pub fn woset_refl() -> @kernel.Thm {
  woset_refl_c.get()
}

///|
let woset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TRANS")

///|
/// `WOSET_TRANS`
pub fn woset_trans() -> @kernel.Thm {
  woset_trans_c.get()
}

///|
let woset_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_ANTISYM")

///|
/// `WOSET_ANTISYM`
pub fn woset_antisym() -> @kernel.Thm {
  woset_antisym_c.get()
}

///|
let woset_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TOTAL")

///|
/// `WOSET_TOTAL`
pub fn woset_total() -> @kernel.Thm {
  woset_total_c.get()
}

///|
let woset_well_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_WELL")

///|
/// `WOSET_WELL`
pub fn woset_well() -> @kernel.Thm {
  woset_well_c.get()
}

///|
/// WOSET_REFL, WOSET_TRANS, WOSET_ANTISYM, WOSET_TOTAL, WOSET_WELL
fn step_96() -> Unit raise {
  let t607 = @kernel.assume_rule(@term_syntax.parse_term("woset((l : (A, A) -> Bool))"))
  let t608 = @bool.conjuncts_rule(
    @simp.rewrite_rule(
      @list.List([
        woset(),
        @sets.subset(),
        @equal.gsym(@sets.member_not_empty()),
        @sets.in_(),
      ]),
    )(t607),
  )
  let t604 = @term_syntax.parse_term("(l : (A, A) -> Bool)")
  match
    @lib.map(
      fn(x606 : @kernel.Thm) -> @kernel.Thm raise {
        ((x605 : @kernel.Thm) => @bool.gen(t604, x605))(@bool.disch_all(x606))
      },
      t608,
    ) {
    More(
      woset_refl,
      tail=More(
        woset_trans,
        tail=More(
          woset_antisym,
          tail=More(woset_total, tail=More(woset_well, tail=Empty))
        )
      )
    ) => {
      woset_refl_c.set(woset_refl)
      woset_trans_c.set(woset_trans)
      woset_antisym_c.set(woset_antisym)
      woset_total_c.set(woset_total)
      woset_well_c.set(woset_well)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:778:4")
  }
}

///|
/// WOSET_FLDEQ
fn step_97() -> Unit raise {
  let t609 = @meson.meson_tac(@list.List([woset_imp_poset(), poset_fldeq()]))
  woset_fldeq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ x : A, fld(l, x) == l(x, x))"),
      t609,
    ),
  )
}

///|
let woset_fldeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_FLDEQ")

///|
/// `WOSET_FLDEQ`
pub fn woset_fldeq() -> @kernel.Thm {
  woset_fldeq_c.get()
}

///|
/// WOSET_TRANS_LESS
fn step_98() -> Unit raise {
  let t610 = @meson.meson_tac(@list.List([]))
  let t611 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([woset(), properly()])),
    t610,
  )
  woset_trans_less_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ x : A, ∀ y : A, ∀ z : A, properly(l, x, y) && l(y, z) → properly(l, x, z))"),
      t611,
    ),
  )
}

///|
let woset_trans_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_TRANS_LESS",
)

///|
/// `WOSET_TRANS_LESS`
pub fn woset_trans_less() -> @kernel.Thm {
  woset_trans_less_c.get()
}

///|
/// PAIRED_EXT
fn step_99() -> Unit raise {
  let t612 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  paired_ext_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, B) -> C, ∀ m : (A, B) -> C, (∀ x : A, ∀ y : B, l(x, y) == m(x, y)) == (l == m)"),
      t612,
    ),
  )
}

///|
let paired_ext_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRED_EXT")

///|
/// `PAIRED_EXT`
pub fn paired_ext() -> @kernel.Thm {
  paired_ext_c.get()
}

///|
/// WOSET_TRANS_LE
fn step_100() -> Unit raise {
  let t613 = @meson.meson_tac(@list.List([woset_trans(), woset_antisym()]))
  let t614 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([properly()])),
    t613,
  )
  woset_trans_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ x : A, ∀ y : A, ∀ z : A, l(x, y) && properly(l, y, z) → properly(l, x, z))"),
      t614,
    ),
  )
}

///|
let woset_trans_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TRANS_LE")

///|
/// `WOSET_TRANS_LE`
pub fn woset_trans_le() -> @kernel.Thm {
  woset_trans_le_c.get()
}

///|
/// WOSET_WELL_CONTRAPOS
fn step_101() -> Unit raise {
  let t624 = @meson.asm_meson_tac(@list.List([woset_trans_le(), properly()]))
  let t621 = @drule.match_mp(woset_well())
  let t618 = @term_syntax.parse_term("(P : (A) -> Bool)")
  let t623 = @tactics.first_assum(fn(
    x622 : @kernel.Thm,
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
      x620 : @kernel.Thm,
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
        x615 : @kernel.Thm,
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
        let s616 = @tactics.mp_tac(x615)
        fn(
          x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s616(x617)
        }
      })(((x619 : @kernel.Thm) => @bool.spec(t618, x619))(x620))
    })(t621(x622))
  })
  let t625 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        @tactics.gen_tac,
      ),
      t623,
    ),
    t624,
  )
  woset_well_contrapos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ P : (A) -> Bool, (∀ x : A, P(x) → fld(l, x)) && (∃ x : A, P(x)) → (∃ y : A, P(y) && (∀ z : A, properly(l, z, y) → !P(z))))"),
      t625,
    ),
  )
}

///|
let woset_well_contrapos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_WELL_CONTRAPOS",
)

///|
/// `WOSET_WELL_CONTRAPOS`
pub fn woset_well_contrapos() -> @kernel.Thm {
  woset_well_contrapos_c.get()
}

///|
/// WOSET_TOTAL_LE
fn step_102() -> Unit raise {
  let t626 = @meson.meson_tac(@list.List([woset_refl(), woset_total()]))
  let t627 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([properly()])),
    t626,
  )
  woset_total_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ x : A, ∀ y : A, fld(l, x) && fld(l, y) → l(x, y) || properly(l, y, x))"),
      t627,
    ),
  )
}

///|
let woset_total_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TOTAL_LE")

///|
/// `WOSET_TOTAL_LE`
pub fn woset_total_le() -> @kernel.Thm {
  woset_total_le_c.get()
}

///|
/// WOSET_TOTAL_LT
fn step_103() -> Unit raise {
  let t628 = @meson.meson_tac(@list.List([woset_total()]))
  let t629 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([properly()])),
    t628,
  )
  woset_total_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ x : A, ∀ y : A, fld(l, x) && fld(l, y) → x == y || properly(l, x, y) || properly(l, y, x))"),
      t629,
    ),
  )
}

///|
let woset_total_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WOSET_TOTAL_LT")

///|
/// `WOSET_TOTAL_LT`
pub fn woset_total_lt() -> @kernel.Thm {
  woset_total_lt_c.get()
}

///|
/// ORDINAL_IMP_WOSET
fn step_104() -> Unit raise {
  let t630 = @simp.simp_tac(@list.List([ordinal()]))
  ordinal_imp_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ordinal(l) → woset(l)"),
      t630,
    ),
  )
}

///|
let ordinal_imp_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_IMP_WOSET",
)

///|
/// `ORDINAL_IMP_WOSET`
pub fn ordinal_imp_woset() -> @kernel.Thm {
  ordinal_imp_woset_c.get()
}

///|
/// WOSET_FINITE_TOSET
fn step_105() -> Unit raise {
  let t642 = @meson.asm_meson_tac(@list.List([]))
  let t641 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
      @sets.in_(),
    ]),
  )
  let t640 = @simp.rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t637 = @drule.match_mp(
    @simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(
      @sets.finite_subset(),
    ),
  )
  let t639 = @tactics.first_x_assum(fn(
    x638 : @kernel.Thm,
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
    @tactics.match_mp_tac(t637(x638))
  })
  let t635 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t636 = @list.List([@meson.asm_meson_tac(@list.List([])), t635])
  let t634 = @simp.rewrite_tac(@list.List([]))
  let t633 = @tactics.match_mp_tac(@sets.wf_finite())
  let t632 = @tactics.repeat_tac(@tactics.strip_tac)
  let t631 = @simp.simp_tac(
    @list.List([toset_poset(), woset_wf(), properly(), poset(), @sets.in_()]),
  )
  let t643 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.once_rewrite_tac(
                        @list.List([@equal.gsym(finite_fld())]),
                      ),
                      t631,
                    ),
                    t632,
                  ),
                  t633,
                ),
                t634,
              ),
              @tactics.conj_tac,
            ),
            t636,
          ),
          t639,
        ),
        t640,
      ),
      t641,
    ),
    t642,
  )
  woset_finite_toset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) && FINITE({((x : A), (y : A)) | l(x, y)}) → woset(l)"),
      t643,
    ),
  )
}

///|
let woset_finite_toset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_FINITE_TOSET",
)

///|
/// `WOSET_FINITE_TOSET`
pub fn woset_finite_toset() -> @kernel.Thm {
  woset_finite_toset_c.get()
}

///|
/// UNION_FLD
fn step_106() -> Unit raise {
  let t645 = @meson.meson_tac(@list.List([]))
  let t644 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t646 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t644),
    t645,
  )
  union_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, A) -> Bool) -> Bool, fld((x : A) => (y : A) => ∃ l : (A, A) -> Bool, P(l) && l(x, y), (x : A)) == (∃ l : (A, A) -> Bool, P(l) && fld(l, x))"),
      t646,
    ),
  )
}

///|
let union_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_FLD")

///|
/// `UNION_FLD`
pub fn union_fld() -> @kernel.Thm {
  union_fld_c.get()
}

///|
/// UNION_INSEG
fn step_107() -> Unit raise {
  let t647 = @meson.asm_meson_tac(@list.List([]))
  let t648 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([inseg(), union_fld(), unions_pred()])),
    t647,
  )
  union_inseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, A) -> Bool) -> Bool, ∀ l : (A, A) -> Bool, (∀ m : (A, A) -> Bool, P(m) → inseg(m, l)) → inseg((x : A) => (y : A) => ∃ l : (A, A) -> Bool, P(l) && l(x, y), l)"),
      t648,
    ),
  )
}

///|
let union_inseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_INSEG")

///|
/// `UNION_INSEG`
pub fn union_inseg() -> @kernel.Thm {
  union_inseg_c.get()
}

///|
/// INSEG_SUBSET
fn step_108() -> Unit raise {
  let t650 = @meson.meson_tac(@list.List([]))
  let t649 = @simp.rewrite_tac(@list.List([inseg()]))
  let t651 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t649),
    t650,
  )
  inseg_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) → (∀ x : A, ∀ y : A, m(x, y) → l(x, y))"),
      t651,
    ),
  )
}

///|
let inseg_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_SUBSET")

///|
/// `INSEG_SUBSET`
pub fn inseg_subset() -> @kernel.Thm {
  inseg_subset_c.get()
}

///|
/// INSEG_SUBSET_FLD
fn step_109() -> Unit raise {
  let t652 = @meson.meson_tac(@list.List([inseg_subset()]))
  let t653 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
    ),
    t652,
  )
  inseg_subset_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) → (∀ x : A, fld(m, x) → fld(l, x))"),
      t653,
    ),
  )
}

///|
let inseg_subset_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INSEG_SUBSET_FLD",
)

///|
/// `INSEG_SUBSET_FLD`
pub fn inseg_subset_fld() -> @kernel.Thm {
  inseg_subset_fld_c.get()
}

///|
/// INSEG_FLD_SUBSET
fn step_110() -> Unit raise {
  let t660 = @sets.set_tac(@list.List([]))
  let t657 = @drule.match_mp(inseg_subset_fld())
  let t659 = @tactics.disch_then(fn(
    x658 : @kernel.Thm,
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
      x654 : @kernel.Thm,
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
      let s655 = @tactics.mp_tac(x654)
      fn(
        x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s655(x656)
      }
    })(t657(x658))
  })
  let t661 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t659),
    t660,
  )
  inseg_fld_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(l, m) → SUBSET(fld(l), fld(m))"),
      t661,
    ),
  )
}

///|
let inseg_fld_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INSEG_FLD_SUBSET",
)

///|
/// `INSEG_FLD_SUBSET`
pub fn inseg_fld_subset() -> @kernel.Thm {
  inseg_fld_subset_c.get()
}

///|
/// INSEG_WOSET
fn step_111() -> Unit raise {
  let t674 = @meson.asm_meson_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t673 = @simp.rewrite_tac(
    @list.List([fld(), @sets.subset(), @sets.in_elim_thm()]),
  )
  let t670 = @drule.match_mp(woset_well())
  let t667 = @term_syntax.parse_term("(P : (A) -> Bool)")
  let t672 = @tactics.first_assum(fn(
    x671 : @kernel.Thm,
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
      x669 : @kernel.Thm,
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
        x664 : @kernel.Thm,
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
        let s665 = @tactics.mp_tac(x664)
        fn(
          x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s665(x666)
        }
      })(((x668 : @kernel.Thm) => @bool.spec(t667, x668))(x669))
    })(t670(x671))
  })
  let t675 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)")),
        t672,
      ),
      t673,
    ),
    t674,
  )
  let t676 = @list.List([
    @meson.asm_meson_tac(@list.List([woset_antisym()])),
    t675,
  ])
  let t663 = @simp.rewrite_tac(
    @list.List([
      woset_v1(),
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t662 = @tactics.repeat_tac(@tactics.strip_tac)
  let t677 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([inseg()])), t662),
        t663,
      ),
      @tactics.conj_tac,
    ),
    t676,
  )
  inseg_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) && woset(l) → woset(m)"),
      t677,
    ),
  )
}

///|
let inseg_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_WOSET")

///|
/// `INSEG_WOSET`
pub fn inseg_woset() -> @kernel.Thm {
  inseg_woset_c.get()
}

///|
/// INSEG_ORDINAL
fn step_112() -> Unit raise {
  let t697 = @simp.asm_rewrite_tac(@list.List([properly()]))
  let t696 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([inseg()])))
  let t695 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t694 = @simp.asm_simp_tac(@list.List([]))
  let t691 = @drule.match_mp(inseg_subset_fld())
  let t693 = @tactics.first_assum(fn(
    x692 : @kernel.Thm,
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
      x688 : @kernel.Thm,
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
      let s689 = @tactics.assume_tac(x688)
      fn(
        x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s689(x690)
      }
    })(t691(x692))
  })
  let t684 = @term_syntax.parse_term("(x : A)")
  let t687 = @tactics.first_x_assum(fn(
    x686 : @kernel.Thm,
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
      x681 : @kernel.Thm,
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
      let s682 = @tactics.mp_tac(x681)
      fn(
        x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s682(x683)
      }
    })(((x685 : @kernel.Thm) => @bool.spec(t684, x685))(x686))
  })
  let t680 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t679 = @list.List([
    @meson.asm_meson_tac(@list.List([inseg_woset()])),
    @tactics.all_tac,
  ])
  let t678 = @simp.rewrite_tac(@list.List([ordinal()]))
  let t698 = @tactics.then_tac(
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
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  t678,
                                ),
                                @tactics.strip_tac,
                              ),
                              @tactics.conj_tac,
                            ),
                            t679,
                          ),
                          t680,
                        ),
                        @tactics.disch_tac,
                      ),
                      t687,
                    ),
                    t693,
                  ),
                  t694,
                ),
                t695,
              ),
              @tactics.ap_term_tac,
            ),
            @tactics.ap_term_tac,
          ),
          @tactics.abs_tac,
        ),
        @tactics.ap_term_tac,
      ),
      t696,
    ),
    t697,
  )
  inseg_ordinal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) && ordinal(l) → ordinal(m)"),
      t698,
    ),
  )
}

///|
let inseg_ordinal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_ORDINAL")

///|
/// `INSEG_ORDINAL`
pub fn inseg_ordinal() -> @kernel.Thm {
  inseg_ordinal_c.get()
}

///|
/// LINSEG_INSEG
fn step_113() -> Unit raise {
  let t700 = @meson.asm_meson_tac(@list.List([woset_trans_le()]))
  let t699 = @simp.rewrite_tac(
    @list.List([
      inseg(),
      linseg(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  let t701 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t699),
      pbeta_tac,
    ),
    t700,
  )
  linseg_inseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, woset(l) → inseg(linseg(l, a), l)"),
      t701,
    ),
  )
}

///|
let linseg_inseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINSEG_INSEG")

///|
/// `LINSEG_INSEG`
pub fn linseg_inseg() -> @kernel.Thm {
  linseg_inseg_c.get()
}

///|
/// LINSEG_WOSET
fn step_114() -> Unit raise {
  let t702 = @meson.meson_tac(@list.List([inseg_woset(), linseg_inseg()]))
  linseg_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, woset(l) → woset(linseg(l, a))"),
      t702,
    ),
  )
}

///|
let linseg_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINSEG_WOSET")

///|
/// `LINSEG_WOSET`
pub fn linseg_woset() -> @kernel.Thm {
  linseg_woset_c.get()
}

///|
/// LINSEG_FLD
fn step_115() -> Unit raise {
  let t703 = @meson.meson_tac(
    @list.List([
      woset_refl(),
      woset_trans(),
      woset_antisym(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  let t704 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
          linseg(),
          properly(),
        ]),
      ),
      pbeta_tac,
    ),
    t703,
  )
  linseg_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, ∀ x : A, woset(l) → fld(linseg(l, a), x) == properly(l, x, a)"),
      t704,
    ),
  )
}

///|
let linseg_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINSEG_FLD")

///|
/// `LINSEG_FLD`
pub fn linseg_fld() -> @kernel.Thm {
  linseg_fld_c.get()
}

///|
/// INSEG_PROPER_SUBSET
fn step_116() -> Unit raise {
  let t705 = @meson.meson_tac(@list.List([inseg_subset()]))
  let t706 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(paired_ext())])),
    t705,
  )
  inseg_proper_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) && !(l == m) → (∃ x : A, ∃ y : A, l(x, y) && !m(x, y))"),
      t706,
    ),
  )
}

///|
let inseg_proper_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INSEG_PROPER_SUBSET",
)

///|
/// `INSEG_PROPER_SUBSET`
pub fn inseg_proper_subset() -> @kernel.Thm {
  inseg_proper_subset_c.get()
}

///|
/// INSEG_PROPER_SUBSET_FLD
fn step_117() -> Unit raise {
  let t707 = @meson.meson_tac(
    @list.List([
      inseg_proper_subset(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
      inseg(),
    ]),
  )
  inseg_proper_subset_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, inseg(m, l) && !(l == m) → (∃ a : A, fld(l, a) && !fld(m, a))"),
      t707,
    ),
  )
}

///|
let inseg_proper_subset_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INSEG_PROPER_SUBSET_FLD",
)

///|
/// `INSEG_PROPER_SUBSET_FLD`
pub fn inseg_proper_subset_fld() -> @kernel.Thm {
  inseg_proper_subset_fld_c.get()
}

///|
/// INSEG_LINSEG
fn step_118() -> Unit raise {
  let t744 = @meson.asm_meson_tac(
    @list.List([
      inseg_subset(),
      inseg_subset_fld(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
      woset_total_le(),
      properly(),
      inseg(),
    ]),
  )
  let t743 = @simp.asm_rewrite_tac(@list.List([]))
  let t742 = @tactics.exists_tac(@term_syntax.parse_term("(a : A)"))
  let t741 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac),
  )
  let t740 = @list.List([
    @meson.asm_meson_tac(@list.List([inseg_proper_subset_fld()])),
    @tactics.all_tac,
  ])
  let t727 = @simp.rewrite_tac(
    @list.List([linseg(), @equal.gsym(paired_ext())]),
  )
  let t726 = @simp.rewrite_tac(@list.List([]))
  let t722 = @term_syntax.parse_term("(x : A) => fld((l : (A, A) -> Bool), x) && !fld((m : (A, A) -> Bool), x)")
  let t725 = @tactics.disch_then(fn(
    x724 : @kernel.Thm,
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
      x719 : @kernel.Thm,
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
      let s720 = @tactics.mp_tac(x719)
      fn(
        x721 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s720(x721)
      }
    })(((x723 : @kernel.Thm) => @bool.spec(t722, x723))(x724))
  })
  let t716 = @drule.match_mp(woset_well_contrapos())
  let t718 = @tactics.first_assum(fn(
    x717 : @kernel.Thm,
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
      x713 : @kernel.Thm,
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
      let s714 = @tactics.mp_tac(x713)
      fn(
        x715 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s714(x715)
      }
    })(t716(x717))
  })
  let t712 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([linseg_inseg()])),
  ])
  let t710 = @meson.meson_tac(@list.List([]))
  let t711 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          inseg(),
          @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
        ]),
      ),
      t710,
    ),
    @tactics.all_tac,
  ])
  let t709 = @simp.asm_rewrite_tac(@list.List([]))
  let t708 = @class.asm_cases_tac(@term_syntax.parse_term("(m : (A, A) -> Bool) == (l : (A, A) -> Bool)"))
  let t745 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.repeat_tac(@tactics.strip_tac),
                                    t708,
                                  ),
                                  t709,
                                ),
                                t711,
                              ),
                              @tactics.eq_tac,
                            ),
                            @tactics.strip_tac,
                          ),
                          t712,
                        ),
                        t718,
                      ),
                      t725,
                    ),
                    t726,
                  ),
                  t727,
                ),
                pbeta_tac,
              ),
              fn(
                x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x738 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    x736 : @kernel.Term,
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
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
                      x734 : @kernel.Term,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
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
                        x728 : @kernel.Term,
                      ) -> ((
                        (@kernel.Thm) -> ((
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
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
                          (
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                            @list.List[@kernel.Thm],
                          ) -> @kernel.Thm raise,
                        ) raise) raise,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise) raise {
                        fn(
                          x729 : (@kernel.Thm) -> ((
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
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise) raise,
                        ) -> ((
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
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
                          (
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                            @list.List[@kernel.Thm],
                          ) -> @kernel.Thm raise,
                        ) raise) raise {
                          let s730 = @tactics.subgoal_then(x728, x729)
                          fn(
                            x731 : (
                              @list.List[(String, @kernel.Thm)],
                              @kernel.Term,
                            ),
                          ) -> (
                            (
                              @list.List[@kernel.Term],
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                            ),
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise {
                            s730(x731)
                          }
                        }
                      })(x734)(fn(
                        x732 : @kernel.Thm,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise {
                        let t = x732
                        @simp.rewrite_tac(@list.List([t]))
                      })
                    })(
                      ((x735 : @kernel.Term) => {
                        @lib.funpow(2, @equal.lhand, x735)
                      })(x736),
                    )
                  })(
                    (fn(
                      x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> @kernel.Term raise {
                      x737.1
                    })(x738),
                  )
                })(x739)(x739)
              },
            ),
            t740,
          ),
          t741,
        ),
        t742,
      ),
      t743,
    ),
    t744,
  )
  inseg_linseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, woset(l) → inseg(m, l) == (m == l || (∃ a : A, fld(l, a) && m == linseg(l, a)))"),
      t745,
    ),
  )
}

///|
let inseg_linseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSEG_LINSEG")

///|
/// `INSEG_LINSEG`
pub fn inseg_linseg() -> @kernel.Thm {
  inseg_linseg_c.get()
}

///|
/// EXTEND_FLD
fn step_119() -> Unit raise {
  let t747 = @meson.asm_meson_tac(
    @list.List([
      woset_trans(),
      woset_refl(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  let t746 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t748 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t746),
      pbeta_tac,
    ),
    t747,
  )
  extend_fld_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ x : A, woset(l) → fld((x : A) => (y : A) => l(x, y) && l(y, (a : A)), x) == l(x, a)"),
      t748,
    ),
  )
}

///|
let extend_fld_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXTEND_FLD")

///|
/// `EXTEND_FLD`
pub fn extend_fld() -> @kernel.Thm {
  extend_fld_c.get()
}

///|
/// EXTEND_INSEG
fn step_120() -> Unit raise {
  let t753 = @tactics.imp_res_then(fn(
    x751 : @kernel.Thm,
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
    let t = x751
    @simp.rewrite_tac(@list.List([t]))
  })(extend_fld())
  let t750 = @tactics.repeat_tac(@tactics.gen_tac)
  let t749 = @simp.rewrite_tac(@list.List([inseg()]))
  let t754 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t749),
        pbeta_tac,
      ),
      t750,
    ),
    t753,
  )
  extend_inseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, woset(l) && fld(l, a) → inseg((x : A) => (y : A) => l(x, y) && l(y, a), l)"),
      t754,
    ),
  )
}

///|
let extend_inseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXTEND_INSEG")

///|
/// `EXTEND_INSEG`
pub fn extend_inseg() -> @kernel.Thm {
  extend_inseg_c.get()
}

///|
/// EXTEND_LINSEG
fn step_121() -> Unit raise {
  let t766 = @meson.asm_meson_tac(@list.List([woset_refl()]))
  let t765 = @simp.rewrite_tac(@list.List([linseg(), properly()]))
  let t764 = @tactics.imp_res_then(fn(
    x762 : @kernel.Thm,
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
    let th_1 = x762
    @simp.rewrite_tac(@list.List([th_1]))
  })(linseg_fld())
  let t761 = @tactics.repeat_tac(@tactics.gen_tac)
  let t760 = @simp.once_rewrite_tac(@list.List([@equal.gsym(paired_ext())]))
  let t759 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t758 = @tactics.disch_then(fn(
    x755 : @kernel.Thm,
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
    let th = x755
    let t757 = @tactics.mp_tac(@drule.match_mp(extend_inseg())(th))
    @tactics.then_tac(@tactics.strip_assume_tac(th), t757)
  })
  let t767 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t758,
                    ),
                    t759,
                  ),
                  @tactics.ap_thm_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t760,
            ),
            pbeta_tac,
          ),
          t761,
        ),
        t764,
      ),
      t765,
    ),
    t766,
  )
  extend_linseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, woset(l) && fld(l, a) → inseg((x : A) => (y : A) => linseg(l, a, x, y) || y == a && (fld(linseg(l, a), x) || x == a), l)"),
      t767,
    ),
  )
}

///|
let extend_linseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXTEND_LINSEG")

///|
/// `EXTEND_LINSEG`
pub fn extend_linseg() -> @kernel.Thm {
  extend_linseg_c.get()
}

///|
/// ORDINAL_CHAINED_LEMMA
fn step_122() -> Unit raise {
  let t795 = @meson.asm_meson_tac(
    @list.List([
      woset_refl(),
      properly(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  let t794 = @simp.rewrite_tac(
    @list.List([linseg(), @equal.gsym(paired_ext())]),
  )
  let t793 = @simp.asm_rewrite_tac(@list.List([]))
  let t792 = @tactics.undisch_tac(@term_syntax.parse_term("(k : (A, A) -> Bool) == linseg((m : (A, A) -> Bool), (b : A))"))
  let t791 = @tactics.first_assum(fn(
    x788 : @kernel.Thm,
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
    let th_3 = x788
    let t790 = @kernel.assume_rule(@term_syntax.parse_term("fld((m : (A, A) -> Bool), (b : A))"))
    @tactics.subst1_tac(@drule.match_mp(th_3)(t790))
  })
  let t787 = @tactics.first_assum(fn(
    x784 : @kernel.Thm,
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
    let th_2 = x784
    let t786 = @kernel.assume_rule(@term_syntax.parse_term("fld((l : (A, A) -> Bool), (a : A))"))
    @tactics.subst1_tac(@drule.match_mp(th_2)(t786))
  })
  let t783 = @tactics.subgoal_then(@term_syntax.parse_term("(a : A) == (b : A)"), fn(
    x781 : @kernel.Thm,
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
    let th_1 = x781
    @meson.asm_meson_tac(@list.List([th_1]))
  })
  let t780 = @simp.asm_rewrite_tac(@list.List([]))
  let t779 = @tactics.exists_tac(@term_syntax.parse_term("(a : A)"))
  let t777 = @tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(
    @tactics.strip_assume_tac,
  )
  let t778 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(
        @tactics.strip_assume_tac,
      ),
      t777,
    ),
  )
  let t776 = @simp.asm_rewrite_tac(@list.List([]))
  let t775 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (A, A) -> Bool) == (m : (A, A) -> Bool)"))
  let t774 = @simp.asm_rewrite_tac(@list.List([]))
  let t773 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (A, A) -> Bool) == (l : (A, A) -> Bool)"))
  let t772 = @tactics.every_assum(fn(
    x769 : @kernel.Thm,
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
    let th = x769
    @tactics.try_tac(fn(
      x771 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      let g = x771
      @simp.rewrite_tac(@list.List([@drule.match_mp(inseg_linseg())(th)]))(g)
    })
  })
  let t768 = @simp.rewrite_tac(@list.List([ordinal()]))
  let t796 = @tactics.then_tac(
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
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.repeat_tac(
                                              @tactics.gen_tac,
                                            ),
                                            t768,
                                          ),
                                          @tactics.strip_tac,
                                        ),
                                        t772,
                                      ),
                                      t773,
                                    ),
                                    t774,
                                  ),
                                  t775,
                                ),
                                t776,
                              ),
                              t778,
                            ),
                            t779,
                          ),
                          t780,
                        ),
                        t783,
                      ),
                      t787,
                    ),
                    t791,
                  ),
                  @tactics.ap_term_tac,
                ),
                @tactics.abs_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t792,
          ),
          t793,
        ),
        t794,
      ),
      pbeta_tac,
    ),
    t795,
  )
  ordinal_chained_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : (A, A) -> Bool, ∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ordinal(l) && ordinal(m) → inseg(k, l) && inseg(k, m) → k == l || k == m || (∃ a : A, fld(l, a) && fld(m, a) && k == linseg(l, a) && k == linseg(m, a))"),
      t796,
    ),
  )
}

///|
let ordinal_chained_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_CHAINED_LEMMA",
)

///|
/// `ORDINAL_CHAINED_LEMMA`
pub fn ordinal_chained_lemma() -> @kernel.Thm {
  ordinal_chained_lemma_c.get()
}

///|
/// ORDINAL_CHAINED
fn step_123() -> Unit raise {
  let t846 = @simp.asm_rewrite_tac(@list.List([]))
  let t845 = @tactics.match_mp_tac(extend_linseg())
  let t844 = @simp.rewrite_tac(@list.List([]))
  let t842 = @tactics.disch_then(fn(
    x841 : @kernel.Thm,
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
      x838 : @kernel.Thm,
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
      let s839 = @tactics.subst1_tac(x838)
      fn(
        x840 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s839(x840)
      }
    })(@equal.sym(x841))
  })
  let t837 = @simp.asm_rewrite_tac(@list.List([]))
  let t843 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(
          @term_syntax.parse_term("((x : A) => (y : A) => ∃ k : (A, A) -> Bool, (inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))) && k(x, y)) == linseg(l, (a : A))"),
        ),
        t837,
      ),
      t842,
    ),
  ])
  let t836 = @simp.rewrite_tac(@list.List([]))
  let t835 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => (y : A) => linseg((l : (A, A) -> Bool), (a : A), x, y) || y == a && (fld(linseg(l, a), x) || x == a)"),
  )
  let t834 = @simp.rewrite_tac(@list.List([properly()]))
  let t833 = @simp.rewrite_tac(@list.List([linseg()]))
  let t828 = @term_syntax.parse_term("(a : A)")
  let t829 = @list.List([@term_syntax.parse_term("(a : A)"), t828])
  let t832 = @tactics.disch_then(fn(
    x831 : @kernel.Thm,
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
      x825 : @kernel.Thm,
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
      let s826 = @tactics.mp_tac(x825)
      fn(
        x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s826(x827)
      }
    })(((x830 : @kernel.Thm) => @bool.specl(t829, x830))(x831))
  })
  let t824 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t823 = @tactics.disch_then(fn(
    x822 : @kernel.Thm,
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
  })
  let t821 = @tactics.conv_tac(@class.contrapos_conv)
  let t820 = @tactics.mp_tac(
    @kernel.assume_rule(
      @term_syntax.parse_term("((x : A) => (y : A) => ∃ k : (A, A) -> Bool, (inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))) && k(x, y)) == linseg(l, (a : A))"),
    ),
  )
  let t819 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac),
  )
  let t817 = @meson.asm_meson_tac(@list.List([]))
  let t818 = @list.List([
    @meson.asm_meson_tac(@list.List([])),
    t817,
    @tactics.all_tac,
  ])
  let t816 = @tactics.disch_then(fn(
    x807 : @kernel.Thm,
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
    let th_2 = x807
    let t813 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
      x809 : @kernel.Thm,
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
      let s810 = @tactics.mp_tac(x809)
      fn(
        x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s810(x811)
      }
    })
    let t815 = @tactics.first_assum(fn(
      x814 : @kernel.Thm,
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
      t813(
        (fn(x812 : @kernel.Thm) -> @kernel.Thm raise {
          @drule.match_mp(x812)(th_2)
        })(x814),
      )
    })
    @tactics.then_tac(@tactics.strip_assume_tac(th_2), t815)
  })
  let t806 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → a) && (a && b → b)")),
    ]),
  )
  let t805 = @tactics.disch_then(fn(
    x802 : @kernel.Thm,
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
    let th_1 = x802
    let t804 = @bool.spec(@term_syntax.parse_term("(m : (A, A) -> Bool)"), th_1)
    @tactics.mp_tac(
      @bool.conj(@bool.spec(@term_syntax.parse_term("(l : (A, A) -> Bool)"), th_1), t804),
    )
  })
  let t801 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(k : (A, A) -> Bool) => inseg(k, (l : (A, A) -> Bool)) && inseg(k, (m : (A, A) -> Bool))"),
      union_inseg(),
    ),
  )
  let t800 = @tactics.disch_then(fn(
    x797 : @kernel.Thm,
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
    let th = x797
    let t799 = @tactics.assume_tac(@drule.match_mp(ordinal_chained_lemma())(th))
    @tactics.then_tac(
      @tactics.strip_assume_tac(@simp.rewrite_rule(@list.List([ordinal()]))(th)),
      t799,
    )
  })
  let t847 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
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
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t800,
                                              ),
                                              t801,
                                            ),
                                            t805,
                                          ),
                                          t806,
                                        ),
                                        t816,
                                      ),
                                      t818,
                                    ),
                                    t819,
                                  ),
                                  t820,
                                ),
                                t821,
                              ),
                              t823,
                            ),
                            t824,
                          ),
                          t832,
                        ),
                        t833,
                      ),
                      pbeta_tac,
                    ),
                    t834,
                  ),
                  t835,
                ),
                pbeta_tac,
              ),
              t836,
            ),
            @tactics.conj_tac,
          ),
          t843,
        ),
        t844,
      ),
      t845,
    ),
    t846,
  )
  ordinal_chained_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ordinal(l) && ordinal(m) → inseg(m, l) || inseg(l, m)"),
      t847,
    ),
  )
}

///|
let ordinal_chained_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_CHAINED",
)

///|
/// `ORDINAL_CHAINED`
pub fn ordinal_chained() -> @kernel.Thm {
  ordinal_chained_c.get()
}

///|
/// ORDINAL_FLD_UNIQUE
fn step_124() -> Unit raise {
  let t851 = @meson.asm_meson_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t850 = @simp.rewrite_tac(
    @list.List([inseg(), @class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let t848 = @term_syntax.parse_term("(m : (A, A) -> Bool)")
  let t849 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(l : (A, A) -> Bool)"), t848]),
      ordinal_chained(),
    ),
  )
  let t852 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t849),
      t850,
    ),
    t851,
  )
  ordinal_fld_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ordinal(l) && ordinal(m) && fld(l) == fld(m) → l == m"),
      t852,
    ),
  )
}

///|
let ordinal_fld_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_FLD_UNIQUE",
)

///|
/// `ORDINAL_FLD_UNIQUE`
pub fn ordinal_fld_unique() -> @kernel.Thm {
  ordinal_fld_unique_c.get()
}

///|
/// ORDINAL_FLD_SUBSET
fn step_125() -> Unit raise {
  let t864 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t861 = @drule.match_mp(inseg_subset_fld())
  let t863 = @tactics.first_assum(fn(
    x862 : @kernel.Thm,
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
      x858 : @kernel.Thm,
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
      let s859 = @tactics.mp_tac(x858)
      fn(
        x860 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s859(x860)
      }
    })(t861(x862))
  })
  let t857 = @tactics.match_mp_tac(ordinal_fld_unique())
  let t856 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([inseg_refl()]),
      @term_syntax.parse_term("(x : (_, _) -> Bool) == (y : (_, _) -> Bool) → inseg(x, y)"),
    ),
  )
  let t855 = @simp.asm_rewrite_tac(@list.List([]))
  let t853 = @term_syntax.parse_term("(m : (A, A) -> Bool)")
  let t854 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(l : (A, A) -> Bool)"), t853]),
      ordinal_chained(),
    ),
  )
  let t865 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t854),
              t855,
            ),
            @tactics.strip_tac,
          ),
          t856,
        ),
        t857,
      ),
      t863,
    ),
    t864,
  )
  ordinal_fld_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ordinal(l) && ordinal(m) && SUBSET(fld(l), fld(m)) → inseg(l, m)"),
      t865,
    ),
  )
}

///|
let ordinal_fld_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_FLD_SUBSET",
)

///|
/// `ORDINAL_FLD_SUBSET`
pub fn ordinal_fld_subset() -> @kernel.Thm {
  ordinal_fld_subset_c.get()
}

///|
/// ORDINAL_FLD_SUBSET_EQ
fn step_126() -> Unit raise {
  let t866 = @meson.meson_tac(
    @list.List([ordinal_fld_subset(), inseg_fld_subset()]),
  )
  ordinal_fld_subset_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ m : (A, A) -> Bool, ordinal(l) && ordinal(m) → SUBSET(fld(l), fld(m)) == inseg(l, m)"),
      t866,
    ),
  )
}

///|
let ordinal_fld_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_FLD_SUBSET_EQ",
)

///|
/// `ORDINAL_FLD_SUBSET_EQ`
pub fn ordinal_fld_subset_eq() -> @kernel.Thm {
  ordinal_fld_subset_eq_c.get()
}

///|
/// FLD_SUC
fn step_127() -> Unit raise {
  let t871 = @meson.asm_meson_tac(@list.List([]))
  let t870 = @tactics.try_tac(@tactics.disj1_tac)
  let t869 = @simp.asm_rewrite_tac(@list.List([]))
  let t868 = @tactics.repeat_tac(@tactics.strip_tac)
  let t867 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t872 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t867),
            @tactics.eq_tac,
          ),
          t868,
        ),
        t869,
      ),
      t870,
    ),
    t871,
  )
  fld_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ a : A, fld((x : A) => (y : A) => l(x, y) || y == a && (fld(l, x) || x == a), (x : A)) == (fld(l, x) || x == a)"),
      t872,
    ),
  )
}

///|
let fld_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_SUC")

///|
/// `FLD_SUC`
pub fn fld_suc() -> @kernel.Thm {
  fld_suc_c.get()
}

///|
/// ORDINAL_SUC
fn step_128() -> Unit raise {
  let t977 = @simp.asm_rewrite_tac(@list.List([]))
  let t976 = @tactics.exists_tac(@term_syntax.parse_term("(a : A)"))
  let t975 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t974 = @simp.asm_rewrite_tac(@list.List([]))
  let t973 = @simp.asm_rewrite_tac(@list.List([]))
  let t972 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (a : A)"))
  let t971 = @simp.rewrite_tac(@list.List([]))
  let t970 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t969 = @simp.gen_rewrite_tac(
    fn(
      x968 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x968
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t967 = @simp.gen_rewrite_tac(
    fn(
      x964 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s965 = @equal.land_conv(x964)
      fn(x966 : @kernel.Term) -> @kernel.Thm raise { s965(x966) }
    },
    @list.List([
      @equal.sym(
        @kernel.assume_rule(@term_syntax.parse_term("select((y : A) => !fld((l : (A, A) -> Bool), y)) == (a : A)")),
      ),
    ]),
  )
  let t963 = @tactics.disch_then(fn(
    x960 : @kernel.Thm,
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
    let s961 = @tactics.subst_all_tac(x960)
    fn(
      x962 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s961(x962)
    }
  })
  let t978 = @tactics.then_tac(
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
                                  @tactics.undisch_tac(
                                    @term_syntax.parse_term("(z : A) == (a : A)"),
                                  ),
                                  t963,
                                ),
                                t967,
                              ),
                              @tactics.ap_term_tac,
                            ),
                            t969,
                          ),
                          t970,
                        ),
                        @tactics.beta_tac,
                      ),
                      @tactics.ap_term_tac,
                    ),
                    t971,
                  ),
                  t972,
                ),
                t973,
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t974,
        ),
        t975,
      ),
      t976,
    ),
    t977,
  )
  let t959 = @simp.asm_rewrite_tac(@list.List([]))
  let t958 = @tactics.undisch_tac(@term_syntax.parse_term("fld((l : (A, A) -> Bool), (z : A))"))
  let t957 = @simp.asm_rewrite_tac(@list.List([]))
  let t956 = @simp.asm_rewrite_tac(@list.List([]))
  let t955 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (z : A)"))
  let t954 = @simp.rewrite_tac(@list.List([properly()]))
  let t953 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t952 = @simp.gen_rewrite_tac(
    fn(
      x951 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x951
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t950 = @tactics.disch_then(fn(
    x945 : @kernel.Thm,
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
    let th = x945
    @simp.gen_rewrite_tac(
      fn(
        x947 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s948 = @equal.land_conv(x947)
        fn(x949 : @kernel.Term) -> @kernel.Thm raise { s948(x949) }
      },
      @list.List([th]),
    )
  })
  let t944 = @tactics.disch_then(
    @tactics.imp_res_then(fn(
      x941 : @kernel.Thm,
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
      let s942 = @tactics.mp_tac(x941)
      fn(
        x943 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s942(x943)
      }
    }),
  )
  let t979 = @list.List([
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
                                  @tactics.undisch_tac(
                                    @term_syntax.parse_term("∀ x : A, fld((l : (A, A) -> Bool), x) → x == select((y : A) => !properly(l, y, x))"),
                                  ),
                                  t944,
                                ),
                                t950,
                              ),
                              @tactics.ap_term_tac,
                            ),
                            t952,
                          ),
                          t953,
                        ),
                        @tactics.beta_tac,
                      ),
                      t954,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t955,
                ),
                t956,
              ),
              @tactics.eq_tac,
            ),
            @tactics.strip_tac,
          ),
          t957,
        ),
        t958,
      ),
      t959,
    ),
    t978,
  ])
  let t940 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t939 = @simp.rewrite_tac(@list.List([fld_suc(), properly()]))
  let t980 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : A)")), t939),
        pbeta_tac,
      ),
      t940,
    ),
    t979,
  )
  let t934 = @meson.asm_meson_tac(@list.List([]))
  let t933 = @simp.asm_rewrite_tac(@list.List([]))
  let t931 = @simp.gen_rewrite_rule(
    fn(
      x930 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x930
    },
    @list.List([@class.not_exists_thm()]),
  )
  let t927 = @term_syntax.parse_term("(w : A)")
  let t935 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x932 : @kernel.Thm,
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
            x929 : @kernel.Thm,
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
              x924 : @kernel.Thm,
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
              let s925 = @tactics.mp_tac(x924)
              fn(
                x926 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s925(x926)
              }
            })(((x928 : @kernel.Thm) => @bool.spec(t927, x928))(x929))
          })(t931(x932))
        }),
        t933,
      ),
      @tactics.disch_tac,
    ),
    t934,
  )
  let t936 = @list.List([@meson.asm_meson_tac(@list.List([])), t935])
  let t923 = @simp.asm_rewrite_tac(@list.List([]))
  let t922 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : A, (P : (A) -> Bool)(x) && fld((l : (A, A) -> Bool), x)"))
  let t921 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) → b"))]),
  )
  let t917 = @term_syntax.parse_term("(x : A) => (P : (A) -> Bool)(x) && fld((l : (A, A) -> Bool), x)")
  let t920 = @tactics.imp_res_then(fn(
    x919 : @kernel.Thm,
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
      x914 : @kernel.Thm,
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
      let s915 = @tactics.mp_tac(x914)
      fn(
        x916 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s915(x916)
      }
    })(((x918 : @kernel.Thm) => @bool.spec(t917, x918))(x919))
  })(woset_well())
  let t911 = @term_syntax.parse_term("(w : A)")
  let t913 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x908 : @kernel.Thm,
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
        let s909 = @tactics.assume_tac(x908)
        fn(
          x910 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s909(x910)
        }
      },
      (x912 : @kernel.Thm) => @tactics.x_choose_tac(t911, x912),
    ),
  )
  let t907 = @simp.rewrite_tac(@list.List([fld_suc()]))
  let t937 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)")),
                  t907,
                ),
                t913,
              ),
              t920,
            ),
            @tactics.beta_tac,
          ),
          t921,
        ),
        t922,
      ),
      t923,
    ),
    t936,
  )
  let t906 = @simp.asm_rewrite_tac(@list.List([]))
  let t904 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t905 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(y : A)")), t904])
  let t903 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t902 = @tactics.disch_then(fn(
    x899 : @kernel.Thm,
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
    let s900 = @tactics.subst_all_tac(x899)
    fn(
      x901 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s900(x901)
    }
  })
  let t898 = @tactics.first_assum(fn(
    x897 : @kernel.Thm,
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
      x895 : @kernel.Term,
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
        x890 : @kernel.Term,
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
        let s891 = @tactics.undisch_tac(x890)
        fn(
          x892 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s891(x892)
        }
      })(
        ((x894 : @kernel.Term) => {
          @lib.check(
            fn(x893 : @kernel.Term) -> Bool raise { @basics.is_eq(x893) },
            x894,
          )
        })(x895),
      )
    })(
      (fn(x896 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x896) })(
        x897,
      ),
    )
  })
  let t889 = @tactics.conv_tac(@class.contrapos_conv)
  let t888 = @tactics.undisch_tac(@term_syntax.parse_term("!fld((l : (A, A) -> Bool), (a : A))"))
  let t887 = @list.List([
    @meson.asm_meson_tac(@list.List([woset_antisym()])),
    @tactics.all_tac,
    @tactics.all_tac,
  ])
  let t886 = @simp.asm_rewrite_tac(@list.List([]))
  let t938 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.repeat_tac(@tactics.gen_tac),
                          @tactics.strip_tac,
                        ),
                        t886,
                      ),
                      t887,
                    ),
                    t888,
                  ),
                  t889,
                ),
                @tactics.disch_tac,
              ),
              t898,
            ),
            t902,
          ),
          t903,
        ),
        t905,
      ),
      t906,
    ),
    t937,
  ])
  let t981 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            woset_v1(),
            @sets.subset(),
            @equal.gsym(@sets.member_not_empty()),
            @sets.in_(),
          ]),
        ),
        @tactics.conj_tac,
      ),
      t938,
    ),
    t980,
  ])
  let t884 = @simp.asm_rewrite_tac(@list.List([]))
  let t883 = @tactics.conv_tac(@class.select_conv)
  let t885 = @list.List([
    @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("a"), t883), t884),
    @tactics.all_tac,
  ])
  let t882 = @tactics.subgoal_then(@term_syntax.parse_term("!fld((l : (A, A) -> Bool), (a : A))"), fn(
    x879 : @kernel.Thm,
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
    let s880 = @tactics.assume_tac(x879)
    fn(
      x881 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s880(x881)
    }
  })
  let t878 = @simp.abbrev_tac(@term_syntax.parse_term("(a : A) == select((y : A) => !fld((l : (A, A) -> Bool), y))"))
  let t877 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x874 : @kernel.Thm,
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
      let s875 = @tactics.assume_tac(x874)
      fn(
        x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s875(x876)
      }
    }),
  )
  let t873 = @simp.rewrite_tac(@list.List([ordinal()]))
  let t982 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t873),
                t877,
              ),
              t878,
            ),
            t882,
          ),
          t885,
        ),
        pbeta_tac,
      ),
      @tactics.conj_tac,
    ),
    t981,
  )
  ordinal_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ordinal(l) && (∃ x : A, !fld(l, x)) → ordinal((x : A) => (y : A) => l(x, y) || y == select((y : A) => !fld(l, y)) && (fld(l, x) || x == select((y : A) => !fld(l, y))))"),
      t982,
    ),
  )
}

///|
let ordinal_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDINAL_SUC")

///|
/// `ORDINAL_SUC`
pub fn ordinal_suc() -> @kernel.Thm {
  ordinal_suc_c.get()
}

///|
/// ORDINAL_UNION
fn step_129() -> Unit raise {
  let t1155 = @simp.asm_rewrite_tac(@list.List([]))
  let t1156 = @tactics.then_tac(
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([inseg()]))),
    t1155,
  )
  let t1154 = @simp.asm_rewrite_tac(@list.List([]))
  let t1157 = @list.List([
    @tactics.then_tac(
      @tactics.imp_res_then(@tactics.match_mp_tac)(inseg_subset()),
      t1154,
    ),
    t1156,
  ])
  let t1150 = @drule.match_mp(ordinal_chained())
  let t1152 = @tactics.disch_then(fn(
    x1151 : @kernel.Thm,
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
    @tactics.disj_cases_tac(t1150(x1151))
  })
  let t1149 = @simp.asm_rewrite_tac(@list.List([]))
  let t1153 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.conj_tac,
        @tactics.first_assum(@tactics.match_mp_tac),
      ),
      t1149,
    ),
    t1152,
  ])
  let t1148 = @tactics.subgoal_then(
    @term_syntax.parse_term("ordinal((l : (A, A) -> Bool)) && ordinal((m : (A, A) -> Bool))"),
    fn(
      x1145 : @kernel.Thm,
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
      let s1146 = @tactics.mp_tac(x1145)
      fn(
        x1147 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1146(x1147)
      }
    },
  )
  let t1158 = @tactics.thenl(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.first_assum(
          @tactics.x_choose_then(@term_syntax.parse_term("(m : (A, A) -> Bool)"))(
            @tactics.strip_assume_tac,
          ),
        ),
        t1148,
      ),
      t1153,
    ),
    t1157,
  )
  let t1144 = @simp.asm_rewrite_tac(@list.List([]))
  let t1159 = @list.List([
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(l : (A, A) -> Bool)")),
      t1144,
    ),
    t1158,
  ])
  let t1143 = @simp.asm_rewrite_tac(@list.List([properly(), unions_pred()]))
  let t1142 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (x : A)"))
  let t1141 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t1140 = @simp.gen_rewrite_tac(
    fn(
      x1139 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1139
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1138 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t1137 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1136 = @simp.asm_rewrite_tac(@list.List([]))
  let t1132 = @term_syntax.parse_term("(x : A)")
  let t1135 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1126 : @kernel.Thm,
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
        let s1127 = @tactics.assume_tac(x1126)
        fn(
          x1128 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1127(x1128)
        }
      },
      fn(
        x1134 : @kernel.Thm,
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
          x1129 : @kernel.Thm,
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
          let s1130 = @tactics.mp_tac(x1129)
          fn(
            x1131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1130(x1131)
          }
        })(((x1133 : @kernel.Thm) => @bool.spec(t1132, x1133))(x1134))
      },
    ),
  )
  let t1125 = @simp.rewrite_tac(@list.List([ordinal()]))
  let t1124 = @tactics.disch_then(
    @tactics.imp_res_then(fn(
      x1121 : @kernel.Thm,
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
      let s1122 = @tactics.mp_tac(x1121)
      fn(
        x1123 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1122(x1123)
      }
    }),
  )
  let t1120 = @tactics.mp_tac(
    @kernel.assume_rule(@term_syntax.parse_term("∀ l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) → ordinal(l)")),
  )
  let t1119 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(l : (A, A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1118 = @simp.rewrite_tac(@list.List([union_fld()]))
  let t1160 = @tactics.thenl(
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
                                      @tactics.then_tac(
                                        @tactics.x_gen_tac(
                                          @term_syntax.parse_term("(x : A)"),
                                        ),
                                        t1118,
                                      ),
                                      t1119,
                                    ),
                                    t1120,
                                  ),
                                  t1124,
                                ),
                                t1125,
                              ),
                              t1135,
                            ),
                            t1136,
                          ),
                          t1137,
                        ),
                        t1138,
                      ),
                      t1140,
                    ),
                    t1141,
                  ),
                  @tactics.beta_tac,
                ),
                @tactics.ap_term_tac,
              ),
              t1142,
            ),
            t1143,
          ),
          @tactics.beta_tac,
        ),
        @tactics.eq_tac,
      ),
      @tactics.disch_tac,
    ),
    t1159,
  )
  let t1115 = @simp.asm_rewrite_tac(@list.List([]))
  let t1114 = @tactics.exists_tac(@term_syntax.parse_term("(b : A)"))
  let t1113 = @simp.asm_rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1112 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1111 = @tactics.imp_res_then(@tactics.match_mp_tac)(inseg_subset())
  let t1110 = @simp.asm_rewrite_tac(@list.List([]))
  let t1109 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x1106 : @kernel.Thm,
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
      let s1107 = @tactics.mp_tac(x1106)
      fn(
        x1108 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1107(x1108)
      }
    }),
  )
  let t1105 = @simp.asm_rewrite_tac(@list.List([]))
  let t1102 = @drule.match_mp(woset_total())
  let t1098 = @term_syntax.parse_term("(x : A)")
  let t1099 = @list.List([@term_syntax.parse_term("(b : A)"), t1098])
  let t1104 = @tactics.disch_then(fn(
    x1103 : @kernel.Thm,
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
      x1101 : @kernel.Thm,
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
        x1095 : @kernel.Thm,
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
        let s1096 = @tactics.mp_tac(x1095)
        fn(
          x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1096(x1097)
        }
      })(((x1100 : @kernel.Thm) => @bool.specl(t1099, x1100))(x1101))
    })(t1102(x1103))
  })
  let t1093 = @kernel.assume_rule(@term_syntax.parse_term("ordinal((m : (A, A) -> Bool))"))
  let t1094 = @tactics.mp_tac(
    @bool.conjunct1(@simp.rewrite_rule(@list.List([ordinal()]))(t1093)),
  )
  let t1092 = @simp.asm_rewrite_tac(@list.List([]))
  let t1088 = @term_syntax.parse_term("(b : A)")
  let t1091 = @tactics.imp_res_then(fn(
    x1090 : @kernel.Thm,
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
      x1085 : @kernel.Thm,
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
      let s1086 = @tactics.mp_tac(x1085)
      fn(
        x1087 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1086(x1087)
      }
    })(((x1089 : @kernel.Thm) => @bool.spec(t1088, x1089))(x1090))
  })(inseg_subset_fld())
  let t1084 = @tactics.disch_then(fn(
    x1083 : @kernel.Thm,
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
      x1080 : @kernel.Thm,
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
      let s1081 = @tactics.assume_tac(x1080)
      fn(
        x1082 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1081(x1082)
      }
    })(@equal.sym(x1083))
  })
  let t1079 = @simp.asm_rewrite_tac(@list.List([]))
  let t1076 = @simp.rewrite_rule(@list.List([inseg()]))
  let t1072 = @term_syntax.parse_term("(b : A)")
  let t1073 = @list.List([@term_syntax.parse_term("(x : A)"), t1072])
  let t1078 = @tactics.first_assum(fn(
    x1077 : @kernel.Thm,
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
      x1075 : @kernel.Thm,
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
        x1069 : @kernel.Thm,
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
        let s1070 = @tactics.mp_tac(x1069)
        fn(
          x1071 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1070(x1071)
        }
      })(((x1074 : @kernel.Thm) => @bool.specl(t1073, x1074))(x1075))
    })(t1076(x1077))
  })
  let t1068 = @simp.asm_rewrite_tac(@list.List([]))
  let t1116 = @tactics.then_tac(
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
                                      @tactics.exists_tac(
                                        @term_syntax.parse_term("(m : (A, A) -> Bool)"),
                                      ),
                                      t1068,
                                    ),
                                    t1078,
                                  ),
                                  t1079,
                                ),
                                t1084,
                              ),
                              t1091,
                            ),
                            t1092,
                          ),
                          @tactics.disch_tac,
                        ),
                        t1094,
                      ),
                      t1104,
                    ),
                    t1105,
                  ),
                  t1109,
                ),
                t1110,
              ),
              @tactics.disch_tac,
            ),
            t1111,
          ),
          t1112,
        ),
        t1113,
      ),
      t1114,
    ),
    t1115,
  )
  let t1067 = @simp.asm_rewrite_tac(@list.List([]))
  let t1066 = @tactics.imp_res_then(@tactics.match_mp_tac)(inseg_subset_fld())
  let t1065 = @simp.asm_rewrite_tac(@list.List([]))
  let t1064 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1063 = @simp.asm_rewrite_tac(@list.List([]))
  let t1117 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.exists_tac(@term_syntax.parse_term("(l : (A, A) -> Bool)")),
              t1063,
            ),
            t1064,
          ),
          t1065,
        ),
        t1066,
      ),
      t1067,
    ),
    t1116,
  ])
  let t1062 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t1061 = @simp.asm_rewrite_tac(@list.List([unions_pred()]))
  let t1059 = @term_syntax.parse_term("(m : (A, A) -> Bool)")
  let t1060 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(l : (A, A) -> Bool)"), t1059]),
      ordinal_chained(),
    ),
  )
  let t1057 = @kernel.assume_rule(
    @term_syntax.parse_term("(P : ((A, A) -> Bool) -> Bool)((m : (A, A) -> Bool))"),
  )
  let t1058 = @tactics.ante_res_then(fn(
    x1054 : @kernel.Thm,
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
    let s1055 = @tactics.assume_tac(x1054)
    fn(
      x1056 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1055(x1056)
    }
  })(t1057)
  let t1053 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : (A, A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1051 = @kernel.assume_rule(@term_syntax.parse_term("(Q : (A) -> Bool)((x : A))"))
  let t1052 = @tactics.ante_res_then(fn(
    x1048 : @kernel.Thm,
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
    let s1049 = @tactics.mp_tac(x1048)
    fn(
      x1050 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1049(x1050)
    }
  })(t1051)
  let t1047 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t1046 = @simp.asm_rewrite_tac(@list.List([]))
  let t1045 = @tactics.exists_tac(@term_syntax.parse_term("(b : A)"))
  let t1044 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac),
  )
  let t1042 = @simp.asm_rewrite_tac(@list.List([]))
  let t1043 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : A)")), t1042),
    @tactics.all_tac,
  ])
  let t1041 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ x : A, fld((l : (A, A) -> Bool), x) && (Q : (A) -> Bool)(x)"),
    fn(
      x1039 : @kernel.Thm,
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
      let th = x1039
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t1038 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) → a"))]),
  )
  let t1034 = @term_syntax.parse_term("(x : A) => fld((l : (A, A) -> Bool), x) && (Q : (A) -> Bool)(x)")
  let t1037 = @tactics.imp_res_then(fn(
    x1036 : @kernel.Thm,
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
      x1031 : @kernel.Thm,
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
      let s1032 = @tactics.mp_tac(x1031)
      fn(
        x1033 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1032(x1033)
      }
    })(((x1035 : @kernel.Thm) => @bool.spec(t1034, x1035))(x1036))
  })(woset_well())
  let t1029 = @kernel.assume_rule(@term_syntax.parse_term("ordinal((l : (A, A) -> Bool))"))
  let t1030 = @tactics.assume_tac(
    @bool.conjunct1(@simp.rewrite_rule(@list.List([ordinal()]))(t1029)),
  )
  let t1027 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) → ordinal(l)"),
  )
  let t1028 = @tactics.imp_res_then(fn(
    x1024 : @kernel.Thm,
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
    let s1025 = @tactics.assume_tac(x1024)
    fn(
      x1026 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1025(x1026)
    }
  })(t1027)
  let t1023 = @tactics.disch_then(
    @tactics.imp_res_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(l : (A, A) -> Bool)"))(
        @tactics.strip_assume_tac,
      ),
    ),
  )
  let t1022 = @tactics.mp_tac(
    @kernel.assume_rule(
      @term_syntax.parse_term("∀ x : A, (Q : (A) -> Bool)(x) → (∃ l : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(l) && fld(l, x))"),
    ),
  )
  let t1019 = @term_syntax.parse_term("(a : A)")
  let t1021 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1016 : @kernel.Thm,
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
        let s1017 = @tactics.assume_tac(x1016)
        fn(
          x1018 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1017(x1018)
        }
      },
      (x1020 : @kernel.Thm) => @tactics.x_choose_tac(t1019, x1020),
    ),
  )
  let t1015 = @simp.rewrite_tac(@list.List([union_fld()]))
  let t1161 = @tactics.thenl(
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
                            @tactics.thenl(
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
                                                  @tactics.x_gen_tac(
                                                    @term_syntax.parse_term("(Q : (A) -> Bool)"),
                                                  ),
                                                  t1015,
                                                ),
                                                t1021,
                                              ),
                                              t1022,
                                            ),
                                            t1023,
                                          ),
                                          t1028,
                                        ),
                                        t1030,
                                      ),
                                      t1037,
                                    ),
                                    @tactics.beta_tac,
                                  ),
                                  t1038,
                                ),
                                t1041,
                              ),
                              t1043,
                            ),
                            t1044,
                          ),
                          t1045,
                        ),
                        t1046,
                      ),
                      t1047,
                    ),
                    @tactics.disch_tac,
                  ),
                  t1052,
                ),
                t1053,
              ),
              t1058,
            ),
            t1060,
          ),
          t1061,
        ),
        @tactics.beta_tac,
      ),
      t1062,
    ),
    t1117,
  )
  let t1014 = @simp.asm_rewrite_tac(@list.List([]))
  let t1013 = @tactics.imp_res_then(@tactics.match_mp_tac)(inseg_subset())
  let t1012 = @simp.asm_rewrite_tac(@list.List([]))
  let t1011 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1010 = @simp.asm_rewrite_tac(@list.List([]))
  let t1009 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([ordinal()])),
  )
  let t1007 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(m : (A, A) -> Bool)"), woset_antisym()),
  )
  let t1008 = @list.List([
    @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("(l : (A, A) -> Bool)"), woset_antisym()),
    ),
    t1007,
  ])
  let t1006 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t1005 = @simp.asm_rewrite_tac(@list.List([]))
  let t1003 = @term_syntax.parse_term("(m : (A, A) -> Bool)")
  let t1004 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(l : (A, A) -> Bool)"), t1003]),
      ordinal_chained(),
    ),
  )
  let t1000 = @tactics.conjuncts_then2(
    @tactics.ante_res_then(fn(
      x994 : @kernel.Thm,
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
      let s995 = @tactics.assume_tac(x994)
      fn(
        x996 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s995(x996)
      }
    }),
    fn(
      x997 : @kernel.Thm,
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
      let s998 = @tactics.assume_tac(x997)
      fn(
        x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s998(x999)
      }
    },
  )
  let t1001 = @tactics.x_choose_then(@term_syntax.parse_term("(m : (A, A) -> Bool)"))(t1000)
  let t993 = @tactics.conjuncts_then2(
    @tactics.ante_res_then(fn(
      x987 : @kernel.Thm,
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
      let s988 = @tactics.assume_tac(x987)
      fn(
        x989 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s988(x989)
      }
    }),
    fn(
      x990 : @kernel.Thm,
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
      let s991 = @tactics.assume_tac(x990)
      fn(
        x992 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s991(x992)
      }
    },
  )
  let t1002 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(l : (A, A) -> Bool)"))(t993),
      t1001,
    ),
  )
  let t986 = @simp.rewrite_tac(@list.List([unions_pred()]))
  let t985 = @term_syntax.parse_term("(y : A)")
  let t1162 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.map_every(
                                @tactics.x_gen_tac,
                                @list.List([@term_syntax.parse_term("(x : A)"), t985]),
                              ),
                              t986,
                            ),
                            @tactics.beta_tac,
                          ),
                          t1002,
                        ),
                        t1004,
                      ),
                      t1005,
                    ),
                    t1006,
                  ),
                  t1008,
                ),
                t1009,
              ),
              t1010,
            ),
            t1011,
          ),
          t1012,
        ),
        t1013,
      ),
      t1014,
    ),
    t1161,
    t1160,
  ])
  let t984 = @tactics.repeat_tac(@tactics.conj_tac)
  let t983 = @simp.rewrite_tac(
    @list.List([
      ordinal(),
      woset_v1(),
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t1163 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
        t983,
      ),
      t984,
    ),
    t1162,
  )
  ordinal_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, A) -> Bool) -> Bool, (∀ l : (A, A) -> Bool, P(l) → ordinal(l)) → ordinal((x : A) => (y : A) => ∃ l : (A, A) -> Bool, P(l) && l(x, y))"),
      t1163,
    ),
  )
}

///|
let ordinal_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDINAL_UNION")

///|
/// `ORDINAL_UNION`
pub fn ordinal_union() -> @kernel.Thm {
  ordinal_union_c.get()
}

///|
/// ORDINAL_UNION_LEMMA
fn step_130() -> Unit raise {
  let t1166 = @simp.asm_rewrite_tac(@list.List([]))
  let t1165 = @tactics.exists_tac(@term_syntax.parse_term("(l : (A, A) -> Bool)"))
  let t1164 = @simp.rewrite_tac(@list.List([union_fld()]))
  let t1167 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1164),
      t1165,
    ),
    t1166,
  )
  ordinal_union_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ x : A, ordinal(l) → fld(l, x) → fld((a : A) => (b : A) => ∃ l : (A, A) -> Bool, ordinal(l) && l(a, b), x)"),
      t1167,
    ),
  )
}

///|
let ordinal_union_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORDINAL_UNION_LEMMA",
)

///|
/// `ORDINAL_UNION_LEMMA`
pub fn ordinal_union_lemma() -> @kernel.Thm {
  ordinal_union_lemma_c.get()
}

///|
/// ORDINAL_UP
fn step_131() -> Unit raise {
  let t1182 = @simp.asm_rewrite_tac(@list.List([]))
  let t1181 = @tactics.conv_tac(@class.select_conv)
  let t1180 = @simp.asm_rewrite_tac(@list.List([fld_suc()]))
  let t1178 = @term_syntax.parse_term("select((y : A) => !fld((l : (A, A) -> Bool), y))")
  let t1179 = @tactics.map_every(
    fn(
      x1175 : @kernel.Term,
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
      let s1176 = @tactics.exists_tac(x1175)
      fn(
        x1177 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1176(x1177)
      }
    },
    @list.List([
      @term_syntax.parse_term("(x : A) => (y : A) => (l : (A, A) -> Bool)(x, y) || y == select((y : A) => !fld(l, y)) && (fld(l, x) || x == select((y : A) => !fld(l, y)))"),
      t1178,
    ]),
  )
  let t1174 = @simp.asm_rewrite_tac(@list.List([]))
  let t1173 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(l : (A, A) -> Bool)"), ordinal_suc()),
  )
  let t1172 = @simp.gen_rewrite_tac(
    fn(
      x1169 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1170 = @equal.land_conv(x1169)
      fn(x1171 : @kernel.Term) -> @kernel.Thm raise { s1170(x1171) }
    },
    @list.List([@class.not_forall_thm()]),
  )
  let t1168 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)"))]),
  )
  let t1183 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                      t1168,
                    ),
                    t1172,
                  ),
                  @tactics.disch_tac,
                ),
                t1173,
              ),
              t1174,
            ),
            @tactics.disch_tac,
          ),
          t1179,
        ),
        t1180,
      ),
      t1181,
    ),
    t1182,
  )
  ordinal_up_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ordinal(l) → (∀ x : A, fld(l, x)) || (∃ m : (A, A) -> Bool, ∃ x : A, ordinal(m) && fld(m, x) && !fld(l, x))"),
      t1183,
    ),
  )
}

///|
let ordinal_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDINAL_UP")

///|
/// `ORDINAL_UP`
pub fn ordinal_up() -> @kernel.Thm {
  ordinal_up_c.get()
}

///|
/// WO_ORDINAL
fn step_132() -> Unit raise {
  let t1195 = @simp.asm_rewrite_tac(@list.List([]))
  let t1194 = @tactics.imp_res_then(
    @tactics.imp_res_then(fn(
      x1191 : @kernel.Thm,
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
      let s1192 = @tactics.mp_tac(x1191)
      fn(
        x1193 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1192(x1193)
      }
    }),
  )(ordinal_union_lemma())
  let t1189 = @tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(
    @tactics.strip_assume_tac,
  )
  let t1190 = @tactics.pop_assum(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : (A, A) -> Bool)"))(t1189),
  )
  let t1188 = @simp.asm_rewrite_tac(@list.List([]))
  let t1186 = @drule.match_mp(ordinal_up())
  let t1196 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x1187 : @kernel.Thm,
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
            @tactics.disj_cases_tac(t1186(x1187))
          }),
          t1188,
        ),
        t1190,
      ),
      t1194,
    ),
    t1195,
  )
  let t1185 = @simp.rewrite_tac(@list.List([]))
  let t1197 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(ordinal_union()), t1185),
    t1196,
  ])
  let t1184 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")),
  )
  let t1198 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(
          @term_syntax.parse_term("(a : A) => (b : A) => ∃ l : (A, A) -> Bool, ordinal(l) && l(a, b)"),
        ),
        t1184,
      ),
      @tactics.conj_tac,
    ),
    t1197,
  )
  wo_ordinal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ l : (A, A) -> Bool, ordinal(l) && (∀ x : A, fld(l, x))"),
      t1198,
    ),
  )
}

///|
let wo_ordinal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WO_ORDINAL")

///|
/// `WO_ORDINAL`
pub fn wo_ordinal() -> @kernel.Thm {
  wo_ordinal_c.get()
}

///|
/// FLD_RESTRICT
fn step_133() -> Unit raise {
  let t1208 = @simp.asm_rewrite_tac(@list.List([]))
  let t1207 = @tactics.exists_tac(@term_syntax.parse_term("(y : A)"))
  let t1206 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1205 = @tactics.imp_res_then(@tactics.match_mp_tac)(woset_refl())
  let t1204 = @simp.asm_rewrite_tac(@list.List([]))
  let t1203 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t1201 = @simp.asm_rewrite_tac(@list.List([]))
  let t1202 = @tactics.try_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(y : A)")), t1201),
      @tactics.no_tac,
    ),
  )
  let t1200 = @simp.asm_rewrite_tac(@list.List([]))
  let t1199 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1209 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t1199,
                      ),
                      @tactics.eq_tac,
                    ),
                    @tactics.strip_tac,
                  ),
                  t1200,
                ),
                t1202,
              ),
              t1203,
            ),
            t1204,
          ),
          t1205,
        ),
        t1206,
      ),
      t1207,
    ),
    t1208,
  )
  fld_restrict_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, woset(l) → (∀ P : (A) -> Bool, fld((x : A) => (y : A) => P(x) && P(y) && l(x, y), (x : A)) == (P(x) && fld(l, x)))"),
      t1209,
    ),
  )
}

///|
let fld_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLD_RESTRICT")

///|
/// `FLD_RESTRICT`
pub fn fld_restrict() -> @kernel.Thm {
  fld_restrict_c.get()
}

///|
/// WO
fn step_134() -> Unit raise {
  let t1251 = @tactics.first_assum(fn(
    x1248 : @kernel.Thm,
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
    let s1249 = @tactics.accept_tac(x1248)
    fn(
      x1250 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1249(x1250)
    }
  })
  let t1247 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1246 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1245 = @simp.asm_rewrite_tac(@list.List([]))
  let t1244 = @tactics.exists_tac(@term_syntax.parse_term("(y : A)"))
  let t1243 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(y : A)"))(@tactics.strip_assume_tac),
  )
  let t1242 = @simp.asm_rewrite_tac(@list.List([]))
  let t1238 = @term_syntax.parse_term("(Q : (A) -> Bool)")
  let t1241 = @tactics.disch_then(fn(
    x1240 : @kernel.Thm,
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
      x1235 : @kernel.Thm,
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
      let s1236 = @tactics.mp_tac(x1235)
      fn(
        x1237 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1236(x1237)
      }
    })(((x1239 : @kernel.Thm) => @bool.spec(t1238, x1239))(x1240))
  })
  let t1232 = @drule.match_mp(woset_well())
  let t1234 = @tactics.first_assum(fn(
    x1233 : @kernel.Thm,
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
      x1229 : @kernel.Thm,
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
      let s1230 = @tactics.mp_tac(x1229)
      fn(
        x1231 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1230(x1231)
      }
    })(t1232(x1233))
  })
  let t1228 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x1225 : @kernel.Thm,
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
      let s1226 = @tactics.assume_tac(x1225)
      fn(
        x1227 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1226(x1227)
      }
    }),
  )
  let t1252 = @tactics.then_tac(
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
                          @tactics.x_gen_tac(@term_syntax.parse_term("(Q : (A) -> Bool)")),
                          t1228,
                        ),
                        t1234,
                      ),
                      t1241,
                    ),
                    t1242,
                  ),
                  t1243,
                ),
                t1244,
              ),
              t1245,
            ),
            @tactics.gen_tac,
          ),
          @tactics.disch_tac,
        ),
        t1246,
      ),
      t1247,
    ),
    t1251,
  )
  let t1224 = @simp.asm_rewrite_tac(@list.List([]))
  let t1221 = @drule.match_mp(woset_antisym())
  let t1223 = @tactics.first_assum(fn(
    x1222 : @kernel.Thm,
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
    @tactics.match_mp_tac(t1221(x1222))
  })
  let t1253 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.disch_tac,
        ),
        t1223,
      ),
      t1224,
    ),
    t1252,
  ])
  let t1220 = @simp.asm_rewrite_tac(@list.List([]))
  let t1219 = @tactics.first_assum(fn(
    x1217 : @kernel.Thm,
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
    let th = x1217
    @simp.rewrite_tac(@list.List([@drule.match_mp(fld_restrict())(th)]))
  })
  let t1216 = @simp.gen_rewrite_tac(
    fn(
      x1213 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1214 = @equal.rand_conv(x1213)
      fn(x1215 : @kernel.Term) -> @kernel.Thm raise { s1214(x1215) }
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1212 = @simp.rewrite_tac(
    @list.List([
      woset_v1(),
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t1211 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => (y : A) => (P : (A) -> Bool)(x) && P(y) && (l : (A, A) -> Bool)(x, y)"),
  )
  let t1210 = @simp.rewrite_rule(@list.List([ordinal()]))(wo_ordinal())
  let t1254 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @tactics.x_choose_then(@term_syntax.parse_term("(l : (A, A) -> Bool)"))(
                      @tactics.strip_assume_tac,
                    )(t1210),
                  ),
                  t1211,
                ),
                t1212,
              ),
              t1216,
            ),
            t1219,
          ),
          pbeta_tac,
        ),
        t1220,
      ),
      @tactics.conj_tac,
    ),
    t1253,
  )
  wo_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∃ l : (A, A) -> Bool, woset(l) && fld(l) == P"),
      t1254,
    ),
  )
}

///|
let wo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WO")

///|
/// `WO`
pub fn wo() -> @kernel.Thm {
  wo_c.get()
}

///|
/// WF_INSEG_WOSET
fn step_135() -> Unit raise {
  let t1372 = @meson.asm_meson_tac(@list.List([]))
  let t1371 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([inseg()])))
  let t1370 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1369 = @simp.rewrite_tac(@list.List([]))
  let t1368 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1362 : @kernel.Thm,
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
        let s1363 = @tactics.assume_tac(x1362)
        fn(
          x1364 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1363(x1364)
        }
      },
      fn(
        x1365 : @kernel.Thm,
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
        let s1366 = @tactics.mp_tac(x1365)
        fn(
          x1367 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1366(x1367)
        }
      },
    ),
  )
  let t1361 = @simp.asm_simp_tac(@list.List([linseg_fld(), properly()]))
  let t1360 = @tactics.first_x_assum(fn(
    x1351 : @kernel.Thm,
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
    let th_1 = x1351
    @simp.gen_rewrite_tac(
      fn(
        x1359 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1353 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1354 = @equal.land_conv(x1353)
          fn(x1355 : @kernel.Term) -> @kernel.Thm raise { s1354(x1355) }
        })(
          (fn(
            x1356 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1357 = @equal.land_conv(x1356)
            fn(x1358 : @kernel.Term) -> @kernel.Thm raise { s1357(x1358) }
          })(x1359),
        )
      },
      @list.List([@equal.sym(th_1)]),
    )
  })
  let t1350 = @tactics.undisch_tac(
    @term_syntax.parse_term("fld((l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool)), (a : ((A, A) -> Bool) -> A)(l(w)))"),
  )
  let t1349 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1348 = @simp.asm_simp_tac(@list.List([]))
  let t1347 = @tactics.first_x_assum(fn(
    x1344 : @kernel.Thm,
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
    let th = x1344
    let t1346 = @tactics.mp_tac(
      @bool.spec(@term_syntax.parse_term("(w : (A, A) -> Bool)"), th),
    )
    @tactics.then_tac(
      @tactics.mp_tac(
        @bool.spec(@term_syntax.parse_term("(l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool))"), th),
      ),
      t1346,
    )
  })
  let t1343 = @list.List([
    @meson.asm_meson_tac(@list.List([linseg_inseg(), inseg_trans()])),
    @tactics.disch_tac,
  ])
  let t1342 = @simp.asm_simp_tac(@list.List([@class.not_imp()]))
  let t1338 = @term_syntax.parse_term("(l : ((A, A) -> Bool, A, A) -> Bool)((w : (A, A) -> Bool))")
  let t1341 = @tactics.disch_then(fn(
    x1340 : @kernel.Thm,
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
      x1335 : @kernel.Thm,
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
      let s1336 = @tactics.mp_tac(x1335)
      fn(
        x1337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1336(x1337)
      }
    })(((x1339 : @kernel.Thm) => @bool.spec(t1338, x1339))(x1340))
  })
  let t1334 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x1328 : @kernel.Thm,
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
          let s1329 = @tactics.assume_tac(x1328)
          fn(
            x1330 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1329(x1330)
          }
        },
        fn(
          x1331 : @kernel.Thm,
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
          let s1332 = @tactics.mp_tac(x1331)
          fn(
            x1333 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1332(x1333)
          }
        },
      ),
    ),
  )
  let t1327 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(w : (A, A) -> Bool)"))(fn(
      x1324 : @kernel.Thm,
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
      let s1325 = @tactics.mp_tac(x1324)
      fn(
        x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1325(x1326)
      }
    }),
  )
  let t1323 = @list.List([
    @meson.asm_meson_tac(@list.List([inseg_refl()])),
    @tactics.all_tac,
  ])
  let t1322 = @list.List([
    @meson.asm_meson_tac(@list.List([inseg_subset_fld()])),
    @tactics.all_tac,
  ])
  let t1321 = @simp.rewrite_tac(
    @list.List([
      @theorems.unwind_thm2(),
      @theorems.forall_unwind_thm2(),
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
      @class.not_imp(),
    ]),
  )
  let t1320 = @simp.once_rewrite_tac(
    @list.List([@theorems.swap_exists_thm(), @theorems.swap_forall_thm()]),
  )
  let t1319 = @simp.rewrite_tac(
    @list.List([
      @theorems.unwind_thm2(),
      @theorems.forall_unwind_thm2(),
      @theorems.imp_conj(),
      @theorems.right_forall_imp_thm(),
    ]),
  )
  let t1318 = @simp.once_rewrite_tac(
    @list.List([@theorems.swap_exists_thm(), @theorems.swap_forall_thm()]),
  )
  let t1317 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.conj_assoc())]),
  )
  let t1316 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      @theorems.left_and_exists_thm(),
    ]),
  )
  let t1315 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((P : Bool) && (x : _) == (y : _)) == (x == y && P)"))]),
  )
  let t1314 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1310 = @term_syntax.parse_term("{(a : ((A, A) -> Bool) -> A)((x : (A, A) -> Bool)) | (P : ((A, A) -> Bool) -> Bool)(x) && inseg(x, (z : (A, A) -> Bool))}")
  let t1313 = @tactics.disch_then(fn(
    x1312 : @kernel.Thm,
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
      x1307 : @kernel.Thm,
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
      let s1308 = @tactics.mp_tac(x1307)
      fn(
        x1309 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1308(x1309)
      }
    })(((x1311 : @kernel.Thm) => @bool.spec(t1310, x1311))(x1312))
  })
  let t1306 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x1300 : @kernel.Thm,
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
          let s1301 = @tactics.assume_tac(x1300)
          fn(
            x1302 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1301(x1302)
          }
        },
        fn(
          x1303 : @kernel.Thm,
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
          let s1304 = @tactics.mp_tac(x1303)
          fn(
            x1305 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1304(x1305)
          }
        },
      ),
    ),
  )
  let t1298 = @simp.rewrite_tac(
    @list.List([
      woset(),
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t1299 = @list.List([@meson.asm_meson_tac(@list.List([])), t1298])
  let t1297 = @tactics.subgoal_then(@term_syntax.parse_term("woset((z : (A, A) -> Bool))"), fn(
    x1294 : @kernel.Thm,
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
    let s1295 = @tactics.mp_tac(x1294)
    fn(
      x1296 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1295(x1296)
    }
  })
  let t1291 = @term_syntax.parse_term("(z : (A, A) -> Bool)")
  let t1293 = @tactics.first_x_assum((x1292 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1291, x1292)
  })
  let t1289 = @term_syntax.parse_term("(l : ((A, A) -> Bool, A, A) -> Bool)")
  let t1290 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : ((A, A) -> Bool) -> A)"), t1289]),
  )
  let t1288 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @class.not_exists_thm()]),
  )
  let t1286 = @meson.asm_meson_tac(@list.List([inseg_linseg()]))
  let t1285 = @simp.asm_rewrite_tac(@list.List([]))
  let t1281 = @term_syntax.parse_term("(y : (A, A) -> Bool)")
  let t1284 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x1283 : @kernel.Thm,
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
        x1278 : @kernel.Thm,
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
        let s1279 = @tactics.mp_tac(x1278)
        fn(
          x1280 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1279(x1280)
        }
      })(((x1282 : @kernel.Thm) => @bool.spec(t1281, x1282))(x1283))
    }),
  )
  let t1277 = @simp.asm_rewrite_tac(@list.List([]))
  let t1276 = @class.asm_cases_tac(
    @term_syntax.parse_term("(P : ((A, A) -> Bool) -> Bool)((y : (A, A) -> Bool))"),
  )
  let t1287 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.x_gen_tac(@term_syntax.parse_term("(y : (A, A) -> Bool)")),
              t1276,
            ),
            t1277,
          ),
          t1284,
        ),
        t1285,
      ),
      t1286,
    ),
    @tactics.all_tac,
  ])
  let t1275 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : (A, A) -> Bool, ∃ a : A, ∃ z : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(y) → P(z) && fld(y, a) && linseg(y, a) == z"),
    fn(
      x1272 : @kernel.Thm,
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
      let s1273 = @tactics.mp_tac(x1272)
      fn(
        x1274 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1273(x1274)
      }
    },
  )
  let t1271 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1270 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : (A, A) -> Bool, (P : ((A, A) -> Bool) -> Bool)(x) → woset(x)"),
    fn(
      x1267 : @kernel.Thm,
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
      let s1268 = @tactics.assume_tac(x1267)
      fn(
        x1269 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1268(x1269)
      }
    },
  )
  let t1266 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1265 = @simp.gen_rewrite_tac(
    fn(
      x1264 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1258 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1259 = @equal.rand_conv(x1258)
        fn(x1260 : @kernel.Term) -> @kernel.Thm raise { s1259(x1260) }
      })(
        (fn(
          x1261 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1262 = @equal.once_depth_conv(x1261)
          fn(x1263 : @kernel.Term) -> @kernel.Thm raise { s1262(x1263) }
        })(x1264),
      )
    },
    @list.List([@class.not_forall_thm()]),
  )
  let t1257 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)"))]),
  )
  let t1256 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) == !(∀ x : _, !P(x))"),
      ),
    ]),
  )
  let t1255 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : ((A, A) -> Bool) -> Bool)"))
  let t1373 = @tactics.then_tac(
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.thenl(
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
                                                                @tactics.thenl(
                                                                  @tactics.then_tac(
                                                                    @tactics.then_tac(
                                                                      @tactics.then_tac(
                                                                        @tactics.then_tac(
                                                                          @tactics.then_tac(
                                                                            @tactics.thenl(
                                                                              @tactics.then_tac(
                                                                                @tactics.thenl(
                                                                                  @tactics.then_tac(
                                                                                    @tactics.then_tac(
                                                                                      @tactics.then_tac(
                                                                                        @tactics.then_tac(
                                                                                          @tactics.then_tac(
                                                                                            @tactics.then_tac(
                                                                                              @tactics.then_tac(
                                                                                                @tactics.then_tac(
                                                                                                  @simp.rewrite_tac(
                                                                                                    @list.List([
                                                                                                        @wf.wf(),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  t1255,
                                                                                                ),
                                                                                                @tactics.disch_tac,
                                                                                              ),
                                                                                              t1256,
                                                                                            ),
                                                                                            t1257,
                                                                                          ),
                                                                                          t1265,
                                                                                        ),
                                                                                        t1266,
                                                                                      ),
                                                                                      @tactics.disch_tac,
                                                                                    ),
                                                                                    t1270,
                                                                                  ),
                                                                                  t1271,
                                                                                ),
                                                                                t1275,
                                                                              ),
                                                                              t1287,
                                                                            ),
                                                                            t1288,
                                                                          ),
                                                                          t1290,
                                                                        ),
                                                                        @tactics.disch_tac,
                                                                      ),
                                                                      t1293,
                                                                    ),
                                                                    t1297,
                                                                  ),
                                                                  t1299,
                                                                ),
                                                                t1306,
                                                              ),
                                                              t1313,
                                                            ),
                                                            t1314,
                                                          ),
                                                          t1315,
                                                        ),
                                                        t1316,
                                                      ),
                                                      t1317,
                                                    ),
                                                    t1318,
                                                  ),
                                                  t1319,
                                                ),
                                                t1320,
                                              ),
                                              t1321,
                                            ),
                                            @tactics.conj_tac,
                                          ),
                                          t1322,
                                        ),
                                        @tactics.conj_tac,
                                      ),
                                      t1323,
                                    ),
                                    t1327,
                                  ),
                                  t1334,
                                ),
                                t1341,
                              ),
                              t1342,
                            ),
                            @tactics.conj_tac,
                          ),
                          t1343,
                        ),
                        t1347,
                      ),
                      t1348,
                    ),
                    t1349,
                  ),
                  t1350,
                ),
                t1360,
              ),
              t1361,
            ),
            t1368,
          ),
          t1369,
        ),
        t1370,
      ),
      t1371,
    ),
    t1372,
  )
  wf_inseg_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("WF((x : (A, A) -> Bool) => (y : (A, A) -> Bool) => woset(x) && woset(y) && inseg(x, y) && !(x == y))"),
      t1373,
    ),
  )
}

///|
let wf_inseg_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_INSEG_WOSET")

///|
/// `WF_INSEG_WOSET`
pub fn wf_inseg_woset() -> @kernel.Thm {
  wf_inseg_woset_c.get()
}

///|
/// WOSET_INSEG_ORDINAL
fn step_136() -> Unit raise {
  let t1376 = @simp.simp_tac(@list.List([ordinal()]))
  let t1375 = @tactics.match_mp_tac(
    @drule.match_mp(
      @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
        @wf.wf_subset(),
      ),
    )(wf_inseg_woset()),
  )
  let t1374 = @list.List([
    @meson.meson_tac(@list.List([ordinal_chained()])),
    @tactics.all_tac,
  ])
  let t1377 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              woset_wf(),
              @sets.in_(),
              properly(),
              @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
            ]),
          ),
          @tactics.conj_tac,
        ),
        t1374,
      ),
      t1375,
    ),
    t1376,
  )
  woset_inseg_ordinal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("woset((x : (A, A) -> Bool) => (y : (A, A) -> Bool) => ordinal(x) && ordinal(y) && inseg(x, y))"),
      t1377,
    ),
  )
}

///|
let woset_inseg_ordinal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WOSET_INSEG_ORDINAL",
)

///|
/// `WOSET_INSEG_ORDINAL`
pub fn woset_inseg_ordinal() -> @kernel.Thm {
  woset_inseg_ordinal_c.get()
}

///|
/// SUBWOSET_ISO_INSEG
fn step_137() -> Unit raise {
  let t1536 = @sets.set_tac(@list.List([]))
  let t1535 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1537 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.pop_assum(fn(
          x1532 : @kernel.Thm,
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
          let s1533 = @tactics.mp_tac(x1532)
          fn(
            x1534 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1533(x1534)
          }
        }),
      ),
      t1535,
    ),
    t1536,
  )
  let t1529 = @sets.set_tac(@list.List([]))
  let t1528 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1527 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1524 : @kernel.Thm,
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
      let s1525 = @tactics.mp_tac(x1524)
      fn(
        x1526 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1525(x1526)
      }
    }),
  )
  let t1530 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @meson.meson(
            @list.List([]),
            @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) && P(y, x) → (Q : (_, _) -> Bool)(x, y)) → (∀ x : _, ∀ y : _, P(x, y)) → (∀ x : _, ∀ y : _, Q(x, y))"),
          ),
        ),
        t1527,
      ),
      t1528,
    ),
    t1529,
  )
  let t1523 = @sets.set_tac(@list.List([]))
  let t1522 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1521 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1518 : @kernel.Thm,
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
      let s1519 = @tactics.mp_tac(x1518)
      fn(
        x1520 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1519(x1520)
      }
    }),
  )
  let t1513 = @term_syntax.parse_term("(f : (A) -> A)((y : A))")
  let t1514 = @list.List([@term_syntax.parse_term("(x : A)"), t1513])
  let t1517 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x1516 : @kernel.Thm,
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
        x1510 : @kernel.Thm,
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
        let s1511 = @tactics.mp_tac(x1510)
        fn(
          x1512 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1511(x1512)
        }
      })(((x1515 : @kernel.Thm) => @bool.specl(t1514, x1515))(x1516))
    }),
  )
  let t1531 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1517),
          t1521,
        ),
        t1522,
      ),
      t1523,
    ),
    t1530,
  ])
  let t1538 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("∀ x : A, ∀ y : A, IN(x, (s : (A) -> Bool)) && IN(y, s) && properly((l : (A, A) -> Bool), x, y) → properly(l, (f : (A) -> A)(x), f(y))"),
        fn(
          x1507 : @kernel.Thm,
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
          let s1508 = @tactics.mp_tac(x1507)
          fn(
            x1509 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1508(x1509)
          }
        },
      ),
      t1531,
    ),
    t1537,
  ])
  let t1505 = @sets.set_tac(@list.List([]))
  let t1504 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1506 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.pop_assum(fn(
            x1501 : @kernel.Thm,
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
            let s1502 = @tactics.mp_tac(x1501)
            fn(
              x1503 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1502(x1503)
            }
          }),
        ),
        t1504,
      ),
      t1505,
    ),
    @tactics.all_tac,
  ])
  let t1500 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ z : A, IN(x, (s : (A) -> Bool)) && (l : (A, A) -> Bool)(z, (f : (A) -> A)(x)) → (∃ u : A, IN(u, s) && l(u, x) && f(u) == z)"),
    fn(
      x1497 : @kernel.Thm,
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
      let s1498 = @tactics.assume_tac(x1497)
      fn(
        x1499 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1498(x1499)
      }
    },
  )
  let t1495 = @sets.set_tac(@list.List([]))
  let t1494 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1496 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.pop_assum(fn(
            x1491 : @kernel.Thm,
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
            let s1492 = @tactics.mp_tac(x1491)
            fn(
              x1493 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1492(x1493)
            }
          }),
        ),
        t1494,
      ),
      t1495,
    ),
    @tactics.all_tac,
  ])
  let t1490 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ z : A, IN(x, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), z, (f : (A) -> A)(x)) → (∃ u : A, IN(u, s) && properly(l, u, x) && f(u) == z)"),
    fn(
      x1487 : @kernel.Thm,
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
      let s1488 = @tactics.assume_tac(x1487)
      fn(
        x1489 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1488(x1489)
      }
    },
  )
  let t1486 = @simp.rewrite_tac(
    @list.List([
      @sets.in_univ(),
      @sets.in_image(),
      @sets.in_diff(),
      @sets.in_elim_thm(),
      @theorems.forall_and_thm(),
    ]),
  )
  let t1481 = @equal.binder_conv(@equal.sym_conv)
  let t1484 = @tactics.first_x_assum(fn(
    x1483 : @kernel.Thm,
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
      x1480 : @kernel.Thm,
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
    })(((x1482 : @kernel.Thm) => @equal.conv_rule(t1481, x1482))(x1483))
  })
  let t1479 = @sets.set_tac(@list.List([]))
  let t1478 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1485 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.pop_assum(fn(
            x1475 : @kernel.Thm,
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
            let s1476 = @tactics.mp_tac(x1475)
            fn(
              x1477 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1476(x1477)
            }
          }),
        ),
        t1478,
      ),
      t1479,
    ),
    t1484,
  ])
  let t1474 = @simp.asm_rewrite_tac(@list.List([]))
  let t1470 = @term_syntax.parse_term("DIFF(UNIV, IMAGE((f : (A) -> A), {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, (x : A))}))")
  let t1467 = @term_syntax.parse_term("(x : A)")
  let t1465 = @drule.match_mp(@theorems.mono_forall())
  let t1473 = @tactics.first_x_assum(fn(
    x1472 : @kernel.Thm,
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
      x1469 : @kernel.Thm,
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
        x1466 : @kernel.Thm,
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
          x1462 : @kernel.Thm,
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
          let s1463 = @tactics.mp_tac(x1462)
          fn(
            x1464 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1463(x1464)
          }
        })(t1465(x1466))
      })(((x1468 : @kernel.Thm) => @bool.gen(t1467, x1468))(x1469))
    })(((x1471 : @kernel.Thm) => @bool.spec(t1470, x1471))(x1472))
  })
  let t1458 = @sets.set_tac(@list.List([]))
  let t1457 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1456 = @tactics.repeat_tac(
    @tactics.pop_assum(fn(
      x1453 : @kernel.Thm,
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
      let s1454 = @tactics.mp_tac(x1453)
      fn(
        x1455 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1454(x1455)
      }
    }),
  )
  let t1452 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1449 : @kernel.Thm,
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
        let s1450 = @tactics.assume_tac(x1449)
        fn(
          x1451 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1450(x1451)
        }
      },
      @tactics.match_mp_tac,
    ),
  )
  let t1459 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @sets.in_diff(),
              @sets.in_image(),
              @sets.in_elim_thm(),
              @sets.in_univ(),
            ]),
          ),
          t1452,
        ),
        t1456,
      ),
      t1457,
    ),
    t1458,
  )
  let t1448 = @sets.set_tac(@list.List([]))
  let t1447 = @simp.rewrite_tac(@list.List([properly(), woset()]))
  let t1460 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.pop_assum(fn(
            x1444 : @kernel.Thm,
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
            let s1445 = @tactics.mp_tac(x1444)
            fn(
              x1446 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1445(x1446)
            }
          }),
        ),
        t1447,
      ),
      t1448,
    ),
    t1459,
  ])
  let t1443 = @simp.asm_rewrite_tac(@list.List([]))
  let t1439 = @term_syntax.parse_term("DIFF(UNIV, IMAGE((f : (A) -> A), {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, (x : A))}))")
  let t1442 = @tactics.first_x_assum(fn(
    x1441 : @kernel.Thm,
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
      x1436 : @kernel.Thm,
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
      let s1437 = @tactics.mp_tac(x1436)
      fn(
        x1438 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1437(x1438)
      }
    })(((x1440 : @kernel.Thm) => @bool.spec(t1439, x1440))(x1441))
  })
  let t1435 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t1434 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t1433 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1432 = @simp.rewrite_tac(@list.List([@wf.wf_ind()]))
  let t1430 = @simp.rewrite_rule(@list.List([woset_wf(), properly()]))
  let t1461 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.first_assum(fn(
                        x1431 : @kernel.Thm,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
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
                          x1429 : @kernel.Thm,
                        ) -> ((
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
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
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
                            x1426 : @kernel.Thm,
                          ) -> ((
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
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise) raise {
                            let s1427 = @tactics.mp_tac(x1426)
                            fn(
                              x1428 : (
                                @list.List[(String, @kernel.Thm)],
                                @kernel.Term,
                              ),
                            ) -> (
                              (
                                @list.List[@kernel.Term],
                                (
                                  @list.List[(Int64, @kernel.Term)],
                                  @list.List[(@kernel.Term, @kernel.Term)],
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
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
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                                @list.List[@kernel.Thm],
                              ) -> @kernel.Thm raise,
                            ) raise {
                              s1427(x1428)
                            }
                          })(@bool.conjunct2(x1429))
                        })(t1430(x1431))
                      }),
                      t1432,
                    ),
                    t1433,
                  ),
                  t1434,
                ),
                t1435,
              ),
              @tactics.strip_tac,
            ),
            t1442,
          ),
          t1443,
        ),
        @tactics.ants_tac,
      ),
      t1460,
    ),
    @tactics.all_tac,
  ])
  let t1425 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, IN(x, (s : (A) -> Bool)) → (l : (A, A) -> Bool)((f : (A) -> A)(x), x)"),
    fn(
      x1422 : @kernel.Thm,
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
      let s1423 = @tactics.assume_tac(x1422)
      fn(
        x1424 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1423(x1424)
      }
    },
  )
  let t1421 = @tactics.disch_then(fn(
    x1420 : @kernel.Thm,
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
      x1417 : @kernel.Thm,
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
      let s1418 = @tactics.assume_tac(x1417)
      fn(
        x1419 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1418(x1419)
      }
    })(@equal.gsym(x1420))
  })
  let t1416 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> A)"))
  let t1414 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1413 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1412 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1411 = @simp.rewrite_tac(@list.List([properly()]))
  let t1408 = @drule.match_mp(@wf.wf_rec())
  let t1410 = @tactics.disch_then(fn(
    x1409 : @kernel.Thm,
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
    @tactics.match_mp_tac(t1408(x1409))
  })
  let t1406 = @simp.rewrite_rule(@list.List([woset_wf(), properly()]))
  let t1415 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.first_assum(fn(
                x1407 : @kernel.Thm,
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
                  x1405 : @kernel.Thm,
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
                    x1402 : @kernel.Thm,
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise) raise {
                    let s1403 = @tactics.mp_tac(x1402)
                    fn(
                      x1404 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
                      (
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                        @list.List[@kernel.Thm],
                      ) -> @kernel.Thm raise,
                    ) raise {
                      s1403(x1404)
                    }
                  })(@bool.conjunct2(x1405))
                })(t1406(x1407))
              }),
              t1410,
            ),
            t1411,
          ),
          t1412,
        ),
        @tactics.ap_term_tac,
      ),
      t1413,
    ),
    t1414,
  ])
  let t1401 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : (A) -> A, ∀ x : A, f(x) == (m : ((A) -> Bool) -> A)(DIFF(UNIV, IMAGE(f, {(u : A) | IN(u, (s : (A) -> Bool)) && properly((l : (A, A) -> Bool), u, x)})))"),
    fn(
      x1398 : @kernel.Thm,
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
      let s1399 = @tactics.mp_tac(x1398)
      fn(
        x1400 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1399(x1400)
      }
    },
  )
  let t1397 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : ((A) -> Bool) -> A)"))
  let t1396 = @simp.rewrite_tac(
    @list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]),
  )
  let t1395 = @simp.gen_rewrite_tac(
    fn(
      x1394 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1388 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1389 = @equal.land_conv(x1388)
        fn(x1390 : @kernel.Term) -> @kernel.Thm raise { s1389(x1390) }
      })(
        (fn(
          x1391 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1392 = @equal.binder_conv(x1391)
          fn(x1393 : @kernel.Term) -> @kernel.Thm raise { s1392(x1393) }
        })(x1394),
      )
    },
    @list.List([@class.right_imp_exists_thm()]),
  )
  let t1387 = @simp.asm_rewrite_tac(
    @list.List([@sets.univ(), @sets.member_not_empty()]),
  )
  let t1384 = @simp.gen_rewrite_rule(
    fn(
      x1383 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1383
    },
    @list.List([woset()]),
  )
  let t1386 = @tactics.first_assum(fn(
    x1385 : @kernel.Thm,
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
      x1382 : @kernel.Thm,
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
        x1381 : @list.List[@kernel.Thm],
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
          x1378 : @kernel.Thm,
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
          let s1379 = @tactics.mp_tac(x1378)
          fn(
            x1380 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1379(x1380)
          }
        })(@lib.last(x1381))
      })(@bool.conjuncts_rule(x1382))
    })(t1384(x1385))
  })
  let t1539 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.repeat_tac(
                                                    @tactics.strip_tac,
                                                  ),
                                                  t1386,
                                                ),
                                                t1387,
                                              ),
                                              t1395,
                                            ),
                                            t1396,
                                          ),
                                          t1397,
                                        ),
                                        @tactics.disch_tac,
                                      ),
                                      t1401,
                                    ),
                                    t1415,
                                  ),
                                  t1416,
                                ),
                                t1421,
                              ),
                              t1425,
                            ),
                            t1461,
                          ),
                          t1473,
                        ),
                        t1474,
                      ),
                      @tactics.ants_tac,
                    ),
                    t1485,
                  ),
                  t1486,
                ),
                @tactics.strip_tac,
              ),
              t1490,
            ),
            t1496,
          ),
          t1500,
        ),
        t1506,
      ),
      @tactics.conj_tac,
    ),
    t1538,
  )
  subwoset_iso_inseg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, ∀ s : (A) -> Bool, woset(l) && fld(l) == UNIV → (∃ f : (A) -> A, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) → l(f(x), f(y)) == l(x, y)) && (∀ x : A, ∀ y : A, IN(y, IMAGE(f, s)) && l(x, y) → IN(x, IMAGE(f, s))))"),
      t1539,
    ),
  )
}

///|
let subwoset_iso_inseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBWOSET_ISO_INSEG",
)

///|
/// `SUBWOSET_ISO_INSEG`
pub fn subwoset_iso_inseg() -> @kernel.Thm {
  subwoset_iso_inseg_c.get()
}

///|
/// HP
fn step_138() -> Unit raise {
  let t1803 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(subset_pred())]))
  let t1802 = @term_syntax.parse_term("(z : A)")
  let t1804 = @tactics.then_tac(
    @tactics.spec_tac(@term_syntax.parse_term("(z : A)"), t1802),
    t1803,
  )
  let t1799 = @tactics.exists_tac(@term_syntax.parse_term("(y : A)"))
  let t1796 = @simp.rewrite_rule(@list.List([subset_pred()]))
  let t1798 = @tactics.first_assum(fn(
    x1797 : @kernel.Thm,
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
    @tactics.match_mp_tac(t1796(x1797))
  })
  let t1795 = @simp.asm_rewrite_tac(@list.List([]))
  let t1794 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1789 = @term_syntax.parse_term("(f : (A) -> A)((y : A))")
  let t1790 = @list.List([@term_syntax.parse_term("(z : A)"), t1789])
  let t1793 = @tactics.disch_then(fn(
    x1792 : @kernel.Thm,
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
      x1786 : @kernel.Thm,
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
      let s1787 = @tactics.mp_tac(x1786)
      fn(
        x1788 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1787(x1788)
      }
    })(((x1791 : @kernel.Thm) => @bool.specl(t1790, x1791))(x1792))
  })
  let t1785 = @simp.rewrite_tac(@list.List([chain(), @sets.in_()]))
  let t1784 = @tactics.undisch_tac(@term_syntax.parse_term("chain((l : (A, A) -> Bool), (Q : (A) -> Bool))"))
  let t1800 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)")),
                      @tactics.disch_tac,
                    ),
                    t1784,
                  ),
                  t1785,
                ),
                t1793,
              ),
              t1794,
            ),
            t1795,
          ),
          t1798,
        ),
        @tactics.beta_tac,
      ),
      t1799,
    ),
    @tactics.refl_tac,
  )
  let t1783 = @simp.asm_rewrite_tac(@list.List([]))
  let t1782 = @tactics.exists_tac(@term_syntax.parse_term("(z : A)"))
  let t1781 = @simp.asm_rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1776 = @term_syntax.parse_term("(z : A)")
  let t1777 = @list.List([@term_syntax.parse_term("(z : A)"), t1776])
  let t1780 = @tactics.disch_then(fn(
    x1779 : @kernel.Thm,
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
      x1773 : @kernel.Thm,
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
      let s1774 = @tactics.mp_tac(x1773)
      fn(
        x1775 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1774(x1775)
      }
    })(((x1778 : @kernel.Thm) => @bool.specl(t1777, x1778))(x1779))
  })
  let t1772 = @simp.rewrite_tac(@list.List([chain(), @sets.in_()]))
  let t1801 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.undisch_tac(
                  @term_syntax.parse_term("chain((l : (A, A) -> Bool), (Q : (A) -> Bool))"),
                ),
                t1772,
              ),
              t1780,
            ),
            t1781,
          ),
          @tactics.disch_tac,
        ),
        t1782,
      ),
      t1783,
    ),
    t1800,
  ])
  let t1771 = @tactics.subgoal_then(
    @term_syntax.parse_term("fld((l : (A, A) -> Bool), (z : A)) && (∀ y : A, properly((w : (A, A) -> Bool), y, z) → l(z, (f : (A) -> A)(y)) || l(f(y), z))"),
    fn(
      x1769 : @kernel.Thm,
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
      let th_1 = x1769
      @simp.rewrite_tac(@list.List([th_1]))
    },
  )
  let t1765 = @term_syntax.parse_term("(z : A)")
  let t1768 = @tactics.first_assum(fn(
    x1767 : @kernel.Thm,
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
      x1764 : @kernel.Thm,
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
        x1761 : @kernel.Thm,
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
        let s1762 = @tactics.subst1_tac(x1761)
        fn(
          x1763 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1762(x1763)
        }
      })(@equal.sym(x1764))
    })(((x1766 : @kernel.Thm) => @bool.spec(t1765, x1766))(x1767))
  })
  let t1760 = @tactics.exists_tac(@term_syntax.parse_term("(z : A)"))
  let t1805 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.disch_tac, @tactics.beta_tac),
              t1760,
            ),
            t1768,
          ),
          t1771,
        ),
        @tactics.conj_tac,
      ),
      t1801,
    ),
    t1804,
  ])
  let t1759 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : A)"))
  let t1758 = @simp.gen_rewrite_tac(
    fn(
      x1757 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1757
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1756 = @tactics.x_gen_tac(@term_syntax.parse_term("(Q : (A) -> Bool)"))
  let t1755 = @simp.asm_rewrite_tac(@list.List([]))
  let t1753 = @tactics.disch_then(
    @tactics.conjuncts_then(
      @tactics.choose_then(fn(
        x1750 : @kernel.Thm,
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
        let s1751 = @tactics.subst1_tac(x1750)
        fn(
          x1752 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1751(x1752)
        }
      }),
    ),
  )
  let t1749 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1754 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([chain(), @sets.in_()])),
          @tactics.beta_tac,
        ),
        t1749,
      ),
      t1753,
    ),
    @tactics.all_tac,
  ])
  let t1748 = @tactics.subgoal_then(
    @term_syntax.parse_term("chain((l : (A, A) -> Bool), (y : A) => ∃ x : A, y == (f : (A) -> A)(x))"),
    fn(
      x1745 : @kernel.Thm,
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
      let s1746 = @tactics.assume_tac(x1745)
      fn(
        x1747 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1746(x1747)
      }
    },
  )
  let t1744 = @tactics.exists_tac(@term_syntax.parse_term("(y : A) => ∃ x : A, y == (f : (A) -> A)(x)"))
  let t1740 = @tactics.imp_res_then(fn(
    x1737 : @kernel.Thm,
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
    let s1738 = @tactics.accept_tac(x1737)
    fn(
      x1739 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1738(x1739)
    }
  })
  let t1742 = @tactics.first_assum(fn(
    x1741 : @kernel.Thm,
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
    t1740(@bool.conjunct2(x1741))
  })
  let t1736 = @simp.asm_rewrite_tac(@list.List([]))
  let t1735 = @tactics.try_tac(@class.cond_cases_tac)
  let t1729 = @term_syntax.parse_term("(x : A)")
  let t1732 = @tactics.first_assum(fn(
    x1731 : @kernel.Thm,
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
      x1728 : @kernel.Thm,
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
        x1725 : @kernel.Thm,
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
        let s1726 = @tactics.subst1_tac(x1725)
        fn(
          x1727 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1726(x1727)
        }
      })(@equal.sym(x1728))
    })(((x1730 : @kernel.Thm) => @bool.spec(t1729, x1730))(x1731))
  })
  let t1721 = @term_syntax.parse_term("(y : A)")
  let t1724 = @tactics.first_assum(fn(
    x1723 : @kernel.Thm,
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
      x1720 : @kernel.Thm,
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
        x1717 : @kernel.Thm,
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
        let s1718 = @tactics.subst1_tac(x1717)
        fn(
          x1719 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1718(x1719)
        }
      })(@equal.sym(x1720))
    })(((x1722 : @kernel.Thm) => @bool.spec(t1721, x1722))(x1723))
  })
  let t1733 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()])),
    t1724,
  )
  let t1716 = @tactics.imp_res_then(@tactics.match_mp_tac)(qoset_refl())
  let t1734 = @list.List([
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1716),
    t1733,
    t1732,
  ])
  let t1715 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
      x1712 : @kernel.Thm,
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
      let s1713 = @tactics.assume_tac(x1712)
      fn(
        x1714 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1713(x1714)
      }
    }),
  )
  let t1711 = @simp.asm_rewrite_tac(@list.List([]))
  let t1706 = @term_syntax.parse_term("(y : A)")
  let t1707 = @list.List([@term_syntax.parse_term("(x : A)"), t1706])
  let t1710 = @tactics.imp_res_then(fn(
    x1709 : @kernel.Thm,
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
      x1703 : @kernel.Thm,
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
      let s1704 = @tactics.mp_tac(x1703)
      fn(
        x1705 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1704(x1705)
      }
    })(((x1708 : @kernel.Thm) => @bool.specl(t1707, x1708))(x1709))
  })(woset_total_lt())
  let t1743 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1710),
                t1711,
              ),
              t1715,
            ),
            t1734,
          ),
          t1735,
        ),
        t1736,
      ),
      t1742,
    ),
    @tactics.all_tac,
  ])
  let t1702 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, (l : (A, A) -> Bool)((f : (A) -> A)(x), f(y)) || l(f(y), f(x))"),
    fn(
      x1699 : @kernel.Thm,
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
      let s1700 = @tactics.assume_tac(x1699)
      fn(
        x1701 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1700(x1701)
      }
    },
  )
  let t1697 = @simp.asm_rewrite_tac(@list.List([]))
  let t1696 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t1695 = @simp.asm_rewrite_tac(@list.List([]))
  let t1694 = @tactics.disch_then(fn(
    x1686 : @kernel.Thm,
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
    let th = x1686
    @tactics.first_assum(fn(
      x1693 : @kernel.Thm,
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
        x1692 : @kernel.Thm,
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
          x1688 : @kernel.Thm,
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
          let s1689 = @tactics.mp_tac(x1688)
          fn(
            x1690 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1689(x1690)
          }
        })(
          (fn(x1691 : @kernel.Thm) -> @kernel.Thm raise {
            @drule.match_mp(x1691)(th)
          })(x1692),
        )
      })(@bool.conjunct2(x1693))
    })
  })
  let t1684 = @tactics.first_assum(fn(
    x1681 : @kernel.Thm,
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
    let s1682 = @tactics.accept_tac(x1681)
    fn(
      x1683 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1682(x1683)
    }
  })
  let t1680 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t1685 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([properly()])), t1680),
      t1684,
    ),
    @tactics.all_tac,
  ])
  let t1679 = @tactics.subgoal_then(
    @term_syntax.parse_term("properly((w : (A, A) -> Bool), (b : A), (x : A))"),
    fn(
      x1676 : @kernel.Thm,
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
      let s1677 = @tactics.mp_tac(x1676)
      fn(
        x1678 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1677(x1678)
      }
    },
  )
  let t1675 = @simp.asm_rewrite_tac(@list.List([]))
  let t1674 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (b : A)"))
  let t1673 = @simp.asm_rewrite_tac(@list.List([]))
  let t1669 = @term_syntax.parse_term("(x : A)")
  let t1672 = @tactics.first_assum(fn(
    x1671 : @kernel.Thm,
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
      x1668 : @kernel.Thm,
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
        x1665 : @kernel.Thm,
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
        let s1666 = @tactics.subst1_tac(x1665)
        fn(
          x1667 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1666(x1667)
        }
      })(@equal.sym(x1668))
    })(((x1670 : @kernel.Thm) => @bool.spec(t1669, x1670))(x1671))
  })
  let t1664 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ x : A, (w : (A, A) -> Bool)((b : A), (f : (A) -> A)(x))"),
  )
  let t1698 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.gen_tac,
                              @tactics.mp_tac(
                                @bool.spec(@term_syntax.parse_term("(x : A)"), t1664),
                              ),
                            ),
                            t1672,
                          ),
                          @class.cond_cases_tac,
                        ),
                        t1673,
                      ),
                      t1674,
                    ),
                    t1675,
                  ),
                  @tactics.disch_tac,
                ),
                t1679,
              ),
              t1685,
            ),
            t1694,
          ),
          t1695,
        ),
        t1696,
      ),
      t1697,
    ),
    @tactics.all_tac,
  ])
  let t1663 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, (l : (A, A) -> Bool)((b : A), (f : (A) -> A)(x)) || l(f(x), b)"),
    fn(
      x1660 : @kernel.Thm,
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
      let s1661 = @tactics.assume_tac(x1660)
      fn(
        x1662 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1661(x1662)
      }
    },
  )
  let t1657 = @tactics.ante_res_then(fn(
    x1656 : @kernel.Thm,
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
      x1653 : @kernel.Thm,
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
      let s1654 = @tactics.assume_tac(x1653)
      fn(
        x1655 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1654(x1655)
      }
    })(@bool.gen_all(x1656))
  })
  let t1659 = @tactics.first_assum(fn(
    x1658 : @kernel.Thm,
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
    t1657(@bool.spec_all(x1658))
  })
  let t1651 = @simp.asm_rewrite_tac(@list.List([]))
  let t1648 = @term_syntax.parse_term("(x : A)")
  let t1652 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.first_assum(fn(
            x1650 : @kernel.Thm,
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
              x1647 : @kernel.Thm,
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
                x1644 : @kernel.Thm,
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
                let s1645 = @tactics.subst1_tac(x1644)
                fn(
                  x1646 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s1645(x1646)
                }
              })(@equal.sym(x1647))
            })(((x1649 : @kernel.Thm) => @bool.spec(t1648, x1649))(x1650))
          }),
        ),
        @class.cond_cases_tac,
      ),
      t1651,
    ),
    @tactics.all_tac,
  ])
  let t1643 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, fld((l : (A, A) -> Bool), (f : (A) -> A)(x))"),
    fn(
      x1640 : @kernel.Thm,
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
      let s1641 = @tactics.assume_tac(x1640)
      fn(
        x1642 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1641(x1642)
      }
    },
  )
  let t1638 = @simp.asm_rewrite_tac(@list.List([]))
  let t1637 = @simp.rewrite_tac(@list.List([@class.cond_id()]))
  let t1634 = @term_syntax.parse_term("(b : A)")
  let t1639 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x1636 : @kernel.Thm,
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
            x1633 : @kernel.Thm,
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
              x1630 : @kernel.Thm,
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
              let s1631 = @tactics.subst1_tac(x1630)
              fn(
                x1632 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s1631(x1632)
              }
            })(@equal.sym(x1633))
          })(((x1635 : @kernel.Thm) => @bool.spec(t1634, x1635))(x1636))
        }),
        t1637,
      ),
      t1638,
    ),
    @tactics.all_tac,
  ])
  let t1629 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (A) -> A)((b : A)) == b"), fn(
    x1626 : @kernel.Thm,
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
    let s1627 = @tactics.assume_tac(x1626)
    fn(
      x1628 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1627(x1628)
    }
  })
  let t1625 = @tactics.imp_res_then(
    @tactics.imp_res_then(fn(
      x1622 : @kernel.Thm,
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
      let s1623 = @tactics.assume_tac(x1622)
      fn(
        x1624 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1623(x1624)
      }
    }),
  )(qoset_refl())
  let t1618 = @meson.asm_meson_tac(@list.List([]))
  let t1617 = @simp.asm_rewrite_tac(@list.List([]))
  let t1616 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t1615 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1614 = @simp.rewrite_tac(@list.List([]))
  let t1612 = @drule.match_mp(@wf.wf_rec())
  let t1619 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(fn(
              x1613 : @kernel.Thm,
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
              @tactics.match_mp_tac(t1612(x1613))
            }),
            t1614,
          ),
          t1615,
        ),
        t1616,
      ),
      t1617,
    ),
    t1618,
  )
  let t1611 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t1620 = @list.List([
    @tactics.then_tac(
      @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([woset_wf()]))),
      t1611,
    ),
    t1619,
  ])
  let t1621 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("WF((x : A) => (y : A) => properly((w : (A, A) -> Bool), x, y))"),
        fn(
          x1608 : @kernel.Thm,
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
          let s1609 = @tactics.mp_tac(x1608)
          fn(
            x1610 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1609(x1610)
          }
        },
      ),
      t1620,
    ),
    @tactics.all_tac,
  ])
  let t1607 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : (A) -> A, ∀ x : A, f(x) == (if fld((l : (A, A) -> Bool), x) && (∀ y : A, properly((w : (A, A) -> Bool), y, x) → l(x, f(y)) || l(f(y), x)) { x } else { (b : A) })"),
    fn(
      x1606 : @kernel.Thm,
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
      @tactics.choose_tac(@equal.gsym(x1606))
    },
  )
  let t1603 = @simp.asm_rewrite_tac(@list.List([]))
  let t1602 = @tactics.imp_res_then(fn(
    x1601 : @kernel.Thm,
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
      x1598 : @kernel.Thm,
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
      let s1599 = @tactics.assume_tac(x1598)
      fn(
        x1600 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1599(x1600)
      }
    })(@equal.gsym(x1601))
  })(qoset_fldeq())
  let t1593 = @term_syntax.parse_term("(u : A)")
  let t1594 = @list.List([@term_syntax.parse_term("(u : A)"), t1593])
  let t1597 = @tactics.disch_then(fn(
    x1596 : @kernel.Thm,
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
      x1590 : @kernel.Thm,
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
      let s1591 = @tactics.mp_tac(x1590)
      fn(
        x1592 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1591(x1592)
      }
    })(((x1595 : @kernel.Thm) => @bool.specl(t1594, x1595))(x1596))
  })
  let t1589 = @simp.rewrite_tac(@list.List([]))
  let t1585 = @simp.gen_rewrite_rule(
    fn(
      x1584 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1584
    },
    @list.List([@class.not_forall_thm()]),
  )
  let t1586 = @tactics.x_choose_then(@term_syntax.parse_term("(u : A)"))(fn(
    x1581 : @kernel.Thm,
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
    let s1582 = @tactics.mp_tac(x1581)
    fn(
      x1583 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1582(x1583)
    }
  })
  let t1588 = @tactics.disch_then(fn(
    x1587 : @kernel.Thm,
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
    t1586(t1585(x1587))
  })
  let t1580 = @simp.rewrite_tac(@list.List([]))
  let t1579 = @tactics.conv_tac(@class.contrapos_conv)
  let t1578 = @simp.gen_rewrite_tac(
    fn(
      x1575 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1576 = @equal.rand_conv(x1575)
      fn(x1577 : @kernel.Term) -> @kernel.Thm raise { s1576(x1577) }
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1574 = @simp.rewrite_tac(
    @list.List([chain(), @sets.in_(), subset_pred()]),
  )
  let t1573 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => false"))
  let t1571 = @simp.gen_rewrite_rule(
    fn(
      x1570 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1570
    },
    @list.List([@class.not_exists_thm()]),
  )
  let t1604 = @tactics.then_tac(
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
                          @tactics.first_assum(fn(
                            x1572 : @kernel.Thm,
                          ) -> ((
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
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
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
                              x1567 : @kernel.Thm,
                            ) -> ((
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
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                                @list.List[@kernel.Thm],
                              ) -> @kernel.Thm raise,
                            ) raise) raise {
                              let s1568 = @tactics.assume_tac(x1567)
                              fn(
                                x1569 : (
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
                                s1568(x1569)
                              }
                            })(t1571(x1572))
                          }),
                          t1573,
                        ),
                        t1574,
                      ),
                      @tactics.gen_tac,
                    ),
                    t1578,
                  ),
                  t1579,
                ),
                t1580,
              ),
              t1588,
            ),
            t1589,
          ),
          @tactics.disch_tac,
        ),
        t1597,
      ),
      t1602,
    ),
    t1603,
  )
  let t1605 = @list.List([
    @tactics.disch_then(
      @tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(
        @tactics.strip_assume_tac,
      ),
    ),
    t1604,
  ])
  let t1566 = @simp.asm_rewrite_tac(@list.List([]))
  let t1565 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : A, fld((l : (A, A) -> Bool), x)"))
  let t1564 = @simp.asm_rewrite_tac(@list.List([]))
  let t1560 = @term_syntax.parse_term("(x : A) => fld((l : (A, A) -> Bool), x)")
  let t1563 = @tactics.imp_res_then(fn(
    x1562 : @kernel.Thm,
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
      x1557 : @kernel.Thm,
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
      let s1558 = @tactics.mp_tac(x1557)
      fn(
        x1559 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1558(x1559)
      }
    })(((x1561 : @kernel.Thm) => @bool.spec(t1560, x1561))(x1562))
  })(woset_well())
  let t1556 = @simp.rewrite_tac(@list.List([]))
  let t1555 = @simp.gen_rewrite_tac(
    fn(
      x1552 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1553 = @equal.land_conv(x1552)
      fn(x1554 : @kernel.Term) -> @kernel.Thm raise { s1553(x1554) }
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t1551 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1545 : @kernel.Thm,
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
        let s1546 = @tactics.assume_tac(x1545)
        fn(
          x1547 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1546(x1547)
        }
      },
      fn(
        x1548 : @kernel.Thm,
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
        let s1549 = @tactics.mp_tac(x1548)
        fn(
          x1550 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1549(x1550)
        }
      },
    ),
  )
  let t1543 = @bool.spec(@term_syntax.parse_term("(x : A) => true"), wo())
  let t1544 = @tactics.x_choose_then(@term_syntax.parse_term("(w : (A, A) -> Bool)"))(fn(
    x1540 : @kernel.Thm,
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
    let s1541 = @tactics.mp_tac(x1540)
    fn(
      x1542 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1541(x1542)
    }
  })(t1543)
  let t1806 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.thenl(
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.thenl(
                                            @tactics.then_tac(
                                              @tactics.thenl(
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
                                                                        @tactics.gen_tac,
                                                                        @tactics.disch_tac,
                                                                      ),
                                                                      t1544,
                                                                    ),
                                                                    t1551,
                                                                  ),
                                                                  t1555,
                                                                ),
                                                                @tactics.beta_tac,
                                                              ),
                                                              t1556,
                                                            ),
                                                            @tactics.disch_tac,
                                                          ),
                                                          t1563,
                                                        ),
                                                        @tactics.beta_tac,
                                                      ),
                                                      t1564,
                                                    ),
                                                    t1565,
                                                  ),
                                                  t1566,
                                                ),
                                                t1605,
                                              ),
                                              t1607,
                                            ),
                                            t1621,
                                          ),
                                          t1625,
                                        ),
                                        t1629,
                                      ),
                                      t1639,
                                    ),
                                    t1643,
                                  ),
                                  t1652,
                                ),
                                t1659,
                              ),
                              t1663,
                            ),
                            t1698,
                          ),
                          t1702,
                        ),
                        t1743,
                      ),
                      t1744,
                    ),
                    t1748,
                  ),
                  t1754,
                ),
                t1755,
              ),
              t1756,
            ),
            @tactics.strip_tac,
          ),
          t1758,
        ),
        t1759,
      ),
      @tactics.eq_tac,
    ),
    t1805,
  )
  hp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) → (∃ P : (A) -> Bool, chain(l, P) && (∀ Q : (A) -> Bool, chain(l, Q) && SUBSET(P, Q) → Q == P))"),
      t1806,
    ),
  )
}

///|
let hp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HP")

///|
/// `HP`
pub fn hp() -> @kernel.Thm {
  hp_c.get()
}

///|
/// ZL_STRONG
fn step_139() -> Unit raise {
  let t1870 = @meson.asm_meson_tac(@list.List([]))
  let t1868 = @tactics.disch_then(fn(
    x1866 : @kernel.Thm,
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
    let th = x1866
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1869 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([subset_pred()])),
          @tactics.gen_tac,
        ),
        @tactics.beta_tac,
      ),
      t1868,
    ),
    @tactics.all_tac,
  ])
  let t1865 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((M : (A) -> Bool), (x : A) => M(x) || x == (z : A))"),
    fn(
      x1862 : @kernel.Thm,
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
      let s1863 = @tactics.mp_tac(x1862)
      fn(
        x1864 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1863(x1864)
      }
    },
  )
  let t1856 = @simp.asm_rewrite_tac(@list.List([]))
  let t1855 = @tactics.exists_tac(@term_syntax.parse_term("(m : A)"))
  let t1854 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1852 = @drule.match_mp(qoset_refl())
  let t1857 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.first_assum(fn(
          x1853 : @kernel.Thm,
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
          @tactics.match_mp_tac(t1852(x1853))
        }),
        t1854,
      ),
      t1855,
    ),
    t1856,
  )
  let t1851 = @tactics.first_assum(fn(
    x1848 : @kernel.Thm,
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
    let s1849 = @tactics.accept_tac(x1848)
    fn(
      x1850 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1849(x1850)
    }
  })
  let t1847 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1846 = @simp.asm_rewrite_tac(@list.List([]))
  let t1845 = @tactics.exists_tac(@term_syntax.parse_term("(m : A)"))
  let t1843 = @drule.match_mp(qoset_trans())
  let t1858 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disj2_tac,
            @tactics.first_assum(fn(
              x1844 : @kernel.Thm,
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
              @tactics.match_mp_tac(t1843(x1844))
            }),
          ),
          t1845,
        ),
        t1846,
      ),
      t1847,
    ),
    t1851,
  )
  let t1842 = @tactics.first_assum(fn(
    x1839 : @kernel.Thm,
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
    let s1840 = @tactics.accept_tac(x1839)
    fn(
      x1841 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1840(x1841)
    }
  })
  let t1838 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1837 = @simp.asm_rewrite_tac(@list.List([]))
  let t1836 = @tactics.exists_tac(@term_syntax.parse_term("(m : A)"))
  let t1834 = @drule.match_mp(qoset_trans())
  let t1859 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disj1_tac,
            @tactics.first_assum(fn(
              x1835 : @kernel.Thm,
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
              @tactics.match_mp_tac(t1834(x1835))
            }),
          ),
          t1836,
        ),
        t1837,
      ),
      t1838,
    ),
    t1842,
  )
  let t1833 = @simp.asm_rewrite_tac(@list.List([]))
  let t1832 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1831 = @simp.rewrite_tac(@list.List([chain(), @sets.in_()]))
  let t1860 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.undisch_tac(@term_syntax.parse_term("chain((l : (A, A) -> Bool), (M : (A) -> Bool))")),
          t1831,
        ),
        t1832,
      ),
      t1833,
    ),
    t1859,
    t1858,
    t1857,
  ])
  let t1830 = @simp.asm_rewrite_tac(@list.List([]))
  let t1829 = @tactics.disch_then(
    @tactics.conjuncts_then(@tactics.disj_cases_tac),
  )
  let t1828 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1861 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([chain(), @sets.in_()])),
              @tactics.beta_tac,
            ),
            t1828,
          ),
          t1829,
        ),
        t1830,
      ),
      t1860,
    ),
    @tactics.all_tac,
  ])
  let t1827 = @tactics.subgoal_then(
    @term_syntax.parse_term("chain((l : (A, A) -> Bool), (x : A) => (M : (A) -> Bool)(x) || x == (z : A))"),
    fn(
      x1824 : @kernel.Thm,
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
      let s1825 = @tactics.mp_tac(x1824)
      fn(
        x1826 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1825(x1826)
      }
    },
  )
  let t1823 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : A)"))
  let t1822 = @simp.asm_rewrite_tac(@list.List([]))
  let t1821 = @tactics.exists_tac(@term_syntax.parse_term("(m : A)"))
  let t1820 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : A)"))(@tactics.strip_assume_tac),
  )
  let t1819 = @simp.asm_rewrite_tac(@list.List([]))
  let t1815 = @term_syntax.parse_term("(M : (A) -> Bool)")
  let t1818 = @tactics.disch_then(fn(
    x1817 : @kernel.Thm,
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
      x1812 : @kernel.Thm,
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
      let s1813 = @tactics.mp_tac(x1812)
      fn(
        x1814 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1813(x1814)
      }
    })(((x1816 : @kernel.Thm) => @bool.spec(t1815, x1816))(x1817))
  })
  let t1811 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ c : (A) -> Bool, chain((l : (A, A) -> Bool), c) → (∃ y : A, fld(l, y) && (∀ x : A, c(x) → l(x, y)))"),
  )
  let t1807 = @drule.match_mp(hp())
  let t1808 = @tactics.x_choose_then(@term_syntax.parse_term("(M : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t1810 = @tactics.first_assum(fn(
    x1809 : @kernel.Thm,
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
    t1808(t1807(x1809))
  })
  let t1871 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
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
                                  @simp.rewrite_tac(@list.List([@sets.in_()])),
                                  @tactics.gen_tac,
                                ),
                                @tactics.strip_tac,
                              ),
                              t1810,
                            ),
                            t1811,
                          ),
                          t1818,
                        ),
                        t1819,
                      ),
                      t1820,
                    ),
                    t1821,
                  ),
                  t1822,
                ),
                t1823,
              ),
              @tactics.disch_tac,
            ),
            t1827,
          ),
          t1861,
        ),
        t1865,
      ),
      t1869,
    ),
    t1870,
  )
  zl_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, qoset(l) && (∀ c : (A) -> Bool, chain(l, c) → (∃ y : A, IN(y, fld(l)) && (∀ x : A, IN(x, c) → l(x, y)))) → (∃ y : A, IN(y, fld(l)) && (∀ x : A, l(y, x) → l(x, y)))"),
      t1871,
    ),
  )
}

///|
let zl_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZL_STRONG")

///|
/// `ZL_STRONG`
pub fn zl_strong() -> @kernel.Thm {
  zl_strong_c.get()
}

///|
/// ZL
fn step_140() -> Unit raise {
  let t1875 = @meson.asm_meson_tac(@list.List([poset_antisym()]))
  let t1874 = @simp.asm_simp_tac(@list.List([poset_imp_qoset()]))
  let t1872 = @bool.ispec(@term_syntax.parse_term("(l : (A, A) -> Bool)"), zl_strong())
  let t1873 = @tactics.mp_tac(
    @simp.rewrite_rule(@list.List([@sets.in_()]))(t1872),
  )
  let t1876 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
        t1873,
      ),
      t1874,
    ),
    t1875,
  )
  zl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) && (∀ P : (A) -> Bool, chain(l, P) → (∃ y : A, fld(l, y) && (∀ x : A, P(x) → l(x, y)))) → (∃ y : A, fld(l, y) && (∀ x : A, l(y, x) → y == x))"),
      t1876,
    ),
  )
}

///|
let zl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZL")

///|
/// `ZL`
pub fn zl() -> @kernel.Thm {
  zl_c.get()
}

///|
/// KL_POSET_LEMMA
fn step_141() -> Unit raise {
  let t1890 = @simp.asm_rewrite_tac(@list.List([]))
  let t1889 = @tactics.try_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(Q : (A) -> Bool)")),
  )
  let t1885 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t1886 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1885)
  let t1884 = @tactics.match_mp_tac(@sets.subset_trans())
  let t1883 = @simp.asm_rewrite_tac(@list.List([]))
  let t1887 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.x_gen_tac(@term_syntax.parse_term("(Q : (A) -> Bool)")),
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      t1883,
    ),
    t1884,
  )
  let t1881 = @tactics.match_mp_tac(@sets.subset_trans())
  let t1882 = @list.List([@tactics.match_mp_tac(chain_subset()), t1881])
  let t1880 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t1879 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(Q : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1878 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t1888 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)")),
            t1878,
          ),
          t1879,
        ),
        t1880,
      ),
      t1882,
    ),
    t1887,
    t1886,
  ])
  let t1877 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1891 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([poset(), @sets.in_()])),
            pbeta_tac,
          ),
          t1877,
        ),
        t1888,
      ),
      t1889,
    ),
    t1890,
  )
  kl_poset_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poset((c1 : (A) -> Bool) => (c2 : (A) -> Bool) => SUBSET((C : (A) -> Bool), c1) && SUBSET(c1, c2) && chain((l : (A, A) -> Bool), c2))"),
      t1891,
    ),
  )
}

///|
let kl_poset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KL_POSET_LEMMA")

///|
/// `KL_POSET_LEMMA`
pub fn kl_poset_lemma() -> @kernel.Thm {
  kl_poset_lemma_c.get()
}

///|
/// KL
fn step_142() -> Unit raise {
  let t2003 = @simp.asm_rewrite_tac(@list.List([]))
  let t2002 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2001 = @tactics.conv_tac(@equal.sym_conv)
  let t2000 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1999 = @simp.asm_rewrite_tac(@list.List([]))
  let t1998 = @tactics.exists_tac(@term_syntax.parse_term("(D : (A) -> Bool)"))
  let t2004 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(
                @tactics.x_choose_then(@term_syntax.parse_term("(D : (A) -> Bool)"))(
                  @tactics.strip_assume_tac,
                ),
              ),
              t1998,
            ),
            t1999,
          ),
          t2000,
        ),
        t2001,
      ),
      t2002,
    ),
    t2003,
  )
  let t1995 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t1992 = @simp.gen_rewrite_rule(
    fn(
      x1991 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1991
    },
    @list.List([@class.not_exists_thm()]),
  )
  let t1994 = @tactics.first_assum(fn(
    x1993 : @kernel.Thm,
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
      x1988 : @kernel.Thm,
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
      let s1989 = @tactics.assume_tac(x1988)
      fn(
        x1990 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1989(x1990)
      }
    })(t1992(x1993))
  })
  let t1996 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(C : (A) -> Bool)")),
      t1994,
    ),
    t1995,
  )
  let t1984 = @simp.asm_rewrite_tac(@list.List([]))
  let t1983 = @tactics.exists_tac(@term_syntax.parse_term("(X : (A) -> Bool)"))
  let t1982 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1981 = @simp.rewrite_tac(@list.List([unions_pred(), subset_pred()]))
  let t1980 = @simp.asm_rewrite_tac(@list.List([]))
  let t1979 = @tactics.disch_then(
    @tactics.imp_res_then(@tactics.strip_assume_tac),
  )
  let t1978 = @simp.rewrite_tac(@list.List([]))
  let t1973 = @term_syntax.parse_term("(X : (A) -> Bool)")
  let t1974 = @list.List([@term_syntax.parse_term("(X : (A) -> Bool)"), t1973])
  let t1977 = @tactics.first_assum(fn(
    x1976 : @kernel.Thm,
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
      x1970 : @kernel.Thm,
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
      let s1971 = @tactics.mp_tac(x1970)
      fn(
        x1972 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1971(x1972)
      }
    })(((x1975 : @kernel.Thm) => @bool.specl(t1974, x1975))(x1976))
  })
  let t1985 = @tactics.then_tac(
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
                        @tactics.strip_tac,
                        @tactics.x_gen_tac(@term_syntax.parse_term("(X : (A) -> Bool)")),
                      ),
                      @tactics.disch_tac,
                    ),
                    t1977,
                  ),
                  t1978,
                ),
                t1979,
              ),
              t1980,
            ),
            t1981,
          ),
          t1982,
        ),
        @tactics.beta_tac,
      ),
      t1983,
    ),
    t1984,
  )
  let t1969 = @simp.asm_rewrite_tac(@list.List([]))
  let t1966 = @simp.rewrite_rule(@list.List([subset_pred()]))
  let t1968 = @tactics.first_assum(fn(
    x1967 : @kernel.Thm,
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
    @tactics.match_mp_tac(t1966(x1967))
  })
  let t1965 = @simp.asm_rewrite_tac(@list.List([]))
  let t1964 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1963 = @simp.rewrite_tac(@list.List([chain(), @sets.in_()]))
  let t1961 = @tactics.undisch_tac(@term_syntax.parse_term("chain((l : (A, A) -> Bool), (A : (A) -> Bool))"))
  let t1962 = @list.List([
    @tactics.undisch_tac(@term_syntax.parse_term("chain((l : (A, A) -> Bool), (B : (A) -> Bool))")),
    t1961,
  ])
  let t1960 = @simp.asm_rewrite_tac(@list.List([]))
  let t1955 = @term_syntax.parse_term("(B : (A) -> Bool)")
  let t1956 = @list.List([@term_syntax.parse_term("(A : (A) -> Bool)"), t1955])
  let t1959 = @tactics.disch_then(fn(
    x1958 : @kernel.Thm,
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
      x1952 : @kernel.Thm,
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
      let s1953 = @tactics.mp_tac(x1952)
      fn(
        x1954 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1953(x1954)
      }
    })(((x1957 : @kernel.Thm) => @bool.specl(t1956, x1957))(x1958))
  })
  let t1951 = @tactics.first_assum(fn(
    x1950 : @kernel.Thm,
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
      x1948 : @kernel.Term,
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
        x1943 : @kernel.Term,
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
        let s1944 = @tactics.undisch_tac(x1943)
        fn(
          x1945 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1944(x1945)
        }
      })(
        ((x1947 : @kernel.Term) => {
          @lib.check(
            fn(x1946 : @kernel.Term) -> Bool raise { @basics.is_forall(x1946) },
            x1947,
          )
        })(x1948),
      )
    })(
      (fn(x1949 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x1949) })(
        x1950,
      ),
    )
  })
  let t1940 = @term_syntax.parse_term("(B : (A) -> Bool)")
  let t1938 = @term_syntax.parse_term("(A : (A) -> Bool)")
  let t1942 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x1939 : @kernel.Thm) => @tactics.x_choose_tac(t1938, x1939),
      (x1941 : @kernel.Thm) => @tactics.x_choose_tac(t1940, x1941),
    ),
  )
  let t1936 = @term_syntax.parse_term("(y : A)")
  let t1937 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t1936]),
  )
  let t1986 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @simp.rewrite_tac(
                              @list.List([chain(), @sets.in_(), unions_pred()]),
                            ),
                            t1937,
                          ),
                          @tactics.beta_tac,
                        ),
                        t1942,
                      ),
                      t1951,
                    ),
                    t1959,
                  ),
                  t1960,
                ),
                @tactics.strip_tac,
              ),
              t1962,
            ),
            t1963,
          ),
          t1964,
        ),
        t1965,
      ),
      t1968,
    ),
    t1969,
  )
  let t1935 = @simp.asm_rewrite_tac(@list.List([]))
  let t1932 = @simp.rewrite_rule(@list.List([subset_pred()]))
  let t1934 = @tactics.first_assum(fn(
    x1933 : @kernel.Thm,
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
    @tactics.match_mp_tac(t1932(x1933))
  })
  let t1931 = @simp.asm_rewrite_tac(@list.List([]))
  let t1930 = @tactics.exists_tac(@term_syntax.parse_term("(D : (A) -> Bool)"))
  let t1929 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1987 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([unions_pred(), subset_pred()])),
                t1929,
              ),
              @tactics.beta_tac,
            ),
            t1930,
          ),
          t1931,
        ),
        t1934,
      ),
      t1935,
    ),
    t1986,
    t1985,
  ])
  let t1928 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1927 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(a : Bool) && (b : Bool) && (a && b → (c : Bool)) → (a && b) && c"),
    ),
  )
  let t1926 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)((D : (A) -> Bool))")),
      @sets.subset_refl(),
    ]),
  )
  let t1921 = @term_syntax.parse_term("(D : (A) -> Bool)")
  let t1922 = @list.List([@term_syntax.parse_term("(D : (A) -> Bool)"), t1921])
  let t1925 = @tactics.first_assum(fn(
    x1924 : @kernel.Thm,
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
      x1918 : @kernel.Thm,
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
      let s1919 = @tactics.mp_tac(x1918)
      fn(
        x1920 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1919(x1920)
      }
    })(((x1923 : @kernel.Thm) => @bool.specl(t1922, x1923))(x1924))
  })
  let t1915 = @term_syntax.parse_term("(D : (A) -> Bool)")
  let t1917 = @tactics.first_assum((x1916 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1915, x1916)
  })
  let t1914 = @simp.rewrite_tac(@list.List([@sets.subset_refl()]))
  let t1997 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.exists_tac(
                      @term_syntax.parse_term("UNIONS((P : ((A) -> Bool) -> Bool))"),
                    ),
                    t1914,
                  ),
                  t1917,
                ),
                t1925,
              ),
              t1926,
            ),
            @tactics.strip_tac,
          ),
          t1927,
        ),
        t1928,
      ),
      t1987,
    ),
    t1996,
  ])
  let t1913 = @class.asm_cases_tac(@term_syntax.parse_term("∃ D : (A) -> Bool, (P : ((A) -> Bool) -> Bool)(D)"))
  let t1912 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t1911 = @simp.gen_rewrite_tac(
    fn(
      x1908 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1909 = @equal.land_conv(x1908)
      fn(x1910 : @kernel.Term) -> @kernel.Thm raise { s1909(x1910) }
    },
    @list.List([chain()]),
  )
  let t2005 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.x_gen_tac(@term_syntax.parse_term("(P : ((A) -> Bool) -> Bool)")),
                t1911,
              ),
              t1912,
            ),
            pbeta_tac,
          ),
          @tactics.disch_tac,
        ),
        t1913,
      ),
      t1997,
    ),
    t2004,
  ])
  let t1893 = @simp.rewrite_tac(
    @list.List([
      kl_poset_lemma(),
      @drule.match_mp(poset_fldeq())(kl_poset_lemma()),
    ]),
  )
  let t1892 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(c1 : (A) -> Bool) => (c2 : (A) -> Bool) => SUBSET((C : (A) -> Bool), c1) && SUBSET(c1, c2) && chain((l : (A, A) -> Bool), c2)"),
      zl(),
    ),
  )
  let t2006 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1892),
            pbeta_tac,
          ),
          t1893,
        ),
        pbeta_tac,
      ),
      fn(
        x1907 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x1906 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            x1904 : @kernel.Term,
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
              x1900 : @kernel.Term,
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
                x1894 : @kernel.Term,
              ) -> ((
                (@kernel.Thm) -> ((
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
                ) raise) raise,
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
              ) raise) raise) raise {
                fn(
                  x1895 : (@kernel.Thm) -> ((
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
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise) raise,
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
                  let s1896 = @tactics.subgoal_then(x1894, x1895)
                  fn(
                    x1897 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise {
                    s1896(x1897)
                  }
                }
              })(x1900)(fn(
                x1898 : @kernel.Thm,
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
                let t = x1898
                @simp.rewrite_tac(@list.List([t]))
              })
            })(
              ((x1903 : @kernel.Term) => {
                @lib.funpow(
                  2,
                  fn(x1902 : @kernel.Term) -> @kernel.Term raise {
                    (fn(
                      x1901 : (@kernel.Term, @kernel.Term),
                    ) -> @kernel.Term raise {
                      x1901.0
                    })(@basics.dest_imp(x1902))
                  },
                  x1903,
                )
              })(x1904),
            )
          })(
            (fn(
              x1905 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x1905.1
            })(x1906),
          )
        })(x1907)(x1907)
      },
    ),
    t2005,
  )
  kl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, poset(l) → (∀ C : (A) -> Bool, chain(l, C) → (∃ P : (A) -> Bool, (chain(l, P) && SUBSET(C, P)) && (∀ R : (A) -> Bool, chain(l, R) && SUBSET(P, R) → R == P)))"),
      t2006,
    ),
  )
}

///|
let kl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KL")

///|
/// `KL`
pub fn kl() -> @kernel.Thm {
  kl_c.get()
}

///|
/// POSET_RESTRICTED_SUBSET
fn step_143() -> Unit raise {
  let t2009 = @meson.meson_tac(@list.List([]))
  let t2008 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.extension()]))
  let t2007 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2010 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(
            @list.List([
              poset(),
              @sets.in_(),
              @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
            ]),
          ),
        ),
        t2007,
      ),
      t2008,
    ),
    t2009,
  )
  poset_restricted_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, poset((x : (_) -> Bool) => (y : (_) -> Bool) => P(x) && P(y) && SUBSET(x, y))"),
      t2010,
    ),
  )
}

///|
let poset_restricted_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POSET_RESTRICTED_SUBSET",
)

///|
/// `POSET_RESTRICTED_SUBSET`
pub fn poset_restricted_subset() -> @kernel.Thm {
  poset_restricted_subset_c.get()
}

///|
/// FLD_RESTRICTED_SUBSET
fn step_144() -> Unit raise {
  let t2012 = @meson.meson_tac(@list.List([@sets.subset_refl()]))
  let t2011 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2013 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
          @pair.forall_pair_thm(),
          @class.fun_eq_thm(),
        ]),
      ),
      t2011,
    ),
    t2012,
  )
  fld_restricted_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> Bool) -> Bool, fld((x : (_) -> Bool) => (y : (_) -> Bool) => P(x) && P(y) && SUBSET(x, y)) == P"),
      t2013,
    ),
  )
}

///|
let fld_restricted_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FLD_RESTRICTED_SUBSET",
)

///|
/// `FLD_RESTRICTED_SUBSET`
pub fn fld_restricted_subset() -> @kernel.Thm {
  fld_restricted_subset_c.get()
}

///|
/// ZL_SUBSETS
fn step_145() -> Unit raise {
  let t2020 = @meson.meson_tac(@list.List([]))
  let t2019 = @list.List([
    @tactics.match_mp_tac(@theorems.mono_forall()),
    @tactics.all_tac,
  ])
  let t2018 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t2017 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t2016 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2015 = @simp.rewrite_tac(@list.List([chain(), @sets.in_()]))
  let t2014 = @simp.rewrite_tac(
    @list.List([poset_restricted_subset(), fld_restricted_subset()]),
  )
  let t2021 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @tactics.mp_tac(
                      @bool.ispec(
                        @term_syntax.parse_term("(x : (A) -> Bool) => (y : (A) -> Bool) => (P : ((A) -> Bool) -> Bool)(x) && P(y) && SUBSET(x, y)"),
                        zl(),
                      ),
                    ),
                  ),
                  t2014,
                ),
                t2015,
              ),
              t2016,
            ),
            t2017,
          ),
          t2018,
        ),
        @tactics.conj_tac,
      ),
      t2019,
    ),
    t2020,
  )
  zl_subsets_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ c : ((A) -> Bool) -> Bool, (∀ x : (A) -> Bool, IN(x, c) → P(x)) && (∀ x : (A) -> Bool, ∀ y : (A) -> Bool, IN(x, c) && IN(y, c) → SUBSET(x, y) || SUBSET(y, x)) → (∃ z : (A) -> Bool, P(z) && (∀ x : (A) -> Bool, IN(x, c) → SUBSET(x, z)))) → (∃ a : (A) -> Bool, P(a) && (∀ x : (A) -> Bool, P(x) && SUBSET(a, x) → a == x))"),
      t2021,
    ),
  )
}

///|
let zl_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZL_SUBSETS")

///|
/// `ZL_SUBSETS`
pub fn zl_subsets() -> @kernel.Thm {
  zl_subsets_c.get()
}

///|
/// ZL_SUBSETS_UNIONS
fn step_146() -> Unit raise {
  let t2025 = @meson.asm_meson_tac(
    @list.List([@sets.subset(), @sets.in_unions()]),
  )
  let t2024 = @tactics.exists_tac(
    @term_syntax.parse_term("UNIONS((c : ((A) -> Bool) -> Bool))"),
  )
  let t2023 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2022 = @tactics.match_mp_tac(zl_subsets())
  let t2026 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2022),
        t2023,
      ),
      t2024,
    ),
    t2025,
  )
  zl_subsets_unions_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∀ c : ((A) -> Bool) -> Bool, (∀ x : (A) -> Bool, IN(x, c) → P(x)) && (∀ x : (A) -> Bool, ∀ y : (A) -> Bool, IN(x, c) && IN(y, c) → SUBSET(x, y) || SUBSET(y, x)) → P(UNIONS(c))) → (∃ a : (A) -> Bool, P(a) && (∀ x : (A) -> Bool, P(x) && SUBSET(a, x) → a == x))"),
      t2026,
    ),
  )
}

///|
let zl_subsets_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZL_SUBSETS_UNIONS",
)

///|
/// `ZL_SUBSETS_UNIONS`
pub fn zl_subsets_unions() -> @kernel.Thm {
  zl_subsets_unions_c.get()
}

///|
/// ZL_SUBSETS_UNIONS_NONEMPTY
fn step_147() -> Unit raise {
  let t2032 = @meson.asm_meson_tac(@list.List([]))
  let t2031 = @meson.meson_tac(@list.List([@sets.subset(), @sets.in_unions()]))
  let t2030 = @simp.asm_simp_tac(@list.List([]))
  let t2033 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("UNIONS((c : ((A) -> Bool) -> Bool))")),
        t2030,
      ),
      t2031,
    ),
    t2032,
  ])
  let t2029 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : (A) -> Bool, IN(x, (c : ((A) -> Bool) -> Bool))"))
  let t2028 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2027 = @tactics.match_mp_tac(zl_subsets())
  let t2034 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2027),
        t2028,
      ),
      t2029,
    ),
    t2033,
  )
  zl_subsets_unions_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> Bool) -> Bool, (∃ x : (A) -> Bool, P(x)) && (∀ c : ((A) -> Bool) -> Bool, (∃ x : (A) -> Bool, IN(x, c)) && (∀ x : (A) -> Bool, IN(x, c) → P(x)) && (∀ x : (A) -> Bool, ∀ y : (A) -> Bool, IN(x, c) && IN(y, c) → SUBSET(x, y) || SUBSET(y, x)) → P(UNIONS(c))) → (∃ a : (A) -> Bool, P(a) && (∀ x : (A) -> Bool, P(x) && SUBSET(a, x) → a == x))"),
      t2034,
    ),
  )
}

///|
let zl_subsets_unions_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZL_SUBSETS_UNIONS_NONEMPTY",
)

///|
/// `ZL_SUBSETS_UNIONS_NONEMPTY`
pub fn zl_subsets_unions_nonempty() -> @kernel.Thm {
  zl_subsets_unions_nonempty_c.get()
}

///|
/// TUKEY
fn step_148() -> Unit raise {
  let t2054 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2053 = @simp.rewrite_tac(@list.List([@sets.insert_subset()]))
  let t2052 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t2050 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2051 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), t2050),
  ])
  let t2049 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : (A) -> Bool, FINITE(d) → SUBSET(d, UNIONS((c : ((A) -> Bool) -> Bool))) → (∃ e : (A) -> Bool, IN(e, c) && SUBSET(d, e))"),
    fn(
      x2046 : @kernel.Thm,
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
      let s2047 = @tactics.mp_tac(x2046)
      fn(
        x2048 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2047(x2048)
      }
    },
  )
  let t2045 = @tactics.first_assum(fn(
    x2042 : @kernel.Thm,
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
    let th = x2042
    @simp.gen_rewrite_tac(
      fn(
        x2044 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x2044
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t2041 = @tactics.disch_then(
    @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(
      x2038 : @kernel.Thm,
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
      let s2039 = @tactics.assume_tac(x2038)
      fn(
        x2040 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2039(x2040)
      }
    }),
  )
  let t2037 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : ((A) -> Bool) -> Bool)"))
  let t2036 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2035 = @tactics.match_mp_tac(zl_subsets_unions_nonempty())
  let t2055 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t2035,
                      ),
                      @tactics.conj_tac,
                    ),
                    t2036,
                  ),
                  t2037,
                ),
                t2041,
              ),
              t2045,
            ),
            t2049,
          ),
          t2051,
        ),
        t2052,
      ),
      t2053,
    ),
    t2054,
  )
  tukey_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, !(s == {}) && (∀ t : (A) -> Bool, (∀ c : (A) -> Bool, FINITE(c) && SUBSET(c, t) → IN(c, s)) == IN(t, s)) → (∃ u : (A) -> Bool, IN(u, s) && (∀ v : (A) -> Bool, IN(v, s) && SUBSET(u, v) → u == v))"),
      t2055,
    ),
  )
}

///|
let tukey_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TUKEY")

///|
/// `TUKEY`
pub fn tukey() -> @kernel.Thm {
  tukey_c.get()
}

///|
/// OEP
fn step_149() -> Unit raise {
  let t2241 = @meson.meson_tac(@list.List([]))
  let t2240 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2239 = @simp.asm_rewrite_tac(@list.List([@theorems.or_exists_thm()]))
  let t2234 = @term_syntax.parse_term("(y : A)")
  let t2235 = @list.List([@term_syntax.parse_term("(x : A)"), t2234])
  let t2238 = @tactics.remove_then("*", fn(
    x2237 : @kernel.Thm,
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
      x2231 : @kernel.Thm,
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
      let s2232 = @tactics.mp_tac(x2231)
      fn(
        x2233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2232(x2233)
      }
    })(((x2236 : @kernel.Thm) => @bool.specl(t2235, x2236))(x2237))
  })
  let t2230 = @simp.asm_rewrite_tac(@list.List([]))
  let t2229 = @simp.asm_rewrite_tac(@list.List([@sets.in_()]))
  let t2228 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (x : A)"))
  let t2227 = @term_syntax.parse_term("(y : A)")
  let t2242 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.map_every(
                    @tactics.x_gen_tac,
                    @list.List([@term_syntax.parse_term("(x : A)"), t2227]),
                  ),
                  t2228,
                ),
                t2229,
              ),
              @tactics.strip_tac,
            ),
            t2230,
          ),
          t2238,
        ),
        t2239,
      ),
      t2240,
    ),
    t2241,
  )
  let t2226 = @meson.asm_meson_tac(@list.List([]))
  let t2220 = @term_syntax.parse_term("(n : A)")
  let t2221 = @list.List([@term_syntax.parse_term("(m : A)"), t2220])
  let t2225 = @tactics.disch_then(fn(
    x2224 : @kernel.Thm,
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
      x2223 : @kernel.Thm,
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
        x2217 : @kernel.Thm,
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
        let s2218 = @tactics.mp_tac(x2217)
        fn(
          x2219 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2218(x2219)
        }
      })(((x2222 : @kernel.Thm) => @bool.specl(t2221, x2222))(x2223))
    })(@bool.conjunct1(x2224))
  })
  let t2216 = @tactics.replicate_tac(
    3,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x2210 : @kernel.Thm,
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
          let s2211 = @tactics.assume_tac(x2210)
          fn(
            x2212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2211(x2212)
          }
        },
        fn(
          x2213 : @kernel.Thm,
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
          let s2214 = @tactics.mp_tac(x2213)
          fn(
            x2215 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2214(x2215)
          }
        },
      ),
    ),
  )
  let t2209 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t2206 = @simp.gen_rewrite_rule(
    fn(
      x2205 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2205
    },
    @list.List([woset()]),
  )
  let t2208 = @tactics.first_assum(fn(
    x2207 : @kernel.Thm,
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
      x2202 : @kernel.Thm,
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
      let s2203 = @tactics.mp_tac(x2202)
      fn(
        x2204 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2203(x2204)
      }
    })(t2206(x2207))
  })
  let t2200 = @tactics.x_choose_then(@term_syntax.parse_term("(n : A)"))(
    @tactics.strip_assume_tac,
  )
  let t2201 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(m : A)"))(
        @tactics.strip_assume_tac,
      ),
      t2200,
    ),
  )
  let t2199 = @simp.asm_rewrite_tac(@list.List([]))
  let t2198 = @class.asm_cases_tac(@term_syntax.parse_term("fld((p : (A, A) -> Bool), (y : A))"))
  let t2197 = @simp.asm_rewrite_tac(@list.List([]))
  let t2196 = @class.asm_cases_tac(@term_syntax.parse_term("fld((p : (A, A) -> Bool), (x : A))"))
  let t2195 = @simp.asm_rewrite_tac(@list.List([]))
  let t2194 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (x : A)"))
  let t2193 = @term_syntax.parse_term("(y : A)")
  let t2243 = @tactics.then_tac(
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
                          @tactics.map_every(
                            @tactics.x_gen_tac,
                            @list.List([@term_syntax.parse_term("(x : A)"), t2193]),
                          ),
                          t2194,
                        ),
                        t2195,
                      ),
                      t2196,
                    ),
                    t2197,
                  ),
                  t2198,
                ),
                t2199,
              ),
              t2201,
            ),
            t2208,
          ),
          t2209,
        ),
        t2216,
      ),
      t2225,
    ),
    t2226,
  )
  let t2192 = @meson.asm_meson_tac(@list.List([]))
  let t2190 = @tactics.exists_tac(@term_syntax.parse_term("(n : A)"))
  let t2191 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(m : A)")), t2190])
  let t2189 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
    ),
    @tactics.all_tac,
  ])
  let t2183 = @term_syntax.parse_term("(n : A)")
  let t2184 = @list.List([@term_syntax.parse_term("(m : A)"), t2183])
  let t2188 = @tactics.disch_then(fn(
    x2187 : @kernel.Thm,
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
      x2186 : @kernel.Thm,
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
        x2180 : @kernel.Thm,
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
        let s2181 = @tactics.mp_tac(x2180)
        fn(
          x2182 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2181(x2182)
        }
      })(((x2185 : @kernel.Thm) => @bool.specl(t2184, x2185))(x2186))
    })(@bool.conjunct1(x2187))
  })
  let t2179 = @tactics.replicate_tac(
    3,
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x2173 : @kernel.Thm,
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
          let s2174 = @tactics.assume_tac(x2173)
          fn(
            x2175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2174(x2175)
          }
        },
        fn(
          x2176 : @kernel.Thm,
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
          let s2177 = @tactics.mp_tac(x2176)
          fn(
            x2178 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2177(x2178)
          }
        },
      ),
    ),
  )
  let t2172 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )
  let t2169 = @simp.gen_rewrite_rule(
    fn(
      x2168 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2168
    },
    @list.List([woset()]),
  )
  let t2171 = @tactics.first_assum(fn(
    x2170 : @kernel.Thm,
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
      x2165 : @kernel.Thm,
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
      let s2166 = @tactics.mp_tac(x2165)
      fn(
        x2167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2166(x2167)
      }
    })(t2169(x2170))
  })
  let t2163 = @tactics.x_choose_then(@term_syntax.parse_term("(n : A)"))(
    @tactics.strip_assume_tac,
  )
  let t2164 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(m : A)"))(
        @tactics.strip_assume_tac,
      ),
      t2163,
    ),
  )
  let t2162 = @simp.asm_rewrite_tac(@list.List([]))
  let t2161 = @class.asm_cases_tac(@term_syntax.parse_term("fld((p : (A, A) -> Bool), (z : A))"))
  let t2160 = @simp.asm_rewrite_tac(@list.List([]))
  let t2159 = @class.asm_cases_tac(@term_syntax.parse_term("fld((p : (A, A) -> Bool), (y : A))"))
  let t2158 = @simp.asm_rewrite_tac(@list.List([]))
  let t2157 = @class.asm_cases_tac(@term_syntax.parse_term("fld((p : (A, A) -> Bool), (x : A))"))
  let t2156 = @simp.simp_tac(@list.List([]))
  let t2155 = @simp.asm_rewrite_tac(@list.List([]))
  let t2154 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (x : A)"))
  let t2153 = @simp.simp_tac(@list.List([]))
  let t2152 = @simp.asm_rewrite_tac(@list.List([]))
  let t2151 = @class.asm_cases_tac(@term_syntax.parse_term("(y : A) == (z : A)"))
  let t2150 = @simp.simp_tac(@list.List([]))
  let t2149 = @simp.asm_rewrite_tac(@list.List([]))
  let t2148 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (z : A)"))
  let t2146 = @term_syntax.parse_term("(z : A)")
  let t2147 = @term_syntax.parse_term("(y : A)")
  let t2244 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.thenl(
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
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.then_tac(
                                                    @tactics.then_tac(
                                                      @tactics.map_every(
                                                        @tactics.x_gen_tac,
                                                        @list.List([
                                                          @term_syntax.parse_term("(x : A)"),
                                                          t2147,
                                                          t2146,
                                                        ]),
                                                      ),
                                                      t2148,
                                                    ),
                                                    t2149,
                                                  ),
                                                  t2150,
                                                ),
                                                t2151,
                                              ),
                                              t2152,
                                            ),
                                            t2153,
                                          ),
                                          t2154,
                                        ),
                                        t2155,
                                      ),
                                      t2156,
                                    ),
                                    t2157,
                                  ),
                                  t2158,
                                ),
                                t2159,
                              ),
                              t2160,
                            ),
                            t2161,
                          ),
                          t2162,
                        ),
                        t2164,
                      ),
                      t2171,
                    ),
                    t2172,
                  ),
                  t2179,
                ),
                t2188,
              ),
              @tactics.ants_tac,
            ),
            t2189,
          ),
          @tactics.strip_tac,
        ),
        t2191,
      ),
      t2192,
    ),
    t2243,
    t2242,
  ])
  let t2145 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2144 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t2141 = @simp.gen_rewrite_rule(
    fn(
      x2140 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2140
    },
    @list.List([poset()]),
  )
  let t2143 = @tactics.first_x_assum(fn(
    x2142 : @kernel.Thm,
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
    @tactics.strip_assume_tac(t2141(x2142))
  })
  let t2139 = @simp.rewrite_tac(@list.List([]))
  let t2138 = @simp.expand_tac("t")
  let t2136 = @tactics.then_tac(
    @tactics.disch_tac,
    @simp.asm_rewrite_tac(@list.List([toset_poset(), poset(), @sets.in_()])),
  )
  let t2135 = @meson.asm_meson_tac(@list.List([]))
  let t2134 = @simp.rewrite_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t2133 = @simp.expand_tac("t")
  let t2132 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @pair.forall_pair_thm(), @sets.in_()]),
  )
  let t2137 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@sets.subset_antisym()),
            t2132,
          ),
          t2133,
        ),
        t2134,
      ),
      t2135,
    ),
    t2136,
  ])
  let t2131 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(q : Bool) && (q → (p : Bool)) → p && q")),
  )
  let t2130 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @pair.forall_pair_thm(), @sets.in_()]),
  )
  let t2128 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2125 = @simp.gen_rewrite_rule(
    fn(
      x2124 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2124
    },
    @list.List([poset()]),
  )
  let t2127 = @tactics.first_assum(fn(
    x2126 : @kernel.Thm,
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
      x2121 : @kernel.Thm,
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
      let s2122 = @tactics.mp_tac(x2121)
      fn(
        x2123 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2122(x2123)
      }
    })(t2125(x2126))
  })
  let t2119 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2120 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
    ),
    t2119,
  ])
  let t2118 = @simp.asm_simp_tac(@list.List([]))
  let t2113 = @term_syntax.parse_term("(y : A)")
  let t2114 = @list.List([@term_syntax.parse_term("(x : A)"), t2113])
  let t2117 = @tactics.remove_then("*", fn(
    x2116 : @kernel.Thm,
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
      x2110 : @kernel.Thm,
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
      let s2111 = @tactics.mp_tac(x2110)
      fn(
        x2112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2111(x2112)
      }
    })(((x2115 : @kernel.Thm) => @bool.specl(t2114, x2115))(x2116))
  })
  let t2109 = @list.List([
    @meson.asm_meson_tac(
      @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
    ),
    @tactics.all_tac,
  ])
  let t2108 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t2107 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @meson.asm_meson_tac(
          @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
        ),
        @tactics.all_tac,
      ]),
    ),
  )
  let t2106 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2105 = @simp.rewrite_tac(@list.List([]))
  let t2129 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(@simp.expand_tac("t"), t2105),
                          t2106,
                        ),
                        @tactics.strip_tac,
                      ),
                      t2107,
                    ),
                    t2108,
                  ),
                  t2109,
                ),
                t2117,
              ),
              t2118,
            ),
            @tactics.ants_tac,
          ),
          t2120,
        ),
        t2127,
      ),
      t2128,
    ),
    @tactics.all_tac,
  ])
  let t2104 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, (p : (A, A) -> Bool)(x, y) → (t : (A, A) -> Bool)(x, y)"),
    fn(
      x2101 : @kernel.Thm,
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
      let s2102 = @tactics.assume_tac(x2101)
      fn(
        x2103 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2102(x2103)
      }
    },
  )
  let t2097 = @meson.asm_meson_tac(
    @list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld())]),
  )
  let t2096 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : A)"))
  let t2098 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t2096),
    t2097,
  )
  let t2095 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2093 = @simp.gen_rewrite_rule(
    fn(
      x2092 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2092
    },
    @list.List([poset()]),
  )
  let t2099 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x2094 : @kernel.Thm,
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
          x2089 : @kernel.Thm,
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
          let s2090 = @tactics.mp_tac(x2089)
          fn(
            x2091 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2090(x2091)
          }
        })(t2093(x2094))
      }),
      t2095,
    ),
    t2098,
  ])
  let t2088 = @simp.asm_rewrite_tac(@list.List([]))
  let t2084 = @term_syntax.parse_term("(i : A) => fld((p : (A, A) -> Bool), i) && !(p(i, (x : A)) == p(i, (y : A)))")
  let t2087 = @tactics.disch_then(fn(
    x2086 : @kernel.Thm,
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
      x2081 : @kernel.Thm,
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
      let s2082 = @tactics.mp_tac(x2081)
      fn(
        x2083 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2082(x2083)
      }
    })(((x2085 : @kernel.Thm) => @bool.spec(t2084, x2085))(x2086))
  })
  let t2080 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x2074 : @kernel.Thm,
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
          let s2075 = @tactics.assume_tac(x2074)
          fn(
            x2076 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2075(x2076)
          }
        },
        fn(
          x2077 : @kernel.Thm,
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
          let s2078 = @tactics.mp_tac(x2077)
          fn(
            x2079 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2078(x2079)
          }
        },
      ),
    ),
  )
  let t2073 = @simp.asm_simp_tac(@list.List([@sets.in_()]))
  let t2070 = @simp.gen_rewrite_rule(
    fn(
      x2069 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2069
    },
    @list.List([woset()]),
  )
  let t2072 = @tactics.first_assum(fn(
    x2071 : @kernel.Thm,
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
      x2066 : @kernel.Thm,
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
      let s2067 = @tactics.mp_tac(x2066)
      fn(
        x2068 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2067(x2068)
      }
    })(t2070(x2071))
  })
  let t2100 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2072,
                ),
                t2073,
              ),
              t2080,
            ),
            t2087,
          ),
          t2088,
        ),
        @tactics.ants_tac,
      ),
      t2099,
    ),
    @tactics.all_tac,
  ])
  let t2065 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, ∀ y : A, fld((p : (A, A) -> Bool), x) && fld(p, y) && !(x == y) → (∃ i : A, fld(p, i) && (∀ j : A, (w : (A, A) -> Bool)(j, i) && !(j == i) → p(j, x) == p(j, y)) && !(p(i, x) == p(i, y)))"),
    fn(
      x2062 : @kernel.Thm,
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
      let s2063 = ((x2061 : @kernel.Thm) => @tactics.label_tac("*", x2061))(
        x2062,
      )
      fn(
        x2064 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2063(x2064)
      }
    },
  )
  let t2060 = @tactics.exists_tac(@term_syntax.parse_term("(t : (A, A) -> Bool)"))
  let t2059 = @simp.abbrev_tac(
    @term_syntax.parse_term("(t : (A, A) -> Bool) == ((x : A) => (y : A) => fld((p : (A, A) -> Bool), x) && fld(p, y) && (x == y || (∃ i : A, fld(p, i) && (∀ j : A, (w : (A, A) -> Bool)(j, i) && !(j == i) → p(j, x) == p(j, y)) && !p(i, x) && p(i, y))))"),
  )
  let t2058 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(w : (A, A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2057 = @simp.asm_rewrite_tac(@list.List([]))
  let t2056 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("fld((p : (A, A) -> Bool))"), wo()),
  )
  let t2245 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.thenl(
                        @tactics.then_tac(
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t2056,
                                      ),
                                      t2057,
                                    ),
                                    t2058,
                                  ),
                                  t2059,
                                ),
                                t2060,
                              ),
                              t2065,
                            ),
                            t2100,
                          ),
                          t2104,
                        ),
                        t2129,
                      ),
                      t2130,
                    ),
                    t2131,
                  ),
                  @tactics.conj_tac,
                ),
                t2137,
              ),
              t2138,
            ),
            t2139,
          ),
          t2143,
        ),
        t2144,
      ),
      t2145,
    ),
    t2244,
  )
  oep_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : (A, A) -> Bool, poset(p) → (∃ t : (A, A) -> Bool, toset(t) && fld(t) == fld(p) && (∀ x : A, ∀ y : A, p(x, y) → t(x, y)))"),
      t2245,
    ),
  )
}

///|
let oep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OEP")

///|
/// `OEP`
pub fn oep() -> @kernel.Thm {
  oep_c.get()
}

///|
/// TOSET_COFINAL_WOSET
fn step_150() -> Unit raise {
  let t2451 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2450 = @tactics.first_assum(fn(
    x2447 : @kernel.Thm,
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
    let s2448 = @tactics.accept_tac(x2447)
    fn(
      x2449 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2448(x2449)
    }
  })
  let t2452 = @list.List([
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2450),
    t2451,
  ])
  let t2446 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2445 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : (A) -> Bool)"))
  let t2442 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ z : _, (P : (_) -> Bool)(z) → IN(z, IMAGE((f : (_) -> _), (s : (_) -> Bool)))) → (∀ x : _, IN(x, s) && P(f(x)) → (Q : (_) -> Bool)(f(x))) → (∀ y : _, P(y) → Q(y))"),
    ),
  )
  let t2444 = @tactics.first_assum(fn(
    x2443 : @kernel.Thm,
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
    @tactics.match_mp_tac(t2442(x2443))
  })
  let t2441 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2440 = @tactics.exists_tac(@term_syntax.parse_term("(f : ((A) -> Bool) -> A)((z : (A) -> Bool))"))
  let t2439 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(z : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2438 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2437 = @simp.rewrite_tac(@list.List([]))
  let t2431 = @term_syntax.parse_term("(x : (A) -> Bool) => (P : (A) -> Bool)((f : ((A) -> Bool) -> A)(x))")
  let t2436 = @tactics.disch_then(fn(
    x2435 : @kernel.Thm,
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
      x2434 : @list.List[@kernel.Thm],
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
        x2433 : @kernel.Thm,
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
          x2428 : @kernel.Thm,
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
          let s2429 = @tactics.mp_tac(x2428)
          fn(
            x2430 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2429(x2430)
          }
        })(((x2432 : @kernel.Thm) => @bool.spec(t2431, x2432))(x2433))
      })(@lib.last(x2434))
    })(@bool.conjuncts_rule(x2435))
  })
  let t2427 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(
        @list.List([
          @sets.subset(),
          @equal.gsym(@sets.member_not_empty()),
          @sets.in_(),
        ]),
      )(woset()),
    ]),
  )
  let t2424 = @drule.match_mp(ordinal_imp_woset())
  let t2426 = @tactics.first_assum(fn(
    x2425 : @kernel.Thm,
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
      x2421 : @kernel.Thm,
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
      let s2422 = @tactics.mp_tac(x2421)
      fn(
        x2423 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2422(x2423)
      }
    })(t2424(x2425))
  })
  let t2420 = @simp.rewrite_tac(@list.List([]))
  let t2419 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)"))
  let t2417 = @simp.simp_tac(@list.List([]))
  let t2418 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t2417])
  let t2416 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t2413 = @simp.gen_rewrite_rule(
    fn(
      x2412 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2412
    },
    @list.List([poset()]),
  )
  let t2415 = @tactics.first_assum(fn(
    x2414 : @kernel.Thm,
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
    @tactics.strip_assume_tac(t2413(x2414))
  })
  let t2409 = @simp.gen_rewrite_rule(
    fn(
      x2408 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2408
    },
    @list.List([toset_poset()]),
  )
  let t2411 = @tactics.first_assum(fn(
    x2410 : @kernel.Thm,
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
    @tactics.strip_assume_tac(t2409(x2410))
  })
  let t2404 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2403 = @simp.rewrite_tac(@list.List([@sets.exists_in_image()]))
  let t2405 = @tactics.then_tac(
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2403),
    t2404,
  )
  let t2402 = @simp.rewrite_rule(
    @list.List([
      @sets.subset(),
      @equal.gsym(@sets.member_not_empty()),
      @sets.in_(),
    ]),
  )(woset())
  let t2406 = @simp.asm_rewrite_tac(
    @list.List([
      @simp.rewrite_rule(
        @list.List([
          @sets.set_rule(@term_syntax.parse_term("fld((l : (_, _) -> Bool), (x : _)) == IN(x, fld(l))")),
        ]),
      )(t2402),
    ]),
  )
  let t2407 = @list.List([
    @simp.simp_tac(
      @list.List([@sets.subset(), @pair.forall_pair_thm(), @sets.in_()]),
    ),
    t2406,
    t2405,
  ])
  let t2401 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2399 = @meson.asm_meson_tac(@list.List([]))
  let t2398 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([toset_poset()])),
  )
  let t2397 = @simp.rewrite_tac(
    @list.List([
      @sets.in_(),
      @simp.rewrite_rule(@list.List([@sets.in_()]))(in_fld()),
    ]),
  )
  let t2396 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_thm(), @sets.in_image()]),
  )
  let t2400 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x2395 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x2395
              },
              @list.List([@sets.extension()]),
            ),
            t2396,
          ),
          t2397,
        ),
        t2398,
      ),
      t2399,
    ),
    @tactics.all_tac,
  ])
  let t2394 = @tactics.subgoal_then(
    @term_syntax.parse_term("fld((x : A) => (y : A) => IN(x, IMAGE((f : ((A) -> Bool) -> A), {(v : (A) -> Bool) | (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, (w : (A) -> Bool)) && !(v == w)})) && IN(y, IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})) && (l : (A, A) -> Bool)(x, y)) == IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})"),
    fn(
      x2391 : @kernel.Thm,
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
      let s2392 = @tactics.assume_tac(x2391)
      fn(
        x2393 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2392(x2393)
      }
    },
  )
  let t2390 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : A) => (y : A) => IN(x, IMAGE((f : ((A) -> Bool) -> A), {(v : (A) -> Bool) | (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, (w : (A) -> Bool)) && !(v == w)})) && IN(y, IMAGE(f, {(v : (A) -> Bool) | r(v, w) && !(v == w)})) && (l : (A, A) -> Bool)(x, y)"),
  )
  let t2386 = @meson.asm_meson_tac(@list.List([]))
  let t2384 = @drule.match_mp(ordinal_imp_woset())
  let t2382 = @simp.rewrite_rule(
    @list.List([
      @simp.rewrite_rule(
        @list.List([
          @sets.subset(),
          @equal.gsym(@sets.member_not_empty()),
          @sets.in_(),
        ]),
      )(woset()),
    ]),
  )
  let t2387 = @tactics.then_tac(
    @tactics.first_assum(fn(
      x2385 : @kernel.Thm,
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
        x2383 : @kernel.Thm,
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
          x2379 : @kernel.Thm,
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
          let s2380 = @tactics.mp_tac(x2379)
          fn(
            x2381 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2380(x2381)
          }
        })(t2382(x2383))
      })(t2384(x2385))
    }),
    t2386,
  )
  let t2378 = @simp.asm_rewrite_tac(@list.List([]))
  let t2388 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
        x2377 : @kernel.Thm,
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
          x2376 : @kernel.Thm,
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
          @tactics.match_mp_tac(@bool.conjunct2(x2376))
        })(@class.select_rule(x2377))
      }),
      t2378,
    ),
    t2387,
  ])
  let t2375 = @tactics.first_x_assum(fn(
    x2366 : @kernel.Thm,
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
    let th = x2366
    @simp.gen_rewrite_tac(
      fn(
        x2374 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x2368 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2369 = @equal.rand_conv(x2368)
          fn(x2370 : @kernel.Term) -> @kernel.Thm raise { s2369(x2370) }
        })(
          (fn(
            x2371 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2372 = @equal.land_conv(x2371)
            fn(x2373 : @kernel.Term) -> @kernel.Thm raise { s2372(x2373) }
          })(x2374),
        )
      },
      @list.List([th]),
    )
  })
  let t2362 = @drule.match_mp(
    @meson.meson(@list.List([]), @term_syntax.parse_term("!((f : (_) -> _)((x : _)) == f((y : _))) → !(x == y)")),
  )
  let t2364 = @tactics.disch_then(fn(
    x2363 : @kernel.Thm,
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
      x2359 : @kernel.Thm,
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
      let s2360 = @tactics.assume_tac(x2359)
      fn(
        x2361 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2360(x2361)
      }
    })(t2362(x2363))
  })
  let t2358 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2365 = @list.List([
    @tactics.then_tac(
      @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([toset_poset()]))),
      t2358,
    ),
    t2364,
  ])
  let t2357 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("((l : (_, _) -> Bool)((a : _), (b : _)) || l(b, a)) && (!(b == a) → !l(b, a)) → l(a, b)"),
    ),
  )
  let t2389 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2357),
              @tactics.conj_tac,
            ),
            t2365,
          ),
          t2375,
        ),
        @class.cond_cases_tac,
      ),
      t2388,
    ),
    @tactics.all_tac,
  ])
  let t2356 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : (A) -> Bool, ∀ y : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(x, y) && r(y, (w : (A) -> Bool)) && !(y == w) → (l : (A, A) -> Bool)((f : ((A) -> Bool) -> A)(x), f(y))"),
    fn(
      x2353 : @kernel.Thm,
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
      let s2354 = @tactics.assume_tac(x2353)
      fn(
        x2355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2354(x2355)
      }
    },
  )
  let t2349 = @meson.meson_tac(@list.List([]))
  let t2348 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2344 = @term_syntax.parse_term("(x : A) => !(g : (A, A) -> Bool)(x, x)")
  let t2347 = @tactics.disch_then(fn(
    x2346 : @kernel.Thm,
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
      x2341 : @kernel.Thm,
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
      let s2342 = @tactics.mp_tac(x2341)
      fn(
        x2343 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2342(x2343)
      }
    })(((x2345 : @kernel.Thm) => @bool.spec(t2344, x2345))(x2346))
  })
  let t2340 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (A, A) -> Bool)"))
  let t2350 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@sets.injective_left_inverse(), @class.not_exists_thm()]),
          ),
          t2340,
        ),
        t2347,
      ),
      t2348,
    ),
    t2349,
  )
  let t2339 = @meson.asm_meson_tac(@list.List([]))
  let t2338 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([toset_poset()])),
  )
  let t2337 = @simp.asm_simp_tac(@list.List([]))
  let t2334 = @drule.match_mp(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(y : _) == select((x : _) => (P : (_) -> Bool)(x)) → (∃ x : _, P(x)) → P(y)"),
    ),
  )
  let t2336 = @tactics.disch_then(fn(
    x2335 : @kernel.Thm,
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
      x2331 : @kernel.Thm,
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
      let s2332 = @tactics.mp_tac(x2331)
      fn(
        x2333 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2332(x2333)
      }
    })(t2334(x2335))
  })
  let t2330 = @simp.asm_simp_tac(@list.List([]))
  let t2329 = @tactics.first_x_assum(fn(
    x2320 : @kernel.Thm,
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
    let t = x2320
    @simp.gen_rewrite_tac(
      fn(
        x2328 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x2322 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2323 = @equal.rand_conv(x2322)
          fn(x2324 : @kernel.Term) -> @kernel.Thm raise { s2323(x2324) }
        })(
          (fn(
            x2325 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2326 = @equal.rand_conv(x2325)
            fn(x2327 : @kernel.Term) -> @kernel.Thm raise { s2326(x2327) }
          })(x2328),
        )
      },
      @list.List([t]),
    )
  })
  let t2319 = @simp.gen_rewrite_tac(
    fn(
      x2318 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x2318
    },
    @list.List([@equal.gsym(@class.contrapos_thm())]),
  )
  let t2317 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2316 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t2315 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) → P(y, x)) && (∀ x : _, ∀ y : _, (R : (_, _) -> Bool)(x, y) → P(x, y)) → (∀ x : _, ∀ y : _, R(x, y) || R(y, x)) → (∀ x : _, ∀ y : _, P(x, y))"),
    ),
  )
  let t2314 = @simp.rewrite_tac(@list.List([@sets.univ()]))
  let t2313 = @tactics.first_x_assum(fn(
    x2310 : @kernel.Thm,
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
    let s2311 = @tactics.subst1_tac(x2310)
    fn(
      x2312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2311(x2312)
    }
  })
  let t2308 = @drule.match_mp(ordinal_imp_woset())
  let t2306 = @simp.rewrite_rule(
    @list.List([
      @simp.rewrite_rule(
        @list.List([
          @sets.subset(),
          @equal.gsym(@sets.member_not_empty()),
          @sets.in_(),
        ]),
      )(woset()),
    ]),
  )
  let t2351 = @list.List([
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
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.first_assum(fn(
                                    x2309 : @kernel.Thm,
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
                                    (fn(
                                      x2307 : @kernel.Thm,
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
                                      (fn(
                                        x2305 : @kernel.Thm,
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
                                        (fn(
                                          x2304 : @list.List[@kernel.Thm],
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
                                                (
                                                  @kernel.HolType,
                                                  @kernel.HolType,
                                                ),
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
                                            x2300 : @kernel.Thm,
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
                                            let s2301 = @tactics.mp_tac(x2300)
                                            fn(
                                              x2302 : (
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
                                            ) raise {
                                              s2301(x2302)
                                            }
                                          })(
                                            ((x2303 : @list.List[@kernel.Thm]) => {
                                              @lib.el(3, x2303)
                                            })(x2304),
                                          )
                                        })(@bool.conjuncts_rule(x2305))
                                      })(t2306(x2307))
                                    })(t2308(x2309))
                                  }),
                                  t2313,
                                ),
                                t2314,
                              ),
                              t2315,
                            ),
                            @tactics.conj_tac,
                          ),
                          t2316,
                        ),
                        t2317,
                      ),
                      @tactics.disch_tac,
                    ),
                    t2319,
                  ),
                  @tactics.disch_tac,
                ),
                t2329,
              ),
              t2330,
            ),
            t2336,
          ),
          t2337,
        ),
        t2338,
      ),
      t2339,
    ),
    t2350,
  ])
  let t2299 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ v : (A) -> Bool, ∀ w : (A) -> Bool, (f : ((A) -> Bool) -> A)(v) == f(w) → v == w"),
    fn(
      x2296 : @kernel.Thm,
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
      let s2297 = @tactics.mp_tac(x2296)
      fn(
        x2298 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2297(x2298)
      }
    },
  )
  let t2295 = @simp.rewrite_tac(
    @list.List([
      @class.not_imp(),
      @class.not_exists_thm(),
      @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) && (r : Bool)) == (p && q → !r)")),
    ]),
  )
  let t2294 = @simp.gen_rewrite_tac(
    fn(
      x2293 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2287 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2288 = @equal.rand_conv(x2287)
        fn(x2289 : @kernel.Term) -> @kernel.Thm raise { s2288(x2289) }
      })(
        (fn(
          x2290 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2291 = @equal.once_depth_conv(x2290)
          fn(x2292 : @kernel.Term) -> @kernel.Thm raise { s2291(x2292) }
        })(x2293),
      )
    },
    @list.List([@class.not_forall_thm()]),
  )
  let t2286 = @simp.once_rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(∃ w : _, (P : (_) -> Bool)(w)) == !(∀ w : _, !P(w))"),
      ),
    ]),
  )
  let t2285 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t2283 = @drule.match_mp(ordinal_imp_woset())
  let t2281 = @simp.rewrite_rule(
    @list.List([
      @simp.rewrite_rule(
        @list.List([
          @sets.subset(),
          @equal.gsym(@sets.member_not_empty()),
          @sets.in_(),
        ]),
      )(woset()),
    ]),
  )
  let t2352 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.first_assum(fn(
                      x2284 : @kernel.Thm,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
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
                        x2282 : @kernel.Thm,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
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
                          x2280 : @kernel.Thm,
                        ) -> ((
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
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
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
                            x2279 : @list.List[@kernel.Thm],
                          ) -> ((
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
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise) raise {
                            @tactics.match_mp_tac(@lib.last(x2279))
                          })(@bool.conjuncts_rule(x2280))
                        })(t2281(x2282))
                      })(t2283(x2284))
                    }),
                    @tactics.conj_tac,
                  ),
                  t2285,
                ),
                t2286,
              ),
              t2294,
            ),
            t2295,
          ),
          @tactics.disch_tac,
        ),
        t2299,
      ),
      t2351,
    ),
    @tactics.all_tac,
  ])
  let t2278 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ w : (A) -> Bool, (∀ x : A, IN(x, fld((l : (A, A) -> Bool))) → (∃ v : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, w) && !(v == w) && l(x, (f : ((A) -> Bool) -> A)(v)))) && (∀ z : (A) -> Bool, (∀ x : A, IN(x, fld(l)) → (∃ v : (A) -> Bool, r(v, z) && !(v == z) && l(x, f(v)))) → r(w, z))"),
    @tactics.strip_assume_tac,
  )
  let t2276 = @simp.asm_rewrite_tac(@list.List([@sets.member_not_empty()]))
  let t2275 = @tactics.conv_tac(@class.select_conv)
  let t2274 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2277 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.once_asm_rewrite_tac(@list.List([])),
            ),
            @class.cond_cases_tac,
          ),
          t2274,
        ),
        t2275,
      ),
      t2276,
    ),
    @tactics.all_tac,
  ])
  let t2273 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ w : (A) -> Bool, IN((f : ((A) -> Bool) -> A)(w), fld((l : (A, A) -> Bool)))"),
    fn(
      x2270 : @kernel.Thm,
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
      let s2271 = @tactics.assume_tac(x2270)
      fn(
        x2272 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2271(x2272)
      }
    },
  )
  let t2268 = @meson.asm_meson_tac(@list.List([]))
  let t2267 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  ])
  let t2266 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(p : Bool) == (p' : Bool) && (x' : _) == (x : _) → (if p { x } else { (a : _) }) == (if p' { x' } else { a })"),
    ),
  )
  let t2265 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2264 = @simp.rewrite_tac(@list.List([]))
  let t2260 = @drule.match_mp(@wf.wf_rec())
  let t2263 = @tactics.disch_then(fn(
    x2262 : @kernel.Thm,
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
      x2261 : @kernel.Thm,
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
      @tactics.match_mp_tac(t2260(x2261))
    })(@bool.conjunct2(x2262))
  })
  let t2259 = @simp.rewrite_tac(@list.List([woset_wf(), properly()]))
  let t2257 = @drule.match_mp(ordinal_imp_woset())
  let t2269 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.first_assum(fn(
                      x2258 : @kernel.Thm,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
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
                        x2254 : @kernel.Thm,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise {
                        let s2255 = @tactics.mp_tac(x2254)
                        fn(
                          x2256 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
                        ) -> (
                          (
                            @list.List[@kernel.Term],
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                          ),
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
                          (
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                            @list.List[@kernel.Thm],
                          ) -> @kernel.Thm raise,
                        ) raise {
                          s2255(x2256)
                        }
                      })(t2257(x2258))
                    }),
                    t2259,
                  ),
                  t2263,
                ),
                t2264,
              ),
              t2265,
            ),
            t2266,
          ),
          @tactics.conj_tac,
        ),
        t2267,
      ),
      t2268,
    ),
    @tactics.all_tac,
  ])
  let t2253 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ f : ((A) -> Bool) -> A, ∀ w : (A) -> Bool, f(w) == (if (∃ x : A, IN(x, fld((l : (A, A) -> Bool))) && (∀ v : (A) -> Bool, (r : ((A) -> Bool, (A) -> Bool) -> Bool)(v, w) && !(v == w) → !l(x, f(v)))) { select((x : A) => IN(x, fld(l)) && (∀ v : (A) -> Bool, r(v, w) && !(v == w) → !l(x, f(v)))) } else { select((x : A) => IN(x, fld(l))) })"),
    @tactics.strip_assume_tac,
  )
  let t2251 = @simp.rewrite_tac(@list.List([@sets.in_(), wo_ordinal()]))
  let t2252 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ()])),
      t2251,
    ),
    @tactics.all_tac,
  ])
  let t2250 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ r : ((A) -> Bool, (A) -> Bool) -> Bool, ordinal(r) && fld(r) == UNIV"),
    @tactics.strip_assume_tac,
  )
  let t2248 = @sets.set_tac(@list.List([]))
  let t2247 = @simp.asm_rewrite_tac(
    @list.List([woset(), fld_trivial(), @sets.not_in_empty()]),
  )
  let t2249 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (y : A) => false")),
        t2247,
      ),
      t2248,
    ),
    @tactics.all_tac,
  ])
  let t2246 = @class.asm_cases_tac(@term_syntax.parse_term("fld((l : (A, A) -> Bool)) == {}"))
  let t2453 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.thenl(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.thenl(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.then_tac(
                                                @tactics.then_tac(
                                                  @tactics.thenl(
                                                    @tactics.then_tac(
                                                      @tactics.thenl(
                                                        @tactics.then_tac(
                                                          @tactics.then_tac(
                                                            @tactics.thenl(
                                                              @tactics.then_tac(
                                                                @tactics.thenl(
                                                                  @tactics.then_tac(
                                                                    @tactics.thenl(
                                                                      @tactics.then_tac(
                                                                        @tactics.thenl(
                                                                          @tactics.then_tac(
                                                                            @tactics.thenl(
                                                                              @tactics.then_tac(
                                                                                @tactics.thenl(
                                                                                  @tactics.then_tac(
                                                                                    @tactics.repeat_tac(
                                                                                      @tactics.strip_tac,
                                                                                    ),
                                                                                    t2246,
                                                                                  ),
                                                                                  t2249,
                                                                                ),
                                                                                t2250,
                                                                              ),
                                                                              t2252,
                                                                            ),
                                                                            t2253,
                                                                          ),
                                                                          t2269,
                                                                        ),
                                                                        t2273,
                                                                      ),
                                                                      t2277,
                                                                    ),
                                                                    t2278,
                                                                  ),
                                                                  t2352,
                                                                ),
                                                                t2356,
                                                              ),
                                                              t2389,
                                                            ),
                                                            t2390,
                                                          ),
                                                          t2394,
                                                        ),
                                                        t2400,
                                                      ),
                                                      t2401,
                                                    ),
                                                    t2407,
                                                  ),
                                                  t2411,
                                                ),
                                                t2415,
                                              ),
                                              t2416,
                                            ),
                                            @tactics.conj_tac,
                                          ),
                                          t2418,
                                        ),
                                        t2419,
                                      ),
                                      t2420,
                                    ),
                                    @tactics.strip_tac,
                                  ),
                                  t2426,
                                ),
                                t2427,
                              ),
                              t2436,
                            ),
                            t2437,
                          ),
                          @tactics.ants_tac,
                        ),
                        t2438,
                      ),
                      t2439,
                    ),
                    t2440,
                  ),
                  @tactics.conj_tac,
                ),
                t2441,
              ),
              t2444,
            ),
            t2445,
          ),
          t2446,
        ),
        @tactics.strip_tac,
      ),
      @tactics.conj_tac,
    ),
    t2452,
  )
  toset_cofinal_woset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : (A, A) -> Bool, toset(l) → (∃ w : (A, A) -> Bool, (∀ x : A, ∀ y : A, w(x, y) → l(x, y)) && woset(w) && (∀ x : A, IN(x, fld(l)) → (∃ y : A, IN(y, fld(w)) && l(x, y))))"),
      t2453,
    ),
  )
}

///|
let toset_cofinal_woset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TOSET_COFINAL_WOSET",
)

///|
/// `TOSET_COFINAL_WOSET`
pub fn toset_cofinal_woset() -> @kernel.Thm {
  toset_cofinal_woset_c.get()
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
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
}
