// Translated from upstream Library/matroids.ml; edit this file directly.

///|
/// matroid_tybij
fn step_1() -> Unit raise {
  let t1 = @sets.set_tac(@list.List([]))
  let t2 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(({} : (A) -> Bool), (x : (A) -> Bool) => x)")),
    t1,
  )
  let eth = @tactics.prove(
    @term_syntax.parse_term("∃ m : ((A) -> Bool, ((A) -> Bool, A) -> Bool), (∀ s : (A) -> Bool, SUBSET(s, FST(m)) → SUBSET(SND(m, s), FST(m))) && (∀ s : (A) -> Bool, SUBSET(s, FST(m)) → SUBSET(s, SND(m, s))) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && SUBSET(t, FST(m)) → SUBSET(SND(m, s), SND(m, t))) && (∀ s : (A) -> Bool, SUBSET(s, FST(m)) → SND(m, SND(m, s)) == SND(m, s)) && (∀ s : (A) -> Bool, ∀ x : A, SUBSET(s, FST(m)) && IN(x, SND(m, s)) → (∃ s' : (A) -> Bool, FINITE(s') && SUBSET(s', s) && IN(x, SND(m, s')))) && (∀ s : (A) -> Bool, ∀ x : A, ∀ y : A, SUBSET(s, FST(m)) && IN(x, FST(m)) && IN(y, SND(m, INSERT(x, s))) && !IN(y, SND(m, s)) → IN(x, SND(m, INSERT(y, s))))"),
    t2,
  )
  matroid_tybij_c.set(
    @class.new_type_definition("matroid", ("matroid", "dest_matroid"), eth),
  )
}

///|
let matroid_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matroid_tybij")

///|
/// `matroid_tybij`
pub fn matroid_tybij() -> @kernel.Thm {
  matroid_tybij_c.get()
}

///|
/// matroid_set
fn step_2() -> Unit raise {
  matroid_set_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_set : (Matroid[A], A) -> Bool) == ((m : Matroid[A]) => FST(dest_matroid(m)))"),
    ),
  )
}

///|
let matroid_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matroid_set")

///|
/// `matroid_set`
pub fn matroid_set() -> @kernel.Thm {
  matroid_set_c.get()
}

///|
/// matroid_span
fn step_3() -> Unit raise {
  matroid_span_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_span : (Matroid[A], (A) -> Bool, A) -> Bool) == ((m : Matroid[A]) => SND(dest_matroid(m)))"),
    ),
  )
}

///|
let matroid_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matroid_span")

///|
/// `matroid_span`
pub fn matroid_span() -> @kernel.Thm {
  matroid_span_c.get()
}

///|
let matroid_span_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SUBSET",
)

///|
/// `MATROID_SPAN_SUBSET`
pub fn matroid_span_subset() -> @kernel.Thm {
  matroid_span_subset_c.get()
}

///|
let matroid_span_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SUPERSET",
)

///|
/// `MATROID_SPAN_SUPERSET`
pub fn matroid_span_superset() -> @kernel.Thm {
  matroid_span_superset_c.get()
}

///|
let matroid_span_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_MONO",
)

///|
/// `MATROID_SPAN_MONO`
pub fn matroid_span_mono() -> @kernel.Thm {
  matroid_span_mono_c.get()
}

///|
let matroid_span_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SPAN",
)

///|
/// `MATROID_SPAN_SPAN`
pub fn matroid_span_span() -> @kernel.Thm {
  matroid_span_span_c.get()
}

///|
let matroid_span_finitary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_FINITARY",
)

///|
/// `MATROID_SPAN_FINITARY`
pub fn matroid_span_finitary() -> @kernel.Thm {
  matroid_span_finitary_c.get()
}

///|
let matroid_span_exchange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_EXCHANGE",
)

///|
/// `MATROID_SPAN_EXCHANGE`
pub fn matroid_span_exchange() -> @kernel.Thm {
  matroid_span_exchange_c.get()
}

///|
/// MATROID_SPAN_SUBSET, MATROID_SPAN_SUPERSET, MATROID_SPAN_MONO, MATROID_SPAN_SPAN, MATROID_SPAN_FINITARY, MATROID_SPAN_EXCHANGE
fn step_4() -> Unit raise {
  let t11 = @bool.conjunct2(matroid_tybij())
  let t12 = @bool.spec(@term_syntax.parse_term("dest_matroid((m : Matroid[A]))"), t11)
  let t6 = @simp.once_rewrite_rule(@list.List([@class.fun_eq_thm()]))
  let t7 = @simp.rewrite_rule(@list.List([]))
  let t10 = @lib.map(
    fn(x9 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x8 : @kernel.Thm) -> @kernel.Thm raise { t7(t6(x8)) })(@equal.sym(x9))
    },
    @list.List([matroid_set(), matroid_span()]),
  )
  let t13 = @simp.rewrite_rule(t10.prepend(@bool.conjunct1(matroid_tybij())))(
    t12,
  )
  let t3 = @term_syntax.parse_term("(m : Matroid[A])")
  match
    ((x5 : @list.List[@kernel.Thm]) => {
      @lib.map((x4 : @kernel.Thm) => @bool.gen(t3, x4), x5)
    })(@bool.conjuncts_rule(t13)) {
    More(
      matroid_span_subset,
      tail=More(
        matroid_span_superset,
        tail=More(
          matroid_span_mono,
          tail=More(
            matroid_span_span,
            tail=More(
              matroid_span_finitary,
              tail=More(matroid_span_exchange, tail=Empty)
            )
          )
        )
      )
    ) => {
      matroid_span_subset_c.set(matroid_span_subset)
      matroid_span_superset_c.set(matroid_span_superset)
      matroid_span_mono_c.set(matroid_span_mono)
      matroid_span_span_c.set(matroid_span_span)
      matroid_span_finitary_c.set(matroid_span_finitary)
      matroid_span_exchange_c.set(matroid_span_exchange)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:33:4")
  }
}

///|
/// MATROID_SPAN_INC
fn step_5() -> Unit raise {
  let t14 = @meson.meson_tac(
    @list.List([matroid_span_superset(), @sets.subset()]),
  )
  matroid_span_inc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, SUBSET(s, matroid_set(m)) && IN(x, s) → IN(x, matroid_span(m, s))"),
      t14,
    ),
  )
}

///|
let matroid_span_inc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_INC",
)

///|
/// `MATROID_SPAN_INC`
pub fn matroid_span_inc() -> @kernel.Thm {
  matroid_span_inc_c.get()
}

///|
/// SUBSET_MATROID_SPAN
fn step_6() -> Unit raise {
  let t15 = @meson.meson_tac(
    @list.List([
      matroid_span_mono(),
      matroid_span_span(),
      matroid_span_subset(),
      matroid_span_superset(),
      @sets.subset_trans(),
    ]),
  )
  subset_matroid_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → SUBSET(matroid_span(m, s), matroid_span(m, t)) == SUBSET(s, matroid_span(m, t))"),
      t15,
    ),
  )
}

///|
let subset_matroid_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBSET_MATROID_SPAN",
)

///|
/// `SUBSET_MATROID_SPAN`
pub fn subset_matroid_span() -> @kernel.Thm {
  subset_matroid_span_c.get()
}

///|
/// MATROID_SPAN_MINIMAL
fn step_7() -> Unit raise {
  let t16 = @meson.meson_tac(
    @list.List([
      subset_matroid_span(),
      matroid_span_subset(),
      @sets.subset_trans(),
    ]),
  )
  matroid_span_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(t, matroid_set(m)) && SUBSET(s, matroid_span(m, t)) → SUBSET(matroid_span(m, s), matroid_span(m, t))"),
      t16,
    ),
  )
}

///|
let matroid_span_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_MINIMAL",
)

///|
/// `MATROID_SPAN_MINIMAL`
pub fn matroid_span_minimal() -> @kernel.Thm {
  matroid_span_minimal_c.get()
}

///|
/// MATROID_SPAN_SET
fn step_8() -> Unit raise {
  let t17 = @meson.meson_tac(
    @list.List([
      matroid_span_superset(),
      @sets.subset_refl(),
      matroid_span_subset(),
    ]),
  )
  let t18 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])),
    t17,
  )
  matroid_span_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_span(m, matroid_set(m)) == matroid_set(m)"),
      t18,
    ),
  )
}

///|
let matroid_span_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SET",
)

///|
/// `MATROID_SPAN_SET`
pub fn matroid_span_set() -> @kernel.Thm {
  matroid_span_set_c.get()
}

///|
/// MATROID_SPAN_EQ
fn step_9() -> Unit raise {
  let t19 = @simp.simp_tac(
    @list.List([@equal.gsym(@sets.subset_antisym_eq()), subset_matroid_span()]),
  )
  matroid_span_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → (matroid_span(m, s) == matroid_span(m, t)) == (SUBSET(s, matroid_span(m, t)) && SUBSET(t, matroid_span(m, s)))"),
      t19,
    ),
  )
}

///|
let matroid_span_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_EQ",
)

///|
/// `MATROID_SPAN_EQ`
pub fn matroid_span_eq() -> @kernel.Thm {
  matroid_span_eq_c.get()
}

///|
/// MATROID_SPAN_EQ_SET
fn step_10() -> Unit raise {
  let t20 = @meson.meson_tac(
    @list.List([matroid_span_eq(), @sets.subset_refl(), matroid_span_set()]),
  )
  matroid_span_eq_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → (matroid_span(m, s) == matroid_set(m)) == SUBSET(matroid_set(m), matroid_span(m, s))"),
      t20,
    ),
  )
}

///|
let matroid_span_eq_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_EQ_SET",
)

///|
/// `MATROID_SPAN_EQ_SET`
pub fn matroid_span_eq_set() -> @kernel.Thm {
  matroid_span_eq_set_c.get()
}

///|
/// MATROID_SPAN_SUBSET_EQ
fn step_11() -> Unit raise {
  let t21 = @meson.meson_tac(
    @list.List([
      matroid_span_eq(),
      @sets.subset_trans(),
      matroid_span_superset(),
    ]),
  )
  matroid_span_subset_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && SUBSET(t, matroid_set(m)) → (matroid_span(m, s) == matroid_span(m, t)) == SUBSET(t, matroid_span(m, s))"),
      t21,
    ),
  )
}

///|
let matroid_span_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SUBSET_EQ",
)

///|
/// `MATROID_SPAN_SUBSET_EQ`
pub fn matroid_span_subset_eq() -> @kernel.Thm {
  matroid_span_subset_eq_c.get()
}

///|
/// MATROID_SPAN_INTER_SUBSET
fn step_12() -> Unit raise {
  let t24 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t23 = @tactics.match_mp_tac(matroid_span_mono())
  let t22 = @tactics.repeat_tac(@tactics.strip_tac)
  let t25 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.subset_inter()])),
        t22,
      ),
      t23,
    ),
    t24,
  )
  matroid_span_inter_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → SUBSET(matroid_span(m, INTER(s, t)), INTER(matroid_span(m, s), matroid_span(m, t)))"),
      t25,
    ),
  )
}

///|
let matroid_span_inter_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_INTER_SUBSET",
)

///|
/// `MATROID_SPAN_INTER_SUBSET`
pub fn matroid_span_inter_subset() -> @kernel.Thm {
  matroid_span_inter_subset_c.get()
}

///|
/// MATROID_SPAN_UNION
fn step_13() -> Unit raise {
  let t30 = @simp.asm_simp_tac(
    @list.List([
      @sets.union_subset(),
      matroid_span_subset(),
      matroid_span_mono(),
      @sets.subset_union(),
    ]),
  )
  let t29 = @simp.asm_simp_tac(
    @list.List([
      matroid_span_superset(),
      @sets.set_rule(
        @term_syntax.parse_term("SUBSET((s : (_) -> Bool), (s' : (_) -> Bool)) && SUBSET((t : (_) -> Bool), (t' : (_) -> Bool)) → SUBSET(UNION(s, t), UNION(s', t'))"),
      ),
    ]),
  )
  let t27 = @tactics.match_mp_tac(matroid_span_minimal())
  let t28 = @list.List([@tactics.match_mp_tac(matroid_span_mono()), t27])
  let t26 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t31 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t26),
          @tactics.conj_tac,
        ),
        t28,
      ),
      t29,
    ),
    t30,
  )
  matroid_span_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → matroid_span(m, UNION(s, t)) == matroid_span(m, UNION(matroid_span(m, s), matroid_span(m, t)))"),
      t31,
    ),
  )
}

///|
let matroid_span_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_UNION",
)

///|
/// `MATROID_SPAN_UNION`
pub fn matroid_span_union() -> @kernel.Thm {
  matroid_span_union_c.get()
}

///|
/// MATROID_SPAN_UNION_LEFT
fn step_14() -> Unit raise {
  let t32 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_union(),
      matroid_span_span(),
      matroid_span_subset(),
    ]),
  )
  matroid_span_union_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → matroid_span(m, UNION(s, t)) == matroid_span(m, UNION(matroid_span(m, s), t))"),
      t32,
    ),
  )
}

///|
let matroid_span_union_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_UNION_LEFT",
)

///|
/// `MATROID_SPAN_UNION_LEFT`
pub fn matroid_span_union_left() -> @kernel.Thm {
  matroid_span_union_left_c.get()
}

///|
/// MATROID_SPAN_UNION_RIGHT
fn step_15() -> Unit raise {
  let t33 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_union(),
      matroid_span_span(),
      matroid_span_subset(),
    ]),
  )
  matroid_span_union_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → matroid_span(m, UNION(s, t)) == matroid_span(m, UNION(s, matroid_span(m, t)))"),
      t33,
    ),
  )
}

///|
let matroid_span_union_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_UNION_RIGHT",
)

///|
/// `MATROID_SPAN_UNION_RIGHT`
pub fn matroid_span_union_right() -> @kernel.Thm {
  matroid_span_union_right_c.get()
}

///|
/// MATROID_SPAN_UNION_SUBSET
fn step_16() -> Unit raise {
  let t36 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t35 = @tactics.match_mp_tac(matroid_span_mono())
  let t34 = @tactics.repeat_tac(@tactics.strip_tac)
  let t37 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@sets.union_subset()])),
        t34,
      ),
      t35,
    ),
    t36,
  )
  matroid_span_union_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → SUBSET(UNION(matroid_span(m, s), matroid_span(m, t)), matroid_span(m, UNION(s, t)))"),
      t37,
    ),
  )
}

///|
let matroid_span_union_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_UNION_SUBSET",
)

///|
/// `MATROID_SPAN_UNION_SUBSET`
pub fn matroid_span_union_subset() -> @kernel.Thm {
  matroid_span_union_subset_c.get()
}

///|
/// MATROID_SPAN_EXCHANGE_DELETE
fn step_17() -> Unit raise {
  let t45 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t44 = @tactics.match_mp_tac(matroid_span_mono())
  let t41 = @drule.match_mp(
    @sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")),
  )
  let t43 = @tactics.first_x_assum(fn(
    x42 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t41(x42))
  })
  let t40 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @tactics.match_mp_tac(matroid_span_exchange())
  let t46 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t38),
              t39,
            ),
            @tactics.conj_tac,
          ),
          t40,
        ),
        t43,
      ),
      t44,
    ),
    t45,
  )
  matroid_span_exchange_delete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ a : A, ∀ b : A, ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) && IN(b, matroid_set(m)) && IN(a, matroid_span(m, s)) && !IN(a, matroid_span(m, DELETE(s, b))) → IN(b, matroid_span(m, INSERT(a, DELETE(s, b))))"),
      t46,
    ),
  )
}

///|
let matroid_span_exchange_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_EXCHANGE_DELETE",
)

///|
/// `MATROID_SPAN_EXCHANGE_DELETE`
pub fn matroid_span_exchange_delete() -> @kernel.Thm {
  matroid_span_exchange_delete_c.get()
}

///|
/// MATROID_SPAN_UNION_EQ
fn step_18() -> Unit raise {
  let t51 = @meson.asm_meson_tac(@list.List([matroid_span_superset()]))
  let t50 = @simp.asm_rewrite_tac(
    @list.List([@sets.union_subset(), @sets.subset_union()]),
  )
  let t47 = @term_syntax.parse_term("UNION((s : (A) -> Bool), (t : (A) -> Bool))")
  let t48 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t49 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t48, t47]),
      matroid_span_subset_eq(),
    ),
  )
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49),
      t50,
    ),
    t51,
  )
  matroid_span_union_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → (matroid_span(m, UNION(s, t)) == matroid_span(m, t)) == SUBSET(s, matroid_span(m, t))"),
      t52,
    ),
  )
}

///|
let matroid_span_union_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_UNION_EQ",
)

///|
/// `MATROID_SPAN_UNION_EQ`
pub fn matroid_span_union_eq() -> @kernel.Thm {
  matroid_span_union_eq_c.get()
}

///|
/// MATROID_SPAN_INSERT_EQ
fn step_19() -> Unit raise {
  let t53 = @meson.meson_tac(
    @list.List([@equal.gsym(@sets.sing_subset()), matroid_span_union_eq()]),
  )
  let t54 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @sets.set_rule(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)")),
      ]),
    ),
    t53,
  )
  matroid_span_insert_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, SUBSET(s, matroid_set(m)) && IN(x, matroid_set(m)) → (matroid_span(m, INSERT(x, s)) == matroid_span(m, s)) == IN(x, matroid_span(m, s))"),
      t54,
    ),
  )
}

///|
let matroid_span_insert_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_INSERT_EQ",
)

///|
/// `MATROID_SPAN_INSERT_EQ`
pub fn matroid_span_insert_eq() -> @kernel.Thm {
  matroid_span_insert_eq_c.get()
}

///|
/// MATROID_SPAN_DELETE_EQ
fn step_20() -> Unit raise {
  let t55 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_superset(),
      @sets.set_rule(
        @term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) == (IN(x, t) && SUBSET(DELETE(s, x), t))"),
      ),
    ]),
  )
  let t56 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([matroid_span_subset_eq(), @sets.delete_subset()]),
    ),
    t55,
  )
  matroid_span_delete_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, IN(x, s) && SUBSET(s, matroid_set(m)) → (matroid_span(m, DELETE(s, x)) == matroid_span(m, s)) == IN(x, matroid_span(m, DELETE(s, x)))"),
      t56,
    ),
  )
}

///|
let matroid_span_delete_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_DELETE_EQ",
)

///|
/// `MATROID_SPAN_DELETE_EQ`
pub fn matroid_span_delete_eq() -> @kernel.Thm {
  matroid_span_delete_eq_c.get()
}

///|
/// MATROID_SPAN_TRANS
fn step_21() -> Unit raise {
  let t57 = @meson.meson_tac(
    @list.List([@sets.subset(), matroid_span_subset(), matroid_span_insert_eq()]),
  )
  matroid_span_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ x : A, ∀ y : A, ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) && IN(x, matroid_span(m, s)) && IN(y, matroid_span(m, INSERT(x, s))) → IN(y, matroid_span(m, s))"),
      t57,
    ),
  )
}

///|
let matroid_span_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_TRANS",
)

///|
/// `MATROID_SPAN_TRANS`
pub fn matroid_span_trans() -> @kernel.Thm {
  matroid_span_trans_c.get()
}

///|
/// MATROID_SPAN_FINITARY_GEN
fn step_22() -> Unit raise {
  let t84 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t83 = @tactics.match_mp_tac(matroid_span_mono())
  let t79 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.subset_trans()),
  )
  let t81 = @tactics.first_x_assum(fn(
    x80 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t79(x80))
  })
  let t77 = @drule.match_mp(
    @sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")),
  )
  let t82 = @list.List([
    @tactics.first_x_assum(fn(
      x78 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.match_mp_tac(t77(x78))
    }),
    t81,
  ])
  let t76 = @simp.asm_rewrite_tac(
    @list.List([@sets.finite_union(), @sets.union_subset()]),
  )
  let t75 = @tactics.exists_tac(@term_syntax.parse_term("UNION((t : (A) -> Bool), (u : (A) -> Bool))"))
  let t74 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : (A) -> Bool)"))
  let t73 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t70 = @term_syntax.parse_term("(x : A)")
  let t71 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t72 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t71, t70]),
      matroid_span_finitary(),
    ),
  )
  let t69 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t68 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t67 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x64 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s65 = @tactics.mp_tac(x64)
        fn(
          x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s65(x66)
        }
      },
      @tactics.strip_assume_tac,
    ),
  )
  let t62 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t63 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : A)"), t62]),
  )
  let t61 = @list.List([
    @meson.meson_tac(@list.List([@sets.finite_empty(), @sets.empty_subset()])),
    @tactics.all_tac,
  ])
  let t60 = @simp.rewrite_tac(
    @list.List([
      @sets.empty_subset(),
      @sets.insert_subset(),
      @theorems.imp_imp(),
      @equal.gsym(@theorems.conj_assoc()),
    ]),
  )
  let t59 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t58 = @simp.rewrite_tac(
    @list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]),
  )
  let t85 = @tactics.then_tac(
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
                                @tactics.thenl(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.gen_tac, @tactics.gen_tac,
                                            ),
                                            t58,
                                          ),
                                          @tactics.disch_tac,
                                        ),
                                        t59,
                                      ),
                                      t60,
                                    ),
                                    @tactics.conj_tac,
                                  ),
                                  t61,
                                ),
                                t63,
                              ),
                              t67,
                            ),
                            t68,
                          ),
                          t69,
                        ),
                        @tactics.strip_tac,
                      ),
                      t72,
                    ),
                    t73,
                  ),
                  t74,
                ),
                @tactics.strip_tac,
              ),
              t75,
            ),
            t76,
          ),
          @tactics.conj_tac,
        ),
        t82,
      ),
      t83,
    ),
    t84,
  )
  matroid_span_finitary_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ k : (A) -> Bool, SUBSET(s, matroid_set(m)) && FINITE(k) && SUBSET(k, matroid_span(m, s)) → (∃ s' : (A) -> Bool, FINITE(s') && SUBSET(s', s) && SUBSET(k, matroid_span(m, s')))"),
      t85,
    ),
  )
}

///|
let matroid_span_finitary_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_FINITARY_GEN",
)

///|
/// `MATROID_SPAN_FINITARY_GEN`
pub fn matroid_span_finitary_gen() -> @kernel.Thm {
  matroid_span_finitary_gen_c.get()
}

///|
/// MATROID_SPAN_FINITARY_MINIMAL
fn step_23() -> Unit raise {
  let t108 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t109 = @list.List([
    @meson.asm_meson_tac(@list.List([@sets.finite_subset()])),
    t108,
  ])
  let t106 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t107 = @list.List([
    @meson.asm_meson_tac(@list.List([@sets.subset_refl()])),
    t106,
  ])
  let t105 = @simp.rewrite_tac(@list.List([]))
  let t101 = @term_syntax.parse_term("(s : (A) -> Bool) => SUBSET(s, (u : (A) -> Bool)) && IN((x : A), matroid_span((m : Matroid[A]), s))")
  let t104 = @tactics.disch_then(fn(
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
    (fn(
      x98 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s99 = @tactics.mp_tac(x98)
      fn(
        x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s99(x100)
      }
    })(((x102 : @kernel.Thm) => @bool.spec(t101, x102))(x103))
  })
  let t97 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t94 = @drule.match_mp(@sets.wf_psubset())
  let t96 = @tactics.first_assum(fn(
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
      x91 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s92 = @tactics.mp_tac(x91)
      fn(
        x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s92(x93)
      }
    })(t94(x95))
  })
  let t90 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t86 = @term_syntax.parse_term("(x : A)")
  let t87 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t88 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t87, t86]),
      matroid_span_finitary(),
    ),
  )
  let t110 = @tactics.thenl(
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
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t88,
                          ),
                          t89,
                        ),
                        t90,
                      ),
                      t96,
                    ),
                    t97,
                  ),
                  t104,
                ),
                t105,
              ),
              @tactics.ants_tac,
            ),
            t107,
          ),
          @tactics.gen_tac,
        ),
        @tactics.strip_tac,
      ),
      @tactics.conj_tac,
    ),
    t109,
  )
  matroid_span_finitary_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, SUBSET(s, matroid_set(m)) && IN(x, matroid_span(m, s)) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && IN(x, matroid_span(m, t)) && (∀ t' : (A) -> Bool, PSUBSET(t', t) → !IN(x, matroid_span(m, t'))))"),
      t110,
    ),
  )
}

///|
let matroid_span_finitary_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_FINITARY_MINIMAL",
)

///|
/// `MATROID_SPAN_FINITARY_MINIMAL`
pub fn matroid_span_finitary_minimal() -> @kernel.Thm {
  matroid_span_finitary_minimal_c.get()
}

///|
/// matroid_spanning
fn step_24() -> Unit raise {
  matroid_spanning_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_spanning : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (SUBSET(s, matroid_set(m)) && matroid_span(m, s) == matroid_set(m))"),
    ),
  )
}

///|
let matroid_spanning_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_spanning",
)

///|
/// `matroid_spanning`
pub fn matroid_spanning() -> @kernel.Thm {
  matroid_spanning_c.get()
}

///|
/// matroid_independent
fn step_25() -> Unit raise {
  matroid_independent_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_independent : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (SUBSET(s, matroid_set(m)) && (∀ x : A, IN(x, s) → !IN(x, matroid_span(m, DELETE(s, x)))))"),
    ),
  )
}

///|
let matroid_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_independent",
)

///|
/// `matroid_independent`
pub fn matroid_independent() -> @kernel.Thm {
  matroid_independent_c.get()
}

///|
/// matroid_basis
fn step_26() -> Unit raise {
  matroid_basis_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_basis : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (matroid_spanning(m, s) && matroid_independent(m, s))"),
    ),
  )
}

///|
let matroid_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matroid_basis")

///|
/// `matroid_basis`
pub fn matroid_basis() -> @kernel.Thm {
  matroid_basis_c.get()
}

///|
/// matroid_dependent
fn step_27() -> Unit raise {
  matroid_dependent_c.set(
    @define.define_(
      @term_syntax.parse_term("(matroid_dependent : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (SUBSET(s, matroid_set(m)) && !matroid_independent(m, s))"),
    ),
  )
}

///|
let matroid_dependent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_dependent",
)

///|
/// `matroid_dependent`
pub fn matroid_dependent() -> @kernel.Thm {
  matroid_dependent_c.get()
}

///|
/// MATROID_SPANNING_IMP_SUBSET
fn step_28() -> Unit raise {
  let t111 = @simp.simp_tac(@list.List([matroid_spanning()]))
  matroid_spanning_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_spanning(m, s) → SUBSET(s, matroid_set(m))"),
      t111,
    ),
  )
}

///|
let matroid_spanning_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_IMP_SUBSET",
)

///|
/// `MATROID_SPANNING_IMP_SUBSET`
pub fn matroid_spanning_imp_subset() -> @kernel.Thm {
  matroid_spanning_imp_subset_c.get()
}

///|
/// MATROID_INDEPENDENT_IMP_SUBSET
fn step_29() -> Unit raise {
  let t112 = @simp.simp_tac(@list.List([matroid_independent()]))
  matroid_independent_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_independent(m, s) → SUBSET(s, matroid_set(m))"),
      t112,
    ),
  )
}

///|
let matroid_independent_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_IMP_SUBSET",
)

///|
/// `MATROID_INDEPENDENT_IMP_SUBSET`
pub fn matroid_independent_imp_subset() -> @kernel.Thm {
  matroid_independent_imp_subset_c.get()
}

///|
/// MATROID_DEPENDENT_IMP_SUBSET
fn step_30() -> Unit raise {
  let t113 = @simp.simp_tac(@list.List([matroid_dependent()]))
  matroid_dependent_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_dependent(m, s) → SUBSET(s, matroid_set(m))"),
      t113,
    ),
  )
}

///|
let matroid_dependent_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DEPENDENT_IMP_SUBSET",
)

///|
/// `MATROID_DEPENDENT_IMP_SUBSET`
pub fn matroid_dependent_imp_subset() -> @kernel.Thm {
  matroid_dependent_imp_subset_c.get()
}

///|
/// MATROID_BASIS_IMP_SUBSET
fn step_31() -> Unit raise {
  let t114 = @simp.simp_tac(@list.List([matroid_basis(), matroid_spanning()]))
  matroid_basis_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_basis(m, s) → SUBSET(s, matroid_set(m))"),
      t114,
    ),
  )
}

///|
let matroid_basis_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_IMP_SUBSET",
)

///|
/// `MATROID_BASIS_IMP_SUBSET`
pub fn matroid_basis_imp_subset() -> @kernel.Thm {
  matroid_basis_imp_subset_c.get()
}

///|
/// MATROID_SPANNING_ALT
fn step_32() -> Unit raise {
  let t115 = @meson.meson_tac(@list.List([matroid_span_eq_set()]))
  let t116 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_spanning()])),
    t115,
  )
  matroid_spanning_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_spanning(m, s) == (SUBSET(s, matroid_set(m)) && SUBSET(matroid_set(m), matroid_span(m, s)))"),
      t116,
    ),
  )
}

///|
let matroid_spanning_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_ALT",
)

///|
/// `MATROID_SPANNING_ALT`
pub fn matroid_spanning_alt() -> @kernel.Thm {
  matroid_spanning_alt_c.get()
}

///|
/// MATROID_SPANNING_SET
fn step_33() -> Unit raise {
  let t117 = @simp.simp_tac(
    @list.List([matroid_spanning(), @sets.subset_refl(), matroid_span_set()]),
  )
  matroid_spanning_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_spanning(m, matroid_set(m))"),
      t117,
    ),
  )
}

///|
let matroid_spanning_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_SET",
)

///|
/// `MATROID_SPANNING_SET`
pub fn matroid_spanning_set() -> @kernel.Thm {
  matroid_spanning_set_c.get()
}

///|
/// MATROID_INDEPENDENT
fn step_34() -> Unit raise {
  let t118 = @sets.set_tac(@list.List([]))
  let t119 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_dependent(), matroid_independent()])),
    t118,
  )
  matroid_independent_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_independent(m, s) == (SUBSET(s, matroid_set(m)) && !matroid_dependent(m, s))"),
      t119,
    ),
  )
}

///|
let matroid_independent_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT",
)

///|
/// `MATROID_INDEPENDENT`
pub fn matroid_independent_v1() -> @kernel.Thm {
  matroid_independent_v1_c.get()
}

///|
/// MATROID_DEPENDENT
fn step_35() -> Unit raise {
  let t120 = @sets.set_tac(@list.List([]))
  let t121 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_dependent(), matroid_independent()])),
    t120,
  )
  matroid_dependent_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_dependent(m, s) == (SUBSET(s, matroid_set(m)) && (∃ x : A, IN(x, s) && IN(x, matroid_span(m, DELETE(s, x)))))"),
      t121,
    ),
  )
}

///|
let matroid_dependent_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DEPENDENT",
)

///|
/// `MATROID_DEPENDENT`
pub fn matroid_dependent_v1() -> @kernel.Thm {
  matroid_dependent_v1_c.get()
}

///|
/// MATROID_INDEPENDENT_EMPTY
fn step_36() -> Unit raise {
  let t122 = @simp.rewrite_tac(
    @list.List([
      matroid_independent(),
      @sets.not_in_empty(),
      @sets.empty_subset(),
    ]),
  )
  matroid_independent_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_independent(m, {})"),
      t122,
    ),
  )
}

///|
let matroid_independent_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_EMPTY",
)

///|
/// `MATROID_INDEPENDENT_EMPTY`
pub fn matroid_independent_empty() -> @kernel.Thm {
  matroid_independent_empty_c.get()
}

///|
/// MATROID_INDEPENDENT_MONO
fn step_37() -> Unit raise {
  let t136 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t133 = @term_syntax.parse_term("DELETE((t : (A) -> Bool), (x : A))")
  let t134 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (x : A))")
  let t135 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t134, t133]),
      matroid_span_mono(),
    ),
  )
  let t129 = @term_syntax.parse_term("(x : A)")
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
  let t125 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t124 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t123 = @simp.rewrite_tac(@list.List([matroid_independent()]))
  let t137 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t123),
                  @tactics.strip_tac,
                ),
                @tactics.conj_tac,
              ),
              t124,
            ),
            t125,
          ),
          @tactics.disch_tac,
        ),
        t132,
      ),
      t135,
    ),
    t136,
  )
  matroid_independent_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, t) && SUBSET(s, t) → matroid_independent(m, s)"),
      t137,
    ),
  )
}

///|
let matroid_independent_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_MONO",
)

///|
/// `MATROID_INDEPENDENT_MONO`
pub fn matroid_independent_mono() -> @kernel.Thm {
  matroid_independent_mono_c.get()
}

///|
/// MATROID_INDEPENDENT_FINITARY
fn step_38() -> Unit raise {
  let t175 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t174 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t173 = @simp.asm_rewrite_tac(
    @list.List([@sets.in_insert(), @class.contrapos_thm()]),
  )
  let t167 = @term_syntax.parse_term("(x : A)")
  let t171 = @tactics.disch_then(fn(
    x170 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x169 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s165 = @tactics.mp_tac(x164)
        fn(
          x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s165(x166)
        }
      })(((x168 : @kernel.Thm) => @bool.spec(t167, x168))(x169))
    })(@bool.conjunct2(x170))
  })
  let t163 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t172 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([@sets.finite_insert()])),
      t163,
    ),
    t171,
  ])
  let t159 = @term_syntax.parse_term("INSERT((x : A), (t : (A) -> Bool))")
  let t162 = @tactics.first_x_assum(fn(
    x161 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s157 = @tactics.mp_tac(x156)
      fn(
        x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s157(x158)
      }
    })(((x160 : @kernel.Thm) => @bool.spec(t159, x160))(x161))
  })
  let t155 = @tactics.repeat_tac(
    @tactics.disch_then(
      @tactics.conjuncts_then2(
        fn(
          x149 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s150 = @tactics.assume_tac(x149)
          fn(
            x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s150(x151)
          }
        },
        fn(
          x152 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s153 = @tactics.mp_tac(x152)
          fn(
            x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s153(x154)
          }
        },
      ),
    ),
  )
  let t148 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t146 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t147 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t146])
  let t143 = @term_syntax.parse_term("(x : A)")
  let t144 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (x : A))")
  let t145 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t144, t143]),
      matroid_span_finitary(),
    ),
  )
  let t142 = @tactics.repeat_tac(@tactics.strip_tac)
  let t141 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t140 = @simp.asm_rewrite_tac(@list.List([]))
  let t138 = @tactics.then_tac(
    @simp.asm_rewrite_tac(@list.List([matroid_independent()])),
    @tactics.strip_tac,
  )
  let t139 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_independent_mono(), matroid_independent_imp_subset()]),
    ),
    t138,
  ])
  let t176 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.thenl(
                                    @tactics.then_tac(
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      @tactics.eq_tac,
                                    ),
                                    t139,
                                  ),
                                  t140,
                                ),
                                t141,
                              ),
                              t142,
                            ),
                            t145,
                          ),
                          @tactics.ants_tac,
                        ),
                        t147,
                      ),
                      t148,
                    ),
                    t155,
                  ),
                  t162,
                ),
                @tactics.ants_tac,
              ),
              t172,
            ),
            t173,
          ),
          t174,
        ),
        @tactics.ap_term_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t175,
  )
  matroid_independent_finitary_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_independent(m, s) == (SUBSET(s, matroid_set(m)) && (∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) → matroid_independent(m, t)))"),
      t176,
    ),
  )
}

///|
let matroid_independent_finitary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_FINITARY",
)

///|
/// `MATROID_INDEPENDENT_FINITARY`
pub fn matroid_independent_finitary() -> @kernel.Thm {
  matroid_independent_finitary_c.get()
}

///|
/// MATROID_DEPENDENT_FINITARY
fn step_39() -> Unit raise {
  let t186 = @sets.set_tac(@list.List([]))
  let t185 = @simp.gen_rewrite_tac(
    fn(
      x184 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x178 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s179 = @equal.land_conv(x178)
        fn(x180 : @kernel.Term) -> @kernel.Thm raise { s179(x180) }
      })(
        (fn(
          x181 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s182 = @equal.once_depth_conv(x181)
          fn(x183 : @kernel.Term) -> @kernel.Thm raise { s182(x183) }
        })(x184),
      )
    },
    @list.List([matroid_independent_finitary()]),
  )
  let t177 = @simp.rewrite_tac(@list.List([matroid_dependent()]))
  let t187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t177),
      t185,
    ),
    t186,
  )
  matroid_dependent_finitary_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_dependent(m, s) == (SUBSET(s, matroid_set(m)) && (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && matroid_dependent(m, t)))"),
      t187,
    ),
  )
}

///|
let matroid_dependent_finitary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DEPENDENT_FINITARY",
)

///|
/// `MATROID_DEPENDENT_FINITARY`
pub fn matroid_dependent_finitary() -> @kernel.Thm {
  matroid_dependent_finitary_c.get()
}

///|
/// MATROID_INDEPENDENT_INSERT
fn step_40() -> Unit raise {
  let t209 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t208 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("IN((b : _), (s : (_) -> Bool)) → INSERT(b, DELETE(s, b)) == s")),
    ]),
  )
  let t204 = @term_syntax.parse_term("(b : A)")
  let t205 = @term_syntax.parse_term("(a : A)")
  let t206 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (b : A))")
  let t207 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t206, t205, t204]),
      matroid_span_exchange(),
    ),
  )
  let t203 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) && !((b : _) == a) → DELETE(INSERT(a, s), b) == INSERT(a, DELETE(s, b))"),
      ),
    ]),
  )
  let t202 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) → DELETE(INSERT(a, s), a) == s"),
      ),
    ]),
  )
  let t201 = @class.asm_cases_tac(@term_syntax.parse_term("(b : A) == (a : A)"))
  let t199 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t198 = @tactics.match_mp_tac(matroid_span_mono())
  let t200 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.match_mp_tac(
          @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → IN((a : _), s) → IN(a, t)")),
        ),
        t198,
      ),
      t199,
    ),
  ])
  let t197 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : A)"))
  let t196 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("(∀ x : _, (p : (_) -> Bool)(x) → (q : (_) -> Bool)(x) == (r : (_) -> Bool)(x)) → (∀ x : _, p(x) → !q(x)) == (∀ x : _, p(x) → !r(x))"),
    ),
  )
  let t195 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((!(p : Bool) && (q : Bool)) == ((q' : Bool) && !p)) == (!p → q == q')"),
      ),
    ]),
  )
  let t194 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) → DELETE(INSERT(a, s), a) == s"),
      ),
    ]),
  )
  let t193 = @simp.asm_rewrite_tac(@list.List([]))
  let t192 = @class.asm_cases_tac(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
  )
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @class.asm_cases_tac(@term_syntax.parse_term("IN((a : A), matroid_set((m : Matroid[A])))"))
  let t189 = @simp.rewrite_tac(
    @list.List([
      matroid_independent(),
      @sets.insert_subset(),
      @sets.forall_in_insert(),
    ]),
  )
  let t188 = @simp.asm_simp_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) → INSERT(a, s) == s"))]),
  )
  let t210 = @tactics.then_tac(
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
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.repeat_tac(
                                              @tactics.strip_tac,
                                            ),
                                            @class.cond_cases_tac,
                                          ),
                                          t188,
                                        ),
                                        t189,
                                      ),
                                      t190,
                                    ),
                                    t191,
                                  ),
                                  t192,
                                ),
                                t193,
                              ),
                              t194,
                            ),
                            t195,
                          ),
                          @tactics.disch_tac,
                        ),
                        t196,
                      ),
                      t197,
                    ),
                    @tactics.disch_tac,
                  ),
                  @tactics.eq_tac,
                ),
                t200,
              ),
              t201,
            ),
            t202,
          ),
          t203,
        ),
        t207,
      ),
      t208,
    ),
    t209,
  )
  matroid_independent_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ a : A, matroid_independent(m, INSERT(a, s)) == (if IN(a, s) { matroid_independent(m, s) } else { IN(a, matroid_set(m)) && matroid_independent(m, s) && !IN(a, matroid_span(m, s)) })"),
      t210,
    ),
  )
}

///|
let matroid_independent_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_INSERT",
)

///|
/// `MATROID_INDEPENDENT_INSERT`
pub fn matroid_independent_insert() -> @kernel.Thm {
  matroid_independent_insert_c.get()
}

///|
/// MATROID_SPAN_PSUBSET_INDEPENDENT
fn step_41() -> Unit raise {
  let t241 = @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_inc()]))
  let t238 = @term_syntax.parse_term("DELETE((t : (A) -> Bool), (x : A))")
  let t239 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t240 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t239, t238]),
      matroid_span_mono(),
    ),
  )
  let t237 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t236 = @simp.asm_simp_tac(
    @list.List([@sets.psubset_alt(), matroid_span_mono()]),
  )
  let t232 = @simp.gen_rewrite_rule(
    fn(
      x231 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x231
    },
    @list.List([matroid_independent()]),
  )
  let t228 = @term_syntax.parse_term("(x : A)")
  let t233 = @tactics.conjuncts_then2(
    fn(
      x222 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s223 = @tactics.assume_tac(x222)
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
    },
    fn(
      x230 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x225 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s226 = @tactics.mp_tac(x225)
        fn(
          x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s226(x227)
        }
      })(((x229 : @kernel.Thm) => @bool.spec(t228, x229))(x230))
    },
  )
  let t235 = @tactics.first_assum(fn(
    x234 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t233(t232(x234))
  })
  let t221 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x218 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s219 = @tactics.assume_tac(x218)
        fn(
          x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s219(x220)
        }
      },
      @tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(
        @tactics.strip_assume_tac,
      ),
    ),
  )
  let t215 = @simp.gen_rewrite_rule(
    fn(
      x214 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x214
    },
    @list.List([@sets.psubset_alt()]),
  )
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
    })(t215(x216))
  })
  let t242 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t217),
                t221,
              ),
              t235,
            ),
            t236,
          ),
          @tactics.disch_tac,
        ),
        t237,
      ),
      t240,
    ),
    t241,
  )
  matroid_span_psubset_independent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, PSUBSET(s, t) && matroid_independent(m, t) → PSUBSET(matroid_span(m, s), matroid_span(m, t))"),
      t242,
    ),
  )
}

///|
let matroid_span_psubset_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_PSUBSET_INDEPENDENT",
)

///|
/// `MATROID_SPAN_PSUBSET_INDEPENDENT`
pub fn matroid_span_psubset_independent() -> @kernel.Thm {
  matroid_span_psubset_independent_c.get()
}

///|
/// MATROID_SPAN_PSUBSET_EXPLICIT
fn step_42() -> Unit raise {
  let t255 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t252 = @drule.match_mp(matroid_independent_imp_subset())
  let t254 = @tactics.first_assum(fn(
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
      x249 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s250 = @tactics.mp_tac(x249)
      fn(
        x251 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s250(x251)
      }
    })(t252(x253))
  })
  let t246 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t247 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t248 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t247, t246]),
      subset_matroid_span(),
    ),
  )
  let t243 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t244 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t245 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t244, t243]),
      matroid_span_psubset_independent(),
    ),
  )
  let t256 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t245),
        t248,
      ),
      t254,
    ),
    t255,
  )
  matroid_span_psubset_explicit_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, PSUBSET(s, t) && matroid_independent(m, t) → (∃ a : A, IN(a, t) && !IN(a, matroid_span(m, s)))"),
      t256,
    ),
  )
}

///|
let matroid_span_psubset_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_PSUBSET_EXPLICIT",
)

///|
/// `MATROID_SPAN_PSUBSET_EXPLICIT`
pub fn matroid_span_psubset_explicit() -> @kernel.Thm {
  matroid_span_psubset_explicit_c.get()
}

///|
/// MATROID_SPANNING_SUBSET_INDEPENDENT
fn step_43() -> Unit raise {
  let t280 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t277 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (a : A))")
  let t278 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t279 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t278, t277]),
      matroid_span_mono(),
    ),
  )
  let t273 = @term_syntax.parse_term("(a : A)")
  let t276 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x267 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s268 = @tactics.assume_tac(x267)
        fn(
          x269 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s268(x269)
        }
      },
      fn(
        x275 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x270 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s271 = @tactics.mp_tac(x270)
          fn(
            x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s271(x272)
          }
        })(((x274 : @kernel.Thm) => @bool.spec(t273, x274))(x275))
      },
    ),
  )
  let t264 = @simp.gen_rewrite_rule(
    fn(
      x263 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x263
    },
    @list.List([matroid_independent()]),
  )
  let t266 = @tactics.first_x_assum(fn(
    x265 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x260 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s261 = @tactics.mp_tac(x260)
      fn(
        x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s261(x262)
      }
    })(t264(x265))
  })
  let t259 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t258 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t257 = @tactics.repeat_tac(@tactics.strip_tac)
  let t281 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.simp_tac(
                    @list.List([@equal.gsym(@sets.subset_antisym_eq())]),
                  ),
                  t257,
                ),
                t258,
              ),
              t259,
            ),
            @tactics.disch_tac,
          ),
          t266,
        ),
        t276,
      ),
      t279,
    ),
    t280,
  )
  matroid_spanning_subset_independent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(t, s) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → s == t"),
      t281,
    ),
  )
}

///|
let matroid_spanning_subset_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_SUBSET_INDEPENDENT",
)

///|
/// `MATROID_SPANNING_SUBSET_INDEPENDENT`
pub fn matroid_spanning_subset_independent() -> @kernel.Thm {
  matroid_spanning_subset_independent_c.get()
}

///|
/// MATROID_SPANNING_PSUBSET_INDEPENDENT
fn step_44() -> Unit raise {
  let t287 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_subset(),
      matroid_spanning(),
      matroid_independent(),
    ]),
  )
  let t286 = @tactics.match_mp_tac(
    @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !PSUBSET(t, s)")),
  )
  let t285 = @simp.asm_rewrite_tac(@list.List([]))
  let t282 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t283 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t284 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t283, t282]),
      matroid_span_psubset_independent(),
    ),
  )
  let t288 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t284),
        t285,
      ),
      t286,
    ),
    t287,
  )
  matroid_spanning_psubset_independent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, !(PSUBSET(s, t) && matroid_spanning(m, s) && matroid_independent(m, t))"),
      t288,
    ),
  )
}

///|
let matroid_spanning_psubset_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_PSUBSET_INDEPENDENT",
)

///|
/// `MATROID_SPANNING_PSUBSET_INDEPENDENT`
pub fn matroid_spanning_psubset_independent() -> @kernel.Thm {
  matroid_spanning_psubset_independent_c.get()
}

///|
/// MATROID_MAXIMAL_INDEPENDENT_SUBSET_SPAN
fn step_45() -> Unit raise {
  let t309 = @meson.asm_meson_tac(
    @list.List([@sets.subset(), @sets.insert_subset(), matroid_span_superset()]),
  )
  let t308 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("PSUBSET((s : (_) -> Bool), INSERT((x : _), s)) == !IN(x, s)")),
    ]),
  )
  let t307 = @simp.asm_rewrite_tac(@list.List([matroid_independent_insert()]))
  let t303 = @term_syntax.parse_term("INSERT((x : A), (s : (A) -> Bool))")
  let t306 = @tactics.first_x_assum(fn(
    x305 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x300 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s301 = @tactics.mp_tac(x300)
      fn(
        x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s301(x302)
      }
    })(((x304 : @kernel.Thm) => @bool.spec(t303, x304))(x305))
  })
  let t299 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t298 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t297 = @simp.asm_simp_tac(@list.List([subset_matroid_span()]))
  let t296 = @simp.asm_simp_tac(@list.List([matroid_span_mono()]))
  let t295 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t292 = @drule.match_mp(matroid_independent_imp_subset())
  let t294 = @tactics.first_assum(fn(
    x293 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x289 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s290 = @tactics.assume_tac(x289)
      fn(
        x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s290(x291)
      }
    })(t292(x293))
  })
  let t310 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t294,
                        ),
                        t295,
                      ),
                      t296,
                    ),
                    t297,
                  ),
                  t298,
                ),
                t299,
              ),
              @tactics.disch_tac,
            ),
            t306,
          ),
          t307,
        ),
        @class.cond_cases_tac,
      ),
      t308,
    ),
    t309,
  )
  matroid_maximal_independent_subset_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && SUBSET(t, matroid_set(m)) && matroid_independent(m, s) && (∀ s' : (A) -> Bool, PSUBSET(s, s') && SUBSET(s', t) → !matroid_independent(m, s')) → matroid_span(m, s) == matroid_span(m, t)"),
      t310,
    ),
  )
}

///|
let matroid_maximal_independent_subset_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_MAXIMAL_INDEPENDENT_SUBSET_SPAN",
)

///|
/// `MATROID_MAXIMAL_INDEPENDENT_SUBSET_SPAN`
pub fn matroid_maximal_independent_subset_span() -> @kernel.Thm {
  matroid_maximal_independent_subset_span_c.get()
}

///|
/// MATROID_BASIS_EQ_MAXIMAL_INDEPENDENT
fn step_46() -> Unit raise {
  let t322 = @simp.asm_simp_tac(@list.List([@sets.subset_refl()]))
  let t321 = @tactics.match_mp_tac(matroid_maximal_independent_subset_span())
  let t320 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(matroid_span_set())]),
  )
  let t319 = @simp.asm_rewrite_tac(@list.List([matroid_spanning()]))
  let t316 = @drule.match_mp(matroid_independent_imp_subset())
  let t318 = @tactics.first_assum(fn(
    x317 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x313 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s314 = @tactics.assume_tac(x313)
      fn(
        x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s314(x315)
      }
    })(t316(x317))
  })
  let t311 = @tactics.then_tac(
    @tactics.strip_tac,
    @simp.asm_rewrite_tac(@list.List([matroid_basis()])),
  )
  let t312 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_spanning_psubset_independent(), matroid_basis()]),
    ),
    t311,
  ])
  let t323 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              t312,
            ),
            t318,
          ),
          t319,
        ),
        t320,
      ),
      t321,
    ),
    t322,
  )
  matroid_basis_eq_maximal_independent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_basis(m, s) == (matroid_independent(m, s) && (∀ s' : (A) -> Bool, PSUBSET(s, s') → !matroid_independent(m, s')))"),
      t323,
    ),
  )
}

///|
let matroid_basis_eq_maximal_independent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_EQ_MAXIMAL_INDEPENDENT",
)

///|
/// `MATROID_BASIS_EQ_MAXIMAL_INDEPENDENT`
pub fn matroid_basis_eq_maximal_independent() -> @kernel.Thm {
  matroid_basis_eq_maximal_independent_c.get()
}

///|
/// MATROID_BASIS_EQ_MINIMAL_SPANNING
fn step_47() -> Unit raise {
  let t344 = @meson.asm_meson_tac(
    @list.List([matroid_span_delete_eq(), matroid_spanning()]),
  )
  let t343 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.asm_tac(@sets.set_tac)(@list.List([])),
        @tactics.all_tac,
      ]),
    ),
  )
  let t342 = @simp.rewrite_tac(
    @list.List([matroid_spanning(), @class.not_imp()]),
  )
  let t338 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (x : A))")
  let t341 = @tactics.first_x_assum(fn(
    x340 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x335 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s336 = @tactics.mp_tac(x335)
      fn(
        x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s336(x337)
      }
    })(((x339 : @kernel.Thm) => @bool.spec(t338, x339))(x340))
  })
  let t334 = @tactics.repeat_tac(@tactics.strip_tac)
  let t333 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t332 = @simp.asm_rewrite_tac(@list.List([matroid_independent()]))
  let t329 = @drule.match_mp(matroid_spanning_imp_subset())
  let t331 = @tactics.first_assum(fn(
    x330 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x326 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s327 = @tactics.assume_tac(x326)
      fn(
        x328 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s327(x328)
      }
    })(t329(x330))
  })
  let t324 = @tactics.then_tac(
    @tactics.strip_tac,
    @simp.asm_rewrite_tac(@list.List([matroid_basis()])),
  )
  let t325 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_spanning_psubset_independent(), matroid_basis()]),
    ),
    t324,
  ])
  let t345 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      @tactics.eq_tac,
                    ),
                    t325,
                  ),
                  t331,
                ),
                t332,
              ),
              t333,
            ),
            t334,
          ),
          t341,
        ),
        t342,
      ),
      t343,
    ),
    t344,
  )
  matroid_basis_eq_minimal_spanning_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_basis(m, s) == (matroid_spanning(m, s) && (∀ s' : (A) -> Bool, PSUBSET(s', s) → !matroid_spanning(m, s')))"),
      t345,
    ),
  )
}

///|
let matroid_basis_eq_minimal_spanning_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_EQ_MINIMAL_SPANNING",
)

///|
/// `MATROID_BASIS_EQ_MINIMAL_SPANNING`
pub fn matroid_basis_eq_minimal_spanning() -> @kernel.Thm {
  matroid_basis_eq_minimal_spanning_c.get()
}

///|
/// MATROID_INDEPENDENT_CHAIN
fn step_48() -> Unit raise {
  let t354 = @meson.asm_meson_tac(@list.List([matroid_independent_mono()]))
  let t352 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t353 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(c : ((A) -> Bool) -> Bool)"), t352]),
      @sets.finite_subset_unions_chain(),
    ),
  )
  let t350 = @tactics.then_tac(
    @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)")),
    @tactics.strip_tac,
  )
  let t349 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t351 = @list.List([
    @tactics.then_tac(
      @tactics.rule_assum_tac(
        @simp.rewrite_rule(@list.List([matroid_independent()])),
      ),
      t349,
    ),
    t350,
  ])
  let t348 = @simp.once_rewrite_tac(
    @list.List([matroid_independent_finitary()]),
  )
  let t347 = @simp.asm_rewrite_tac(
    @list.List([@sets.unions_0(), matroid_independent_empty()]),
  )
  let t346 = @class.asm_cases_tac(@term_syntax.parse_term("(c : ((A) -> Bool) -> Bool) == {}"))
  let t355 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t346),
              t347,
            ),
            t348,
          ),
          @tactics.conj_tac,
        ),
        t351,
      ),
      t353,
    ),
    t354,
  )
  matroid_independent_chain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ c : ((A) -> Bool) -> Bool, (∀ s : (A) -> Bool, IN(s, c) → matroid_independent(m, s)) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, IN(s, c) && IN(t, c) → SUBSET(s, t) || SUBSET(t, s)) → matroid_independent(m, UNIONS(c))"),
      t355,
    ),
  )
}

///|
let matroid_independent_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_CHAIN",
)

///|
/// `MATROID_INDEPENDENT_CHAIN`
pub fn matroid_independent_chain() -> @kernel.Thm {
  matroid_independent_chain_c.get()
}

///|
/// MATROID_SPAN_CHAIN
fn step_49() -> Unit raise {
  let t373 = @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_mono()]))
  let t371 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t372 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(c : ((A) -> Bool) -> Bool)"), t371]),
      @sets.finite_subset_unions_chain(),
    ),
  )
  let t370 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t369 = @simp.asm_rewrite_tac(@list.List([@sets.unions_subset()]))
  let t366 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      matroid_span_finitary(),
    ),
  )
  let t368 = @tactics.first_x_assum(fn(
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
    (fn(
      x363 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s364 = @tactics.mp_tac(x363)
      fn(
        x365 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s364(x365)
      }
    })(t366(x367))
  })
  let t360 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t359 = @tactics.match_mp_tac(matroid_span_mono())
  let t358 = @tactics.repeat_tac(@tactics.strip_tac)
  let t361 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@sets.unions_subset(), @sets.forall_in_gspec()]),
        ),
        t358,
      ),
      t359,
    ),
    t360,
  )
  let t357 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t362 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t357),
      @tactics.disch_tac,
    ),
    t361,
  ])
  let t356 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t374 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t356),
                @tactics.conj_tac,
              ),
              t362,
            ),
            t368,
          ),
          t369,
        ),
        t370,
      ),
      t372,
    ),
    t373,
  )
  matroid_span_chain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ c : ((A) -> Bool) -> Bool, !(c == {}) && (∀ s : (A) -> Bool, IN(s, c) → SUBSET(s, matroid_set(m))) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, IN(s, c) && IN(t, c) → SUBSET(s, t) || SUBSET(t, s)) → matroid_span(m, UNIONS(c)) == UNIONS({matroid_span(m, (s : (A) -> Bool)) | IN(s, c)})"),
      t374,
    ),
  )
}

///|
let matroid_span_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_CHAIN",
)

///|
/// `MATROID_SPAN_CHAIN`
pub fn matroid_span_chain() -> @kernel.Thm {
  matroid_span_chain_c.get()
}

///|
/// MATROID_INTERMEDIATE_SPAN
fn step_50() -> Unit raise {
  let t407 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t408 = @list.List([
    @meson.asm_meson_tac(@list.List([matroid_span_inc()])),
    t407,
  ])
  let t406 = @simp.asm_rewrite_tac(@list.List([]))
  let t405 = @simp.asm_rewrite_tac(@list.List([matroid_independent_insert()]))
  let t401 = @term_syntax.parse_term("INSERT((x : A), (b : (A) -> Bool))")
  let t404 = @tactics.first_x_assum(fn(
    x403 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x398 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s399 = @tactics.mp_tac(x398)
      fn(
        x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s399(x400)
      }
    })(((x402 : @kernel.Thm) => @bool.spec(t401, x402))(x403))
  })
  let t397 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t409 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@sets.subset()])),
                t397,
              ),
              @tactics.disch_tac,
            ),
            t404,
          ),
          t405,
        ),
        @class.cond_cases_tac,
      ),
      t406,
    ),
    t408,
  )
  let t396 = @simp.asm_simp_tac(@list.List([matroid_span_superset()]))
  let t395 = @simp.asm_rewrite_tac(@list.List([@sets.union_subset()]))
  let t394 = @term_syntax.parse_term("UNION((s : (A) -> Bool), (t : (A) -> Bool))")
  let t410 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.trans_tac(@sets.subset_trans())(t394), t395),
      t396,
    ),
    t409,
  ])
  let t393 = @tactics.thenl(
    @tactics.conj_tac,
    @list.List([
      @tactics.asm_tac(@sets.set_tac)(@list.List([])),
      @tactics.all_tac,
    ]),
  )
  let t392 = @tactics.match_mp_tac(matroid_span_minimal())
  let t391 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t388 = @drule.match_mp(matroid_independent_imp_subset())
  let t390 = @tactics.first_assum(fn(
    x389 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x385 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s386 = @tactics.assume_tac(x385)
      fn(
        x387 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s386(x387)
      }
    })(t388(x389))
  })
  let t384 = @simp.asm_rewrite_tac(@list.List([]))
  let t381 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (A) -> Bool)"))
  let t382 = @tactics.then_tac(
    @tactics.match_mp_tac(@theorems.mono_exists()),
    t381,
  )
  let t380 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t379 = @simp.asm_simp_tac(
    @list.List([matroid_independent_chain(), @sets.union_subset()]),
  )
  let t378 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : ((A) -> Bool) -> Bool)"))
  let t377 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t383 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.conj_tac,
              @list.List([
                @tactics.then_tac(
                  @tactics.exists_tac(@term_syntax.parse_term("(s : (A) -> Bool)")),
                  t377,
                ),
                @tactics.all_tac,
              ]),
            ),
            t378,
          ),
          @tactics.strip_tac,
        ),
        t379,
      ),
      t380,
    ),
    t382,
  ])
  let t376 = @simp.asm_rewrite_tac(@list.List([]))
  let t375 = @tactics.mp_tac(
    @bool.ispec(
      @term_syntax.parse_term("(u : (A) -> Bool) => SUBSET((s : (A) -> Bool), u) && SUBSET(u, UNION(s, (t : (A) -> Bool))) && matroid_independent((m : Matroid[A]), u)"),
      @wo.zl_subsets_unions_nonempty(),
    ),
  )
  let t411 = @tactics.thenl(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t375,
                        ),
                        t376,
                      ),
                      @tactics.ants_tac,
                    ),
                    t383,
                  ),
                  @tactics.strip_tac,
                ),
                t384,
              ),
              t390,
            ),
            t391,
          ),
          @tactics.conj_tac,
        ),
        t392,
      ),
      t393,
    ),
    t410,
  )
  matroid_intermediate_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && SUBSET(t, matroid_set(m)) && SUBSET(s, matroid_span(m, t)) → (∃ b : (A) -> Bool, SUBSET(s, b) && SUBSET(b, UNION(s, t)) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, t))"),
      t411,
    ),
  )
}

///|
let matroid_intermediate_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INTERMEDIATE_SPAN",
)

///|
/// `MATROID_INTERMEDIATE_SPAN`
pub fn matroid_intermediate_span() -> @kernel.Thm {
  matroid_intermediate_span_c.get()
}

///|
/// MATROID_INTERMEDIATE_BASIS
fn step_51() -> Unit raise {
  let t416 = @meson.asm_meson_tac(@list.List([matroid_independent()]))
  let t413 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t414 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t415 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t414, t413]),
      matroid_intermediate_span(),
    ),
  )
  let t412 = @tactics.repeat_tac(@tactics.strip_tac)
  let t417 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([matroid_spanning(), matroid_basis()])),
        t412,
      ),
      t415,
    ),
    t416,
  )
  matroid_intermediate_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && matroid_spanning(m, t) → (∃ b : (A) -> Bool, SUBSET(s, b) && SUBSET(b, UNION(s, t)) && matroid_basis(m, b))"),
      t417,
    ),
  )
}

///|
let matroid_intermediate_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INTERMEDIATE_BASIS",
)

///|
/// `MATROID_INTERMEDIATE_BASIS`
pub fn matroid_intermediate_basis() -> @kernel.Thm {
  matroid_intermediate_basis_c.get()
}

///|
/// MATROID_INDEPENDENT_EXTENDS_TO_BASIS
fn step_52() -> Unit raise {
  let t422 = @meson.meson_tac(@list.List([]))
  let t421 = @simp.asm_rewrite_tac(@list.List([matroid_spanning_set()]))
  let t418 = @term_syntax.parse_term("matroid_set((m : Matroid[A]))")
  let t419 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t420 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t419, t418]),
      matroid_intermediate_basis(),
    ),
  )
  let t423 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t420),
      t421,
    ),
    t422,
  )
  matroid_independent_extends_to_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_independent(m, s) → (∃ b : (A) -> Bool, SUBSET(s, b) && matroid_basis(m, b))"),
      t423,
    ),
  )
}

///|
let matroid_independent_extends_to_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_EXTENDS_TO_BASIS",
)

///|
/// `MATROID_INDEPENDENT_EXTENDS_TO_BASIS`
pub fn matroid_independent_extends_to_basis() -> @kernel.Thm {
  matroid_independent_extends_to_basis_c.get()
}

///|
/// MATROID_BASIS_EXISTS
fn step_53() -> Unit raise {
  let t424 = @meson.meson_tac(
    @list.List([
      matroid_independent_extends_to_basis(),
      matroid_independent_empty(),
    ]),
  )
  matroid_basis_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∃ b : (A) -> Bool, matroid_basis(m, b)"),
      t424,
    ),
  )
}

///|
let matroid_basis_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_EXISTS",
)

///|
/// `MATROID_BASIS_EXISTS`
pub fn matroid_basis_exists() -> @kernel.Thm {
  matroid_basis_exists_c.get()
}

///|
/// MATROID_SPANNING_CONTAINS_BASIS
fn step_54() -> Unit raise {
  let t429 = @meson.meson_tac(@list.List([]))
  let t428 = @simp.asm_rewrite_tac(
    @list.List([matroid_independent_empty(), @sets.union_empty()]),
  )
  let t425 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t426 = @term_syntax.parse_term("({} : (A) -> Bool)")
  let t427 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t426, t425]),
      matroid_intermediate_basis(),
    ),
  )
  let t430 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t427),
      t428,
    ),
    t429,
  )
  matroid_spanning_contains_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_spanning(m, s) → (∃ b : (A) -> Bool, SUBSET(b, s) && matroid_basis(m, b))"),
      t430,
    ),
  )
}

///|
let matroid_spanning_contains_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_CONTAINS_BASIS",
)

///|
/// `MATROID_SPANNING_CONTAINS_BASIS`
pub fn matroid_spanning_contains_basis() -> @kernel.Thm {
  matroid_spanning_contains_basis_c.get()
}

///|
/// MATROID_SPAN_DEPENDENCE
fn step_55() -> Unit raise {
  let t444 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t443 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t442 = @simp.asm_rewrite_tac(
    @list.List([
      matroid_independent_empty(),
      @sets.empty_subset(),
      @sets.union_empty(),
    ]),
  )
  let t439 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t440 = @term_syntax.parse_term("({} : (A) -> Bool)")
  let t441 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t440, t439]),
      matroid_intermediate_span(),
    ),
  )
  let t438 = @simp.asm_rewrite_tac(@list.List([]))
  let t437 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t436 = @list.List([
    @tactics.disch_tac,
    @meson.asm_meson_tac(
      @list.List([matroid_span_mono(), matroid_span_inc(), @sets.subset()]),
    ),
  ])
  let t435 = @simp.rewrite_tac(
    @list.List([@class.not_imp(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t434 = @simp.simp_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!(if (p : Bool) { true } else { !(x : Bool) }) == (!p && x)"),
      ),
    ]),
  )
  let t433 = @simp.once_rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == !(q → !(p && r))")),
    ]),
  )
  let t432 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset()]))
  let t431 = @simp.rewrite_tac(
    @list.List([matroid_independent_insert(), matroid_dependent()]),
  )
  let t445 = @tactics.then_tac(
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
                            @tactics.repeat_tac(@tactics.strip_tac),
                            t431,
                          ),
                          t432,
                        ),
                        t433,
                      ),
                      t434,
                    ),
                    t435,
                  ),
                  @tactics.eq_tac,
                ),
                t436,
              ),
              t437,
            ),
            t438,
          ),
          t441,
        ),
        t442,
      ),
      t443,
    ),
    t444,
  )
  matroid_span_dependence_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, IN(x, matroid_set(m)) && SUBSET(s, matroid_set(m)) → IN(x, matroid_span(m, s)) == (IN(x, s) || (∃ t : (A) -> Bool, SUBSET(t, s) && matroid_independent(m, t) && matroid_dependent(m, INSERT(x, t))))"),
      t445,
    ),
  )
}

///|
let matroid_span_dependence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_DEPENDENCE",
)

///|
/// `MATROID_SPAN_DEPENDENCE`
pub fn matroid_span_dependence() -> @kernel.Thm {
  matroid_span_dependence_c.get()
}

///|
/// MATROID_STEINITZ_EXCHANGE
fn step_56() -> Unit raise {
  let t525 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t524 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t523 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_subset()])),
        @tactics.all_tac,
      ]),
    ),
  )
  let t522 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("IN((y : _), (v : (_) -> Bool)) → INSERT(y, DELETE(v, y)) == v")),
    ]),
  )
  let t521 = @tactics.match_mp_tac(matroid_span_exchange())
  let t518 = @tactics.asm_tac(@sets.set_tac)(
    @list.List([matroid_span_subset()]),
  )
  let t519 = @tactics.then_tac(@tactics.match_mp_tac(matroid_span_mono()), t518)
  let t520 = @list.List([
    @simp.rewrite_tac(@list.List([@sets.sing_subset()])),
    t519,
  ])
  let t516 = @term_syntax.parse_term("matroid_span((m : Matroid[A]), INSERT((x : A), DELETE((v : (A) -> Bool), (y : A))))")
  let t517 = @tactics.trans_tac(@sets.subset_trans())(t516)
  let t514 = @tactics.asm_tac(@sets.set_tac)(
    @list.List([matroid_span_subset()]),
  )
  let t515 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@tactics.match_mp_tac(matroid_span_superset()), t514),
  ])
  let t512 = @simp.once_rewrite_tac(@list.List([@sets.union_subset()]))
  let t513 = @list.List([@sets.set_tac(@list.List([])), t512])
  let t510 = @term_syntax.parse_term("UNION({(y : A)}, UNION(DIFF((t : (A) -> Bool), INSERT(y, (u : (A) -> Bool))), INSERT((x : A), (s : (A) -> Bool))))")
  let t511 = @tactics.trans_tac(@sets.subset_trans())(t510)
  let t509 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_subset()])),
    @tactics.all_tac,
  ])
  let t508 = @tactics.match_mp_tac(matroid_span_minimal())
  let t507 = @list.List([
    @simp.asm_simp_tac(@list.List([matroid_span_superset()])),
    @tactics.all_tac,
  ])
  let t505 = @term_syntax.parse_term("matroid_span((m : Matroid[A]), UNION(DIFF((t : (A) -> Bool), (u : (A) -> Bool)), (s : (A) -> Bool)))")
  let t506 = @tactics.trans_tac(@sets.subset_trans())(t505)
  let t504 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_subset()])),
    @tactics.all_tac,
  ])
  let t503 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_superset()])),
    @tactics.all_tac,
  ])
  let t502 = @tactics.match_mp_tac(matroid_span_minimal())
  let t501 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t500 = @simp.asm_simp_tac(
    @list.List([
      @sets.insert_subset(),
      @sets.has_size(),
      @sets.card_clauses(),
      @sets.finite_insert(),
    ]),
  )
  let t499 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == CARD((s : (A) -> Bool))"))
  let t496 = @simp.gen_rewrite_rule(
    fn(
      x495 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x495
    },
    @list.List([@sets.has_size()]),
  )
  let t498 = @tactics.first_x_assum(fn(
    x497 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(t496(x497))
  })
  let t494 = @tactics.exists_tac(@term_syntax.parse_term("INSERT((y : A), (u : (A) -> Bool))"))
  let t493 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t491 = @simp.rewrite_tac(
    @list.List([@sets.in_diff(), @theorems.left_imp_exists_thm()]),
  )
  let t490 = @meson.asm_meson_tac(
    @list.List([matroid_span_mono(), @sets.subset()]),
  )
  let t489 = @simp.asm_simp_tac(
    @list.List([
      @sets.set_rule(
        @term_syntax.parse_term("!IN((x : _), (s : (_) -> Bool)) → DELETE(INSERT(x, s), x) == s"),
      ),
    ]),
  )
  let t488 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_insert(), @sets.insert_subset()]),
  )
  let t486 = @simp.gen_rewrite_rule(
    fn(
      x485 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x485
    },
    @list.List([matroid_independent()]),
  )
  let t492 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.first_x_assum(fn(
            x487 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x482 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s483 = @tactics.mp_tac(x482)
              fn(
                x484 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s483(x484)
              }
            })(t486(x487))
          }),
          t488,
        ),
        t489,
      ),
      t490,
    ),
    t491,
  ])
  let t478 = @drule.match_mp(
    @sets.set_rule(
      @term_syntax.parse_term("SUBSET((v : (_) -> Bool), UNION((t : (_) -> Bool), (s : (_) -> Bool))) → SUBSET(v, s) || (∃ a : _, IN(a, v) && IN(a, t))"),
    ),
  )
  let t479 = @tactics.disj_cases_then(fn(
    x475 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s476 = @tactics.mp_tac(x475)
    fn(
      x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s476(x477)
    }
  })
  let t481 = @tactics.first_assum(fn(
    x480 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t479(t478(x480))
  })
  let t474 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (A) -> Bool)"))
  let t472 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t473 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_subset()])),
    t472,
  ])
  let t471 = @simp.asm_rewrite_tac(@list.List([]))
  let t468 = @term_syntax.parse_term("(x : A)")
  let t469 = @term_syntax.parse_term("UNION(DIFF((t : (A) -> Bool), (u : (A) -> Bool)), (s : (A) -> Bool))")
  let t470 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t469, t468]),
      matroid_span_finitary_minimal(),
    ),
  )
  let t466 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t467 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        matroid_independent_mono(),
        @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), INSERT((x : _), s))")),
      ]),
    ),
    t466,
  ])
  let t465 = @tactics.first_x_assum(fn(
    x464 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x457 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s458 = @tactics.mp_tac(x457)
      fn(
        x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s458(x459)
      }
    })(
      ((x463 : @kernel.Thm) => {
        @lib.check(
          fn(x462 : @kernel.Thm) -> Bool raise {
            (fn(x460 : @kernel.Term) -> Bool raise { @basics.is_imp(x460) })(
              (fn(x461 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x461)
              })(x462),
            )
          },
          x463,
        )
      })(x464),
    )
  })
  let t456 = @simp.rewrite_tac(@list.List([@sets.insert_subset()]))
  let t453 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t452 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t454 = @tactics.then_tac(
    @tactics.map_every(
      @tactics.x_gen_tac,
      @list.List([@term_syntax.parse_term("(x : A)"), t452]),
    ),
    t453,
  )
  let t451 = @sets.set_tac(@list.List([]))
  let t450 = @simp.rewrite_tac(
    @list.List([@sets.has_size(), @sets.finite_empty(), @sets.empty_subset()]),
  )
  let t449 = @tactics.exists_tac(@term_syntax.parse_term("({} : (A) -> Bool)"))
  let t455 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t449),
          t450,
        ),
        @tactics.ap_term_tac,
      ),
      t451,
    ),
    t454,
  ])
  let t448 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t447 = @simp.rewrite_tac(
    @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
  )
  let t526 = @tactics.then_tac(
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
                                                                                          @tactics.thenl(
                                                                                            @tactics.then_tac(
                                                                                              @tactics.then_tac(
                                                                                                @tactics.then_tac(
                                                                                                  @tactics.then_tac(
                                                                                                    @tactics.then_tac(
                                                                                                      @tactics.then_tac(
                                                                                                        @tactics.gen_tac,
                                                                                                        @simp.gen_rewrite_tac(
                                                                                                          fn(
                                                                                                            x446 : (
                                                                                                              @kernel.Term,
                                                                                                            ) -> @kernel.Thm raise,
                                                                                                          ) -> ((
                                                                                                            @kernel.Term,
                                                                                                          ) -> @kernel.Thm raise) raise {
                                                                                                            x446
                                                                                                          },
                                                                                                          @list.List([
                                                                                                              @theorems.swap_forall_thm(),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      @tactics.gen_tac,
                                                                                                    ),
                                                                                                    t447,
                                                                                                  ),
                                                                                                  @tactics.disch_tac,
                                                                                                ),
                                                                                                t448,
                                                                                              ),
                                                                                              @tactics.conj_tac,
                                                                                            ),
                                                                                            t455,
                                                                                          ),
                                                                                          t456,
                                                                                        ),
                                                                                        @tactics.strip_tac,
                                                                                      ),
                                                                                      t465,
                                                                                    ),
                                                                                    @tactics.ants_tac,
                                                                                  ),
                                                                                  t467,
                                                                                ),
                                                                                t470,
                                                                              ),
                                                                              t471,
                                                                            ),
                                                                            @tactics.ants_tac,
                                                                          ),
                                                                          t473,
                                                                        ),
                                                                        t474,
                                                                      ),
                                                                      @tactics.strip_tac,
                                                                    ),
                                                                    t481,
                                                                  ),
                                                                  t492,
                                                                ),
                                                                t493,
                                                              ),
                                                              @tactics.strip_tac,
                                                            ),
                                                            t494,
                                                          ),
                                                          t498,
                                                        ),
                                                        t499,
                                                      ),
                                                      t500,
                                                    ),
                                                    t501,
                                                  ),
                                                  @tactics.conj_tac,
                                                ),
                                                t502,
                                              ),
                                              t503,
                                            ),
                                            @tactics.conj_tac,
                                          ),
                                          t504,
                                        ),
                                        t506,
                                      ),
                                      @tactics.conj_tac,
                                    ),
                                    t507,
                                  ),
                                  t508,
                                ),
                                @tactics.conj_tac,
                              ),
                              t509,
                            ),
                            t511,
                          ),
                          @tactics.conj_tac,
                        ),
                        t513,
                      ),
                      @tactics.conj_tac,
                    ),
                    t515,
                  ),
                  t517,
                ),
                @tactics.conj_tac,
              ),
              t520,
            ),
            t521,
          ),
          t522,
        ),
        t523,
      ),
      t524,
    ),
    t525,
  )
  matroid_steinitz_exchange_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(t, matroid_set(m)) && FINITE(s) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → (∃ t' : (A) -> Bool, SUBSET(t', t) && HAS_SIZE(t', CARD(s)) && matroid_span(m, UNION(DIFF(t, t'), s)) == matroid_span(m, t))"),
      t526,
    ),
  )
}

///|
let matroid_steinitz_exchange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_STEINITZ_EXCHANGE",
)

///|
/// `MATROID_STEINITZ_EXCHANGE`
pub fn matroid_steinitz_exchange() -> @kernel.Thm {
  matroid_steinitz_exchange_c.get()
}

///|
/// MATROID_INDEPENDENT_CARD_LE_SPAN_FINITE
fn step_57() -> Unit raise {
  let t540 = @meson.asm_meson_tac(
    @list.List([
      @sets.finite_subset(),
      @sets.card_subset(),
      @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → !(n + 1 == m)")),
    ]),
  )
  let t541 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t542 = @list.List([
    @meson.asm_meson_tac(@list.List([matroid_independent_mono()])),
    t541,
    t540,
  ])
  let t539 = @tactics.repeat_tac(@tactics.conj_tac)
  let t538 = @simp.asm_rewrite_tac(
    @list.List([@class.not_imp(), @sets.has_size()]),
  )
  let t535 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t536 = @term_syntax.parse_term("(u : (A) -> Bool)")
  let t537 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t536, t535]),
      matroid_steinitz_exchange(),
    ),
  )
  let t532 = @drule.match_mp(@sets.choose_subset_strong())
  let t529 = @simp.rewrite_rule(@list.List([@sets.has_size()]))
  let t530 = @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t534 = @tactics.first_assum(fn(
    x533 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x531 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      t530(t529(x531))
    })(t532(x533))
  })
  let t528 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((a : Num) <= (b : Num)) == (b + 1 <= a)"))]),
  )
  let t527 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == !(p → !q)"))]),
  )
  let t543 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.gen_tac),
                    @tactics.strip_tac,
                  ),
                  t527,
                ),
                t528,
              ),
              @tactics.disch_tac,
            ),
            t534,
          ),
          t537,
        ),
        t538,
      ),
      t539,
    ),
    t542,
  )
  matroid_independent_card_le_span_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, matroid_set(m)) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → FINITE(s) && CARD(s) <= CARD(t)"),
      t543,
    ),
  )
}

///|
let matroid_independent_card_le_span_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_CARD_LE_SPAN_FINITE",
)

///|
/// `MATROID_INDEPENDENT_CARD_LE_SPAN_FINITE`
pub fn matroid_independent_card_le_span_finite() -> @kernel.Thm {
  matroid_independent_card_le_span_finite_c.get()
}

///|
/// MATROID_EQ_SPANS_FINITE
fn step_58() -> Unit raise {
  let t544 = @meson.meson_tac(
    @list.List([
      subset_matroid_span(),
      @sets.subset_refl(),
      matroid_independent(),
      matroid_independent_card_le_span_finite(),
    ]),
  )
  matroid_eq_spans_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && matroid_independent(m, t) && matroid_span(m, s) == matroid_span(m, t) → FINITE(s) == FINITE(t)"),
      t544,
    ),
  )
}

///|
let matroid_eq_spans_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_EQ_SPANS_FINITE",
)

///|
/// `MATROID_EQ_SPANS_FINITE`
pub fn matroid_eq_spans_finite() -> @kernel.Thm {
  matroid_eq_spans_finite_c.get()
}

///|
/// MATROID_EQ_SPANS_SIZE
fn step_59() -> Unit raise {
  let t545 = @meson.meson_tac(
    @list.List([
      subset_matroid_span(),
      @sets.subset_refl(),
      matroid_independent(),
      matroid_independent_card_le_span_finite(),
      @arith.le_antisym(),
    ]),
  )
  let t546 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@sets.has_size()])),
    t545,
  )
  matroid_eq_spans_size_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ n : Num, matroid_independent(m, s) && matroid_independent(m, t) && matroid_span(m, s) == matroid_span(m, t) → HAS_SIZE(s, n) == HAS_SIZE(t, n)"),
      t546,
    ),
  )
}

///|
let matroid_eq_spans_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_EQ_SPANS_SIZE",
)

///|
/// `MATROID_EQ_SPANS_SIZE`
pub fn matroid_eq_spans_size() -> @kernel.Thm {
  matroid_eq_spans_size_c.get()
}

///|
/// MATROID_BASES_FINITE
fn step_60() -> Unit raise {
  let t547 = @meson.meson_tac(@list.List([matroid_eq_spans_finite()]))
  let t548 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_basis(), matroid_spanning()])),
    t547,
  )
  matroid_bases_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_basis(m, s) && matroid_basis(m, t) → FINITE(s) == FINITE(t)"),
      t548,
    ),
  )
}

///|
let matroid_bases_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASES_FINITE",
)

///|
/// `MATROID_BASES_FINITE`
pub fn matroid_bases_finite() -> @kernel.Thm {
  matroid_bases_finite_c.get()
}

///|
/// MATROID_BASES_SIZE
fn step_61() -> Unit raise {
  let t549 = @meson.meson_tac(@list.List([matroid_eq_spans_size()]))
  let t550 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_basis(), matroid_spanning()])),
    t549,
  )
  matroid_bases_size_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ n : Num, matroid_basis(m, s) && matroid_basis(m, t) → HAS_SIZE(s, n) == HAS_SIZE(t, n)"),
      t550,
    ),
  )
}

///|
let matroid_bases_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASES_SIZE",
)

///|
/// `MATROID_BASES_SIZE`
pub fn matroid_bases_size() -> @kernel.Thm {
  matroid_bases_size_c.get()
}

///|
/// MATROID_INDEPENDENT_CARD_LE_SPAN
fn step_62() -> Unit raise {
  let t599 = @simp.asm_simp_tac(@list.List([@card.card_le_finite_infinite()]))
  let t598 = @simp.asm_simp_tac(
    @list.List([
      @sets.simple_image(),
      @card.card_le_image(),
      @sets.forall_in_image(),
    ]),
  )
  let t597 = @tactics.match_mp_tac(@card.card_le_unions())
  let t596 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @card.card_le_trans(),
    ),
  )
  let t594 = @drule.match_mp(@card.card_le_subset())
  let t600 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x595 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x591 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s592 = @tactics.mp_tac(x591)
              fn(
                x593 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s592(x593)
              }
            })(t594(x595))
          }),
          t596,
        ),
        t597,
      ),
      t598,
    ),
    t599,
  )
  let t590 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t589 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([matroid_independent()])),
  )
  let t588 = @tactics.match_mp_tac(matroid_span_mono())
  let t585 = @drule.match_mp(
    @sets.set_rule(@term_syntax.parse_term("IN((x : _), (t : (_) -> Bool)) → SUBSET(t, (s : (_) -> Bool)) → IN(x, s)")),
  )
  let t587 = @tactics.first_x_assum(fn(
    x586 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t585(x586))
  })
  let t584 = @simp.asm_rewrite_tac(@list.List([]))
  let t580 = @term_syntax.parse_term("(x : A)")
  let t583 = @tactics.first_x_assum(fn(
    x582 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x577 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s578 = @tactics.mp_tac(x577)
      fn(
        x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s578(x579)
      }
    })(((x581 : @kernel.Thm) => @bool.spec(t580, x581))(x582))
  })
  let t576 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t575 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t574 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_independent()])),
    @tactics.all_tac,
  ])
  let t573 = @tactics.match_mp_tac(matroid_span_minimal())
  let t601 = @list.List([
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
                              @tactics.first_x_assum(fn(
                                x572 : @kernel.Thm,
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
                                  x569 : @kernel.Thm,
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
                                  let s570 = @tactics.subst1_tac(x569)
                                  fn(
                                    x571 : (
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
                                    s570(x571)
                                  }
                                })(@equal.sym(x572))
                              }),
                              t573,
                            ),
                            @tactics.conj_tac,
                          ),
                          t574,
                        ),
                        t575,
                      ),
                      t576,
                    ),
                    @tactics.disch_tac,
                  ),
                  t583,
                ),
                t584,
              ),
              @tactics.strip_tac,
            ),
            t587,
          ),
          t588,
        ),
        t589,
      ),
      t590,
    ),
    t600,
  ])
  let t567 = @meson.asm_meson_tac(
    @list.List([matroid_span_superset(), @sets.subset()]),
  )
  let t568 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@sets.unions_subset(), @sets.forall_in_gspec()]),
      ),
      t567,
    ),
    @tactics.strip_tac,
  ])
  let t566 = @tactics.match_mp_tac(
    @sets.set_rule(
      @term_syntax.parse_term("SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) && (SUBSET(t, s) → SUBSET((s' : (_) -> Bool), (t' : (_) -> Bool)) && (SUBSET(s, t) → (P : Bool))) → (PSUBSET(t, s) → PSUBSET(t', s')) → P"),
    ),
  )
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t562 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t563 = @term_syntax.parse_term("UNIONS({(k : (A, A) -> Bool)((x : A)) | IN(x, (t : (A) -> Bool))})")
  let t564 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t563, t562]),
      matroid_span_psubset_independent(),
    ),
  )
  let t559 = @term_syntax.parse_term("(k : (A, A) -> Bool)")
  let t561 = @tactics.disch_then((x560 : @kernel.Thm) => {
    @tactics.x_choose_tac(t559, x560)
  })
  let t557 = @simp.rewrite_tac(
    @list.List([@class.right_imp_exists_thm(), @class.skolem_thm()]),
  )
  let t556 = @meson.asm_meson_tac(
    @list.List([matroid_span_superset(), matroid_independent(), @sets.subset()]),
  )
  let t555 = @tactics.match_mp_tac(matroid_span_finitary())
  let t558 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t555),
      t556,
    ),
    t557,
  ])
  let t554 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : A, IN(x, (t : (A) -> Bool)) → (∃ k : (A) -> Bool, FINITE(k) && SUBSET(k, (s : (A) -> Bool)) && IN(x, matroid_span((m : Matroid[A]), k)))"),
    fn(
      x551 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s552 = @tactics.mp_tac(x551)
      fn(
        x553 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s552(x553)
      }
    },
  )
  let t602 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t554,
                    ),
                    t558,
                  ),
                  t561,
                ),
                t564,
              ),
              t565,
            ),
            t566,
          ),
          @tactics.conj_tac,
        ),
        t568,
      ),
      @tactics.conj_tac,
    ),
    t601,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && INFINITE(t) && SUBSET(t, matroid_set(m)) && matroid_span(m, t) == matroid_span(m, s) → op_lt_eq_us_c(s, t)"),
    t602,
  )
  let t615 = @meson.asm_meson_tac(@list.List([]))
  let t614 = @tactics.match_mp_tac(lemma)
  let t613 = @simp.asm_simp_tac(@list.List([@card.card_le_subset()]))
  let t611 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t612 = @tactics.trans_tac(@card.card_le_trans())(t611)
  let t610 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (A) -> Bool)"))
  let t609 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm()]),
  )
  let t606 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t607 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t608 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t607, t606]),
      matroid_intermediate_span(),
    ),
  )
  let t604 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@equal.gsym(@sets.infinite())])),
  )
  let t605 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        matroid_independent_card_le_span_finite(),
        @card.card_le_card(),
      ]),
    ),
    t604,
  ])
  let t603 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((t : (A) -> Bool))"))
  let t616 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t603,
                    ),
                    t605,
                  ),
                  t608,
                ),
                t609,
              ),
              t610,
            ),
            @tactics.strip_tac,
          ),
          t612,
        ),
        t613,
      ),
      t614,
    ),
    t615,
  )
  matroid_independent_card_le_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(t, matroid_set(m)) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → op_lt_eq_us_c(s, t)"),
      t616,
    ),
  )
}

///|
let matroid_independent_card_le_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_CARD_LE_SPAN",
)

///|
/// `MATROID_INDEPENDENT_CARD_LE_SPAN`
pub fn matroid_independent_card_le_span() -> @kernel.Thm {
  matroid_independent_card_le_span_c.get()
}

///|
/// MATROID_INDEPENDENT_CARD_LE_SPANNING
fn step_63() -> Unit raise {
  let t619 = @meson.asm_meson_tac(@list.List([matroid_independent()]))
  let t618 = @tactics.match_mp_tac(matroid_independent_card_le_span())
  let t617 = @tactics.repeat_tac(@tactics.strip_tac)
  let t620 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([matroid_spanning()])),
        t617,
      ),
      t618,
    ),
    t619,
  )
  matroid_independent_card_le_spanning_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && matroid_spanning(m, t) → op_lt_eq_us_c(s, t)"),
      t620,
    ),
  )
}

///|
let matroid_independent_card_le_spanning_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_CARD_LE_SPANNING",
)

///|
/// `MATROID_INDEPENDENT_CARD_LE_SPANNING`
pub fn matroid_independent_card_le_spanning() -> @kernel.Thm {
  matroid_independent_card_le_spanning_c.get()
}

///|
/// MATROID_EQ_SPANS_CARD_EQ
fn step_64() -> Unit raise {
  let t621 = @meson.meson_tac(
    @list.List([
      matroid_independent_card_le_span(),
      matroid_independent(),
      matroid_span_superset(),
    ]),
  )
  let t622 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([@equal.gsym(@card.card_le_antisym())])),
    ),
    t621,
  )
  matroid_eq_spans_card_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && matroid_independent(m, t) && matroid_span(m, s) == matroid_span(m, t) → op_eq_us_c(s, t)"),
      t622,
    ),
  )
}

///|
let matroid_eq_spans_card_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_EQ_SPANS_CARD_EQ",
)

///|
/// `MATROID_EQ_SPANS_CARD_EQ`
pub fn matroid_eq_spans_card_eq() -> @kernel.Thm {
  matroid_eq_spans_card_eq_c.get()
}

///|
/// MATROID_BASES_CARD_EQ
fn step_65() -> Unit raise {
  let t623 = @meson.meson_tac(@list.List([matroid_eq_spans_card_eq()]))
  let t624 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_basis(), matroid_spanning()])),
    t623,
  )
  matroid_bases_card_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_basis(m, s) && matroid_basis(m, t) → op_eq_us_c(s, t)"),
      t624,
    ),
  )
}

///|
let matroid_bases_card_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASES_CARD_EQ",
)

///|
/// `MATROID_BASES_CARD_EQ`
pub fn matroid_bases_card_eq() -> @kernel.Thm {
  matroid_bases_card_eq_c.get()
}

///|
/// MATROID_INDEPENDENT_SPANNING_FINITE
fn step_66() -> Unit raise {
  let t625 = @meson.meson_tac(
    @list.List([@card.card_le_finite(), matroid_independent_card_le_spanning()]),
  )
  matroid_independent_spanning_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_independent(m, s) && matroid_spanning(m, t) && FINITE(t) → FINITE(s)"),
      t625,
    ),
  )
}

///|
let matroid_independent_spanning_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_SPANNING_FINITE",
)

///|
/// `MATROID_INDEPENDENT_SPANNING_FINITE`
pub fn matroid_independent_spanning_finite() -> @kernel.Thm {
  matroid_independent_spanning_finite_c.get()
}

///|
/// MATROID_DEPENDENT_FINITARY_MINIMAL
fn step_67() -> Unit raise {
  let t660 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t659 = @simp.rewrite_tac(@list.List([matroid_dependent()]))
  let t655 = @term_syntax.parse_term("(v : (A) -> Bool)")
  let t658 = @tactics.first_x_assum(fn(
    x657 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x652 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s653 = @tactics.mp_tac(x652)
      fn(
        x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s653(x654)
      }
    })(((x656 : @kernel.Thm) => @bool.spec(t655, x656))(x657))
  })
  let t651 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (A) -> Bool)"))
  let t650 = @tactics.repeat_tac(
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @meson.asm_meson_tac(
          @list.List([@sets.finite_subset(), @sets.subset()]),
        ),
        @tactics.all_tac,
      ]),
    ),
  )
  let t648 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t649 = @list.List([
    @meson.asm_meson_tac(@list.List([@sets.subset_refl()])),
    t648,
  ])
  let t647 = @simp.rewrite_tac(@list.List([]))
  let t643 = @term_syntax.parse_term("(s : (A) -> Bool) => SUBSET(s, (u : (A) -> Bool)) && matroid_dependent((m : Matroid[A]), s)")
  let t646 = @tactics.disch_then(fn(
    x645 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x640 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s641 = @tactics.mp_tac(x640)
      fn(
        x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s641(x642)
      }
    })(((x644 : @kernel.Thm) => @bool.spec(t643, x644))(x645))
  })
  let t639 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t636 = @drule.match_mp(@sets.wf_psubset())
  let t638 = @tactics.first_assum(fn(
    x637 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x633 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s634 = @tactics.mp_tac(x633)
      fn(
        x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s634(x635)
      }
    })(t636(x637))
  })
  let t632 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x629 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s630 = @tactics.assume_tac(x629)
        fn(
          x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s630(x631)
        }
      },
      @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
        @tactics.strip_assume_tac,
      ),
    ),
  )
  let t628 = @simp.asm_rewrite_tac(@list.List([]))
  let t626 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t627 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t626]),
      matroid_dependent_finitary(),
    ),
  )
  let t661 = @tactics.then_tac(
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
                                    @tactics.repeat_tac(@tactics.strip_tac),
                                    t627,
                                  ),
                                  t628,
                                ),
                                t632,
                              ),
                              t638,
                            ),
                            t639,
                          ),
                          t646,
                        ),
                        t647,
                      ),
                      @tactics.ants_tac,
                    ),
                    t649,
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.strip_tac,
              ),
              t650,
            ),
            t651,
          ),
          @tactics.strip_tac,
        ),
        t658,
      ),
      t659,
    ),
    t660,
  )
  matroid_dependent_finitary_minimal_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_dependent(m, s) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && matroid_dependent(m, t) && (∀ t' : (A) -> Bool, PSUBSET(t', t) → matroid_independent(m, t')))"),
      t661,
    ),
  )
}

///|
let matroid_dependent_finitary_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DEPENDENT_FINITARY_MINIMAL",
)

///|
/// `MATROID_DEPENDENT_FINITARY_MINIMAL`
pub fn matroid_dependent_finitary_minimal() -> @kernel.Thm {
  matroid_dependent_finitary_minimal_c.get()
}

///|
/// MATROID_MINIMALLY_DEPENDENT
fn step_68() -> Unit raise {
  let t694 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t693 = @simp.rewrite_tac(
    @list.List([
      @sets.set_rule(@term_syntax.parse_term("DELETE(DELETE((s : (_) -> Bool), (a : _)), (b : _)) == DIFF(s, {a, b})")),
    ]),
  )
  let t692 = @simp.asm_simp_tac(
    @list.List([
      @sets.in_delete(),
      @sets.set_rule(
        @term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) && IN((b : _), s) && !(a == b) → INSERT(a, DIFF(s, {a, b})) == DELETE(s, b) && INSERT(b, DIFF(s, {a, b})) == DELETE(s, a)"),
      ),
    ]),
  )
  let t687 = @term_syntax.parse_term("(b : A)")
  let t691 = @tactics.disch_then(fn(
    x690 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x689 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x684 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s685 = @tactics.mp_tac(x684)
        fn(
          x686 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s685(x686)
        }
      })(((x688 : @kernel.Thm) => @bool.spec(t687, x688))(x689))
    })(@bool.conjunct2(x690))
  })
  let t683 = @simp.asm_rewrite_tac(
    @list.List([
      matroid_independent(),
      @sets.set_rule(@term_syntax.parse_term("PSUBSET(DELETE((s : (_) -> Bool), (a : _)), s) == IN(a, s)")),
    ]),
  )
  let t679 = @term_syntax.parse_term("DELETE((s : (A) -> Bool), (a : A))")
  let t682 = @tactics.first_x_assum(fn(
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
    (fn(
      x676 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s677 = @tactics.mp_tac(x676)
      fn(
        x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s677(x678)
      }
    })(((x680 : @kernel.Thm) => @bool.spec(t679, x680))(x681))
  })
  let t672 = @term_syntax.parse_term("(b : A)")
  let t673 = @term_syntax.parse_term("(a : A)")
  let t674 = @term_syntax.parse_term("DIFF((s : (A) -> Bool), {(a : A), (b : A)})")
  let t675 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t674, t673, t672]),
      matroid_span_exchange(),
    ),
  )
  let t671 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t670 = @class.asm_cases_tac(@term_syntax.parse_term("(a : A) == (b : A)"))
  let t669 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t668 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac),
  )
  let t667 = @list.List([
    @tactics.all_tac,
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
  ])
  let t666 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t665 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t664 = @simp.asm_rewrite_tac(@list.List([]))
  let t663 = @class.asm_cases_tac(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
  )
  let t662 = @simp.rewrite_tac(@list.List([matroid_dependent_v1()]))
  let t695 = @tactics.then_tac(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.repeat_tac(@tactics.strip_tac),
                                        t662,
                                      ),
                                      t663,
                                    ),
                                    t664,
                                  ),
                                  t665,
                                ),
                                t666,
                              ),
                              @tactics.eq_tac,
                            ),
                            t667,
                          ),
                          t668,
                        ),
                        t669,
                      ),
                      @tactics.disch_tac,
                    ),
                    t670,
                  ),
                  t671,
                ),
                t675,
              ),
              t682,
            ),
            t683,
          ),
          t691,
        ),
        t692,
      ),
      t693,
    ),
    t694,
  )
  matroid_minimally_dependent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, (∀ t : (A) -> Bool, PSUBSET(t, s) → matroid_independent(m, t)) → matroid_dependent(m, s) == (!(s == {}) && SUBSET(s, matroid_set(m)) && (∀ a : A, IN(a, s) → IN(a, matroid_span(m, DELETE(s, a)))))"),
      t695,
    ),
  )
}

///|
let matroid_minimally_dependent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_MINIMALLY_DEPENDENT",
)

///|
/// `MATROID_MINIMALLY_DEPENDENT`
pub fn matroid_minimally_dependent() -> @kernel.Thm {
  matroid_minimally_dependent_c.get()
}

///|
/// MATROID_MINIMALLY_DEPENDENT_SUBSET
fn step_69() -> Unit raise {
  let t702 = @meson.meson_tac(@list.List([matroid_minimally_dependent()]))
  let t699 = @drule.match_mp(matroid_dependent_finitary_minimal())
  let t701 = @tactics.first_assum(fn(
    x700 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x696 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s697 = @tactics.mp_tac(x696)
      fn(
        x698 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s697(x698)
      }
    })(t699(x700))
  })
  let t703 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t701),
    t702,
  )
  matroid_minimally_dependent_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_dependent(m, s) → (∃ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && matroid_dependent(m, t) && !(t == {}) && (∀ a : A, IN(a, t) → IN(a, matroid_span(m, DELETE(t, a)))))"),
      t703,
    ),
  )
}

///|
let matroid_minimally_dependent_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_MINIMALLY_DEPENDENT_SUBSET",
)

///|
/// `MATROID_MINIMALLY_DEPENDENT_SUBSET`
pub fn matroid_minimally_dependent_subset() -> @kernel.Thm {
  matroid_minimally_dependent_subset_c.get()
}

///|
/// matroid_subspace
fn step_70() -> Unit raise {
  matroid_subspace_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(matroid_subspace : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (SUBSET(s, matroid_set(m)) && matroid_span(m, s) == s)"),
    ),
  )
}

///|
let matroid_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_subspace",
)

///|
/// `matroid_subspace`
pub fn matroid_subspace() -> @kernel.Thm {
  matroid_subspace_c.get()
}

///|
/// MATROID_SUBSPACE_IMP_SUBSET
fn step_71() -> Unit raise {
  let t704 = @simp.simp_tac(@list.List([matroid_subspace()]))
  matroid_subspace_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_subspace(m, s) → SUBSET(s, matroid_set(m))"),
      t704,
    ),
  )
}

///|
let matroid_subspace_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_IMP_SUBSET",
)

///|
/// `MATROID_SUBSPACE_IMP_SUBSET`
pub fn matroid_subspace_imp_subset() -> @kernel.Thm {
  matroid_subspace_imp_subset_c.get()
}

///|
/// MATROID_SUBSPACE_SET
fn step_72() -> Unit raise {
  let t705 = @simp.rewrite_tac(
    @list.List([matroid_subspace(), @sets.subset_refl(), matroid_span_set()]),
  )
  matroid_subspace_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_subspace(m, matroid_set(m))"),
      t705,
    ),
  )
}

///|
let matroid_subspace_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_SET",
)

///|
/// `MATROID_SUBSPACE_SET`
pub fn matroid_subspace_set() -> @kernel.Thm {
  matroid_subspace_set_c.get()
}

///|
/// MATROID_SUBSPACE_SPAN
fn step_73() -> Unit raise {
  let t706 = @simp.simp_tac(
    @list.List([matroid_subspace(), matroid_span_subset(), matroid_span_span()]),
  )
  matroid_subspace_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_subspace(m, matroid_span(m, s))"),
      t706,
    ),
  )
}

///|
let matroid_subspace_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_SPAN",
)

///|
/// `MATROID_SUBSPACE_SPAN`
pub fn matroid_subspace_span() -> @kernel.Thm {
  matroid_subspace_span_c.get()
}

///|
/// MATROID_SUBSPACE
fn step_74() -> Unit raise {
  let t707 = @meson.meson_tac(@list.List([matroid_span_superset()]))
  let t708 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([matroid_subspace(), @equal.gsym(@sets.subset_antisym_eq())]),
    ),
    t707,
  )
  matroid_subspace_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_subspace(m, s) == (SUBSET(s, matroid_set(m)) && SUBSET(matroid_span(m, s), s))"),
      t708,
    ),
  )
}

///|
let matroid_subspace_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE",
)

///|
/// `MATROID_SUBSPACE`
pub fn matroid_subspace_v1() -> @kernel.Thm {
  matroid_subspace_v1_c.get()
}

///|
/// MATROID_SUBSPACE_INTERS
fn step_75() -> Unit raise {
  let t730 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t729 = @tactics.match_mp_tac(matroid_span_mono())
  let t728 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x721 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s722 = @tactics.assume_tac(x721)
        fn(
          x723 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s722(x723)
        }
      },
      fn(
        x727 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          let s725 = @tactics.subst1_tac(x724)
          fn(
            x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s725(x726)
          }
        })(@equal.sym(x727))
      },
    ),
  )
  let t720 = @simp.asm_rewrite_tac(@list.List([]))
  let t716 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t719 = @tactics.first_x_assum(fn(
    x718 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x717 : @kernel.Thm) => @bool.spec(t716, x717))(x718))
  })
  let t711 = @tactics.then_tac(
    @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)")),
    @tactics.strip_tac,
  )
  let t712 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t711])
  let t710 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([matroid_subspace()])),
  )
  let t709 = @simp.rewrite_tac(
    @list.List([matroid_subspace_v1(), @sets.subset_inters()]),
  )
  let t731 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t709,
                  ),
                  t710,
                ),
                @tactics.conj_tac,
              ),
              t712,
            ),
            t719,
          ),
          t720,
        ),
        t728,
      ),
      t729,
    ),
    t730,
  )
  matroid_subspace_inters_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ f : ((A) -> Bool) -> Bool, !(f == {}) && (∀ s : (A) -> Bool, IN(s, f) → matroid_subspace(m, s)) → matroid_subspace(m, INTERS(f))"),
      t731,
    ),
  )
}

///|
let matroid_subspace_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_INTERS",
)

///|
/// `MATROID_SUBSPACE_INTERS`
pub fn matroid_subspace_inters() -> @kernel.Thm {
  matroid_subspace_inters_c.get()
}

///|
/// MATROID_SUBSPACE_INTER
fn step_76() -> Unit raise {
  let t734 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t733 = @tactics.match_mp_tac(matroid_subspace_inters())
  let t732 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_2())]))
  let t735 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t732),
      t733,
    ),
    t734,
  )
  matroid_subspace_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_subspace(m, s) && matroid_subspace(m, t) → matroid_subspace(m, INTER(s, t))"),
      t735,
    ),
  )
}

///|
let matroid_subspace_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_INTER",
)

///|
/// `MATROID_SUBSPACE_INTER`
pub fn matroid_subspace_inter() -> @kernel.Thm {
  matroid_subspace_inter_c.get()
}

///|
/// MATROID_SPAN_INTER_SPANS
fn step_77() -> Unit raise {
  let t736 = @meson.meson_tac(
    @list.List([
      matroid_subspace(),
      matroid_span_span(),
      matroid_span_subset(),
      matroid_subspace_inter(),
    ]),
  )
  matroid_span_inter_spans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) → matroid_span(m, INTER(matroid_span(m, s), matroid_span(m, t))) == INTER(matroid_span(m, s), matroid_span(m, t))"),
      t736,
    ),
  )
}

///|
let matroid_span_inter_spans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_INTER_SPANS",
)

///|
/// `MATROID_SPAN_INTER_SPANS`
pub fn matroid_span_inter_spans() -> @kernel.Thm {
  matroid_span_inter_spans_c.get()
}

///|
/// MATROID_SUBSPACE_CHAIN
fn step_78() -> Unit raise {
  let t738 = @sets.set_tac(@list.List([]))
  let t737 = @simp.asm_simp_tac(@list.List([matroid_span_chain()]))
  let t739 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([matroid_subspace()])), t737),
    t738,
  )
  matroid_subspace_chain_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ c : ((A) -> Bool) -> Bool, !(c == {}) && (∀ s : (A) -> Bool, IN(s, c) → matroid_subspace(m, s)) && (∀ s : (A) -> Bool, ∀ t : (A) -> Bool, IN(s, c) && IN(t, c) → SUBSET(s, t) || SUBSET(t, s)) → matroid_subspace(m, UNIONS(c))"),
      t739,
    ),
  )
}

///|
let matroid_subspace_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSPACE_CHAIN",
)

///|
/// `MATROID_SUBSPACE_CHAIN`
pub fn matroid_subspace_chain() -> @kernel.Thm {
  matroid_subspace_chain_c.get()
}

///|
/// MATROID_SPAN_SUBSPACE
fn step_79() -> Unit raise {
  let t740 = @meson.meson_tac(
    @list.List([matroid_span_minimal(), matroid_subspace()]),
  )
  let t741 = @tactics.then_tac(
    @simp.simp_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])),
    t740,
  )
  matroid_span_subspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, SUBSET(b, s) && SUBSET(s, matroid_span(m, b)) && matroid_subspace(m, s) → matroid_span(m, b) == s"),
      t741,
    ),
  )
}

///|
let matroid_span_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SUBSPACE",
)

///|
/// `MATROID_SPAN_SUBSPACE`
pub fn matroid_span_subspace() -> @kernel.Thm {
  matroid_span_subspace_c.get()
}

///|
/// MATROID_SPAN_EQ_SELF
fn step_80() -> Unit raise {
  let t742 = @simp.simp_tac(@list.List([matroid_subspace()]))
  matroid_span_eq_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → (matroid_span(m, s) == s) == matroid_subspace(m, s)"),
      t742,
    ),
  )
}

///|
let matroid_span_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_EQ_SELF",
)

///|
/// `MATROID_SPAN_EQ_SELF`
pub fn matroid_span_eq_self() -> @kernel.Thm {
  matroid_span_eq_self_c.get()
}

///|
/// MATROID_SPAN_OF_SUBSPACE
fn step_81() -> Unit raise {
  let t743 = @simp.simp_tac(@list.List([matroid_subspace()]))
  matroid_span_of_subspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_subspace(m, s) → matroid_span(m, s) == s"),
      t743,
    ),
  )
}

///|
let matroid_span_of_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_OF_SUBSPACE",
)

///|
/// `MATROID_SPAN_OF_SUBSPACE`
pub fn matroid_span_of_subspace() -> @kernel.Thm {
  matroid_span_of_subspace_c.get()
}

///|
/// MATROID_SPAN_SUBSET_SUBSPACE
fn step_82() -> Unit raise {
  let t744 = @meson.meson_tac(
    @list.List([matroid_subspace(), matroid_span_mono()]),
  )
  matroid_span_subset_subspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && matroid_subspace(m, t) → SUBSET(matroid_span(m, s), t)"),
      t744,
    ),
  )
}

///|
let matroid_span_subset_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_SUBSET_SUBSPACE",
)

///|
/// `MATROID_SPAN_SUBSET_SUBSPACE`
pub fn matroid_span_subset_subspace() -> @kernel.Thm {
  matroid_span_subset_subspace_c.get()
}

///|
/// submatroid
fn step_83() -> Unit raise {
  submatroid_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(submatroid : (Matroid[A], (A) -> Bool) -> Matroid[A])((m : Matroid[A]), (s : (A) -> Bool)) == matroid((matroid_span(m, INTER(matroid_set(m), s)), matroid_span(m)))"),
    ),
  )
}

///|
let submatroid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("submatroid")

///|
/// `submatroid`
pub fn submatroid() -> @kernel.Thm {
  submatroid_c.get()
}

///|
/// SUBMATROID_GEN
fn step_84() -> Unit raise {
  let t770 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t764 = @tactics.match_mp_tac(matroid_span_exchange())
  let t765 = @tactics.match_mp_tac(matroid_span_finitary())
  let t766 = @tactics.match_mp_tac(matroid_span_span())
  let t767 = @tactics.match_mp_tac(matroid_span_mono())
  let t768 = @tactics.match_mp_tac(matroid_span_superset())
  let t769 = @list.List([
    @tactics.match_mp_tac(matroid_span_minimal()),
    t768,
    t767,
    t766,
    t765,
    t764,
  ])
  let t763 = @tactics.repeat_tac(@tactics.strip_tac)
  let t762 = @simp.rewrite_tac(@list.List([@sets.inter_subset()]))
  let t760 = @term_syntax.parse_term("INTER(matroid_set((m : Matroid[A])), (s : (A) -> Bool))")
  let t761 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t760]),
      matroid_span_subset(),
    ),
  )
  let t759 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct2(matroid_tybij()))]),
  )
  let t758 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@pair.pair_eq()), submatroid()]),
  )
  let t757 = @simp.gen_rewrite_tac(
    fn(
      x756 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x752 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x746 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s747 = @equal.binop_conv(x746)
          fn(x748 : @kernel.Term) -> @kernel.Thm raise { s747(x748) }
        })(
          (fn(
            x749 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s750 = @equal.land_conv(x749)
            fn(x751 : @kernel.Term) -> @kernel.Thm raise { s750(x751) }
          })(x752),
        )
      })(
        (fn(
          x753 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s754 = @equal.once_depth_conv(x753)
          fn(x755 : @kernel.Term) -> @kernel.Thm raise { s754(x755) }
        })(x756),
      )
    },
    @list.List([matroid_set(), matroid_span()]),
  )
  let t745 = @tactics.repeat_tac(@tactics.gen_tac)
  let t771 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                    t745,
                  ),
                  t757,
                ),
                t758,
              ),
              t759,
            ),
            t761,
          ),
          t762,
        ),
        t763,
      ),
      t769,
    ),
    t770,
  )
  submatroid_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_set(submatroid(m, s)) == matroid_span(m, INTER(matroid_set(m), s))) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_span(submatroid(m, s)) == matroid_span(m))"),
      t771,
    ),
  )
}

///|
let submatroid_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBMATROID_GEN")

///|
/// `SUBMATROID_GEN`
pub fn submatroid_gen() -> @kernel.Thm {
  submatroid_gen_c.get()
}

///|
/// SUBMATROID
fn step_85() -> Unit raise {
  let t772 = @simp.simp_tac(
    @list.List([
      matroid_subspace(),
      @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (u : (_) -> Bool)) → INTER(u, s) == s")),
    ]),
  )
  let t773 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([submatroid_gen()])),
    t772,
  )
  submatroid_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_subspace(m, s) → matroid_set(submatroid(m, s)) == s) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_span(submatroid(m, s)) == matroid_span(m))"),
      t773,
    ),
  )
}

///|
let submatroid_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBMATROID")

///|
/// `SUBMATROID`
pub fn submatroid_v1() -> @kernel.Thm {
  submatroid_v1_c.get()
}

///|
/// SUBMATROID_SPAN
fn step_86() -> Unit raise {
  let t774 = @simp.simp_tac(
    @list.List([
      submatroid(),
      matroid_span_span(),
      matroid_span_subset(),
      @sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) → INTER(s, t) == t")),
    ]),
  )
  submatroid_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → submatroid(m, matroid_span(m, s)) == submatroid(m, s)"),
      t774,
    ),
  )
}

///|
let submatroid_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBMATROID_SPAN",
)

///|
/// `SUBMATROID_SPAN`
pub fn submatroid_span() -> @kernel.Thm {
  submatroid_span_c.get()
}

///|
/// SUBMATROID_SUBSET
fn step_87() -> Unit raise {
  let t775 = @meson.meson_tac(
    @list.List([submatroid_span(), submatroid_v1(), matroid_subspace_span()]),
  )
  submatroid_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_set(submatroid(m, s)) == matroid_span(m, s)) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_span(submatroid(m, s)) == matroid_span(m))"),
      t775,
    ),
  )
}

///|
let submatroid_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUBMATROID_SUBSET",
)

///|
/// `SUBMATROID_SUBSET`
pub fn submatroid_subset() -> @kernel.Thm {
  submatroid_subset_c.get()
}

///|
/// SUBMATROID_SET
fn step_88() -> Unit raise {
  let t776 = @simp.rewrite_tac(
    @list.List([
      matroid_set(),
      matroid_span(),
      @pair.pair(),
      @bool.conjunct1(matroid_tybij()),
    ]),
  )
  let t777 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([submatroid(), @sets.inter_idempot(), matroid_span_set()]),
    ),
    t776,
  )
  submatroid_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], submatroid(m, matroid_set(m)) == m"),
      t777,
    ),
  )
}

///|
let submatroid_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBMATROID_SET")

///|
/// `SUBMATROID_SET`
pub fn submatroid_set() -> @kernel.Thm {
  submatroid_set_c.get()
}

///|
/// MATROID_INDEPENDENT_SUBMATROID
fn step_89() -> Unit raise {
  let t778 = @meson.meson_tac(
    @list.List([matroid_span_subset(), @sets.subset_trans()]),
  )
  let t779 = @tactics.then_tac(
    @simp.simp_tac(@list.List([matroid_independent(), submatroid_subset()])),
    t778,
  )
  matroid_independent_submatroid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_independent(submatroid(m, s), b) == (SUBSET(b, matroid_span(m, s)) && matroid_independent(m, b))"),
      t779,
    ),
  )
}

///|
let matroid_independent_submatroid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_SUBMATROID",
)

///|
/// `MATROID_INDEPENDENT_SUBMATROID`
pub fn matroid_independent_submatroid() -> @kernel.Thm {
  matroid_independent_submatroid_c.get()
}

///|
/// MATROID_SPANNING_SUBMATROID
fn step_90() -> Unit raise {
  let t780 = @simp.simp_tac(
    @list.List([matroid_spanning(), submatroid_subset()]),
  )
  matroid_spanning_submatroid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_spanning(submatroid(m, s), b) == (SUBSET(b, matroid_span(m, s)) && matroid_span(m, b) == matroid_span(m, s))"),
      t780,
    ),
  )
}

///|
let matroid_spanning_submatroid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_SUBMATROID",
)

///|
/// `MATROID_SPANNING_SUBMATROID`
pub fn matroid_spanning_submatroid() -> @kernel.Thm {
  matroid_spanning_submatroid_c.get()
}

///|
/// MATROID_SPANNING_SUBMATROID_SELF
fn step_91() -> Unit raise {
  let t781 = @simp.simp_tac(
    @list.List([matroid_spanning_submatroid(), matroid_span_superset()]),
  )
  matroid_spanning_submatroid_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_spanning(submatroid(m, s), s)"),
      t781,
    ),
  )
}

///|
let matroid_spanning_submatroid_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPANNING_SUBMATROID_SELF",
)

///|
/// `MATROID_SPANNING_SUBMATROID_SELF`
pub fn matroid_spanning_submatroid_self() -> @kernel.Thm {
  matroid_spanning_submatroid_self_c.get()
}

///|
/// MATROID_BASIS_SUBMATROID
fn step_92() -> Unit raise {
  let t783 = @meson.meson_tac(@list.List([]))
  let t782 = @simp.simp_tac(
    @list.List([matroid_independent_submatroid(), matroid_spanning_submatroid()]),
  )
  let t784 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([matroid_basis()])), t782),
    t783,
  )
  matroid_basis_submatroid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_basis(submatroid(m, s), b) == (SUBSET(b, matroid_span(m, s)) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s))"),
      t784,
    ),
  )
}

///|
let matroid_basis_submatroid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_SUBMATROID",
)

///|
/// `MATROID_BASIS_SUBMATROID`
pub fn matroid_basis_submatroid() -> @kernel.Thm {
  matroid_basis_submatroid_c.get()
}

///|
/// MATROID_SUBSET_CONTAINS_BASIS
fn step_93() -> Unit raise {
  let t798 = @meson.meson_tac(@list.List([]))
  let t797 = @simp.asm_simp_tac(@list.List([matroid_basis_submatroid()]))
  let t794 = @drule.match_mp(matroid_spanning_contains_basis())
  let t796 = @tactics.disch_then(fn(
    x795 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x791 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s792 = @tactics.mp_tac(x791)
      fn(
        x793 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s792(x793)
      }
    })(t794(x795))
  })
  let t788 = @drule.match_mp(matroid_spanning_submatroid_self())
  let t790 = @tactics.first_assum(fn(
    x789 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x785 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s786 = @tactics.mp_tac(x785)
      fn(
        x787 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s786(x787)
      }
    })(t788(x789))
  })
  let t799 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t790),
        t796,
      ),
      t797,
    ),
    t798,
  )
  matroid_subset_contains_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → (∃ b : (A) -> Bool, SUBSET(b, s) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s))"),
      t799,
    ),
  )
}

///|
let matroid_subset_contains_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SUBSET_CONTAINS_BASIS",
)

///|
/// `MATROID_SUBSET_CONTAINS_BASIS`
pub fn matroid_subset_contains_basis() -> @kernel.Thm {
  matroid_subset_contains_basis_c.get()
}

///|
/// MATROID_STEINITZ_EXCHANGE_FINITE
fn step_94() -> Unit raise {
  let t831 = @tactics.asm_tac(@sets.set_tac)(
    @list.List([matroid_span_subset()]),
  )
  let t830 = @tactics.match_mp_tac(matroid_span_mono())
  let t828 = @tactics.first_x_assum(fn(
    x823 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x823
    @simp.gen_rewrite_tac(
      fn(
        x825 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s826 = @equal.land_conv(x825)
        fn(x827 : @kernel.Term) -> @kernel.Thm raise { s826(x827) }
      },
      @list.List([@equal.sym(th)]),
    )
  })
  let t822 = @tactics.disch_then(fn(
    x821 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x818 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s819 = @tactics.subst1_tac(x818)
      fn(
        x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s819(x820)
      }
    })(@equal.sym(x821))
  })
  let t817 = @simp.asm_simp_tac(@list.List([matroid_independent_imp_subset()]))
  let t815 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t816 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t829 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.mp_tac(
          @bool.ispecl(
            @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t816, t815]),
            matroid_span_union_eq(),
          ),
        ),
        t817,
      ),
      t822,
    ),
    t828,
  ])
  let t814 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t813 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t812 = @simp.asm_rewrite_tac(@list.List([]))
  let t809 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : (A) -> Bool)"))
  let t810 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t809),
    @tactics.strip_tac,
  )
  let t811 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_independent_card_le_span_finite()]),
    ),
    t810,
  ])
  let t808 = @simp.asm_simp_tac(
    @list.List([@sets.card_subset(), @sets.subset_union()]),
  )
  let t805 = @term_syntax.parse_term("UNION((s : (A) -> Bool), (t : (A) -> Bool))")
  let t806 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t807 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("CARD((t : (A) -> Bool))"), t806, t805]),
      @sets.choose_subset_between(),
    ),
  )
  let t804 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t803 = @simp.asm_simp_tac(
    @list.List([
      matroid_independent_submatroid(),
      submatroid_v1(),
      matroid_basis(),
      matroid_spanning_submatroid(),
      matroid_span_superset(),
    ]),
  )
  let t800 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t801 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t802 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("submatroid((m : Matroid[A]), (t : (A) -> Bool))"), t801, t800]),
      matroid_intermediate_basis(),
    ),
  )
  let t832 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.repeat_tac(@tactics.strip_tac),
                                t802,
                              ),
                              t803,
                            ),
                            t804,
                          ),
                          t807,
                        ),
                        t808,
                      ),
                      @tactics.ants_tac,
                    ),
                    t811,
                  ),
                  t812,
                ),
                @tactics.conj_tac,
              ),
              t813,
            ),
            t814,
          ),
          @tactics.conj_tac,
        ),
        t829,
      ),
      t830,
    ),
    t831,
  )
  matroid_steinitz_exchange_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, matroid_set(m)) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → (∃ t' : (A) -> Bool, HAS_SIZE(t', CARD(t)) && SUBSET(s, t') && SUBSET(t', UNION(s, t)) && matroid_span(m, t') == matroid_span(m, t))"),
      t832,
    ),
  )
}

///|
let matroid_steinitz_exchange_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_STEINITZ_EXCHANGE_FINITE",
)

///|
/// `MATROID_STEINITZ_EXCHANGE_FINITE`
pub fn matroid_steinitz_exchange_finite() -> @kernel.Thm {
  matroid_steinitz_exchange_finite_c.get()
}

///|
/// MATROID_STEINITZ_EXCHANGE_ALT
fn step_95() -> Unit raise {
  let t843 = @meson.asm_meson_tac(@list.List([@sets.card_subset()]))
  let t842 = @tactics.match_mp_tac(@arith.sub_add())
  let t841 = @simp.asm_simp_tac(
    @list.List([@sets.subset_diff(), @sets.card_diff(), @sets.finite_diff()]),
  )
  let t840 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@sets.has_size()])),
  )
  let t839 = @simp.once_rewrite_tac(@list.List([@sets.union_comm()]))
  let t838 = @tactics.exists_tac(@term_syntax.parse_term("DIFF((t : (A) -> Bool), (u : (A) -> Bool))"))
  let t836 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(u : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t837 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_independent_card_le_span_finite()]),
    ),
    t836,
  ])
  let t833 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t834 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t835 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t834, t833]),
      matroid_steinitz_exchange(),
    ),
  )
  let t844 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t835,
                  ),
                  @tactics.ants_tac,
                ),
                t837,
              ),
              t838,
            ),
            t839,
          ),
          t840,
        ),
        t841,
      ),
      t842,
    ),
    t843,
  )
  matroid_steinitz_exchange_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, matroid_set(m)) && matroid_independent(m, s) && SUBSET(s, matroid_span(m, t)) → (∃ t' : (A) -> Bool, SUBSET(t', t) && CARD(t') + CARD(s) == CARD(t) && matroid_span(m, UNION(s, t')) == matroid_span(m, t))"),
      t844,
    ),
  )
}

///|
let matroid_steinitz_exchange_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_STEINITZ_EXCHANGE_ALT",
)

///|
/// `MATROID_STEINITZ_EXCHANGE_ALT`
pub fn matroid_steinitz_exchange_alt() -> @kernel.Thm {
  matroid_steinitz_exchange_alt_c.get()
}

///|
/// matroid_finite_dimensional
fn step_96() -> Unit raise {
  matroid_finite_dimensional_c.set(
    @define.define_(
      @term_syntax.parse_term("(matroid_finite_dimensional : (Matroid[A]) -> Bool)((m : Matroid[A])) == (∃ b : (A) -> Bool, FINITE(b) && matroid_spanning(m, b))"),
    ),
  )
}

///|
let matroid_finite_dimensional_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_finite_dimensional",
)

///|
/// `matroid_finite_dimensional`
pub fn matroid_finite_dimensional() -> @kernel.Thm {
  matroid_finite_dimensional_c.get()
}

///|
/// matroid_dimension
fn step_97() -> Unit raise {
  matroid_dimension_c.set(
    @define.define_(
      @term_syntax.parse_term("(matroid_dimension : (Matroid[A]) -> Num)((m : Matroid[A])) == select((n : Num) => ∀ b : (A) -> Bool, matroid_basis(m, b) → HAS_SIZE(b, n))"),
    ),
  )
}

///|
let matroid_dimension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_dimension",
)

///|
/// `matroid_dimension`
pub fn matroid_dimension() -> @kernel.Thm {
  matroid_dimension_c.get()
}

///|
/// matroid_finite_dim
fn step_98() -> Unit raise {
  matroid_finite_dim_c.set(
    @define.define_(
      @term_syntax.parse_term("(matroid_finite_dim : (Matroid[A], (A) -> Bool) -> Bool)((m : Matroid[A]), (s : (A) -> Bool)) == (SUBSET(s, matroid_set(m)) && matroid_finite_dimensional(submatroid(m, s)))"),
    ),
  )
}

///|
let matroid_finite_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "matroid_finite_dim",
)

///|
/// `matroid_finite_dim`
pub fn matroid_finite_dim() -> @kernel.Thm {
  matroid_finite_dim_c.get()
}

///|
/// matroid_dim
fn step_99() -> Unit raise {
  matroid_dim_c.set(
    @define.define_(
      @term_syntax.parse_term("(matroid_dim : (Matroid[A], (A) -> Bool) -> Num)((m : Matroid[A]), (s : (A) -> Bool)) == matroid_dimension(submatroid(m, s))"),
    ),
  )
}

///|
let matroid_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matroid_dim")

///|
/// `matroid_dim`
pub fn matroid_dim() -> @kernel.Thm {
  matroid_dim_c.get()
}

///|
/// MATROID_FINITE_DIM_IMP_SUBSET
fn step_100() -> Unit raise {
  let t845 = @simp.simp_tac(@list.List([matroid_finite_dim()]))
  matroid_finite_dim_imp_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) → SUBSET(s, matroid_set(m))"),
      t845,
    ),
  )
}

///|
let matroid_finite_dim_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_IMP_SUBSET",
)

///|
/// `MATROID_FINITE_DIM_IMP_SUBSET`
pub fn matroid_finite_dim_imp_subset() -> @kernel.Thm {
  matroid_finite_dim_imp_subset_c.get()
}

///|
/// MATROID_FINITE_DIM_SET
fn step_101() -> Unit raise {
  let t846 = @simp.rewrite_tac(
    @list.List([matroid_finite_dim(), submatroid_set(), @sets.subset_refl()]),
  )
  matroid_finite_dim_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_finite_dim(m, matroid_set(m)) == matroid_finite_dimensional(m)"),
      t846,
    ),
  )
}

///|
let matroid_finite_dim_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_SET",
)

///|
/// `MATROID_FINITE_DIM_SET`
pub fn matroid_finite_dim_set() -> @kernel.Thm {
  matroid_finite_dim_set_c.get()
}

///|
/// MATROID_DIM_SET
fn step_102() -> Unit raise {
  let t847 = @simp.rewrite_tac(@list.List([matroid_dim(), submatroid_set()]))
  matroid_dim_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_dim(m, matroid_set(m)) == matroid_dimension(m)"),
      t847,
    ),
  )
}

///|
let matroid_dim_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SET",
)

///|
/// `MATROID_DIM_SET`
pub fn matroid_dim_set() -> @kernel.Thm {
  matroid_dim_set_c.get()
}

///|
/// MATROID_FINITE_DIM_SPAN_EQ
fn step_103() -> Unit raise {
  let t848 = @meson.meson_tac(
    @list.List([submatroid_span(), matroid_span_subset()]),
  )
  let t849 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_finite_dim()])),
    t848,
  )
  matroid_finite_dim_span_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (SUBSET(s, matroid_set(m)) && matroid_finite_dim(m, matroid_span(m, s)))"),
      t849,
    ),
  )
}

///|
let matroid_finite_dim_span_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_SPAN_EQ",
)

///|
/// `MATROID_FINITE_DIM_SPAN_EQ`
pub fn matroid_finite_dim_span_eq() -> @kernel.Thm {
  matroid_finite_dim_span_eq_c.get()
}

///|
/// MATROID_FINITE_DIM_SPAN
fn step_104() -> Unit raise {
  let t850 = @meson.meson_tac(@list.List([matroid_finite_dim_span_eq()]))
  matroid_finite_dim_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_finite_dim(m, matroid_span(m, s)) == matroid_finite_dim(m, s)"),
      t850,
    ),
  )
}

///|
let matroid_finite_dim_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_SPAN",
)

///|
/// `MATROID_FINITE_DIM_SPAN`
pub fn matroid_finite_dim_span() -> @kernel.Thm {
  matroid_finite_dim_span_c.get()
}

///|
/// MATROID_DIM_SPAN
fn step_105() -> Unit raise {
  let t851 = @simp.simp_tac(@list.List([matroid_dim(), submatroid_span()]))
  matroid_dim_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_dim(m, matroid_span(m, s)) == matroid_dim(m, s)"),
      t851,
    ),
  )
}

///|
let matroid_dim_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SPAN",
)

///|
/// `MATROID_DIM_SPAN`
pub fn matroid_dim_span() -> @kernel.Thm {
  matroid_dim_span_c.get()
}

///|
/// MATROID_FINITE_DIMENSIONAL
fn step_106() -> Unit raise {
  let t852 = @meson.meson_tac(@list.List([matroid_span_eq_set()]))
  let t853 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([matroid_finite_dimensional(), matroid_spanning()]),
    ),
    t852,
  )
  matroid_finite_dimensional_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_finite_dimensional(m) == (∃ b : (A) -> Bool, FINITE(b) && SUBSET(b, matroid_set(m)) && SUBSET(matroid_set(m), matroid_span(m, b)))"),
      t853,
    ),
  )
}

///|
let matroid_finite_dimensional_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIMENSIONAL",
)

///|
/// `MATROID_FINITE_DIMENSIONAL`
pub fn matroid_finite_dimensional_v1() -> @kernel.Thm {
  matroid_finite_dimensional_v1_c.get()
}

///|
/// MATROID_FINITE_DIMENSIONAL_BASIS
fn step_107() -> Unit raise {
  let t854 = @meson.meson_tac(
    @list.List([
      matroid_spanning_contains_basis(),
      @sets.finite_subset(),
      matroid_basis(),
    ]),
  )
  let t855 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_finite_dimensional()])),
    t854,
  )
  matroid_finite_dimensional_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_finite_dimensional(m) == (∃ b : (A) -> Bool, FINITE(b) && matroid_basis(m, b))"),
      t855,
    ),
  )
}

///|
let matroid_finite_dimensional_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIMENSIONAL_BASIS",
)

///|
/// `MATROID_FINITE_DIMENSIONAL_BASIS`
pub fn matroid_finite_dimensional_basis() -> @kernel.Thm {
  matroid_finite_dimensional_basis_c.get()
}

///|
/// MATROID_FINITE_DIMENSIONAL_CONTAINS_BASIS
fn step_108() -> Unit raise {
  let t863 = @meson.asm_meson_tac(@list.List([matroid_bases_finite()]))
  let t862 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([matroid_finite_dimensional_basis()])),
  )
  let t859 = @drule.match_mp(matroid_spanning_contains_basis())
  let t861 = @tactics.first_assum(fn(
    x860 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x856 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s857 = @tactics.mp_tac(x856)
      fn(
        x858 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s857(x858)
      }
    })(t859(x860))
  })
  let t864 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t861),
      t862,
    ),
    t863,
  )
  matroid_finite_dimensional_contains_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dimensional(m) && matroid_spanning(m, s) → (∃ b : (A) -> Bool, FINITE(b) && SUBSET(b, s) && matroid_basis(m, b))"),
      t864,
    ),
  )
}

///|
let matroid_finite_dimensional_contains_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIMENSIONAL_CONTAINS_BASIS",
)

///|
/// `MATROID_FINITE_DIMENSIONAL_CONTAINS_BASIS`
pub fn matroid_finite_dimensional_contains_basis() -> @kernel.Thm {
  matroid_finite_dimensional_contains_basis_c.get()
}

///|
/// MATROID_FINITE_DIMENSIONAL_ANY
fn step_109() -> Unit raise {
  let t865 = @meson.meson_tac(
    @list.List([
      matroid_finite_dimensional_basis(),
      matroid_bases_finite(),
      matroid_basis_exists(),
    ]),
  )
  matroid_finite_dimensional_any_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, matroid_basis(m, b) → matroid_finite_dimensional(m) == FINITE(b)"),
      t865,
    ),
  )
}

///|
let matroid_finite_dimensional_any_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIMENSIONAL_ANY",
)

///|
/// `MATROID_FINITE_DIMENSIONAL_ANY`
pub fn matroid_finite_dimensional_any() -> @kernel.Thm {
  matroid_finite_dimensional_any_c.get()
}

///|
let matroid_finite_dim_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM",
)

///|
/// `MATROID_FINITE_DIM`
pub fn matroid_finite_dim_v1() -> @kernel.Thm {
  matroid_finite_dim_v1_c.get()
}

///|
let matroid_finite_dim_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_SUBSET",
)

///|
/// `MATROID_FINITE_DIM_SUBSET`
pub fn matroid_finite_dim_subset() -> @kernel.Thm {
  matroid_finite_dim_subset_c.get()
}

///|
let matroid_finite_dim_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_BASIS",
)

///|
/// `MATROID_FINITE_DIM_BASIS`
pub fn matroid_finite_dim_basis() -> @kernel.Thm {
  matroid_finite_dim_basis_c.get()
}

///|
/// MATROID_FINITE_DIM, MATROID_FINITE_DIM_SUBSET, MATROID_FINITE_DIM_BASIS
fn step_110() -> Unit raise {
  let t892 = @tactics.asm_tac(@sets.set_tac)(
    @list.List([matroid_span_subset(), matroid_span_superset()]),
  )
  let t889 = @term_syntax.parse_term("(c : (A) -> Bool)")
  let t890 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t891 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t890, t889]),
      matroid_independent_card_le_span_finite(),
    ),
  )
  let t888 = @simp.asm_rewrite_tac(@list.List([]))
  let t887 = @tactics.repeat_tac(@tactics.strip_tac)
  let t886 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t883 = @drule.match_mp(matroid_subset_contains_basis())
  let t885 = @tactics.first_assum(fn(
    x884 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x880 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s881 = @tactics.mp_tac(x880)
      fn(
        x882 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s881(x882)
      }
    })(t883(x884))
  })
  let t879 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_subset()])),
    @tactics.disch_tac,
  ])
  let t878 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t875 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t876 = @meson.meson_tac(
    @list.List([subset_matroid_span(), matroid_span_subset(), @sets.subset()]),
  )
  let t874 = @meson.meson_tac(
    @list.List([
      matroid_span_minimal(),
      matroid_span_superset(),
      @sets.subset_trans(),
    ]),
  )
  let t877 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])),
      t874,
    ),
    t876,
    t875,
  ])
  let t873 = @tactics.repeat_tac(@tactics.conj_tac)
  let t872 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t871 = @simp.simp_tac(
    @list.List([
      matroid_finite_dimensional(),
      submatroid_subset(),
      matroid_spanning_submatroid(),
    ]),
  )
  let t870 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(
        @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == !(p → !q)"))]),
      )(matroid_finite_dim()),
    ]),
  )
  let t869 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([matroid_span_superset()])),
    @tactics.all_tac,
  ])
  let t868 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((s : Bool) → (r : Bool)) && (r → (p : Bool)) && (p → (q : Bool)) && (q → s) → p == q && p == r && p == s"),
    ),
  )
  let t867 = @tactics.repeat_tac(@tactics.gen_tac)
  let t893 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @simp.rewrite_tac(
                                        @list.List([@theorems.and_forall_thm()]),
                                      ),
                                      t867,
                                    ),
                                    t868,
                                  ),
                                  @tactics.conj_tac,
                                ),
                                t869,
                              ),
                              t870,
                            ),
                            t871,
                          ),
                          t872,
                        ),
                        t873,
                      ),
                      t877,
                    ),
                    t878,
                  ),
                  @tactics.conj_tac,
                ),
                t879,
              ),
              t885,
            ),
            t886,
          ),
          t887,
        ),
        t888,
      ),
      t891,
    ),
    t892,
  )
  let t894 = (
    @term_syntax.parse_term("(∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (∃ b : (A) -> Bool, FINITE(b) && SUBSET(b, matroid_set(m)) && SUBSET(s, matroid_span(m, b)))) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (SUBSET(s, matroid_set(m)) && (∃ b : (A) -> Bool, FINITE(b) && SUBSET(b, s) && SUBSET(s, matroid_span(m, b))))) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (SUBSET(s, matroid_set(m)) && (∃ b : (A) -> Bool, FINITE(b) && SUBSET(b, s) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s))))"),
    t893,
  )
  match
    @bool.conjuncts_rule(
      (fn(
        x866 : (
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
        @tactics.prove(x866.0, x866.1)
      })(t894),
    ) {
    More(
      matroid_finite_dim_1,
      tail=More(
        matroid_finite_dim_subset,
        tail=More(matroid_finite_dim_basis, tail=Empty)
      )
    ) => {
      matroid_finite_dim_v1_c.set(matroid_finite_dim_1)
      matroid_finite_dim_subset_c.set(matroid_finite_dim_subset)
      matroid_finite_dim_basis_c.set(matroid_finite_dim_basis)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1140:4")
  }
}

///|
/// MATROID_FINITE_DIMENSIONAL_DIM
fn step_111() -> Unit raise {
  let t895 = @sets.set_tac(@list.List([]))
  let t896 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        matroid_finite_dimensional(),
        matroid_spanning(),
        matroid_finite_dim_v1(),
      ]),
    ),
    t895,
  )
  matroid_finite_dimensional_dim_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dimensional(m) && SUBSET(s, matroid_set(m)) → matroid_finite_dim(m, s)"),
      t896,
    ),
  )
}

///|
let matroid_finite_dimensional_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIMENSIONAL_DIM",
)

///|
/// `MATROID_FINITE_DIMENSIONAL_DIM`
pub fn matroid_finite_dimensional_dim() -> @kernel.Thm {
  matroid_finite_dimensional_dim_c.get()
}

///|
/// FINITE_IMP_MATROID_FINITE_DIM
fn step_112() -> Unit raise {
  let t897 = @meson.meson_tac(@list.List([matroid_span_superset()]))
  let t898 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_finite_dim_v1()])),
    t897,
  )
  finite_imp_matroid_finite_dim_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, FINITE(s) && SUBSET(s, matroid_set(m)) → matroid_finite_dim(m, s)"),
      t898,
    ),
  )
}

///|
let finite_imp_matroid_finite_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_IMP_MATROID_FINITE_DIM",
)

///|
/// `FINITE_IMP_MATROID_FINITE_DIM`
pub fn finite_imp_matroid_finite_dim() -> @kernel.Thm {
  finite_imp_matroid_finite_dim_c.get()
}

///|
/// MATROID_FINITE_DIM_FINITE
fn step_113() -> Unit raise {
  let t899 = @meson.meson_tac(
    @list.List([matroid_finite_dim(), finite_imp_matroid_finite_dim()]),
  )
  matroid_finite_dim_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, FINITE(s) → matroid_finite_dim(m, s) == SUBSET(s, matroid_set(m))"),
      t899,
    ),
  )
}

///|
let matroid_finite_dim_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_FINITE",
)

///|
/// `MATROID_FINITE_DIM_FINITE`
pub fn matroid_finite_dim_finite() -> @kernel.Thm {
  matroid_finite_dim_finite_c.get()
}

///|
/// MATROID_FINITE_DIM_EMPTY
fn step_114() -> Unit raise {
  let t900 = @simp.simp_tac(
    @list.List([
      finite_imp_matroid_finite_dim(),
      @sets.empty_subset(),
      @sets.finite_empty(),
    ]),
  )
  matroid_finite_dim_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_finite_dim(m, {})"),
      t900,
    ),
  )
}

///|
let matroid_finite_dim_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_EMPTY",
)

///|
/// `MATROID_FINITE_DIM_EMPTY`
pub fn matroid_finite_dim_empty() -> @kernel.Thm {
  matroid_finite_dim_empty_c.get()
}

///|
/// MATROID_FINITE_DIM_MONO
fn step_115() -> Unit raise {
  let t901 = @sets.set_tac(@list.List([]))
  let t902 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_finite_dim_v1()])),
    t901,
  )
  matroid_finite_dim_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_finite_dim(m, t) && SUBSET(s, t) → matroid_finite_dim(m, s)"),
      t902,
    ),
  )
}

///|
let matroid_finite_dim_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_MONO",
)

///|
/// `MATROID_FINITE_DIM_MONO`
pub fn matroid_finite_dim_mono() -> @kernel.Thm {
  matroid_finite_dim_mono_c.get()
}

///|
/// MATROID_FINITE_DIM_UNION
fn step_116() -> Unit raise {
  let t909 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_mono(),
      @sets.union_subset(),
      @sets.subset_trans(),
      @sets.subset_union(),
    ]),
  )
  let t908 = @simp.asm_rewrite_tac(
    @list.List([@sets.union_subset(), @sets.finite_union()]),
  )
  let t907 = @tactics.exists_tac(@term_syntax.parse_term("UNION((b : (A) -> Bool), (c : (A) -> Bool))"))
  let t905 = @tactics.x_choose_then(@term_syntax.parse_term("(c : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t906 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(
        @tactics.strip_assume_tac,
      ),
      t905,
    ),
  )
  let t903 = @simp.rewrite_tac(@list.List([matroid_finite_dim_v1()]))
  let t904 = @list.List([
    @meson.meson_tac(
      @list.List([matroid_finite_dim_mono(), @sets.subset_union()]),
    ),
    t903,
  ])
  let t910 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.eq_tac,
              ),
              t904,
            ),
            t906,
          ),
          t907,
        ),
        t908,
      ),
      @tactics.conj_tac,
    ),
    t909,
  )
  matroid_finite_dim_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_finite_dim(m, UNION(s, t)) == (matroid_finite_dim(m, s) && matroid_finite_dim(m, t))"),
      t910,
    ),
  )
}

///|
let matroid_finite_dim_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_UNION",
)

///|
/// `MATROID_FINITE_DIM_UNION`
pub fn matroid_finite_dim_union() -> @kernel.Thm {
  matroid_finite_dim_union_c.get()
}

///|
/// MATROID_FINITE_DIM_INSERT
fn step_117() -> Unit raise {
  let t912 = @simp.simp_tac(
    @list.List([
      matroid_finite_dim_union(),
      matroid_finite_dim_finite(),
      @sets.finite_sing(),
      @sets.sing_subset(),
    ]),
  )
  let t911 = @simp.once_rewrite_tac(
    @list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)"))]),
  )
  let t913 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t911),
    t912,
  )
  matroid_finite_dim_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, matroid_finite_dim(m, INSERT(x, s)) == (IN(x, matroid_set(m)) && matroid_finite_dim(m, s))"),
      t913,
    ),
  )
}

///|
let matroid_finite_dim_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_FINITE_DIM_INSERT",
)

///|
/// `MATROID_FINITE_DIM_INSERT`
pub fn matroid_finite_dim_insert() -> @kernel.Thm {
  matroid_finite_dim_insert_c.get()
}

///|
/// MATROID_DIMENSION_ALT
fn step_118() -> Unit raise {
  let t916 = @meson.meson_tac(
    @list.List([matroid_bases_size(), matroid_basis_exists()]),
  )
  let t915 = @simp.gen_rewrite_tac(
    fn(
      x914 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x914
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t917 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([matroid_dimension()])),
        ),
        @tactics.ap_term_tac,
      ),
      t915,
    ),
    t916,
  )
  matroid_dimension_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_dimension(m) == select((n : Num) => ∃ b : (A) -> Bool, matroid_basis(m, b) && HAS_SIZE(b, n))"),
      t917,
    ),
  )
}

///|
let matroid_dimension_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_ALT",
)

///|
/// `MATROID_DIMENSION_ALT`
pub fn matroid_dimension_alt() -> @kernel.Thm {
  matroid_dimension_alt_c.get()
}

///|
/// MATROID_DIM_BASIS
fn step_119() -> Unit raise {
  let t928 = @meson.asm_meson_tac(
    @list.List([
      matroid_eq_spans_size(),
      matroid_span_superset(),
      @sets.subset_trans(),
    ]),
  )
  let t925 = @drule.match_mp(matroid_subset_contains_basis())
  let t927 = @tactics.first_assum(fn(
    x926 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x922 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s923 = @tactics.mp_tac(x922)
      fn(
        x924 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s923(x924)
      }
    })(t925(x926))
  })
  let t921 = @simp.gen_rewrite_tac(
    fn(
      x920 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x920
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let t919 = @tactics.repeat_tac(@tactics.strip_tac)
  let t918 = @simp.simp_tac(@list.List([matroid_basis_submatroid()]))
  let t929 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([matroid_dim(), matroid_dimension_alt()]),
              ),
              t918,
            ),
            t919,
          ),
          @tactics.ap_term_tac,
        ),
        t921,
      ),
      t927,
    ),
    t928,
  )
  matroid_dim_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_dim(m, s) == select((n : Num) => ∃ b : (A) -> Bool, SUBSET(b, s) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s) && HAS_SIZE(b, n))"),
      t929,
    ),
  )
}

///|
let matroid_dim_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_BASIS",
)

///|
/// `MATROID_DIM_BASIS`
pub fn matroid_dim_basis() -> @kernel.Thm {
  matroid_dim_basis_c.get()
}

///|
/// MATROID_DIM_ALT
fn step_120() -> Unit raise {
  let t932 = @meson.asm_meson_tac(
    @list.List([matroid_span_eq(), matroid_span_minimal(), @sets.subset_trans()]),
  )
  let t931 = @tactics.replicate_tac(
    2,
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t930 = @simp.asm_simp_tac(@list.List([matroid_dim_basis()]))
  let t933 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t930),
      t931,
    ),
    t932,
  )
  matroid_dim_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, SUBSET(s, matroid_set(m)) → matroid_dim(m, s) == select((n : Num) => ∃ b : (A) -> Bool, SUBSET(b, s) && matroid_independent(m, b) && SUBSET(s, matroid_span(m, b)) && HAS_SIZE(b, n))"),
      t933,
    ),
  )
}

///|
let matroid_dim_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_ALT",
)

///|
/// `MATROID_DIM_ALT`
pub fn matroid_dim_alt() -> @kernel.Thm {
  matroid_dim_alt_c.get()
}

///|
/// MATROID_DIMENSION_UNIQUE
fn step_121() -> Unit raise {
  let t934 = @meson.meson_tac(
    @list.List([matroid_bases_size(), @sets.has_size()]),
  )
  let t935 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([matroid_dimension()])),
    t934,
  )
  matroid_dimension_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, ∀ n : Num, matroid_basis(m, b) && HAS_SIZE(b, n) → matroid_dimension(m) == n"),
      t935,
    ),
  )
}

///|
let matroid_dimension_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_UNIQUE",
)

///|
/// `MATROID_DIMENSION_UNIQUE`
pub fn matroid_dimension_unique() -> @kernel.Thm {
  matroid_dimension_unique_c.get()
}

///|
/// MATROID_DIMENSION_EQ_CARD
fn step_122() -> Unit raise {
  let t936 = @meson.meson_tac(
    @list.List([matroid_dimension_unique(), @sets.has_size()]),
  )
  matroid_dimension_eq_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, matroid_basis(m, b) && FINITE(b) → matroid_dimension(m) == CARD(b)"),
      t936,
    ),
  )
}

///|
let matroid_dimension_eq_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_EQ_CARD",
)

///|
/// `MATROID_DIMENSION_EQ_CARD`
pub fn matroid_dimension_eq_card() -> @kernel.Thm {
  matroid_dimension_eq_card_c.get()
}

///|
/// MATROID_DIM_UNIQUE_ALT
fn step_123() -> Unit raise {
  let t946 = @meson.asm_meson_tac(@list.List([matroid_span_superset()]))
  let t944 = @simp.asm_simp_tac(@list.List([matroid_basis_submatroid()]))
  let t945 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_span_subset(), @sets.subset_trans()]),
    ),
    t944,
  ])
  let t943 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
    fn(
      x940 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s941 = @tactics.assume_tac(x940)
      fn(
        x942 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s941(x942)
      }
    },
  )
  let t939 = @tactics.exists_tac(@term_syntax.parse_term("(b : (A) -> Bool)"))
  let t938 = @tactics.match_mp_tac(matroid_dimension_unique())
  let t937 = @simp.rewrite_tac(@list.List([matroid_dim()]))
  let t947 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t937),
            t938,
          ),
          t939,
        ),
        t943,
      ),
      t945,
    ),
    t946,
  )
  matroid_dim_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, ∀ n : Num, SUBSET(s, matroid_set(m)) && SUBSET(b, matroid_set(m)) && HAS_SIZE(b, n) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s) → matroid_dim(m, s) == n"),
      t947,
    ),
  )
}

///|
let matroid_dim_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_UNIQUE_ALT",
)

///|
/// `MATROID_DIM_UNIQUE_ALT`
pub fn matroid_dim_unique_alt() -> @kernel.Thm {
  matroid_dim_unique_alt_c.get()
}

///|
/// MATROID_DIM_UNIQUE
fn step_124() -> Unit raise {
  let t957 = @meson.asm_meson_tac(
    @list.List([matroid_span_eq(), matroid_span_subset(), @sets.subset_trans()]),
  )
  let t954 = @drule.match_mp(matroid_independent_imp_subset())
  let t956 = @tactics.first_assum(fn(
    x955 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x951 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s952 = @tactics.assume_tac(x951)
      fn(
        x953 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s952(x953)
      }
    })(t954(x955))
  })
  let t950 = @simp.asm_rewrite_tac(@list.List([]))
  let t949 = @tactics.exists_tac(@term_syntax.parse_term("(b : (A) -> Bool)"))
  let t948 = @tactics.match_mp_tac(matroid_dim_unique_alt())
  let t958 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t948),
          t949,
        ),
        t950,
      ),
      t956,
    ),
    t957,
  )
  matroid_dim_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, ∀ n : Num, SUBSET(b, s) && HAS_SIZE(b, n) && matroid_independent(m, b) && SUBSET(s, matroid_span(m, b)) → matroid_dim(m, s) == n"),
      t958,
    ),
  )
}

///|
let matroid_dim_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_UNIQUE",
)

///|
/// `MATROID_DIM_UNIQUE`
pub fn matroid_dim_unique() -> @kernel.Thm {
  matroid_dim_unique_c.get()
}

///|
/// MATROID_SPAN_DIM_EQ
fn step_125() -> Unit raise {
  let t959 = @meson.meson_tac(@list.List([matroid_dim_span()]))
  matroid_span_dim_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(t, matroid_set(m)) && matroid_span(m, s) == matroid_span(m, t) → matroid_dim(m, s) == matroid_dim(m, t)"),
      t959,
    ),
  )
}

///|
let matroid_span_dim_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_DIM_EQ",
)

///|
/// `MATROID_SPAN_DIM_EQ`
pub fn matroid_span_dim_eq() -> @kernel.Thm {
  matroid_span_dim_eq_c.get()
}

///|
/// MATROID_SPAN_INSERT_REFL
fn step_126() -> Unit raise {
  let t960 = @meson.meson_tac(
    @list.List([matroid_span_insert_eq(), matroid_span_subset(), @sets.subset()]),
  )
  matroid_span_insert_refl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, SUBSET(s, matroid_set(m)) && IN(x, matroid_span(m, s)) → matroid_span(m, INSERT(x, s)) == matroid_span(m, s)"),
      t960,
    ),
  )
}

///|
let matroid_span_insert_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_SPAN_INSERT_REFL",
)

///|
/// `MATROID_SPAN_INSERT_REFL`
pub fn matroid_span_insert_refl() -> @kernel.Thm {
  matroid_span_insert_refl_c.get()
}

///|
/// MATROID_BASIS_EXISTS_DIMENSION
fn step_127() -> Unit raise {
  let t961 = @meson.meson_tac(
    @list.List([matroid_dimension_unique(), @sets.has_size()]),
  )
  let t962 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([matroid_finite_dimensional_basis(), @sets.has_size()]),
    ),
    t961,
  )
  matroid_basis_exists_dimension_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_finite_dimensional(m) == (∃ b : (A) -> Bool, HAS_SIZE(b, matroid_dimension(m)) && matroid_basis(m, b))"),
      t962,
    ),
  )
}

///|
let matroid_basis_exists_dimension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_EXISTS_DIMENSION",
)

///|
/// `MATROID_BASIS_EXISTS_DIMENSION`
pub fn matroid_basis_exists_dimension() -> @kernel.Thm {
  matroid_basis_exists_dimension_c.get()
}

///|
/// MATROID_BASIS_EXISTS_DIM
fn step_128() -> Unit raise {
  let t967 = @meson.meson_tac(@list.List([matroid_dim()]))
  let t966 = @simp.asm_simp_tac(
    @list.List([matroid_basis_exists_dimension(), matroid_basis_submatroid()]),
  )
  let t965 = @simp.asm_rewrite_tac(@list.List([]))
  let t964 = @class.asm_cases_tac(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
  )
  let t963 = @simp.rewrite_tac(@list.List([matroid_finite_dim()]))
  let t968 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t963),
          t964,
        ),
        t965,
      ),
      t966,
    ),
    t967,
  )
  matroid_basis_exists_dim_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (SUBSET(s, matroid_set(m)) && (∃ b : (A) -> Bool, HAS_SIZE(b, matroid_dim(m, s)) && SUBSET(b, matroid_span(m, s)) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s)))"),
      t968,
    ),
  )
}

///|
let matroid_basis_exists_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_BASIS_EXISTS_DIM",
)

///|
/// `MATROID_BASIS_EXISTS_DIM`
pub fn matroid_basis_exists_dim() -> @kernel.Thm {
  matroid_basis_exists_dim_c.get()
}

///|
/// MATROID_CONTAINS_BASIS_DIM
fn step_129() -> Unit raise {
  let t972 = @meson.asm_meson_tac(
    @list.List([matroid_dim_unique_alt(), @sets.has_size(), @sets.subset()]),
  )
  let t971 = @simp.asm_rewrite_tac(@list.List([]))
  let t970 = @class.asm_cases_tac(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
  )
  let t969 = @simp.rewrite_tac(
    @list.List([matroid_finite_dim_basis(), @sets.has_size()]),
  )
  let t973 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t969),
        t970,
      ),
      t971,
    ),
    t972,
  )
  matroid_contains_basis_dim_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) == (SUBSET(s, matroid_set(m)) && (∃ b : (A) -> Bool, HAS_SIZE(b, matroid_dim(m, s)) && SUBSET(b, s) && matroid_independent(m, b) && matroid_span(m, b) == matroid_span(m, s)))"),
      t973,
    ),
  )
}

///|
let matroid_contains_basis_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_CONTAINS_BASIS_DIM",
)

///|
/// `MATROID_CONTAINS_BASIS_DIM`
pub fn matroid_contains_basis_dim() -> @kernel.Thm {
  matroid_contains_basis_dim_c.get()
}

///|
/// MATROID_DIM_EQ_CARD_GEN
fn step_130() -> Unit raise {
  let t974 = @meson.meson_tac(
    @list.List([matroid_dim_unique(), @sets.has_size()]),
  )
  matroid_dim_eq_card_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, SUBSET(b, s) && FINITE(b) && matroid_independent(m, b) && SUBSET(s, matroid_span(m, b)) → matroid_dim(m, s) == CARD(b)"),
      t974,
    ),
  )
}

///|
let matroid_dim_eq_card_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_EQ_CARD_GEN",
)

///|
/// `MATROID_DIM_EQ_CARD_GEN`
pub fn matroid_dim_eq_card_gen() -> @kernel.Thm {
  matroid_dim_eq_card_gen_c.get()
}

///|
/// MATROID_DIM_EQ_CARD
fn step_131() -> Unit raise {
  let t975 = @meson.meson_tac(
    @list.List([
      matroid_dim_eq_card_gen(),
      matroid_independent_imp_subset(),
      @sets.subset_refl(),
      matroid_span_superset(),
    ]),
  )
  matroid_dim_eq_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, FINITE(b) && matroid_independent(m, b) → matroid_dim(m, b) == CARD(b)"),
      t975,
    ),
  )
}

///|
let matroid_dim_eq_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_EQ_CARD",
)

///|
/// `MATROID_DIM_EQ_CARD`
pub fn matroid_dim_eq_card() -> @kernel.Thm {
  matroid_dim_eq_card_c.get()
}

///|
/// MATROID_DIMENSION_LE
fn step_132() -> Unit raise {
  let t991 = @meson.asm_meson_tac(
    @list.List([@sets.finite_subset(), @sets.subset_trans()]),
  )
  let t990 = @simp.asm_rewrite_tac(@list.List([matroid_spanning_alt()]))
  let t989 = @simp.asm_rewrite_tac(
    @list.List([matroid_basis(), @sets.has_size()]),
  )
  let t988 = @tactics.exists_tac(@term_syntax.parse_term("(c : (A) -> Bool)"))
  let t987 = @tactics.match_mp_tac(matroid_dimension_unique())
  let t985 = @meson.asm_meson_tac(
    @list.List([@sets.card_subset(), @arith.le_trans()]),
  )
  let t986 = @list.List([@tactics.match_mp_tac(@arith.eq_imp_le()), t985])
  let t983 = @term_syntax.parse_term("CARD((c : (A) -> Bool))")
  let t984 = @tactics.trans_tac(@arith.le_trans())(t983)
  let t982 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t979 = @drule.match_mp(matroid_subset_contains_basis())
  let t981 = @tactics.first_assum(fn(
    x980 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x976 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s977 = @tactics.mp_tac(x976)
      fn(
        x978 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s977(x978)
      }
    })(t979(x980))
  })
  let t992 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.strip_tac),
                      t981,
                    ),
                    t982,
                  ),
                  t984,
                ),
                @tactics.conj_tac,
              ),
              t986,
            ),
            t987,
          ),
          t988,
        ),
        t989,
      ),
      t990,
    ),
    t991,
  )
  matroid_dimension_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, ∀ n : Num, SUBSET(b, matroid_set(m)) && SUBSET(matroid_set(m), matroid_span(m, b)) && FINITE(b) && CARD(b) <= n → matroid_dimension(m) <= n"),
      t992,
    ),
  )
}

///|
let matroid_dimension_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_LE",
)

///|
/// `MATROID_DIMENSION_LE`
pub fn matroid_dimension_le() -> @kernel.Thm {
  matroid_dimension_le_c.get()
}

///|
/// MATROID_DIMENSION_FINITE_LE
fn step_133() -> Unit raise {
  let t993 = @meson.meson_tac(
    @list.List([matroid_dimension_le(), matroid_finite_dimensional_v1()]),
  )
  matroid_dimension_finite_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, ∀ n : Num, SUBSET(b, matroid_set(m)) && SUBSET(matroid_set(m), matroid_span(m, b)) && FINITE(b) && CARD(b) <= n → matroid_finite_dimensional(m) && matroid_dimension(m) <= n"),
      t993,
    ),
  )
}

///|
let matroid_dimension_finite_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_FINITE_LE",
)

///|
/// `MATROID_DIMENSION_FINITE_LE`
pub fn matroid_dimension_finite_le() -> @kernel.Thm {
  matroid_dimension_finite_le_c.get()
}

///|
/// MATROID_DIM_LE
fn step_134() -> Unit raise {
  let t1013 = @simp.asm_simp_tac(@list.List([matroid_span_superset()]))
  let t1010 = @term_syntax.parse_term("(c : (A) -> Bool)")
  let t1011 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1012 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1011, t1010]),
      matroid_dim_eq_card_gen(),
    ),
  )
  let t1009 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.strip_tac,
  ])
  let t1006 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1007 = @term_syntax.parse_term("(c : (A) -> Bool)")
  let t1008 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1007, t1006]),
      matroid_independent_card_le_span_finite(),
    ),
  )
  let t1005 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(c : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1001 = @drule.match_mp(matroid_subset_contains_basis())
  let t1003 = @tactics.first_assum(fn(
    x1002 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x998 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s999 = @tactics.mp_tac(x998)
      fn(
        x1000 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s999(x1000)
      }
    })(t1001(x1002))
  })
  let t1004 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_span_subset(), @sets.subset_trans()]),
    ),
    t1003,
  ])
  let t997 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((s : (A) -> Bool), matroid_set((m : Matroid[A])))"),
    fn(
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
    },
  )
  let t1014 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.repeat_tac(@tactics.strip_tac),
                    t997,
                  ),
                  t1004,
                ),
                t1005,
              ),
              t1008,
            ),
            @tactics.ants_tac,
          ),
          t1009,
        ),
        t1012,
      ),
      t1013,
    ),
    @int.asm_arith_tac,
  )
  matroid_dim_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, ∀ n : Num, FINITE(b) && CARD(b) <= n && SUBSET(b, matroid_set(m)) && SUBSET(s, matroid_span(m, b)) → matroid_dim(m, s) <= n"),
      t1014,
    ),
  )
}

///|
let matroid_dim_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATROID_DIM_LE")

///|
/// `MATROID_DIM_LE`
pub fn matroid_dim_le() -> @kernel.Thm {
  matroid_dim_le_c.get()
}

///|
/// MATROID_DIM_FINITE_LE
fn step_135() -> Unit raise {
  let t1015 = @meson.meson_tac(
    @list.List([matroid_dim_le(), matroid_finite_dim_v1()]),
  )
  matroid_dim_finite_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, ∀ n : Num, FINITE(b) && CARD(b) <= n && SUBSET(b, matroid_set(m)) && SUBSET(s, matroid_span(m, b)) → matroid_finite_dim(m, s) && matroid_dim(m, s) <= n"),
      t1015,
    ),
  )
}

///|
let matroid_dim_finite_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_FINITE_LE",
)

///|
/// `MATROID_DIM_FINITE_LE`
pub fn matroid_dim_finite_le() -> @kernel.Thm {
  matroid_dim_finite_le_c.get()
}

///|
/// MATROID_DIM_LE_CARD_GEN
fn step_136() -> Unit raise {
  let t1016 = @meson.meson_tac(
    @list.List([matroid_dim_le(), @arith.le_refl(), @sets.has_size()]),
  )
  matroid_dim_le_card_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, FINITE(b) && SUBSET(b, matroid_set(m)) && SUBSET(s, matroid_span(m, b)) → matroid_dim(m, s) <= CARD(b)"),
      t1016,
    ),
  )
}

///|
let matroid_dim_le_card_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_LE_CARD_GEN",
)

///|
/// `MATROID_DIM_LE_CARD_GEN`
pub fn matroid_dim_le_card_gen() -> @kernel.Thm {
  matroid_dim_le_card_gen_c.get()
}

///|
/// MATROID_DIM_LE_CARD
fn step_137() -> Unit raise {
  let t1017 = @meson.meson_tac(
    @list.List([matroid_dim_le_card_gen(), matroid_span_superset()]),
  )
  matroid_dim_le_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, FINITE(s) && SUBSET(s, matroid_set(m)) → matroid_dim(m, s) <= CARD(s)"),
      t1017,
    ),
  )
}

///|
let matroid_dim_le_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_LE_CARD",
)

///|
/// `MATROID_DIM_LE_CARD`
pub fn matroid_dim_le_card() -> @kernel.Thm {
  matroid_dim_le_card_c.get()
}

///|
/// MATROID_DIMENSION_GE_FINITE_CARD
fn step_138() -> Unit raise {
  let t1018 = @meson.asm_meson_tac(
    @list.List([
      matroid_independent_card_le_span_finite(),
      matroid_basis(),
      matroid_finite_dimensional_basis(),
      matroid_spanning(),
      matroid_independent_imp_subset(),
      matroid_dimension_eq_card(),
    ]),
  )
  matroid_dimension_ge_finite_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, matroid_finite_dimensional(m) && matroid_independent(m, b) → FINITE(b) && CARD(b) <= matroid_dimension(m)"),
      t1018,
    ),
  )
}

///|
let matroid_dimension_ge_finite_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_GE_FINITE_CARD",
)

///|
/// `MATROID_DIMENSION_GE_FINITE_CARD`
pub fn matroid_dimension_ge_finite_card() -> @kernel.Thm {
  matroid_dimension_ge_finite_card_c.get()
}

///|
/// MATROID_DIMENSION_GE
fn step_139() -> Unit raise {
  let t1019 = @meson.meson_tac(
    @list.List([matroid_dimension_ge_finite_card(), @arith.le_trans()]),
  )
  matroid_dimension_ge_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, ∀ n : Num, matroid_finite_dimensional(m) && matroid_independent(m, b) && n <= CARD(b) → n <= matroid_dimension(m)"),
      t1019,
    ),
  )
}

///|
let matroid_dimension_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_GE",
)

///|
/// `MATROID_DIMENSION_GE`
pub fn matroid_dimension_ge() -> @kernel.Thm {
  matroid_dimension_ge_c.get()
}

///|
/// MATROID_DIMENSION_GE_CARD
fn step_140() -> Unit raise {
  let t1020 = @meson.meson_tac(@list.List([matroid_dimension_ge_finite_card()]))
  matroid_dimension_ge_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ b : (A) -> Bool, matroid_finite_dimensional(m) && matroid_independent(m, b) → CARD(b) <= matroid_dimension(m)"),
      t1020,
    ),
  )
}

///|
let matroid_dimension_ge_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIMENSION_GE_CARD",
)

///|
/// `MATROID_DIMENSION_GE_CARD`
pub fn matroid_dimension_ge_card() -> @kernel.Thm {
  matroid_dimension_ge_card_c.get()
}

///|
/// MATROID_DIM_GE_FINITE_CARD
fn step_141() -> Unit raise {
  let t1023 = @meson.asm_meson_tac(
    @list.List([
      matroid_finite_dim(),
      matroid_independent_submatroid(),
      matroid_span_superset(),
      @sets.subset_trans(),
    ]),
  )
  let t1022 = @tactics.match_mp_tac(matroid_dimension_ge_finite_card())
  let t1021 = @simp.rewrite_tac(@list.List([matroid_dim()]))
  let t1024 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.strip_tac,
        ),
        t1021,
      ),
      t1022,
    ),
    t1023,
  )
  matroid_dim_ge_finite_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, matroid_finite_dim(m, s) && matroid_independent(m, b) && SUBSET(b, s) → FINITE(b) && CARD(b) <= matroid_dim(m, s)"),
      t1024,
    ),
  )
}

///|
let matroid_dim_ge_finite_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_GE_FINITE_CARD",
)

///|
/// `MATROID_DIM_GE_FINITE_CARD`
pub fn matroid_dim_ge_finite_card() -> @kernel.Thm {
  matroid_dim_ge_finite_card_c.get()
}

///|
/// MATROID_DIM_GE
fn step_142() -> Unit raise {
  let t1025 = @meson.meson_tac(
    @list.List([matroid_dim_ge_finite_card(), @arith.le_trans()]),
  )
  matroid_dim_ge_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, ∀ n : Num, matroid_finite_dim(m, s) && matroid_independent(m, b) && SUBSET(b, s) && n <= CARD(b) → n <= matroid_dim(m, s)"),
      t1025,
    ),
  )
}

///|
let matroid_dim_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATROID_DIM_GE")

///|
/// `MATROID_DIM_GE`
pub fn matroid_dim_ge() -> @kernel.Thm {
  matroid_dim_ge_c.get()
}

///|
/// MATROID_DIM_GE_CARD_GEN
fn step_143() -> Unit raise {
  let t1026 = @meson.meson_tac(
    @list.List([matroid_dim_ge_finite_card(), @arith.le_trans()]),
  )
  matroid_dim_ge_card_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ b : (A) -> Bool, matroid_finite_dim(m, s) && matroid_independent(m, b) && SUBSET(b, s) → CARD(b) <= matroid_dim(m, s)"),
      t1026,
    ),
  )
}

///|
let matroid_dim_ge_card_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_GE_CARD_GEN",
)

///|
/// `MATROID_DIM_GE_CARD_GEN`
pub fn matroid_dim_ge_card_gen() -> @kernel.Thm {
  matroid_dim_ge_card_gen_c.get()
}

///|
/// MATROID_DIM_GE_CARD
fn step_144() -> Unit raise {
  let t1027 = @meson.meson_tac(
    @list.List([matroid_dim_ge_card_gen(), @sets.subset_refl()]),
  )
  matroid_dim_ge_card_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) && matroid_independent(m, s) → CARD(s) <= matroid_dim(m, s)"),
      t1027,
    ),
  )
}

///|
let matroid_dim_ge_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_GE_CARD",
)

///|
/// `MATROID_DIM_GE_CARD`
pub fn matroid_dim_ge_card() -> @kernel.Thm {
  matroid_dim_ge_card_c.get()
}

///|
/// FINITE_IMP_MATROID_FINITE_DIM_SPAN
fn step_145() -> Unit raise {
  let t1028 = @meson.meson_tac(
    @list.List([matroid_finite_dim_span(), finite_imp_matroid_finite_dim()]),
  )
  finite_imp_matroid_finite_dim_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, FINITE(s) && SUBSET(s, matroid_set(m)) → matroid_finite_dim(m, matroid_span(m, s))"),
      t1028,
    ),
  )
}

///|
let finite_imp_matroid_finite_dim_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_IMP_MATROID_FINITE_DIM_SPAN",
)

///|
/// `FINITE_IMP_MATROID_FINITE_DIM_SPAN`
pub fn finite_imp_matroid_finite_dim_span() -> @kernel.Thm {
  finite_imp_matroid_finite_dim_span_c.get()
}

///|
/// MATROID_INDEPENDENT_IMP_FINITE
fn step_146() -> Unit raise {
  let t1029 = @meson.meson_tac(
    @list.List([matroid_dim_ge_finite_card(), @sets.subset_refl()]),
  )
  matroid_independent_imp_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, matroid_finite_dim(m, s) && matroid_independent(m, s) → FINITE(s)"),
      t1029,
    ),
  )
}

///|
let matroid_independent_imp_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_INDEPENDENT_IMP_FINITE",
)

///|
/// `MATROID_INDEPENDENT_IMP_FINITE`
pub fn matroid_independent_imp_finite() -> @kernel.Thm {
  matroid_independent_imp_finite_c.get()
}

///|
let matroid_dim_eq_finite_card_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_EQ_FINITE_CARD_EQ",
)

///|
/// `MATROID_DIM_EQ_FINITE_CARD_EQ`
pub fn matroid_dim_eq_finite_card_eq() -> @kernel.Thm {
  matroid_dim_eq_finite_card_eq_c.get()
}

///|
let matroid_dim_ge_finite_card_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_GE_FINITE_CARD_EQ",
)

///|
/// `MATROID_DIM_GE_FINITE_CARD_EQ`
pub fn matroid_dim_ge_finite_card_eq() -> @kernel.Thm {
  matroid_dim_ge_finite_card_eq_c.get()
}

///|
/// MATROID_DIM_EQ_FINITE_CARD_EQ, MATROID_DIM_GE_FINITE_CARD_EQ
fn step_147() -> Unit raise {
  let t1046 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_superset(),
      @sets.subset(),
      @sets.psubset(),
      @sets.finite_subset(),
      @sets.card_psubset(),
      @arith.not_lt(),
      @arith.le_trans(),
    ]),
  )
  let t1043 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1044 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1045 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1044, t1043]),
      matroid_dim_le_card_gen(),
    ),
  )
  let t1042 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1041 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t1040 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t1038 = @simp.asm_simp_tac(
    @list.List([
      matroid_basis_submatroid(),
      matroid_spanning_submatroid(),
      matroid_span_superset(),
    ]),
  )
  let t1036 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1037 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("submatroid((m : Matroid[A]), (s : (A) -> Bool))"), t1036]),
      matroid_basis_eq_minimal_spanning(),
    ),
  )
  let t1034 = @tactics.then_tac(
    @tactics.strip_tac,
    @simp.asm_simp_tac(@list.List([finite_imp_matroid_finite_dim()])),
  )
  let t1035 = @list.List([
    @meson.meson_tac(
      @list.List([
        matroid_finite_dim_imp_subset(),
        matroid_independent_imp_finite(),
        @sets.subset_refl(),
        matroid_dim_eq_card(),
      ]),
    ),
    t1034,
  ])
  let t1033 = @simp.simp_tac(@list.List([@arith.le_refl()]))
  let t1032 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((p : Bool) → (q : Bool)) && ((r : Bool) → p) && (q → r) → p == r && q == r"),
    ),
  )
  let t1031 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1047 = @tactics.then_tac(
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
                          @simp.rewrite_tac(
                            @list.List([@theorems.and_forall_thm()]),
                          ),
                          t1031,
                        ),
                        t1032,
                      ),
                      t1033,
                    ),
                    @tactics.conj_tac,
                  ),
                  t1035,
                ),
                t1037,
              ),
              t1038,
            ),
            t1040,
          ),
          t1041,
        ),
        t1042,
      ),
      t1045,
    ),
    t1046,
  )
  let t1048 = (
    @term_syntax.parse_term("(∀ m : Matroid[A], ∀ s : (A) -> Bool, (SUBSET(s, matroid_set(m)) && FINITE(s) && matroid_dim(m, s) == CARD(s)) == (matroid_finite_dim(m, s) && matroid_independent(m, s))) && (∀ m : Matroid[A], ∀ s : (A) -> Bool, (SUBSET(s, matroid_set(m)) && FINITE(s) && CARD(s) <= matroid_dim(m, s)) == (matroid_finite_dim(m, s) && matroid_independent(m, s)))"),
    t1047,
  )
  let (matroid_dim_eq_finite_card_eq, matroid_dim_ge_finite_card_eq) = @bool.conj_pair(
    (fn(
      x1030 : (
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
      @tactics.prove(x1030.0, x1030.1)
    })(t1048),
  )
  matroid_dim_eq_finite_card_eq_c.set(matroid_dim_eq_finite_card_eq)
  matroid_dim_ge_finite_card_eq_c.set(matroid_dim_ge_finite_card_eq)
}

///|
/// MATROID_DIM_EMPTY
fn step_148() -> Unit raise {
  let t1050 = @simp.rewrite_tac(
    @list.List([
      matroid_independent_empty(),
      @sets.has_size(),
      @sets.finite_rules(),
      @sets.card_clauses(),
      @sets.empty_subset(),
    ]),
  )
  let t1049 = @tactics.exists_tac(@term_syntax.parse_term("({} : (A) -> Bool)"))
  let t1051 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(matroid_dim_unique()),
      ),
      t1049,
    ),
    t1050,
  )
  matroid_dim_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], matroid_dim(m, {}) == 0"),
      t1051,
    ),
  )
}

///|
let matroid_dim_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_EMPTY",
)

///|
/// `MATROID_DIM_EMPTY`
pub fn matroid_dim_empty() -> @kernel.Thm {
  matroid_dim_empty_c.get()
}

///|
/// MATROID_DIM_INSERT
fn step_149() -> Unit raise {
  let t1080 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1081 = @tactics.then_tac(
    @tactics.match_mp_tac(matroid_span_mono()),
    t1080,
  )
  let t1082 = @list.List([
    @simp.asm_simp_tac(@list.List([matroid_span_superset()])),
    t1081,
  ])
  let t1078 = @term_syntax.parse_term("matroid_span((m : Matroid[A]), (b : (A) -> Bool))")
  let t1079 = @tactics.trans_tac(@sets.subset_trans())(t1078)
  let t1076 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1077 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(matroid_span_inc()), t1076),
    @tactics.all_tac,
  ])
  let t1074 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1075 = @list.List([
    @meson.asm_meson_tac(@list.List([matroid_span_superset(), @sets.subset()])),
    t1074,
  ])
  let t1073 = @simp.asm_rewrite_tac(@list.List([]))
  let t1072 = @simp.asm_simp_tac(
    @list.List([@sets.card_clauses(), @sets.insert_subset()]),
  )
  let t1071 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t1070 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.has_size(),
      @sets.finite_insert(),
      matroid_independent_insert(),
    ]),
  )
  let t1069 = @tactics.exists_tac(@term_syntax.parse_term("INSERT((x : A), (b : (A) -> Bool))"))
  let t1068 = @tactics.match_mp_tac(matroid_dim_unique())
  let t1067 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (A) -> Bool)"))
  let t1066 = @simp.asm_rewrite_tac(
    @list.List([@theorems.left_imp_exists_thm(), @sets.has_size()]),
  )
  let t1062 = @simp.gen_rewrite_rule(
    fn(
      x1061 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1061
    },
    @list.List([matroid_contains_basis_dim()]),
  )
  let t1064 = @tactics.first_assum(fn(
    x1063 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1058 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1059 = @tactics.mp_tac(x1058)
      fn(
        x1060 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1059(x1060)
      }
    })(t1062(x1063))
  })
  let t1065 = @list.List([
    @meson.asm_meson_tac(
      @list.List([
        matroid_span_insert_refl(),
        matroid_span_dim_eq(),
        @sets.insert_subset(),
        matroid_span_subset(),
        @sets.subset(),
      ]),
    ),
    t1064,
  ])
  let t1055 = @drule.match_mp(matroid_finite_dim_imp_subset())
  let t1057 = @tactics.first_assum(fn(
    x1056 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1052 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1053 = @tactics.assume_tac(x1052)
      fn(
        x1054 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1053(x1054)
      }
    })(t1055(x1056))
  })
  let t1083 = @tactics.thenl(
    @tactics.then_tac(
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
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.repeat_tac(
                                            @tactics.strip_tac,
                                          ),
                                          t1057,
                                        ),
                                        @class.cond_cases_tac,
                                      ),
                                      t1065,
                                    ),
                                    t1066,
                                  ),
                                  t1067,
                                ),
                                @tactics.strip_tac,
                              ),
                              t1068,
                            ),
                            t1069,
                          ),
                          t1070,
                        ),
                        @tactics.conj_tac,
                      ),
                      t1071,
                    ),
                    t1072,
                  ),
                  @class.cond_cases_tac,
                ),
                t1073,
              ),
              t1075,
            ),
            @tactics.conj_tac,
          ),
          t1077,
        ),
        t1079,
      ),
      @tactics.conj_tac,
    ),
    t1082,
  )
  matroid_dim_insert_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ x : A, matroid_finite_dim(m, s) && IN(x, matroid_set(m)) → matroid_dim(m, INSERT(x, s)) == (if IN(x, matroid_span(m, s)) { matroid_dim(m, s) } else { matroid_dim(m, s) + 1 })"),
      t1083,
    ),
  )
}

///|
let matroid_dim_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_INSERT",
)

///|
/// `MATROID_DIM_INSERT`
pub fn matroid_dim_insert() -> @kernel.Thm {
  matroid_dim_insert_c.get()
}

///|
/// MATROID_DIM_SUBSET
fn step_150() -> Unit raise {
  let t1105 = @tactics.asm_tac(@sets.set_tac)(
    @list.List([matroid_dim_span(), matroid_span_superset()]),
  )
  let t1104 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t1102 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t1103 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1102]),
      matroid_dim_span(),
    ),
  )
  let t1100 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1101 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1100]),
      matroid_dim_eq_card(),
    ),
  )
  let t1096 = @term_syntax.parse_term("CARD((b : (A) -> Bool))")
  let t1097 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1098 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1099 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Matroid[A])"), t1098, t1097, t1096]),
      matroid_dim_finite_le(),
    ),
  )
  let t1095 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1091 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1092 = @tactics.assume_tac(x1091)
        fn(
          x1093 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1092(x1093)
        }
      },
      @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(fn(
        x1094 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        @tactics.strip_assume_tac(@equal.gsym(x1094))
      }),
    ),
  )
  let t1088 = @simp.gen_rewrite_rule(
    fn(
      x1087 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1087
    },
    @list.List([matroid_finite_dim_basis()]),
  )
  let t1090 = @tactics.first_x_assum(fn(
    x1089 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1084 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1085 = @tactics.mp_tac(x1084)
      fn(
        x1086 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1085(x1086)
      }
    })(t1088(x1089))
  })
  let t1106 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1090),
              t1095,
            ),
            t1099,
          ),
          t1101,
        ),
        t1103,
      ),
      t1104,
    ),
    t1105,
  )
  matroid_dim_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, t) && matroid_finite_dim(m, t) → matroid_dim(m, s) <= matroid_dim(m, t)"),
      t1106,
    ),
  )
}

///|
let matroid_dim_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SUBSET",
)

///|
/// `MATROID_DIM_SUBSET`
pub fn matroid_dim_subset() -> @kernel.Thm {
  matroid_dim_subset_c.get()
}

///|
/// MATROID_DIM_SUBSET_ALT
fn step_151() -> Unit raise {
  let t1107 = @meson.meson_tac(
    @list.List([
      matroid_dim_subset(),
      matroid_finite_dim_span(),
      matroid_dim_span(),
      matroid_finite_dim_imp_subset(),
    ]),
  )
  matroid_dim_subset_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_span(m, t)) && matroid_finite_dim(m, t) → matroid_dim(m, s) <= matroid_dim(m, t)"),
      t1107,
    ),
  )
}

///|
let matroid_dim_subset_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SUBSET_ALT",
)

///|
/// `MATROID_DIM_SUBSET_ALT`
pub fn matroid_dim_subset_alt() -> @kernel.Thm {
  matroid_dim_subset_alt_c.get()
}

///|
/// MATROID_DIM_SPAN_SUBSET
fn step_152() -> Unit raise {
  let t1108 = @meson.meson_tac(
    @list.List([
      matroid_span_minimal(),
      matroid_dim_span(),
      matroid_dim_subset_alt(),
      matroid_finite_dim_imp_subset(),
    ]),
  )
  matroid_dim_span_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && SUBSET(matroid_span(m, s), matroid_span(m, t)) && matroid_finite_dim(m, t) → matroid_dim(m, s) <= matroid_dim(m, t)"),
      t1108,
    ),
  )
}

///|
let matroid_dim_span_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SPAN_SUBSET",
)

///|
/// `MATROID_DIM_SPAN_SUBSET`
pub fn matroid_dim_span_subset() -> @kernel.Thm {
  matroid_dim_span_subset_c.get()
}

///|
/// MATROID_DIM_SPAN_PSUBSET
fn step_153() -> Unit raise {
  let t1141 = @meson.asm_meson_tac(
    @list.List([matroid_span_superset(), @sets.subset_trans()]),
  )
  let t1140 = @simp.asm_simp_tac(
    @list.List([matroid_finite_dim_span(), @sets.insert_subset()]),
  )
  let t1139 = @tactics.match_mp_tac(matroid_dim_subset())
  let t1138 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([matroid_dim_span(), @arith.le_refl()])),
  ])
  let t1136 = @term_syntax.parse_term("matroid_dim((m : Matroid[A]), matroid_span(m, (t : (A) -> Bool)))")
  let t1137 = @tactics.trans_tac(@arith.le_trans())(t1136)
  let t1135 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        matroid_dim_insert(),
        @int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1")),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1133 = @term_syntax.parse_term("matroid_dim((m : Matroid[A]), INSERT((a : A), (s : (A) -> Bool)))")
  let t1134 = @tactics.trans_tac(@arith.lte_trans())(t1133)
  let t1132 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([matroid_span_subset(), @sets.subset()])),
  ])
  let t1131 = @class.asm_cases_tac(@term_syntax.parse_term("IN((a : A), matroid_set((m : Matroid[A])))"))
  let t1130 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_finite_dim_span(), matroid_finite_dim_mono()]),
    ),
    @tactics.all_tac,
  ])
  let t1129 = @tactics.subgoal_then(
    @term_syntax.parse_term("matroid_finite_dim((m : Matroid[A]), (s : (A) -> Bool))"),
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
  )
  let t1125 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1122 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1123 = @tactics.assume_tac(x1122)
        fn(
          x1124 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1123(x1124)
        }
      },
      @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(
        @tactics.strip_assume_tac,
      ),
    ),
  )
  let t1119 = @simp.gen_rewrite_rule(
    fn(
      x1118 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1118
    },
    @list.List([@sets.psubset_alt()]),
  )
  let t1121 = @tactics.first_x_assum(fn(
    x1120 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1115 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1116 = @tactics.mp_tac(x1115)
      fn(
        x1117 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1116(x1117)
      }
    })(t1119(x1120))
  })
  let t1112 = @drule.match_mp(matroid_finite_dim_imp_subset())
  let t1114 = @tactics.first_assum(fn(
    x1113 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1109 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1110 = @tactics.assume_tac(x1109)
      fn(
        x1111 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1110(x1111)
      }
    })(t1112(x1113))
  })
  let t1142 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
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
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.strip_tac),
                                  t1114,
                                ),
                                t1121,
                              ),
                              t1125,
                            ),
                            t1129,
                          ),
                          t1130,
                        ),
                        t1131,
                      ),
                      t1132,
                    ),
                    t1134,
                  ),
                  @tactics.conj_tac,
                ),
                t1135,
              ),
              t1137,
            ),
            @tactics.conj_tac,
          ),
          t1138,
        ),
        t1139,
      ),
      t1140,
    ),
    t1141,
  )
  matroid_dim_span_psubset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && PSUBSET(matroid_span(m, s), matroid_span(m, t)) && matroid_finite_dim(m, t) → matroid_dim(m, s) < matroid_dim(m, t)"),
      t1142,
    ),
  )
}

///|
let matroid_dim_span_psubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SPAN_PSUBSET",
)

///|
/// `MATROID_DIM_SPAN_PSUBSET`
pub fn matroid_dim_span_psubset() -> @kernel.Thm {
  matroid_dim_span_psubset_c.get()
}

///|
/// MATROID_DIM_SPAN_EQ_GEN
fn step_154() -> Unit raise {
  let t1143 = @meson.meson_tac(
    @list.List([matroid_dim_span_psubset(), @sets.psubset(), @arith.not_lt()]),
  )
  matroid_dim_span_eq_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && matroid_finite_dim(m, t) && SUBSET(matroid_span(m, s), matroid_span(m, t)) && matroid_dim(m, t) <= matroid_dim(m, s) → matroid_span(m, s) == matroid_span(m, t)"),
      t1143,
    ),
  )
}

///|
let matroid_dim_span_eq_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SPAN_EQ_GEN",
)

///|
/// `MATROID_DIM_SPAN_EQ_GEN`
pub fn matroid_dim_span_eq_gen() -> @kernel.Thm {
  matroid_dim_span_eq_gen_c.get()
}

///|
/// MATROID_DIM_SPAN_EQ
fn step_155() -> Unit raise {
  let t1144 = @meson.meson_tac(
    @list.List([matroid_dim_span_psubset(), @sets.psubset(), @arith.lt_refl()]),
  )
  matroid_dim_span_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(s, matroid_set(m)) && matroid_finite_dim(m, t) && SUBSET(matroid_span(m, s), matroid_span(m, t)) && matroid_dim(m, s) == matroid_dim(m, t) → matroid_span(m, s) == matroid_span(m, t)"),
      t1144,
    ),
  )
}

///|
let matroid_dim_span_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_SPAN_EQ",
)

///|
/// `MATROID_DIM_SPAN_EQ`
pub fn matroid_dim_span_eq() -> @kernel.Thm {
  matroid_dim_span_eq_c.get()
}

///|
/// MATROID_DIM_EQ_SPAN
fn step_156() -> Unit raise {
  let t1146 = @meson.asm_meson_tac(
    @list.List([
      matroid_span_mono(),
      matroid_finite_dim_imp_subset(),
      @sets.subset(),
    ]),
  )
  let t1145 = @tactics.match_mp_tac(matroid_dim_span_eq_gen())
  let t1147 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1145),
    t1146,
  )
  matroid_dim_eq_span_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, matroid_finite_dim(m, t) && SUBSET(s, t) && matroid_dim(m, t) <= matroid_dim(m, s) → matroid_span(m, s) == matroid_span(m, t)"),
      t1147,
    ),
  )
}

///|
let matroid_dim_eq_span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_DIM_EQ_SPAN",
)

///|
/// `MATROID_DIM_EQ_SPAN`
pub fn matroid_dim_eq_span() -> @kernel.Thm {
  matroid_dim_eq_span_c.get()
}

///|
/// MATROID_CHOOSE_SUBSET
fn step_157() -> Unit raise {
  let t1156 = @meson.asm_meson_tac(
    @list.List([
      matroid_finite_dim_basis(),
      matroid_span_dim_eq(),
      @sets.subset(),
    ]),
  )
  let t1155 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(matroid_dim_eq_card())]),
  )
  let t1154 = @list.List([
    @tactics.disch_tac,
    @meson.asm_meson_tac(
      @list.List([matroid_independent_mono(), @sets.subset()]),
    ),
  ])
  let t1152 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1153 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1152]),
      @sets.choose_subset_strong(),
    ),
  )
  let t1148 = @drule.match_mp(matroid_subset_contains_basis())
  let t1149 = @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t1151 = @tactics.first_assum(fn(
    x1150 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1149(t1148(x1150))
  })
  let t1157 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1151),
            t1153,
          ),
          @tactics.ants_tac,
        ),
        t1154,
      ),
      t1155,
    ),
    t1156,
  )
  matroid_choose_subset_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ n : Num, SUBSET(s, matroid_set(m)) && (matroid_finite_dim(m, s) → n <= matroid_dim(m, s)) → (∃ t : (A) -> Bool, SUBSET(t, s) && matroid_independent(m, t) && HAS_SIZE(t, n))"),
      t1157,
    ),
  )
}

///|
let matroid_choose_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_CHOOSE_SUBSET",
)

///|
/// `MATROID_CHOOSE_SUBSET`
pub fn matroid_choose_subset() -> @kernel.Thm {
  matroid_choose_subset_c.get()
}

///|
/// MATROID_CHOOSE_SUBSPACE
fn step_158() -> Unit raise {
  let t1170 = @simp.asm_simp_tac(
    @list.List([
      matroid_subspace_span(),
      matroid_span_mono(),
      matroid_dim_eq_card(),
      matroid_finite_dim_span(),
      matroid_dim_span(),
      finite_imp_matroid_finite_dim(),
    ]),
  )
  let t1169 = @list.List([
    @tactics.asm_tac(@sets.set_tac)(@list.List([])),
    @tactics.all_tac,
  ])
  let t1168 = @tactics.subgoal_then(
    @term_syntax.parse_term("SUBSET((b : (A) -> Bool), matroid_set((m : Matroid[A])))"),
    fn(
      x1165 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1166 = @tactics.assume_tac(x1165)
      fn(
        x1167 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1166(x1167)
      }
    },
  )
  let t1164 = @tactics.exists_tac(
    @term_syntax.parse_term("matroid_span((m : Matroid[A]), (b : (A) -> Bool))"),
  )
  let t1161 = @drule.match_mp(matroid_choose_subset())
  let t1158 = @simp.rewrite_rule(@list.List([@sets.has_size()]))
  let t1159 = @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t1163 = @tactics.first_assum(fn(
    x1162 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1160 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      t1159(t1158(x1160))
    })(t1161(x1162))
  })
  let t1171 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @tactics.disch_tac,
            ),
            t1163,
          ),
          t1164,
        ),
        t1168,
      ),
      t1169,
    ),
    t1170,
  )
  matroid_choose_subspace_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ n : Num, SUBSET(s, matroid_set(m)) && (matroid_finite_dim(m, s) → n <= matroid_dim(m, s)) → (∃ t : (A) -> Bool, matroid_subspace(m, t) && SUBSET(t, matroid_span(m, s)) && matroid_finite_dim(m, t) && matroid_dim(m, t) == n)"),
      t1171,
    ),
  )
}

///|
let matroid_choose_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_CHOOSE_SUBSPACE",
)

///|
/// `MATROID_CHOOSE_SUBSPACE`
pub fn matroid_choose_subspace() -> @kernel.Thm {
  matroid_choose_subspace_c.get()
}

///|
/// MATROID_LOWDIM_EXPAND_BASIS
fn step_159() -> Unit raise {
  let t1205 = @meson.asm_meson_tac(
    @list.List([matroid_span_mono(), @sets.subset(), matroid_basis_imp_subset()]),
  )
  let t1206 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_basis(), matroid_independent_mono()]),
    ),
    t1205,
  ])
  let t1204 = @simp.asm_rewrite_tac(@list.List([]))
  let t1203 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (A) -> Bool)"))
  let t1207 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@theorems.mono_exists()),
            t1203,
          ),
          @tactics.strip_tac,
        ),
        t1204,
      ),
      @tactics.conj_tac,
    ),
    t1206,
  )
  let t1201 = @meson.asm_meson_tac(
    @list.List([matroid_dimension_unique(), @sets.has_size()]),
  )
  let t1202 = @list.List([
    @meson.asm_meson_tac(
      @list.List([matroid_finite_dimensional(), matroid_basis()]),
    ),
    t1201,
  ])
  let t1200 = @tactics.then_tac(
    @tactics.disch_tac,
    @tactics.first_x_assum(fn(
      x1199 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x1192 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1193 = @tactics.mp_tac(x1192)
        fn(
          x1194 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1193(x1194)
        }
      })(
        ((x1198 : @kernel.Thm) => {
          @lib.check(
            fn(x1197 : @kernel.Thm) -> Bool raise {
              (fn(x1195 : @kernel.Term) -> Bool raise { @basics.is_imp(x1195) })(
                (fn(x1196 : @kernel.Thm) -> @kernel.Term raise {
                  @kernel.concl(x1196)
                })(x1197),
              )
            },
            x1198,
          )
        })(x1199),
      )
    }),
  )
  let t1208 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.conj_tac,
          @list.List([
            @meson.asm_meson_tac(
              @list.List([
                matroid_dim_eq_card(),
                matroid_span_dim_eq(),
                @sets.subset(),
              ]),
            ),
            t1200,
          ]),
        ),
        @tactics.ants_tac,
      ),
      t1202,
    ),
    t1207,
  ])
  let t1191 = @simp.asm_rewrite_tac(@list.List([]))
  let t1188 = @term_syntax.parse_term("(d : (A) -> Bool)")
  let t1189 = @term_syntax.parse_term("(b : (A) -> Bool)")
  let t1190 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t1189, t1188]),
      @sets.choose_subset_between(),
    ),
  )
  let t1184 = @drule.match_mp(matroid_independent_extends_to_basis())
  let t1185 = @tactics.x_choose_then(@term_syntax.parse_term("(d : (A) -> Bool)"))(
    @tactics.strip_assume_tac,
  )
  let t1187 = @tactics.first_assum(fn(
    x1186 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1185(t1184(x1186))
  })
  let t1183 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(b : (A) -> Bool)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1179 = @simp.gen_rewrite_rule(
    fn(
      x1178 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1178
    },
    @list.List([matroid_finite_dim_basis()]),
  )
  let t1180 = @tactics.conjuncts_then2(
    fn(
      x1172 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1173 = @tactics.assume_tac(x1172)
      fn(
        x1174 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1173(x1174)
      }
    },
    fn(
      x1175 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1176 = @tactics.mp_tac(x1175)
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
  )
  let t1182 = @tactics.first_assum(fn(
    x1181 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t1180(t1179(x1181))
  })
  let t1209 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1182),
              t1183,
            ),
            t1187,
          ),
          t1190,
        ),
        t1191,
      ),
      @tactics.ants_tac,
    ),
    t1208,
  )
  matroid_lowdim_expand_basis_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ n : Num, matroid_finite_dim(m, s) && matroid_dim(m, s) <= n && (matroid_finite_dimensional(m) → n <= matroid_dimension(m)) → (∃ b : (A) -> Bool, HAS_SIZE(b, n) && matroid_independent(m, b) && SUBSET(matroid_span(m, s), matroid_span(m, b)))"),
      t1209,
    ),
  )
}

///|
let matroid_lowdim_expand_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_LOWDIM_EXPAND_BASIS",
)

///|
/// `MATROID_LOWDIM_EXPAND_BASIS`
pub fn matroid_lowdim_expand_basis() -> @kernel.Thm {
  matroid_lowdim_expand_basis_c.get()
}

///|
/// MATROID_LOWDIM_EXPAND_DIMENSION
fn step_160() -> Unit raise {
  let t1219 = @simp.asm_simp_tac(
    @list.List([
      matroid_dim_eq_card(),
      finite_imp_matroid_finite_dim(),
      matroid_independent_imp_subset(),
    ]),
  )
  let t1218 = @simp.rewrite_tac(@list.List([@sets.has_size()]))
  let t1217 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t1216 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1213 = @drule.match_mp(matroid_lowdim_expand_basis())
  let t1215 = @tactics.first_assum(fn(
    x1214 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1210 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1211 = @tactics.mp_tac(x1210)
      fn(
        x1212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1211(x1212)
      }
    })(t1213(x1214))
  })
  let t1220 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.disch_tac,
              ),
              t1215,
            ),
            t1216,
          ),
          t1217,
        ),
        t1218,
      ),
      @tactics.strip_tac,
    ),
    t1219,
  )
  matroid_lowdim_expand_dimension_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Matroid[A], ∀ s : (A) -> Bool, ∀ n : Num, matroid_finite_dim(m, s) && matroid_dim(m, s) <= n && (matroid_finite_dimensional(m) → n <= matroid_dimension(m)) → (∃ t : (A) -> Bool, matroid_finite_dim(m, t) && matroid_dim(m, t) == n && SUBSET(matroid_span(m, s), matroid_span(m, t)))"),
      t1220,
    ),
  )
}

///|
let matroid_lowdim_expand_dimension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATROID_LOWDIM_EXPAND_DIMENSION",
)

///|
/// `MATROID_LOWDIM_EXPAND_DIMENSION`
pub fn matroid_lowdim_expand_dimension() -> @kernel.Thm {
  matroid_lowdim_expand_dimension_c.get()
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
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
}
