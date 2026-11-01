// Translated from upstream Library/frag.ml; edit this file directly.

///|
/// frag_tybij
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([@sets.empty_gspec(), @sets.finite_empty()]),
  )
  let t2 = @tactics.then_tac(
    @tactics.exists_tac(@term_syntax.parse_term("(x : A) => int_of_num(0)")),
    t1,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("∃ f : (A) -> Int, FINITE({(x : A) | !(f(x) == int_of_num(0))})"),
    t2,
  )
  frag_tybij_c.set(
    @class.new_type_definition("frag", ("mk_frag", "dest_frag"), th),
  )
}

///|
let frag_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_tybij")

///|
/// `frag_tybij`
pub fn frag_tybij() -> @kernel.Thm {
  frag_tybij_c.get()
}

///|
/// frag_support
fn step_2() -> Unit raise {
  frag_support_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_support : (Frag[A], A) -> Bool)((x : Frag[A])) == {(a : A) | !(dest_frag(x, a) == int_of_num(0))}"),
    ),
  )
}

///|
let frag_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_support")

///|
/// `frag_support`
pub fn frag_support() -> @kernel.Thm {
  frag_support_c.get()
}

///|
/// frag_0
fn step_3() -> Unit raise {
  frag_0_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_0 : Frag[A]) == mk_frag((x : A) => int_of_num(0))"),
    ),
  )
}

///|
let frag_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_0")

///|
/// `frag_0`
pub fn frag_0() -> @kernel.Thm {
  frag_0_c.get()
}

///|
/// frag_of
fn step_4() -> Unit raise {
  frag_of_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_of : (A) -> Frag[A])((c : A)) == mk_frag((a : A) => if a == c { int_of_num(1) } else { int_of_num(0) })"),
    ),
  )
}

///|
let frag_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_of")

///|
/// `frag_of`
pub fn frag_of() -> @kernel.Thm {
  frag_of_c.get()
}

///|
/// frag_neg
fn step_5() -> Unit raise {
  frag_neg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_neg : (Frag[A]) -> Frag[A])((x : Frag[A])) == mk_frag((a : A) => -dest_frag(x, a))"),
    ),
  )
}

///|
let frag_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_neg")

///|
/// `frag_neg`
pub fn frag_neg() -> @kernel.Thm {
  frag_neg_c.get()
}

///|
/// frag_cmul
fn step_6() -> Unit raise {
  frag_cmul_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_cmul : (Int, Frag[A]) -> Frag[A])((c : Int), (x : Frag[A])) == mk_frag((a : A) => c * dest_frag(x, a))"),
    ),
  )
}

///|
let frag_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_cmul")

///|
/// `frag_cmul`
pub fn frag_cmul() -> @kernel.Thm {
  frag_cmul_c.get()
}

///|
/// frag_add
fn step_7() -> Unit raise {
  frag_add_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_add : (Frag[A], Frag[A]) -> Frag[A])((x : Frag[A]), (y : Frag[A])) == mk_frag((a : A) => dest_frag(x, a) + dest_frag(y, a))"),
    ),
  )
}

///|
let frag_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_add")

///|
/// `frag_add`
pub fn frag_add() -> @kernel.Thm {
  frag_add_c.get()
}

///|
/// frag_sub
fn step_8() -> Unit raise {
  frag_sub_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_sub : (Frag[A], Frag[A]) -> Frag[A])((x : Frag[A]), (y : Frag[A])) == mk_frag((a : A) => dest_frag(x, a) - dest_frag(y, a))"),
    ),
  )
}

///|
let frag_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_sub")

///|
/// `frag_sub`
pub fn frag_sub() -> @kernel.Thm {
  frag_sub_c.get()
}

///|
/// FRAG_EQ
fn step_9() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([frag_tybij()]))
  frag_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Frag[A], ∀ c2 : Frag[A], (c1 == c2) == (dest_frag(c1) == dest_frag(c2))"),
      t3,
    ),
  )
}

///|
let frag_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EQ")

///|
/// `FRAG_EQ`
pub fn frag_eq() -> @kernel.Thm {
  frag_eq_c.get()
}

///|
/// DEST_FRAG_0
fn step_10() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([@sets.empty_gspec(), @sets.finite_empty()]),
  )
  let t5 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([frag_0(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
    ),
    t4,
  )
  dest_frag_0_c.set(
    @tactics.prove(@term_syntax.parse_term("dest_frag(frag_0) == ((x : A) => int_of_num(0))"), t5),
  )
}

///|
let dest_frag_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_0")

///|
/// `DEST_FRAG_0`
pub fn dest_frag_0() -> @kernel.Thm {
  dest_frag_0_c.get()
}

///|
/// DEST_FRAG_OF
fn step_11() -> Unit raise {
  let t10 = @simp.rewrite_tac(
    @list.List([@sets.sing_gspec(), @sets.finite_sing()]),
  )
  let t9 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"),
      ),
    ]),
  )
  let t8 = @tactics.conv_tac(@int.int_reduce_conv)
  let t7 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t6 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t11 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([frag_of(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
            ),
            t6,
          ),
          t7,
        ),
        t8,
      ),
      t9,
    ),
    t10,
  )
  dest_frag_of_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : A, dest_frag(frag_of(c)) == ((a : A) => if a == c { int_of_num(1) } else { int_of_num(0) })"),
      t11,
    ),
  )
}

///|
let dest_frag_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_OF")

///|
/// `DEST_FRAG_OF`
pub fn dest_frag_of() -> @kernel.Thm {
  dest_frag_of_c.get()
}

///|
/// DEST_FRAG_NEG
fn step_12() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([frag_tybij(), @class.eta_ax()]))
  let t12 = @simp.rewrite_tac(@list.List([@int.int_neg_eq_0()]))
  let t14 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([frag_neg(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
      ),
      t12,
    ),
    t13,
  )
  dest_frag_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], dest_frag(frag_neg(x)) == ((a : A) => -dest_frag(x, a))"),
      t14,
    ),
  )
}

///|
let dest_frag_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_NEG")

///|
/// `DEST_FRAG_NEG`
pub fn dest_frag_neg() -> @kernel.Thm {
  dest_frag_neg_c.get()
}

///|
/// DEST_FRAG_CMUL
fn step_13() -> Unit raise {
  let t19 = @simp.rewrite_tac(@list.List([frag_tybij(), @class.eta_ax()]))
  let t18 = @simp.simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @class.contrapos_thm(),
      @int.int_mul_rzero(),
    ]),
  )
  let t17 = @tactics.exists_tac(
    @term_syntax.parse_term("{(a : A) | !(dest_frag((x : Frag[A]), a) == int_of_num(0))}"),
  )
  let t16 = @tactics.match_mp_tac(@sets.finite_subset())
  let t15 = @simp.rewrite_tac(
    @list.List([frag_cmul(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
  )
  let t20 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t15),
          t16,
        ),
        t17,
      ),
      t18,
    ),
    t19,
  )
  dest_frag_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Int, ∀ x : Frag[A], dest_frag(frag_cmul(c, x)) == ((a : A) => c * dest_frag(x, a))"),
      t20,
    ),
  )
}

///|
let dest_frag_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_CMUL")

///|
/// `DEST_FRAG_CMUL`
pub fn dest_frag_cmul() -> @kernel.Thm {
  dest_frag_cmul_c.get()
}

///|
/// DEST_FRAG_ADD
fn step_14() -> Unit raise {
  let t26 = @simp.rewrite_tac(
    @list.List([@sets.finite_union(), frag_tybij(), @class.eta_ax()]),
  )
  let t25 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@class.de_morgan_thm()),
      @class.contrapos_thm(),
      @int.int_add_lid(),
    ]),
  )
  let t24 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_union()]),
  )
  let t23 = @tactics.exists_tac(
    @term_syntax.parse_term("UNION({(a : A) | !(dest_frag((x : Frag[A]), a) == int_of_num(0))}, {(a : A) | !(dest_frag((y : Frag[A]), a) == int_of_num(0))})"),
  )
  let t22 = @tactics.match_mp_tac(@sets.finite_subset())
  let t21 = @simp.rewrite_tac(
    @list.List([frag_add(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
  )
  let t27 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t21),
            t22,
          ),
          t23,
        ),
        t24,
      ),
      t25,
    ),
    t26,
  )
  dest_frag_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], ∀ y : Frag[A], dest_frag(frag_add(x, y)) == ((a : A) => dest_frag(x, a) + dest_frag(y, a))"),
      t27,
    ),
  )
}

///|
let dest_frag_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_ADD")

///|
/// `DEST_FRAG_ADD`
pub fn dest_frag_add() -> @kernel.Thm {
  dest_frag_add_c.get()
}

///|
/// DEST_FRAG_SUB
fn step_15() -> Unit raise {
  let t33 = @simp.rewrite_tac(
    @list.List([@sets.finite_union(), frag_tybij(), @class.eta_ax()]),
  )
  let t32 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@class.de_morgan_thm()),
      @class.contrapos_thm(),
      @int.int_sub_rzero(),
    ]),
  )
  let t31 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_union()]),
  )
  let t30 = @tactics.exists_tac(
    @term_syntax.parse_term("UNION({(a : A) | !(dest_frag((x : Frag[A]), a) == int_of_num(0))}, {(a : A) | !(dest_frag((y : Frag[A]), a) == int_of_num(0))})"),
  )
  let t29 = @tactics.match_mp_tac(@sets.finite_subset())
  let t28 = @simp.rewrite_tac(
    @list.List([frag_sub(), @equal.gsym(@bool.conjunct2(frag_tybij()))]),
  )
  let t34 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t28),
            t29,
          ),
          t30,
        ),
        t31,
      ),
      t32,
    ),
    t33,
  )
  dest_frag_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], ∀ y : Frag[A], dest_frag(frag_sub(x, y)) == ((a : A) => dest_frag(x, a) - dest_frag(y, a))"),
      t34,
    ),
  )
}

///|
let dest_frag_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_FRAG_SUB")

///|
/// `DEST_FRAG_SUB`
pub fn dest_frag_sub() -> @kernel.Thm {
  dest_frag_sub_c.get()
}

///|
/// FRAG_OF_NONZERO
fn step_16() -> Unit raise {
  let t44 = @tactics.conv_tac(@int.int_reduce_conv)
  let t43 = @simp.rewrite_tac(@list.List([dest_frag_of(), dest_frag_0()]))
  let t41 = @drule.match_mp(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(c : Frag[A]) == (d : Frag[A]) → (∀ a : A, dest_frag(c, a) == dest_frag(d, a))"),
    ),
  )
  let t38 = @term_syntax.parse_term("(a : A)")
  let t45 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.disch_then(fn(
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
          (fn(
            x40 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x35 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s36 = @tactics.mp_tac(x35)
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
            })(((x39 : @kernel.Thm) => @bool.spec(t38, x39))(x40))
          })(t41(x42))
        }),
      ),
      t43,
    ),
    t44,
  )
  frag_of_nonzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, !(frag_of(a) == frag_0)"), t45),
  )
}

///|
let frag_of_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_OF_NONZERO",
)

///|
/// `FRAG_OF_NONZERO`
pub fn frag_of_nonzero() -> @kernel.Thm {
  frag_of_nonzero_c.get()
}

///|
/// FRAG_MODULE
fn step_17() -> Unit raise {
  let t61 = @tactics.conv_tac(@int.int_ring)
  let t59 = @tactics.try_tac(
    @tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac),
  )
  let t60 = @tactics.orelse_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
    t59,
  )
  let t58 = @simp.gen_rewrite_tac(
    fn(
      x55 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s56 = @equal.depth_conv(x55)
      fn(x57 : @kernel.Term) -> @kernel.Thm raise { s56(x57) }
    },
    @list.List([
      @theorems.and_forall_thm(),
      @class.left_or_forall_thm(),
      @class.right_or_forall_thm(),
    ]),
  )
  let t54 = @simp.gen_rewrite_tac(
    fn(
      x51 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s52 = @equal.top_depth_conv(x51)
      fn(x53 : @kernel.Term) -> @kernel.Thm raise { s52(x53) }
    },
    @list.List([
      dest_frag_0(),
      dest_frag_neg(),
      dest_frag_cmul(),
      dest_frag_add(),
      dest_frag_sub(),
      @theorems.beta_thm(),
    ]),
  )
  let t49 = @term_syntax.parse_term("∀ x : Frag[A], ∀ y : Frag[A], (x == y) == (∀ a : A, dest_frag(x, a) == dest_frag(y, a))")
  let t50 = @simp.gen_rewrite_tac(
    fn(
      x46 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s47 = @equal.once_depth_conv(x46)
      fn(x48 : @kernel.Term) -> @kernel.Thm raise { s47(x48) }
    },
    @list.List([
      @meson.meson(
        @list.List([@bool.conjunct1(frag_tybij()), @class.fun_eq_thm()]),
        t49,
      ),
    ]),
  )
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(
              @tactics.orelse_tac(@tactics.conj_tac, @tactics.gen_tac),
            ),
            t50,
          ),
          t54,
        ),
        t58,
      ),
      t60,
    ),
    t61,
  )
  frag_module_c.set(fn(x62 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x62
    @tactics.prove(tm, tac)
  })
}

///|
let frag_module_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "FRAG_MODULE",
)

///|
/// `FRAG_MODULE`
pub fn frag_module(x : @kernel.Term) -> @kernel.Thm raise {
  frag_module_c.get()(x)
}

///|
/// FINITE_FRAG_SUPPORT
fn step_18() -> Unit raise {
  let t63 = @simp.rewrite_tac(
    @list.List([frag_support(), frag_tybij(), @class.eta_ax()]),
  )
  finite_frag_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], FINITE(frag_support(x))"),
      t63,
    ),
  )
}

///|
let finite_frag_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_FRAG_SUPPORT",
)

///|
/// `FINITE_FRAG_SUPPORT`
pub fn finite_frag_support() -> @kernel.Thm {
  finite_frag_support_c.get()
}

///|
/// FRAG_SUPPORT_0
fn step_19() -> Unit raise {
  let t64 = @simp.rewrite_tac(
    @list.List([frag_support(), dest_frag_0(), @sets.empty_gspec()]),
  )
  frag_support_0_c.set(
    @tactics.prove(@term_syntax.parse_term("(frag_support : (Frag[_], _) -> Bool)((frag_0 : Frag[_])) == ({} : (_) -> Bool)"), t64),
  )
}

///|
let frag_support_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_SUPPORT_0")

///|
/// `FRAG_SUPPORT_0`
pub fn frag_support_0() -> @kernel.Thm {
  frag_support_0_c.get()
}

///|
/// FRAG_SUPPORT_OF
fn step_20() -> Unit raise {
  let t69 = @simp.rewrite_tac(@list.List([@sets.sing_gspec()]))
  let t68 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"),
      ),
    ]),
  )
  let t67 = @tactics.conv_tac(@int.int_reduce_conv)
  let t66 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t65 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([frag_support(), dest_frag_of()])),
            t65,
          ),
          t66,
        ),
        t67,
      ),
      t68,
    ),
    t69,
  )
  frag_support_of_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : A, frag_support(frag_of(a)) == {a}"),
      t70,
    ),
  )
}

///|
let frag_support_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_OF",
)

///|
/// `FRAG_SUPPORT_OF`
pub fn frag_support_of() -> @kernel.Thm {
  frag_support_of_c.get()
}

///|
/// FRAG_SUPPORT_NEG
fn step_21() -> Unit raise {
  let t71 = @simp.rewrite_tac(
    @list.List([frag_support(), dest_frag_neg(), @int.int_neg_eq_0()]),
  )
  frag_support_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], frag_support(frag_neg(x)) == frag_support(x)"),
      t71,
    ),
  )
}

///|
let frag_support_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_NEG",
)

///|
/// `FRAG_SUPPORT_NEG`
pub fn frag_support_neg() -> @kernel.Thm {
  frag_support_neg_c.get()
}

///|
/// FRAG_SUPPORT_CMUL
fn step_22() -> Unit raise {
  let t73 = @simp.rewrite_tac(@list.List([frag_tybij(), @class.eta_ax()]))
  let t72 = @simp.simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @class.contrapos_thm(),
      @int.int_mul_rzero(),
    ]),
  )
  let t74 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([frag_support(), dest_frag_cmul()])),
      t72,
    ),
    t73,
  )
  frag_support_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ x : Frag[A], SUBSET(frag_support(frag_cmul(a, x)), frag_support(x))"),
      t74,
    ),
  )
}

///|
let frag_support_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_CMUL",
)

///|
/// `FRAG_SUPPORT_CMUL`
pub fn frag_support_cmul() -> @kernel.Thm {
  frag_support_cmul_c.get()
}

///|
/// FRAG_SUPPORT_ADD
fn step_23() -> Unit raise {
  let t76 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@class.de_morgan_thm()),
      @class.contrapos_thm(),
      @int.int_add_lid(),
    ]),
  )
  let t75 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_union()]),
  )
  let t77 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([frag_support(), dest_frag_add()])),
      t75,
    ),
    t76,
  )
  frag_support_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], ∀ y : Frag[A], SUBSET(frag_support(frag_add(x, y)), UNION(frag_support(x), frag_support(y)))"),
      t77,
    ),
  )
}

///|
let frag_support_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_ADD",
)

///|
/// `FRAG_SUPPORT_ADD`
pub fn frag_support_add() -> @kernel.Thm {
  frag_support_add_c.get()
}

///|
/// FRAG_SUPPORT_SUB
fn step_24() -> Unit raise {
  let t79 = @simp.simp_tac(
    @list.List([
      @equal.gsym(@class.de_morgan_thm()),
      @class.contrapos_thm(),
      @int.int_sub_rzero(),
    ]),
  )
  let t78 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_union()]),
  )
  let t80 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([frag_support(), dest_frag_sub()])),
      t78,
    ),
    t79,
  )
  frag_support_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], ∀ y : Frag[A], SUBSET(frag_support(frag_sub(x, y)), UNION(frag_support(x), frag_support(y)))"),
      t80,
    ),
  )
}

///|
let frag_support_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_SUB",
)

///|
/// `FRAG_SUPPORT_SUB`
pub fn frag_support_sub() -> @kernel.Thm {
  frag_support_sub_c.get()
}

///|
/// FRAG_SUPPORT_EQ_EMPTY
fn step_25() -> Unit raise {
  let t82 = @simp.rewrite_tac(
    @list.List([
      dest_frag_0(),
      @class.fun_eq_thm(),
      frag_support(),
      @sets.in_elim_thm(),
    ]),
  )
  let t81 = @simp.rewrite_tac(
    @list.List([
      @meson.meson(
        @list.List([frag_tybij()]),
        @term_syntax.parse_term("((c : Frag[_]) == (d : Frag[_])) == (dest_frag(c) == dest_frag(d))"),
      ),
    ]),
  )
  let t83 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty()])),
      t81,
    ),
    t82,
  )
  frag_support_eq_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Frag[A], (frag_support(c) == {}) == (c == frag_0)"),
      t83,
    ),
  )
}

///|
let frag_support_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_EQ_EMPTY",
)

///|
/// `FRAG_SUPPORT_EQ_EMPTY`
pub fn frag_support_eq_empty() -> @kernel.Thm {
  frag_support_eq_empty_c.get()
}

///|
/// FRAG_OF_EQ
fn step_26() -> Unit raise {
  let t84 = @meson.meson_tac(
    @list.List([
      frag_support_of(),
      @sets.set_rule(@term_syntax.parse_term("({(x : _)} == {(y : _)}) == (x == y)")),
    ]),
  )
  frag_of_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ y : A, (frag_of(x) == frag_of(y)) == (x == y)"),
      t84,
    ),
  )
}

///|
let frag_of_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_OF_EQ")

///|
/// `FRAG_OF_EQ`
pub fn frag_of_eq() -> @kernel.Thm {
  frag_of_eq_c.get()
}

///|
/// FRAG_ADD_EQ_0
fn step_27() -> Unit raise {
  let t96 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t95 = @tactics.match_mp_tac(
    @int.int_arith(
      @term_syntax.parse_term("!(!((x : Int) == int_of_num(0)) && !((y : Int) == int_of_num(0))) → x + y == int_of_num(0) → x == int_of_num(0) && y == int_of_num(0)"),
    ),
  )
  let t94 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t93 = @simp.rewrite_tac(
    @list.List([
      dest_frag_add(),
      dest_frag_0(),
      @class.fun_eq_thm(),
      @theorems.and_forall_thm(),
    ]),
  )
  let t92 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x86 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s87 = @tactics.assume_tac(x86)
        fn(
          x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s87(x88)
        }
      },
      fn(
        x89 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s90 = @tactics.mp_tac(x89)
        fn(
          x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s90(x91)
        }
      },
    ),
  )
  let t85 = @simp.rewrite_tac(@list.List([frag_support(), frag_eq()]))
  let t97 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t85),
              t92,
            ),
            t93,
          ),
          t94,
        ),
        @tactics.gen_tac,
      ),
      t95,
    ),
    t96,
  )
  frag_add_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Frag[A], ∀ c2 : Frag[A], DISJOINT(frag_support(c1), frag_support(c2)) && frag_add(c1, c2) == frag_0 → c1 == frag_0 && c2 == frag_0"),
      t97,
    ),
  )
}

///|
let frag_add_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_ADD_EQ_0")

///|
/// `FRAG_ADD_EQ_0`
pub fn frag_add_eq_0() -> @kernel.Thm {
  frag_add_eq_0_c.get()
}

///|
/// NEUTRAL_FRAG_ADD
fn step_28() -> Unit raise {
  let t98 = @simp.rewrite_tac(
    @list.List([
      @iterate.neutral(),
      frag_module(
        @term_syntax.parse_term("(frag_add((x : Frag[_]), (y : Frag[_])) == y) == (x == frag_0) && (frag_add(y, x) == y) == (x == frag_0)"),
      ),
    ]),
  )
  neutral_frag_add_c.set(
    @tactics.prove(@term_syntax.parse_term("(neutral : ((Frag[A], Frag[A]) -> Frag[A]) -> Frag[A])((frag_add : (Frag[A], Frag[A]) -> Frag[A])) == (frag_0 : Frag[A])"), t98),
  )
}

///|
let neutral_frag_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NEUTRAL_FRAG_ADD",
)

///|
/// `NEUTRAL_FRAG_ADD`
pub fn neutral_frag_add() -> @kernel.Thm {
  neutral_frag_add_c.get()
}

///|
/// MONOIDAL_FRAG_ADD
fn step_29() -> Unit raise {
  let t99 = @tactics.conv_tac(frag_module)
  let t100 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_frag_add()])),
    t99,
  )
  monoidal_frag_add_c.set(
    @tactics.prove(@term_syntax.parse_term("(monoidal : ((Frag[_], Frag[_]) -> Frag[_]) -> Bool)((frag_add : (Frag[_], Frag[_]) -> Frag[_]))"), t100),
  )
}

///|
let monoidal_frag_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_FRAG_ADD",
)

///|
/// `MONOIDAL_FRAG_ADD`
pub fn monoidal_frag_add() -> @kernel.Thm {
  monoidal_frag_add_c.get()
}

///|
/// FRAG_CMUL_SUM
fn step_30() -> Unit raise {
  let t114 = @simp.simp_tac(
    @list.List([
      frag_module(
        @term_syntax.parse_term("frag_cmul((a : Int), frag_add((x : Frag[_]), (y : Frag[_]))) == frag_add(frag_cmul(a, x), frag_cmul(a, y))"),
      ),
    ]),
  )
  let t113 = @simp.rewrite_tac(
    @list.List([
      neutral_frag_add(),
      frag_module(@term_syntax.parse_term("(frag_cmul : (Int, Frag[_]) -> Frag[_])((a : Int), (frag_0 : Frag[_])) == (frag_0 : Frag[_])")),
    ]),
  )
  let t112 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t111 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t109 = @term_syntax.parse_term("(k : (B) -> Bool)")
  let t110 = @tactics.spec_tac(
    @term_syntax.parse_term("{(x : B) | IN(x, (k : (B) -> Bool)) && !((f : (B) -> Frag[A])(x) == frag_0)}"),
    t109,
  )
  let t108 = @tactics.undisch_tac(
    @term_syntax.parse_term("FINITE({(x : B) | IN(x, (k : (B) -> Bool)) && !((f : (B) -> Frag[A])(x) == frag_0)})"),
  )
  let t107 = @simp.asm_rewrite_tac(
    @list.List([frag_module(@term_syntax.parse_term("(frag_cmul : (Int, Frag[_]) -> Frag[_])((a : Int), (frag_0 : Frag[_])) == (frag_0 : Frag[_])"))]),
  )
  let t106 = @simp.asm_rewrite_tac(
    @list.List([
      @iterate.support(),
      neutral_frag_add(),
      frag_module(
        @term_syntax.parse_term("(frag_cmul((a : Int), (c : Frag[_])) == frag_0) == (a == int_of_num(0) || c == frag_0)"),
      ),
    ]),
  )
  let t105 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t102 = @drule.match_mp(@iterate.iterate_eq_neutral())(monoidal_frag_add())
  let t103 = @simp.rewrite_rule(@list.List([neutral_frag_add()]))(t102)
  let t104 = @simp.asm_simp_tac(
    @list.List([
      @int.int_mul_lzero(),
      frag_module(@term_syntax.parse_term("frag_cmul(int_of_num(0), (x : Frag[_])) == frag_0")),
      t103,
    ]),
  )
  let t101 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Int) == int_of_num(0)"))
  let t115 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t101,
                        ),
                        t104,
                      ),
                      t105,
                    ),
                    t106,
                  ),
                  @class.cond_cases_tac,
                ),
                t107,
              ),
              t108,
            ),
            t110,
          ),
          t111,
        ),
        t112,
      ),
      t113,
    ),
    t114,
  )
  frag_cmul_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (B) -> Frag[A], ∀ k : (B) -> Bool, ∀ a : Int, frag_cmul(a, iterate(frag_add, k, f)) == iterate(frag_add, k, (b : B) => frag_cmul(a, f(b)))"),
      t115,
    ),
  )
}

///|
let frag_cmul_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_CMUL_SUM")

///|
/// `FRAG_CMUL_SUM`
pub fn frag_cmul_sum() -> @kernel.Thm {
  frag_cmul_sum_c.get()
}

///|
/// FRAG_SUPPORT_SUM
fn step_31() -> Unit raise {
  let t142 = @simp.simp_tac(
    @list.List([@iterate.support_subset(), @sets.image_subset()]),
  )
  let t141 = @tactics.match_mp_tac(@sets.subset_unions())
  let t143 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@sets.simple_image()])),
      t141,
    ),
    t142,
  )
  let t140 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t134 = @drule.part_match(@equal.lhand, frag_support_add())
  let t130 = @tactics.repeat_tac(@tactics.strip_tac)
  let t129 = @simp.rewrite_tac(
    @list.List([frag_support_0(), @sets.empty_subset()]),
  )
  let t128 = @simp.rewrite_tac(
    @list.List([@sets.simple_image(), @sets.image_clauses(), neutral_frag_add()]),
  )
  let t127 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t126 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t124 = @term_syntax.parse_term("(k : (B) -> Bool)")
  let t125 = @tactics.spec_tac(
    @term_syntax.parse_term("support(frag_add, (f : (B) -> Frag[A]), (k : (B) -> Bool))"),
    t124,
  )
  let t144 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.pop_assum(fn(
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
                      let s122 = @tactics.mp_tac(x121)
                      fn(
                        x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s122(x123)
                      }
                    }),
                    t125,
                  ),
                  t126,
                ),
                t127,
              ),
              t128,
            ),
            t129,
          ),
          t130,
        ),
        fn(
          x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x136 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x135 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  let s132 = @tactics.mp_tac(x131)
                  fn(
                    x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s132(x133)
                  }
                })(t134(x135))
              })(@equal.lhand(x136))
            })(
              (fn(
                x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x137.1
              })(x138),
            )
          })(x139)(x139)
        },
      ),
      t140,
    ),
    t143,
  ])
  let t119 = @term_syntax.parse_term("UNIONS({frag_support((f : (B) -> Frag[A])(i)) | i : B | IN(i, support(frag_add, f, (k : (B) -> Bool)))})")
  let t120 = @tactics.trans_tac(@sets.subset_trans())(t119)
  let t118 = @simp.rewrite_tac(
    @list.List([frag_support_0(), @sets.empty_subset()]),
  )
  let t117 = @simp.rewrite_tac(@list.List([neutral_frag_add()]))
  let t116 = @simp.once_rewrite_tac(
    @list.List([@iterate.iterate_expand_cases()]),
  )
  let t145 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t116),
              t117,
            ),
            @class.cond_cases_tac,
          ),
          t118,
        ),
        t120,
      ),
      @tactics.conj_tac,
    ),
    t144,
  )
  frag_support_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (B) -> Frag[A], ∀ k : (B) -> Bool, SUBSET(frag_support(iterate(frag_add, k, f)), UNIONS({frag_support(f((i : B))) | IN(i, k)}))"),
      t145,
    ),
  )
}

///|
let frag_support_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_SUM",
)

///|
/// `FRAG_SUPPORT_SUM`
pub fn frag_support_sum() -> @kernel.Thm {
  frag_support_sum_c.get()
}

///|
/// frag_extend
fn step_32() -> Unit raise {
  frag_extend_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(frag_extend : ((A) -> Frag[B], Frag[A]) -> Frag[B])((f : (A) -> Frag[B]), (x : Frag[A])) == iterate(frag_add, frag_support(x), (a : A) => frag_cmul(dest_frag(x, a), f(a)))"),
    ),
  )
}

///|
let frag_extend_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frag_extend")

///|
/// `frag_extend`
pub fn frag_extend() -> @kernel.Thm {
  frag_extend_c.get()
}

///|
/// FRAG_EXTEND
fn step_33() -> Unit raise {
  let t151 = @tactics.conv_tac(frag_module)
  let t150 = @tactics.repeat_tac(@tactics.strip_tac)
  let t149 = @simp.simp_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm(), @class.contrapos_thm()]),
  )
  let t148 = @simp.rewrite_tac(
    @list.List([
      @iterate.support(),
      neutral_frag_add(),
      frag_support(),
      @sets.in_univ(),
    ]),
  )
  let t147 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_univ())(monoidal_frag_add()),
  )
  let t146 = @simp.rewrite_tac(@list.List([frag_extend()]))
  let t152 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t146),
            t147,
          ),
          t148,
        ),
        t149,
      ),
      t150,
    ),
    t151,
  )
  frag_extend_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ x : Frag[A], frag_extend(f, x) == iterate(frag_add, UNIV, (a : A) => frag_cmul(dest_frag(x, a), f(a)))"),
      t152,
    ),
  )
}

///|
let frag_extend_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EXTEND")

///|
/// `FRAG_EXTEND`
pub fn frag_extend_v1() -> @kernel.Thm {
  frag_extend_v1_c.get()
}

///|
/// FRAG_EXTEND_0
fn step_34() -> Unit raise {
  let t154 = @simp.rewrite_tac(@list.List([neutral_frag_add()]))
  let t153 = @simp.rewrite_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t155 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([frag_extend(), frag_support_0()])),
      t153,
    ),
    t154,
  )
  frag_extend_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], frag_extend(f, frag_0) == frag_0"),
      t155,
    ),
  )
}

///|
let frag_extend_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EXTEND_0")

///|
/// `FRAG_EXTEND_0`
pub fn frag_extend_0() -> @kernel.Thm {
  frag_extend_0_c.get()
}

///|
/// FRAG_EXTEND_OF
fn step_35() -> Unit raise {
  let t158 = @tactics.conv_tac(frag_module)
  let t157 = @simp.rewrite_tac(
    @list.List([@sets.not_in_empty(), neutral_frag_add(), dest_frag_of()]),
  )
  let t156 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
      @sets.finite_empty(),
    ]),
  )
  let t159 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([frag_extend(), frag_support_of()])),
        t156,
      ),
      t157,
    ),
    t158,
  )
  frag_extend_of_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ a : A, frag_extend(f, frag_of(a)) == f(a)"),
      t159,
    ),
  )
}

///|
let frag_extend_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EXTEND_OF")

///|
/// `FRAG_EXTEND_OF`
pub fn frag_extend_of() -> @kernel.Thm {
  frag_extend_of_c.get()
}

///|
/// FRAG_EXTEND_CMUL
fn step_36() -> Unit raise {
  let t163 = @simp.asm_rewrite_tac(
    @list.List([
      @int.int_entire(),
      frag_cmul_sum(),
      frag_module(
        @term_syntax.parse_term("frag_cmul((a : Int) * (b : Int), (c : Frag[_])) == frag_cmul(a, frag_cmul(b, c))"),
      ),
    ]),
  )
  let t162 = @simp.rewrite_tac(
    @list.List([frag_extend(), frag_support(), dest_frag_cmul()]),
  )
  let t161 = @simp.asm_rewrite_tac(
    @list.List([
      frag_module(@term_syntax.parse_term("frag_cmul(int_of_num(0), (x : Frag[_])) == frag_0")),
      frag_extend_0(),
    ]),
  )
  let t160 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Int) == int_of_num(0)"))
  let t164 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t160),
        t161,
      ),
      t162,
    ),
    t163,
  )
  frag_extend_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ c : Int, ∀ x : Frag[A], frag_extend(f, frag_cmul(c, x)) == frag_cmul(c, frag_extend(f, x))"),
      t164,
    ),
  )
}

///|
let frag_extend_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_CMUL",
)

///|
/// `FRAG_EXTEND_CMUL`
pub fn frag_extend_cmul() -> @kernel.Thm {
  frag_extend_cmul_c.get()
}

///|
/// FRAG_EXTEND_NEG
fn step_37() -> Unit raise {
  let t165 = @simp.rewrite_tac(@list.List([frag_extend_cmul()]))
  let t166 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        frag_module(@term_syntax.parse_term("frag_neg((x : Frag[_])) == frag_cmul(-int_of_num(1), x)")),
      ]),
    ),
    t165,
  )
  frag_extend_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ x : Frag[A], frag_extend(f, frag_neg(x)) == frag_neg(frag_extend(f, x))"),
      t166,
    ),
  )
}

///|
let frag_extend_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_NEG",
)

///|
/// `FRAG_EXTEND_NEG`
pub fn frag_extend_neg() -> @kernel.Thm {
  frag_extend_neg_c.get()
}

///|
/// FRAG_EXTEND_ADD
fn step_38() -> Unit raise {
  let t192 = @tactics.conv_tac(frag_module)
  let t191 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t190 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_eq())(monoidal_frag_add()),
  )
  let t193 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x189 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x186 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s187 = @tactics.subst1_tac(x186)
            fn(
              x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s187(x188)
            }
          })(@equal.sym(x189))
        }),
        t190,
      ),
      t191,
    ),
    t192,
  )
  let t185 = @tactics.conv_tac(frag_module)
  let t184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t183 = @simp.simp_tac(
    @list.List([
      @sets.subset(),
      @sets.in_elim_thm(),
      @class.contrapos_thm(),
      frag_support(),
    ]),
  )
  let t182 = @simp.rewrite_tac(@list.List([finite_frag_support()]))
  let t180 = @tactics.exists_tac(@term_syntax.parse_term("frag_support((y : Frag[A]))"))
  let t181 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("frag_support((x : Frag[A]))")),
    t180,
  ])
  let t179 = @tactics.match_mp_tac(@sets.finite_subset())
  let t194 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([
                      @iterate.support(),
                      neutral_frag_add(),
                      @sets.in_univ(),
                    ]),
                  ),
                  @tactics.conj_tac,
                ),
                t179,
              ),
              t181,
            ),
            t182,
          ),
          t183,
        ),
        t184,
      ),
      t185,
    ),
    t193,
  ])
  let t178 = @simp.rewrite_tac(@list.List([]))
  let t172 = @drule.part_match(
    fn(x171 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x171))
    },
    @drule.match_mp(@iterate.iterate_op_gen())(monoidal_frag_add()),
  )
  let t167 = @simp.rewrite_tac(@list.List([frag_extend_v1()]))
  let t195 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t167),
          fn(
            x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x174 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x173 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x168 : @kernel.Thm,
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
                    let s169 = @tactics.mp_tac(x168)
                    fn(
                      x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s169(x170)
                    }
                  })(t172(x173))
                })(@kernel.rand(x174))
              })(
                (fn(
                  x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x175.1
                })(x176),
              )
            })(x177)(x177)
          },
        ),
        t178,
      ),
      @tactics.ants_tac,
    ),
    t194,
  )
  frag_extend_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ x : Frag[A], ∀ y : Frag[A], frag_extend(f, frag_add(x, y)) == frag_add(frag_extend(f, x), frag_extend(f, y))"),
      t195,
    ),
  )
}

///|
let frag_extend_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_ADD",
)

///|
/// `FRAG_EXTEND_ADD`
pub fn frag_extend_add() -> @kernel.Thm {
  frag_extend_add_c.get()
}

///|
/// FRAG_EXTEND_SUB
fn step_39() -> Unit raise {
  let t196 = @simp.rewrite_tac(
    @list.List([frag_extend_cmul(), frag_extend_add()]),
  )
  let t197 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        frag_module(
          @term_syntax.parse_term("frag_sub((x : Frag[_]), (y : Frag[_])) == frag_add(x, frag_cmul(-int_of_num(1), y))"),
        ),
      ]),
    ),
    t196,
  )
  frag_extend_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ x : Frag[A], ∀ y : Frag[A], frag_extend(f, frag_sub(x, y)) == frag_sub(frag_extend(f, x), frag_extend(f, y))"),
      t197,
    ),
  )
}

///|
let frag_extend_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_SUB",
)

///|
/// `FRAG_EXTEND_SUB`
pub fn frag_extend_sub() -> @kernel.Thm {
  frag_extend_sub_c.get()
}

///|
/// FRAG_EXTEND_SUM
fn step_40() -> Unit raise {
  let t201 = @simp.simp_tac(
    @list.List([
      neutral_frag_add(),
      frag_extend_0(),
      frag_extend_add(),
      @trivia.o_thm(),
    ]),
  )
  let t200 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t199 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t198 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t202 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          t198,
        ),
        t199,
      ),
      t200,
    ),
    t201,
  )
  frag_extend_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ g : (C) -> Frag[A], ∀ k : (C) -> Bool, FINITE(k) → frag_extend(f, iterate(frag_add, k, g)) == iterate(frag_add, k, o(frag_extend(f), g))"),
      t202,
    ),
  )
}

///|
let frag_extend_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_SUM",
)

///|
/// `FRAG_EXTEND_SUM`
pub fn frag_extend_sum() -> @kernel.Thm {
  frag_extend_sum_c.get()
}

///|
/// FRAG_EXTEND_EQ
fn step_41() -> Unit raise {
  let t205 = @simp.asm_simp_tac(@list.List([]))
  let t204 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_eq())(monoidal_frag_add()),
  )
  let t203 = @simp.rewrite_tac(@list.List([frag_extend()]))
  let t206 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t203),
      t204,
    ),
    t205,
  )
  frag_extend_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ g : (A) -> Frag[B], ∀ h : (A) -> Frag[B], ∀ c : Frag[A], (∀ f : A, IN(f, frag_support(c)) → g(f) == h(f)) → frag_extend(g, c) == frag_extend(h, c)"),
      t206,
    ),
  )
}

///|
let frag_extend_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EXTEND_EQ")

///|
/// `FRAG_EXTEND_EQ`
pub fn frag_extend_eq() -> @kernel.Thm {
  frag_extend_eq_c.get()
}

///|
/// FRAG_EXTEND_EQ_0
fn step_42() -> Unit raise {
  let t212 = @tactics.conv_tac(frag_module)
  let t211 = @tactics.repeat_tac(@tactics.strip_tac)
  let t210 = @simp.asm_simp_tac(@list.List([neutral_frag_add()]))
  let t209 = @tactics.match_mp_tac(
    @drule.match_mp(@iterate.iterate_eq_neutral())(monoidal_frag_add()),
  )
  let t208 = @simp.rewrite_tac(@list.List([@equal.gsym(neutral_frag_add())]))
  let t207 = @simp.rewrite_tac(@list.List([frag_extend()]))
  let t213 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t207),
            t208,
          ),
          t209,
        ),
        t210,
      ),
      t211,
    ),
    t212,
  )
  frag_extend_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ c : Frag[A], (∀ a : A, IN(a, frag_support(c)) → f(a) == frag_0) → frag_extend(f, c) == frag_0"),
      t213,
    ),
  )
}

///|
let frag_extend_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_EQ_0",
)

///|
/// `FRAG_EXTEND_EQ_0`
pub fn frag_extend_eq_0() -> @kernel.Thm {
  frag_extend_eq_0_c.get()
}

///|
/// FRAG_SUPPORT_FRAG_EXTEND
fn step_43() -> Unit raise {
  let t227 = @simp.rewrite_tac(@list.List([frag_support_cmul()]))
  let t226 = @tactics.match_mp_tac(@sets.unions_mono_image())
  let t225 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t224 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.subset_trans(),
    ),
  )
  let t218 = @drule.part_match(@equal.lhand, frag_support_sum())
  let t214 = @simp.rewrite_tac(@list.List([frag_extend()]))
  let t228 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t214),
            fn(
              x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x220 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x219 : @kernel.Term,
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
                      x215 : @kernel.Thm,
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
                      let s216 = @tactics.mp_tac(x215)
                      fn(
                        x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s216(x217)
                      }
                    })(t218(x219))
                  })(@equal.lhand(x220))
                })(
                  (fn(
                    x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x221.1
                  })(x222),
                )
              })(x223)(x223)
            },
          ),
          t224,
        ),
        t225,
      ),
      t226,
    ),
    t227,
  )
  frag_support_frag_extend_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Frag[B], ∀ c : Frag[A], SUBSET(frag_support(frag_extend(f, c)), UNIONS({frag_support(f((a : A))) | IN(a, frag_support(c))}))"),
      t228,
    ),
  )
}

///|
let frag_support_frag_extend_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_SUPPORT_FRAG_EXTEND",
)

///|
/// `FRAG_SUPPORT_FRAG_EXTEND`
pub fn frag_support_frag_extend() -> @kernel.Thm {
  frag_support_frag_extend_c.get()
}

///|
/// FRAG_EXPANSION
fn step_44() -> Unit raise {
  let t242 = @meson.meson_tac(@list.List([]))
  let t243 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([frag_support(), @sets.in_elim_thm()])),
    t242,
  )
  let t241 = @simp.asm_simp_tac(@list.List([@sets.in_insert()]))
  let t240 = @class.asm_cases_tac(@term_syntax.parse_term("(b : A) == (a : A)"))
  let t238 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t239 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : A)"), t238]),
  )
  let t237 = @simp.simp_tac(
    @list.List([dest_frag_add(), dest_frag_cmul(), dest_frag_of()]),
  )
  let t236 = @simp.rewrite_tac(
    @list.List([@sets.not_in_empty(), neutral_frag_add(), dest_frag_0()]),
  )
  let t235 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t244 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@sets.finite_induct_strong()),
                  t235,
                ),
                t236,
              ),
              t237,
            ),
            t239,
          ),
          t240,
        ),
        t241,
      ),
      @int.int_arith_tac,
    ),
    t243,
  ])
  let t234 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ k : (A) -> Bool, FINITE(k) → dest_frag(iterate(frag_add, k, (a : A) => frag_cmul(dest_frag((x : Frag[A]), a), frag_of(a))), (b : A)) == (if IN(b, k) { dest_frag(x, b) } else { int_of_num(0) })"),
    fn(
      x232 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x232
      @simp.simp_tac(@list.List([th, finite_frag_support()]))
    },
  )
  let t231 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : A)"))
  let t230 = @simp.rewrite_tac(
    @list.List([@trivia.o_thm(), @class.fun_eq_thm(), @trivia.i_thm()]),
  )
  let t229 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([frag_tybij()]),
      @term_syntax.parse_term("dest_frag((x : Frag[_])) == dest_frag((y : Frag[_])) → x == y"),
    ),
  )
  let t245 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(@list.List([frag_extend()])),
            ),
            t229,
          ),
          t230,
        ),
        t231,
      ),
      t234,
    ),
    t244,
  )
  frag_expansion_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Frag[A], x == frag_extend(frag_of, x)"),
      t245,
    ),
  )
}

///|
let frag_expansion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_EXPANSION")

///|
/// `FRAG_EXPANSION`
pub fn frag_expansion() -> @kernel.Thm {
  frag_expansion_c.get()
}

///|
/// FRAG_CLOSURE_SUB_CMUL
fn step_45() -> Unit raise {
  let t265 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(@int.int_forall_pos())]),
  )
  let t261 = @term_syntax.parse_term("(a : Int)")
  let t262 = @tactics.spec_tac(@term_syntax.parse_term("-(a : Int)"), t261)
  let t260 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(0) <= -(a : Int)"))
  let t259 = @simp.asm_simp_tac(
    @list.List([
      dest_frag_cmul(),
      dest_frag_0(),
      frag_module(@term_syntax.parse_term("(frag_sub((x : Frag[_]), (y : Frag[_])) == frag_sub(x, (z : Frag[_]))) == (y == z)")),
    ]),
  )
  let t263 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(
          @list.List([
            frag_module(
              @term_syntax.parse_term("frag_cmul((a : Int), (x : Frag[_])) == frag_sub(frag_0, frag_cmul(-a, x))"),
            ),
          ]),
        ),
        t259,
      ),
      t260,
    ),
    t262,
  )
  let t257 = @term_syntax.parse_term("(a : Int)")
  let t258 = @tactics.spec_tac(@term_syntax.parse_term("(a : Int)"), t257)
  let t264 = @list.List([
    @tactics.then_tac(
      @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(0) <= (a : Int)")),
      t258,
    ),
    t263,
  ])
  let t256 = @tactics.disj_cases_tac(
    @int.int_arith(@term_syntax.parse_term("int_of_num(0) <= (a : Int) || int_of_num(0) <= -a")),
  )
  let t255 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Int)"))
  let t253 = @simp.asm_simp_tac(
    @list.List([
      dest_frag_0(),
      frag_module(@term_syntax.parse_term("frag_cmul(int_of_num(0), (x : Frag[_])) == frag_0")),
    ]),
  )
  let t252 = frag_module(
    @term_syntax.parse_term("frag_cmul((a : Int) + int_of_num(1), (x : Frag[_])) == frag_sub(frag_cmul(a, x), frag_sub(frag_0, x))"),
  )
  let t254 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @nums.induct_tac,
        @simp.rewrite_tac(
          @list.List([@equal.gsym(@int.int_of_num_suc()), t252]),
        ),
      ),
      t253,
    ),
    @tactics.all_tac,
  ])
  let t251 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, (P : (Frag[A]) -> Bool)(frag_cmul(int_of_num(n), (c : Frag[A])))"),
    fn(
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
      let s249 = @tactics.assume_tac(x248)
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
    },
  )
  let t247 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t246 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t266 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
                      t246,
                    ),
                    t247,
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.disch_tac,
              ),
              t251,
            ),
            t254,
          ),
          t255,
        ),
        t256,
      ),
      t264,
    ),
    t265,
  )
  frag_closure_sub_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Frag[A]) -> Bool, P(frag_0) && (∀ c1 : Frag[A], ∀ c2 : Frag[A], P(c1) && P(c2) → P(frag_sub(c1, c2))) → (∀ a : Int, ∀ c : Frag[A], P(c) → P(frag_cmul(a, c)))"),
      t266,
    ),
  )
}

///|
let frag_closure_sub_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_CLOSURE_SUB_CMUL",
)

///|
/// `FRAG_CLOSURE_SUB_CMUL`
pub fn frag_closure_sub_cmul() -> @kernel.Thm {
  frag_closure_sub_cmul_c.get()
}

///|
/// FRAG_INDUCTION
fn step_46() -> Unit raise {
  let t294 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t293 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t292 = @simp.asm_rewrite_tac(@list.List([]))
  let t291 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.first_assum(@tactics.match_mp_tac),
      @tactics.conj_tac,
    ),
  )
  let t290 = @simp.once_rewrite_tac(
    @list.List([
      frag_module(
        @term_syntax.parse_term("frag_add((x : Frag[_]), (y : Frag[_])) == frag_sub(x, frag_sub(frag_0, y))"),
      ),
    ]),
  )
  let t289 = @tactics.repeat_tac(@tactics.strip_tac)
  let t288 = @simp.asm_rewrite_tac(
    @list.List([neutral_frag_add(), @sets.insert_subset()]),
  )
  let t287 = @simp.simp_tac(
    @list.List([
      @drule.match_mp(@iterate.iterate_clauses())(monoidal_frag_add()),
    ]),
  )
  let t286 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t284 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t285 = @tactics.spec_tac(
    @term_syntax.parse_term("frag_support((c : Frag[A]))"),
    t284,
  )
  let t283 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(c : Frag[A])"), finite_frag_support()),
  )
  let t282 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Frag[A])"))
  let t281 = @simp.rewrite_tac(@list.List([frag_extend(), @trivia.o_thm()]))
  let t280 = @simp.gen_rewrite_tac(
    fn(
      x279 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x275 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x269 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s270 = @equal.binder_conv(x269)
          fn(x271 : @kernel.Term) -> @kernel.Thm raise { s270(x271) }
        })(
          (fn(
            x272 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s273 = @equal.rand_conv(x272)
            fn(x274 : @kernel.Term) -> @kernel.Thm raise { s273(x274) }
          })(x275),
        )
      })(
        (fn(
          x276 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s277 = @equal.rand_conv(x276)
          fn(x278 : @kernel.Term) -> @kernel.Thm raise { s277(x278) }
        })(x279),
      )
    },
    @list.List([frag_expansion()]),
  )
  let t268 = @simp.asm_rewrite_tac(@list.List([]))
  let t267 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(P : (Frag[A]) -> Bool)"), frag_closure_sub_cmul()),
  )
  let t295 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      @tactics.strip_tac,
                                    ),
                                    t267,
                                  ),
                                  t268,
                                ),
                                @tactics.disch_tac,
                              ),
                              t280,
                            ),
                            t281,
                          ),
                          t282,
                        ),
                        t283,
                      ),
                      t285,
                    ),
                    t286,
                  ),
                  t287,
                ),
                t288,
              ),
              t289,
            ),
            t290,
          ),
          t291,
        ),
        t292,
      ),
      t293,
    ),
    t294,
  )
  frag_induction_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Frag[A]) -> Bool, ∀ s : (A) -> Bool, P(frag_0) && (∀ a : A, IN(a, s) → P(frag_of(a))) && (∀ c1 : Frag[A], ∀ c2 : Frag[A], P(c1) && P(c2) → P(frag_sub(c1, c2))) → (∀ c : Frag[A], SUBSET(frag_support(c), s) → P(c))"),
      t295,
    ),
  )
}

///|
let frag_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_INDUCTION")

///|
/// `FRAG_INDUCTION`
pub fn frag_induction() -> @kernel.Thm {
  frag_induction_c.get()
}

///|
/// FRAG_EXTEND_COMPOSE
fn step_47() -> Unit raise {
  let t298 = @simp.simp_tac(
    @list.List([
      frag_extend_0(),
      frag_extend_sub(),
      frag_extend_of(),
      @trivia.o_thm(),
    ]),
  )
  let t297 = @tactics.match_mp_tac(frag_induction())
  let t296 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([@sets.subset_univ()]),
      @term_syntax.parse_term("(∀ c : Frag[_], SUBSET(frag_support(c), UNIV) → (P : (Frag[_]) -> Bool)(c)) → (∀ c : Frag[_], P(c))"),
    ),
  )
  let t299 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        t296,
      ),
      t297,
    ),
    t298,
  )
  frag_extend_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (B) -> Frag[C], ∀ g : (A) -> B, ∀ c : Frag[A], frag_extend(f, frag_extend(o(frag_of, g), c)) == frag_extend(o(f, g), c)"),
      t299,
    ),
  )
}

///|
let frag_extend_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FRAG_EXTEND_COMPOSE",
)

///|
/// `FRAG_EXTEND_COMPOSE`
pub fn frag_extend_compose() -> @kernel.Thm {
  frag_extend_compose_c.get()
}

///|
/// FRAG_SPLIT
fn step_48() -> Unit raise {
  let t331 = @tactics.conv_tac(frag_module)
  let t330 = @simp.asm_rewrite_tac(@list.List([]))
  let t329 = @tactics.repeat_tac(@tactics.strip_tac)
  let t328 = @list.List([@tactics.all_tac, @tactics.conv_tac(frag_module)])
  let t327 = @list.List([@tactics.conv_tac(frag_module), @tactics.all_tac])
  let t326 = @simp.rewrite_tac(
    @list.List([frag_extend_0(), frag_extend_sub(), frag_extend_of()]),
  )
  let t325 = @tactics.match_mp_tac(frag_induction())
  let t323 = @term_syntax.parse_term("(c : Frag[A])")
  let t324 = @tactics.spec_tac(@term_syntax.parse_term("(c : Frag[A])"), t323)
  let t332 = @tactics.then_tac(
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
                        @tactics.pop_assum(fn(
                          x320 : @kernel.Thm,
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
                          let s321 = @tactics.mp_tac(x320)
                          fn(
                            x322 : (
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
                            s321(x322)
                          }
                        }),
                        t324,
                      ),
                      t325,
                    ),
                    t326,
                  ),
                  @tactics.conj_tac,
                ),
                t327,
              ),
              @tactics.conj_tac,
            ),
            t328,
          ),
          t329,
        ),
        @class.cond_cases_tac,
      ),
      t330,
    ),
    t331,
  )
  let t319 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t318 = @simp.asm_rewrite_tac(
    @list.List([frag_support_0(), @sets.empty_subset(), frag_support_of()]),
  )
  let t317 = @tactics.repeat_tac(@tactics.strip_tac)
  let t316 = @simp.rewrite_tac(
    @list.List([@sets.unions_subset(), @sets.forall_in_gspec()]),
  )
  let t315 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.subset_trans(),
    ),
  )
  let t309 = @drule.part_match(@equal.lhand, frag_support_frag_extend())
  let t333 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.conj_tac, fn(
                  x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      x311 : @kernel.Term,
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
                        x310 : @kernel.Term,
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
                          x306 : @kernel.Thm,
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
                          let s307 = @tactics.mp_tac(x306)
                          fn(
                            x308 : (
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
                            s307(x308)
                          }
                        })(t309(x310))
                      })(@equal.lhand(x311))
                    })(
                      (fn(
                        x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> @kernel.Term raise {
                        x312.1
                      })(x313),
                    )
                  })(x314)(x314)
                }),
                t315,
              ),
              t316,
            ),
            t317,
          ),
          @class.cond_cases_tac,
        ),
        t318,
      ),
      t319,
    ),
    t332,
  ])
  let t305 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t303 = @term_syntax.parse_term("frag_extend((f : A) => if IN(f, (s : (A) -> Bool)) { frag_0 } else { frag_of(f) }, (c : Frag[A]))")
  let t304 = @tactics.map_every(
    fn(
      x300 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s301 = @tactics.exists_tac(x300)
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
    },
    @list.List([
      @term_syntax.parse_term("frag_extend((f : A) => if IN(f, (s : (A) -> Bool)) { frag_of(f) } else { frag_0 }, (c : Frag[A]))"),
      t303,
    ]),
  )
  let t334 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t304),
        t305,
      ),
      @tactics.conj_tac,
    ),
    t333,
  )
  frag_split_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Frag[A], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, SUBSET(frag_support(c), UNION(s, t)) → (∃ d : Frag[A], ∃ e : Frag[A], SUBSET(frag_support(d), s) && SUBSET(frag_support(e), t) && frag_add(d, e) == c)"),
      t334,
    ),
  )
}

///|
let frag_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRAG_SPLIT")

///|
/// `FRAG_SPLIT`
pub fn frag_split() -> @kernel.Thm {
  frag_split_c.get()
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
}
