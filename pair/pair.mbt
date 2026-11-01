// Translated from upstream pair.ml; edit this file directly.

///|
/// LET_DEF
fn step_1() -> Unit raise {
  let_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(LET : ((A) -> B, A) -> B)((f : (A) -> B), (x : A)) == f(x)")),
  )
}

///|
let let_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_DEF")

///|
/// `LET_DEF`
pub fn let_def() -> @kernel.Thm {
  let_def_c.get()
}

///|
/// LET_END_DEF
fn step_2() -> Unit raise {
  let_end_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(LET_END : (A) -> A)((t : A)) == t")),
  )
}

///|
let let_end_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_END_DEF")

///|
/// `LET_END_DEF`
pub fn let_end_def() -> @kernel.Thm {
  let_end_def_c.get()
}

///|
/// GABS_DEF
fn step_3() -> Unit raise {
  gabs_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(GABS : ((A) -> Bool) -> A)((P : (A) -> Bool)) == select(P)")),
  )
}

///|
let gabs_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GABS_DEF")

///|
/// `GABS_DEF`
pub fn gabs_def() -> @kernel.Thm {
  gabs_def_c.get()
}

///|
/// GEQ_DEF
fn step_4() -> Unit raise {
  geq_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(GEQ : (A, A) -> Bool)((a : A), (b : A)) == (a == b)")),
  )
}

///|
let geq_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEQ_DEF")

///|
/// `GEQ_DEF`
pub fn geq_def() -> @kernel.Thm {
  geq_def_c.get()
}

///|
/// _SEQPATTERN
fn step_5() -> Unit raise {
  _seqpattern_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(_SEQPATTERN : ((A, B) -> Bool, (A, B) -> Bool, A, B) -> Bool) == ((r : (A, B) -> Bool) => (s : (A, B) -> Bool) => (x : A) => if (∃ y : B, r(x, y)) { r(x) } else { s(x) })"),
    ),
  )
}

///|
let _seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("_SEQPATTERN")

///|
/// `_SEQPATTERN`
pub fn _seqpattern() -> @kernel.Thm {
  _seqpattern_c.get()
}

///|
/// _UNGUARDED_PATTERN
fn step_6() -> Unit raise {
  _unguarded_pattern_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(_UNGUARDED_PATTERN : (Bool, Bool) -> Bool) == ((p : Bool) => (r : Bool) => p && r)"),
    ),
  )
}

///|
let _unguarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "_UNGUARDED_PATTERN",
)

///|
/// `_UNGUARDED_PATTERN`
pub fn _unguarded_pattern() -> @kernel.Thm {
  _unguarded_pattern_c.get()
}

///|
/// _GUARDED_PATTERN
fn step_7() -> Unit raise {
  _guarded_pattern_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(_GUARDED_PATTERN : (Bool, Bool, Bool) -> Bool) == ((p : Bool) => (g : Bool) => (r : Bool) => p && g && r)"),
    ),
  )
}

///|
let _guarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "_GUARDED_PATTERN",
)

///|
/// `_GUARDED_PATTERN`
pub fn _guarded_pattern() -> @kernel.Thm {
  _guarded_pattern_c.get()
}

///|
/// _MATCH
fn step_8() -> Unit raise {
  _match_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(_MATCH : (A, (A, B) -> Bool) -> B) == ((e : A) => (r : (A, B) -> Bool) => if existsunique(r(e)) { select(r(e)) } else { select((z : B) => false) })"),
    ),
  )
}

///|
let _match_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("_MATCH")

///|
/// `_MATCH`
pub fn _match() -> @kernel.Thm {
  _match_c.get()
}

///|
/// _FUNCTION
fn step_9() -> Unit raise {
  _function_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(_FUNCTION : ((A, B) -> Bool, A) -> B) == ((r : (A, B) -> Bool) => (x : A) => if existsunique(r(x)) { select(r(x)) } else { select((z : B) => false) })"),
    ),
  )
}

///|
let _function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("_FUNCTION")

///|
/// `_FUNCTION`
pub fn _function() -> @kernel.Thm {
  _function_c.get()
}

///|
/// mk_pair_def
fn step_10() -> Unit raise {
  mk_pair_def_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(mk_pair : (A, B, A, B) -> Bool)((x : A), (y : B)) == ((a : A) => (b : B) => a == x && b == y)"),
    ),
  )
}

///|
let mk_pair_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_pair_def")

///|
/// `mk_pair_def`
pub fn mk_pair_def() -> @kernel.Thm {
  mk_pair_def_c.get()
}

///|
/// PAIR_EXISTS_THM
fn step_11() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  pair_exists_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("∃ x : (A, B) -> Bool, ∃ a : A, ∃ b : B, x == mk_pair(a, b)"), t1),
  )
}

///|
let pair_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PAIR_EXISTS_THM",
)

///|
/// `PAIR_EXISTS_THM`
pub fn pair_exists_thm() -> @kernel.Thm {
  pair_exists_thm_c.get()
}

///|
/// prod_tybij
fn step_12() -> Unit raise {
  prod_tybij_c.set(
    @class.new_type_definition(
      "prod",
      ("ABS_prod", "REP_prod"),
      pair_exists_thm(),
    ),
  )
}

///|
let prod_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prod_tybij")

///|
/// `prod_tybij`
pub fn prod_tybij() -> @kernel.Thm {
  prod_tybij_c.get()
}

///|
/// REP_ABS_PAIR
fn step_13() -> Unit raise {
  let t2 = @meson.meson_tac(@list.List([prod_tybij()]))
  rep_abs_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ y : B, REP_prod(ABS_prod(mk_pair(x, y))) == mk_pair(x, y)"),
      t2,
    ),
  )
}

///|
let rep_abs_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REP_ABS_PAIR")

///|
/// `REP_ABS_PAIR`
pub fn rep_abs_pair() -> @kernel.Thm {
  rep_abs_pair_c.get()
}

///|
/// pair.ml:62
fn step_14() -> Unit raise {
  @printer.parse_as_infix(",", (14L, "right"))
}

///|
/// COMMA_DEF
fn step_15() -> Unit raise {
  comma_def_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(op_comma : (A, B) -> (A, B))((x : A), (y : B)) == ABS_prod(mk_pair(x, y))"),
    ),
  )
}

///|
let comma_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMA_DEF")

///|
/// `COMMA_DEF`
pub fn comma_def() -> @kernel.Thm {
  comma_def_c.get()
}

///|
/// FST_DEF
fn step_16() -> Unit raise {
  fst_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(FST : ((A, B)) -> A)((p : (A, B))) == select((x : A) => ∃ y : B, p == (x, y))")),
  )
}

///|
let fst_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FST_DEF")

///|
/// `FST_DEF`
pub fn fst_def() -> @kernel.Thm {
  fst_def_c.get()
}

///|
/// SND_DEF
fn step_17() -> Unit raise {
  snd_def_c.set(
    @drule.new_definition(@term_syntax.parse_term("(SND : ((A, B)) -> B)((p : (A, B))) == select((y : B) => ∃ x : A, p == (x, y))")),
  )
}

///|
let snd_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SND_DEF")

///|
/// `SND_DEF`
pub fn snd_def() -> @kernel.Thm {
  snd_def_c.get()
}

///|
/// PAIR_EQ
fn step_18() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([]))
  let t11 = @simp.rewrite_tac(@list.List([mk_pair_def(), @class.fun_eq_thm()]))
  let t10 = @simp.rewrite_tac(@list.List([rep_abs_pair()]))
  let t6 = @term_syntax.parse_term("(REP_prod : ((A, B), A, B) -> Bool)")
  let t9 = @tactics.disch_then(fn(
    x8 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      let s4 = @tactics.mp_tac(x3)
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
    })(((x7 : @kernel.Thm) => @equal.ap_term(t6, x7))(x8))
  })
  let t12 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([comma_def()])), t9),
        t10,
      ),
      t11,
    ),
    @tactics.all_tac,
  ])
  let t14 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t12,
    ),
    t13,
  )
  pair_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ y : B, ∀ a : A, ∀ b : B, ((x, y) == (a, b)) == (x == a && y == b)"),
      t14,
    ),
  )
}

///|
let pair_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_EQ")

///|
/// `PAIR_EQ`
pub fn pair_eq() -> @kernel.Thm {
  pair_eq_c.get()
}

///|
/// PAIR_SURJECTIVE
fn step_19() -> Unit raise {
  let t38 = @term_syntax.parse_term("(b : B)")
  let t39 = @tactics.map_every(
    fn(
      x35 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s36 = @tactics.exists_tac(x35)
      fn(
        x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s36(x37)
      }
    },
    @list.List([@term_syntax.parse_term("(a : A)"), t38]),
  )
  let t34 = @tactics.disch_then(fn(
    x31 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s32 = @tactics.subst1_tac(x31)
    fn(
      x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s32(x33)
    }
  })
  let t30 = @simp.rewrite_tac(@list.List([@bool.conjunct1(prod_tybij())]))
  let t26 = @term_syntax.parse_term("(ABS_prod : ((A, B) -> Bool) -> (A, B))")
  let t29 = @tactics.disch_then(fn(
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
    (fn(
      x23 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s24 = @tactics.mp_tac(x23)
      fn(
        x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s24(x25)
      }
    })(((x27 : @kernel.Thm) => @equal.ap_term(t26, x27))(x28))
  })
  let t21 = @tactics.x_choose_then(@term_syntax.parse_term("(b : B)"))(fn(
    x18 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s19 = @tactics.mp_tac(x18)
    fn(
      x20 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s19(x20)
    }
  })
  let t22 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(t21),
  )
  let t17 = @simp.rewrite_tac(@list.List([@bool.conjunct1(prod_tybij())]))
  let t15 = @bool.conjunct2(prod_tybij())
  let t16 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("REP_prod((p : (A, B)))"), t15),
  )
  let t40 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @simp.rewrite_tac(@list.List([comma_def()])),
                  ),
                  t16,
                ),
                t17,
              ),
              t22,
            ),
            t29,
          ),
          t30,
        ),
        t34,
      ),
      t39,
    ),
    @tactics.refl_tac,
  )
  pair_surjective_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : (A, B), ∃ x : A, ∃ y : B, p == (x, y)"), t40),
  )
}

///|
let pair_surjective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PAIR_SURJECTIVE",
)

///|
/// `PAIR_SURJECTIVE`
pub fn pair_surjective() -> @kernel.Thm {
  pair_surjective_c.get()
}

///|
/// FST
fn step_20() -> Unit raise {
  let t46 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @tactics.exists_tac(@term_syntax.parse_term("(y : B)"))
  let t44 = @simp.asm_rewrite_tac(@list.List([]))
  let t43 = @simp.rewrite_tac(@list.List([pair_eq()]))
  let t42 = @tactics.match_mp_tac(@class.select_unique())
  let t41 = @simp.rewrite_tac(@list.List([fst_def()]))
  let t47 = @tactics.then_tac(
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
                      t41,
                    ),
                    t42,
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.beta_tac,
              ),
              t43,
            ),
            @tactics.eq_tac,
          ),
          @tactics.strip_tac,
        ),
        t44,
      ),
      t45,
    ),
    t46,
  )
  fst_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ y : B, FST((x, y)) == x"), t47),
  )
}

///|
let fst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FST")

///|
/// `FST`
pub fn fst() -> @kernel.Thm {
  fst_c.get()
}

///|
/// SND
fn step_21() -> Unit raise {
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t51 = @simp.asm_rewrite_tac(@list.List([]))
  let t50 = @simp.rewrite_tac(@list.List([pair_eq()]))
  let t49 = @tactics.match_mp_tac(@class.select_unique())
  let t48 = @simp.rewrite_tac(@list.List([snd_def()]))
  let t54 = @tactics.then_tac(
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
                      t48,
                    ),
                    t49,
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.beta_tac,
              ),
              t50,
            ),
            @tactics.eq_tac,
          ),
          @tactics.strip_tac,
        ),
        t51,
      ),
      t52,
    ),
    t53,
  )
  snd_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ y : B, SND((x, y)) == y"), t54),
  )
}

///|
let snd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SND")

///|
/// `SND`
pub fn snd() -> @kernel.Thm {
  snd_c.get()
}

///|
/// PAIR
fn step_22() -> Unit raise {
  let t60 = @simp.rewrite_tac(@list.List([fst(), snd()]))
  let t58 = @bool.spec(@term_syntax.parse_term("(x : (A, B))"), pair_surjective())
  let t59 = @tactics.x_choose_then(@term_syntax.parse_term("(b : B)"))(fn(
    x55 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s56 = @tactics.subst1_tac(x55)
    fn(
      x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s56(x57)
    }
  })
  let t61 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(t59)(t58),
    ),
    t60,
  )
  pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (A, B), (FST(x), SND(x)) == x"), t61))
}

///|
let pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR")

///|
/// `PAIR`
pub fn pair() -> @kernel.Thm {
  pair_c.get()
}

///|
/// pair_INDUCT
fn step_23() -> Unit raise {
  let t69 = @tactics.first_assum(fn(
    x66 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s67 = @tactics.match_accept_tac(x66)
    fn(
      x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s67(x68)
    }
  })
  let t65 = @simp.gen_rewrite_tac(
    fn(
      x62 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s63 = @equal.rand_conv(x62)
      fn(x64 : @kernel.Term) -> @kernel.Thm raise { s63(x64) }
    },
    @list.List([@equal.gsym(pair())]),
  )
  let t70 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t65),
    t69,
  )
  pair_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B)) -> Bool, (∀ x : A, ∀ y : B, P((x, y))) → (∀ p : (A, B), P(p))"),
      t70,
    ),
  )
}

///|
let pair_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pair_INDUCT")

///|
/// `pair_INDUCT`
pub fn pair_induct() -> @kernel.Thm {
  pair_induct_c.get()
}

///|
/// pair_RECURSION
fn step_24() -> Unit raise {
  let t71 = @simp.rewrite_tac(@list.List([fst(), snd()]))
  let t72 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.exists_tac(
        @term_syntax.parse_term("(p : (A, B)) => (PAIR' : (A, B) -> C)(FST(p), SND(p))"),
      ),
    ),
    t71,
  )
  pair_recursion_c.set(
    @tactics.prove(
      @parser.parse_term("forall PAIR'. ?fn_:A#B->C. forall a0 a1. fn_ (a0,a1) = PAIR' a0 a1"),
      t72,
    ),
  )
}

///|
let pair_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pair_RECURSION")

///|
/// `pair_RECURSION`
pub fn pair_recursion() -> @kernel.Thm {
  pair_recursion_c.get()
}

///|
/// is_pair
fn step_25() -> Unit raise {
  is_pair_c.set(fn(x74 : @kernel.Term) -> Bool raise {
    ((x73 : @kernel.Term) => @basics.is_binary(",", x73))(x74)
  })
}

///|
let is_pair_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new(
  "is_pair",
)

///|
/// `is_pair`
pub fn is_pair(x : @kernel.Term) -> Bool raise {
  is_pair_c.get()(x)
}

///|
/// dest_pair
fn step_26() -> Unit raise {
  dest_pair_c.set((x75 : @kernel.Term) => @basics.dest_binary(",", x75))
}

///|
let dest_pair_c : @lib.Cell[
  (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
] = @lib.Cell::new("dest_pair")

///|
/// `dest_pair`
pub fn dest_pair(x : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
  dest_pair_c.get()(x)
}

///|
/// mk_pair
fn step_27() -> Unit raise {
  let ptm = @kernel.mk_const(",", @list.List([]))
  mk_pair_c.set(fn(x76 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    let (l, r) = x76
    let t77 = (@kernel.type_of(r), @basics.bty)
    @kernel.mk_comb(
      @kernel.mk_comb(
        @kernel.inst(@list.List([(@kernel.type_of(l), @kernel.aty), t77]), ptm),
        l,
      ),
      r,
    )
  })
}

///|
let mk_pair_c : @lib.Cell[((@kernel.Term, @kernel.Term)) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_pair",
)

///|
/// `mk_pair`
pub fn mk_pair(x : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
  mk_pair_c.get()(x)
}

///|
/// pair.ml:142
fn step_28() -> Unit raise {
  @simp.extend_basic_rewrites(@list.List([fst(), snd(), pair()]))
}

///|
/// the_definitions
fn step_29() -> Unit raise {
  the_definitions_c.set(Ref::{
    val: @list.List([
      snd_def(),
      fst_def(),
      comma_def(),
      mk_pair_def(),
      geq_def(),
      gabs_def(),
      let_end_def(),
      let_def(),
      @trivia.one_def(),
      @trivia.i_def(),
      @trivia.o_def(),
      @class.cond_def(),
      @tactics.falsity(),
      @bool.exists_unique_def(),
      @bool.not_def(),
      @bool.f_def(),
      @bool.or_def(),
      @bool.exists_def(),
      @bool.forall_def(),
      @bool.imp_def(),
      @bool.and_def(),
      @bool.t_def(),
    ]),
  })
}

///|
let the_definitions_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "the_definitions",
)

///|
/// `the_definitions`
pub fn the_definitions() -> Ref[@list.List[@kernel.Thm]] {
  the_definitions_c.get()
}

///|
/// new_definition
fn step_30() -> Unit raise {
  fn depair(
    x78 : @kernel.Term,
    x79 : @kernel.Term,
  ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
    let gv = x78
    let arg = x79
    try {
      let (l, r) = dest_pair(arg)
      let t80 = depair(@basics.list_mk_icomb("SND", @list.List([gv])), r)
      depair(@basics.list_mk_icomb("FST", @list.List([gv])), l).concat(t80)
    } catch {
      Failure(_) => @list.List([(gv, arg)])
      e => raise e
    }
  }
  let depair_1 : (@kernel.Term) -> (
    @kernel.Term,
    @list.List[(@kernel.Term, @kernel.Term)],
  ) raise = fn(
    x81 : @kernel.Term,
  ) -> (@kernel.Term, @list.List[(@kernel.Term, @kernel.Term)]) raise {
    let arg_1 = x81
    let gv_1 = @basics.genvar(@kernel.type_of(arg_1))
    (gv_1, depair(gv_1, arg_1))
  }
  new_definition_c.set(fn(x82 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x82
    let (avs, def) = @basics.strip_forall(tm)
    try {
      let (th_1, th_p) = @lib.tryfind(
        fn(x83 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
          let th = x83
          (
            th,
            @drule.part_match(
              fn(x84 : @kernel.Term) -> @kernel.Term raise { x84 },
              th,
            )(def),
          )
        },
        the_definitions().val,
      )
      let t86 = @basics.strip_forall(@kernel.concl(th_1)).1
      ignore(
        @drule.part_match(
          fn(x85 : @kernel.Term) -> @kernel.Term raise { x85 },
          th_p,
        )(t86),
      )
      @lib.warn(true, "Benign redefinition")
      @bool.gen_all(@bool.genl(avs, th_p))
    } catch {
      Failure(_) => {
        let (l_1, r_1) = @kernel.dest_eq(def)
        let (fn_, args) = @basics.strip_comb(l_1)
        let t89 = @lib.unzip(@lib.map(depair_1, args))
        let t90 = (fn(
          x88 : @list.List[@list.List[(@kernel.Term, @kernel.Term)]],
        ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
          @lib.unions(x88)
        })(t89.1)
        let (gargs, reps) = (
          (fn(
            x87 : @list.List[@kernel.Term],
          ) -> @list.List[@kernel.Term] raise {
            x87
          })(t89.0),
          t90,
        )
        let l_p = @basics.list_mk_comb(fn_, gargs)
        let r_p = @basics.subst(reps, r_1)
        let th1 = @drule.new_definition(@basics.mk_eq(l_p, r_p))
        let slist = @lib.zip(args, gargs)
        let th2 = @kernel.inst_rule(slist, @bool.spec_all(th1))
        let xreps = @lib.map(
          fn(x93 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            ((x91 : @kernel.Term) => @basics.subst(slist, x91))(
              (fn(x92 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                x92.0
              })(x93),
            )
          },
          reps,
        )
        let t94 = @simp.pure_rewrite_conv(@list.List([fst(), snd()]))
        let threps = @lib.map(
          fn(x95 : @kernel.Term) -> @kernel.Thm raise { @equal.sym(t94(x95)) },
          xreps,
        )
        let th3 = @kernel.trans(th2, @equal.sym(@equal.subs_conv(threps)(r_1)))
        let th4 = @bool.gen_all(@bool.genl(avs, th3))
        {
          the_definitions().val = the_definitions().val.prepend(th4)
          ()
        }
        th4
      }
      e => raise e
    }
  })
}

///|
let new_definition_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "new_definition",
)

///|
/// `new_definition`
pub fn new_definition(x : @kernel.Term) -> @kernel.Thm raise {
  new_definition_c.get()(x)
}

///|
/// CURRY_DEF
fn step_31() -> Unit raise {
  curry_def_c.set(
    new_definition(@term_syntax.parse_term("(CURRY : (((A, B)) -> C, A, B) -> C)((f : ((A, B)) -> C), (x : A), (y : B)) == f((x, y))")),
  )
}

///|
let curry_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CURRY_DEF")

///|
/// `CURRY_DEF`
pub fn curry_def() -> @kernel.Thm {
  curry_def_c.get()
}

///|
/// UNCURRY_DEF
fn step_32() -> Unit raise {
  uncurry_def_c.set(
    new_definition(
      @term_syntax.parse_term("∀ f : (A, B) -> C, ∀ x : A, ∀ y : B, (UNCURRY : ((A, B) -> C, (A, B)) -> C)(f, (x, y)) == f(x, y)"),
    ),
  )
}

///|
let uncurry_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNCURRY_DEF")

///|
/// `UNCURRY_DEF`
pub fn uncurry_def() -> @kernel.Thm {
  uncurry_def_c.get()
}

///|
/// PASSOC_DEF
fn step_33() -> Unit raise {
  passoc_def_c.set(
    new_definition(
      @term_syntax.parse_term("∀ f : (((A, B), C)) -> D, ∀ x : A, ∀ y : B, ∀ z : C, (PASSOC : ((((A, B), C)) -> D, (A, B, C)) -> D)(f, (x, y, z)) == f(((x, y), z))"),
    ),
  )
}

///|
let passoc_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASSOC_DEF")

///|
/// `PASSOC_DEF`
pub fn passoc_def() -> @kernel.Thm {
  passoc_def_c.get()
}

///|
/// `GABS_CONV`
pub fn gabs_conv(
  x96 : (@kernel.Term) -> @kernel.Thm raise,
  x97 : @kernel.Term,
) -> @kernel.Thm raise {
  let conv = x96
  let tm = x97
  if @kernel.is_abs(tm) {
    @equal.abs_conv(conv)(tm)
  } else {
    let (gabs, bod) = @kernel.dest_comb(tm)
    let (f, qtm) = @kernel.dest_abs(bod)
    let (xs, bod_1) = @basics.strip_forall(qtm)
    @equal.ap_term(
      gabs,
      @kernel.abs_rule(
        f,
        @lib.itlist(@drule.mk_forall_rule, xs, @equal.rand_conv(conv)(bod_1)),
      ),
    )
  }
}

///|
/// GEN_BETA_CONV
fn step_34() -> Unit raise {
  let projection_cache = Ref::{ val: @list.List([]), }
  let create_projections : (String) -> @list.List[@kernel.Thm] raise = fn(
    x98 : String,
  ) -> @list.List[@kernel.Thm] raise {
    let conname = x98
    @lib.assoc(conname, projection_cache.val) catch {
      Failure(_) => {
        let genty = @kernel.get_const_type(conname)
        let conty = @kernel.dest_type(
            @lib.repeat(
              fn(x100 : @kernel.HolType) -> @kernel.HolType raise {
                (fn(
                  x99 : (@kernel.HolType, @kernel.HolType),
                ) -> @kernel.HolType raise {
                  x99.1
                })(@basics.dest_fun_ty(x100))
              },
              genty,
            ),
          ).0
        let (_, _, rth) = @lib.assoc(conty, @class.inductive_type_store().val)
        let sth = @bool.spec_all(rth)
        let (evs, bod) = @basics.strip_exists(@kernel.concl(sth))
        let cjs = @basics.conjuncts(bod)
        let ourcj = @lib.find(
          fn(x114 : @kernel.Term) -> Bool raise {
            (fn(x112 : (@list.List[@kernel.Term], @kernel.Term)) -> Bool raise {
              (fn(x110 : @kernel.Term) -> Bool raise {
                (fn(x109 : @kernel.Term) -> Bool raise {
                  (fn(x108 : @kernel.Term) -> Bool raise {
                    (fn(
                      x106 : (@kernel.Term, @list.List[@kernel.Term]),
                    ) -> Bool raise {
                      (fn(x104 : @kernel.Term) -> Bool raise {
                        (fn(x103 : (String, @kernel.HolType)) -> Bool raise {
                          (fn(x101 : String) -> Bool raise { conname == x101 })(
                            (fn(
                              x102 : (String, @kernel.HolType),
                            ) -> String raise {
                              x102.0
                            })(x103),
                          )
                        })(@kernel.dest_const(x104))
                      })(
                        (fn(
                          x105 : (@kernel.Term, @list.List[@kernel.Term]),
                        ) -> @kernel.Term raise {
                          x105.0
                        })(x106),
                      )
                    })(
                      (fn(
                        x107 : @kernel.Term,
                      ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                        @basics.strip_comb(x107)
                      })(x108),
                    )
                  })(@kernel.rand(x109))
                })(@equal.lhand(x110))
              })(
                (fn(
                  x111 : (@list.List[@kernel.Term], @kernel.Term),
                ) -> @kernel.Term raise {
                  x111.1
                })(x112),
              )
            })(
              (fn(
                x113 : @kernel.Term,
              ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
                @basics.strip_forall(x113)
              })(x114),
            )
          },
          cjs,
        )
        let n = Int::to_int64(@lib.index(ourcj, cjs))
        let (avs, eqn) = @basics.strip_forall(ourcj)
        let (con_p, args) = @basics.strip_comb(@kernel.rand(eqn))
        let (aargs, zargs) = @lib.chop_list(@lib.length(avs), args)
        let gargs = @lib.map(
          fn(x117 : @kernel.Term) -> @kernel.Term raise {
            (fn(x115 : @kernel.HolType) -> @kernel.Term raise {
              @basics.genvar(x115)
            })(
              (fn(x116 : @kernel.Term) -> @kernel.HolType raise {
                @kernel.type_of(x116)
              })(x117),
            )
          },
          zargs,
        )
        let gcon = @basics.genvar(
          @lib.itlist(
            fn(
              x121 : @kernel.Term,
              x122 : @kernel.HolType,
            ) -> @kernel.HolType raise {
              (fn(
                x118 : @kernel.HolType,
              ) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
                fn(x119 : @kernel.HolType) -> @kernel.HolType raise {
                  @basics.mk_fun_ty(x118, x119)
                }
              })(
                (fn(x120 : @kernel.Term) -> @kernel.HolType raise {
                  @kernel.type_of(x120)
                })(x121),
              )(x122)
            },
            avs,
            @kernel.type_of(@kernel.rand(eqn)),
          ),
        )
        let bth = @kernel.inst_rule(
          @list.List([
            (
              @basics.list_mk_abs(
                aargs.concat(gargs),
                @basics.list_mk_comb(gcon, avs),
              ),
              con_p,
            ),
          ]),
          sth,
        )
        let t123 = @bool.conjuncts_rule(
          @kernel.assume_rule(@basics.strip_exists(@kernel.concl(bth)).1),
        )
        let cth = @lib.el(@lib.int63_to_int(n), t123)
        let t127 = @equal.rand_conv(@drule.betas_conv)
        let dth = @equal.conv_rule(
          @lib.funpow(
            @lib.length(avs),
            fn(
              x124 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s125 = @equal.binder_conv(x124)
              fn(x126 : @kernel.Term) -> @kernel.Thm raise { s125(x126) }
            },
            t127,
          ),
          cth,
        )
        let eth = @bool.simple_exists(
          @kernel.rator(
            @equal.lhand(@basics.strip_forall(@kernel.concl(dth)).1),
          ),
          dth,
        )
        let fth = @bool.prove_hyp(
          bth,
          @lib.itlist(@bool.simple_choose, evs, eth),
        )
        let zty = @kernel.type_of(
          @kernel.rand(@basics.strip_forall(@kernel.concl(dth)).1),
        )
        let mk_projector : (@kernel.Term) -> @kernel.Thm raise = fn(
          x128 : @kernel.Term,
        ) -> @kernel.Thm raise {
          let a = x128
          let ity = @kernel.type_of(a)
          let th = @equal.beta_rule(
            @bool.pinst(
              @list.List([(ity, zty)]),
              @list.List([(@basics.list_mk_abs(avs, a), gcon)]),
              fth,
            ),
          )
          @equal.sym(@bool.spec_all(@class.select_rule(th)))
        }
        let ths = @lib.map(mk_projector, avs)
        {
          projection_cache.val = projection_cache.val.prepend((conname, ths))
          ()
        }
        ths
      }
      e => raise e
    }
  }
  let geq_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @equal.gsym(geq_def()),
  )
  let t129 = @simp.rewr_conv(geq_def())
  let degeq_rule : (@kernel.Thm) -> @kernel.Thm raise = (x130 : @kernel.Thm) => {
    @equal.conv_rule(t129, x130)
  }
  let t131 = @simp.simp_tac(
    @list.List([gabs_def(), @class.select_ax(), @class.eta_ax()]),
  )
  let pth = @tactics.prove(@term_syntax.parse_term("op_q((P : (_) -> Bool)) → P(GABS(P))"), t131)
  let gabs_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth)
  fn create_iterated_projections(
    x132 : @kernel.Term,
  ) -> @list.List[@kernel.Thm] raise {
    let tm = x132
    if @kernel.frees(tm) == @list.List([]) {
      @list.List([])
    } else if @kernel.is_var(tm) {
      @list.List([@kernel.refl(tm)])
    } else {
      let (con, args_1) = @basics.strip_comb(tm)
      let prjths = create_projections(@kernel.dest_const(con).0)
      let atm = @kernel.rand(@kernel.rand(@kernel.concl(@lib.hd(prjths))))
      let instn = @drule.term_match(@list.List([]), atm, tm)
      let arths = @lib.map(
        (x133 : @kernel.Thm) => @drule.instantiate_rule(instn, x133),
        prjths,
      )
      let ths_1 = @lib.map(
        fn(x134 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
          let arth = x134
          let sths = create_iterated_projections(
            @equal.lhand(@kernel.concl(arth)),
          )
          let t135 = @equal.rand_conv(@equal.subs_conv(@list.List([arth])))
          @lib.map((x136 : @kernel.Thm) => @equal.conv_rule(t135, x136), sths)
        },
        arths,
      )
      @lib.unions_eq(
        fn(x137 : @kernel.Thm, x138 : @kernel.Thm) -> Bool raise {
          @basics.equals_thm(x137, x138)
        },
        ths_1,
      )
    }
  }
  let gen_beta_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(
    x139 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x139
    @equal.beta_conv(tm_1) catch {
      Failure(_) => {
        let (l, r) = @kernel.dest_comb(tm_1)
        let (vstr, bod_1) = @basics.dest_gabs(l)
        let instn_1 = @drule.term_match(@list.List([]), vstr, r)
        let prjs = create_iterated_projections(vstr)
        let th1 = @equal.subs_conv(prjs)(bod_1)
        let bod_p = @kernel.rand(@kernel.concl(th1))
        let gv = @basics.genvar(@kernel.type_of(vstr))
        let pat = @kernel.mk_abs(
          gv,
          @basics.subst(@list.List([(gv, vstr)]), bod_p),
        )
        let t140 = @equal.sym(th1)
        let th2 = @kernel.trans(
          @equal.beta_conv(@kernel.mk_comb(pat, vstr)),
          t140,
        )
        let avs_1 = @basics.strip_forall(@basics.body(@kernel.rand(l))).0
        let th3 = @bool.genl(
          @basics.strip_forall(@basics.body(@kernel.rand(l))).0,
          th2,
        )
        let efn = @basics.genvar(@kernel.type_of(pat))
        let th4 = @bool.exists_rule(
          @bool.mk_exists(
            efn,
            @basics.subst(@list.List([(efn, pat)]), @kernel.concl(th3)),
          ),
          pat,
          th3,
        )
        let th5 = @equal.conv_rule(
          @lib.funpow(
            @lib.int63_to_int(@lib.add63(Int::to_int64(@lib.length(avs_1)), 1L)),
            fn(
              x141 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s142 = @equal.binder_conv(x141)
              fn(x143 : @kernel.Term) -> @kernel.Thm raise { s142(x143) }
            },
            geq_conv,
          ),
          th4,
        )
        let th6 = @equal.conv_rule(@equal.beta_conv, gabs_rule(th5))
        @drule.instantiate_rule(instn_1, degeq_rule(@bool.spec_all(th6)))
      }
      e => raise e
    }
  }
  gen_beta_conv_c.set(gen_beta_conv_1)
}

///|
let gen_beta_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "GEN_BETA_CONV",
)

///|
/// `GEN_BETA_CONV`
pub fn gen_beta_conv(x : @kernel.Term) -> @kernel.Thm raise {
  gen_beta_conv_c.get()(x)
}

///|
/// pair.ml:286
fn step_35() -> Unit raise {
  @simp.extend_basic_convs(
    "GEN_BETA_CONV",
    (@term_syntax.parse_term("GABS((a : (_) -> _) => (b : Bool), (c : _))"), gen_beta_conv),
  )
}

///|
/// pair.ml:288
fn step_36() -> Unit raise {
  @class.inductive_type_store().val = @class.inductive_type_store().val.prepend(
    ("prod", (1L, pair_induct(), pair_recursion())),
  )
  ()
}

///|
/// FORALL_PAIR_THM
fn step_37() -> Unit raise {
  let t144 = @meson.meson_tac(@list.List([pair()]))
  forall_pair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B)) -> Bool, (∀ p : (A, B), P(p)) == (∀ p1 : A, ∀ p2 : B, P((p1, p2)))"),
      t144,
    ),
  )
}

///|
let forall_pair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_PAIR_THM",
)

///|
/// `FORALL_PAIR_THM`
pub fn forall_pair_thm() -> @kernel.Thm {
  forall_pair_thm_c.get()
}

///|
/// EXISTS_PAIR_THM
fn step_38() -> Unit raise {
  let t145 = @meson.meson_tac(@list.List([pair()]))
  exists_pair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B)) -> Bool, (∃ p : (A, B), P(p)) == (∃ p1 : A, ∃ p2 : B, P((p1, p2)))"),
      t145,
    ),
  )
}

///|
let exists_pair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_PAIR_THM",
)

///|
/// `EXISTS_PAIR_THM`
pub fn exists_pair_thm() -> @kernel.Thm {
  exists_pair_thm_c.get()
}

///|
/// LAMBDA_PAIR_THM
fn step_39() -> Unit raise {
  let t146 = @simp.rewrite_tac(
    @list.List([forall_pair_thm(), @class.fun_eq_thm()]),
  )
  lambda_pair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : ((A, B)) -> C, ((p : (A, B)) => t(p)) == GABS((f : ((A, B)) -> C) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), t((x, y))))"),
      t146,
    ),
  )
}

///|
let lambda_pair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LAMBDA_PAIR_THM",
)

///|
/// `LAMBDA_PAIR_THM`
pub fn lambda_pair_thm() -> @kernel.Thm {
  lambda_pair_thm_c.get()
}

///|
/// LAMBDA_PAIR
fn step_40() -> Unit raise {
  let t147 = @simp.rewrite_tac(@list.List([lambda_pair_thm()]))
  lambda_pair_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> C, fn { (x, y) => f(x, y) } == ((p : (A, B)) => f(FST(p), SND(p)))"),
      t147,
    ),
  )
}

///|
let lambda_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_PAIR")

///|
/// `LAMBDA_PAIR`
pub fn lambda_pair() -> @kernel.Thm {
  lambda_pair_c.get()
}

///|
/// LAMBDA_TRIPLE_THM
fn step_41() -> Unit raise {
  let t148 = @simp.rewrite_tac(
    @list.List([forall_pair_thm(), @class.fun_eq_thm()]),
  )
  lambda_triple_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : ((A, B, C)) -> D, ((t : (A, B, C)) => f(t)) == GABS((f' : ((A, B, C)) -> D) => ∀ x : A, ∀ y : B, ∀ z : C, GEQ(f'((x, y, z)), f((x, y, z))))"),
      t148,
    ),
  )
}

///|
let lambda_triple_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LAMBDA_TRIPLE_THM",
)

///|
/// `LAMBDA_TRIPLE_THM`
pub fn lambda_triple_thm() -> @kernel.Thm {
  lambda_triple_thm_c.get()
}

///|
/// LAMBDA_TRIPLE
fn step_42() -> Unit raise {
  let t149 = @simp.rewrite_tac(@list.List([lambda_triple_thm()]))
  lambda_triple_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B, C) -> D, fn { (x, y, z) => f(x, y, z) } == ((t : (A, B, C)) => f(FST(t), FST(SND(t)), SND(SND(t))))"),
      t149,
    ),
  )
}

///|
let lambda_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_TRIPLE")

///|
/// `LAMBDA_TRIPLE`
pub fn lambda_triple() -> @kernel.Thm {
  lambda_triple_c.get()
}

///|
/// PAIRED_ETA_THM
fn step_43() -> Unit raise {
  let t150 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), forall_pair_thm()]),
  )
  let t151 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t150)
  paired_eta_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : ((A, B)) -> C, fn { (x, y) => f((x, y)) } == f) && (∀ f : ((A, B, C)) -> D, fn { (x, y, z) => f((x, y, z)) } == f) && (∀ f : ((A, B, C, D)) -> E, fn { (w, x, y, z) => f((w, x, y, z)) } == f)"),
      t151,
    ),
  )
}

///|
let paired_eta_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRED_ETA_THM")

///|
/// `PAIRED_ETA_THM`
pub fn paired_eta_thm() -> @kernel.Thm {
  paired_eta_thm_c.get()
}

///|
/// FORALL_UNCURRY
fn step_44() -> Unit raise {
  let t161 = @simp.simp_tac(@list.List([@class.eta_ax()]))
  let t157 = @term_syntax.parse_term("fn { (a, b) => (f : (A, B) -> C)(a, b) }")
  let t160 = @tactics.first_assum(fn(
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
    (fn(
      x154 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s155 = @tactics.mp_tac(x154)
      fn(
        x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s155(x156)
      }
    })(((x158 : @kernel.Thm) => @bool.spec(t157, x158))(x159))
  })
  let t153 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A, B) -> C)"))
  let t152 = @simp.simp_tac(@list.List([]))
  let t162 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t152,
          ),
          @tactics.disch_tac,
        ),
        t153,
      ),
      t160,
    ),
    t161,
  )
  forall_uncurry_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B) -> C) -> Bool, (∀ f : (A, B) -> C, P(f)) == (∀ f : ((A, B)) -> C, P((a : A) => (b : B) => f((a, b))))"),
      t162,
    ),
  )
}

///|
let forall_uncurry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_UNCURRY")

///|
/// `FORALL_UNCURRY`
pub fn forall_uncurry() -> @kernel.Thm {
  forall_uncurry_c.get()
}

///|
/// EXISTS_UNCURRY
fn step_45() -> Unit raise {
  let t163 = @simp.rewrite_tac(@list.List([forall_uncurry()]))
  let t164 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) == !(∀ x : _, !P(x))"),
        ),
      ]),
    ),
    t163,
  )
  exists_uncurry_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B) -> C) -> Bool, (∃ f : (A, B) -> C, P(f)) == (∃ f : ((A, B)) -> C, P((a : A) => (b : B) => f((a, b))))"),
      t164,
    ),
  )
}

///|
let exists_uncurry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_UNCURRY")

///|
/// `EXISTS_UNCURRY`
pub fn exists_uncurry() -> @kernel.Thm {
  exists_uncurry_c.get()
}

///|
/// EXISTS_CURRY
fn step_46() -> Unit raise {
  let t165 = @simp.rewrite_tac(@list.List([exists_uncurry(), paired_eta_thm()]))
  exists_curry_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (((A, B)) -> C) -> Bool, (∃ f : ((A, B)) -> C, P(f)) == (∃ f : (A, B) -> C, P(fn { (a, b) => f(a, b) }))"),
      t165,
    ),
  )
}

///|
let exists_curry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_CURRY")

///|
/// `EXISTS_CURRY`
pub fn exists_curry() -> @kernel.Thm {
  exists_curry_c.get()
}

///|
/// FORALL_CURRY
fn step_47() -> Unit raise {
  let t166 = @simp.rewrite_tac(@list.List([forall_uncurry(), paired_eta_thm()]))
  forall_curry_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (((A, B)) -> C) -> Bool, (∀ f : ((A, B)) -> C, P(f)) == (∀ f : (A, B) -> C, P(fn { (a, b) => f(a, b) }))"),
      t166,
    ),
  )
}

///|
let forall_curry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_CURRY")

///|
/// `FORALL_CURRY`
pub fn forall_curry() -> @kernel.Thm {
  forall_curry_c.get()
}

///|
/// FORALL_UNPAIR_THM
fn step_48() -> Unit raise {
  let t167 = @meson.meson_tac(@list.List([]))
  let t168 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([forall_pair_thm(), fst(), snd()])),
    t167,
  )
  forall_unpair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, ∀ y : B, P(x, y)) == (∀ z : (A, B), P(FST(z), SND(z)))"),
      t168,
    ),
  )
}

///|
let forall_unpair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_UNPAIR_THM",
)

///|
/// `FORALL_UNPAIR_THM`
pub fn forall_unpair_thm() -> @kernel.Thm {
  forall_unpair_thm_c.get()
}

///|
/// EXISTS_UNPAIR_THM
fn step_49() -> Unit raise {
  let t169 = @meson.meson_tac(@list.List([]))
  let t170 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([exists_pair_thm(), fst(), snd()])),
    t169,
  )
  exists_unpair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ x : A, ∃ y : B, P(x, y)) == (∃ z : (A, B), P(FST(z), SND(z)))"),
      t170,
    ),
  )
}

///|
let exists_unpair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_UNPAIR_THM",
)

///|
/// `EXISTS_UNPAIR_THM`
pub fn exists_unpair_thm() -> @kernel.Thm {
  exists_unpair_thm_c.get()
}

///|
/// FORALL_PAIR_FUN_THM
fn step_50() -> Unit raise {
  let t180 = @simp.pure_asm_rewrite_tac(@list.List([]))
  let t179 = @simp.gen_rewrite_tac(
    fn(
      x176 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s177 = @equal.binder_conv(x176)
      fn(x178 : @kernel.Term) -> @kernel.Thm raise { s177(x178) }
    },
    @list.List([@equal.gsym(pair())]),
  )
  let t175 = @simp.gen_rewrite_tac(
    fn(
      x172 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s173 = @equal.rand_conv(x172)
      fn(x174 : @kernel.Term) -> @kernel.Thm raise { s173(x174) }
    },
    @list.List([@equal.gsym(@class.eta_ax())]),
  )
  let t171 = @simp.asm_rewrite_tac(@list.List([]))
  let t181 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
              @tactics.disch_tac,
            ),
            t171,
          ),
          @tactics.gen_tac,
        ),
        t175,
      ),
      t179,
    ),
    t180,
  )
  forall_pair_fun_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> (B, C)) -> Bool, (∀ f : (A) -> (B, C), P(f)) == (∀ g : (A) -> B, ∀ h : (A) -> C, P((a : A) => (g(a), h(a))))"),
      t181,
    ),
  )
}

///|
let forall_pair_fun_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_PAIR_FUN_THM",
)

///|
/// `FORALL_PAIR_FUN_THM`
pub fn forall_pair_fun_thm() -> @kernel.Thm {
  forall_pair_fun_thm_c.get()
}

///|
/// EXISTS_PAIR_FUN_THM
fn step_51() -> Unit raise {
  let t182 = @simp.rewrite_tac(@list.List([forall_pair_fun_thm()]))
  let t183 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @meson.meson(
          @list.List([]),
          @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x)) == !(∀ x : _, !P(x))"),
        ),
      ]),
    ),
    t182,
  )
  exists_pair_fun_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> (B, C)) -> Bool, (∃ f : (A) -> (B, C), P(f)) == (∃ g : (A) -> B, ∃ h : (A) -> C, P((a : A) => (g(a), h(a))))"),
      t183,
    ),
  )
}

///|
let exists_pair_fun_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_PAIR_FUN_THM",
)

///|
/// `EXISTS_PAIR_FUN_THM`
pub fn exists_pair_fun_thm() -> @kernel.Thm {
  exists_pair_fun_thm_c.get()
}

///|
/// FORALL_UNPAIR_FUN_THM
fn step_52() -> Unit raise {
  let t184 = @simp.rewrite_tac(
    @list.List([forall_pair_fun_thm(), @trivia.o_def(), @class.eta_ax()]),
  )
  forall_unpair_fun_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> B, (A) -> C) -> Bool, (∀ f : (A) -> B, ∀ g : (A) -> C, P(f, g)) == (∀ h : (A) -> (B, C), P(o(FST, h), o(SND, h)))"),
      t184,
    ),
  )
}

///|
let forall_unpair_fun_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_UNPAIR_FUN_THM",
)

///|
/// `FORALL_UNPAIR_FUN_THM`
pub fn forall_unpair_fun_thm() -> @kernel.Thm {
  forall_unpair_fun_thm_c.get()
}

///|
/// EXISTS_UNPAIR_FUN_THM
fn step_53() -> Unit raise {
  let t185 = @simp.rewrite_tac(
    @list.List([exists_pair_fun_thm(), @trivia.o_def(), @class.eta_ax()]),
  )
  exists_unpair_fun_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A) -> B, (A) -> C) -> Bool, (∃ f : (A) -> B, ∃ g : (A) -> C, P(f, g)) == (∃ h : (A) -> (B, C), P(o(FST, h), o(SND, h)))"),
      t185,
    ),
  )
}

///|
let exists_unpair_fun_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_UNPAIR_FUN_THM",
)

///|
/// `EXISTS_UNPAIR_FUN_THM`
pub fn exists_unpair_fun_thm() -> @kernel.Thm {
  exists_unpair_fun_thm_c.get()
}

///|
/// EXISTS_SWAP_FUN_THM
fn step_54() -> Unit raise {
  let t194 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t191 = @tactics.exists_tac(@term_syntax.parse_term("(b : A) => (a : B) => (f : (B, A) -> C)(a, b)"))
  let t189 = @term_syntax.parse_term("(f : (B, A) -> C)")
  let t192 = @tactics.then_tac(
    @tactics.disch_then((x190 : @kernel.Thm) => {
      @tactics.x_choose_tac(t189, x190)
    }),
    t191,
  )
  let t188 = @tactics.exists_tac(@term_syntax.parse_term("(b : B) => (a : A) => (f : (A, B) -> C)(a, b)"))
  let t186 = @term_syntax.parse_term("(f : (A, B) -> C)")
  let t193 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then((x187 : @kernel.Thm) => {
        @tactics.x_choose_tac(t186, x187)
      }),
      t188,
    ),
    t192,
  ])
  let t195 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t193,
    ),
    t194,
  )
  exists_swap_fun_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((A, B) -> C) -> Bool, (∃ f : (A, B) -> C, P(f)) == (∃ f : (B, A) -> C, P((a : A) => (b : B) => f(b, a)))"),
      t195,
    ),
  )
}

///|
let exists_swap_fun_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_SWAP_FUN_THM",
)

///|
/// `EXISTS_SWAP_FUN_THM`
pub fn exists_swap_fun_thm() -> @kernel.Thm {
  exists_swap_fun_thm_c.get()
}

///|
/// FORALL_PAIRED_THM
fn step_55() -> Unit raise {
  let t203 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), forall_pair_thm()]),
  )
  let t204 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.gen_rewrite_tac(
        fn(
          x202 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x196 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s197 = @equal.land_conv(x196)
            fn(x198 : @kernel.Term) -> @kernel.Thm raise { s197(x198) }
          })(
            (fn(
              x199 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s200 = @equal.rator_conv(x199)
              fn(x201 : @kernel.Term) -> @kernel.Thm raise { s200(x201) }
            })(x202),
          )
        },
        @list.List([@bool.forall_def()]),
      ),
    ),
    t203,
  )
  forall_paired_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, forall(GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), P(x, y)))) == (∀ x : A, ∀ y : B, P(x, y))"),
      t204,
    ),
  )
}

///|
let forall_paired_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_PAIRED_THM",
)

///|
/// `FORALL_PAIRED_THM`
pub fn forall_paired_thm() -> @kernel.Thm {
  forall_paired_thm_c.get()
}

///|
/// EXISTS_PAIRED_THM
fn step_56() -> Unit raise {
  let t205 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@class.eta_ax()]))(@class.not_exists_thm()),
      forall_pair_thm(),
    ]),
  )
  let t206 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(
        @class.taut(@term_syntax.parse_term("!(p : Bool) == !(q : Bool) → p == q")),
      ),
    ),
    t205,
  )
  exists_paired_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, op_q(GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), P(x, y)))) == (∃ x : A, ∃ y : B, P(x, y))"),
      t206,
    ),
  )
}

///|
let exists_paired_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_PAIRED_THM",
)

///|
/// `EXISTS_PAIRED_THM`
pub fn exists_paired_thm() -> @kernel.Thm {
  exists_paired_thm_c.get()
}

///|
/// FORALL_TRIPLED_THM
fn step_57() -> Unit raise {
  let t214 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), forall_pair_thm()]),
  )
  let t215 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.gen_rewrite_tac(
        fn(
          x213 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x207 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s208 = @equal.land_conv(x207)
            fn(x209 : @kernel.Term) -> @kernel.Thm raise { s208(x209) }
          })(
            (fn(
              x210 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s211 = @equal.rator_conv(x210)
              fn(x212 : @kernel.Term) -> @kernel.Thm raise { s211(x212) }
            })(x213),
          )
        },
        @list.List([@bool.forall_def()]),
      ),
    ),
    t214,
  )
  forall_tripled_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B, C) -> Bool, (∀ (x, y, z) : (A, B, C), P(x, y, z)) == (∀ x : A, ∀ y : B, ∀ z : C, P(x, y, z))"),
      t215,
    ),
  )
}

///|
let forall_tripled_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_TRIPLED_THM",
)

///|
/// `FORALL_TRIPLED_THM`
pub fn forall_tripled_thm() -> @kernel.Thm {
  forall_tripled_thm_c.get()
}

///|
/// EXISTS_TRIPLED_THM
fn step_58() -> Unit raise {
  let t216 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@class.eta_ax()]))(@class.not_exists_thm()),
      forall_pair_thm(),
    ]),
  )
  let t217 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.match_mp_tac(
        @class.taut(@term_syntax.parse_term("!(p : Bool) == !(q : Bool) → p == q")),
      ),
    ),
    t216,
  )
  exists_tripled_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B, C) -> Bool, (∃ (x, y, z) : (A, B, C), P(x, y, z)) == (∃ x : A, ∃ y : B, ∃ z : C, P(x, y, z))"),
      t217,
    ),
  )
}

///|
let exists_tripled_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_TRIPLED_THM",
)

///|
/// `EXISTS_TRIPLED_THM`
pub fn exists_tripled_thm() -> @kernel.Thm {
  exists_tripled_thm_c.get()
}

///|
/// CHOICE_UNPAIR_THM
fn step_59() -> Unit raise {
  let t218 = @simp.rewrite_tac(@list.List([lambda_pair()]))
  choice_unpair_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, select(GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), P(x, y)))) == select((p : (A, B)) => P(FST(p), SND(p)))"),
      t218,
    ),
  )
}

///|
let choice_unpair_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHOICE_UNPAIR_THM",
)

///|
/// `CHOICE_UNPAIR_THM`
pub fn choice_unpair_thm() -> @kernel.Thm {
  choice_unpair_thm_c.get()
}

///|
/// CHOICE_PAIRED_THM
fn step_60() -> Unit raise {
  let t229 = @meson.asm_meson_tac(@list.List([]))
  let t228 = @simp.rewrite_tac(@list.List([exists_pair_thm()]))
  let t227 = @tactics.remove_then("c", @tactics.match_mp_tac)
  let t226 = @tactics.remove_then("PQ", @tactics.match_mp_tac)
  let t225 = @simp.once_rewrite_tac(@list.List([@equal.gsym(pair())]))
  let t224 = @theorems.intro_tac("forall[c]; c")
  let t223 = @list.List([
    @simp.rewrite_tac(@list.List([lambda_pair_thm()])),
    @canon.select_elim_tac,
  ])
  let t222 = @tactics.subgoal_then(
    @term_syntax.parse_term("GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), (P : (A, B) -> Bool)(x, y))) == ((p : (A, B)) => P(FST(p), SND(p)))"),
    fn(
      x219 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s220 = @tactics.subst1_tac(x219)
      fn(
        x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s220(x221)
      }
    },
  )
  let t230 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @theorems.intro_tac("forall P Q; (@x0 y0. P0) PQ"),
                  t222,
                ),
                t223,
              ),
              t224,
            ),
            t225,
          ),
          t226,
        ),
        t227,
      ),
      t228,
    ),
    t229,
  )
  choice_paired_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ Q : ((A, B)) -> Bool, (∃ x : A, ∃ y : B, P(x, y)) && (∀ x : A, ∀ y : B, P(x, y) → Q((x, y))) → Q(select(fn { (x, y) => P(x, y) }))"),
      t230,
    ),
  )
}

///|
let choice_paired_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CHOICE_PAIRED_THM",
)

///|
/// `CHOICE_PAIRED_THM`
pub fn choice_paired_thm() -> @kernel.Thm {
  choice_paired_thm_c.get()
}

///|
/// let_CONV
fn step_61() -> Unit raise {
  let let1_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.rewr_conv(let_def()),
    gen_beta_conv,
  )
  let lete_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    let_end_def(),
  )
  fn expand_betas_conv(x231 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x231
    let tm_p = @kernel.rator(tm)
    let1_conv(tm) catch {
      Failure(_) => {
        let t232 = @kernel.rand(tm)
        let th1 = @equal.ap_thm(expand_betas_conv(tm_p), t232)
        let th2 = gen_beta_conv(@kernel.rand(@kernel.concl(th1)))
        @kernel.trans(th1, th2)
      }
      e => raise e
    }
  }
  let_conv_c.set(fn(x233 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x233
    let (ltm, pargs) = @basics.strip_comb(tm_1)
    if @kernel.dest_const(ltm).0 != "LET" || pargs == @list.List([]) {
      raise Failure("let_CONV")
    } else {
      let abstm = @lib.hd(pargs)
      let (vs, bod) = @basics.strip_gabs(abstm)
      let es = @lib.tl(pargs)
      let n = Int::to_int64(@lib.length(es))
      if Int::to_int64(@lib.length(vs)) != n {
        raise Failure("let_CONV")
      } else {
        @equal.thenc(expand_betas_conv, lete_conv)(tm_1)
      }
    }
  })
}

///|
let let_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "let_CONV",
)

///|
/// `let_CONV`
pub fn let_conv(x : @kernel.Term) -> @kernel.Thm raise {
  let_conv_c.get()(x)
}

///|
/// LET_TAC
fn step_62() -> Unit raise {
  let is_trivlet : (@kernel.Term) -> Bool raise = fn(
    x234 : @kernel.Term,
  ) -> Bool raise {
    let tm = x234
    try {
      let (assigs, bod) = @basics.dest_let(tm)
      @lib.forall(
        (x240 : (@kernel.Term, @kernel.Term)) => {
          @lib.uncurry(
            fn(x237 : @kernel.Term, x238 : @kernel.Term) -> Bool raise {
              let s239 = (fn(
                x235 : @kernel.Term,
              ) -> ((@kernel.Term) -> Bool raise) raise {
                fn(x236 : @kernel.Term) -> Bool raise { x235 == x236 }
              })(x237)
              s239(x238)
            },
            x240,
          )
        },
        assigs,
      )
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  let t241 = @meson.meson_tac(@list.List([pair(), pair_eq()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("(((x : _), (y : _)) == (a : (_, _))) == (x == FST(a) && y == SND(a))"),
    t241,
  )
  let rewr1_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x242 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s243 = @equal.top_depth_conv(x242)
      fn(x244 : @kernel.Term) -> @kernel.Thm raise { s243(x244) }
    },
    @list.List([pth]),
  )
  let t252 = @class.taut(@term_syntax.parse_term("((a : Bool) && true) == a"))
  let rewr2_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x251 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x245 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s246 = @equal.land_conv(x245)
        fn(x247 : @kernel.Term) -> @kernel.Thm raise { s246(x247) }
      })(
        (fn(
          x248 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s249 = @equal.depth_conv(x248)
          fn(x250 : @kernel.Term) -> @kernel.Thm raise { s249(x250) }
        })(x251),
      )
    },
    @list.List([@class.taut(@term_syntax.parse_term("((x : _) == x) == true")), t252]),
  )
  let prove_depairing_exists : (@kernel.Term) -> @kernel.Thm raise = fn(
    x253 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x253
    let th1 = rewr1_conv(tm_1)
    let tm1 = @kernel.rand(@kernel.concl(th1))
    let cjs = @basics.conjuncts(tm1)
    let vars = @lib.map(@equal.lhand, cjs)
    let t254 = @kernel.assume_rule(tm1)
    let th2 = @kernel.eq_mp(@equal.sym(th1), t254)
    let th3 = @bool.disch_all(@lib.itlist(@bool.simple_exists, vars, th2))
    let th4 = @kernel.inst_rule(
      @lib.map(
        fn(x255 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
          let t = x255
          let t256 = @equal.lhand(t)
          (@kernel.rand(t), t256)
        },
        cjs,
      ),
      th3,
    )
    @bool.mp(rewr2_rule(th4), @bool.truth())
  }
  let_tac_c.set(fn(
    x257 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) as gl = x257
    let path = @basics.find_path(is_trivlet, w) catch {
      Failure(_) =>
        @basics.find_path(
          fn(x258 : @kernel.Term) -> Bool raise { @basics.is_let(x258) },
          w,
        )
      e => raise e
    }
    let tm_2 = @basics.follow_path(path, w)
    let (assigs_1, bod_1) = @basics.dest_let(tm_2)
    let abbrevs = @lib.mapfilter(
      fn(x259 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        let (x, y) = x259
        if x == y {
          @lib.failure()
        } else {
          @basics.mk_eq(x, y)
        }
      },
      assigs_1,
    )
    let lvars = @lib.itlist(
      fn(
        x264 : @kernel.Term,
        x265 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x263 : @kernel.Term,
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          (fn(
            x260 : @list.List[@kernel.Term],
          ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
            fn(
              x261 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              @lib.union(x260, x261)
            }
          })(
            (fn(x262 : @kernel.Term) -> @list.List[@kernel.Term] raise {
              @kernel.frees(x262)
            })(x263),
          )
        })(@equal.lhs(x264))(x265)
      },
      abbrevs,
      @list.List([]),
    )
    let avoids = @lib.itlist(
      fn(
        x271 : (String, @kernel.Thm),
        x272 : @list.List[@kernel.Term],
      ) -> @list.List[@kernel.Term] raise {
        (fn(
          x269 : @kernel.Thm,
        ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          (fn(
            x266 : @list.List[@kernel.Term],
          ) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
            fn(
              x267 : @list.List[@kernel.Term],
            ) -> @list.List[@kernel.Term] raise {
              @lib.union(x266, x267)
            }
          })(
            (fn(x268 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
              @basics.thm_frees(x268)
            })(x269),
          )
        })(
          (fn(x270 : (String, @kernel.Thm)) -> @kernel.Thm raise { x270.1 })(
            x271,
          ),
        )(x272)
      },
      asl,
      @kernel.frees(w),
    )
    let t273 = @lib.zip(@basics.variants(avoids, lvars), lvars)
    let rename : (@kernel.Term) -> @kernel.Term raise = (x274 : @kernel.Term) => {
      @kernel.vsubst(t273, x274)
    }
    let abbrevs_p = @lib.map(
      fn(x275 : @kernel.Term) -> @kernel.Term raise {
        let eq = x275
        let (l, r) = @kernel.dest_eq(eq)
        @basics.mk_eq(rename(l), r)
      },
      abbrevs,
    )
    let deprths = @lib.map(prove_depairing_exists, abbrevs_p)
    @tactics.then_tac(
      @tactics.map_every(
        @tactics.repeat_tcl(@tactics.choose_then)(fn(
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
          let th = x276
          let th_p = @equal.sym(th)
          let t278 = @tactics.assume_tac(th_p)
          @tactics.then_tac(@tactics.subst_all_tac(th_p), t278)
        }),
        deprths,
      ),
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
        (fn(
          x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let (asl_p, w_p) = x279
          let tm_p = @basics.follow_path(path, w_p)
          let t281 = let_conv(tm_p)
          @tactics.conv_tac(
            @equal.path_conv(path, fn(
              x282 : @kernel.Term,
            ) -> @kernel.Thm raise {
              t281
            }),
          )
        })(x283)(x283)
      },
    )(gl)
  })
}

///|
let let_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("LET_TAC")

///|
/// `LET_TAC`
pub fn let_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  let_tac_c.get()(x)
}

///|
/// `SUBLET_CONV`
pub fn sublet_conv(
  x284 : (@kernel.Term) -> @kernel.Thm raise,
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let conv = x284
  fn largconv(x286 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x286
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("LET", _), _) => @kernel.refl(tm)
      @kernel.Term::Comb(l, r) => @equal.comb2_conv(largconv, conv)(tm)
      _ => raise Failure("SUBLET_CONV")
    }
  }
  fn(x287 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x287
    if @basics.is_let(tm_1) {
      largconv(tm_1)
    } else {
      raise Failure("SUBLET_CONV")
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
}
