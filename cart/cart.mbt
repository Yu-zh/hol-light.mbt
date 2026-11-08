// Translated from upstream cart.ml; edit this file directly.

///|
/// dimindex
fn step_1() -> Unit raise {
  dimindex_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(dimindex : ((A) -> Bool) -> Num)((s : (A) -> Bool)) == (if (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) { (CARD : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) } else { 1 })"),
    ),
  )
}

///|
let dimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dimindex")

///|
/// `dimindex`
pub fn dimindex() -> @kernel.Thm {
  dimindex_c.get()
}

///|
/// DIMINDEX_NONZERO
fn step_2() -> Unit raise {
  let t2 = @sets.set_tac(@list.List([]))
  let t1 = @simp.asm_simp_tac(
    @list.List([@sets.card_eq_0(), @calc_num.arith()]),
  )
  let t3 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([dimindex()])),
        ),
        @class.cond_cases_tac,
      ),
      t1,
    ),
    t2,
  )
  dimindex_nonzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, !(dimindex(s) == 0)"), t3),
  )
}

///|
let dimindex_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_NONZERO",
)

///|
/// `DIMINDEX_NONZERO`
pub fn dimindex_nonzero() -> @kernel.Thm {
  dimindex_nonzero_c.get()
}

///|
/// DIMINDEX_GE_1
fn step_3() -> Unit raise {
  let t4 = @simp.rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")),
      dimindex_nonzero(),
    ]),
  )
  dimindex_ge_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, 1 <= dimindex(s)"), t4),
  )
}

///|
let dimindex_ge_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_GE_1")

///|
/// `DIMINDEX_GE_1`
pub fn dimindex_ge_1() -> @kernel.Thm {
  dimindex_ge_1_c.get()
}

///|
/// DIMINDEX_UNIV
fn step_4() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([dimindex()]))
  dimindex_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (dimindex : ((A) -> Bool) -> Num)(s) == (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))"),
      t5,
    ),
  )
}

///|
let dimindex_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_UNIV")

///|
/// `DIMINDEX_UNIV`
pub fn dimindex_univ() -> @kernel.Thm {
  dimindex_univ_c.get()
}

///|
/// DIMINDEX_UNIQUE
fn step_5() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([dimindex(), @sets.has_size()]))
  dimindex_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), (n : Num)) → (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == n"),
      t6,
    ),
  )
}

///|
let dimindex_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_UNIQUE",
)

///|
/// `DIMINDEX_UNIQUE`
pub fn dimindex_unique() -> @kernel.Thm {
  dimindex_unique_c.get()
}

///|
/// UNIV_HAS_SIZE_DIMINDEX
fn step_6() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([@sets.has_size(), dimindex()]))
  univ_has_size_dimindex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((N) -> Bool, Num) -> Bool)((UNIV : (N) -> Bool), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) == (FINITE : ((N) -> Bool) -> Bool)((UNIV : (N) -> Bool))"),
      t7,
    ),
  )
}

///|
let univ_has_size_dimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UNIV_HAS_SIZE_DIMINDEX",
)

///|
/// `UNIV_HAS_SIZE_DIMINDEX`
pub fn univ_has_size_dimindex() -> @kernel.Thm {
  univ_has_size_dimindex_c.get()
}

///|
/// HAS_SIZE_1
fn step_7() -> Unit raise {
  let t12 = @simp.simp_tac(
    @list.List([
      @sets.not_in_empty(),
      @sets.has_size(),
      @sets.finite_rules(),
      @sets.card_clauses(),
      @calc_num.arith(),
    ]),
  )
  let t11 = @meson.meson_tac(@list.List([@trivia.one()]))
  let t13 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@sets.extension(), @sets.in_univ(), @sets.in_sing()]),
      ),
      t11,
    ),
    t12,
  ])
  let t14 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("UNIV == {one}"), fn(
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
      let s9 = @tactics.subst1_tac(x8)
      fn(
        x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s9(x10)
      }
    }),
    t13,
  )
  has_size_1_c.set(@tactics.prove(@term_syntax.parse_term("(HAS_SIZE : ((Unit) -> Bool, Num) -> Bool)((UNIV : (Unit) -> Bool), 1)"), t14))
}

///|
let has_size_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_1")

///|
/// `HAS_SIZE_1`
pub fn has_size_1() -> @kernel.Thm {
  has_size_1_c.get()
}

///|
/// NUMSEG_LT_DIMINDEX
fn step_8() -> Unit raise {
  let t15 = @simp.rewrite_tac(
    @list.List([@iterate.numseg_lt(), dimindex_nonzero()]),
  )
  numseg_lt_dimindex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("{(i : Num) | i < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))} == op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) - 1)"),
      t15,
    ),
  )
}

///|
let numseg_lt_dimindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUMSEG_LT_DIMINDEX",
)

///|
/// `NUMSEG_LT_DIMINDEX`
pub fn numseg_lt_dimindex() -> @kernel.Thm {
  numseg_lt_dimindex_c.get()
}

///|
/// DIMINDEX_1
fn step_9() -> Unit raise {
  dimindex_1_c.set(@drule.match_mp(dimindex_unique())(has_size_1()))
}

///|
let dimindex_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_1")

///|
/// `DIMINDEX_1`
pub fn dimindex_1() -> @kernel.Thm {
  dimindex_1_c.get()
}

///|
/// finite_image_tybij
fn step_10() -> Unit raise {
  let t16 = @simp.rewrite_tac(
    @list.List([@iterate.in_numseg(), @arith.le_refl(), dimindex_ge_1()]),
  )
  let t17 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t16)
  finite_image_tybij_c.set(
    @class.new_type_definition(
      "finite_image",
      ("finite_index", "dest_finite_image"),
      @tactics.prove(@term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))))"), t17),
    ),
  )
}

///|
let finite_image_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "finite_image_tybij",
)

///|
/// `finite_image_tybij`
pub fn finite_image_tybij() -> @kernel.Thm {
  finite_image_tybij_c.get()
}

///|
/// FINITE_IMAGE_IMAGE
fn step_11() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([finite_image_tybij()]))
  let t19 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_univ(), @sets.in_image()]),
    ),
    t18,
  )
  finite_image_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(UNIV : (Finite_image[A]) -> Bool) == (IMAGE : ((Num) -> Finite_image[A], (Num) -> Bool, Finite_image[A]) -> Bool)((finite_index : (Num) -> Finite_image[A]), op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))))"),
      t19,
    ),
  )
}

///|
let finite_image_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_IMAGE_IMAGE",
)

///|
/// `FINITE_IMAGE_IMAGE`
pub fn finite_image_image() -> @kernel.Thm {
  finite_image_image_c.get()
}

///|
/// HAS_SIZE_FINITE_IMAGE
fn step_12() -> Unit raise {
  let t23 = @meson.meson_tac(@list.List([finite_image_tybij()]))
  let t22 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t21 = @simp.once_rewrite_tac(@list.List([dimindex_univ()]))
  let t20 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t24 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.simp_tac(@list.List([finite_image_image()])),
          ),
          t20,
        ),
        t21,
      ),
      t22,
    ),
    t23,
  )
  has_size_finite_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (HAS_SIZE : ((Finite_image[A]) -> Bool, Num) -> Bool)((UNIV : (Finite_image[A]) -> Bool), (dimindex : ((A) -> Bool) -> Num)(s))"),
      t24,
    ),
  )
}

///|
let has_size_finite_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_FINITE_IMAGE",
)

///|
/// `HAS_SIZE_FINITE_IMAGE`
pub fn has_size_finite_image() -> @kernel.Thm {
  has_size_finite_image_c.get()
}

///|
/// CARD_FINITE_IMAGE
fn step_13() -> Unit raise {
  let t25 = @meson.meson_tac(
    @list.List([has_size_finite_image(), @sets.has_size()]),
  )
  card_finite_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, (CARD : ((Finite_image[A]) -> Bool) -> Num)((UNIV : (Finite_image[A]) -> Bool)) == (dimindex : ((A) -> Bool) -> Num)(s)"),
      t25,
    ),
  )
}

///|
let card_finite_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "CARD_FINITE_IMAGE",
)

///|
/// `CARD_FINITE_IMAGE`
pub fn card_finite_image() -> @kernel.Thm {
  card_finite_image_c.get()
}

///|
/// FINITE_FINITE_IMAGE
fn step_14() -> Unit raise {
  let t26 = @meson.meson_tac(
    @list.List([has_size_finite_image(), @sets.has_size()]),
  )
  finite_finite_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(FINITE : ((Finite_image[A]) -> Bool) -> Bool)((UNIV : (Finite_image[A]) -> Bool))"),
      t26,
    ),
  )
}

///|
let finite_finite_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_FINITE_IMAGE",
)

///|
/// `FINITE_FINITE_IMAGE`
pub fn finite_finite_image() -> @kernel.Thm {
  finite_finite_image_c.get()
}

///|
/// DIMINDEX_FINITE_IMAGE
fn step_15() -> Unit raise {
  let t32 = @simp.simp_tac(
    @list.List([finite_finite_image(), @sets.has_size()]),
  )
  let t31 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(t : (A) -> Bool)"), has_size_finite_image()),
  )
  let t30 = @simp.gen_rewrite_tac(
    fn(
      x27 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s28 = @equal.land_conv(x27)
      fn(x29 : @kernel.Term) -> @kernel.Thm raise { s28(x29) }
    },
    @list.List([dimindex()]),
  )
  let t33 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t30),
      t31,
    ),
    t32,
  )
  dimindex_finite_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Finite_image[A]) -> Bool, ∀ t : (A) -> Bool, dimindex(s) == dimindex(t)"),
      t33,
    ),
  )
}

///|
let dimindex_finite_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_FINITE_IMAGE",
)

///|
/// `DIMINDEX_FINITE_IMAGE`
pub fn dimindex_finite_image() -> @kernel.Thm {
  dimindex_finite_image_c.get()
}

///|
/// FINITE_INDEX_WORKS
fn step_16() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([finite_image_tybij()]))
  let t35 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@theorems.conj_assoc(), @equal.gsym(@iterate.in_numseg())]),
    ),
    t34,
  )
  finite_index_works_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Finite_image[A], (existsunique : ((Num) -> Bool) -> Bool)((n : Num) => 1 <= n && n <= (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) && (finite_index : (Num) -> Finite_image[A])(n) == i)"),
      t35,
    ),
  )
}

///|
let finite_index_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_WORKS",
)

///|
/// `FINITE_INDEX_WORKS`
pub fn finite_index_works() -> @kernel.Thm {
  finite_index_works_c.get()
}

///|
/// FINITE_INDEX_INJ
fn step_17() -> Unit raise {
  let t36 = @meson.meson_tac(@list.List([finite_index_works()]))
  finite_index_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Num, ∀ j : Num, 1 <= i && i <= (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) && 1 <= j && j <= (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) → ((finite_index : (Num) -> Finite_image[A])(i) == (finite_index : (Num) -> Finite_image[A])(j)) == (i == j)"),
      t36,
    ),
  )
}

///|
let finite_index_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_INJ",
)

///|
/// `FINITE_INDEX_INJ`
pub fn finite_index_inj() -> @kernel.Thm {
  finite_index_inj_c.get()
}

///|
/// FORALL_FINITE_INDEX
fn step_18() -> Unit raise {
  let t37 = @meson.meson_tac(@list.List([finite_index_works()]))
  forall_finite_index_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ k : Finite_image[N], (P : (Finite_image[N]) -> Bool)(k)) == (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P((finite_index : (Num) -> Finite_image[N])(i)))"),
      t37,
    ),
  )
}

///|
let forall_finite_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_FINITE_INDEX",
)

///|
/// `FORALL_FINITE_INDEX`
pub fn forall_finite_index() -> @kernel.Thm {
  forall_finite_index_c.get()
}

///|
/// cart_tybij
fn step_19() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([]))
  cart_tybij_c.set(
    @class.new_type_definition(
      "cart",
      ("mk_cart", "dest_cart"),
      @tactics.prove(@term_syntax.parse_term("∃ f : (Finite_image[B]) -> A, true"), t38),
    ),
  )
}

///|
let cart_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cart_tybij")

///|
/// `cart_tybij`
pub fn cart_tybij() -> @kernel.Thm {
  cart_tybij_c.get()
}

///|
/// cart.ml:115
fn step_20() -> Unit raise {
  @printer.parse_as_infix("$", (25L, "left"))
}

///|
/// finite_index
fn step_21() -> Unit raise {
  finite_index_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_dollar : (Cart[A, N], Num) -> A)((x : Cart[A, N]), (i : Num)) == dest_cart(x, finite_index(i))"),
    ),
  )
}

///|
let finite_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("finite_index")

///|
/// `finite_index`
pub fn finite_index() -> @kernel.Thm {
  finite_index_c.get()
}

///|
/// CART_EQ
fn step_22() -> Unit raise {
  let t41 = @meson.meson_tac(@list.List([cart_tybij()]))
  let t40 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]),
  )
  let t39 = @simp.rewrite_tac(
    @list.List([finite_index(), @equal.gsym(forall_finite_index())]),
  )
  let t42 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t39),
      t40,
    ),
    t41,
  )
  cart_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, B], ∀ y : Cart[A, B], (x == y) == (∀ i : Num, 1 <= i && i <= (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) → (op_dollar : (Cart[A, B], Num) -> A)(x, i) == (op_dollar : (Cart[A, B], Num) -> A)(y, i))"),
      t42,
    ),
  )
}

///|
let cart_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CART_EQ")

///|
/// `CART_EQ`
pub fn cart_eq() -> @kernel.Thm {
  cart_eq_c.get()
}

///|
/// cart.ml:126
fn step_23() -> Unit raise {
  @printer.parse_as_binder("lambda")
}

///|
/// lambda
fn step_24() -> Unit raise {
  lambda_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(lambda : ((Num) -> A) -> Cart[A, B])((g : (Num) -> A)) == (select : ((Cart[A, B]) -> Bool) -> Cart[A, B])((f : Cart[A, B]) => ∀ i : Num, 1 <= i && i <= (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) → (op_dollar : (Cart[A, B], Num) -> A)(f, i) == g(i))"),
    ),
  )
}

///|
let lambda_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lambda")

///|
/// `lambda`
pub fn lambda() -> @kernel.Thm {
  lambda_c.get()
}

///|
/// LAMBDA_BETA
fn step_25() -> Unit raise {
  let t49 = @meson.asm_meson_tac(
    @list.List([finite_index_inj(), dimindex_finite_image()]),
  )
  let t48 = @simp.rewrite_tac(@list.List([]))
  let t47 = @tactics.match_mp_tac(@class.select_unique())
  let t46 = @tactics.repeat_tac(@tactics.strip_tac)
  let t45 = @simp.rewrite_tac(
    @list.List([finite_index(), @simp.rewrite_rule(@list.List([]))(cart_tybij())]),
  )
  let t44 = @tactics.exists_tac(
    @term_syntax.parse_term("(mk_cart : ((Finite_image[B]) -> A) -> Cart[A, B])((k : Finite_image[B]) => (g : (Num) -> A)((select : ((Num) -> Bool) -> Num)((i : Num) => 1 <= i && i <= (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) && (finite_index : (Num) -> Finite_image[B])(i) == k)))"),
  )
  let t43 = @tactics.conv_tac(@class.select_conv)
  let t50 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([lambda()])),
                    t43,
                  ),
                  t44,
                ),
                t45,
              ),
              t46,
            ),
            @tactics.ap_term_tac,
          ),
          t47,
        ),
        @tactics.gen_tac,
      ),
      t48,
    ),
    t49,
  )
  lambda_beta_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Num, 1 <= i && i <= (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) → (op_dollar : (Cart[A, B], Num) -> A)((lambda : ((Num) -> A) -> Cart[A, B])((g : (Num) -> A)), i) == g(i)"),
      t50,
    ),
  )
}

///|
let lambda_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_BETA")

///|
/// `LAMBDA_BETA`
pub fn lambda_beta() -> @kernel.Thm {
  lambda_beta_c.get()
}

///|
/// LAMBDA_UNIQUE
fn step_26() -> Unit raise {
  let t51 = @meson.meson_tac(@list.List([]))
  let t52 = @tactics.then_tac(
    @simp.simp_tac(@list.List([cart_eq(), lambda_beta()])),
    t51,
  )
  lambda_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : Cart[A, B], ∀ g : (Num) -> A, (∀ i : Num, 1 <= i && i <= (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) → (op_dollar : (Cart[A, B], Num) -> A)(f, i) == g(i)) == ((lambda : ((Num) -> A) -> Cart[A, B])(g) == f)"),
      t52,
    ),
  )
}

///|
let lambda_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_UNIQUE")

///|
/// `LAMBDA_UNIQUE`
pub fn lambda_unique() -> @kernel.Thm {
  lambda_unique_c.get()
}

///|
/// LAMBDA_ETA
fn step_27() -> Unit raise {
  let t53 = @simp.rewrite_tac(@list.List([cart_eq(), lambda_beta()]))
  lambda_eta_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ g : Cart[A, B], lambda((i : Num) => op_dollar(g, i)) == g"), t53),
  )
}

///|
let lambda_eta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAMBDA_ETA")

///|
/// `LAMBDA_ETA`
pub fn lambda_eta() -> @kernel.Thm {
  lambda_eta_c.get()
}

///|
/// FINITE_INDEX_INRANGE
fn step_28() -> Unit raise {
  let t54 = @meson.meson_tac(@list.List([finite_index_works()]))
  let t55 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([finite_index()])),
    t54,
  )
  finite_index_inrange_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Num, ∃ k : Num, 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (∀ x : Cart[A, N], (op_dollar : (Cart[A, N], Num) -> A)(x, i) == (op_dollar : (Cart[A, N], Num) -> A)(x, k))"),
      t55,
    ),
  )
}

///|
let finite_index_inrange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_INRANGE",
)

///|
/// `FINITE_INDEX_INRANGE`
pub fn finite_index_inrange() -> @kernel.Thm {
  finite_index_inrange_c.get()
}

///|
/// FINITE_INDEX_INRANGE_2
fn step_29() -> Unit raise {
  let t56 = @meson.meson_tac(@list.List([finite_index_works()]))
  let t57 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([finite_index()])),
    t56,
  )
  finite_index_inrange_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Num, ∃ k : Num, 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (∀ x : Cart[A, N], (op_dollar : (Cart[A, N], Num) -> A)(x, i) == (op_dollar : (Cart[A, N], Num) -> A)(x, k)) && (∀ y : Cart[B, N], (op_dollar : (Cart[B, N], Num) -> B)(y, i) == (op_dollar : (Cart[B, N], Num) -> B)(y, k))"),
      t57,
    ),
  )
}

///|
let finite_index_inrange_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_INDEX_INRANGE_2",
)

///|
/// `FINITE_INDEX_INRANGE_2`
pub fn finite_index_inrange_2() -> @kernel.Thm {
  finite_index_inrange_2_c.get()
}

///|
/// CART_EQ_FULL
fn step_30() -> Unit raise {
  let t59 = @simp.simp_tac(@list.List([cart_eq()]))
  let t58 = @simp.simp_tac(@list.List([]))
  let t60 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      t58,
    ),
    t59,
  )
  cart_eq_full_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Cart[A, N], ∀ y : Cart[A, N], (x == y) == (∀ i : Num, op_dollar(x, i) == op_dollar(y, i))"), t60),
  )
}

///|
let cart_eq_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CART_EQ_FULL")

///|
/// `CART_EQ_FULL`
pub fn cart_eq_full() -> @kernel.Thm {
  cart_eq_full_c.get()
}

///|
/// finite_sum_tybij
fn step_31() -> Unit raise {
  let t61 = @simp.simp_tac(
    @list.List([
      @iterate.in_numseg(),
      @arith.le_refl(),
      dimindex_ge_1(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (a : Num) → 1 <= a + (b : Num)")),
    ]),
  )
  let t62 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t61)
  let th = @tactics.prove(
    @term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) + (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool))))"),
    t62,
  )
  finite_sum_tybij_c.set(
    @class.new_type_definition(
      "finite_sum",
      ("mk_finite_sum", "dest_finite_sum"),
      th,
    ),
  )
}

///|
let finite_sum_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "finite_sum_tybij",
)

///|
/// `finite_sum_tybij`
pub fn finite_sum_tybij() -> @kernel.Thm {
  finite_sum_tybij_c.get()
}

///|
/// pastecart
fn step_32() -> Unit raise {
  pastecart_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(pastecart : (Cart[A, M], Cart[A, N]) -> Cart[A, Finite_sum[M, N]])((f : Cart[A, M]), (g : Cart[A, N])) == (lambda : ((Num) -> A) -> Cart[A, Finite_sum[M, N]])((i : Num) => if i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) { (op_dollar : (Cart[A, M], Num) -> A)(f, i) } else { (op_dollar : (Cart[A, N], Num) -> A)(g, i - (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))) })"),
    ),
  )
}

///|
let pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pastecart")

///|
/// `pastecart`
pub fn pastecart() -> @kernel.Thm {
  pastecart_c.get()
}

///|
/// fstcart
fn step_33() -> Unit raise {
  fstcart_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(fstcart : (Cart[A, Finite_sum[M, N]]) -> Cart[A, M])((f : Cart[A, Finite_sum[M, N]])) == lambda((i : Num) => op_dollar(f, i))"),
    ),
  )
}

///|
let fstcart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fstcart")

///|
/// `fstcart`
pub fn fstcart() -> @kernel.Thm {
  fstcart_c.get()
}

///|
/// sndcart
fn step_34() -> Unit raise {
  sndcart_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(sndcart : (Cart[A, Finite_sum[M, N]]) -> Cart[A, N])((f : Cart[A, Finite_sum[M, N]])) == (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (op_dollar : (Cart[A, Finite_sum[M, N]], Num) -> A)(f, i + (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))))"),
    ),
  )
}

///|
let sndcart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sndcart")

///|
/// `sndcart`
pub fn sndcart() -> @kernel.Thm {
  sndcart_c.get()
}

///|
/// FINITE_SUM_IMAGE
fn step_35() -> Unit raise {
  let t63 = @meson.meson_tac(@list.List([finite_sum_tybij()]))
  let t64 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_univ(), @sets.in_image()]),
    ),
    t63,
  )
  finite_sum_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(UNIV : (Finite_sum[A, B]) -> Bool) == (IMAGE : ((Num) -> Finite_sum[A, B], (Num) -> Bool, Finite_sum[A, B]) -> Bool)((mk_finite_sum : (Num) -> Finite_sum[A, B]), op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) + (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool))))"),
      t64,
    ),
  )
}

///|
let finite_sum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_SUM_IMAGE",
)

///|
/// `FINITE_SUM_IMAGE`
pub fn finite_sum_image() -> @kernel.Thm {
  finite_sum_image_c.get()
}

///|
/// DIMINDEX_HAS_SIZE_FINITE_SUM
fn step_36() -> Unit raise {
  let t68 = @meson.meson_tac(@list.List([finite_sum_tybij()]))
  let t67 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t66 = @simp.once_rewrite_tac(@list.List([dimindex_univ()]))
  let t65 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t69 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.simp_tac(@list.List([finite_sum_image()])), t65),
        t66,
      ),
      t67,
    ),
    t68,
  )
  dimindex_has_size_finite_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((Finite_sum[M, N]) -> Bool, Num) -> Bool)((UNIV : (Finite_sum[M, N]) -> Bool), (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) + (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"),
      t69,
    ),
  )
}

///|
let dimindex_has_size_finite_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_HAS_SIZE_FINITE_SUM",
)

///|
/// `DIMINDEX_HAS_SIZE_FINITE_SUM`
pub fn dimindex_has_size_finite_sum() -> @kernel.Thm {
  dimindex_has_size_finite_sum_c.get()
}

///|
/// DIMINDEX_FINITE_SUM
fn step_37() -> Unit raise {
  let t73 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        dimindex_has_size_finite_sum(),
      ),
    ]),
  )
  let t74 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x70 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s71 = @equal.land_conv(x70)
        fn(x72 : @kernel.Term) -> @kernel.Thm raise { s71(x72) }
      },
      @list.List([dimindex()]),
    ),
    t73,
  )
  dimindex_finite_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Finite_sum[M, N]) -> Bool) -> Num)((UNIV : (Finite_sum[M, N]) -> Bool)) == (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) + (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"),
      t74,
    ),
  )
}

///|
let dimindex_finite_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_FINITE_SUM",
)

///|
/// `DIMINDEX_FINITE_SUM`
pub fn dimindex_finite_sum() -> @kernel.Thm {
  dimindex_finite_sum_c.get()
}

///|
/// FSTCART_PASTECART
fn step_38() -> Unit raise {
  let t75 = @simp.simp_tac(
    @list.List([
      pastecart(),
      fstcart(),
      cart_eq(),
      lambda_beta(),
      dimindex_finite_sum(),
      @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → a <= b + (c : Num)")),
    ]),
  )
  fstcart_pastecart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, M], ∀ y : Cart[A, N], fstcart(pastecart(x, y)) == x"),
      t75,
    ),
  )
}

///|
let fstcart_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FSTCART_PASTECART",
)

///|
/// `FSTCART_PASTECART`
pub fn fstcart_pastecart() -> @kernel.Thm {
  fstcart_pastecart_c.get()
}

///|
/// SNDCART_PASTECART
fn step_39() -> Unit raise {
  let t88 = @simp.asm_simp_tac(
    @list.List([
      @arith.add_sub(),
      @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → !(i + (a : Num) <= a)")),
    ]),
  )
  let t87 = @simp.rewrite_tac(@list.List([]))
  let t89 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x84 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s85 = @tactics.subst1_tac(x84)
        fn(
          x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s85(x86)
        }
      }),
      t87,
    ),
    t88,
  )
  let t83 = @simp.asm_rewrite_tac(@list.List([]))
  let t82 = @tactics.match_mp_tac(
    @int.arith_rule(
      @term_syntax.parse_term("1 <= (i : Num) && i <= (b : Num) → 1 <= i + (a : Num) && i + a <= a + b"),
    ),
  )
  let t90 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([dimindex_finite_sum()])),
        t82,
      ),
      t83,
    ),
    t89,
  ])
  let t76 = @tactics.repeat_tac(@tactics.strip_tac)
  let t91 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(
            @list.List([pastecart(), sndcart(), cart_eq(), lambda_beta()]),
          ),
          t76,
        ),
        fn(
          x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let (_, w) = x77
            let t80 = @equal.lhand(w)
            @tactics.mp_tac(
              @drule.part_match(
                fn(x79 : @kernel.Term) -> @kernel.Term raise {
                  @equal.lhs(@kernel.rand(x79))
                },
                lambda_beta(),
              )(t80),
            )
          })(x81)(x81)
        },
      ),
      @tactics.ants_tac,
    ),
    t90,
  )
  sndcart_pastecart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, M], ∀ y : Cart[A, N], sndcart(pastecart(x, y)) == y"),
      t91,
    ),
  )
}

///|
let sndcart_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SNDCART_PASTECART",
)

///|
/// `SNDCART_PASTECART`
pub fn sndcart_pastecart() -> @kernel.Thm {
  sndcart_pastecart_c.get()
}

///|
/// PASTECART_FST_SND
fn step_40() -> Unit raise {
  let t94 = @int.arith_rule(
    @term_syntax.parse_term("!((i : Num) <= (a : Num)) → i - a + a == i"),
  )
  let t95 = @int.arith_rule(@term_syntax.parse_term("!((i : Num) <= (a : Num)) → 1 <= i - a"))
  let t96 = @simp.asm_simp_tac(
    @list.List([
      dimindex_finite_sum(),
      lambda_beta(),
      @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (a : Num) + (b : Num) → i - a <= b")),
      t95,
      t94,
    ]),
  )
  let t93 = @simp.asm_rewrite_tac(@list.List([]))
  let t92 = @tactics.repeat_tac(@tactics.gen_tac)
  let t97 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(
            @list.List([
              pastecart(),
              fstcart(),
              sndcart(),
              cart_eq(),
              lambda_beta(),
            ]),
          ),
          t92,
        ),
        @class.cond_cases_tac,
      ),
      t93,
    ),
    t96,
  )
  pastecart_fst_snd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ z : Cart[A, Finite_sum[M, N]], pastecart(fstcart(z), sndcart(z)) == z"),
      t97,
    ),
  )
}

///|
let pastecart_fst_snd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PASTECART_FST_SND",
)

///|
/// `PASTECART_FST_SND`
pub fn pastecart_fst_snd() -> @kernel.Thm {
  pastecart_fst_snd_c.get()
}

///|
/// PASTECART_EQ
fn step_41() -> Unit raise {
  let t98 = @meson.meson_tac(@list.List([pastecart_fst_snd()]))
  pastecart_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, Finite_sum[M, N]], ∀ y : Cart[A, Finite_sum[M, N]], (x == y) == (fstcart(x) == fstcart(y) && sndcart(x) == sndcart(y))"),
      t98,
    ),
  )
}

///|
let pastecart_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_EQ")

///|
/// `PASTECART_EQ`
pub fn pastecart_eq() -> @kernel.Thm {
  pastecart_eq_c.get()
}

///|
/// FORALL_PASTECART
fn step_42() -> Unit raise {
  let t99 = @meson.meson_tac(
    @list.List([pastecart_fst_snd(), fstcart_pastecart(), sndcart_pastecart()]),
  )
  forall_pastecart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ p : Cart[A, Finite_sum[M, N]], (P : (Cart[A, Finite_sum[M, N]]) -> Bool)(p)) == (∀ x : Cart[A, M], ∀ y : Cart[A, N], P(pastecart(x, y)))"),
      t99,
    ),
  )
}

///|
let forall_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_PASTECART",
)

///|
/// `FORALL_PASTECART`
pub fn forall_pastecart() -> @kernel.Thm {
  forall_pastecart_c.get()
}

///|
/// EXISTS_PASTECART
fn step_43() -> Unit raise {
  let t100 = @meson.meson_tac(
    @list.List([pastecart_fst_snd(), fstcart_pastecart(), sndcart_pastecart()]),
  )
  exists_pastecart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ p : Cart[A, Finite_sum[M, N]], (P : (Cart[A, Finite_sum[M, N]]) -> Bool)(p)) == (∃ x : Cart[A, M], ∃ y : Cart[A, N], P(pastecart(x, y)))"),
      t100,
    ),
  )
}

///|
let exists_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_PASTECART",
)

///|
/// `EXISTS_PASTECART`
pub fn exists_pastecart() -> @kernel.Thm {
  exists_pastecart_c.get()
}

///|
/// PASTECART_INJ
fn step_44() -> Unit raise {
  let t101 = @simp.rewrite_tac(
    @list.List([pastecart_eq(), fstcart_pastecart(), sndcart_pastecart()]),
  )
  pastecart_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, M], ∀ y : Cart[A, N], ∀ w : Cart[A, M], ∀ z : Cart[A, N], (pastecart(x, y) == pastecart(w, z)) == (x == w && y == z)"),
      t101,
    ),
  )
}

///|
let pastecart_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASTECART_INJ")

///|
/// `PASTECART_INJ`
pub fn pastecart_inj() -> @kernel.Thm {
  pastecart_inj_c.get()
}

///|
/// FSTCART_COMPONENT
fn step_45() -> Unit raise {
  let t102 = @simp.simp_tac(@list.List([fstcart(), lambda_beta()]))
  fstcart_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, Finite_sum[M, N]], ∀ i : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) → (op_dollar : (Cart[A, M], Num) -> A)((fstcart : (Cart[A, Finite_sum[M, N]]) -> Cart[A, M])(x), i) == (op_dollar : (Cart[A, Finite_sum[M, N]], Num) -> A)(x, i)"),
      t102,
    ),
  )
}

///|
let fstcart_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FSTCART_COMPONENT",
)

///|
/// `FSTCART_COMPONENT`
pub fn fstcart_component() -> @kernel.Thm {
  fstcart_component_c.get()
}

///|
/// SNDCART_COMPONENT
fn step_46() -> Unit raise {
  let t103 = @simp.simp_tac(@list.List([sndcart(), lambda_beta()]))
  sndcart_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, Finite_sum[M, N]], ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, N], Num) -> A)((sndcart : (Cart[A, Finite_sum[M, N]]) -> Cart[A, N])(x), i) == (op_dollar : (Cart[A, Finite_sum[M, N]], Num) -> A)(x, i + (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)))"),
      t103,
    ),
  )
}

///|
let sndcart_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SNDCART_COMPONENT",
)

///|
/// `SNDCART_COMPONENT`
pub fn sndcart_component() -> @kernel.Thm {
  sndcart_component_c.get()
}

///|
/// PASTECART_COMPONENT
fn step_47() -> Unit raise {
  let t108 = @simp.rewrite_tac(@list.List([]))
  let t109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_simp_tac(
          @list.List([
            lambda_beta(),
            dimindex_finite_sum(),
            @int.arith_rule(
              @term_syntax.parse_term("(dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) + 1 <= (i : Num) → 1 <= i"),
            ),
          ]),
        ),
        @class.cond_cases_tac,
      ),
      t108,
    ),
    @int.asm_arith_tac,
  )
  let t107 = @simp.rewrite_tac(@list.List([dimindex_finite_sum()]))
  let t110 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.subgoal_then(
          @term_syntax.parse_term("(i : Num) <= (dimindex : ((Finite_sum[M, N]) -> Bool) -> Num)((UNIV : (Finite_sum[M, N]) -> Bool))"),
          fn(
            x105 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let th = x105
            @simp.asm_simp_tac(@list.List([lambda_beta(), th]))
          },
        ),
        t107,
      ),
      @int.asm_arith_tac,
    ),
    t109,
  ])
  let t104 = @tactics.repeat_tac(@tactics.gen_tac)
  let t111 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([pastecart()])),
          @tactics.conj_tac,
        ),
        t104,
      ),
      @tactics.strip_tac,
    ),
    t110,
  )
  pastecart_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ u : Cart[A, M], ∀ v : Cart[A, N], ∀ i : Num, 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) → (op_dollar : (Cart[A, Finite_sum[M, N]], Num) -> A)((pastecart : (Cart[A, M], Cart[A, N]) -> Cart[A, Finite_sum[M, N]])(u, v), i) == (op_dollar : (Cart[A, M], Num) -> A)(u, i)) && (∀ u : Cart[A, M], ∀ v : Cart[A, N], ∀ i : Num, (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) + 1 <= i && i <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) + (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, Finite_sum[M, N]], Num) -> A)((pastecart : (Cart[A, M], Cart[A, N]) -> Cart[A, Finite_sum[M, N]])(u, v), i) == (op_dollar : (Cart[A, N], Num) -> A)(v, i - (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool))))"),
      t111,
    ),
  )
}

///|
let pastecart_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PASTECART_COMPONENT",
)

///|
/// `PASTECART_COMPONENT`
pub fn pastecart_component() -> @kernel.Thm {
  pastecart_component_c.get()
}

///|
/// finite_diff_tybij
fn step_48() -> Unit raise {
  let t112 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t113 = @tactics.then_tac(
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t112),
    @int.arith_tac,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, if (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) < (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) { (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) - (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) } else { 1 }))"),
    t113,
  )
  finite_diff_tybij_c.set(
    @class.new_type_definition(
      "finite_diff",
      ("mk_finite_diff", "dest_finite_diff"),
      th,
    ),
  )
}

///|
let finite_diff_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "finite_diff_tybij",
)

///|
/// `finite_diff_tybij`
pub fn finite_diff_tybij() -> @kernel.Thm {
  finite_diff_tybij_c.get()
}

///|
/// FINITE_DIFF_IMAGE
fn step_49() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([finite_diff_tybij()]))
  let t115 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_univ(), @sets.in_image()]),
    ),
    t114,
  )
  finite_diff_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(UNIV : (Finite_diff[A, B]) -> Bool) == (IMAGE : ((Num) -> Finite_diff[A, B], (Num) -> Bool, Finite_diff[A, B]) -> Bool)((mk_finite_diff : (Num) -> Finite_diff[A, B]), op_dot_dot(1, if (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) < (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) { (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) - (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool)) } else { 1 }))"),
      t115,
    ),
  )
}

///|
let finite_diff_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_DIFF_IMAGE",
)

///|
/// `FINITE_DIFF_IMAGE`
pub fn finite_diff_image() -> @kernel.Thm {
  finite_diff_image_c.get()
}

///|
/// DIMINDEX_HAS_SIZE_FINITE_DIFF
fn step_50() -> Unit raise {
  let t119 = @meson.meson_tac(@list.List([finite_diff_tybij()]))
  let t118 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t117 = @simp.once_rewrite_tac(@list.List([dimindex_univ()]))
  let t116 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t120 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(@list.List([finite_diff_image()])),
          t116,
        ),
        t117,
      ),
      t118,
    ),
    t119,
  )
  dimindex_has_size_finite_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((Finite_diff[M, N]) -> Bool, Num) -> Bool)((UNIV : (Finite_diff[M, N]) -> Bool), if (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) < (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) { (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) - (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) } else { 1 })"),
      t120,
    ),
  )
}

///|
let dimindex_has_size_finite_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_HAS_SIZE_FINITE_DIFF",
)

///|
/// `DIMINDEX_HAS_SIZE_FINITE_DIFF`
pub fn dimindex_has_size_finite_diff() -> @kernel.Thm {
  dimindex_has_size_finite_diff_c.get()
}

///|
/// DIMINDEX_FINITE_DIFF
fn step_51() -> Unit raise {
  let t124 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        dimindex_has_size_finite_diff(),
      ),
    ]),
  )
  let t125 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x121 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s122 = @equal.land_conv(x121)
        fn(x123 : @kernel.Term) -> @kernel.Thm raise { s122(x123) }
      },
      @list.List([dimindex()]),
    ),
    t124,
  )
  dimindex_finite_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Finite_diff[M, N]) -> Bool) -> Num)((UNIV : (Finite_diff[M, N]) -> Bool)) == (if (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) < (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) { (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) - (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) } else { 1 })"),
      t125,
    ),
  )
}

///|
let dimindex_finite_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_FINITE_DIFF",
)

///|
/// `DIMINDEX_FINITE_DIFF`
pub fn dimindex_finite_diff() -> @kernel.Thm {
  dimindex_finite_diff_c.get()
}

///|
/// finite_prod_tybij
fn step_52() -> Unit raise {
  let t127 = @meson.meson_tac(
    @list.List([@arith.le_1(), dimindex_ge_1(), @arith.mult_eq_0()]),
  )
  let t126 = @simp.rewrite_tac(
    @list.List([@iterate.in_numseg(), @arith.le_refl()]),
  )
  let t128 = @tactics.then_tac(
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t126),
    t127,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("∃ x : Num, IN(x, op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) * (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool))))"),
    t128,
  )
  finite_prod_tybij_c.set(
    @class.new_type_definition(
      "finite_prod",
      ("mk_finite_prod", "dest_finite_prod"),
      th,
    ),
  )
}

///|
let finite_prod_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "finite_prod_tybij",
)

///|
/// `finite_prod_tybij`
pub fn finite_prod_tybij() -> @kernel.Thm {
  finite_prod_tybij_c.get()
}

///|
/// FINITE_PROD_IMAGE
fn step_53() -> Unit raise {
  let t129 = @meson.meson_tac(@list.List([finite_prod_tybij()]))
  let t130 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@sets.extension(), @sets.in_univ(), @sets.in_image()]),
    ),
    t129,
  )
  finite_prod_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(UNIV : (Finite_prod[A, B]) -> Bool) == (IMAGE : ((Num) -> Finite_prod[A, B], (Num) -> Bool, Finite_prod[A, B]) -> Bool)((mk_finite_prod : (Num) -> Finite_prod[A, B]), op_dot_dot(1, (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) * (dimindex : ((B) -> Bool) -> Num)((UNIV : (B) -> Bool))))"),
      t130,
    ),
  )
}

///|
let finite_prod_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_PROD_IMAGE",
)

///|
/// `FINITE_PROD_IMAGE`
pub fn finite_prod_image() -> @kernel.Thm {
  finite_prod_image_c.get()
}

///|
/// DIMINDEX_HAS_SIZE_FINITE_PROD
fn step_54() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([finite_prod_tybij()]))
  let t133 = @simp.rewrite_tac(@list.List([@iterate.has_size_numseg_1()]))
  let t132 = @simp.once_rewrite_tac(@list.List([dimindex_univ()]))
  let t131 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t135 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.simp_tac(@list.List([finite_prod_image()])),
          t131,
        ),
        t132,
      ),
      t133,
    ),
    t134,
  )
  dimindex_has_size_finite_prod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((Finite_prod[M, N]) -> Bool, Num) -> Bool)((UNIV : (Finite_prod[M, N]) -> Bool), (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"),
      t135,
    ),
  )
}

///|
let dimindex_has_size_finite_prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_HAS_SIZE_FINITE_PROD",
)

///|
/// `DIMINDEX_HAS_SIZE_FINITE_PROD`
pub fn dimindex_has_size_finite_prod() -> @kernel.Thm {
  dimindex_has_size_finite_prod_c.get()
}

///|
/// DIMINDEX_FINITE_PROD
fn step_55() -> Unit raise {
  let t139 = @simp.rewrite_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(
        dimindex_has_size_finite_prod(),
      ),
    ]),
  )
  let t140 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x136 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s137 = @equal.land_conv(x136)
        fn(x138 : @kernel.Term) -> @kernel.Thm raise { s137(x138) }
      },
      @list.List([dimindex()]),
    ),
    t139,
  )
  dimindex_finite_prod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Finite_prod[M, N]) -> Bool) -> Num)((UNIV : (Finite_prod[M, N]) -> Bool)) == (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) * (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"),
      t140,
    ),
  )
}

///|
let dimindex_finite_prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_FINITE_PROD",
)

///|
/// `DIMINDEX_FINITE_PROD`
pub fn dimindex_finite_prod() -> @kernel.Thm {
  dimindex_finite_prod_c.get()
}

///|
let tybit0_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tybit0_INDUCT")

///|
/// `tybit0_INDUCT`
pub fn tybit0_induct() -> @kernel.Thm {
  tybit0_induct_c.get()
}

///|
let tybit0_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "tybit0_RECURSION",
)

///|
/// `tybit0_RECURSION`
pub fn tybit0_recursion() -> @kernel.Thm {
  tybit0_recursion_c.get()
}

///|
/// tybit0_INDUCT, tybit0_RECURSION
fn step_56() -> Unit raise {
  let (tybit0_induct, tybit0_recursion) = @ind_types.define_type(
    "enum Tybit0 { mktybit0(Finite_sum[A, A]) }",
  )
  tybit0_induct_c.set(tybit0_induct)
  tybit0_recursion_c.set(tybit0_recursion)
}

///|
let tybit1_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tybit1_INDUCT")

///|
/// `tybit1_INDUCT`
pub fn tybit1_induct() -> @kernel.Thm {
  tybit1_induct_c.get()
}

///|
let tybit1_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "tybit1_RECURSION",
)

///|
/// `tybit1_RECURSION`
pub fn tybit1_recursion() -> @kernel.Thm {
  tybit1_recursion_c.get()
}

///|
/// tybit1_INDUCT, tybit1_RECURSION
fn step_57() -> Unit raise {
  let (tybit1_induct, tybit1_recursion) = @ind_types.define_type(
    "enum Tybit1 { mktybit1(Finite_sum[Finite_sum[A, A], 1]) }",
  )
  tybit1_induct_c.set(tybit1_induct)
  tybit1_recursion_c.set(tybit1_recursion)
}

///|
/// HAS_SIZE_TYBIT0
fn step_58() -> Unit raise {
  let t157 = @simp.rewrite_tac(
    @list.List([dimindex_finite_sum(), @equal.gsym(@arith.mult_2())]),
  )
  let t151 = @drule.part_match(@equal.lhand, dimindex_has_size_finite_sum())
  let t147 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @ind_types.injectivity("tybit0")]),
  )
  let t158 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), t147),
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
        (fn(
          x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x153 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x152 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                x148 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                let s149 = @tactics.mp_tac(x148)
                fn(
                  x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise {
                  s149(x150)
                }
              })(t151(x152))
            })(@equal.lhand(x153))
          })(
            (fn(
              x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x154.1
            })(x155),
          )
        })(x156)(x156)
      },
    ),
    t157,
  )
  let t146 = @meson.meson_tac(@list.List([@ind_types.cases("tybit0")]))
  let t145 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t144 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t159 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t144),
        t145,
      ),
      t146,
    ),
    t158,
  ])
  let t160 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("(UNIV : (Tybit0[A]) -> Bool) == (IMAGE : ((Finite_sum[A, A]) -> Tybit0[A], (Finite_sum[A, A]) -> Bool, Tybit0[A]) -> Bool)((mktybit0 : (Finite_sum[A, A]) -> Tybit0[A]), (UNIV : (Finite_sum[A, A]) -> Bool))"),
      fn(
        x141 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s142 = @tactics.subst1_tac(x141)
        fn(
          x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s142(x143)
        }
      },
    ),
    t159,
  )
  has_size_tybit0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((Tybit0[A]) -> Bool, Num) -> Bool)((UNIV : (Tybit0[A]) -> Bool), 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)))"),
      t160,
    ),
  )
}

///|
let has_size_tybit0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_TYBIT0",
)

///|
/// `HAS_SIZE_TYBIT0`
pub fn has_size_tybit0() -> @kernel.Thm {
  has_size_tybit0_c.get()
}

///|
/// HAS_SIZE_TYBIT1
fn step_59() -> Unit raise {
  let t177 = @simp.rewrite_tac(
    @list.List([
      dimindex_finite_sum(),
      dimindex_1(),
      @equal.gsym(@arith.mult_2()),
    ]),
  )
  let t171 = @drule.part_match(@equal.lhand, dimindex_has_size_finite_sum())
  let t167 = @simp.rewrite_tac(
    @list.List([@sets.in_univ(), @ind_types.injectivity("tybit1")]),
  )
  let t178 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), t167),
      fn(
        x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              x172 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
              })(t171(x172))
            })(@equal.lhand(x173))
          })(
            (fn(
              x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> @kernel.Term raise {
              x174.1
            })(x175),
          )
        })(x176)(x176)
      },
    ),
    t177,
  )
  let t166 = @meson.meson_tac(@list.List([@ind_types.cases("tybit1")]))
  let t165 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t164 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t179 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t164),
        t165,
      ),
      t166,
    ),
    t178,
  ])
  let t180 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("(UNIV : (Tybit1[A]) -> Bool) == (IMAGE : ((Finite_sum[Finite_sum[A, A], Unit]) -> Tybit1[A], (Finite_sum[Finite_sum[A, A], Unit]) -> Bool, Tybit1[A]) -> Bool)((mktybit1 : (Finite_sum[Finite_sum[A, A], Unit]) -> Tybit1[A]), (UNIV : (Finite_sum[Finite_sum[A, A], Unit]) -> Bool))"),
      fn(
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
        let s162 = @tactics.subst1_tac(x161)
        fn(
          x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s162(x163)
        }
      },
    ),
    t179,
  )
  has_size_tybit1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(HAS_SIZE : ((Tybit1[A]) -> Bool, Num) -> Bool)((UNIV : (Tybit1[A]) -> Bool), 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) + 1)"),
      t180,
    ),
  )
}

///|
let has_size_tybit1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_TYBIT1",
)

///|
/// `HAS_SIZE_TYBIT1`
pub fn has_size_tybit1() -> @kernel.Thm {
  has_size_tybit1_c.get()
}

///|
/// DIMINDEX_TYBIT0
fn step_60() -> Unit raise {
  let t181 = @tactics.match_accept_tac(has_size_tybit0())
  let t182 = @tactics.then_tac(@tactics.match_mp_tac(dimindex_unique()), t181)
  dimindex_tybit0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Tybit0[A]) -> Bool) -> Num)((UNIV : (Tybit0[A]) -> Bool)) == 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))"),
      t182,
    ),
  )
}

///|
let dimindex_tybit0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_TYBIT0",
)

///|
/// `DIMINDEX_TYBIT0`
pub fn dimindex_tybit0() -> @kernel.Thm {
  dimindex_tybit0_c.get()
}

///|
/// DIMINDEX_TYBIT1
fn step_61() -> Unit raise {
  let t183 = @tactics.match_accept_tac(has_size_tybit1())
  let t184 = @tactics.then_tac(@tactics.match_mp_tac(dimindex_unique()), t183)
  dimindex_tybit1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Tybit1[A]) -> Bool) -> Num)((UNIV : (Tybit1[A]) -> Bool)) == 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) + 1"),
      t184,
    ),
  )
}

///|
let dimindex_tybit1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_TYBIT1",
)

///|
/// `DIMINDEX_TYBIT1`
pub fn dimindex_tybit1() -> @kernel.Thm {
  dimindex_tybit1_c.get()
}

///|
/// DIMINDEX_CLAUSES
fn step_62() -> Unit raise {
  let t186 = @simp.rewrite_tac(
    @list.List([has_size_tybit0(), has_size_tybit1()]),
  )
  let t185 = @tactics.match_mp_tac(dimindex_unique())
  let t187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([dimindex_1()])),
        @tactics.conj_tac,
      ),
      t185,
    ),
    t186,
  )
  dimindex_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(dimindex : ((Unit) -> Bool) -> Num)((UNIV : (Unit) -> Bool)) == 1 && (dimindex : ((Tybit0[A]) -> Bool) -> Num)((UNIV : (Tybit0[A]) -> Bool)) == 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) && (dimindex : ((Tybit1[A]) -> Bool) -> Num)((UNIV : (Tybit1[A]) -> Bool)) == 2 * (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) + 1"),
      t187,
    ),
  )
}

///|
let dimindex_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIMINDEX_CLAUSES",
)

///|
/// `DIMINDEX_CLAUSES`
pub fn dimindex_clauses() -> @kernel.Thm {
  dimindex_clauses_c.get()
}

///|
/// FINITE_1
fn step_63() -> Unit raise {
  let t188 = @meson.meson_tac(@list.List([has_size_1(), @sets.has_size()]))
  finite_1_c.set(@tactics.prove(@term_syntax.parse_term("(FINITE : ((Unit) -> Bool) -> Bool)((UNIV : (Unit) -> Bool))"), t188))
}

///|
let finite_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_1")

///|
/// `FINITE_1`
pub fn finite_1() -> @kernel.Thm {
  finite_1_c.get()
}

///|
/// FINITE_TYBIT0
fn step_64() -> Unit raise {
  let t189 = @meson.meson_tac(@list.List([has_size_tybit0(), @sets.has_size()]))
  finite_tybit0_c.set(
    @tactics.prove(@term_syntax.parse_term("(FINITE : ((Tybit0[A]) -> Bool) -> Bool)((UNIV : (Tybit0[A]) -> Bool))"), t189),
  )
}

///|
let finite_tybit0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_TYBIT0")

///|
/// `FINITE_TYBIT0`
pub fn finite_tybit0() -> @kernel.Thm {
  finite_tybit0_c.get()
}

///|
/// FINITE_TYBIT1
fn step_65() -> Unit raise {
  let t190 = @meson.meson_tac(@list.List([has_size_tybit1(), @sets.has_size()]))
  finite_tybit1_c.set(
    @tactics.prove(@term_syntax.parse_term("(FINITE : ((Tybit1[A]) -> Bool) -> Bool)((UNIV : (Tybit1[A]) -> Bool))"), t190),
  )
}

///|
let finite_tybit1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_TYBIT1")

///|
/// `FINITE_TYBIT1`
pub fn finite_tybit1() -> @kernel.Thm {
  finite_tybit1_c.get()
}

///|
/// FINITE_CLAUSES
fn step_66() -> Unit raise {
  let t191 = @simp.rewrite_tac(
    @list.List([finite_1(), finite_tybit0(), finite_tybit1()]),
  )
  finite_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(FINITE : ((Unit) -> Bool) -> Bool)((UNIV : (Unit) -> Bool)) && (FINITE : ((Tybit0[A]) -> Bool) -> Bool)((UNIV : (Tybit0[A]) -> Bool)) && (FINITE : ((Tybit1[A]) -> Bool) -> Bool)((UNIV : (Tybit1[A]) -> Bool))"),
      t191,
    ),
  )
}

///|
let finite_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CLAUSES")

///|
/// `FINITE_CLAUSES`
pub fn finite_clauses() -> @kernel.Thm {
  finite_clauses_c.get()
}

///|
/// DIMINDEX_CONV
fn step_67() -> Unit raise {
  let t194 = @tactics.conv_tac(@arith.bits_elim_conv)
  let t193 = @simp.rewrite_tac(@list.List([dimindex_clauses()]))
  let t195 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.conj_tac,
          @list.List([
            @simp.rewrite_tac(@list.List([@nums.numeral(), dimindex()])),
            @tactics.all_tac,
          ]),
        ),
        t193,
      ),
      t194,
    ),
    @int.arith_tac,
  )
  let t196 = (
    @term_syntax.parse_term("((dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == (n : Num)) == ((dimindex : ((A) -> Bool) -> Num)((s : (A) -> Bool)) == NUMERAL(n)) && ((dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == n) == ((dimindex : ((Tybit0[A]) -> Bool) -> Num)((UNIV : (Tybit0[A]) -> Bool)) == BIT0(n)) && ((dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == n) == ((dimindex : ((Tybit1[A]) -> Bool) -> Num)((UNIV : (Tybit1[A]) -> Bool)) == BIT1(n)) && (dimindex : ((Unit) -> Bool) -> Num)((UNIV : (Unit) -> Bool)) == BIT1(_0)"),
    t195,
  )
  dimindex_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x192 : (
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
          @tactics.prove(x192.0, x192.1)
        })(t196),
      ) {
      More(
        pth_num,
        tail=More(pth0, tail=More(pth1, tail=More(pth_one, tail=Empty)))
      ) => {
        let nvar = @term_syntax.parse_term("(n : Num)")
        fn calc_dimindex(x197 : @kernel.HolType) -> @kernel.Thm raise {
          let ty = x197
          match ty {
            @kernel.HolType::Tyapp("1", _) => pth_one
            @kernel.HolType::Tyapp("tybit0", More(ty_p, tail=_)) => {
              let th = calc_dimindex(ty_p)
              let n = @kernel.rand(@kernel.concl(th))
              @kernel.eq_mp(
                @kernel.inst_rule(
                  @list.List([(n, nvar)]),
                  @kernel.inst_type(@list.List([(ty_p, @kernel.aty)]), pth0),
                ),
                th,
              )
            }
            @kernel.HolType::Tyapp("tybit1", More(ty_p_1, tail=_)) => {
              let th_1 = calc_dimindex(ty_p_1)
              let n_1 = @kernel.rand(@kernel.concl(th_1))
              @kernel.eq_mp(
                @kernel.inst_rule(
                  @list.List([(n_1, nvar)]),
                  @kernel.inst_type(@list.List([(ty_p_1, @kernel.aty)]), pth1),
                ),
                th_1,
              )
            }
            _ => @lib.failure()
          }
        }
        fn(x198 : @kernel.Term) -> @kernel.Thm raise {
          match x198 {
            @kernel.Term::Comb(@kernel.Term::Const("dimindex", _), tm) => {
              let uty = @kernel.type_of(tm)
              match @kernel.dest_type(uty) {
                (_, More(sty, tail=_)) => {
                  let th_2 = calc_dimindex(sty)
                  let svar = @kernel.mk_var("s", uty)
                  let ntm = @kernel.rand(@kernel.concl(th_2))
                  let pth = @kernel.inst_rule(
                    @list.List([(tm, svar), (ntm, nvar)]),
                    @kernel.inst_type(@list.List([(sty, @kernel.aty)]), pth_num),
                  )
                  @kernel.eq_mp(pth, th_2)
                }
                _ => raise @lib.MatchFailure("tscript.ml:434")
              }
            }
            _ => raise Failure("DIMINDEX_CONV")
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:410")
    },
  )
}

///|
let dimindex_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("DIMINDEX_CONV")

///|
/// `DIMINDEX_CONV`
pub fn dimindex_conv(x : @kernel.Term) -> @kernel.Thm raise {
  dimindex_conv_c.get()(x)
}

///|
/// HAS_SIZE_DIMINDEX_RULE
fn step_68() -> Unit raise {
  let t199 = @meson.meson_tac(
    @list.List([univ_has_size_dimindex(), @sets.has_size()]),
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), (n : Num)) == ((FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && (dimindex : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)) == n)"),
    t199,
  )
  let htm = @term_syntax.parse_term("(HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool))")
  let conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x200 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x200
    },
    @list.List([pth]),
  )
  let t202 = @simp.gen_rewrite_conv(
    fn(
      x201 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x201
    },
    @list.List([finite_clauses()]),
  )
  let rule : (@kernel.Term) -> @kernel.Thm raise = fn(
    x203 : @kernel.Term,
  ) -> @kernel.Thm raise {
    @bool.eqt_elim(t202(x203))
  }
  has_size_dimindex_rule_c.set(fn(x204 : @kernel.HolType) -> @kernel.Thm raise {
    let nty = x204
    let t205 = @nums.mk_numeral(@basics.dest_finty(nty))
    let tm = @kernel.mk_comb(
      @kernel.inst(@list.List([(nty, @kernel.aty)]), htm),
      t205,
    )
    let th1 = conv(tm)
    let t206 = dimindex_conv(
      @equal.lhand(@kernel.rand(@kernel.rand(@kernel.concl(th1)))),
    )
    let t207 = @bool.conj(
      rule(@equal.lhand(@kernel.rand(@kernel.concl(th1)))),
      t206,
    )
    @kernel.eq_mp(@equal.sym(th1), t207)
  })
}

///|
let has_size_dimindex_rule_c : @lib.Cell[(@kernel.HolType) -> @kernel.Thm raise] = @lib.Cell::new(
  "HAS_SIZE_DIMINDEX_RULE",
)

///|
/// `HAS_SIZE_DIMINDEX_RULE`
pub fn has_size_dimindex_rule(x : @kernel.HolType) -> @kernel.Thm raise {
  has_size_dimindex_rule_c.get()(x)
}

///|
/// DIMINDEX_TAC
fn step_69() -> Unit raise {
  dimindex_tac_c.set(@tactics.conv_tac(@equal.once_depth_conv(dimindex_conv)))
}

///|
let dimindex_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("DIMINDEX_TAC")

///|
/// `DIMINDEX_TAC`
pub fn dimindex_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  dimindex_tac_c.get()(x)
}

///|
/// DIMINDEX_2
fn step_70() -> Unit raise {
  let t208 = @tactics.then_tac(dimindex_tac, @tactics.refl_tac)
  dimindex_2_c.set(
    @tactics.prove(@term_syntax.parse_term("(dimindex : ((2) -> Bool) -> Num)((UNIV : (2) -> Bool)) == 2"), t208),
  )
}

///|
let dimindex_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_2")

///|
/// `DIMINDEX_2`
pub fn dimindex_2() -> @kernel.Thm {
  dimindex_2_c.get()
}

///|
/// DIMINDEX_3
fn step_71() -> Unit raise {
  let t209 = @tactics.then_tac(dimindex_tac, @tactics.refl_tac)
  dimindex_3_c.set(
    @tactics.prove(@term_syntax.parse_term("(dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) == 3"), t209),
  )
}

///|
let dimindex_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_3")

///|
/// `DIMINDEX_3`
pub fn dimindex_3() -> @kernel.Thm {
  dimindex_3_c.get()
}

///|
/// DIMINDEX_4
fn step_72() -> Unit raise {
  let t210 = @tactics.then_tac(dimindex_tac, @tactics.refl_tac)
  dimindex_4_c.set(
    @tactics.prove(@term_syntax.parse_term("(dimindex : ((4) -> Bool) -> Num)((UNIV : (4) -> Bool)) == 4"), t210),
  )
}

///|
let dimindex_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_4")

///|
/// `DIMINDEX_4`
pub fn dimindex_4() -> @kernel.Thm {
  dimindex_4_c.get()
}

///|
/// HAS_SIZE_2
fn step_73() -> Unit raise {
  has_size_2_c.set(has_size_dimindex_rule(@term_syntax.parse_type("2")))
}

///|
let has_size_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_2")

///|
/// `HAS_SIZE_2`
pub fn has_size_2() -> @kernel.Thm {
  has_size_2_c.get()
}

///|
/// HAS_SIZE_3
fn step_74() -> Unit raise {
  has_size_3_c.set(has_size_dimindex_rule(@term_syntax.parse_type("3")))
}

///|
let has_size_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_3")

///|
/// `HAS_SIZE_3`
pub fn has_size_3() -> @kernel.Thm {
  has_size_3_c.get()
}

///|
/// HAS_SIZE_4
fn step_75() -> Unit raise {
  has_size_4_c.set(has_size_dimindex_rule(@term_syntax.parse_type("4")))
}

///|
let has_size_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_4")

///|
/// `HAS_SIZE_4`
pub fn has_size_4() -> @kernel.Thm {
  has_size_4_c.get()
}

///|
/// FINITE_CART
fn step_76() -> Unit raise {
  let t236 = @int.arith_rule(
    @term_syntax.parse_term("(n : Num) < (i : Num) && !(i == SUC(n)) → SUC(n) < i"),
  )
  let t237 = @meson.asm_meson_tac(
    @list.List([
      @arith.le(),
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      t236,
    ]),
  )
  let t235 = @simp.simp_tac(
    @list.List([
      cart_eq(),
      lambda_beta(),
      @int.arith_rule(@term_syntax.parse_term("(i : Num) <= (n : Num) → !(i == SUC(n))")),
    ]),
  )
  let t234 = @tactics.exists_tac(
    @term_syntax.parse_term("(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { (select : ((A) -> Bool) -> A)((x : A) => false) } else { (op_dollar : (Cart[A, N], Num) -> A)((v : Cart[A, N]), i) })"),
  )
  let t233 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((v : Cart[A, N]), SUC((n : Num)))"))
  let t232 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t231 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[A, N])"))
  let t230 = @simp.rewrite_tac(
    @list.List([
      @sets.subset(),
      @sets.in_image(),
      @sets.in_elim_pair_thm(),
      @pair.exists_pair_thm(),
    ]),
  )
  let t227 = @int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) <= (m : Num) → n <= m"))
  let t228 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_product(),
      @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")),
      t227,
    ]),
  )
  let t229 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image()), t228),
    @tactics.all_tac,
  ])
  let t226 = @tactics.exists_tac(
    @term_syntax.parse_term("(IMAGE : (((A, Cart[A, N])) -> Cart[A, N], ((A, Cart[A, N])) -> Bool, Cart[A, N]) -> Bool)(fn { ((x : A), (v : Cart[A, N])) => (lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => if i == SUC((n : Num)) { x } else { (op_dollar : (Cart[A, N], Num) -> A)(v, i) }) }, {((x : A), (v : Cart[A, N])) | (IN : (A, (A) -> Bool) -> Bool)(x, {(x : A) | (P : (Num, A) -> Bool)(SUC(n), x)}) && (IN : (Cart[A, N], (Cart[A, N]) -> Bool) -> Bool)(v, {(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})})"),
  )
  let t225 = @tactics.match_mp_tac(@sets.finite_subset())
  let t223 = @simp.simp_tac(
    @list.List([
      @sets.extension(),
      @sets.in_sing(),
      @sets.in_elim_thm(),
      cart_eq(),
      lambda_beta(),
    ]),
  )
  let t222 = @tactics.subgoal_then(
    @term_syntax.parse_term("{(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false)} == {(lambda : ((Num) -> A) -> Cart[A, N])((i : Num) => (select : ((A) -> Bool) -> A)((x : A) => false))}"),
    fn(
      x220 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x220
      @simp.simp_tac(@list.List([@sets.finite_rules(), th]))
    },
  )
  let t219 = @simp.simp_tac(
    @list.List([
      @int.arith_rule(
        @term_syntax.parse_term("(1 <= (i : Num) && i <= (n : Num) && 0 < i) == (1 <= i && i <= n)"),
      ),
    ]),
  )
  let t224 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @int.arith_rule(
                @term_syntax.parse_term("(1 <= (i : Num) && i <= (n : Num) && i <= 0) == false"),
              ),
            ]),
          ),
          t219,
        ),
        t222,
      ),
      t223,
    ),
    @tactics.all_tac,
  ])
  let t218 = @simp.rewrite_tac(
    @list.List([@arith.le_refl(), @arith.let_antisym()]),
  )
  let t214 = @term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")
  let t217 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, n <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (FINITE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && i <= n → (P : (Num, A) -> Bool)(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))) && (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && n < i → (op_dollar : (Cart[A, N], Num) -> A)(v, i) == (select : ((A) -> Bool) -> A)((x : A) => false))})"),
    fn(
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
    },
  )
  let t238 = @tactics.then_tac(
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
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.gen_tac, @tactics.disch_tac,
                                    ),
                                    t217,
                                  ),
                                  t218,
                                ),
                                @nums.induct_tac,
                              ),
                              t224,
                            ),
                            @tactics.disch_tac,
                          ),
                          t225,
                        ),
                        t226,
                      ),
                      @tactics.conj_tac,
                    ),
                    t229,
                  ),
                  t230,
                ),
                t231,
              ),
              t232,
            ),
            @tactics.strip_tac,
          ),
          t233,
        ),
        t234,
      ),
      t235,
    ),
    t237,
  )
  finite_cart_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, A) -> Bool, (∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (FINITE : ((A) -> Bool) -> Bool)({(x : A) | P(i, x)})) → (FINITE : ((Cart[A, N]) -> Bool) -> Bool)({(v : Cart[A, N]) | ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → P(i, (op_dollar : (Cart[A, N], Num) -> A)(v, i))})"),
      t238,
    ),
  )
}

///|
let finite_cart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CART")

///|
/// `FINITE_CART`
pub fn finite_cart() -> @kernel.Thm {
  finite_cart_c.get()
}

///|
/// HAS_SIZE_CART_UNIV
fn step_77() -> Unit raise {
  let t256 = @meson.meson_tac(@list.List([cart_tybij()]))
  let t255 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t254 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t252 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t253 = @list.List([@meson.meson_tac(@list.List([cart_tybij()])), t252])
  let t251 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t249 = @drule.match_mp(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(
      @sets.has_size_image_inj(),
    ),
  )
  let t246 = @term_syntax.parse_term("(mk_cart : ((Finite_image[N]) -> A) -> Cart[A, N])")
  let t257 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_then(fn(
                    x250 : @kernel.Thm,
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
                        x243 : @kernel.Thm,
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
                        let s244 = @tactics.mp_tac(x243)
                        fn(
                          x245 : (
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
                          s244(x245)
                        }
                      })(
                        ((x247 : @kernel.Thm) => @bool.ispec(t246, x247))(x248),
                      )
                    })(t249(x250))
                  }),
                  t251,
                ),
                @tactics.ants_tac,
              ),
              t253,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t254,
      ),
      t255,
    ),
    t256,
  )
  let t258 = @list.List([
    @simp.asm_simp_tac(
      @list.List([@sets.has_size_funspace_univ(), has_size_finite_image()]),
    ),
    t257,
  ])
  let t242 = @tactics.subgoal_then(
    @term_syntax.parse_term("(HAS_SIZE : (((Finite_image[N]) -> A) -> Bool, Num) -> Bool)((UNIV : ((Finite_image[N]) -> A) -> Bool), EXP((m : Num), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"),
    fn(
      x239 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s240 = @tactics.mp_tac(x239)
      fn(
        x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s240(x241)
      }
    },
  )
  let t259 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t242),
    t258,
  )
  has_size_cart_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), m) → (HAS_SIZE : ((Cart[A, N]) -> Bool, Num) -> Bool)((UNIV : (Cart[A, N]) -> Bool), EXP(m, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"),
      t259,
    ),
  )
}

///|
let has_size_cart_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_CART_UNIV",
)

///|
/// `HAS_SIZE_CART_UNIV`
pub fn has_size_cart_univ() -> @kernel.Thm {
  has_size_cart_univ_c.get()
}

///|
/// CARD_CART_UNIV
fn step_78() -> Unit raise {
  let t260 = @meson.meson_tac(
    @list.List([has_size_cart_univ(), @sets.has_size()]),
  )
  card_cart_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (CARD : ((Cart[A, N]) -> Bool) -> Num)((UNIV : (Cart[A, N]) -> Bool)) == EXP((CARD : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool)), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"),
      t260,
    ),
  )
}

///|
let card_cart_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_CART_UNIV")

///|
/// `CARD_CART_UNIV`
pub fn card_cart_univ() -> @kernel.Thm {
  card_cart_univ_c.get()
}

///|
/// FINITE_CART_UNIV
fn step_79() -> Unit raise {
  let t261 = @meson.meson_tac(
    @list.List([has_size_cart_univ(), @sets.has_size()]),
  )
  finite_cart_univ_c.set(
    @tactics.prove(@term_syntax.parse_term("(FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (FINITE : ((Cart[A, N]) -> Bool) -> Bool)((UNIV : (Cart[A, N]) -> Bool))"), t261),
  )
}

///|
let finite_cart_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_CART_UNIV",
)

///|
/// `FINITE_CART_UNIV`
pub fn finite_cart_univ() -> @kernel.Thm {
  finite_cart_univ_c.get()
}

///|
/// vector
fn step_80() -> Unit raise {
  vector_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(vector : (List[A]) -> Cart[A, N])((l : List[A])) == lambda((i : Num) => EL(i - 1, l))"),
    ),
  )
}

///|
let vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector")

///|
/// `vector`
pub fn vector() -> @kernel.Thm {
  vector_c.get()
}

///|
/// IN_ELIM_PASTECART_THM
fn step_81() -> Unit raise {
  let t262 = @meson.meson_tac(@list.List([]))
  let t263 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.in_elim_thm(),
        pastecart_eq(),
        fstcart_pastecart(),
        sndcart_pastecart(),
      ]),
    ),
    t262,
  )
  in_elim_pastecart_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Cart[A, M], Cart[A, N]) -> Bool, ∀ a : Cart[A, M], ∀ b : Cart[A, N], IN(pastecart(a, b), {pastecart((x : Cart[A, M]), (y : Cart[A, N])) | P(x, y)}) == P(a, b)"),
      t263,
    ),
  )
}

///|
let in_elim_pastecart_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IN_ELIM_PASTECART_THM",
)

///|
/// `IN_ELIM_PASTECART_THM`
pub fn in_elim_pastecart_thm() -> @kernel.Thm {
  in_elim_pastecart_thm_c.get()
}

///|
/// cart.ml:571
fn step_82() -> Unit raise {
  @printer.parse_as_infix("PCROSS", (22L, "right"))
}

///|
/// PCROSS
fn step_83() -> Unit raise {
  pcross_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(PCROSS : ((Cart[A, M]) -> Bool, (Cart[A, N]) -> Bool, Cart[A, Finite_sum[M, N]]) -> Bool)((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)) == {pastecart((x : Cart[A, M]), (y : Cart[A, N])) | IN(x, s) && IN(y, t)}"),
    ),
  )
}

///|
let pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS")

///|
/// `PCROSS`
pub fn pcross() -> @kernel.Thm {
  pcross_c.get()
}

///|
/// FORALL_IN_PCROSS
fn step_84() -> Unit raise {
  let t264 = @simp.rewrite_tac(@list.List([pcross(), @sets.forall_in_gspec()]))
  forall_in_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ z : Cart[A, Finite_sum[M, N]], IN(z, PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool))) → (P : (Cart[A, Finite_sum[M, N]]) -> Bool)(z)) == (∀ x : Cart[A, M], ∀ y : Cart[A, N], IN(x, s) && IN(y, t) → P(pastecart(x, y)))"),
      t264,
    ),
  )
}

///|
let forall_in_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_IN_PCROSS",
)

///|
/// `FORALL_IN_PCROSS`
pub fn forall_in_pcross() -> @kernel.Thm {
  forall_in_pcross_c.get()
}

///|
/// EXISTS_IN_PCROSS
fn step_85() -> Unit raise {
  let t265 = @simp.rewrite_tac(
    @list.List([pcross(), @sets.exists_in_gspec(), @theorems.conj_assoc()]),
  )
  exists_in_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ z : Cart[A, Finite_sum[M, N]], IN(z, PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool))) && (P : (Cart[A, Finite_sum[M, N]]) -> Bool)(z)) == (∃ x : Cart[A, M], ∃ y : Cart[A, N], IN(x, s) && IN(y, t) && P(pastecart(x, y)))"),
      t265,
    ),
  )
}

///|
let exists_in_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_IN_PCROSS",
)

///|
/// `EXISTS_IN_PCROSS`
pub fn exists_in_pcross() -> @kernel.Thm {
  exists_in_pcross_c.get()
}

///|
/// PASTECART_IN_PCROSS
fn step_86() -> Unit raise {
  let t266 = @simp.rewrite_tac(@list.List([pcross(), in_elim_pastecart_thm()]))
  pastecart_in_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ x : Cart[A, M], ∀ y : Cart[A, N], IN(pastecart(x, y), PCROSS(s, t)) == (IN(x, s) && IN(y, t))"),
      t266,
    ),
  )
}

///|
let pastecart_in_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PASTECART_IN_PCROSS",
)

///|
/// `PASTECART_IN_PCROSS`
pub fn pastecart_in_pcross() -> @kernel.Thm {
  pastecart_in_pcross_c.get()
}

///|
/// PCROSS_EQ_EMPTY
fn step_87() -> Unit raise {
  let t267 = @sets.set_tac(@list.List([]))
  let t268 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pcross()])), t267)
  pcross_eq_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, (PCROSS(s, t) == {}) == (s == {} || t == {})"),
      t268,
    ),
  )
}

///|
let pcross_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PCROSS_EQ_EMPTY",
)

///|
/// `PCROSS_EQ_EMPTY`
pub fn pcross_eq_empty() -> @kernel.Thm {
  pcross_eq_empty_c.get()
}

///|
/// PCROSS_EMPTY
fn step_88() -> Unit raise {
  let t269 = @simp.rewrite_tac(@list.List([pcross_eq_empty()]))
  pcross_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (Cart[A, M]) -> Bool, (PCROSS : ((Cart[A, M]) -> Bool, (Cart[A, N]) -> Bool, Cart[A, Finite_sum[M, N]]) -> Bool)(s, ({} : (Cart[A, N]) -> Bool)) == ({} : (Cart[A, Finite_sum[M, N]]) -> Bool)) && (∀ t : (Cart[A, N]) -> Bool, (PCROSS : ((Cart[A, M]) -> Bool, (Cart[A, N]) -> Bool, Cart[A, Finite_sum[M, N]]) -> Bool)(({} : (Cart[A, M]) -> Bool), t) == ({} : (Cart[A, Finite_sum[M, N]]) -> Bool))"),
      t269,
    ),
  )
}

///|
let pcross_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_EMPTY")

///|
/// `PCROSS_EMPTY`
pub fn pcross_empty() -> @kernel.Thm {
  pcross_empty_c.get()
}

///|
/// PCROSS_SING
fn step_89() -> Unit raise {
  let t270 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      forall_pastecart(),
      @sets.in_sing(),
      pastecart_in_pcross(),
      pastecart_inj(),
    ]),
  )
  pcross_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Cart[A, M], ∀ y : Cart[A, N], PCROSS({x}, {y}) == {pastecart(x, y)}"),
      t270,
    ),
  )
}

///|
let pcross_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_SING")

///|
/// `PCROSS_SING`
pub fn pcross_sing() -> @kernel.Thm {
  pcross_sing_c.get()
}

///|
/// SUBSET_PCROSS
fn step_90() -> Unit raise {
  let t271 = @meson.meson_tac(@list.List([]))
  let t272 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        pcross(),
        @sets.extension(),
        in_elim_pastecart_thm(),
        @sets.subset(),
        forall_pastecart(),
        pastecart_in_pcross(),
        @sets.not_in_empty(),
      ]),
    ),
    t271,
  )
  subset_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ s' : (Cart[A, M]) -> Bool, ∀ t' : (Cart[A, N]) -> Bool, SUBSET(PCROSS(s, t), PCROSS(s', t')) == (s == {} || t == {} || SUBSET(s, s') && SUBSET(t, t'))"),
      t272,
    ),
  )
}

///|
let subset_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_PCROSS")

///|
/// `SUBSET_PCROSS`
pub fn subset_pcross() -> @kernel.Thm {
  subset_pcross_c.get()
}

///|
/// PCROSS_MONO
fn step_91() -> Unit raise {
  let t273 = @simp.simp_tac(@list.List([subset_pcross()]))
  pcross_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ s' : (Cart[A, M]) -> Bool, ∀ t' : (Cart[A, N]) -> Bool, SUBSET(s, s') && SUBSET(t, t') → SUBSET(PCROSS(s, t), PCROSS(s', t'))"),
      t273,
    ),
  )
}

///|
let pcross_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_MONO")

///|
/// `PCROSS_MONO`
pub fn pcross_mono() -> @kernel.Thm {
  pcross_mono_c.get()
}

///|
/// PCROSS_EQ
fn step_92() -> Unit raise {
  let t274 = @sets.set_tac(@list.List([]))
  let t275 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@sets.subset_antisym_eq()), subset_pcross()]),
    ),
    t274,
  )
  pcross_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ s' : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, ∀ t' : (Cart[Real, N]) -> Bool, (PCROSS(s, t) == PCROSS(s', t')) == ((s == {} || t == {}) && (s' == {} || t' == {}) || s == s' && t == t')"),
      t275,
    ),
  )
}

///|
let pcross_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_EQ")

///|
/// `PCROSS_EQ`
pub fn pcross_eq() -> @kernel.Thm {
  pcross_eq_c.get()
}

///|
/// UNIV_PCROSS_UNIV
fn step_93() -> Unit raise {
  let t276 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      forall_pastecart(),
      pastecart_in_pcross(),
      @sets.in_univ(),
    ]),
  )
  univ_pcross_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(PCROSS : ((Cart[A, M]) -> Bool, (Cart[A, N]) -> Bool, Cart[A, Finite_sum[M, N]]) -> Bool)((UNIV : (Cart[A, M]) -> Bool), (UNIV : (Cart[A, N]) -> Bool)) == (UNIV : (Cart[A, Finite_sum[M, N]]) -> Bool)"),
      t276,
    ),
  )
}

///|
let univ_pcross_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UNIV_PCROSS_UNIV",
)

///|
/// `UNIV_PCROSS_UNIV`
pub fn univ_pcross_univ() -> @kernel.Thm {
  univ_pcross_univ_c.get()
}

///|
/// HAS_SIZE_PCROSS
fn step_94() -> Unit raise {
  let t291 = @simp.rewrite_tac(
    @list.List([forall_in_pcross(), fstcart_pastecart(), sndcart_pastecart()]),
  )
  let t290 = @simp.rewrite_tac(
    @list.List([@sets.in_elim_pair_thm(), pastecart_fst_snd()]),
  )
  let t289 = @simp.rewrite_tac(
    @list.List([@sets.forall_in_gspec(), pastecart_in_pcross()]),
  )
  let t288 = @tactics.exists_tac(
    @term_syntax.parse_term("(z : Cart[A, Finite_sum[M, N]]) => (fstcart(z), sndcart(z))"),
  )
  let t287 = @tactics.exists_tac(
    @term_syntax.parse_term("GABS((f : ((Cart[A, M], Cart[A, N])) -> Cart[A, Finite_sum[M, N]]) => ∀ x : Cart[A, M], ∀ y : Cart[A, N], GEQ(f((x, y)), pastecart(x, y)))"),
  )
  let t286 = @tactics.match_mp_tac(@sets.bijections_has_size_eq())
  let t284 = @term_syntax.parse_term("(k : Num)")
  let t285 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num) * (n : Num)"), t284)
  let t283 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t280 = @drule.match_mp(@sets.has_size_product())
  let t282 = @tactics.first_assum(fn(
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
    (fn(
      x277 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s278 = @tactics.mp_tac(x277)
      fn(
        x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s278(x279)
      }
    })(t280(x281))
  })
  let t292 = @tactics.then_tac(
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
                      @tactics.disch_tac,
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
  )
  has_size_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ m : Num, ∀ n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) → HAS_SIZE(PCROSS(s, t), m * n)"),
      t292,
    ),
  )
}

///|
let has_size_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HAS_SIZE_PCROSS",
)

///|
/// `HAS_SIZE_PCROSS`
pub fn has_size_pcross() -> @kernel.Thm {
  has_size_pcross_c.get()
}

///|
/// FINITE_PCROSS
fn step_95() -> Unit raise {
  let t293 = @meson.meson_tac(
    @list.List([
      @simp.rewrite_rule(@list.List([@sets.has_size()]))(has_size_pcross()),
    ]),
  )
  finite_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, FINITE(s) && FINITE(t) → FINITE(PCROSS(s, t))"),
      t293,
    ),
  )
}

///|
let finite_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_PCROSS")

///|
/// `FINITE_PCROSS`
pub fn finite_pcross() -> @kernel.Thm {
  finite_pcross_c.get()
}

///|
/// FINITE_PCROSS_EQ
fn step_96() -> Unit raise {
  let t304 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t303 = @simp.rewrite_tac(
    @list.List([pastecart_in_pcross(), fstcart_pastecart(), sndcart_pastecart()]),
  )
  let t302 = @simp.asm_simp_tac(
    @list.List([
      @sets.finite_image(),
      @sets.subset(),
      @sets.in_image(),
      exists_pastecart(),
    ]),
  )
  let t300 = @tactics.exists_tac(
    @term_syntax.parse_term("IMAGE(sndcart, PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)))"),
  )
  let t301 = @list.List([
    @tactics.exists_tac(
      @term_syntax.parse_term("IMAGE(fstcart, PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)))"),
    ),
    t300,
  ])
  let t299 = @tactics.match_mp_tac(@sets.finite_subset())
  let t298 = @tactics.repeat_tac(@tactics.strip_tac)
  let t297 = @simp.simp_tac(@list.List([finite_pcross()]))
  let t296 = @simp.asm_rewrite_tac(
    @list.List([pcross_empty(), @sets.finite_empty()]),
  )
  let t294 = @term_syntax.parse_term("(t : (Cart[A, N]) -> Bool) == {}")
  let t295 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(s : (Cart[A, M]) -> Bool) == {}"), t294]),
  )
  let t305 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t295,
                    ),
                    t296,
                  ),
                  @tactics.eq_tac,
                ),
                t297,
              ),
              t298,
            ),
            t299,
          ),
          t301,
        ),
        t302,
      ),
      t303,
    ),
    t304,
  )
  finite_pcross_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, FINITE(PCROSS(s, t)) == (s == {} || t == {} || FINITE(s) && FINITE(t))"),
      t305,
    ),
  )
}

///|
let finite_pcross_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FINITE_PCROSS_EQ",
)

///|
/// `FINITE_PCROSS_EQ`
pub fn finite_pcross_eq() -> @kernel.Thm {
  finite_pcross_eq_c.get()
}

///|
/// IMAGE_FSTCART_PCROSS
fn step_97() -> Unit raise {
  let t310 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t309 = @simp.rewrite_tac(
    @list.List([exists_in_pcross(), fstcart_pastecart()]),
  )
  let t308 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t307 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_image()]),
  )
  let t306 = @simp.asm_rewrite_tac(
    @list.List([pcross_empty(), @sets.image_clauses()]),
  )
  let t311 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @class.cond_cases_tac,
            ),
            t306,
          ),
          t307,
        ),
        t308,
      ),
      t309,
    ),
    t310,
  )
  image_fstcart_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, IMAGE(fstcart, PCROSS(s, t)) == (if t == {} { {} } else { s })"),
      t311,
    ),
  )
}

///|
let image_fstcart_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_FSTCART_PCROSS",
)

///|
/// `IMAGE_FSTCART_PCROSS`
pub fn image_fstcart_pcross() -> @kernel.Thm {
  image_fstcart_pcross_c.get()
}

///|
/// IMAGE_SNDCART_PCROSS
fn step_98() -> Unit raise {
  let t316 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t315 = @simp.rewrite_tac(
    @list.List([exists_in_pcross(), sndcart_pastecart()]),
  )
  let t314 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t313 = @simp.rewrite_tac(
    @list.List([@sets.extension(), @sets.in_image()]),
  )
  let t312 = @simp.asm_rewrite_tac(
    @list.List([pcross_empty(), @sets.image_clauses()]),
  )
  let t317 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.gen_tac),
              @class.cond_cases_tac,
            ),
            t312,
          ),
          t313,
        ),
        t314,
      ),
      t315,
    ),
    t316,
  )
  image_sndcart_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, IMAGE(sndcart, PCROSS(s, t)) == (if s == {} { {} } else { t })"),
      t317,
    ),
  )
}

///|
let image_sndcart_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "IMAGE_SNDCART_PCROSS",
)

///|
/// `IMAGE_SNDCART_PCROSS`
pub fn image_sndcart_pcross() -> @kernel.Thm {
  image_sndcart_pcross_c.get()
}

///|
/// PCROSS_INTER
fn step_99() -> Unit raise {
  let t319 = @tactics.conv_tac(@class.taut)
  let t318 = @tactics.repeat_tac(@tactics.strip_tac)
  let t320 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          forall_pastecart(),
          @sets.in_inter(),
          pastecart_in_pcross(),
        ]),
      ),
      t318,
    ),
    t319,
  )
  pcross_inter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(s, INTER(t, u)) == INTER(PCROSS(s, t), PCROSS(s, u))) && (∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, M]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(INTER(s, t), u) == INTER(PCROSS(s, u), PCROSS(t, u)))"),
      t320,
    ),
  )
}

///|
let pcross_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_INTER")

///|
/// `PCROSS_INTER`
pub fn pcross_inter() -> @kernel.Thm {
  pcross_inter_c.get()
}

///|
/// PCROSS_UNION
fn step_100() -> Unit raise {
  let t322 = @tactics.conv_tac(@class.taut)
  let t321 = @tactics.repeat_tac(@tactics.strip_tac)
  let t323 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          forall_pastecart(),
          @sets.in_union(),
          pastecart_in_pcross(),
        ]),
      ),
      t321,
    ),
    t322,
  )
  pcross_union_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(s, UNION(t, u)) == UNION(PCROSS(s, t), PCROSS(s, u))) && (∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, M]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(UNION(s, t), u) == UNION(PCROSS(s, u), PCROSS(t, u)))"),
      t323,
    ),
  )
}

///|
let pcross_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_UNION")

///|
/// `PCROSS_UNION`
pub fn pcross_union() -> @kernel.Thm {
  pcross_union_c.get()
}

///|
/// PCROSS_DIFF
fn step_101() -> Unit raise {
  let t325 = @tactics.conv_tac(@class.taut)
  let t324 = @tactics.repeat_tac(@tactics.strip_tac)
  let t326 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          forall_pastecart(),
          @sets.in_diff(),
          pastecart_in_pcross(),
        ]),
      ),
      t324,
    ),
    t325,
  )
  pcross_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(s, DIFF(t, u)) == DIFF(PCROSS(s, t), PCROSS(s, u))) && (∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, M]) -> Bool, ∀ u : (Cart[A, N]) -> Bool, PCROSS(DIFF(s, t), u) == DIFF(PCROSS(s, u), PCROSS(t, u)))"),
      t326,
    ),
  )
}

///|
let pcross_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_DIFF")

///|
/// `PCROSS_DIFF`
pub fn pcross_diff() -> @kernel.Thm {
  pcross_diff_c.get()
}

///|
/// INTER_PCROSS
fn step_102() -> Unit raise {
  let t327 = @tactics.conv_tac(@class.taut)
  let t328 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.extension(),
        @sets.in_inter(),
        forall_pastecart(),
        pastecart_in_pcross(),
      ]),
    ),
    t327,
  )
  inter_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ s' : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ t' : (Cart[A, N]) -> Bool, INTER(PCROSS(s, t), PCROSS(s', t')) == PCROSS(INTER(s, s'), INTER(t, t'))"),
      t328,
    ),
  )
}

///|
let inter_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTER_PCROSS")

///|
/// `INTER_PCROSS`
pub fn inter_pcross() -> @kernel.Thm {
  inter_pcross_c.get()
}

///|
let pcross_unions_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PCROSS_UNIONS_UNIONS",
)

///|
/// `PCROSS_UNIONS_UNIONS`
pub fn pcross_unions_unions() -> @kernel.Thm {
  pcross_unions_unions_c.get()
}

///|
let pcross_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_UNIONS")

///|
/// `PCROSS_UNIONS`
pub fn pcross_unions() -> @kernel.Thm {
  pcross_unions_c.get()
}

///|
/// PCROSS_UNIONS_UNIONS, PCROSS_UNIONS
fn step_103() -> Unit raise {
  let t330 = @sets.set_tac(@list.List([]))
  let t331 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @sets.unions_gspec(),
        @sets.extension(),
        forall_pastecart(),
        @sets.in_elim_thm(),
        pastecart_in_pcross(),
      ]),
    ),
    t330,
  )
  let t332 = (
    @term_syntax.parse_term("(∀ f : ((Cart[A, M]) -> Bool) -> Bool, ∀ g : ((Cart[A, N]) -> Bool) -> Bool, PCROSS(UNIONS(f), UNIONS(g)) == UNIONS({PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)) | IN(s, f) && IN(t, g)})) && (∀ s : (Cart[A, M]) -> Bool, ∀ f : ((Cart[A, N]) -> Bool) -> Bool, PCROSS(s, UNIONS(f)) == UNIONS({PCROSS(s, (t : (Cart[A, N]) -> Bool)) | IN(t, f)})) && (∀ f : ((Cart[A, M]) -> Bool) -> Bool, ∀ t : (Cart[A, N]) -> Bool, PCROSS(UNIONS(f), t) == UNIONS({PCROSS((s : (Cart[A, M]) -> Bool), t) | IN(s, f)}))"),
    t331,
  )
  let (pcross_unions_unions, pcross_unions) = @bool.conj_pair(
    (fn(
      x329 : (
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
      @tactics.prove(x329.0, x329.1)
    })(t332),
  )
  pcross_unions_unions_c.set(pcross_unions_unions)
  pcross_unions_c.set(pcross_unions)
}

///|
let pcross_inters_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PCROSS_INTERS_INTERS",
)

///|
/// `PCROSS_INTERS_INTERS`
pub fn pcross_inters_inters() -> @kernel.Thm {
  pcross_inters_inters_c.get()
}

///|
let pcross_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PCROSS_INTERS")

///|
/// `PCROSS_INTERS`
pub fn pcross_inters() -> @kernel.Thm {
  pcross_inters_c.get()
}

///|
/// PCROSS_INTERS_INTERS, PCROSS_INTERS
fn step_104() -> Unit raise {
  let t336 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t335 = @simp.asm_rewrite_tac(
    @list.List([
      @sets.inters_gspec(),
      @sets.extension(),
      forall_pastecart(),
      @sets.in_elim_thm(),
      pastecart_in_pcross(),
      @sets.not_in_empty(),
    ]),
  )
  let t334 = @tactics.repeat_tac(
    @tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([]))),
  )
  let t337 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t334),
      t335,
    ),
    t336,
  )
  let t338 = (
    @term_syntax.parse_term("(∀ f : ((Cart[A, M]) -> Bool) -> Bool, ∀ g : ((Cart[A, N]) -> Bool) -> Bool, PCROSS(INTERS(f), INTERS(g)) == (if f == {} { INTERS({PCROSS(UNIV, (t : (Cart[A, N]) -> Bool)) | IN(t, g)}) } else { if g == {} { INTERS({PCROSS((s : (Cart[A, M]) -> Bool), UNIV) | IN(s, f)}) } else { INTERS({PCROSS((s : (Cart[A, M]) -> Bool), (t : (Cart[A, N]) -> Bool)) | IN(s, f) && IN(t, g)}) } })) && (∀ s : (Cart[A, M]) -> Bool, ∀ f : ((Cart[A, N]) -> Bool) -> Bool, PCROSS(s, INTERS(f)) == (if f == {} { PCROSS(s, UNIV) } else { INTERS({PCROSS(s, (t : (Cart[A, N]) -> Bool)) | IN(t, f)}) })) && (∀ f : ((Cart[A, M]) -> Bool) -> Bool, ∀ t : (Cart[A, N]) -> Bool, PCROSS(INTERS(f), t) == (if f == {} { PCROSS(UNIV, t) } else { INTERS({PCROSS((s : (Cart[A, M]) -> Bool), t) | IN(s, f)}) }))"),
    t337,
  )
  let (pcross_inters_inters, pcross_inters) = @bool.conj_pair(
    (fn(
      x333 : (
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
      @tactics.prove(x333.0, x333.1)
    })(t338),
  )
  pcross_inters_inters_c.set(pcross_inters_inters)
  pcross_inters_c.set(pcross_inters)
}

///|
/// DISJOINT_PCROSS
fn step_105() -> Unit raise {
  let t339 = @simp.rewrite_tac(
    @list.List([@sets.disjoint(), inter_pcross(), pcross_eq_empty()]),
  )
  disjoint_pcross_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Cart[A, M]) -> Bool, ∀ t : (Cart[A, N]) -> Bool, ∀ s' : (Cart[A, M]) -> Bool, ∀ t' : (Cart[A, N]) -> Bool, DISJOINT(PCROSS(s, t), PCROSS(s', t')) == (DISJOINT(s, s') || DISJOINT(t, t'))"),
      t339,
    ),
  )
}

///|
let disjoint_pcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DISJOINT_PCROSS",
)

///|
/// `DISJOINT_PCROSS`
pub fn disjoint_pcross() -> @kernel.Thm {
  disjoint_pcross_c.get()
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
}
