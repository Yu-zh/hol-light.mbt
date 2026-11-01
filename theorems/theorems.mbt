// Translated from upstream theorems.ml; edit this file directly.

///|
/// EQ_REFL
fn step_1() -> Unit raise {
  let t1 = @tactics.then_tac(@tactics.gen_tac, @tactics.refl_tac)
  eq_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, x == x"), t1))
}

///|
let eq_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_REFL")

///|
/// `EQ_REFL`
pub fn eq_refl() -> @kernel.Thm {
  eq_refl_c.get()
}

///|
/// REFL_CLAUSE
fn step_2() -> Unit raise {
  let t2 = @tactics.then_tac(
    @tactics.gen_tac,
    @tactics.match_accept_tac(@bool.eqt_intro(@bool.spec_all(eq_refl()))),
  )
  refl_clause_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, (x == x) == true"), t2),
  )
}

///|
let refl_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFL_CLAUSE")

///|
/// `REFL_CLAUSE`
pub fn refl_clause() -> @kernel.Thm {
  refl_clause_c.get()
}

///|
/// EQ_SYM
fn step_3() -> Unit raise {
  let t7 = @tactics.disch_then(fn(
    x6 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x3 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s4 = @tactics.accept_tac(x3)
      fn(
        x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s4(x5)
      }
    })(@equal.sym(x6))
  })
  let t8 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t7)
  eq_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ y : A, x == y → y == x"), t8),
  )
}

///|
let eq_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_SYM")

///|
/// `EQ_SYM`
pub fn eq_sym() -> @kernel.Thm {
  eq_sym_c.get()
}

///|
/// EQ_SYM_EQ
fn step_4() -> Unit raise {
  let t9 = @tactics.match_accept_tac(eq_sym())
  let t10 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t9,
  )
  eq_sym_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ y : A, (x == y) == (y == x)"), t10),
  )
}

///|
let eq_sym_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_SYM_EQ")

///|
/// `EQ_SYM_EQ`
pub fn eq_sym_eq() -> @kernel.Thm {
  eq_sym_eq_c.get()
}

///|
/// EQ_TRANS
fn step_5() -> Unit raise {
  let t11 = @simp.pure_asm_rewrite_tac(@list.List([]))
  let t12 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t11),
    @tactics.refl_tac,
  )
  eq_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ y : A, ∀ z : A, x == y && y == z → x == z"),
      t12,
    ),
  )
}

///|
let eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_TRANS")

///|
/// `EQ_TRANS`
pub fn eq_trans() -> @kernel.Thm {
  eq_trans_c.get()
}

///|
/// `AC`
pub fn ac(x13 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let acsuite = x13
  let t15 = @simp.pure_rewrite_conv(@list.List([acsuite, refl_clause()]))
  fn(x16 : @kernel.Term) -> @kernel.Thm raise { @bool.eqt_elim(t15(x16)) }
}

///|
/// BETA_THM
fn step_6() -> Unit raise {
  let t17 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.beta_tac),
    @tactics.refl_tac,
  )
  beta_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ y : A, ((x : A) => f(x))(y) == f(y)"),
      t17,
    ),
  )
}

///|
let beta_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETA_THM")

///|
/// `BETA_THM`
pub fn beta_thm() -> @kernel.Thm {
  beta_thm_c.get()
}

///|
/// ABS_SIMP
fn step_7() -> Unit raise {
  let t18 = @simp.rewrite_tac(@list.List([beta_thm(), refl_clause()]))
  let t19 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t18)
  abs_simp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ t1 : A, ∀ t2 : B, ((x : B) => t1)(t2) == t1"), t19),
  )
}

///|
let abs_simp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_SIMP")

///|
/// `ABS_SIMP`
pub fn abs_simp() -> @kernel.Thm {
  abs_simp_c.get()
}

///|
/// CONJ_ASSOC
fn step_8() -> Unit raise {
  conj_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 && t2 && t3) == ((t1 && t2) && t3)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let conj_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_ASSOC")

///|
/// `CONJ_ASSOC`
pub fn conj_assoc() -> @kernel.Thm {
  conj_assoc_c.get()
}

///|
/// CONJ_SYM
fn step_9() -> Unit raise {
  conj_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 && t2) == (t2 && t1)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let conj_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_SYM")

///|
/// `CONJ_SYM`
pub fn conj_sym() -> @kernel.Thm {
  conj_sym_c.get()
}

///|
/// CONJ_ACI
fn step_10() -> Unit raise {
  conj_aci_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((p : Bool) && (q : Bool)) == (q && p) && ((p && q) && (r : Bool)) == (p && q && r) && (p && q && r) == (q && p && r) && (p && p) == p && (p && p && q) == (p && q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let conj_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_ACI")

///|
/// `CONJ_ACI`
pub fn conj_aci() -> @kernel.Thm {
  conj_aci_c.get()
}

///|
/// DISJ_ASSOC
fn step_11() -> Unit raise {
  disj_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, ∀ t3 : Bool, (t1 || t2 || t3) == ((t1 || t2) || t3)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let disj_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJ_ASSOC")

///|
/// `DISJ_ASSOC`
pub fn disj_assoc() -> @kernel.Thm {
  disj_assoc_c.get()
}

///|
/// DISJ_SYM
fn step_12() -> Unit raise {
  disj_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (t1 || t2) == (t2 || t1)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let disj_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJ_SYM")

///|
/// `DISJ_SYM`
pub fn disj_sym() -> @kernel.Thm {
  disj_sym_c.get()
}

///|
/// DISJ_ACI
fn step_13() -> Unit raise {
  disj_aci_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((p : Bool) || (q : Bool)) == (q || p) && ((p || q) || (r : Bool)) == (p || q || r) && (p || q || r) == (q || p || r) && (p || p) == p && (p || p || q) == (p || q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let disj_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJ_ACI")

///|
/// `DISJ_ACI`
pub fn disj_aci() -> @kernel.Thm {
  disj_aci_c.get()
}

///|
/// IMP_CONJ
fn step_14() -> Unit raise {
  imp_conj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((p : Bool) && (q : Bool) → (r : Bool)) == (p → q → r)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let imp_conj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_CONJ")

///|
/// `IMP_CONJ`
pub fn imp_conj() -> @kernel.Thm {
  imp_conj_c.get()
}

///|
/// IMP_IMP
fn step_15() -> Unit raise {
  imp_imp_c.set(@equal.gsym(imp_conj()))
}

///|
let imp_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_IMP")

///|
/// `IMP_IMP`
pub fn imp_imp() -> @kernel.Thm {
  imp_imp_c.get()
}

///|
/// IMP_CONJ_ALT
fn step_16() -> Unit raise {
  imp_conj_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((p : Bool) && (q : Bool) → (r : Bool)) == (q → p → r)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let imp_conj_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_CONJ_ALT")

///|
/// `IMP_CONJ_ALT`
pub fn imp_conj_alt() -> @kernel.Thm {
  imp_conj_alt_c.get()
}

///|
/// LEFT_OR_DISTRIB
fn step_17() -> Unit raise {
  left_or_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Bool, ∀ q : Bool, ∀ r : Bool, (p && (q || r)) == (p && q || p && r)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_or_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_OR_DISTRIB",
)

///|
/// `LEFT_OR_DISTRIB`
pub fn left_or_distrib() -> @kernel.Thm {
  left_or_distrib_c.get()
}

///|
/// RIGHT_OR_DISTRIB
fn step_18() -> Unit raise {
  right_or_distrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Bool, ∀ q : Bool, ∀ r : Bool, ((p || q) && r) == (p && r || q && r)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_or_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_OR_DISTRIB",
)

///|
/// `RIGHT_OR_DISTRIB`
pub fn right_or_distrib() -> @kernel.Thm {
  right_or_distrib_c.get()
}

///|
/// FORALL_SIMP
fn step_19() -> Unit raise {
  forall_simp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ t : Bool, (∀ x : A, t) == t"), @itab.itaut_tac),
  )
}

///|
let forall_simp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_SIMP")

///|
/// `FORALL_SIMP`
pub fn forall_simp() -> @kernel.Thm {
  forall_simp_c.get()
}

///|
/// EXISTS_SIMP
fn step_20() -> Unit raise {
  exists_simp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ t : Bool, (∃ x : A, t) == t"), @itab.itaut_tac),
  )
}

///|
let exists_simp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_SIMP")

///|
/// `EXISTS_SIMP`
pub fn exists_simp() -> @kernel.Thm {
  exists_simp_c.get()
}

///|
/// EQ_IMP
fn step_21() -> Unit raise {
  eq_imp_c.set(@itab.itaut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → a → b")))
}

///|
let eq_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_IMP")

///|
/// `EQ_IMP`
pub fn eq_imp() -> @kernel.Thm {
  eq_imp_c.get()
}

///|
/// EQ_CLAUSES
fn step_22() -> Unit raise {
  eq_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : Bool, (true == t) == t && (t == true) == t && (false == t) == !t && (t == false) == !t"),
      @itab.itaut_tac,
    ),
  )
}

///|
let eq_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_CLAUSES")

///|
/// `EQ_CLAUSES`
pub fn eq_clauses() -> @kernel.Thm {
  eq_clauses_c.get()
}

///|
/// NOT_CLAUSES_WEAK
fn step_23() -> Unit raise {
  not_clauses_weak_c.set(
    @tactics.prove(
      @term_syntax.parse_term("!true == false && !false == true"),
      @itab.itaut_tac,
    ),
  )
}

///|
let not_clauses_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_CLAUSES_WEAK",
)

///|
/// `NOT_CLAUSES_WEAK`
pub fn not_clauses_weak() -> @kernel.Thm {
  not_clauses_weak_c.get()
}

///|
/// AND_CLAUSES
fn step_24() -> Unit raise {
  and_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : Bool, (true && t) == t && (t && true) == t && (false && t) == false && (t && false) == false && (t && t) == t"),
      @itab.itaut_tac,
    ),
  )
}

///|
let and_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_CLAUSES")

///|
/// `AND_CLAUSES`
pub fn and_clauses() -> @kernel.Thm {
  and_clauses_c.get()
}

///|
/// OR_CLAUSES
fn step_25() -> Unit raise {
  or_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : Bool, (true || t) == true && (t || true) == true && (false || t) == t && (t || false) == t && (t || t) == t"),
      @itab.itaut_tac,
    ),
  )
}

///|
let or_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_CLAUSES")

///|
/// `OR_CLAUSES`
pub fn or_clauses() -> @kernel.Thm {
  or_clauses_c.get()
}

///|
/// IMP_CLAUSES
fn step_26() -> Unit raise {
  imp_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : Bool, (true → t) == t && (t → true) == true && (false → t) == true && (t → t) == true && (t → false) == !t"),
      @itab.itaut_tac,
    ),
  )
}

///|
let imp_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP_CLAUSES")

///|
/// `IMP_CLAUSES`
pub fn imp_clauses() -> @kernel.Thm {
  imp_clauses_c.get()
}

///|
/// theorems.ml:159
fn step_27() -> Unit raise {
  let t20 = @simp.rewrite_tac(
    @list.List([@bool.eqt_intro(@bool.spec_all(eq_refl())), imp_clauses()]),
  )
  let imp_eq_clause = @tactics.prove(
    @term_syntax.parse_term("((x : _) == x → (p : Bool)) == p"),
    t20,
  )
  @simp.extend_basic_rewrites(
    @list.List([
      refl_clause(),
      eq_clauses(),
      not_clauses_weak(),
      and_clauses(),
      or_clauses(),
      imp_clauses(),
      forall_simp(),
      exists_simp(),
      beta_thm(),
      imp_eq_clause,
    ]),
  )
}

///|
/// theorems.ml:174
fn step_28() -> Unit raise {
  @simp.extend_basic_congs(
    @list.List([
      @itab.itaut(
        @term_syntax.parse_term("(p : Bool) == (p' : Bool) → (p' → (q : Bool) == (q' : Bool)) → (p → q) == (p' → q')"),
      ),
    ]),
  )
}

///|
/// EXISTS_UNIQUE_THM
fn step_29() -> Unit raise {
  let t21 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(@list.List([@bool.exists_unique_def()])),
  )
  exists_unique_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, existsunique((x : A) => P(x)) == ((∃ x : A, P(x)) && (∀ x : A, ∀ x' : A, P(x) && P(x') → x == x'))"),
      t21,
    ),
  )
}

///|
let exists_unique_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_UNIQUE_THM",
)

///|
/// `EXISTS_UNIQUE_THM`
pub fn exists_unique_thm() -> @kernel.Thm {
  exists_unique_thm_c.get()
}

///|
/// EXISTS_REFL
fn step_30() -> Unit raise {
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.exists_tac(@term_syntax.parse_term("(a : A)")),
    ),
    @tactics.refl_tac,
  )
  exists_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : A, ∃ x : A, x == a"), t22))
}

///|
let exists_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_REFL")

///|
/// `EXISTS_REFL`
pub fn exists_refl() -> @kernel.Thm {
  exists_refl_c.get()
}

///|
/// EXISTS_UNIQUE_REFL
fn step_31() -> Unit raise {
  let t24 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(a : A)")), t24])
  let t23 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.eq_tac, @tactics.strip_tac),
  )
  let t26 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([exists_unique_thm()])),
        ),
        t23,
      ),
      t25,
    ),
    @tactics.refl_tac,
  )
  exists_unique_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, existsunique((x : A) => x == a)"), t26),
  )
}

///|
let exists_unique_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_UNIQUE_REFL",
)

///|
/// `EXISTS_UNIQUE_REFL`
pub fn exists_unique_refl() -> @kernel.Thm {
  exists_unique_refl_c.get()
}

///|
/// UNWIND_THM1
fn step_32() -> Unit raise {
  let t36 = @tactics.try_tac(
    @tactics.first_assum(fn(
      x33 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s34 = @tactics.match_accept_tac(x33)
      fn(
        x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s34(x35)
      }
    }),
  )
  let t37 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @tactics.exists_tac(@term_syntax.parse_term("(a : A)")),
        ),
        @tactics.conj_tac,
      ),
      t36,
    ),
    @tactics.refl_tac,
  )
  let t38 = @list.List([
    @tactics.disch_then(
      @tactics.choose_then(
        @tactics.conjuncts_then2(
          fn(
            x27 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s28 = @tactics.subst1_tac(x27)
            fn(
              x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s28(x29)
            }
          },
          fn(
            x30 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s31 = @tactics.accept_tac(x30)
            fn(
              x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s31(x32)
            }
          },
        ),
      ),
    ),
    t37,
  ])
  let t39 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t38,
  )
  unwind_thm1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ a : A, (∃ x : A, a == x && P(x)) == P(a)"),
      t39,
    ),
  )
}

///|
let unwind_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNWIND_THM1")

///|
/// `UNWIND_THM1`
pub fn unwind_thm1() -> @kernel.Thm {
  unwind_thm1_c.get()
}

///|
/// UNWIND_THM2
fn step_33() -> Unit raise {
  let t41 = @tactics.match_accept_tac(unwind_thm1())
  let t40 = @tactics.conv_tac(
    @equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)),
  )
  let t42 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t40),
    t41,
  )
  unwind_thm2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ a : A, (∃ x : A, x == a && P(x)) == P(a)"),
      t42,
    ),
  )
}

///|
let unwind_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNWIND_THM2")

///|
/// `UNWIND_THM2`
pub fn unwind_thm2() -> @kernel.Thm {
  unwind_thm2_c.get()
}

///|
/// FORALL_UNWIND_THM2
fn step_34() -> Unit raise {
  let t54 = @simp.asm_rewrite_tac(@list.List([]))
  let t53 = @tactics.disch_then(fn(
    x50 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s51 = @tactics.subst1_tac(x50)
    fn(
      x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s51(x52)
    }
  })
  let t55 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.disch_tac, @tactics.gen_tac),
      t53,
    ),
    t54,
  )
  let t49 = @simp.rewrite_tac(@list.List([]))
  let t46 = @term_syntax.parse_term("(a : A)")
  let t56 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x48 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x43 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s44 = @tactics.mp_tac(x43)
          fn(
            x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s44(x45)
          }
        })(((x47 : @kernel.Thm) => @bool.spec(t46, x47))(x48))
      }),
      t49,
    ),
    t55,
  ])
  let t57 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t56,
  )
  forall_unwind_thm2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ a : A, (∀ x : A, x == a → P(x)) == P(a)"),
      t57,
    ),
  )
}

///|
let forall_unwind_thm2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_UNWIND_THM2",
)

///|
/// `FORALL_UNWIND_THM2`
pub fn forall_unwind_thm2() -> @kernel.Thm {
  forall_unwind_thm2_c.get()
}

///|
/// FORALL_UNWIND_THM1
fn step_35() -> Unit raise {
  let t59 = @tactics.match_accept_tac(forall_unwind_thm2())
  let t58 = @tactics.conv_tac(
    @equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)),
  )
  let t60 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t58),
    t59,
  )
  forall_unwind_thm1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ a : A, (∀ x : A, a == x → P(x)) == P(a)"),
      t60,
    ),
  )
}

///|
let forall_unwind_thm1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_UNWIND_THM1",
)

///|
/// `FORALL_UNWIND_THM1`
pub fn forall_unwind_thm1() -> @kernel.Thm {
  forall_unwind_thm1_c.get()
}

///|
/// SWAP_FORALL_THM
fn step_36() -> Unit raise {
  swap_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, ∀ y : B, P(x, y)) == (∀ y : B, ∀ x : A, P(x, y))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let swap_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_FORALL_THM",
)

///|
/// `SWAP_FORALL_THM`
pub fn swap_forall_thm() -> @kernel.Thm {
  swap_forall_thm_c.get()
}

///|
/// SWAP_EXISTS_THM
fn step_37() -> Unit raise {
  swap_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ x : A, ∃ y : B, P(x, y)) == (∃ y : B, ∃ x : A, P(x, y))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let swap_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SWAP_EXISTS_THM",
)

///|
/// `SWAP_EXISTS_THM`
pub fn swap_exists_thm() -> @kernel.Thm {
  swap_exists_thm_c.get()
}

///|
/// FORALL_AND_THM
fn step_38() -> Unit raise {
  forall_and_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, (∀ x : A, P(x) && Q(x)) == ((∀ x : A, P(x)) && (∀ x : A, Q(x)))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let forall_and_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_AND_THM")

///|
/// `FORALL_AND_THM`
pub fn forall_and_thm() -> @kernel.Thm {
  forall_and_thm_c.get()
}

///|
/// AND_FORALL_THM
fn step_39() -> Unit raise {
  and_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ((∀ x : A, P(x)) && (∀ x : A, Q(x))) == (∀ x : A, P(x) && Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let and_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_FORALL_THM")

///|
/// `AND_FORALL_THM`
pub fn and_forall_thm() -> @kernel.Thm {
  and_forall_thm_c.get()
}

///|
/// LEFT_AND_FORALL_THM
fn step_40() -> Unit raise {
  left_and_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∀ x : A, P(x)) && Q) == (∀ x : A, P(x) && Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_and_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_AND_FORALL_THM",
)

///|
/// `LEFT_AND_FORALL_THM`
pub fn left_and_forall_thm() -> @kernel.Thm {
  left_and_forall_thm_c.get()
}

///|
/// RIGHT_AND_FORALL_THM
fn step_41() -> Unit raise {
  right_and_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P && (∀ x : A, Q(x))) == (∀ x : A, P && Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_and_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_AND_FORALL_THM",
)

///|
/// `RIGHT_AND_FORALL_THM`
pub fn right_and_forall_thm() -> @kernel.Thm {
  right_and_forall_thm_c.get()
}

///|
/// EXISTS_OR_THM
fn step_42() -> Unit raise {
  exists_or_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, (∃ x : A, P(x) || Q(x)) == ((∃ x : A, P(x)) || (∃ x : A, Q(x)))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let exists_or_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_OR_THM")

///|
/// `EXISTS_OR_THM`
pub fn exists_or_thm() -> @kernel.Thm {
  exists_or_thm_c.get()
}

///|
/// OR_EXISTS_THM
fn step_43() -> Unit raise {
  or_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ((∃ x : A, P(x)) || (∃ x : A, Q(x))) == (∃ x : A, P(x) || Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let or_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR_EXISTS_THM")

///|
/// `OR_EXISTS_THM`
pub fn or_exists_thm() -> @kernel.Thm {
  or_exists_thm_c.get()
}

///|
/// LEFT_OR_EXISTS_THM
fn step_44() -> Unit raise {
  left_or_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∃ x : A, P(x)) || Q) == (∃ x : A, P(x) || Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_or_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_OR_EXISTS_THM",
)

///|
/// `LEFT_OR_EXISTS_THM`
pub fn left_or_exists_thm() -> @kernel.Thm {
  left_or_exists_thm_c.get()
}

///|
/// RIGHT_OR_EXISTS_THM
fn step_45() -> Unit raise {
  right_or_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || (∃ x : A, Q(x))) == (∃ x : A, P || Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_or_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_OR_EXISTS_THM",
)

///|
/// `RIGHT_OR_EXISTS_THM`
pub fn right_or_exists_thm() -> @kernel.Thm {
  right_or_exists_thm_c.get()
}

///|
/// LEFT_EXISTS_AND_THM
fn step_46() -> Unit raise {
  left_exists_and_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (∃ x : A, P(x) && Q) == ((∃ x : A, P(x)) && Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_exists_and_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_EXISTS_AND_THM",
)

///|
/// `LEFT_EXISTS_AND_THM`
pub fn left_exists_and_thm() -> @kernel.Thm {
  left_exists_and_thm_c.get()
}

///|
/// RIGHT_EXISTS_AND_THM
fn step_47() -> Unit raise {
  right_exists_and_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (∃ x : A, P && Q(x)) == (P && (∃ x : A, Q(x)))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_exists_and_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_EXISTS_AND_THM",
)

///|
/// `RIGHT_EXISTS_AND_THM`
pub fn right_exists_and_thm() -> @kernel.Thm {
  right_exists_and_thm_c.get()
}

///|
/// TRIV_EXISTS_AND_THM
fn step_48() -> Unit raise {
  triv_exists_and_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (∃ x : A, P && Q) == ((∃ x : A, P) && (∃ x : A, Q))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_exists_and_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_EXISTS_AND_THM",
)

///|
/// `TRIV_EXISTS_AND_THM`
pub fn triv_exists_and_thm() -> @kernel.Thm {
  triv_exists_and_thm_c.get()
}

///|
/// LEFT_AND_EXISTS_THM
fn step_49() -> Unit raise {
  left_and_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∃ x : A, P(x)) && Q) == (∃ x : A, P(x) && Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_and_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_AND_EXISTS_THM",
)

///|
/// `LEFT_AND_EXISTS_THM`
pub fn left_and_exists_thm() -> @kernel.Thm {
  left_and_exists_thm_c.get()
}

///|
/// RIGHT_AND_EXISTS_THM
fn step_50() -> Unit raise {
  right_and_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P && (∃ x : A, Q(x))) == (∃ x : A, P && Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_and_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_AND_EXISTS_THM",
)

///|
/// `RIGHT_AND_EXISTS_THM`
pub fn right_and_exists_thm() -> @kernel.Thm {
  right_and_exists_thm_c.get()
}

///|
/// TRIV_AND_EXISTS_THM
fn step_51() -> Unit raise {
  triv_and_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, ((∃ x : A, P) && (∃ x : A, Q)) == (∃ x : A, P && Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_and_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_AND_EXISTS_THM",
)

///|
/// `TRIV_AND_EXISTS_THM`
pub fn triv_and_exists_thm() -> @kernel.Thm {
  triv_and_exists_thm_c.get()
}

///|
/// TRIV_FORALL_OR_THM
fn step_52() -> Unit raise {
  triv_forall_or_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (∀ x : A, P || Q) == ((∀ x : A, P) || (∀ x : A, Q))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_forall_or_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_FORALL_OR_THM",
)

///|
/// `TRIV_FORALL_OR_THM`
pub fn triv_forall_or_thm() -> @kernel.Thm {
  triv_forall_or_thm_c.get()
}

///|
/// TRIV_OR_FORALL_THM
fn step_53() -> Unit raise {
  triv_or_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, ((∀ x : A, P) || (∀ x : A, Q)) == (∀ x : A, P || Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_or_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_OR_FORALL_THM",
)

///|
/// `TRIV_OR_FORALL_THM`
pub fn triv_or_forall_thm() -> @kernel.Thm {
  triv_or_forall_thm_c.get()
}

///|
/// RIGHT_IMP_FORALL_THM
fn step_54() -> Unit raise {
  right_imp_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → (∀ x : A, Q(x))) == (∀ x : A, P → Q(x))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_imp_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_IMP_FORALL_THM",
)

///|
/// `RIGHT_IMP_FORALL_THM`
pub fn right_imp_forall_thm() -> @kernel.Thm {
  right_imp_forall_thm_c.get()
}

///|
/// RIGHT_FORALL_IMP_THM
fn step_55() -> Unit raise {
  right_forall_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (∀ x : A, P → Q(x)) == (P → (∀ x : A, Q(x)))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let right_forall_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_FORALL_IMP_THM",
)

///|
/// `RIGHT_FORALL_IMP_THM`
pub fn right_forall_imp_thm() -> @kernel.Thm {
  right_forall_imp_thm_c.get()
}

///|
/// LEFT_IMP_EXISTS_THM
fn step_56() -> Unit raise {
  left_imp_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∃ x : A, P(x)) → Q) == (∀ x : A, P(x) → Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_imp_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_IMP_EXISTS_THM",
)

///|
/// `LEFT_IMP_EXISTS_THM`
pub fn left_imp_exists_thm() -> @kernel.Thm {
  left_imp_exists_thm_c.get()
}

///|
/// LEFT_FORALL_IMP_THM
fn step_57() -> Unit raise {
  left_forall_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (∀ x : A, P(x) → Q) == ((∃ x : A, P(x)) → Q)"),
      @itab.itaut_tac,
    ),
  )
}

///|
let left_forall_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_FORALL_IMP_THM",
)

///|
/// `LEFT_FORALL_IMP_THM`
pub fn left_forall_imp_thm() -> @kernel.Thm {
  left_forall_imp_thm_c.get()
}

///|
/// TRIV_FORALL_IMP_THM
fn step_58() -> Unit raise {
  triv_forall_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (∀ x : A, P → Q) == ((∃ x : A, P) → (∀ x : A, Q))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_forall_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_FORALL_IMP_THM",
)

///|
/// `TRIV_FORALL_IMP_THM`
pub fn triv_forall_imp_thm() -> @kernel.Thm {
  triv_forall_imp_thm_c.get()
}

///|
/// TRIV_EXISTS_IMP_THM
fn step_59() -> Unit raise {
  triv_exists_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (∃ x : A, P → Q) == ((∀ x : A, P) → (∃ x : A, Q))"),
      @itab.itaut_tac,
    ),
  )
}

///|
let triv_exists_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TRIV_EXISTS_IMP_THM",
)

///|
/// `TRIV_EXISTS_IMP_THM`
pub fn triv_exists_imp_thm() -> @kernel.Thm {
  triv_exists_imp_thm_c.get()
}

///|
/// MONO_AND
fn step_60() -> Unit raise {
  mono_and_c.set(
    @itab.itaut(
      @term_syntax.parse_term("((A : Bool) → (B : Bool)) && ((C : Bool) → (D : Bool)) → A && C → B && D"),
    ),
  )
}

///|
let mono_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_AND")

///|
/// `MONO_AND`
pub fn mono_and() -> @kernel.Thm {
  mono_and_c.get()
}

///|
/// MONO_OR
fn step_61() -> Unit raise {
  mono_or_c.set(
    @itab.itaut(
      @term_syntax.parse_term("((A : Bool) → (B : Bool)) && ((C : Bool) → (D : Bool)) → A || C → B || D"),
    ),
  )
}

///|
let mono_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_OR")

///|
/// `MONO_OR`
pub fn mono_or() -> @kernel.Thm {
  mono_or_c.get()
}

///|
/// MONO_IMP
fn step_62() -> Unit raise {
  mono_imp_c.set(
    @itab.itaut(
      @term_syntax.parse_term("((B : Bool) → (A : Bool)) && ((C : Bool) → (D : Bool)) → (A → C) → B → D"),
    ),
  )
}

///|
let mono_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_IMP")

///|
/// `MONO_IMP`
pub fn mono_imp() -> @kernel.Thm {
  mono_imp_c.get()
}

///|
/// MONO_NOT
fn step_63() -> Unit raise {
  mono_not_c.set(@itab.itaut(@term_syntax.parse_term("((B : Bool) → (A : Bool)) → !A → !B")))
}

///|
let mono_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_NOT")

///|
/// `MONO_NOT`
pub fn mono_not() -> @kernel.Thm {
  mono_not_c.get()
}

///|
/// MONO_FORALL
fn step_64() -> Unit raise {
  let t62 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @tactics.first_assum(@tactics.match_mp_tac)
  let t63 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t61),
    t62,
  )
  mono_forall_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : A, (P : (A) -> Bool)(x) → (Q : (A) -> Bool)(x)) → (∀ x : A, P(x)) → (∀ x : A, Q(x))"),
      t63,
    ),
  )
}

///|
let mono_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_FORALL")

///|
/// `MONO_FORALL`
pub fn mono_forall() -> @kernel.Thm {
  mono_forall_c.get()
}

///|
/// MONO_EXISTS
fn step_65() -> Unit raise {
  let t68 = @simp.asm_rewrite_tac(@list.List([]))
  let t67 = @tactics.first_assum(@tactics.match_mp_tac)
  let t66 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t64 = @term_syntax.parse_term("(x : A)")
  let t69 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @tactics.disch_then((x65 : @kernel.Thm) => {
            @tactics.x_choose_tac(t64, x65)
          }),
        ),
        t66,
      ),
      t67,
    ),
    t68,
  )
  mono_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : A, (P : (A) -> Bool)(x) → (Q : (A) -> Bool)(x)) → (∃ x : A, P(x)) → (∃ x : A, Q(x))"),
      t69,
    ),
  )
}

///|
let mono_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_EXISTS")

///|
/// `MONO_EXISTS`
pub fn mono_exists() -> @kernel.Thm {
  mono_exists_c.get()
}

///|
/// WLOG_RELATION
fn step_66() -> Unit raise {
  let t81 = @simp.asm_simp_tac(@list.List([]))
  let t80 = @tactics.repeat_tac(
    @tactics.then_tac(@tactics.match_mp_tac(mono_forall()), @tactics.gen_tac),
  )
  let t79 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x70 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s71 = @tactics.assume_tac(x70)
        fn(
          x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s71(x72)
        }
      },
      @tactics.conjuncts_then2(
        fn(
          x73 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s74 = @tactics.mp_tac(x73)
          fn(
            x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s74(x75)
          }
        },
        fn(
          x76 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s77 = @tactics.assume_tac(x76)
          fn(
            x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s77(x78)
          }
        },
      ),
    ),
  )
  let t82 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t79),
        t80,
      ),
      @tactics.strip_tac,
    ),
    t81,
  )
  wlog_relation_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ P : (A, A) -> Bool, (∀ x : A, ∀ y : A, P(x, y) → P(y, x)) && (∀ x : A, ∀ y : A, R(x, y) || R(y, x)) && (∀ x : A, ∀ y : A, R(x, y) → P(x, y)) → (∀ x : A, ∀ y : A, P(x, y))"),
      t82,
    ),
  )
}

///|
let wlog_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WLOG_RELATION")

///|
/// `WLOG_RELATION`
pub fn wlog_relation() -> @kernel.Thm {
  wlog_relation_c.get()
}

///|
/// EXISTS_UNIQUE_ALT
fn step_67() -> Unit raise {
  let t108 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x107 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x104 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s105 = @tactics.subst1_tac(x104)
        fn(
          x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s105(x106)
        }
      })(@equal.sym(x107))
    }),
  )
  let t103 = @tactics.repeat_tac(@tactics.gen_tac)
  let t102 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(exists_refl())]))
  let t100 = @term_syntax.parse_term("(x : A)")
  let t109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then((x101 : @kernel.Thm) => {
            @tactics.x_choose_tac(t100, x101)
          }),
          t102,
        ),
        t103,
      ),
      t108,
    ),
    @tactics.refl_tac,
  )
  let t97 = @tactics.first_assum(fn(
    x94 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s95 = @tactics.match_accept_tac(x94)
    fn(
      x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s95(x96)
    }
  })
  let t98 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x93 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        let s91 = @tactics.subst1_tac(x90)
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
      })(@equal.sym(x93))
    }),
    t97,
  )
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t99 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_tac,
        @tactics.first_assum(@tactics.match_mp_tac),
      ),
      t89,
    ),
    t98,
  ])
  let t88 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t83 = @term_syntax.parse_term("(x : A)")
  let t110 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.conjuncts_then2(
                (x84 : @kernel.Thm) => @tactics.x_choose_tac(t83, x84),
                fn(
                  x85 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s86 = @tactics.assume_tac(x85)
                  fn(
                    x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s86(x87)
                  }
                },
              ),
            ),
            t88,
          ),
          @tactics.gen_tac,
        ),
        @tactics.eq_tac,
      ),
      t99,
    ),
    t109,
  ])
  let t111 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([exists_unique_thm()])),
      ),
      @tactics.eq_tac,
    ),
    t110,
  )
  exists_unique_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, existsunique((x : A) => P(x)) == (∃ x : A, ∀ y : A, P(y) == (x == y))"),
      t111,
    ),
  )
}

///|
let exists_unique_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_UNIQUE_ALT",
)

///|
/// `EXISTS_UNIQUE_ALT`
pub fn exists_unique_alt() -> @kernel.Thm {
  exists_unique_alt_c.get()
}

///|
/// EXISTS_UNIQUE
fn step_68() -> Unit raise {
  let t131 = @simp.rewrite_tac(@list.List([conj_aci()]))
  let t130 = @simp.rewrite_tac(
    @list.List([left_forall_imp_thm(), exists_refl()]),
  )
  let t129 = @simp.simp_tac(@list.List([]))
  let t128 = @simp.rewrite_tac(@list.List([forall_and_thm()]))
  let t127 = @simp.gen_rewrite_tac(
    fn(
      x126 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x120 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s121 = @equal.land_conv(x120)
        fn(x122 : @kernel.Term) -> @kernel.Thm raise { s121(x122) }
      })(
        (fn(
          x123 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s124 = @equal.once_depth_conv(x123)
          fn(x125 : @kernel.Term) -> @kernel.Thm raise { s124(x125) }
        })(x126),
      )
    },
    @list.List([eq_sym_eq()]),
  )
  let t119 = @simp.gen_rewrite_tac(
    fn(
      x118 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x112 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s113 = @equal.land_conv(x112)
        fn(x114 : @kernel.Term) -> @kernel.Thm raise { s113(x114) }
      })(
        (fn(
          x115 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s116 = @equal.binder_conv(x115)
          fn(x117 : @kernel.Term) -> @kernel.Thm raise { s116(x117) }
        })(x118),
      )
    },
    @list.List([
      @itab.itaut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == ((a → b) && (b → a))")),
    ]),
  )
  let t132 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @simp.rewrite_tac(@list.List([exists_unique_alt()])),
                  ),
                  @tactics.ap_term_tac,
                ),
                @tactics.abs_tac,
              ),
              t119,
            ),
            t127,
          ),
          t128,
        ),
        t129,
      ),
      t130,
    ),
    t131,
  )
  exists_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, existsunique((x : A) => P(x)) == (∃ x : A, P(x) && (∀ y : A, P(y) → y == x))"),
      t132,
    ),
  )
}

///|
let exists_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_UNIQUE")

///|
/// `EXISTS_UNIQUE`
pub fn exists_unique() -> @kernel.Thm {
  exists_unique_c.get()
}

///|
/// hand-ported (line 418)
fn step_69() -> Unit raise {
  destruct_setup()
}

///|
/// `CLAIM_TAC`
pub fn claim_tac(x133 : String, x134 : @kernel.Term) -> @tactics.Tactic raise {
  let s = x133
  let tm = x134
  @tactics.subgoal_then(tm, destruct_tac(s))
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
}
