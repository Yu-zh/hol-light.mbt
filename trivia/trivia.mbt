// Translated from upstream trivia.ml; edit this file directly.

///|
/// trivia.ml:16
fn step_1() -> Unit raise {
  @printer.parse_as_infix("o", (26L, "right"))
}

///|
/// o_DEF
fn step_2() -> Unit raise {
  o_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(o : ((B) -> C, (A) -> B, A) -> C)((f : (B) -> C), (g : (A) -> B)) == ((x : A) => f(g(x)))")),
  )
}

///|
let o_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("o_DEF")

///|
/// `o_DEF`
pub fn o_def() -> @kernel.Thm {
  o_def_c.get()
}

///|
/// I_DEF
fn step_3() -> Unit raise {
  i_def_c.set(@drule.new_definition(@term_syntax.parse_term("(I : (A) -> A) == ((x : A) => x)")))
}

///|
let i_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_DEF")

///|
/// `I_DEF`
pub fn i_def() -> @kernel.Thm {
  i_def_c.get()
}

///|
/// o_THM
fn step_4() -> Unit raise {
  let t2 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t3 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.pure_rewrite_tac(@list.List([o_def()])), t1),
      t2,
    ),
    @tactics.refl_tac,
  )
  o_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (B) -> C, ∀ g : (A) -> B, ∀ x : A, o(f, g, x) == f(g(x))"),
      t3,
    ),
  )
}

///|
let o_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("o_THM")

///|
/// `o_THM`
pub fn o_thm() -> @kernel.Thm {
  o_thm_c.get()
}

///|
/// o_ASSOC
fn step_5() -> Unit raise {
  let t5 = @tactics.conv_tac(@equal.redepth_conv(@equal.beta_conv))
  let t4 = @simp.rewrite_tac(@list.List([o_def()]))
  let t6 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4),
      t5,
    ),
    @tactics.refl_tac,
  )
  o_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (C) -> D, ∀ g : (B) -> C, ∀ h : (A) -> B, o(f, o(g, h)) == o(o(f, g), h)"),
      t6,
    ),
  )
}

///|
let o_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("o_ASSOC")

///|
/// `o_ASSOC`
pub fn o_assoc() -> @kernel.Thm {
  o_assoc_c.get()
}

///|
/// I_THM
fn step_6() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([i_def()]))
  i_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, I(x) == x"), t7))
}

///|
let i_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_THM")

///|
/// `I_THM`
pub fn i_thm() -> @kernel.Thm {
  i_thm_c.get()
}

///|
/// I_O_ID
fn step_7() -> Unit raise {
  let t8 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), o_def(), i_thm()]),
  )
  let t9 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t8)
  i_o_id_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, o(I, f) == f && o(f, I) == f"),
      t9,
    ),
  )
}

///|
let i_o_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_O_ID")

///|
/// `I_O_ID`
pub fn i_o_id() -> @kernel.Thm {
  i_o_id_c.get()
}

///|
/// EXISTS_ONE_REP
fn step_8() -> Unit raise {
  let t10 = @tactics.accept_tac(@bool.truth())
  let t11 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("true")),
      @tactics.beta_tac,
    ),
    t10,
  )
  exists_one_rep_c.set(@tactics.prove(@term_syntax.parse_term("∃ b : Bool, b"), t11))
}

///|
let exists_one_rep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_ONE_REP")

///|
/// `EXISTS_ONE_REP`
pub fn exists_one_rep() -> @kernel.Thm {
  exists_one_rep_c.get()
}

///|
/// one_tydef
fn step_9() -> Unit raise {
  one_tydef_c.set(
    @class.new_type_definition("1", ("one_ABS", "one_REP"), exists_one_rep()),
  )
}

///|
let one_tydef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_tydef")

///|
/// `one_tydef`
pub fn one_tydef() -> @kernel.Thm {
  one_tydef_c.get()
}

///|
/// one_DEF
fn step_10() -> Unit raise {
  one_def_c.set(@drule.new_definition(@term_syntax.parse_term("(one : Unit) == select((x : Unit) => true)")))
}

///|
let one_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_DEF")

///|
/// `one_DEF`
pub fn one_def() -> @kernel.Thm {
  one_def_c.get()
}

///|
/// one
fn step_11() -> Unit raise {
  let t15 = @simp.asm_rewrite_tac(@list.List([]))
  let t14 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct1(one_tydef()))]),
  )
  let t13 = @simp.rewrite_tac(@list.List([@bool.conjunct1(one_tydef())]))
  let t12 = @bool.conjunct2(one_tydef())
  let t16 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.mp_tac(
            @bool.gen_all(@bool.spec(@term_syntax.parse_term("one_REP((a : Unit))"), t12)),
          ),
          t13,
        ),
        @tactics.disch_tac,
      ),
      t14,
    ),
    t15,
  )
  one_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Unit, v == one"), t16))
}

///|
let one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one")

///|
/// `one`
pub fn one() -> @kernel.Thm {
  one_c.get()
}

///|
/// one_axiom
fn step_12() -> Unit raise {
  let t18 = @simp.once_rewrite_tac(@list.List([one()]))
  let t17 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t19 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t17),
        @tactics.gen_tac,
      ),
      t18,
    ),
    @tactics.refl_tac,
  )
  one_axiom_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Unit, ∀ g : (A) -> Unit, f == g"), t19))
}

///|
let one_axiom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_axiom")

///|
/// `one_axiom`
pub fn one_axiom() -> @kernel.Thm {
  one_axiom_c.get()
}

///|
/// one_INDUCT
fn step_13() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([]))
  let t21 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([one()])), t20)
  one_induct_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : (Unit) -> Bool, P(one) → (∀ x : Unit, P(x))"), t21),
  )
}

///|
let one_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_INDUCT")

///|
/// `one_INDUCT`
pub fn one_induct() -> @kernel.Thm {
  one_induct_c.get()
}

///|
/// one_RECURSION
fn step_14() -> Unit raise {
  let t22 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.exists_tac(@term_syntax.parse_term("(x : Unit) => (e : A)")),
      ),
      @tactics.beta_tac,
    ),
    @tactics.refl_tac,
  )
  one_recursion_c.set(
    @tactics.prove(@parser.parse_term("forall e:A. ?fn_. fn_ one = e"), t22),
  )
}

///|
let one_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_RECURSION")

///|
/// `one_RECURSION`
pub fn one_recursion() -> @kernel.Thm {
  one_recursion_c.get()
}

///|
/// one_Axiom
fn step_15() -> Unit raise {
  let t26 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @simp.once_rewrite_tac(@list.List([one()]))
  let t24 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t23 = @tactics.repeat_tac(@tactics.strip_tac)
  let t27 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(
              @list.List([@theorems.exists_unique_thm(), one_recursion()]),
            ),
          ),
          t23,
        ),
        t24,
      ),
      t25,
    ),
    t26,
  )
  one_axiom_v1_c.set(
    @tactics.prove(@parser.parse_term("forall e:A. ?!fn_. fn_ one = e"), t27),
  )
}

///|
let one_axiom_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_Axiom")

///|
/// `one_Axiom`
pub fn one_axiom_v1() -> @kernel.Thm {
  one_axiom_v1_c.get()
}

///|
/// FORALL_ONE_THM
fn step_16() -> Unit raise {
  let t31 = @tactics.disch_then(fn(
    x28 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s29 = @tactics.match_accept_tac(x28)
    fn(
      x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s29(x30)
    }
  })
  let t32 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.eq_tac,
      @simp.rewrite_tac(@list.List([one_induct()])),
    ),
    t31,
  )
  forall_one_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("(∀ x : Unit, (P : (Unit) -> Bool)(x)) == P(one)"), t32),
  )
}

///|
let forall_one_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_ONE_THM")

///|
/// `FORALL_ONE_THM`
pub fn forall_one_thm() -> @kernel.Thm {
  forall_one_thm_c.get()
}

///|
/// EXISTS_ONE_THM
fn step_17() -> Unit raise {
  let t34 = @simp.rewrite_tac(
    @list.List([@class.not_exists_thm(), forall_one_thm()]),
  )
  let t35 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x33 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x33
      },
      @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (!p == !q)"))]),
    ),
    t34,
  )
  exists_one_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("(∃ x : Unit, (P : (Unit) -> Bool)(x)) == P(one)"), t35),
  )
}

///|
let exists_one_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_ONE_THM")

///|
/// `EXISTS_ONE_THM`
pub fn exists_one_thm() -> @kernel.Thm {
  exists_one_thm_c.get()
}

///|
/// ETA_ONE
fn step_18() -> Unit raise {
  let t37 = @simp.once_rewrite_tac(@list.List([one()]))
  let t36 = @tactics.repeat_tac(@tactics.gen_tac)
  let t38 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
        t36,
      ),
      t37,
    ),
    @tactics.refl_tac,
  )
  eta_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ f : (Unit) -> A, ((x : Unit) => f(one)) == f"), t38),
  )
}

///|
let eta_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ETA_ONE")

///|
/// `ETA_ONE`
pub fn eta_one() -> @kernel.Thm {
  eta_one_c.get()
}

///|
/// trivia.ml:104
fn step_19() -> Unit raise {
  @class.inductive_type_store().val = @class.inductive_type_store().val.prepend(
    ("1", (1L, one_induct(), one_recursion())),
  )
  ()
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
}
