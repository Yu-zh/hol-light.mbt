// Translated from upstream Library/poly.ml; edit this file directly.

///|
/// Library/poly.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// Library/poly.ml:9
fn step_2() -> Unit raise {
  @printer.parse_as_infix("++", (16L, "right"))
}

///|
/// Library/poly.ml:10
fn step_3() -> Unit raise {
  @printer.parse_as_infix("**", (20L, "right"))
}

///|
/// Library/poly.ml:11
fn step_4() -> Unit raise {
  @printer.parse_as_infix("##", (20L, "right"))
}

///|
/// Library/poly.ml:12
fn step_5() -> Unit raise {
  @printer.parse_as_infix("divides", (14L, "right"))
}

///|
/// Library/poly.ml:13
fn step_6() -> Unit raise {
  @printer.parse_as_infix("exp", (22L, "right"))
}

///|
/// Library/poly.ml:15
fn step_7() -> Unit raise {
  let t2 = ("diff", @term_syntax.parse_term("(poly_diff : (List[Real]) -> List[Real])"))
  let t3 = ("exp", @term_syntax.parse_term("(poly_exp : (List[Real], Num) -> List[Real])"))
  let t4 = ("neg", @term_syntax.parse_term("(poly_neg : (List[Real]) -> List[Real])"))
  let t5 = ("##", @term_syntax.parse_term("(poly_cmul : (Real, List[Real]) -> List[Real])"))
  let t6 = (
    "**",
    @term_syntax.parse_term("(poly_mul : (List[Real], List[Real]) -> List[Real])"),
  )
  @lib.do_list(
    fn(x1 : (String, @kernel.Term)) -> Unit raise {
      @preterm.override_interface(x1.0, x1.1)
    },
    @list.List([
      ("++", @term_syntax.parse_term("(poly_add : (List[Real], List[Real]) -> List[Real])")),
      t6,
      t5,
      t4,
      t3,
      t2,
    ]),
  )
}

///|
/// Library/poly.ml:23
fn step_8() -> Unit raise {
  @preterm.overload_interface(
    "divides",
    @term_syntax.parse_term("(poly_divides : (List[Real], List[Real]) -> Bool)"),
  )
}

///|
/// poly
fn step_9() -> Unit raise {
  let t7 = @term_syntax.parse_term("(poly : (List[Real], Real) -> Real)(NIL, (x : Real)) == real_of_num(0) && poly(CONS((h : Real), (t : List[Real])), x) == h + x * poly(t, x)")
  poly_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t7),
  )
}

///|
let poly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly")

///|
/// `poly`
pub fn poly() -> @kernel.Thm {
  poly_c.get()
}

///|
/// POLY_CONST
fn step_10() -> Unit raise {
  let t8 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([poly()])),
    @calc_rat.real_arith_tac,
  )
  poly_const_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Real, poly([c], x) == c"), t8),
  )
}

///|
let poly_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CONST")

///|
/// `POLY_CONST`
pub fn poly_const() -> @kernel.Thm {
  poly_const_c.get()
}

///|
/// POLY_X
fn step_11() -> Unit raise {
  let t9 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([poly()])),
    @calc_rat.real_arith_tac,
  )
  poly_x_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ c : _, ∀ x : Real, poly([real_of_num(0), real_of_num(1)], x) == x"), t9),
  )
}

///|
let poly_x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_X")

///|
/// `POLY_X`
pub fn poly_x() -> @kernel.Thm {
  poly_x_c.get()
}

///|
/// poly_add
fn step_12() -> Unit raise {
  let t10 = @term_syntax.parse_term("(poly_add : (List[Real], List[Real]) -> List[Real])(NIL, (l2 : List[Real])) == l2 && poly_add(CONS((h : Real), (t : List[Real])), l2) == (if l2 == NIL { CONS(h, t) } else { CONS(h + HD(l2), poly_add(t, TL(l2))) })")
  poly_add_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t10),
  )
}

///|
let poly_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_add")

///|
/// `poly_add`
pub fn poly_add() -> @kernel.Thm {
  poly_add_c.get()
}

///|
/// poly_cmul
fn step_13() -> Unit raise {
  let t11 = @term_syntax.parse_term("(poly_cmul : (Real, List[Real]) -> List[Real])((c : Real), NIL) == NIL && poly_cmul(c, CONS((h : Real), (t : List[Real]))) == CONS(c * h, poly_cmul(c, t))")
  poly_cmul_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t11),
  )
}

///|
let poly_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_cmul")

///|
/// `poly_cmul`
pub fn poly_cmul() -> @kernel.Thm {
  poly_cmul_c.get()
}

///|
/// poly_neg
fn step_14() -> Unit raise {
  poly_neg_c.set(
    @pair.new_definition(@term_syntax.parse_term("(poly_neg : (List[Real]) -> List[Real]) == poly_cmul(-real_of_num(1))")),
  )
}

///|
let poly_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_neg")

///|
/// `poly_neg`
pub fn poly_neg() -> @kernel.Thm {
  poly_neg_c.get()
}

///|
/// poly_mul
fn step_15() -> Unit raise {
  let t12 = @term_syntax.parse_term("(poly_mul : (List[Real], List[Real]) -> List[Real])(NIL, (l2 : List[Real])) == NIL && poly_mul(CONS((h : Real), (t : List[Real])), l2) == (if t == NIL { poly_cmul(h, l2) } else { poly_add(poly_cmul(h, l2), CONS(real_of_num(0), poly_mul(t, l2))) })")
  poly_mul_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t12),
  )
}

///|
let poly_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_mul")

///|
/// `poly_mul`
pub fn poly_mul() -> @kernel.Thm {
  poly_mul_c.get()
}

///|
/// poly_exp
fn step_16() -> Unit raise {
  let t13 = @term_syntax.parse_term("(poly_exp : (List[Real], Num) -> List[Real])((p : List[Real]), 0) == [real_of_num(1)] && poly_exp(p, SUC((n : Num))) == poly_mul(p, poly_exp(p, n))")
  poly_exp_c.set(
    @recursion.new_recursive_definition(@nums.num_recursion())(t13),
  )
}

///|
let poly_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_exp")

///|
/// `poly_exp`
pub fn poly_exp() -> @kernel.Thm {
  poly_exp_c.get()
}

///|
/// poly_diff_aux
fn step_17() -> Unit raise {
  let t14 = @term_syntax.parse_term("(poly_diff_aux : (Num, List[Real]) -> List[Real])((n : Num), NIL) == NIL && poly_diff_aux(n, CONS((h : Real), (t : List[Real]))) == CONS(real_of_num(n) * h, poly_diff_aux(SUC(n), t))")
  poly_diff_aux_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t14),
  )
}

///|
let poly_diff_aux_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_diff_aux")

///|
/// `poly_diff_aux`
pub fn poly_diff_aux() -> @kernel.Thm {
  poly_diff_aux_c.get()
}

///|
/// poly_diff
fn step_18() -> Unit raise {
  poly_diff_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(poly_diff : (List[Real]) -> List[Real])((l : List[Real])) == (if l == NIL { NIL } else { poly_diff_aux(1, TL(l)) })"),
    ),
  )
}

///|
let poly_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_diff")

///|
/// `poly_diff`
pub fn poly_diff() -> @kernel.Thm {
  poly_diff_c.get()
}

///|
/// LENGTH_POLY_DIFF_AUX
fn step_19() -> Unit raise {
  let t15 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([@lists.length(), poly_diff_aux()])),
  )
  length_poly_diff_aux_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[Real], ∀ n : Num, LENGTH(poly_diff_aux(n, l)) == LENGTH(l)"),
      t15,
    ),
  )
}

///|
let length_poly_diff_aux_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LENGTH_POLY_DIFF_AUX",
)

///|
/// `LENGTH_POLY_DIFF_AUX`
pub fn length_poly_diff_aux() -> @kernel.Thm {
  length_poly_diff_aux_c.get()
}

///|
/// LENGTH_POLY_DIFF
fn step_20() -> Unit raise {
  let t16 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.simp_tac(
      @list.List([
        poly_diff(),
        @lists.length(),
        length_poly_diff_aux(),
        @lists.not_cons_nil(),
        @lists.tl(),
        @arith.pre(),
      ]),
    ),
  )
  length_poly_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[Real], LENGTH(poly_diff(l)) == PRE(LENGTH(l))"),
      t16,
    ),
  )
}

///|
let length_poly_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LENGTH_POLY_DIFF",
)

///|
/// `LENGTH_POLY_DIFF`
pub fn length_poly_diff() -> @kernel.Thm {
  length_poly_diff_c.get()
}

///|
/// POLY_ADD_CLAUSES
fn step_21() -> Unit raise {
  let t19 = @simp.asm_rewrite_tac(@list.List([poly_add()]))
  let t17 = @term_syntax.parse_term("(p1 : List[Real])")
  let t18 = @tactics.spec_tac(@term_syntax.parse_term("(p1 : List[Real])"), t17)
  let t20 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            poly_add(),
            @lists.not_cons_nil(),
            @lists.hd(),
            @lists.tl(),
          ]),
        ),
        t18,
      ),
      @lists.list_induct_tac,
    ),
    t19,
  )
  poly_add_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poly_add(NIL, (p2 : List[Real])) == p2 && poly_add((p1 : List[Real]), NIL) == p1 && poly_add(CONS((h1 : Real), (t1 : List[Real])), CONS((h2 : Real), (t2 : List[Real]))) == CONS(h1 + h2, poly_add(t1, t2))"),
      t20,
    ),
  )
}

///|
let poly_add_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ADD_CLAUSES",
)

///|
/// `POLY_ADD_CLAUSES`
pub fn poly_add_clauses() -> @kernel.Thm {
  poly_add_clauses_c.get()
}

///|
/// POLY_CMUL_CLAUSES
fn step_22() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([poly_cmul()]))
  poly_cmul_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poly_cmul((c : Real), NIL) == NIL && poly_cmul(c, CONS((h : Real), (t : List[Real]))) == CONS(c * h, poly_cmul(c, t))"),
      t21,
    ),
  )
}

///|
let poly_cmul_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_CMUL_CLAUSES",
)

///|
/// `POLY_CMUL_CLAUSES`
pub fn poly_cmul_clauses() -> @kernel.Thm {
  poly_cmul_clauses_c.get()
}

///|
/// POLY_NEG_CLAUSES
fn step_23() -> Unit raise {
  let t22 = @simp.rewrite_tac(
    @list.List([
      poly_neg(),
      poly_cmul_clauses(),
      @calc_int.real_mul_lneg(),
      @realax.real_mul_lid(),
    ]),
  )
  poly_neg_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poly_neg(NIL) == NIL && poly_neg(CONS((h : Real), (t : List[Real]))) == CONS(-h, poly_neg(t))"),
      t22,
    ),
  )
}

///|
let poly_neg_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_NEG_CLAUSES",
)

///|
/// `POLY_NEG_CLAUSES`
pub fn poly_neg_clauses() -> @kernel.Thm {
  poly_neg_clauses_c.get()
}

///|
/// POLY_MUL_CLAUSES
fn step_24() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([poly_mul(), @lists.not_cons_nil()]))
  poly_mul_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poly_mul(NIL, (p2 : List[Real])) == NIL && poly_mul([(h1 : Real)], p2) == poly_cmul(h1, p2) && poly_mul(CONS(h1, CONS((k1 : Real), (t1 : List[Real]))), p2) == poly_add(poly_cmul(h1, p2), CONS(real_of_num(0), poly_mul(CONS(k1, t1), p2)))"),
      t23,
    ),
  )
}

///|
let poly_mul_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_MUL_CLAUSES",
)

///|
/// `POLY_MUL_CLAUSES`
pub fn poly_mul_clauses() -> @kernel.Thm {
  poly_mul_clauses_c.get()
}

///|
/// POLY_DIFF_CLAUSES
fn step_25() -> Unit raise {
  let t24 = @simp.rewrite_tac(
    @list.List([
      poly_diff(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      poly_diff_aux(),
    ]),
  )
  poly_diff_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("poly_diff(NIL) == NIL && poly_diff([(c : Real)]) == NIL && poly_diff(CONS((h : Real), (t : List[Real]))) == poly_diff_aux(1, t)"),
      t24,
    ),
  )
}

///|
let poly_diff_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_CLAUSES",
)

///|
/// `POLY_DIFF_CLAUSES`
pub fn poly_diff_clauses() -> @kernel.Thm {
  poly_diff_clauses_c.get()
}

///|
/// POLY_ADD
fn step_26() -> Unit raise {
  let t25 = @simp.asm_rewrite_tac(
    @list.List([
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      poly(),
      @calc_int.real_add_rid(),
    ]),
  )
  let t26 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @lists.list_induct_tac,
          @simp.rewrite_tac(
            @list.List([poly_add(), poly(), @realax.real_add_lid()]),
          ),
        ),
        @lists.list_induct_tac,
      ),
      t25,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_add_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], ∀ x : Real, poly(poly_add(p1, p2), x) == poly(p1, x) + poly(p2, x)"),
      t26,
    ),
  )
}

///|
let poly_add_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ADD")

///|
/// `POLY_ADD`
pub fn poly_add_v1() -> @kernel.Thm {
  poly_add_v1_c.get()
}

///|
/// POLY_CMUL
fn step_27() -> Unit raise {
  let t27 = @tactics.then_tac(
    @tactics.then_tac(
      @lists.list_induct_tac,
      @simp.asm_rewrite_tac(@list.List([poly(), poly_cmul()])),
    ),
    @calc_rat.real_arith_tac,
  )
  poly_cmul_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ c : Real, ∀ x : Real, poly(poly_cmul(c, p), x) == c * poly(p, x)"),
      t27,
    ),
  )
}

///|
let poly_cmul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CMUL")

///|
/// `POLY_CMUL`
pub fn poly_cmul_v1() -> @kernel.Thm {
  poly_cmul_v1_c.get()
}

///|
/// POLY_NEG
fn step_28() -> Unit raise {
  let t28 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([poly_neg(), poly_cmul_v1()])),
    @calc_rat.real_arith_tac,
  )
  poly_neg_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ x : Real, poly(poly_neg(p), x) == -poly(p, x)"),
      t28,
    ),
  )
}

///|
let poly_neg_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_NEG")

///|
/// `POLY_NEG`
pub fn poly_neg_v1() -> @kernel.Thm {
  poly_neg_v1_c.get()
}

///|
/// POLY_MUL
fn step_29() -> Unit raise {
  let t35 = @simp.asm_rewrite_tac(
    @list.List([poly_add_v1(), poly_cmul_v1(), poly()]),
  )
  let t34 = @simp.rewrite_tac(
    @list.List([
      poly_mul(),
      poly_cmul_v1(),
      poly_add_v1(),
      poly(),
      poly_cmul_v1(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
      @lists.not_cons_nil(),
    ]),
  )
  let t32 = @term_syntax.parse_term("(t : List[Real])")
  let t33 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t32)
  let t30 = @term_syntax.parse_term("(h : Real)")
  let t31 = @tactics.spec_tac(@term_syntax.parse_term("(h : Real)"), t30)
  let t29 = @simp.rewrite_tac(
    @list.List([
      poly_mul(),
      poly(),
      @analysis.real_mul_lzero(),
      poly_cmul_v1(),
      poly_add_v1(),
    ]),
  )
  let t36 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac),
                t29,
              ),
              t31,
            ),
            t33,
          ),
          @lists.list_induct_tac,
        ),
        t34,
      ),
      t35,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_mul_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ p1 : List[Real], ∀ p2 : List[Real], poly(poly_mul(p1, p2), x) == poly(p1, x) * poly(p2, x)"),
      t36,
    ),
  )
}

///|
let poly_mul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MUL")

///|
/// `POLY_MUL`
pub fn poly_mul_v1() -> @kernel.Thm {
  poly_mul_v1_c.get()
}

///|
/// POLY_EXP
fn step_30() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([poly()]))
  let t37 = @simp.asm_rewrite_tac(
    @list.List([poly_exp(), @realax.real_pow(), poly_mul_v1()]),
  )
  let t39 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
        t37,
      ),
      t38,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_exp_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, ∀ x : Real, poly(poly_exp(p, n), x) == pow(poly(p, x), n)"),
      t39,
    ),
  )
}

///|
let poly_exp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_EXP")

///|
/// `POLY_EXP`
pub fn poly_exp_v1() -> @kernel.Thm {
  poly_exp_v1_c.get()
}

///|
/// POLY_DIFF_LEMMA
fn step_31() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t75 = @drule.match_mp(@analysis.diff_add())
  let t78 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
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
        (fn(
          x72 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s73 = @tactics.mp_tac(x72)
          fn(
            x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s73(x74)
          }
        })(t75(x76))
      }),
      @tactics.beta_tac,
    ),
    t77,
  )
  let t69 = @simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))
  let t71 = @tactics.disch_then(fn(
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
    (fn(
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
    })(t69(x70))
  })
  let t65 = @simp.rewrite_tac(@list.List([@analysis.suc_sub1()]))
  let t64 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("SUC((n : Num))"), @analysis.diff_pow()),
  )
  let t63 = @tactics.disch_then(@tactics.match_mp_tac)
  let t62 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Real) => pow(x, SUC((n : Num)))"), @analysis.diff_cmul()),
  )
  let t61 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t79 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()])),
                  t61,
                ),
                t62,
              ),
              @tactics.beta_tac,
            ),
            t63,
          ),
          t64,
        ),
        t65,
      ),
      t71,
    ),
    t78,
  ])
  let t60 = @tactics.subgoal_then(
    @term_syntax.parse_term("diffl((x : Real) => pow(x, SUC((n : Num))) * (h : Real), pow((x : Real), n) * (real_of_num(SUC(n)) * h), x)"),
    fn(
      x53 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x53
      @tactics.disch_then(fn(
        x59 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          let s56 = @tactics.mp_tac(x55)
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
        })(((x58 : @kernel.Thm) => @bool.conj(th, x58))(x59))
      })
    },
  )
  let t48 = @term_syntax.parse_term("(x : Real)")
  let t49 = @list.List([@term_syntax.parse_term("SUC((n : Num))"), t48])
  let t52 = @tactics.pop_assum(fn(
    x51 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x45 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s46 = @tactics.mp_tac(x45)
      fn(
        x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s46(x47)
      }
    })(((x50 : @kernel.Thm) => @bool.specl(t49, x50))(x51))
  })
  let t43 = @bool.conjunct2(@analysis.pow())
  let t44 = @simp.once_rewrite_tac(
    @list.List([
      @equal.gsym(
        @simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(t43),
      ),
    ]),
  )
  let t42 = @simp.rewrite_tac(
    @list.List([@analysis.real_ldistrib(), @realax.real_mul_assoc()]),
  )
  let t40 = @term_syntax.parse_term("(x : Real)")
  let t41 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(n : Num)"), t40]),
  )
  let t80 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @lists.list_induct_tac,
                @simp.rewrite_tac(
                  @list.List([
                    poly(),
                    poly_diff_aux(),
                    @analysis.real_mul_rzero(),
                    @analysis.diff_const(),
                  ]),
                ),
              ),
              t41,
            ),
            t42,
          ),
          t44,
        ),
        t52,
      ),
      t60,
    ),
    t79,
  )
  poly_diff_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[Real], ∀ n : Num, ∀ x : Real, diffl((x : Real) => pow(x, SUC(n)) * poly(l, x), pow(x, n) * poly(poly_diff_aux(SUC(n), l), x), x)"),
      t80,
    ),
  )
}

///|
let poly_diff_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_LEMMA",
)

///|
/// `POLY_DIFF_LEMMA`
pub fn poly_diff_lemma() -> @kernel.Thm {
  poly_diff_lemma_c.get()
}

///|
/// POLY_DIFF
fn step_32() -> Unit raise {
  let t104 = @simp.rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t101 = @drule.match_mp(@analysis.diff_add())
  let t103 = @tactics.disch_then(fn(
    x102 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(t101(x102))
  })
  let t93 = @term_syntax.parse_term("(x : Real)")
  let t94 = @bool.specl(
    @list.List([@term_syntax.parse_term("(h : Real)"), t93]),
    @analysis.diff_const(),
  )
  let t97 = @tactics.disch_then(fn(
    x96 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x95 : @kernel.Thm) => @bool.conj(t94, x95))(x96))
  })
  let t89 = @simp.rewrite_tac(@list.List([@analysis.pow_1()]))
  let t88 = @simp.rewrite_tac(
    @list.List([@analysis.pow(), @realax.real_mul_lid()]),
  )
  let t87 = @simp.rewrite_tac(
    @list.List([@equal.sym(@calc_num.num_conv(@term_syntax.parse_term("1")))]),
  )
  let t84 = @term_syntax.parse_term("(x : Real)")
  let t85 = @term_syntax.parse_term("0")
  let t86 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(t : List[Real])"), t85, t84]),
      poly_diff_lemma(),
    ),
  )
  let t83 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Real)")]),
  )
  let t82 = @simp.rewrite_tac(@list.List([poly(), @analysis.diff_const()]))
  let t81 = @simp.once_rewrite_tac(
    @list.List([
      @equal.sym(@class.eta_conv(@term_syntax.parse_term("(x : Real) => poly((l : List[Real]), x)"))),
    ]),
  )
  let t105 = @tactics.then_tac(
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
                          @lists.list_induct_tac,
                          @simp.rewrite_tac(@list.List([poly_diff_clauses()])),
                        ),
                        t81,
                      ),
                      t82,
                    ),
                    t83,
                  ),
                  t86,
                ),
                t87,
              ),
              t88,
            ),
            t89,
          ),
          t97,
        ),
        t103,
      ),
      @tactics.beta_tac,
    ),
    t104,
  )
  poly_diff_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[Real], ∀ x : Real, diffl((x : Real) => poly(l, x), poly(poly_diff(l), x), x)"),
      t105,
    ),
  )
}

///|
let poly_diff_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF")

///|
/// `POLY_DIFF`
pub fn poly_diff_v1() -> @kernel.Thm {
  poly_diff_v1_c.get()
}

///|
/// POLY_DIFFERENTIABLE
fn step_33() -> Unit raise {
  let t108 = @simp.rewrite_tac(@list.List([poly_diff_v1()]))
  let t107 = @tactics.exists_tac(@term_syntax.parse_term("poly(poly_diff((l : List[Real])), (x : Real))"))
  let t106 = @simp.rewrite_tac(@list.List([@analysis.differentiable()]))
  let t109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t106),
      t107,
    ),
    t108,
  )
  poly_differentiable_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[Real], ∀ x : Real, differentiable((x : Real) => poly(l, x), x)"),
      t109,
    ),
  )
}

///|
let poly_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFFERENTIABLE",
)

///|
/// `POLY_DIFFERENTIABLE`
pub fn poly_differentiable() -> @kernel.Thm {
  poly_differentiable_c.get()
}

///|
/// POLY_CONT
fn step_34() -> Unit raise {
  let t112 = @tactics.match_accept_tac(poly_diff_v1())
  let t111 = @tactics.exists_tac(@term_syntax.parse_term("poly(poly_diff((l : List[Real])), (x : Real))"))
  let t110 = @tactics.match_mp_tac(@analysis.diff_cont())
  let t113 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t110),
      t111,
    ),
    t112,
  )
  poly_cont_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : List[Real], ∀ x : Real, contl((x : Real) => poly(l, x), x)"), t113),
  )
}

///|
let poly_cont_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CONT")

///|
/// `POLY_CONT`
pub fn poly_cont() -> @kernel.Thm {
  poly_cont_c.get()
}

///|
/// POLY_IVT_POS
fn step_35() -> Unit raise {
  let t138 = @tactics.first_assum(fn(
    x135 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s136 = @tactics.contr_tac(x135)
    fn(
      x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s136(x137)
    }
  })
  let t134 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@realarith.real_lt_refl()])),
  )
  let t133 = @tactics.first_assum(fn(
    x130 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s131 = @tactics.subst_all_tac(x130)
    fn(
      x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s131(x132)
    }
  })
  let t129 = @tactics.disch_then(fn(
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
    let s127 = @tactics.subst_all_tac(x126)
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
  })
  let t125 = @simp.asm_rewrite_tac(@list.List([@analysis.real_lt_le()]))
  let t124 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t123 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t122 = @tactics.every_assum(fn(
    x120 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x120
    @simp.rewrite_tac(
      @list.List([@drule.match_mp(@analysis.real_lt_imp_le())(th)]),
    )
  })
  let t119 = @simp.rewrite_tac(@list.List([poly_cont()]))
  let t115 = @term_syntax.parse_term("real_of_num(0)")
  let t116 = @term_syntax.parse_term("(b : Real)")
  let t117 = @term_syntax.parse_term("(a : Real)")
  let t118 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Real) => poly((p : List[Real]), x)"), t117, t116, t115]),
      @analysis.ivt(),
    ),
  )
  let t114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t139 = @tactics.then_tac(
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
                          @simp.rewrite_tac(@list.List([@realax.real_gt()])),
                          t114,
                        ),
                        t118,
                      ),
                      t119,
                    ),
                    t122,
                  ),
                  t123,
                ),
                t124,
              ),
              t125,
            ),
            @tactics.conj_tac,
          ),
          t129,
        ),
        t133,
      ),
      t134,
    ),
    t138,
  )
  poly_ivt_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ b : Real, a < b && poly(p, a) < real_of_num(0) && poly(p, b) > real_of_num(0) → (∃ x : Real, a < x && x < b && poly(p, x) == real_of_num(0))"),
      t139,
    ),
  )
}

///|
let poly_ivt_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_IVT_POS")

///|
/// `POLY_IVT_POS`
pub fn poly_ivt_pos() -> @kernel.Thm {
  poly_ivt_pos_c.get()
}

///|
/// POLY_IVT_NEG
fn step_36() -> Unit raise {
  let t150 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) == real_of_num(0)) == (x == real_of_num(0))")),
    ]),
  )
  let t145 = @term_syntax.parse_term("(b : Real)")
  let t146 = @list.List([@term_syntax.parse_term("(a : Real)"), t145])
  let t149 = @tactics.disch_then(fn(
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
    (fn(
      x142 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s143 = @tactics.mp_tac(x142)
      fn(
        x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s143(x144)
      }
    })(((x147 : @kernel.Thm) => @bool.specl(t146, x147))(x148))
  })
  let t141 = @simp.rewrite_tac(
    @list.List([
      poly_neg_v1(),
      @calc_rat.real_arith(
        @term_syntax.parse_term("(-(x : Real) < real_of_num(0)) == (x > real_of_num(0)) && (-x > real_of_num(0)) == (x < real_of_num(0))"),
      ),
    ]),
  )
  let t140 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("poly_neg((p : List[Real]))"), poly_ivt_pos()),
  )
  let t151 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t140),
        t141,
      ),
      t149,
    ),
    t150,
  )
  poly_ivt_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ b : Real, a < b && poly(p, a) > real_of_num(0) && poly(p, b) < real_of_num(0) → (∃ x : Real, a < x && x < b && poly(p, x) == real_of_num(0))"),
      t151,
    ),
  )
}

///|
let poly_ivt_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_IVT_NEG")

///|
/// `POLY_IVT_NEG`
pub fn poly_ivt_neg() -> @kernel.Thm {
  poly_ivt_neg_c.get()
}

///|
/// POLY_MVT
fn step_37() -> Unit raise {
  let t169 = @bool.spec_all(poly_diff_v1())
  let t170 = @simp.asm_rewrite_tac(
    @list.List([@equal.conv_rule(@equal.depth_conv(@class.eta_conv), t169)]),
  )
  let t168 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t167 = @tactics.exists_tac(@term_syntax.parse_term("poly((p : List[Real]))"))
  let t166 = @tactics.match_mp_tac(@analysis.diff_uniq())
  let t165 = @simp.asm_rewrite_tac(@list.List([]))
  let t164 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t163 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(x : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t162 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(l : Real)"))(fn(
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
    }),
  )
  let t156 = @bool.spec_all(poly_differentiable())
  let t157 = @equal.conv_rule(@equal.depth_conv(@class.eta_conv), t156)
  let t155 = @bool.spec_all(poly_cont())
  let t158 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.conv_rule(@equal.depth_conv(@class.eta_conv), t155),
      t157,
    ]),
  )
  let t152 = @term_syntax.parse_term("(b : Real)")
  let t153 = @term_syntax.parse_term("(a : Real)")
  let t154 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("poly((p : List[Real]))"), t153, t152]),
      @analysis.mvt(),
    ),
  )
  let t171 = @tactics.then_tac(
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
                        t154,
                      ),
                      t158,
                    ),
                    t162,
                  ),
                  t163,
                ),
                t164,
              ),
              t165,
            ),
            @tactics.ap_term_tac,
          ),
          t166,
        ),
        t167,
      ),
      t168,
    ),
    t170,
  )
  poly_mvt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ b : Real, a < b → (∃ x : Real, a < x && x < b && poly(p, b) - poly(p, a) == (b - a) * poly(poly_diff(p), x))"),
      t171,
    ),
  )
}

///|
let poly_mvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MVT")

///|
/// `POLY_MVT`
pub fn poly_mvt() -> @kernel.Thm {
  poly_mvt_c.get()
}

///|
/// POLY_MVT_ADD
fn step_38() -> Unit raise {
  let t209 = @term_syntax.parse_term("(z : Real) < (a : Real)")
  let t210 = @term_syntax.parse_term("(a : Real) + (x : Real) < (z : Real)")
  let t211 = @tactics.map_every(
    fn(
      x206 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s207 = @tactics.undisch_tac(x206)
      fn(
        x208 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s207(x208)
      }
    },
    @list.List([@term_syntax.parse_term("real_of_num(0) < -(x : Real)"), t210, t209]),
  )
  let t205 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + ((y : Real) - x) == y"))]),
  )
  let t204 = @tactics.exists_tac(@term_syntax.parse_term("(z : Real) - (a : Real)"))
  let t203 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_eq_add_lcancel()]),
  )
  let t202 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) - (y : Real) == ((a : Real) - (a + (b : Real))) * (z : Real)) == (x == y + b * -z)"),
      ),
    ]),
  )
  let t201 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(z : Real)"))(fn(
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
      let s199 = @tactics.mp_tac(x198)
      fn(
        x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s199(x200)
      }
    }),
  )
  let t197 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (x : Real) < a) == (real_of_num(0) < -x)")),
    ]),
  )
  let t195 = @term_syntax.parse_term("(a : Real)")
  let t196 = @term_syntax.parse_term("(a : Real) + (x : Real)")
  let t212 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.mp_tac(
                      @bool.specl(
                        @list.List([
                          @term_syntax.parse_term("(p : List[Real])"),
                          t196,
                          t195,
                        ]),
                        poly_mvt(),
                      ),
                    ),
                    t197,
                  ),
                  t201,
                ),
                t202,
              ),
              @tactics.strip_tac,
            ),
            t203,
          ),
          t204,
        ),
        t205,
      ),
      t211,
    ),
    @calc_rat.real_arith_tac,
  )
  let t192 = @term_syntax.parse_term("(z : Real) < (a : Real) + (x : Real)")
  let t193 = @term_syntax.parse_term("(a : Real) < (z : Real)")
  let t194 = @tactics.map_every(
    fn(
      x189 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s190 = @tactics.undisch_tac(x189)
      fn(
        x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s190(x191)
      }
    },
    @list.List([@term_syntax.parse_term("real_of_num(0) < (x : Real)"), t193, t192]),
  )
  let t188 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + ((y : Real) - x) == y"))]),
  )
  let t187 = @tactics.exists_tac(@term_syntax.parse_term("(z : Real) - (a : Real)"))
  let t186 = @simp.asm_rewrite_tac(
    @list.List([@calc_int.real_eq_add_lcancel()]),
  )
  let t185 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(
        @term_syntax.parse_term("((x : Real) - (y : Real) == ((a : Real) + (b : Real) - a) * (z : Real)) == (x == y + b * z)"),
      ),
    ]),
  )
  let t184 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(z : Real)"))(fn(
      x181 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s182 = @tactics.mp_tac(x181)
      fn(
        x183 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s182(x183)
      }
    }),
  )
  let t180 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_addr()]))
  let t178 = @term_syntax.parse_term("(a : Real) + (x : Real)")
  let t179 = @term_syntax.parse_term("(a : Real)")
  let t213 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.mp_tac(
                      @bool.specl(
                        @list.List([
                          @term_syntax.parse_term("(p : List[Real])"),
                          t179,
                          t178,
                        ]),
                        poly_mvt(),
                      ),
                    ),
                    t180,
                  ),
                  t184,
                ),
                t185,
              ),
              @tactics.strip_tac,
            ),
            t186,
          ),
          t187,
        ),
        t188,
      ),
      t194,
    ),
    @calc_rat.real_arith_tac,
  )
  let t177 = @simp.asm_rewrite_tac(
    @list.List([
      @analysis.real_le_refl(),
      @calc_int.real_add_rid(),
      @analysis.real_mul_lzero(),
    ]),
  )
  let t214 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")), t177),
    t213,
    t212,
  ])
  let t175 = @bool.spec(
    @term_syntax.parse_term("(x : Real)"),
    @analysis.real_lt_negtotal(),
  )
  let t176 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(
    x172 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s173 = @tactics.assume_tac(x172)
    fn(
      x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s173(x174)
    }
  })(t175)
  let t215 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t176),
    t214,
  )
  poly_mvt_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ x : Real, ∃ y : Real, abs(y) <= abs(x) && poly(p, a + x) == poly(p, a) + x * poly(poly_diff(p), a + y)"),
      t215,
    ),
  )
}

///|
let poly_mvt_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MVT_ADD")

///|
/// `POLY_MVT_ADD`
pub fn poly_mvt_add() -> @kernel.Thm {
  poly_mvt_add_c.get()
}

///|
/// POLY_ADD_RZERO
fn step_39() -> Unit raise {
  let t216 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_add_v1(),
      poly(),
      @calc_int.real_add_rid(),
    ]),
  )
  poly_add_rzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly(poly_add(p, NIL)) == poly(p)"), t216),
  )
}

///|
let poly_add_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ADD_RZERO")

///|
/// `POLY_ADD_RZERO`
pub fn poly_add_rzero() -> @kernel.Thm {
  poly_add_rzero_c.get()
}

///|
/// POLY_MUL_ASSOC
fn step_40() -> Unit raise {
  let t217 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), @realax.real_mul_assoc()]),
  )
  poly_mul_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly(poly_mul(p, poly_mul(q, r))) == poly(poly_mul(poly_mul(p, q), r))"),
      t217,
    ),
  )
}

///|
let poly_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MUL_ASSOC")

///|
/// `POLY_MUL_ASSOC`
pub fn poly_mul_assoc() -> @kernel.Thm {
  poly_mul_assoc_c.get()
}

///|
/// POLY_EXP_ADD
fn step_41() -> Unit raise {
  let t218 = @simp.asm_rewrite_tac(
    @list.List([poly_mul_v1(), @arith.add_clauses(), poly_exp(), poly()]),
  )
  let t219 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly_mul_v1()])),
        @nums.induct_tac,
      ),
      t218,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_exp_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ n : Num, ∀ p : List[Real], poly(poly_exp(p, n + d)) == poly(poly_mul(poly_exp(p, n), poly_exp(p, d)))"),
      t219,
    ),
  )
}

///|
let poly_exp_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_EXP_ADD")

///|
/// `POLY_EXP_ADD`
pub fn poly_exp_add() -> @kernel.Thm {
  poly_exp_add_c.get()
}

///|
/// POLY_DIFF_AUX_ADD
fn step_42() -> Unit raise {
  let t220 = @simp.asm_rewrite_tac(
    @list.List([
      poly_diff_aux(),
      @class.fun_eq_thm(),
      poly(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
    ]),
  )
  let t221 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.then_tac(
          @lists.list_induct_tac,
          @simp.rewrite_tac(@list.List([poly_diff_aux(), poly_add()])),
        ),
      ),
      t220,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_diff_aux_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], ∀ n : Num, poly(poly_diff_aux(n, poly_add(p1, p2))) == poly(poly_add(poly_diff_aux(n, p1), poly_diff_aux(n, p2)))"),
      t221,
    ),
  )
}

///|
let poly_diff_aux_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_ADD",
)

///|
/// `POLY_DIFF_AUX_ADD`
pub fn poly_diff_aux_add() -> @kernel.Thm {
  poly_diff_aux_add_c.get()
}

///|
/// POLY_DIFF_AUX_CMUL
fn step_43() -> Unit raise {
  let t222 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        poly(),
        poly_diff_aux(),
        poly_cmul(),
        @real.real_mul_ac(),
      ]),
    ),
  )
  poly_diff_aux_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ c : Real, ∀ n : Num, poly(poly_diff_aux(n, poly_cmul(c, p))) == poly(poly_cmul(c, poly_diff_aux(n, p)))"),
      t222,
    ),
  )
}

///|
let poly_diff_aux_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_CMUL",
)

///|
/// `POLY_DIFF_AUX_CMUL`
pub fn poly_diff_aux_cmul() -> @kernel.Thm {
  poly_diff_aux_cmul_c.get()
}

///|
/// POLY_DIFF_AUX_NEG
fn step_44() -> Unit raise {
  let t223 = @simp.rewrite_tac(@list.List([poly_neg(), poly_diff_aux_cmul()]))
  poly_diff_aux_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, poly(poly_diff_aux(n, poly_neg(p))) == poly(poly_neg(poly_diff_aux(n, p)))"),
      t223,
    ),
  )
}

///|
let poly_diff_aux_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_NEG",
)

///|
/// `POLY_DIFF_AUX_NEG`
pub fn poly_diff_aux_neg() -> @kernel.Thm {
  poly_diff_aux_neg_c.get()
}

///|
/// POLY_DIFF_AUX_MUL_LEMMA
fn step_45() -> Unit raise {
  let t225 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@real.real_of_num_suc()),
      @real.real_add_rdistrib(),
      @realax.real_mul_lid(),
    ]),
  )
  let t224 = @simp.asm_rewrite_tac(
    @list.List([@lists.hd(), @lists.tl(), poly(), @class.fun_eq_thm()]),
  )
  let t226 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @lists.list_induct_tac,
        @simp.rewrite_tac(
          @list.List([poly_diff_aux(), poly_add(), @lists.not_cons_nil()]),
        ),
      ),
      t224,
    ),
    t225,
  )
  poly_diff_aux_mul_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, poly(poly_diff_aux(SUC(n), p)) == poly(poly_add(poly_diff_aux(n, p), p))"),
      t226,
    ),
  )
}

///|
let poly_diff_aux_mul_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_MUL_LEMMA",
)

///|
/// `POLY_DIFF_AUX_MUL_LEMMA`
pub fn poly_diff_aux_mul_lemma() -> @kernel.Thm {
  poly_diff_aux_mul_lemma_c.get()
}

///|
/// POLY_DIFF_ADD
fn step_46() -> Unit raise {
  let t228 = @simp.asm_rewrite_tac(
    @list.List([@lists.hd(), @lists.tl(), poly_diff_aux_add()]),
  )
  let t227 = @simp.rewrite_tac(
    @list.List([
      poly_add(),
      poly_diff(),
      @lists.not_cons_nil(),
      poly_add_rzero(),
    ]),
  )
  let t229 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@lists.list_induct_tac), t227),
    t228,
  )
  poly_diff_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], poly(poly_diff(poly_add(p1, p2))) == poly(poly_add(poly_diff(p1), poly_diff(p2)))"),
      t229,
    ),
  )
}

///|
let poly_diff_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_ADD")

///|
/// `POLY_DIFF_ADD`
pub fn poly_diff_add() -> @kernel.Thm {
  poly_diff_add_c.get()
}

///|
/// POLY_DIFF_CMUL
fn step_47() -> Unit raise {
  let t230 = @simp.rewrite_tac(
    @list.List([
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      poly_diff_aux_cmul(),
    ]),
  )
  let t231 = @tactics.then_tac(
    @tactics.then_tac(
      @lists.list_induct_tac,
      @simp.rewrite_tac(@list.List([poly_diff(), poly_cmul()])),
    ),
    t230,
  )
  poly_diff_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ c : Real, poly(poly_diff(poly_cmul(c, p))) == poly(poly_cmul(c, poly_diff(p)))"),
      t231,
    ),
  )
}

///|
let poly_diff_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_CMUL")

///|
/// `POLY_DIFF_CMUL`
pub fn poly_diff_cmul() -> @kernel.Thm {
  poly_diff_cmul_c.get()
}

///|
/// POLY_DIFF_NEG
fn step_48() -> Unit raise {
  let t232 = @simp.rewrite_tac(@list.List([poly_neg(), poly_diff_cmul()]))
  poly_diff_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], poly(poly_diff(poly_neg(p))) == poly(poly_neg(poly_diff(p)))"),
      t232,
    ),
  )
}

///|
let poly_diff_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_NEG")

///|
/// `POLY_DIFF_NEG`
pub fn poly_diff_neg() -> @kernel.Thm {
  poly_diff_neg_c.get()
}

///|
/// POLY_DIFF_MUL_LEMMA
fn step_49() -> Unit raise {
  let t234 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        poly(),
        poly_diff_aux_mul_lemma(),
        poly_add_v1(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  let t235 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        poly(),
        poly_add(),
        @analysis.real_mul_rzero(),
        @realax.real_add_lid(),
      ]),
    ),
    t234,
  ])
  let t233 = @simp.rewrite_tac(
    @list.List([
      poly_diff_aux(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
    ]),
  )
  let t236 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([poly_diff(), @lists.not_cons_nil()])),
        @lists.list_induct_tac,
      ),
      t233,
    ),
    t235,
  )
  poly_diff_mul_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : List[Real], ∀ h : Real, poly(poly_diff(CONS(h, t))) == poly(poly_add(CONS(real_of_num(0), poly_diff(t)), t))"),
      t236,
    ),
  )
}

///|
let poly_diff_mul_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_MUL_LEMMA",
)

///|
/// `POLY_DIFF_MUL_LEMMA`
pub fn poly_diff_mul_lemma() -> @kernel.Thm {
  poly_diff_mul_lemma_c.get()
}

///|
/// POLY_DIFF_MUL
fn step_50() -> Unit raise {
  let t243 = @simp.asm_rewrite_tac(
    @list.List([poly_diff_cmul(), poly_add_v1(), poly_mul_v1()]),
  )
  let t242 = @simp.rewrite_tac(
    @list.List([poly(), poly_add_v1(), poly_diff_mul_lemma(), poly_mul_v1()]),
  )
  let t241 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_diff_add(), poly_add_v1()]),
  )
  let t239 = @simp.rewrite_tac(
    @list.List([poly_add(), poly_mul(), poly_add_rzero(), poly_diff_cmul()]),
  )
  let t240 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([poly_diff_clauses()])),
      t239,
    ),
    @tactics.all_tac,
  ])
  let t238 = @simp.asm_rewrite_tac(@list.List([]))
  let t237 = @list.List([
    @simp.rewrite_tac(@list.List([poly_diff(), poly_add(), poly_mul()])),
    @tactics.all_tac,
  ])
  let t244 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @lists.list_induct_tac,
                      @simp.rewrite_tac(@list.List([poly_mul()])),
                    ),
                    t237,
                  ),
                  @tactics.gen_tac,
                ),
                @class.cond_cases_tac,
              ),
              t238,
            ),
            t240,
          ),
          t241,
        ),
        t242,
      ),
      t243,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_diff_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], poly(poly_diff(poly_mul(p1, p2))) == poly(poly_add(poly_mul(p1, poly_diff(p2)), poly_mul(poly_diff(p1), p2)))"),
      t244,
    ),
  )
}

///|
let poly_diff_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_MUL")

///|
/// `POLY_DIFF_MUL`
pub fn poly_diff_mul() -> @kernel.Thm {
  poly_diff_mul_c.get()
}

///|
/// POLY_DIFF_EXP
fn step_51() -> Unit raise {
  let t250 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]),
  )
  let t249 = @simp.rewrite_tac(@list.List([poly_exp(), poly_mul_v1()]))
  let t248 = @simp.asm_rewrite_tac(
    @list.List([
      poly_mul_v1(),
      poly_add_v1(),
      @class.fun_eq_thm(),
      poly_cmul_v1(),
    ]),
  )
  let t251 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([poly_diff_mul()])),
          t248,
        ),
        t249,
      ),
      t250,
    ),
    @calc_rat.real_arith_tac,
  )
  let t247 = @simp.rewrite_tac(
    @list.List([
      poly(),
      poly_diff_clauses(),
      @arith.add1(),
      @arith.add_clauses(),
    ]),
  )
  let t246 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_mul_v1(),
      poly_add_v1(),
      poly_cmul_v1(),
    ]),
  )
  let t252 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([poly_exp(), poly_diff_mul()])),
          t246,
        ),
        t247,
      ),
      @calc_rat.real_arith_tac,
    ),
    t251,
  ])
  let t245 = @simp.once_rewrite_tac(@list.List([poly_exp()]))
  let t253 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t245,
    ),
    t252,
  )
  poly_diff_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, poly(poly_diff(poly_exp(p, SUC(n)))) == poly(poly_mul(poly_cmul(real_of_num(SUC(n)), poly_exp(p, n)), poly_diff(p)))"),
      t253,
    ),
  )
}

///|
let poly_diff_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_EXP")

///|
/// `POLY_DIFF_EXP`
pub fn poly_diff_exp() -> @kernel.Thm {
  poly_diff_exp_c.get()
}

///|
/// POLY_DIFF_EXP_PRIME
fn step_52() -> Unit raise {
  let t257 = @simp.rewrite_tac(@list.List([poly()]))
  let t256 = @simp.rewrite_tac(
    @list.List([
      poly_diff(),
      poly_diff_aux(),
      @lists.tl(),
      @lists.not_cons_nil(),
    ]),
  )
  let t255 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly_mul_v1()]))
  let t254 = @simp.rewrite_tac(@list.List([poly_diff_exp()]))
  let t258 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t254),
          t255,
        ),
        t256,
      ),
      t257,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_diff_exp_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ a : Real, poly(poly_diff(poly_exp([-a, real_of_num(1)], SUC(n)))) == poly(poly_cmul(real_of_num(SUC(n)), poly_exp([-a, real_of_num(1)], n)))"),
      t258,
    ),
  )
}

///|
let poly_diff_exp_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_EXP_PRIME",
)

///|
/// `POLY_DIFF_EXP_PRIME`
pub fn poly_diff_exp_prime() -> @kernel.Thm {
  poly_diff_exp_prime_c.get()
}

///|
/// POLY_LINEAR_REM
fn step_53() -> Unit raise {
  let t274 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t273 = @simp.rewrite_tac(
    @list.List([@calc_int.real_add_rid(), @realax.real_mul_lid()]),
  )
  let t272 = @simp.rewrite_tac(
    @list.List([poly_add_clauses(), poly_mul_clauses(), poly_cmul()]),
  )
  let t270 = @term_syntax.parse_term("(q : List[Real])")
  let t271 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Real])"), t270)
  let t269 = @simp.rewrite_tac(@list.List([@lists.cons_11()]))
  let t268 = @simp.asm_rewrite_tac(
    @list.List([poly_add_clauses(), poly_mul_clauses(), poly_cmul()]),
  )
  let t267 = @tactics.exists_tac(@term_syntax.parse_term("(r : Real) * (a : Real) + (k : Real)"))
  let t266 = @tactics.exists_tac(@term_syntax.parse_term("CONS((r : Real), (q : List[Real]))"))
  let t262 = @term_syntax.parse_term("(h : Real)")
  let t265 = @tactics.pop_assum(fn(
    x264 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.strip_assume_tac(
      ((x263 : @kernel.Thm) => @bool.spec(t262, x263))(x264),
    )
  })
  let t275 = @tactics.then_tac(
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
                          @tactics.x_gen_tac(@term_syntax.parse_term("(k : Real)")),
                          t265,
                        ),
                        t266,
                      ),
                      t267,
                    ),
                    t268,
                  ),
                  t269,
                ),
                @tactics.conj_tac,
              ),
              @list.List([@calc_rat.real_arith_tac, @tactics.all_tac]),
            ),
            t271,
          ),
          @lists.list_induct_tac,
        ),
        t272,
      ),
      t273,
    ),
    t274,
  )
  let t261 = @simp.rewrite_tac(
    @list.List([@lists.hd(), @lists.tl(), @calc_int.real_add_rid()]),
  )
  let t260 = @simp.rewrite_tac(
    @list.List([poly_add(), poly_mul(), poly_cmul(), @lists.not_cons_nil()]),
  )
  let t259 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real)"))
  let t276 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])")),
          ),
          t259,
        ),
        t260,
      ),
      t261,
    ),
    t275,
  ])
  let t277 = @tactics.thenl(
    @tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([]))),
    t276,
  )
  poly_linear_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t : List[Real], ∀ h : Real, ∃ q : List[Real], ∃ r : Real, CONS(h, t) == poly_add([r], poly_mul([-(a : Real), real_of_num(1)], q))"),
      t277,
    ),
  )
}

///|
let poly_linear_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_LINEAR_REM",
)

///|
/// `POLY_LINEAR_REM`
pub fn poly_linear_rem() -> @kernel.Thm {
  poly_linear_rem_c.get()
}

///|
/// POLY_LINEAR_DIVIDES
fn step_54() -> Unit raise {
  let t301 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(a : Real) + a == real_of_num(0)"))]),
  )
  let t300 = @simp.rewrite_tac(
    @list.List([
      poly(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t299 = @simp.rewrite_tac(@list.List([poly()]))
  let t298 = @simp.rewrite_tac(@list.List([poly_mul_v1()]))
  let t297 = @simp.rewrite_tac(@list.List([poly()]))
  let t302 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t297),
            t298,
          ),
          t299,
        ),
        t300,
      ),
      t301,
    ),
    @calc_rat.real_arith_tac,
  )
  let t296 = @simp.rewrite_tac(@list.List([poly()]))
  let t303 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t296)
  let t292 = @simp.rewrite_tac(
    @list.List([
      poly_cmul(),
      poly_add(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      @realax.real_add_lid(),
    ]),
  )
  let t293 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        poly_cmul(),
        poly_add(),
        @lists.not_cons_nil(),
        @lists.hd(),
        @lists.tl(),
        @realax.real_add_lid(),
      ]),
    ),
    t292,
  ])
  let t290 = @term_syntax.parse_term("(q : List[Real])")
  let t291 = @tactics.spec_tac(@term_syntax.parse_term("(q : List[Real])"), t290)
  let t289 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t294 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.rewrite_tac(@list.List([poly_mul()])), t289),
        t291,
      ),
      @lists.list_induct_tac,
    ),
    t293,
  )
  let t288 = @simp.rewrite_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(a : Real) + a == real_of_num(0)"))]),
  )
  let t287 = @simp.rewrite_tac(
    @list.List([
      poly(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t286 = @simp.rewrite_tac(@list.List([poly_add_v1(), poly_mul_v1()]))
  let t285 = @simp.asm_rewrite_tac(@list.List([]))
  let t295 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.undisch_tac(@term_syntax.parse_term("poly(CONS((h : Real), (t : List[Real])), (a : Real)) == real_of_num(0)")),
              t285,
            ),
            t286,
          ),
          t287,
        ),
        t288,
      ),
      @calc_rat.real_arith_tac,
    ),
    t294,
  ])
  let t284 = @tactics.subgoal_then(@term_syntax.parse_term("(r : Real) == real_of_num(0)"), fn(
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
    let s282 = @tactics.subst_all_tac(x281)
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
  })
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t279 = @tactics.exists_tac(@term_syntax.parse_term("(q : List[Real])"))
  let t304 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disj2_tac,
              @tactics.strip_assume_tac(@bool.spec_all(poly_linear_rem())),
            ),
            t279,
          ),
          t280,
        ),
        t284,
      ),
      t295,
    ),
    t303,
    t302,
  ])
  let t278 = @list.List([
    @simp.rewrite_tac(@list.List([poly()])),
    @tactics.all_tac,
  ])
  let t305 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac),
          t278,
        ),
        @tactics.eq_tac,
      ),
      @tactics.strip_tac,
    ),
    t304,
  )
  poly_linear_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ p : List[Real], (poly(p, a) == real_of_num(0)) == (p == NIL || (∃ q : List[Real], p == poly_mul([-a, real_of_num(1)], q)))"),
      t305,
    ),
  )
}

///|
let poly_linear_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_LINEAR_DIVIDES",
)

///|
/// `POLY_LINEAR_DIVIDES`
pub fn poly_linear_divides() -> @kernel.Thm {
  poly_linear_divides_c.get()
}

///|
/// POLY_LENGTH_MUL
fn step_55() -> Unit raise {
  let t306 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([poly_cmul(), poly_add_clauses(), @lists.length()]),
    ),
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ p : List[Real], ∀ h : Real, ∀ k : Real, ∀ a : Real, LENGTH(poly_add(poly_cmul(k, p), CONS(h, poly_cmul(a, p)))) == SUC(LENGTH(p))"),
    t306,
  )
  let t307 = @simp.rewrite_tac(
    @list.List([poly_mul(), @lists.not_cons_nil(), lemma]),
  )
  poly_length_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ q : List[Real], LENGTH(poly_mul([-(a : Real), real_of_num(1)], q)) == SUC(LENGTH(q))"),
      t307,
    ),
  )
}

///|
let poly_length_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_LENGTH_MUL",
)

///|
/// `POLY_LENGTH_MUL`
pub fn poly_length_mul() -> @kernel.Thm {
  poly_length_mul_c.get()
}

///|
/// POLY_ROOTS_INDEX_LEMMA
fn step_56() -> Unit raise {
  let t380 = @simp.asm_rewrite_tac(@list.List([]))
  let t379 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t381 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.undisch_tac(@term_syntax.parse_term("!(∃ a : Real, poly((p : List[Real]), a) == real_of_num(0))")),
        t379,
      ),
      @tactics.disch_tac,
    ),
    t380,
  )
  let t376 = @simp.asm_rewrite_tac(@list.List([]))
  let t375 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) <= (n : Num)"))
  let t374 = @simp.asm_rewrite_tac(@list.List([]))
  let t373 = @simp.asm_rewrite_tac(@list.List([]))
  let t372 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t371 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t377 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_then(
                    @tactics.ante_res_then(fn(
                      x368 : @kernel.Thm,
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
                      let s369 = @tactics.mp_tac(x368)
                      fn(
                        x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                        s369(x370)
                      }
                    }),
                  ),
                  t371,
                ),
                t372,
              ),
              t373,
            ),
            @class.cond_cases_tac,
          ),
          t374,
        ),
        t375,
      ),
      t376,
    ),
    @int.arith_tac,
  )
  let t367 = @simp.rewrite_tac(@list.List([poly()]))
  let t378 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x364 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th = x364
          let t366 = @tactics.mp_tac(th)
          @tactics.then_tac(
            @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))")),
            t366,
          )
        }),
        t367,
      ),
      @calc_rat.real_arith_tac,
    ),
    t377,
  ])
  let t363 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x360 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s361 = @tactics.mp_tac(x360)
      fn(
        x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s361(x362)
      }
    }),
  )
  let t359 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t358 = @simp.rewrite_tac(
    @list.List([poly_mul_v1(), @arith.le(), @realarith.real_entire()]),
  )
  let t357 = @tactics.exists_tac(
    @term_syntax.parse_term("(m : Num) => if m == SUC((n : Num)) { (a : Real) } else { (i : (Num) -> Real)(m) }"),
  )
  let t354 = @term_syntax.parse_term("(i : (Num) -> Real)")
  let t356 = @tactics.disch_then((x355 : @kernel.Thm) => {
    @tactics.x_choose_tac(t354, x355)
  })
  let t353 = @simp.asm_rewrite_tac(@list.List([]))
  let t349 = @term_syntax.parse_term("(q : List[Real])")
  let t352 = @tactics.disch_then(fn(
    x351 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x346 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s347 = @tactics.mp_tac(x346)
      fn(
        x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s347(x348)
      }
    })(((x350 : @kernel.Thm) => @bool.spec(t349, x350))(x351))
  })
  let t344 = @tactics.disch_then(fn(
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
    @tactics.all_tac
  })
  let t345 = @list.List([
    @simp.asm_rewrite_tac(
      @list.List([
        poly_mul_v1(),
        poly(),
        @analysis.real_mul_rzero(),
        @class.fun_eq_thm(),
      ]),
    ),
    t344,
  ])
  let t342 = @class.asm_cases_tac(@term_syntax.parse_term("poly((q : List[Real])) == poly(NIL)"))
  let t341 = @simp.rewrite_tac(@list.List([poly_length_mul(), @nums.suc_inj()]))
  let t340 = @tactics.pop_assum(fn(
    x337 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s338 = @tactics.mp_tac(x337)
    fn(
      x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s338(x339)
    }
  })
  let t336 = @tactics.undisch_tac(
    @term_syntax.parse_term("!(poly(poly_mul([-(a : Real), real_of_num(1)], (q : List[Real]))) == poly(NIL))"),
  )
  let t335 = @tactics.first_assum(fn(
    x334 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x332 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x327 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s328 = @tactics.undisch_tac(x327)
        fn(
          x329 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s328(x329)
        }
      })(
        ((x331 : @kernel.Term) => {
          @lib.check(
            fn(x330 : @kernel.Term) -> Bool raise { @basics.is_forall(x330) },
            x331,
          )
        })(x332),
      )
    })(
      (fn(x333 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x333) })(
        x334,
      ),
    )
  })
  let t326 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Real])"))(fn(
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
      let s324 = @tactics.subst_all_tac(x323)
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
    }),
  )
  let t322 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t321 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x318 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s319 = @tactics.mp_tac(x318)
      fn(
        x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s319(x320)
      }
    }),
  )
  let t317 = @simp.gen_rewrite_tac(
    fn(
      x314 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s315 = @equal.land_conv(x314)
      fn(x316 : @kernel.Term) -> @kernel.Thm raise { s315(x316) }
    },
    @list.List([poly_linear_divides()]),
  )
  let t313 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x310 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s311 = @tactics.mp_tac(x310)
      fn(
        x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s311(x312)
      }
    }),
  )
  let t382 = @list.List([
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.thenl(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.undisch_tac(
                                              @term_syntax.parse_term("∃ a : Real, poly((p : List[Real]), a) == real_of_num(0)"),
                                            ),
                                            t313,
                                          ),
                                          t317,
                                        ),
                                        t321,
                                      ),
                                      t322,
                                    ),
                                    t326,
                                  ),
                                  t335,
                                ),
                                t336,
                              ),
                              t340,
                            ),
                            t341,
                          ),
                          @tactics.disch_tac,
                        ),
                        t342,
                      ),
                      t345,
                    ),
                    t352,
                  ),
                  t353,
                ),
                t356,
              ),
              t357,
            ),
            t358,
          ),
          t359,
        ),
        t363,
      ),
      t378,
    ),
    t381,
  ])
  let t309 = @class.asm_cases_tac(@term_syntax.parse_term("∃ a : Real, poly((p : List[Real]), a) == real_of_num(0)"))
  let t383 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t309),
    t382,
  )
  let t308 = @meson.meson_tac(@list.List([]))
  let t384 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@lists.length_eq_nil()])),
        t308,
      ),
      t383,
    ]),
  )
  poly_roots_index_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : List[Real], !(poly(p) == poly(NIL)) && LENGTH(p) == n → (∃ i : (Num) -> Real, ∀ x : Real, poly(p, x) == real_of_num(0) → (∃ m : Num, m <= n && x == i(m)))"),
      t384,
    ),
  )
}

///|
let poly_roots_index_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ROOTS_INDEX_LEMMA",
)

///|
/// `POLY_ROOTS_INDEX_LEMMA`
pub fn poly_roots_index_lemma() -> @kernel.Thm {
  poly_roots_index_lemma_c.get()
}

///|
/// POLY_ROOTS_INDEX_LENGTH
fn step_57() -> Unit raise {
  let t385 = @meson.meson_tac(@list.List([poly_roots_index_lemma()]))
  poly_roots_index_length_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], !(poly(p) == poly(NIL)) → (∃ i : (Num) -> Real, ∀ x : Real, poly(p, x) == real_of_num(0) → (∃ n : Num, n <= LENGTH(p) && x == i(n)))"),
      t385,
    ),
  )
}

///|
let poly_roots_index_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ROOTS_INDEX_LENGTH",
)

///|
/// `POLY_ROOTS_INDEX_LENGTH`
pub fn poly_roots_index_length() -> @kernel.Thm {
  poly_roots_index_length_c.get()
}

///|
/// POLY_ROOTS_FINITE_LEMMA
fn step_58() -> Unit raise {
  let t386 = @meson.meson_tac(
    @list.List([poly_roots_index_length(), @arith.lt_suc_le()]),
  )
  poly_roots_finite_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], !(poly(p) == poly(NIL)) → (∃ N : Num, ∃ i : (Num) -> Real, ∀ x : Real, poly(p, x) == real_of_num(0) → (∃ n : Num, n < N && x == i(n)))"),
      t386,
    ),
  )
}

///|
let poly_roots_finite_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ROOTS_FINITE_LEMMA",
)

///|
/// `POLY_ROOTS_FINITE_LEMMA`
pub fn poly_roots_finite_lemma() -> @kernel.Thm {
  poly_roots_finite_lemma_c.get()
}

///|
/// FINITE_LEMMA
fn step_59() -> Unit raise {
  let t408 = @meson.meson_tac(@list.List([]))
  let t407 = @tactics.mp_tac(
    @calc_rat.real_arith(
      @term_syntax.parse_term("∀ u : Real, ∀ v : Real, ∀ x : Real, x < v → x < abs(v) + (abs(u) + real_of_num(1))"),
    ),
  )
  let t406 = @tactics.mp_tac(
    @calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ v : Real, x < abs(v) + (abs(x) + real_of_num(1))")),
  )
  let t405 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t404 = @tactics.pop_assum(fn(
    x401 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s402 = @tactics.mp_tac(x401)
    fn(
      x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s402(x403)
    }
  })
  let t400 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((a : Real)) + (abs((i : (Num) -> Real)((N : Num))) + real_of_num(1))"),
  )
  let t397 = @term_syntax.parse_term("(a : Real)")
  let t399 = @tactics.disch_then((x398 : @kernel.Thm) => {
    @tactics.x_choose_tac(t397, x398)
  })
  let t393 = @term_syntax.parse_term("(z : Real) => (P : (Real) -> Bool)(z) && !(z == (i : (Num) -> Real)((N : Num)))")
  let t396 = @tactics.pop_assum(fn(
    x395 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x390 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s391 = @tactics.mp_tac(x390)
      fn(
        x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s391(x392)
      }
    })(((x394 : @kernel.Thm) => @bool.spec(t393, x394))(x395))
  })
  let t389 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (Real) -> Bool)"))
  let t387 = @meson.meson_tac(@list.List([]))
  let t388 = @list.List([
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.lt()])), t387),
    @tactics.all_tac,
  ])
  let t409 = @tactics.then_tac(
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
                          @tactics.gen_tac,
                          @simp.once_rewrite_tac(
                            @list.List([@class.right_imp_exists_thm()]),
                          ),
                        ),
                        @nums.induct_tac,
                      ),
                      t388,
                    ),
                    t389,
                  ),
                  t396,
                ),
                t399,
              ),
              t400,
            ),
            t404,
          ),
          t405,
        ),
        t406,
      ),
      t407,
    ),
    t408,
  )
  finite_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : (Num) -> Real, ∀ N : Num, ∀ P : (Real) -> Bool, (∀ x : Real, P(x) → (∃ n : Num, n < N && x == i(n))) → (∃ a : Real, ∀ x : Real, P(x) → x < a)"),
      t409,
    ),
  )
}

///|
let finite_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_LEMMA")

///|
/// `FINITE_LEMMA`
pub fn finite_lemma() -> @kernel.Thm {
  finite_lemma_c.get()
}

///|
/// POLY_ROOTS_FINITE
fn step_60() -> Unit raise {
  let t418 = @meson.meson_tac(@list.List([@realarith.real_lt_refl()]))
  let t417 = @simp.rewrite_tac(@list.List([]))
  let t413 = @term_syntax.parse_term("(x : Real) => poly((p : List[Real]), x) == real_of_num(0)")
  let t414 = @term_syntax.parse_term("(N : Num)")
  let t415 = @bool.specl(
    @list.List([@term_syntax.parse_term("(i : (Num) -> Real)"), t414, t413]),
    finite_lemma(),
  )
  let t412 = @term_syntax.parse_term("(N : Num)")
  let t416 = @tactics.mp_tac(
    @bool.genl(@list.List([@term_syntax.parse_term("(i : (Num) -> Real)"), t412]), t415),
  )
  let t411 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      @theorems.left_imp_exists_thm(),
      @class.not_forall_thm(),
      poly(),
    ]),
  )
  let t410 = @simp.rewrite_tac(@list.List([poly_roots_finite_lemma()]))
  let t419 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
            t410,
          ),
          t411,
        ),
        t416,
      ),
      t417,
    ),
    t418,
  )
  poly_roots_finite_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], !(poly(p) == poly(NIL)) == (∃ N : Num, ∃ i : (Num) -> Real, ∀ x : Real, poly(p, x) == real_of_num(0) → (∃ n : Num, n < N && x == i(n)))"),
      t419,
    ),
  )
}

///|
let poly_roots_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ROOTS_FINITE",
)

///|
/// `POLY_ROOTS_FINITE`
pub fn poly_roots_finite() -> @kernel.Thm {
  poly_roots_finite_c.get()
}

///|
/// POLY_ENTIRE_LEMMA
fn step_61() -> Unit raise {
  let t445 = @simp.rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((m : Num) + (n : Num) < m)"))]),
  )
  let t444 = @simp.asm_rewrite_tac(@list.List([@arith.lt_add_lcancel()]))
  let t446 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (n : Num)")),
          t444,
        ),
        t445,
      ),
      @tactics.ap_term_tac,
    ),
    @int.arith_tac,
  )
  let t443 = @tactics.first_assum(fn(
    x442 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x439 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s440 = @tactics.mp_tac(x439)
      fn(
        x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s440(x441)
      }
    })(@bool.conjunct1(x442))
  })
  let t438 = @simp.asm_rewrite_tac(@list.List([]))
  let t447 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("(n : Num)")),
          t438,
        ),
        t443,
      ),
      @int.arith_tac,
    ),
    t446,
  ])
  let t435 = @term_syntax.parse_term("(n : Num)")
  let t437 = @tactics.disch_then(
    @tactics.disj_cases_then(
      @tactics.ante_res_then((x436 : @kernel.Thm) => {
        @tactics.x_choose_tac(t435, x436)
      }),
    ),
  )
  let t434 = @simp.rewrite_tac(
    @list.List([@realarith.real_entire(), poly_mul_v1()]),
  )
  let t433 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t432 = @tactics.exists_tac(
    @term_syntax.parse_term("(n : Num) => if n < (N1 : Num) { (i1 : (Num) -> Real)(n) } else { (i2 : (Num) -> Real)(n - N1) }"),
  )
  let t431 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t428 = @term_syntax.parse_term("(i1 : (Num) -> Real)")
  let t430 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))((x429 : @kernel.Thm) => {
      @tactics.x_choose_tac(t428, x429)
    }),
  )
  let t425 = @term_syntax.parse_term("(i2 : (Num) -> Real)")
  let t427 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(N2 : Num)"))((x426 : @kernel.Thm) => {
      @tactics.x_choose_tac(t425, x426)
    }),
  )
  let t424 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
      let s422 = @tactics.mp_tac(x421)
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
    }),
  )
  let t420 = @simp.rewrite_tac(@list.List([poly_roots_finite()]))
  let t448 = @tactics.thenl(
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
                      t420,
                    ),
                    t424,
                  ),
                  t427,
                ),
                t430,
              ),
              t431,
            ),
            t432,
          ),
          t433,
        ),
        t434,
      ),
      t437,
    ),
    t447,
  )
  poly_entire_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], !(poly(p) == poly(NIL)) && !(poly(q) == poly(NIL)) → !(poly(poly_mul(p, q)) == poly(NIL))"),
      t448,
    ),
  )
}

///|
let poly_entire_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ENTIRE_LEMMA",
)

///|
/// `POLY_ENTIRE_LEMMA`
pub fn poly_entire_lemma() -> @kernel.Thm {
  poly_entire_lemma_c.get()
}

///|
/// POLY_ENTIRE
fn step_62() -> Unit raise {
  let t449 = @simp.asm_rewrite_tac(
    @list.List([@analysis.real_mul_rzero(), @analysis.real_mul_lzero(), poly()]),
  )
  let t450 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly_mul_v1()])),
      @tactics.strip_tac,
    ),
    t449,
  )
  let t451 = @list.List([
    @meson.meson_tac(@list.List([poly_entire_lemma()])),
    t450,
  ])
  let t452 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t451,
  )
  poly_entire_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], (poly(poly_mul(p, q)) == poly(NIL)) == (poly(p) == poly(NIL) || poly(q) == poly(NIL))"),
      t452,
    ),
  )
}

///|
let poly_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ENTIRE")

///|
/// `POLY_ENTIRE`
pub fn poly_entire() -> @kernel.Thm {
  poly_entire_c.get()
}

///|
/// POLY_MUL_LCANCEL
fn step_63() -> Unit raise {
  let t453 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((p : Real) + -(q : Real) == real_of_num(0)) == (p == q)")),
    ]),
  )
  let t454 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@class.fun_eq_thm(), poly_add_v1(), poly_neg_v1(), poly()]),
    ),
    t453,
  )
  let lemma1 = @tactics.prove(
    @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], (poly(poly_add(p, poly_neg(q))) == poly(NIL)) == (poly(p) == poly(q))"),
    t454,
  )
  let t455 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @class.fun_eq_thm(),
        poly_add_v1(),
        poly_neg_v1(),
        poly_mul_v1(),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  let lemma2 = @tactics.prove(
    @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly(poly_add(poly_mul(p, q), poly_neg(poly_mul(p, r)))) == poly(poly_mul(p, poly_add(q, poly_neg(r))))"),
    t455,
  )
  let t457 = @simp.rewrite_tac(@list.List([lemma1]))
  let t456 = @simp.rewrite_tac(@list.List([lemma2, poly_entire()]))
  let t458 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.once_rewrite_tac(@list.List([@equal.gsym(lemma1)])),
      t456,
    ),
    t457,
  )
  poly_mul_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], (poly(poly_mul(p, q)) == poly(poly_mul(p, r))) == (poly(p) == poly(NIL) || poly(q) == poly(r))"),
      t458,
    ),
  )
}

///|
let poly_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_MUL_LCANCEL",
)

///|
/// `POLY_MUL_LCANCEL`
pub fn poly_mul_lcancel() -> @kernel.Thm {
  poly_mul_lcancel_c.get()
}

///|
/// POLY_EXP_EQ_0
fn step_64() -> Unit raise {
  let t465 = @tactics.conv_tac(@class.taut)
  let t464 = @simp.asm_rewrite_tac(
    @list.List([poly_mul_v1(), poly(), @realarith.real_entire()]),
  )
  let t463 = @simp.rewrite_tac(
    @list.List([
      poly_exp(),
      poly(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
      @realax.real_of_num_eq(),
      @calc_num.arith(),
      @nums.not_suc(),
    ]),
  )
  let t461 = @term_syntax.parse_term("(n : Num)")
  let t462 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t461)
  let t460 = @simp.rewrite_tac(@list.List([@theorems.left_and_forall_thm()]))
  let t459 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly()]))
  let t466 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t459),
                  t460,
                ),
                @tactics.ap_term_tac,
              ),
              @tactics.abs_tac,
            ),
            t462,
          ),
          @nums.induct_tac,
        ),
        t463,
      ),
      t464,
    ),
    t465,
  )
  poly_exp_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, (poly(poly_exp(p, n)) == poly(NIL)) == (poly(p) == poly(NIL) && !(n == 0))"),
      t466,
    ),
  )
}

///|
let poly_exp_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_EXP_EQ_0")

///|
/// `POLY_EXP_EQ_0`
pub fn poly_exp_eq_0() -> @kernel.Thm {
  poly_exp_eq_0_c.get()
}

///|
/// POLY_PRIME_EQ_0
fn step_65() -> Unit raise {
  let t470 = @term_syntax.parse_term("real_of_num(1) - (a : Real)")
  let t473 = @tactics.disch_then(fn(
    x472 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x467 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s468 = @tactics.mp_tac(x467)
      fn(
        x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s468(x469)
      }
    })(((x471 : @kernel.Thm) => @bool.spec(t470, x471))(x472))
  })
  let t474 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly()])),
      ),
      t473,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_prime_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Real, !(poly([a, real_of_num(1)]) == poly(NIL))"), t474),
  )
}

///|
let poly_prime_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_PRIME_EQ_0",
)

///|
/// `POLY_PRIME_EQ_0`
pub fn poly_prime_eq_0() -> @kernel.Thm {
  poly_prime_eq_0_c.get()
}

///|
/// POLY_EXP_PRIME_EQ_0
fn step_66() -> Unit raise {
  let t475 = @meson.meson_tac(@list.List([poly_exp_eq_0(), poly_prime_eq_0()]))
  poly_exp_prime_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ n : Num, !(poly(poly_exp([a, real_of_num(1)], n)) == poly(NIL))"),
      t475,
    ),
  )
}

///|
let poly_exp_prime_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_EXP_PRIME_EQ_0",
)

///|
/// `POLY_EXP_PRIME_EQ_0`
pub fn poly_exp_prime_eq_0() -> @kernel.Thm {
  poly_exp_prime_eq_0_c.get()
}

///|
/// POLY_ZERO_LEMMA
fn step_67() -> Unit raise {
  let lemma = @simp.rewrite_rule(@list.List([@class.fun_eq_thm(), poly()]))(
    poly_roots_finite(),
  )
  let t519 = @drule.match_mp(
    @kernel.assume_rule(@term_syntax.parse_term("∀ x : Real, poly((t : List[Real]), x) == real_of_num(0) → x < (a : Real)")),
  )
  let t521 = @list.List([
    @calc_rat.real_arith_tac,
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x520 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x516 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s517 = @tactics.mp_tac(x516)
          fn(
            x518 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s517(x518)
          }
        })(t519(x520))
      }),
      @calc_rat.real_arith_tac,
    ),
  ])
  let t515 = @simp.rewrite_tac(
    @list.List([@realarith.real_entire(), @class.de_morgan_thm()]),
  )
  let t511 = @term_syntax.parse_term("abs((a : Real)) + real_of_num(1)")
  let t514 = @tactics.disch_then(fn(
    x513 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x508 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s509 = @tactics.mp_tac(x508)
      fn(
        x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s509(x510)
      }
    })(((x512 : @kernel.Thm) => @bool.spec(t511, x512))(x513))
  })
  let t505 = @term_syntax.parse_term("(a : Real)")
  let t507 = @tactics.disch_then((x506 : @kernel.Thm) => {
    @tactics.x_choose_tac(t505, x506)
  })
  let t504 = @simp.asm_rewrite_tac(@list.List([]))
  let t501 = @term_syntax.parse_term("(x : Real) => poly((t : List[Real]), x) == real_of_num(0)")
  let t502 = @term_syntax.parse_term("(N : Num)")
  let t503 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(i : (Num) -> Real)"), t502, t501]),
      finite_lemma(),
    ),
  )
  let t498 = @term_syntax.parse_term("(i : (Num) -> Real)")
  let t500 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))((x499 : @kernel.Thm) => {
      @tactics.x_choose_tac(t498, x499)
    }),
  )
  let t495 = @simp.rewrite_rule(@list.List([lemma]))
  let t497 = @tactics.disch_then(fn(
    x496 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x492 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s493 = @tactics.mp_tac(x492)
      fn(
        x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s493(x494)
      }
    })(t495(x496))
  })
  let t491 = @tactics.conv_tac(@class.contrapos_conv)
  let t488 = @tactics.pop_assum(fn(
    x485 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s486 = @tactics.mp_tac(x485)
    fn(
      x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s486(x487)
    }
  })
  let t482 = @term_syntax.parse_term("real_of_num(0)")
  let t489 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x484 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x479 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s480 = @tactics.mp_tac(x479)
          fn(
            x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s480(x481)
          }
        })(((x483 : @kernel.Thm) => @bool.spec(t482, x483))(x484))
      }),
      t488,
    ),
    @calc_rat.real_arith_tac,
  )
  let t490 = @list.List([
    @simp.rewrite_tac(@list.List([@realax.real_add_lid()])),
    t489,
  ])
  let t478 = @simp.asm_rewrite_tac(@list.List([]))
  let t477 = @class.asm_cases_tac(@term_syntax.parse_term("(h : Real) == real_of_num(0)"))
  let t476 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly()]))
  let t522 = @tactics.thenl(
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
                              t476,
                            ),
                            t477,
                          ),
                          t478,
                        ),
                        t490,
                      ),
                      t491,
                    ),
                    t497,
                  ),
                  t500,
                ),
                t503,
              ),
              t504,
            ),
            t507,
          ),
          t514,
        ),
        t515,
      ),
      @tactics.conj_tac,
    ),
    t521,
  )
  poly_zero_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ h : Real, ∀ t : List[Real], poly(CONS(h, t)) == poly(NIL) → h == real_of_num(0) && poly(t) == poly(NIL)"),
      t522,
    ),
  )
}

///|
let poly_zero_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ZERO_LEMMA",
)

///|
/// `POLY_ZERO_LEMMA`
pub fn poly_zero_lemma() -> @kernel.Thm {
  poly_zero_lemma_c.get()
}

///|
/// POLY_ZERO
fn step_68() -> Unit raise {
  let t533 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), poly()]))
  let t534 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.pop_assum(fn(
          x532 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s530 = @tactics.subst1_tac(x529)
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
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          })(@equal.sym(x532))
        }),
        @tactics.strip_tac,
      ),
      t533,
    ),
    @calc_rat.real_arith_tac,
  )
  let t528 = @simp.asm_rewrite_tac(@list.List([]))
  let t526 = @drule.match_mp(poly_zero_lemma())
  let t535 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x527 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x523 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s524 = @tactics.mp_tac(x523)
          fn(
            x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s524(x525)
          }
        })(t526(x527))
      }),
      t528,
    ),
    t534,
  ])
  let t536 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @lists.list_induct_tac,
        @simp.asm_rewrite_tac(@list.List([@lists.all()])),
      ),
      @tactics.eq_tac,
    ),
    t535,
  )
  poly_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], (poly(p) == poly(NIL)) == ALL((c : Real) => c == real_of_num(0), p)"),
      t536,
    ),
  )
}

///|
let poly_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ZERO")

///|
/// `POLY_ZERO`
pub fn poly_zero() -> @kernel.Thm {
  poly_zero_c.get()
}

///|
/// POLY_DIFF_AUX_ISZERO
fn step_69() -> Unit raise {
  let t537 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([
        @lists.all(),
        poly_diff_aux(),
        @realarith.real_entire(),
        @realax.real_of_num_eq(),
        @nums.not_suc(),
      ]),
    ),
  )
  poly_diff_aux_iszero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ n : Num, ALL((c : Real) => c == real_of_num(0), poly_diff_aux(SUC(n), p)) == ALL((c : Real) => c == real_of_num(0), p)"),
      t537,
    ),
  )
}

///|
let poly_diff_aux_iszero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_ISZERO",
)

///|
/// `POLY_DIFF_AUX_ISZERO`
pub fn poly_diff_aux_iszero() -> @kernel.Thm {
  poly_diff_aux_iszero_c.get()
}

///|
/// POLY_DIFF_ISZERO
fn step_70() -> Unit raise {
  let t542 = @simp.asm_rewrite_tac(@list.List([poly(), @class.fun_eq_thm()]))
  let t541 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real)"))
  let t540 = @simp.rewrite_tac(@list.List([@equal.gsym(poly_zero())]))
  let t543 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              @calc_num.num_conv(@term_syntax.parse_term("1")),
              poly_diff_aux_iszero(),
            ]),
          ),
          t540,
        ),
        @tactics.disch_tac,
      ),
      t541,
    ),
    t542,
  )
  let t539 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), poly()]))
  let t544 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")), t539),
      @calc_rat.real_arith_tac,
    ),
    t543,
  ])
  let t538 = @simp.asm_rewrite_tac(
    @list.List([poly_diff_clauses(), @lists.all()]),
  )
  let t545 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([poly_zero()])),
        @lists.list_induct_tac,
      ),
      t538,
    ),
    t544,
  )
  poly_diff_iszero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], poly(poly_diff(p)) == poly(NIL) → (∃ h : Real, poly(p) == poly([h]))"),
      t545,
    ),
  )
}

///|
let poly_diff_iszero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_ISZERO",
)

///|
/// `POLY_DIFF_ISZERO`
pub fn poly_diff_iszero() -> @kernel.Thm {
  poly_diff_iszero_c.get()
}

///|
/// POLY_DIFF_ZERO
fn step_71() -> Unit raise {
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t564 = @tactics.first_assum(@tactics.match_mp_tac)
  let t563 = @simp.asm_rewrite_tac(@list.List([@analysis.real_mul_rzero()]))
  let t562 = @tactics.repeat_tac(@tactics.strip_tac)
  let t561 = @simp.rewrite_tac(@list.List([@lists.all(), poly_diff_aux()]))
  let t559 = @term_syntax.parse_term("(t : List[Real])")
  let t560 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t559)
  let t558 = @tactics.pop_assum_list(fn(
    x557 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t555 = @term_syntax.parse_term("(n : Num)")
  let t556 = @tactics.spec_tac(@term_syntax.parse_term("1"), t555)
  let t554 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x548 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s549 = @tactics.assume_tac(x548)
        fn(
          x550 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s549(x550)
        }
      },
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
    ),
  )
  let t547 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.tl()]))
  let t546 = @simp.rewrite_tac(@list.List([poly_diff(), @lists.not_cons_nil()]))
  let t566 = @tactics.then_tac(
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
                            @simp.rewrite_tac(@list.List([poly_zero()])),
                            @lists.list_induct_tac,
                          ),
                          t546,
                        ),
                        t547,
                      ),
                      t554,
                    ),
                    t556,
                  ),
                  t558,
                ),
                t560,
              ),
              @lists.list_induct_tac,
            ),
            t561,
          ),
          t562,
        ),
        t563,
      ),
      t564,
    ),
    t565,
  )
  poly_diff_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], poly(p) == poly(NIL) → poly(poly_diff(p)) == poly(NIL)"),
      t566,
    ),
  )
}

///|
let poly_diff_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_DIFF_ZERO")

///|
/// `POLY_DIFF_ZERO`
pub fn poly_diff_zero() -> @kernel.Thm {
  poly_diff_zero_c.get()
}

///|
/// POLY_DIFF_WELLDEF
fn step_72() -> Unit raise {
  let t570 = @simp.rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + -(b : Real) == real_of_num(0)) == (a == b)")),
    ]),
  )
  let t569 = @simp.asm_rewrite_tac(
    @list.List([
      poly_neg_v1(),
      poly(),
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + -a == real_of_num(0)")),
    ]),
  )
  let t568 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_diff_add(),
      poly_diff_neg(),
      poly_add_v1(),
    ]),
  )
  let t567 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("poly_add((p : List[Real]), poly_neg((q : List[Real])))"), poly_diff_zero()),
  )
  let t571 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t567),
        t568,
      ),
      t569,
    ),
    t570,
  )
  poly_diff_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], poly(p) == poly(q) → poly(poly_diff(p)) == poly(poly_diff(q))"),
      t571,
    ),
  )
}

///|
let poly_diff_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_WELLDEF",
)

///|
/// `POLY_DIFF_WELLDEF`
pub fn poly_diff_welldef() -> @kernel.Thm {
  poly_diff_welldef_c.get()
}

///|
/// divides
fn step_73() -> Unit raise {
  divides_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(poly_divides : (List[Real], List[Real]) -> Bool)((p1 : List[Real]), (p2 : List[Real])) == (∃ q : List[Real], poly(p2) == poly(poly_mul(p1, q)))"),
    ),
  )
}

///|
let divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divides")

///|
/// `divides`
pub fn divides() -> @kernel.Thm {
  divides_c.get()
}

///|
/// POLY_PRIMES
fn step_74() -> Unit raise {
  let t605 = @simp.rewrite_tac(@list.List([poly_mul_v1()]))
  let t603 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul((p : List[Real]), (s : List[Real]))"))
  let t604 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("poly_mul((s : List[Real]), (q : List[Real]))")),
    t603,
  ])
  let t602 = @simp.asm_rewrite_tac(@list.List([]))
  let t600 = @term_syntax.parse_term("(s : List[Real])")
  let t606 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.disj_cases_then((x601 : @kernel.Thm) => {
                @tactics.x_choose_tac(t600, x601)
              }),
            ),
            t602,
          ),
          t604,
        ),
        @tactics.gen_tac,
      ),
      t605,
    ),
    @calc_rat.real_arith_tac,
  )
  let t596 = @simp.rewrite_tac(@list.List([poly_mul_v1(), poly()]))
  let t597 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(s : List[Real])")),
        @tactics.gen_tac,
      ),
      t596,
    ),
    @calc_rat.real_arith_tac,
  )
  let t595 = @simp.rewrite_tac(@list.List([poly(), @analysis.real_mul_rzero()]))
  let t598 = @list.List([
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])")),
      t595,
    ),
    t597,
  ])
  let t594 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
        x588 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s589 = @tactics.subst_all_tac(x588)
        fn(
          x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s589(x590)
        }
      },
      @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(fn(
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
        let s592 = @tactics.subst_all_tac(x591)
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
      }),
    ),
  )
  let t587 = @simp.rewrite_tac(@list.List([@analysis.real_neg_neg()]))
  let t585 = @simp.rewrite_rule(@list.List([poly_linear_divides()]))
  let t599 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.pop_assum(fn(
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
          (fn(
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
            let s583 = @tactics.mp_tac(x582)
            fn(
              x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s583(x584)
            }
          })(t585(x586))
        }),
        t587,
      ),
      t594,
    ),
    t598,
  )
  let t581 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t580 = @simp.rewrite_tac(
    @list.List([
      @realarith.real_entire(),
      @equal.gsym(@realax.real_sub()),
      @analysis.real_sub_refl(),
      @analysis.real_mul_lzero(),
    ]),
  )
  let t577 = @term_syntax.parse_term("-(a : Real)")
  let t607 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.x_choose_then(@term_syntax.parse_term("(r : List[Real])"))(fn(
                x579 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x574 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s575 = @tactics.mp_tac(x574)
                  fn(
                    x576 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s575(x576)
                  }
                })(((x578 : @kernel.Thm) => @bool.spec(t577, x578))(x579))
              }),
            ),
            t580,
          ),
          t581,
        ),
        @list.List([@tactics.disj1_tac, @tactics.disj2_tac]),
      ),
      t599,
    ),
    t606,
  ])
  let t573 = @simp.rewrite_tac(
    @list.List([
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
      @analysis.real_mul_rid(),
    ]),
  )
  let t572 = @simp.rewrite_tac(
    @list.List([divides(), poly_mul_v1(), @class.fun_eq_thm(), poly()]),
  )
  let t608 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t572),
        t573,
      ),
      @tactics.eq_tac,
    ),
    t607,
  )
  poly_primes_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ p : List[Real], ∀ q : List[Real], poly_divides([a, real_of_num(1)], poly_mul(p, q)) == (poly_divides([a, real_of_num(1)], p) || poly_divides([a, real_of_num(1)], q))"),
      t608,
    ),
  )
}

///|
let poly_primes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_PRIMES")

///|
/// `POLY_PRIMES`
pub fn poly_primes() -> @kernel.Thm {
  poly_primes_c.get()
}

///|
/// POLY_DIVIDES_REFL
fn step_75() -> Unit raise {
  let t610 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), poly()]),
  )
  let t609 = @tactics.exists_tac(@term_syntax.parse_term("[real_of_num(1)]"))
  let t611 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([divides()])),
        ),
        t609,
      ),
      t610,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_divides_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly_divides(p, p)"), t611),
  )
}

///|
let poly_divides_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_REFL",
)

///|
/// `POLY_DIVIDES_REFL`
pub fn poly_divides_refl() -> @kernel.Thm {
  poly_divides_refl_c.get()
}

///|
/// POLY_DIVIDES_TRANS
fn step_76() -> Unit raise {
  let t626 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), @realax.real_mul_assoc()]),
  )
  let t625 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul((t : List[Real]), (s : List[Real]))"))
  let t624 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : List[Real])"))(fn(
      x621 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s622 = @tactics.assume_tac(x621)
      fn(
        x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s622(x623)
      }
    }),
  )
  let t620 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(fn(
      x617 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s618 = @tactics.assume_tac(x617)
      fn(
        x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s618(x619)
      }
    }),
  )
  let t616 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x613 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s614 = @tactics.mp_tac(x613)
      fn(
        x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s614(x615)
      }
    }),
  )
  let t612 = @simp.rewrite_tac(@list.List([divides()]))
  let t627 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t612),
            t616,
          ),
          t620,
        ),
        t624,
      ),
      t625,
    ),
    t626,
  )
  poly_divides_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly_divides(p, q) && poly_divides(q, r) → poly_divides(p, r)"),
      t627,
    ),
  )
}

///|
let poly_divides_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_TRANS",
)

///|
/// `POLY_DIVIDES_TRANS`
pub fn poly_divides_trans() -> @kernel.Thm {
  poly_divides_trans_c.get()
}

///|
/// POLY_DIVIDES_EXP
fn step_77() -> Unit raise {
  let t641 = @simp.rewrite_tac(
    @list.List([poly_exp(), @class.fun_eq_thm(), poly_mul_v1()]),
  )
  let t640 = @tactics.exists_tac(@term_syntax.parse_term("(p : List[Real])"))
  let t639 = @simp.rewrite_tac(@list.List([divides()]))
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t637 = @tactics.exists_tac(@term_syntax.parse_term("poly_exp((p : List[Real]), (m : Num) + (d : Num))"))
  let t636 = @tactics.match_mp_tac(poly_divides_trans())
  let t635 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), poly_divides_refl()]),
  )
  let t633 = @term_syntax.parse_term("(d : Num)")
  let t634 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t633)
  let t632 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
      let s630 = @tactics.subst1_tac(x629)
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
    }),
  )
  let t628 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t642 = @tactics.then_tac(
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
                          t628,
                        ),
                        t632,
                      ),
                      t634,
                    ),
                    @nums.induct_tac,
                  ),
                  t635,
                ),
                t636,
              ),
              t637,
            ),
            t638,
          ),
          t639,
        ),
        t640,
      ),
      t641,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_divides_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ m : Num, ∀ n : Num, m <= n → poly_divides(poly_exp(p, m), poly_exp(p, n))"),
      t642,
    ),
  )
}

///|
let poly_divides_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_EXP",
)

///|
/// `POLY_DIVIDES_EXP`
pub fn poly_divides_exp() -> @kernel.Thm {
  poly_divides_exp_c.get()
}

///|
/// POLY_EXP_DIVIDES
fn step_78() -> Unit raise {
  let t643 = @meson.meson_tac(
    @list.List([poly_divides_trans(), poly_divides_exp()]),
  )
  poly_exp_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ m : Num, ∀ n : Num, poly_divides(poly_exp(p, n), q) && m <= n → poly_divides(poly_exp(p, m), q)"),
      t643,
    ),
  )
}

///|
let poly_exp_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_EXP_DIVIDES",
)

///|
/// `POLY_EXP_DIVIDES`
pub fn poly_exp_divides() -> @kernel.Thm {
  poly_exp_divides_c.get()
}

///|
/// POLY_DIVIDES_ADD
fn step_79() -> Unit raise {
  let t658 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_add_v1(), poly_mul_v1()]),
  )
  let t657 = @tactics.exists_tac(@term_syntax.parse_term("poly_add((t : List[Real]), (s : List[Real]))"))
  let t656 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : List[Real])"))(fn(
      x653 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s654 = @tactics.assume_tac(x653)
      fn(
        x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s654(x655)
      }
    }),
  )
  let t652 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(fn(
      x649 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s650 = @tactics.assume_tac(x649)
      fn(
        x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s650(x651)
      }
    }),
  )
  let t648 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
      let s646 = @tactics.mp_tac(x645)
      fn(
        x647 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s646(x647)
      }
    }),
  )
  let t644 = @simp.rewrite_tac(@list.List([divides()]))
  let t659 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t644),
              t648,
            ),
            t652,
          ),
          t656,
        ),
        t657,
      ),
      t658,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_divides_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly_divides(p, q) && poly_divides(p, r) → poly_divides(p, poly_add(q, r))"),
      t659,
    ),
  )
}

///|
let poly_divides_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_ADD",
)

///|
/// `POLY_DIVIDES_ADD`
pub fn poly_divides_add() -> @kernel.Thm {
  poly_divides_add_c.get()
}

///|
/// POLY_DIVIDES_SUB
fn step_80() -> Unit raise {
  let t684 = @simp.asm_rewrite_tac(@list.List([]))
  let t683 = @simp.rewrite_tac(
    @list.List([@realax.real_add_ldistrib(), @calc_int.real_mul_rneg()]),
  )
  let t682 = @tactics.disch_then(fn(
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
    @tactics.strip_assume_tac(@equal.gsym(x681))
  })
  let t680 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_add_v1(),
      poly_mul_v1(),
      poly_neg_v1(),
    ]),
  )
  let t679 = @tactics.pop_assum_list(fn(
    x678 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x674 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s675 = @tactics.mp_tac(x674)
      fn(
        x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s675(x676)
      }
    })(
      ((x677 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x677))(
        x678,
      ),
    )
  })
  let t673 = @tactics.exists_tac(@term_syntax.parse_term("poly_add((s : List[Real]), poly_neg((t : List[Real])))"))
  let t672 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : List[Real])"))(fn(
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
      let s670 = @tactics.assume_tac(x669)
      fn(
        x671 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s670(x671)
      }
    }),
  )
  let t668 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(fn(
      x665 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s666 = @tactics.assume_tac(x665)
      fn(
        x667 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s666(x667)
      }
    }),
  )
  let t664 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x661 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s662 = @tactics.mp_tac(x661)
      fn(
        x663 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s662(x663)
      }
    }),
  )
  let t660 = @simp.rewrite_tac(@list.List([divides()]))
  let t685 = @tactics.then_tac(
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
                        t660,
                      ),
                      t664,
                    ),
                    t668,
                  ),
                  t672,
                ),
                t673,
              ),
              t679,
            ),
            t680,
          ),
          t682,
        ),
        t683,
      ),
      t684,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_divides_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly_divides(p, q) && poly_divides(p, poly_add(q, r)) → poly_divides(p, r)"),
      t685,
    ),
  )
}

///|
let poly_divides_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_SUB",
)

///|
/// `POLY_DIVIDES_SUB`
pub fn poly_divides_sub() -> @kernel.Thm {
  poly_divides_sub_c.get()
}

///|
/// POLY_DIVIDES_SUB2
fn step_81() -> Unit raise {
  let t699 = @term_syntax.parse_term("(x : Real)")
  let t702 = @tactics.pop_assum(fn(
    x701 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
    })(((x700 : @kernel.Thm) => @bool.spec(t699, x700))(x701))
  })
  let t695 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t694 = @tactics.exists_tac(@term_syntax.parse_term("(s : List[Real])"))
  let t691 = @term_syntax.parse_term("(s : List[Real])")
  let t693 = @tactics.disch_then((x692 : @kernel.Thm) => {
    @tactics.x_choose_tac(t691, x692)
  })
  let t690 = @simp.rewrite_tac(
    @list.List([divides(), poly_add_v1(), @class.fun_eq_thm(), poly_mul_v1()]),
  )
  let t689 = @tactics.undisch_tac(@term_syntax.parse_term("poly_divides((p : List[Real]), poly_add((q : List[Real]), (r : List[Real])))"))
  let t688 = @simp.asm_rewrite_tac(@list.List([]))
  let t687 = @tactics.exists_tac(@term_syntax.parse_term("(r : List[Real])"))
  let t686 = @tactics.match_mp_tac(poly_divides_sub())
  let t703 = @tactics.then_tac(
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
                      t686,
                    ),
                    t687,
                  ),
                  t688,
                ),
                t689,
              ),
              t690,
            ),
            t693,
          ),
          t694,
        ),
        t695,
      ),
      t702,
    ),
    @calc_rat.real_arith_tac,
  )
  poly_divides_sub2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ r : List[Real], poly_divides(p, r) && poly_divides(p, poly_add(q, r)) → poly_divides(p, q)"),
      t703,
    ),
  )
}

///|
let poly_divides_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_SUB2",
)

///|
/// `POLY_DIVIDES_SUB2`
pub fn poly_divides_sub2() -> @kernel.Thm {
  poly_divides_sub2_c.get()
}

///|
/// POLY_DIVIDES_ZERO
fn step_82() -> Unit raise {
  let t706 = @simp.asm_rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_mul_v1(),
      poly(),
      @analysis.real_mul_rzero(),
    ]),
  )
  let t705 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])"))
  let t704 = @simp.rewrite_tac(@list.List([divides()]))
  let t707 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.disch_tac,
        ),
        t704,
      ),
      t705,
    ),
    t706,
  )
  poly_divides_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], poly(p) == poly(NIL) → poly_divides(q, p)"),
      t707,
    ),
  )
}

///|
let poly_divides_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIVIDES_ZERO",
)

///|
/// `POLY_DIVIDES_ZERO`
pub fn poly_divides_zero() -> @kernel.Thm {
  poly_divides_zero_c.get()
}

///|
/// POLY_ORDER_EXISTS
fn step_83() -> Unit raise {
  let t791 = @simp.rewrite_tac(@list.List([]))
  let t792 = @tactics.then_tac(
    @tactics.disch_then(
      @tactics.ante_res_then(fn(
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
        let s789 = @tactics.mp_tac(x788)
        fn(
          x790 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s789(x790)
        }
      }),
    ),
    t791,
  )
  let t787 = @simp.rewrite_tac(@list.List([poly()]))
  let t783 = @term_syntax.parse_term("(a : Real) + real_of_num(1)")
  let t786 = @tactics.disch_then(fn(
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
    (fn(
      x780 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s781 = @tactics.mp_tac(x780)
      fn(
        x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s781(x782)
      }
    })(((x784 : @kernel.Thm) => @bool.spec(t783, x784))(x785))
  })
  let t793 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@class.fun_eq_thm()])),
          t786,
        ),
        t787,
      ),
      @calc_rat.real_arith_tac,
    ),
    t792,
  ])
  let t779 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t778 = @simp.rewrite_tac(
    @list.List([@equal.gsym(poly_mul_assoc()), poly_mul_lcancel()]),
  )
  let t777 = @simp.once_rewrite_tac(@list.List([poly_exp()]))
  let t776 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t794 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t776),
            t777,
          ),
          t778,
        ),
        t779,
      ),
      @tactics.conj_tac,
    ),
    t793,
  )
  let t775 = @simp.rewrite_tac(@list.List([poly(), poly_exp(), poly_mul_v1()]))
  let t774 = @tactics.disch_then(fn(
    x771 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s772 = @tactics.subst1_tac(x771)
    fn(
      x773 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s772(x773)
    }
  })
  let t770 = @simp.rewrite_tac(@list.List([]))
  let t769 = @tactics.conv_tac(@class.contrapos_conv)
  let t795 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.undisch_tac(@term_syntax.parse_term("!(poly((s : List[Real]), (a : Real)) == real_of_num(0))")),
              t769,
            ),
            t770,
          ),
          t774,
        ),
        t775,
      ),
      @calc_rat.real_arith_tac,
    ),
    t794,
  ])
  let t768 = @simp.asm_rewrite_tac(@list.List([]))
  let t766 = @term_syntax.parse_term("(n : Num)")
  let t767 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t766)
  let t796 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(
            @tactics.x_choose_then(@term_syntax.parse_term("(r : List[Real])"))(fn(
              x763 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s764 = @tactics.mp_tac(x763)
              fn(
                x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s764(x765)
              }
            }),
          ),
          t767,
        ),
        @nums.induct_tac,
      ),
      t768,
    ),
    t795,
  )
  let t762 = @simp.asm_rewrite_tac(
    @list.List([poly_exp(), @class.fun_eq_thm(), poly_mul_v1(), poly()]),
  )
  let t760 = @term_syntax.parse_term("(n : Num)")
  let t761 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t760)
  let t797 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(@term_syntax.parse_term("(s : List[Real])")),
            t761,
          ),
          @nums.induct_tac,
        ),
        t762,
      ),
      @calc_rat.real_arith_tac,
    ),
    t796,
  ])
  let t759 = @simp.rewrite_tac(@list.List([divides()]))
  let t758 = @simp.asm_rewrite_tac(@list.List([]))
  let t757 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t755 = @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(
    @tactics.strip_assume_tac,
  )
  let t756 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(t755),
  )
  let t754 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
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
      let s752 = @tactics.mp_tac(x751)
      fn(
        x753 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s752(x753)
      }
    }),
  )
  let t798 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_tac,
                  @tactics.repeat_tac(@tactics.gen_tac),
                ),
                t754,
              ),
              t756,
            ),
            t757,
          ),
          t758,
        ),
        t759,
      ),
      @tactics.conj_tac,
    ),
    t797,
  )
  let t748 = @simp.asm_rewrite_tac(@list.List([]))
  let t747 = @tactics.exists_tac(@term_syntax.parse_term("(p : List[Real])"))
  let t749 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.strip_tac,
        @tactics.exists_tac(@term_syntax.parse_term("0")),
      ),
      t747,
    ),
    t748,
  )
  let t746 = @simp.asm_rewrite_tac(@list.List([]))
  let t745 = @tactics.exists_tac(@term_syntax.parse_term("(s : List[Real])"))
  let t744 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t742 = @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(
    @tactics.strip_assume_tac,
  )
  let t743 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(t742),
  )
  let t741 = @simp.asm_rewrite_tac(@list.List([]))
  let t740 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        poly_length_mul(),
        poly_entire(),
        @class.de_morgan_thm(),
        @nums.suc_inj(),
      ]),
    ),
  )
  let t736 = @term_syntax.parse_term("(q : List[Real])")
  let t739 = @tactics.disch_then(fn(
    x738 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x733 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s734 = @tactics.mp_tac(x733)
      fn(
        x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s734(x735)
      }
    })(((x737 : @kernel.Thm) => @bool.spec(t736, x737))(x738))
  })
  let t732 = @tactics.undisch_tac(
    @term_syntax.parse_term("∀ p : List[Real], LENGTH(p) == (d : Num) && !(poly(p) == poly(NIL)) → (∃ n : Num, ∃ q : List[Real], p == (mulexp : (Num, List[Real], List[Real]) -> List[Real])(n, [-(a : Real), real_of_num(1)], q) && !(poly(q, a) == real_of_num(0)))"),
  )
  let t731 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Real])"))(fn(
      x728 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s729 = @tactics.subst_all_tac(x728)
      fn(
        x730 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s729(x730)
      }
    }),
  )
  let t727 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t726 = @tactics.disch_then(
    @tactics.disj_cases_then(fn(
      x723 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s724 = @tactics.mp_tac(x723)
      fn(
        x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s724(x725)
      }
    }),
  )
  let t720 = @simp.rewrite_rule(@list.List([poly_linear_divides()]))
  let t722 = @tactics.disch_then(fn(
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
    (fn(
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
      let s718 = @tactics.mp_tac(x717)
      fn(
        x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s718(x719)
      }
    })(t720(x721))
  })
  let t750 = @list.List([
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
                              @tactics.strip_tac,
                              @tactics.undisch_tac(
                                @term_syntax.parse_term("poly((p : List[Real]), (a : Real)) == real_of_num(0)"),
                              ),
                            ),
                            t722,
                          ),
                          t726,
                        ),
                        t727,
                      ),
                      t731,
                    ),
                    t732,
                  ),
                  t739,
                ),
                t740,
              ),
              t741,
            ),
            t743,
          ),
          t744,
        ),
        t745,
      ),
      t746,
    ),
    t749,
  ])
  let t716 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Real]), (a : Real)) == real_of_num(0)"))
  let t715 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : List[Real])"))
  let t714 = @meson.meson_tac(@list.List([]))
  let t799 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @nums.induct_tac,
            @list.List([
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@lists.length_eq_nil()])),
                t714,
              ),
              @tactics.all_tac,
            ]),
          ),
          t715,
        ),
        t716,
      ),
      t750,
    ),
    t798,
  ])
  let t713 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ d : Num, ∀ p : List[Real], LENGTH(p) == d && !(poly(p) == poly(NIL)) → (∃ n : Num, ∃ q : List[Real], p == (mulexp : (Num, List[Real], List[Real]) -> List[Real])(n, [-(a : Real), real_of_num(1)], q) && !(poly(q, a) == real_of_num(0)))"),
    fn(
      x710 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s711 = @tactics.mp_tac(x710)
      fn(
        x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s711(x712)
      }
    },
  )
  let t708 = @term_syntax.parse_term("(∀ p : List[Real], ∀ q : List[Real], (mulexp : (Num, List[Real], List[Real]) -> List[Real])(0, p, q) == q) && (∀ p : List[Real], ∀ q : List[Real], ∀ n : Num, mulexp(SUC(n), p, q) == poly_mul(p, mulexp(n, p, q)))")
  let t709 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t800 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.strip_assume_tac(t709(t708))),
      t713,
    ),
    t799,
  )
  poly_order_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ d : Num, ∀ p : List[Real], LENGTH(p) == d && !(poly(p) == poly(NIL)) → (∃ n : Num, poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))"),
      t800,
    ),
  )
}

///|
let poly_order_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ORDER_EXISTS",
)

///|
/// `POLY_ORDER_EXISTS`
pub fn poly_order_exists() -> @kernel.Thm {
  poly_order_exists_c.get()
}

///|
/// POLY_ORDER
fn step_84() -> Unit raise {
  let t801 = @meson.meson_tac(
    @list.List([
      poly_order_exists(),
      poly_exp_divides(),
      @arith.le_suc_lt(),
      @arith.lt_cases(),
    ]),
  )
  poly_order_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, !(poly(p) == poly(NIL)) → existsunique((n : Num) => poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))"),
      t801,
    ),
  )
}

///|
let poly_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ORDER")

///|
/// `POLY_ORDER`
pub fn poly_order() -> @kernel.Thm {
  poly_order_c.get()
}

///|
/// order
fn step_85() -> Unit raise {
  order_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(order : (Real, List[Real]) -> Num)((a : Real), (p : List[Real])) == select((n : Num) => poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p))"),
    ),
  )
}

///|
let order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("order")

///|
/// `order`
pub fn order() -> @kernel.Thm {
  order_c.get()
}

///|
/// ORDER
fn step_86() -> Unit raise {
  let t830 = @meson.asm_meson_tac(@list.List([poly_order()]))
  let t827 = @tactics.conv_tac(@class.select_conv)
  let t828 = @tactics.then_tac(@simp.once_asm_rewrite_tac(@list.List([])), t827)
  let t824 = @simp.rewrite_tac(@list.List([]))
  let t823 = @tactics.match_mp_tac(@class.select_unique())
  let t822 = @tactics.conv_tac(@equal.sym_conv)
  let t825 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t822),
      t823,
    ),
    t824,
  )
  let t821 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_mul_v1(),
      poly(),
      @analysis.real_mul_rzero(),
    ]),
  )
  let t820 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])"))
  let t819 = @tactics.disch_then(fn(
    x816 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s817 = @tactics.subst1_tac(x816)
    fn(
      x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s817(x818)
    }
  })
  let t815 = @simp.rewrite_tac(@list.List([divides()]))
  let t814 = @tactics.conv_tac(@class.contrapos_conv)
  let t826 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.first_assum(fn(
                x813 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x811 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                    x806 : @kernel.Term,
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
                    let s807 = @tactics.undisch_tac(x806)
                    fn(
                      x808 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s807(x808)
                    }
                  })(
                    ((x810 : @kernel.Term) => {
                      @lib.check(
                        fn(x809 : @kernel.Term) -> Bool raise {
                          @basics.is_neg(x809)
                        },
                        x810,
                      )
                    })(x811),
                  )
                })(
                  (fn(x812 : @kernel.Thm) -> @kernel.Term raise {
                    @kernel.concl(x812)
                  })(x813),
                )
              }),
              t814,
            ),
            t815,
          ),
          t819,
        ),
        t820,
      ),
      t821,
    ),
    t825,
  ])
  let t829 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"), fn(
        x803 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s804 = @tactics.assume_tac(x803)
        fn(
          x805 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s804(x805)
        }
      }),
      t826,
    ),
    t828,
  ])
  let t802 = @simp.rewrite_tac(@list.List([order()]))
  let t831 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t802),
          @tactics.eq_tac,
        ),
        @tactics.strip_tac,
      ),
      t829,
    ),
    t830,
  )
  order_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ n : Num, (poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p)) == (n == order(a, p) && !(poly(p) == poly(NIL)))"),
      t831,
    ),
  )
}

///|
let order_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER")

///|
/// `ORDER`
pub fn order_v1() -> @kernel.Thm {
  order_v1_c.get()
}

///|
/// ORDER_THM
fn step_87() -> Unit raise {
  let t832 = @meson.meson_tac(@list.List([order_v1()]))
  order_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, !(poly(p) == poly(NIL)) → poly_divides(poly_exp([-a, real_of_num(1)], order(a, p)), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(order(a, p))), p)"),
      t832,
    ),
  )
}

///|
let order_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_THM")

///|
/// `ORDER_THM`
pub fn order_thm() -> @kernel.Thm {
  order_thm_c.get()
}

///|
/// ORDER_UNIQUE
fn step_88() -> Unit raise {
  let t833 = @meson.meson_tac(@list.List([order_v1()]))
  order_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ n : Num, !(poly(p) == poly(NIL)) && poly_divides(poly_exp([-a, real_of_num(1)], n), p) && !poly_divides(poly_exp([-a, real_of_num(1)], SUC(n)), p) → n == order(a, p)"),
      t833,
    ),
  )
}

///|
let order_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_UNIQUE")

///|
/// `ORDER_UNIQUE`
pub fn order_unique() -> @kernel.Thm {
  order_unique_c.get()
}

///|
/// ORDER_POLY
fn step_89() -> Unit raise {
  let t834 = @simp.asm_rewrite_tac(
    @list.List([order(), divides(), @class.fun_eq_thm(), poly_mul_v1()]),
  )
  let t835 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t834)
  order_poly_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ a : Real, poly(p) == poly(q) → order(a, p) == order(a, q)"),
      t835,
    ),
  )
}

///|
let order_poly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_POLY")

///|
/// `ORDER_POLY`
pub fn order_poly() -> @kernel.Thm {
  order_poly_c.get()
}

///|
/// ORDER_ROOT
fn step_90() -> Unit raise {
  let t885 = @simp.rewrite_tac(@list.List([poly_mul_v1(), poly()]))
  let t884 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(fn(
      x881 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s882 = @tactics.subst1_tac(x881)
      fn(
        x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s882(x883)
      }
    }),
  )
  let t880 = @simp.rewrite_tac(@list.List([divides()]))
  let t879 = @tactics.disch_then(fn(
    x878 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x875 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s876 = @tactics.mp_tac(x875)
      fn(
        x877 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s876(x877)
      }
    })(@bool.conjunct1(x878))
  })
  let t874 = @simp.asm_rewrite_tac(@list.List([poly_exp(), @nums.not_suc()]))
  let t872 = @term_syntax.parse_term("(n : Num)")
  let t873 = @tactics.spec_tac(@term_syntax.parse_term("order((a : Real), (p : List[Real]))"), t872)
  let t871 = @tactics.undisch_tac(@term_syntax.parse_term("!(order((a : Real), (p : List[Real])) == 0)"))
  let t869 = @drule.match_mp(order_thm())
  let t866 = @term_syntax.parse_term("(a : Real)")
  let t886 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.disch_tac,
                      @tactics.first_assum(fn(
                        x870 : @kernel.Thm,
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
                          x868 : @kernel.Thm,
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
                            x863 : @kernel.Thm,
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
                            let s864 = @tactics.mp_tac(x863)
                            fn(
                              x865 : (
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
                              s864(x865)
                            }
                          })(
                            ((x867 : @kernel.Thm) => @bool.spec(t866, x867))(
                              x868,
                            ),
                          )
                        })(t869(x870))
                      }),
                    ),
                    t871,
                  ),
                  t873,
                ),
                @nums.induct_tac,
              ),
              t874,
            ),
            t879,
          ),
          t880,
        ),
        t884,
      ),
      t885,
    ),
    @calc_rat.real_arith_tac,
  )
  let t862 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), poly()]),
  )
  let t861 = @tactics.exists_tac(@term_syntax.parse_term("(q : List[Real])"))
  let t860 = @simp.rewrite_tac(@list.List([divides()]))
  let t859 = @simp.asm_rewrite_tac(
    @list.List([poly_exp(), @class.de_morgan_thm()]),
  )
  let t856 = @drule.match_mp(order_thm())
  let t853 = @term_syntax.parse_term("(a : Real)")
  let t858 = @tactics.first_assum(fn(
    x857 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x855 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x850 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s851 = @tactics.mp_tac(x850)
        fn(
          x852 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s851(x852)
        }
      })(((x854 : @kernel.Thm) => @bool.spec(t853, x854))(x855))
    })(t856(x857))
  })
  let t849 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Real])"))(fn(
      x846 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s847 = @tactics.subst_all_tac(x846)
      fn(
        x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s847(x848)
      }
    }),
  )
  let t845 = @simp.asm_rewrite_tac(@list.List([]))
  let t844 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t843 = @class.asm_cases_tac(@term_syntax.parse_term("(p : List[Real]) == NIL"))
  let t841 = @simp.rewrite_rule(@list.List([poly_linear_divides()]))
  let t887 = @list.List([
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
                            @tactics.disch_then(fn(
                              x842 : @kernel.Thm,
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
                              (fn(
                                x838 : @kernel.Thm,
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
                                let s839 = @tactics.mp_tac(x838)
                                fn(
                                  x840 : (
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
                                  s839(x840)
                                }
                              })(t841(x842))
                            }),
                            t843,
                          ),
                          t844,
                        ),
                        t845,
                      ),
                      t849,
                    ),
                    @tactics.disch_tac,
                  ),
                  t858,
                ),
                t859,
              ),
              @tactics.disj2_tac,
            ),
            t860,
          ),
          t861,
        ),
        t862,
      ),
      @calc_rat.real_arith_tac,
    ),
    t886,
  ])
  let t837 = @simp.asm_rewrite_tac(@list.List([poly()]))
  let t836 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Real])) == poly(NIL)"))
  let t888 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t836),
        t837,
      ),
      @tactics.eq_tac,
    ),
    t887,
  )
  order_root_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, (poly(p, a) == real_of_num(0)) == (poly(p) == poly(NIL) || !(order(a, p) == 0))"),
      t888,
    ),
  )
}

///|
let order_root_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_ROOT")

///|
/// `ORDER_ROOT`
pub fn order_root() -> @kernel.Thm {
  order_root_c.get()
}

///|
/// ORDER_DIVIDES
fn step_91() -> Unit raise {
  let t893 = @meson.asm_meson_tac(
    @list.List([
      order_thm(),
      poly_exp_divides(),
      @arith.not_le(),
      @arith.le_suc_lt(),
    ]),
  )
  let t892 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly_mul_v1(),
      poly(),
      @analysis.real_mul_rzero(),
    ]),
  )
  let t891 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])"))
  let t894 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([divides()])), t891),
      t892,
    ),
    t893,
  ])
  let t890 = @simp.asm_rewrite_tac(@list.List([]))
  let t889 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Real])) == poly(NIL)"))
  let t895 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t889),
      t890,
    ),
    t894,
  )
  order_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, ∀ n : Num, poly_divides(poly_exp([-a, real_of_num(1)], n), p) == (poly(p) == poly(NIL) || n <= order(a, p))"),
      t895,
    ),
  )
}

///|
let order_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_DIVIDES")

///|
/// `ORDER_DIVIDES`
pub fn order_divides() -> @kernel.Thm {
  order_divides_c.get()
}

///|
/// ORDER_DECOMP
fn step_92() -> Unit raise {
  let t929 = @simp.asm_rewrite_tac(
    @list.List([poly_mul_v1(), @class.fun_eq_thm(), poly_exp()]),
  )
  let t928 = @tactics.exists_tac(@term_syntax.parse_term("(r : List[Real])"))
  let t927 = @simp.rewrite_tac(@list.List([divides()]))
  let t926 = @simp.asm_rewrite_tac(@list.List([]))
  let t925 = @tactics.undisch_tac(
    @term_syntax.parse_term("!poly_divides(poly_exp([-(a : Real), real_of_num(1)], SUC(order(a, (p : List[Real])))), p)"),
  )
  let t922 = @simp.rewrite_rule(@list.List([divides()]))
  let t920 = @term_syntax.parse_term("(r : List[Real])")
  let t924 = @tactics.disch_then(fn(
    x923 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    ((x921 : @kernel.Thm) => @tactics.x_choose_tac(t920, x921))(t922(x923))
  })
  let t919 = @simp.asm_rewrite_tac(@list.List([]))
  let t918 = @tactics.exists_tac(@term_syntax.parse_term("(q : List[Real])"))
  let t915 = @simp.rewrite_rule(@list.List([divides()]))
  let t913 = @term_syntax.parse_term("(q : List[Real])")
  let t917 = @tactics.disch_then(fn(
    x916 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    ((x914 : @kernel.Thm) => @tactics.x_choose_tac(t913, x914))(t915(x916))
  })
  let t908 = @term_syntax.parse_term("(a : Real)")
  let t910 = @tactics.conjuncts_then2(
    fn(
      x902 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s903 = @tactics.mp_tac(x902)
      fn(
        x904 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s903(x904)
      }
    },
    fn(
      x905 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s906 = @tactics.assume_tac(x905)
      fn(
        x907 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s906(x907)
      }
    },
  )
  let t912 = @tactics.disch_then(fn(
    x911 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    t910(((x909 : @kernel.Thm) => @bool.spec(t908, x909))(x911))
  })
  let t899 = @drule.match_mp(order_thm())
  let t901 = @tactics.first_assum(fn(
    x900 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x896 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s897 = @tactics.mp_tac(x896)
      fn(
        x898 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s897(x898)
      }
    })(t899(x900))
  })
  let t930 = @tactics.then_tac(
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
                          t901,
                        ),
                        t912,
                      ),
                      t917,
                    ),
                    t918,
                  ),
                  t919,
                ),
                t924,
              ),
              t925,
            ),
            t926,
          ),
          t927,
        ),
        t928,
      ),
      t929,
    ),
    @calc_rat.real_arith_tac,
  )
  order_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, !(poly(p) == poly(NIL)) → (∃ q : List[Real], poly(p) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), q)) && !poly_divides([-a, real_of_num(1)], q))"),
      t930,
    ),
  )
}

///|
let order_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_DECOMP")

///|
/// `ORDER_DECOMP`
pub fn order_decomp() -> @kernel.Thm {
  order_decomp_c.get()
}

///|
/// ORDER_MUL
fn step_93() -> Unit raise {
  let t996 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t995 = @tactics.first_assum(fn(
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
    (fn(
      x992 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        x987 : @kernel.Term,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s988 = @tactics.undisch_tac(x987)
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
      })(
        ((x991 : @kernel.Term) => {
          @lib.check(
            fn(x990 : @kernel.Term) -> Bool raise { @basics.is_forall(x990) },
            x991,
          )
        })(x992),
      )
    })(
      (fn(x993 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x993) })(
        x994,
      ),
    )
  })
  let t986 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), poly_add_v1()]),
  )
  let t985 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([poly_mul_lcancel(), poly_exp_prime_eq_0()])),
  ])
  let t984 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], order(a, (q : List[Real]))), poly_mul(poly_exp([-a, real_of_num(1)], order(a, (p : List[Real]))), poly_mul((r : List[Real]), (s : List[Real]))))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, q)), poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), poly_mul([-a, real_of_num(1)], (t : List[Real])))))"),
    fn(
      x981 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s982 = @tactics.mp_tac(x981)
      fn(
        x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s982(x983)
      }
    },
  )
  let t980 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([poly_mul_lcancel(), poly_exp_prime_eq_0()])),
  ])
  let t979 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], order(a, (p : List[Real]))), poly_mul((r : List[Real]), (s : List[Real])))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], order(a, p)), poly_mul([-a, real_of_num(1)], (t : List[Real]))))"),
    fn(
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
    },
  )
  let t975 = @tactics.exists_tac(@term_syntax.parse_term("(t : List[Real])"))
  let t974 = @simp.rewrite_tac(@list.List([divides()]))
  let t973 = @list.List([
    @tactics.all_tac,
    @simp.asm_rewrite_tac(@list.List([poly_primes()])),
  ])
  let t972 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_divides([-(a : Real), real_of_num(1)], poly_mul((r : List[Real]), (s : List[Real])))"),
    fn(
      x969 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s970 = @tactics.mp_tac(x969)
      fn(
        x971 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s970(x971)
      }
    },
  )
  let t968 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(t : List[Real])"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t967 = @simp.asm_rewrite_tac(
    @list.List([
      divides(),
      @class.fun_eq_thm(),
      poly_exp_add(),
      poly_mul_v1(),
      poly_exp(),
    ]),
  )
  let t963 = @kernel.assume_rule(@term_syntax.parse_term("!(poly((q : List[Real])) == poly(NIL))"))
  let t964 = @drule.match_mp(order_decomp())(t963)
  let t965 = @bool.spec(@term_syntax.parse_term("(a : Real)"), t964)
  let t966 = @tactics.x_choose_then(@term_syntax.parse_term("(s : List[Real])"))(
    @tactics.strip_assume_tac,
  )(t965)
  let t960 = @kernel.assume_rule(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"))
  let t961 = @drule.match_mp(order_decomp())(t960)
  let t962 = @bool.spec(@term_syntax.parse_term("(a : Real)"), t961)
  let t997 = @tactics.then_tac(
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
                              @tactics.x_choose_then(
                                @term_syntax.parse_term("(r : List[Real])"),
                              )(@tactics.strip_assume_tac)(t962),
                              t966,
                            ),
                            t967,
                          ),
                          t968,
                        ),
                        t972,
                      ),
                      t973,
                    ),
                    t974,
                  ),
                  t975,
                ),
                t979,
              ),
              t980,
            ),
            t984,
          ),
          t985,
        ),
        t986,
      ),
      t995,
    ),
    t996,
  )
  let t959 = @simp.asm_rewrite_tac(@list.List([poly_mul_v1(), poly_exp_add()]))
  let t958 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul((s : List[Real]), (r : List[Real]))"))
  let t957 = @simp.rewrite_tac(@list.List([divides(), @class.fun_eq_thm()]))
  let t954 = @simp.rewrite_rule(@list.List([divides()]))
  let t952 = @term_syntax.parse_term("(s : List[Real])")
  let t956 = @tactics.disch_then(fn(
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
    ((x953 : @kernel.Thm) => @tactics.x_choose_tac(t952, x953))(t954(x955))
  })
  let t949 = @kernel.assume_rule(@term_syntax.parse_term("!(poly((q : List[Real])) == poly(NIL))"))
  let t950 = @drule.match_mp(order_thm())(t949)
  let t951 = @tactics.mp_tac(
    @bool.conjunct1(@bool.spec(@term_syntax.parse_term("(a : Real)"), t950)),
  )
  let t946 = @simp.rewrite_rule(@list.List([divides()]))
  let t944 = @term_syntax.parse_term("(r : List[Real])")
  let t948 = @tactics.disch_then(fn(
    x947 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    ((x945 : @kernel.Thm) => @tactics.x_choose_tac(t944, x945))(t946(x947))
  })
  let t942 = @kernel.assume_rule(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"))
  let t943 = @drule.match_mp(order_thm())(t942)
  let t998 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.mp_tac(
                    @bool.conjunct1(
                      @bool.spec(@term_syntax.parse_term("(a : Real)"), t943),
                    ),
                  ),
                  t948,
                ),
                t951,
              ),
              t956,
            ),
            t957,
          ),
          t958,
        ),
        t959,
      ),
      @calc_rat.real_arith_tac,
    ),
    t997,
  ])
  let t941 = @simp.rewrite_tac(@list.List([@equal.gsym(order_v1())]))
  let t940 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t939 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((a : Real), (p : List[Real])) + order(a, (q : List[Real])) == order(a, poly_mul(p, q)) && !(poly(poly_mul(p, q)) == poly(NIL))"),
    fn(
      x936 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s937 = @tactics.mp_tac(x936)
      fn(
        x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s937(x938)
      }
    },
  )
  let t935 = @simp.rewrite_tac(
    @list.List([poly_entire(), @class.de_morgan_thm()]),
  )
  let t934 = @tactics.disch_then(fn(
    x931 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x931
    let t933 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t933)
  })
  let t999 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t934),
                t935,
              ),
              @tactics.strip_tac,
            ),
            t939,
          ),
          t940,
        ),
        t941,
      ),
      @tactics.conj_tac,
    ),
    t998,
  )
  order_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Real, ∀ p : List[Real], ∀ q : List[Real], !(poly(poly_mul(p, q)) == poly(NIL)) → order(a, poly_mul(p, q)) == order(a, p) + order(a, q)"),
      t999,
    ),
  )
}

///|
let order_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_MUL")

///|
/// `ORDER_MUL`
pub fn order_mul() -> @kernel.Thm {
  order_mul_c.get()
}

///|
/// ORDER_DIFF
fn step_94() -> Unit raise {
  let t1081 = @simp.rewrite_tac(
    @list.List([poly_exp(), poly_mul_v1(), poly_add_v1(), poly_neg_v1()]),
  )
  let t1077 = @term_syntax.parse_term("(x : Real)")
  let t1080 = @tactics.first_assum(fn(
    x1079 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1074 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1075 = @tactics.mp_tac(x1074)
      fn(
        x1076 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1075(x1076)
      }
    })(((x1078 : @kernel.Thm) => @bool.spec(t1077, x1078))(x1079))
  })
  let t1072 = @simp.rewrite_tac(
    @list.List([@realax.real_of_num_eq(), @nums.not_suc()]),
  )
  let t1071 = @tactics.match_mp_tac(@analysis.real_mul_rinv())
  let t1070 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1069 = @simp.gen_rewrite_tac(
    fn(
      x1066 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1067 = @equal.rand_conv(x1066)
      fn(x1068 : @kernel.Term) -> @kernel.Thm raise { s1067(x1068) }
    },
    @list.List([@equal.gsym(@analysis.real_mul_rid())]),
  )
  let t1065 = @simp.gen_rewrite_tac(
    fn(
      x1062 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1063 = @equal.land_conv(x1062)
      fn(x1064 : @kernel.Term) -> @kernel.Thm raise { s1063(x1064) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1061 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_mul_assoc())]),
  )
  let t1060 = @simp.gen_rewrite_tac(
    fn(
      x1057 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1058 = @equal.land_conv(x1057)
      fn(x1059 : @kernel.Term) -> @kernel.Thm raise { s1058(x1059) }
    },
    @list.List([@realax.real_mul_sym()]),
  )
  let t1073 = @list.List([
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
                        t1060,
                      ),
                      t1061,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  @tactics.ap_term_tac,
                ),
                t1065,
              ),
              t1069,
            ),
            t1070,
          ),
          @tactics.ap_term_tac,
        ),
        t1071,
      ),
      t1072,
    ),
    @tactics.all_tac,
  ])
  let t1056 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, real_of_num(SUC((n : Num))) * (a * (b * (inv(real_of_num(SUC(n))) * c))) == a * (b * c)"),
    fn(
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
      let th_2 = x1054
      @simp.rewrite_tac(@list.List([th_2]))
    },
  )
  let t1053 = @simp.rewrite_tac(@list.List([poly_mul_v1(), poly_cmul_v1()]))
  let t1052 = @list.List([
    @simp.rewrite_tac(
      @list.List([
        @real.real_eq_mul_lcancel(),
        @realax.real_of_num_eq(),
        @nums.not_suc(),
      ]),
    ),
    @tactics.all_tac,
  ])
  let t1051 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_of_num(SUC((n : Num))) * a == real_of_num(SUC(n)) * b → a == b"),
    @tactics.match_mp_tac,
  )
  let t1050 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1049 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1048 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([poly_mul_lcancel(), poly_exp_prime_eq_0()])),
  ])
  let t1047 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly(poly_mul(poly_exp([-(a : Real), real_of_num(1)], (n : Num)), (q : List[Real]))) == poly(poly_mul(poly_exp([-a, real_of_num(1)], n), poly_mul([-a, real_of_num(1)], poly_cmul(inv(real_of_num(SUC(n))), poly_add((r : List[Real]), poly_neg(poly_diff(q)))))))"),
    fn(
      x1044 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1045 = @tactics.mp_tac(x1044)
      fn(
        x1046 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1045(x1046)
      }
    },
  )
  let t1043 = @tactics.exists_tac(
    @term_syntax.parse_term("poly_cmul(inv(real_of_num(SUC((n : Num)))), poly_add((r : List[Real]), poly_neg(poly_diff((q : List[Real])))))"),
  )
  let t1042 = @simp.rewrite_tac(@list.List([divides()]))
  let t1041 = @tactics.undisch_tac(
    @term_syntax.parse_term("!poly_divides([-(a : Real), real_of_num(1)], (q : List[Real]))"),
  )
  let t1040 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : List[Real])"))(fn(
      x1037 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1038 = @tactics.assume_tac(x1037)
      fn(
        x1039 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1038(x1039)
      }
    }),
  )
  let t1082 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
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
                                  @simp.rewrite_tac(
                                    @list.List([
                                      @class.fun_eq_thm(),
                                      divides(),
                                      poly_diff_mul(),
                                      poly_diff_exp_prime(),
                                      poly_add_v1(),
                                      poly_mul_v1(),
                                      poly_cmul_v1(),
                                    ]),
                                  ),
                                  t1040,
                                ),
                                t1041,
                              ),
                              t1042,
                            ),
                            t1043,
                          ),
                          t1047,
                        ),
                        t1048,
                      ),
                      t1049,
                    ),
                    t1050,
                  ),
                  t1051,
                ),
                t1052,
              ),
              t1053,
            ),
            t1056,
          ),
          t1073,
        ),
        t1080,
      ),
      t1081,
    ),
    @calc_rat.real_arith_tac,
  )
  let t1036 = @simp.rewrite_tac(@list.List([poly_exp(), poly_mul_v1()]))
  let t1035 = @simp.rewrite_tac(
    @list.List([
      poly_diff_mul(),
      poly_diff_exp_prime(),
      poly_add_v1(),
      poly_mul_v1(),
      poly_cmul_v1(),
    ]),
  )
  let t1034 = @tactics.exists_tac(
    @term_syntax.parse_term("poly_add(poly_mul([-(a : Real), real_of_num(1)], poly_diff((q : List[Real]))), poly_cmul(real_of_num(SUC((n : Num))), q))"),
  )
  let t1083 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([divides(), @class.fun_eq_thm()])),
            t1034,
          ),
          t1035,
        ),
        t1036,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1082,
  ])
  let t1032 = @tactics.first_assum(fn(
    x1030 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x1030
    @simp.rewrite_tac(@list.List([@drule.match_mp(poly_diff_welldef())(th_1)]))
  })
  let t1033 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([divides()])),
      ),
      t1032,
    ),
    @tactics.all_tac,
  ])
  let t1029 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ r : List[Real], poly_divides(r, poly_diff((p : List[Real]))) == poly_divides(r, poly_diff(poly_mul(poly_exp([-(a : Real), real_of_num(1)], SUC((n : Num))), (q : List[Real]))))"),
    fn(
      x1027 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x1027
      @simp.rewrite_tac(@list.List([th]))
    },
  )
  let t1026 = @simp.asm_rewrite_tac(@list.List([]))
  let t1025 = @tactics.match_mp_tac(order_unique())
  let t1024 = @simp.rewrite_tac(@list.List([@nums.not_suc(), @nums.suc_inj()]))
  let t1022 = @term_syntax.parse_term("(n : Num)")
  let t1023 = @tactics.spec_tac(@term_syntax.parse_term("order((a : Real), (p : List[Real]))"), t1022)
  let t1019 = @drule.match_mp(order_decomp())
  let t1015 = @term_syntax.parse_term("(a : Real)")
  let t1017 = @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Real])"))(fn(
    x1012 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1013 = @tactics.mp_tac(x1012)
    fn(
      x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1013(x1014)
    }
  })
  let t1021 = @tactics.disch_then(fn(
    x1020 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1018 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      t1017(((x1016 : @kernel.Thm) => @bool.spec(t1015, x1016))(x1018))
    })(t1019(x1020))
  })
  let t1011 = @list.List([
    @meson.asm_meson_tac(@list.List([poly_diff_zero()])),
    @tactics.all_tac,
  ])
  let t1010 = @tactics.subgoal_then(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"), fn(
    x1007 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1008 = @tactics.mp_tac(x1007)
    fn(
      x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1008(x1009)
    }
  })
  let t1006 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1000 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1001 = @tactics.assume_tac(x1000)
        fn(
          x1002 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1001(x1002)
        }
      },
      fn(
        x1003 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1004 = @tactics.mp_tac(x1003)
        fn(
          x1005 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1004(x1005)
        }
      },
    ),
  )
  let t1084 = @tactics.thenl(
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
                              @tactics.repeat_tac(@tactics.gen_tac),
                              t1006,
                            ),
                            t1010,
                          ),
                          t1011,
                        ),
                        t1021,
                      ),
                      t1023,
                    ),
                    @nums.induct_tac,
                  ),
                  t1024,
                ),
                @tactics.strip_tac,
              ),
              t1025,
            ),
            t1026,
          ),
          t1029,
        ),
        t1033,
      ),
      @tactics.conj_tac,
    ),
    t1083,
  )
  order_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, !(poly(poly_diff(p)) == poly(NIL)) && !(order(a, p) == 0) → order(a, p) == SUC(order(a, poly_diff(p)))"),
      t1084,
    ),
  )
}

///|
let order_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORDER_DIFF")

///|
/// `ORDER_DIFF`
pub fn order_diff() -> @kernel.Thm {
  order_diff_c.get()
}

///|
/// POLY_SQUAREFREE_DECOMP_ORDER
fn step_95() -> Unit raise {
  let t1163 = @simp.asm_rewrite_tac(
    @list.List([@class.fun_eq_thm(), poly_mul_v1(), poly_add_v1()]),
  )
  let t1162 = @simp.asm_rewrite_tac(@list.List([]))
  let t1161 = @tactics.exists_tac(@term_syntax.parse_term("poly_add(poly_mul((r : List[Real]), (g : List[Real])), poly_mul((s : List[Real]), (f : List[Real])))"))
  let t1160 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(g : List[Real])"))(fn(
      x1157 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1158 = @tactics.assume_tac(x1157)
      fn(
        x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1158(x1159)
      }
    }),
  )
  let t1156 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(f : List[Real])"))(fn(
      x1153 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1154 = @tactics.assume_tac(x1153)
      fn(
        x1155 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1154(x1155)
      }
    }),
  )
  let t1152 = @tactics.pop_assum_list(fn(
    x1151 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t1150 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("poly((d : List[Real])) == poly(poly_add(poly_mul((r : List[Real]), (p : List[Real])), poly_mul((s : List[Real]), poly_diff(p))))"),
      ),
    ]),
  )
  let t1149 = @simp.rewrite_tac(@list.List([divides()]))
  let t1164 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.disch_then(
                      @tactics.conjuncts_then(fn(
                        x1146 : @kernel.Thm,
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
                        let s1147 = @tactics.mp_tac(x1146)
                        fn(
                          x1148 : (
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
                          s1147(x1148)
                        }
                      }),
                    ),
                    t1149,
                  ),
                  t1150,
                ),
                t1152,
              ),
              t1156,
            ),
            t1160,
          ),
          t1161,
        ),
        t1162,
      ),
      t1163,
    ),
    @int.arith_tac,
  )
  let t1145 = @simp.rewrite_tac(
    @list.List([
      @kernel.assume_rule(
        @term_syntax.parse_term("order((a : Real), poly_diff((p : List[Real]))) == PRE(order(a, p))"),
      ),
    ]),
  )
  let t1165 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([order_divides(), @arith.le_refl()])),
          @tactics.disj2_tac,
        ),
        t1145,
      ),
      @int.arith_tac,
    ),
    t1164,
  ])
  let t1144 = @tactics.subgoal_then(
    @term_syntax.parse_term("poly_divides(poly_exp([-(a : Real), real_of_num(1)], order(a, poly_diff((p : List[Real])))), p) && poly_divides(poly_exp([-a, real_of_num(1)], order(a, poly_diff(p))), poly_diff(p))"),
    fn(
      x1141 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1142 = @tactics.mp_tac(x1141)
      fn(
        x1143 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1142(x1143)
      }
    },
  )
  let t1140 = @list.List([
    @tactics.all_tac,
    @meson.asm_meson_tac(@list.List([poly_entire(), order_divides()])),
  ])
  let t1166 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.subgoal_then(
            @term_syntax.parse_term("poly_divides(poly_exp([-(a : Real), real_of_num(1)], order(a, poly_diff((p : List[Real])))), (d : List[Real]))"),
            fn(
              x1137 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s1138 = @tactics.mp_tac(x1137)
              fn(
                x1139 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s1138(x1139)
              }
            },
          ),
          t1140,
        ),
        t1144,
      ),
      t1165,
    ),
    @int.arith_tac,
  ])
  let t1136 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((a : Real), poly_diff((p : List[Real]))) <= order(a, (d : List[Real]))"),
    fn(
      x1133 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1134 = @tactics.mp_tac(x1133)
      fn(
        x1135 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1134(x1135)
      }
    },
  )
  let t1132 = @tactics.disch_then(fn(
    x1131 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1128 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1129 = @tactics.assume_tac(x1128)
      fn(
        x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1129(x1130)
      }
    })(@equal.sym(x1131))
  })
  let t1127 = @simp.rewrite_tac(@list.List([@arith.pre()]))
  let t1126 = @tactics.disch_then(fn(
    x1123 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x1123
    let t1125 = @tactics.mp_tac(@equal.ap_term(@term_syntax.parse_term("PRE"), th_1))
    @tactics.then_tac(@tactics.mp_tac(th_1), t1125)
  })
  let t1122 = @simp.asm_rewrite_tac(@list.List([]))
  let t1120 = @term_syntax.parse_term("(a : Real)")
  let t1121 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(p : List[Real])"), t1120]),
      order_diff(),
    ),
  )
  let t1119 = @list.List([
    @meson.asm_meson_tac(@list.List([poly_diff_zero()])),
    @tactics.all_tac,
  ])
  let t1118 = @tactics.subgoal_then(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"), fn(
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
    let s1116 = @tactics.assume_tac(x1115)
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
  })
  let t1112 = @meson.asm_meson_tac(@list.List([order_mul()]))
  let t1113 = @list.List([
    @meson.asm_meson_tac(@list.List([order_poly()])),
    t1112,
  ])
  let t1111 = @tactics.exists_tac(@term_syntax.parse_term("order((a : Real), poly_mul((e : List[Real]), (d : List[Real])))"))
  let t1114 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1111),
        @tactics.conj_tac,
      ),
      t1113,
    ),
    @tactics.all_tac,
  ])
  let t1110 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((a : Real), poly_diff((p : List[Real]))) == order(a, (e : List[Real])) + order(a, (d : List[Real]))"),
    fn(
      x1107 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1108 = @tactics.mp_tac(x1107)
      fn(
        x1109 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1108(x1109)
      }
    },
  )
  let t1106 = @simp.asm_rewrite_tac(@list.List([]))
  let t1105 = @class.asm_cases_tac(@term_syntax.parse_term("order((a : Real), (p : List[Real])) == 0"))
  let t1101 = @meson.asm_meson_tac(@list.List([poly_diff_zero()]))
  let t1100 = @tactics.first_assum(fn(
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
    let th = x1091
    @simp.gen_rewrite_tac(
      fn(
        x1099 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1093 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1094 = @equal.rand_conv(x1093)
          fn(x1095 : @kernel.Term) -> @kernel.Thm raise { s1094(x1095) }
        })(
          (fn(
            x1096 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1097 = @equal.land_conv(x1096)
            fn(x1098 : @kernel.Term) -> @kernel.Thm raise { s1097(x1098) }
          })(x1099),
        )
      },
      @list.List([@equal.sym(th)]),
    )
  })
  let t1102 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(order_mul()), t1100),
    t1101,
  )
  let t1090 = @simp.asm_rewrite_tac(@list.List([]))
  let t1103 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(order_poly()), t1090),
    t1102,
  ])
  let t1089 = @tactics.exists_tac(@term_syntax.parse_term("order((a : Real), poly_mul((q : List[Real]), (d : List[Real])))"))
  let t1104 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1089),
        @tactics.conj_tac,
      ),
      t1103,
    ),
    @tactics.all_tac,
  ])
  let t1088 = @tactics.subgoal_then(
    @term_syntax.parse_term("order((a : Real), (p : List[Real])) == order(a, (q : List[Real])) + order(a, (d : List[Real]))"),
    fn(
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
    },
  )
  let t1167 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.thenl(
                      @tactics.then_tac(
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.strip_tac),
                                  t1088,
                                ),
                                t1104,
                              ),
                              t1105,
                            ),
                            t1106,
                          ),
                          @list.List([@int.arith_tac, @tactics.all_tac]),
                        ),
                        t1110,
                      ),
                      t1114,
                    ),
                    t1118,
                  ),
                  t1119,
                ),
                t1121,
              ),
              t1122,
            ),
            t1126,
          ),
          t1127,
        ),
        t1132,
      ),
      t1136,
    ),
    t1166,
  )
  poly_squarefree_decomp_order_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ d : List[Real], ∀ e : List[Real], ∀ r : List[Real], ∀ s : List[Real], !(poly(poly_diff(p)) == poly(NIL)) && poly(p) == poly(poly_mul(q, d)) && poly(poly_diff(p)) == poly(poly_mul(e, d)) && poly(d) == poly(poly_add(poly_mul(r, p), poly_mul(s, poly_diff(p)))) → (∀ a : Real, order(a, q) == (if order(a, p) == 0 { 0 } else { 1 }))"),
      t1167,
    ),
  )
}

///|
let poly_squarefree_decomp_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_SQUAREFREE_DECOMP_ORDER",
)

///|
/// `POLY_SQUAREFREE_DECOMP_ORDER`
pub fn poly_squarefree_decomp_order() -> @kernel.Thm {
  poly_squarefree_decomp_order_c.get()
}

///|
/// rsquarefree
fn step_96() -> Unit raise {
  rsquarefree_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(rsquarefree : (List[Real]) -> Bool)((p : List[Real])) == (!(poly(p) == poly(NIL)) && (∀ a : Real, order(a, p) == 0 || order(a, p) == 1))"),
    ),
  )
}

///|
let rsquarefree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rsquarefree")

///|
/// `rsquarefree`
pub fn rsquarefree() -> @kernel.Thm {
  rsquarefree_c.get()
}

///|
/// RSQUAREFREE_ROOTS
fn step_97() -> Unit raise {
  let t1198 = @meson.asm_meson_tac(@list.List([order_diff(), @nums.suc_inj()]))
  let t1199 = @tactics.then_tac(
    @simp.asm_rewrite_tac(
      @list.List([
        order_root(),
        @class.de_morgan_thm(),
        @calc_num.num_conv(@term_syntax.parse_term("1")),
      ]),
    ),
    t1198,
  )
  let t1197 = @simp.asm_rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
    ]),
  )
  let t1195 = @term_syntax.parse_term("(a : Real)")
  let t1196 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("[(h : Real)]"), t1195]),
      order_root(),
    ),
  )
  let t1194 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t1193 = @simp.asm_rewrite_tac(@list.List([]))
  let t1192 = @simp.rewrite_tac(
    @list.List([
      @class.fun_eq_thm(),
      poly(),
      @analysis.real_mul_rzero(),
      @calc_int.real_add_rid(),
    ]),
  )
  let t1191 = @simp.asm_rewrite_tac(@list.List([poly()]))
  let t1190 = @tactics.undisch_tac(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"))
  let t1189 = @tactics.disch_then(fn(
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
    let th_1 = x1187
    @simp.rewrite_tac(@list.List([@drule.match_mp(order_poly())(th_1)]))
  })
  let t1186 = @tactics.disch_then(fn(
    x1183 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1183
    let t1185 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t1185)
  })
  let t1180 = @drule.match_mp(poly_diff_iszero())
  let t1181 = @tactics.x_choose_then(@term_syntax.parse_term("(h : Real)"))(fn(
    x1177 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1178 = @tactics.mp_tac(x1177)
    fn(
      x1179 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1178(x1179)
    }
  })
  let t1200 = @list.List([
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
                            x1182 : @kernel.Thm,
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
                            t1181(t1180(x1182))
                          }),
                          t1186,
                        ),
                        t1189,
                      ),
                      t1190,
                    ),
                    t1191,
                  ),
                  t1192,
                ),
                @tactics.disch_tac,
              ),
              t1193,
            ),
            t1194,
          ),
          @tactics.disj1_tac,
        ),
        t1196,
      ),
      t1197,
    ),
    t1199,
  ])
  let t1176 = @simp.asm_rewrite_tac(@list.List([]))
  let t1201 = @tactics.thenl(
    @tactics.then_tac(
      @class.asm_cases_tac(@term_syntax.parse_term("poly(poly_diff((p : List[Real]))) == poly(NIL)")),
      t1176,
    ),
    t1200,
  )
  let t1175 = @simp.asm_rewrite_tac(
    @list.List([poly(), @class.not_forall_thm()]),
  )
  let t1173 = @drule.match_mp(poly_diff_zero())
  let t1202 = @list.List([
    @tactics.then_tac(
      @tactics.first_assum(fn(
        x1174 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
          x1170 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1171 = @tactics.subst1_tac(x1170)
          fn(
            x1172 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1171(x1172)
          }
        })(t1173(x1174))
      }),
      t1175,
    ),
    t1201,
  ])
  let t1169 = @simp.asm_rewrite_tac(@list.List([]))
  let t1168 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Real])) == poly(NIL)"))
  let t1203 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([rsquarefree()])),
        ),
        t1168,
      ),
      t1169,
    ),
    t1202,
  )
  rsquarefree_roots_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], rsquarefree(p) == (∀ a : Real, !(poly(p, a) == real_of_num(0) && poly(poly_diff(p), a) == real_of_num(0)))"),
      t1203,
    ),
  )
}

///|
let rsquarefree_roots_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RSQUAREFREE_ROOTS",
)

///|
/// `RSQUAREFREE_ROOTS`
pub fn rsquarefree_roots() -> @kernel.Thm {
  rsquarefree_roots_c.get()
}

///|
/// RSQUAREFREE_DECOMP
fn step_98() -> Unit raise {
  let t1264 = @meson.meson_tac(@list.List([]))
  let t1263 = @simp.rewrite_tac(
    @list.List([poly_mul_v1(), poly(), @analysis.real_mul_rzero()]),
  )
  let t1262 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1265 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Real])")),
        t1262,
      ),
      t1263,
    ),
    t1264,
  ])
  let t1261 = @simp.asm_rewrite_tac(@list.List([]))
  let t1260 = @class.asm_cases_tac(@term_syntax.parse_term("(q : List[Real]) == NIL"))
  let t1259 = @simp.gen_rewrite_tac(
    fn(
      x1256 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1257 = @equal.land_conv(x1256)
      fn(x1258 : @kernel.Term) -> @kernel.Thm raise { s1257(x1258) }
    },
    @list.List([poly_linear_divides()]),
  )
  let t1255 = @tactics.undisch_tac(@term_syntax.parse_term("poly((q : List[Real]), (a : Real)) == real_of_num(0)"))
  let t1254 = @simp.rewrite_tac(@list.List([divides()]))
  let t1266 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.disch_tac,
                @tactics.undisch_tac(
                  @term_syntax.parse_term("!poly_divides([-(a : Real), real_of_num(1)], (q : List[Real]))"),
                ),
              ),
              t1254,
            ),
            t1255,
          ),
          t1259,
        ),
        t1260,
      ),
      t1261,
    ),
    t1265,
  )
  let t1253 = @simp.rewrite_tac(@list.List([poly()]))
  let t1252 = @simp.rewrite_tac(@list.List([poly_exp(), poly_mul_v1()]))
  let t1251 = @simp.gen_rewrite_tac(
    fn(
      x1250 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1246 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1240 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1241 = @equal.land_conv(x1240)
          fn(x1242 : @kernel.Term) -> @kernel.Thm raise { s1241(x1242) }
        })(
          (fn(
            x1243 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1244 = @equal.land_conv(x1243)
            fn(x1245 : @kernel.Term) -> @kernel.Thm raise { s1244(x1245) }
          })(x1246),
        )
      })(
        (fn(
          x1247 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1248 = @equal.rand_conv(x1247)
          fn(x1249 : @kernel.Term) -> @kernel.Thm raise { s1248(x1249) }
        })(x1250),
      )
    },
    @list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))]),
  )
  let t1267 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(
                    @list.List([@class.fun_eq_thm(), poly_mul_v1()]),
                  ),
                  @tactics.gen_tac,
                ),
                @tactics.ap_thm_tac,
              ),
              @tactics.ap_term_tac,
            ),
            t1251,
          ),
          t1252,
        ),
        t1253,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1266,
  ])
  let t1239 = @tactics.exists_tac(@term_syntax.parse_term("(q : List[Real])"))
  let t1238 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1232 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1233 = @tactics.subst_all_tac(x1232)
        fn(
          x1234 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1233(x1234)
        }
      },
      fn(
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
        let s1236 = @tactics.assume_tac(x1235)
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
      },
    ),
  )
  let t1231 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1230 = @simp.asm_rewrite_tac(@list.List([]))
  let t1226 = @term_syntax.parse_term("(a : Real)")
  let t1229 = @tactics.first_assum(fn(
    x1228 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.disj_cases_tac(
      ((x1227 : @kernel.Thm) => @bool.spec(t1226, x1227))(x1228),
    )
  })
  let t1223 = @simp.gen_rewrite_rule(
    fn(
      x1222 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1222
    },
    @list.List([order_root()]),
  )
  let t1225 = @tactics.first_assum(fn(
    x1224 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1219 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1220 = @tactics.mp_tac(x1219)
      fn(
        x1221 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1220(x1221)
      }
    })(t1223(x1224))
  })
  let t1214 = @term_syntax.parse_term("(a : Real)")
  let t1216 = @tactics.x_choose_then(@term_syntax.parse_term("(q : List[Real])"))(fn(
    x1211 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1212 = @tactics.mp_tac(x1211)
    fn(
      x1213 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1212(x1213)
    }
  })
  let t1218 = @tactics.disch_then(fn(
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
    t1216(((x1215 : @kernel.Thm) => @bool.spec(t1214, x1215))(x1217))
  })
  let t1208 = @drule.match_mp(order_decomp())
  let t1210 = @tactics.first_assum(fn(
    x1209 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1205 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1206 = @tactics.mp_tac(x1205)
      fn(
        x1207 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1206(x1207)
      }
    })(t1208(x1209))
  })
  let t1204 = @simp.rewrite_tac(@list.List([rsquarefree()]))
  let t1268 = @tactics.thenl(
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
                          t1204,
                        ),
                        @tactics.strip_tac,
                      ),
                      t1210,
                    ),
                    t1218,
                  ),
                  t1225,
                ),
                t1229,
              ),
              t1230,
            ),
            t1231,
          ),
          t1238,
        ),
        t1239,
      ),
      @tactics.conj_tac,
    ),
    t1267,
  )
  rsquarefree_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ a : Real, rsquarefree(p) && poly(p, a) == real_of_num(0) → (∃ q : List[Real], poly(p) == poly(poly_mul([-a, real_of_num(1)], q)) && !(poly(q, a) == real_of_num(0)))"),
      t1268,
    ),
  )
}

///|
let rsquarefree_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RSQUAREFREE_DECOMP",
)

///|
/// `RSQUAREFREE_DECOMP`
pub fn rsquarefree_decomp() -> @kernel.Thm {
  rsquarefree_decomp_c.get()
}

///|
/// POLY_SQUAREFREE_DECOMP
fn step_99() -> Unit raise {
  let t1308 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1307 = @simp.asm_rewrite_tac(@list.List([rsquarefree(), order_root()]))
  let t1306 = @tactics.disch_then(fn(
    x1305 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1302 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1303 = @tactics.subst_all_tac(x1302)
      fn(
        x1304 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1303(x1304)
      }
    })(@equal.sym(x1305))
  })
  let t1301 = @tactics.undisch_tac(@term_syntax.parse_term("poly((p : List[Real])) == poly(poly_mul((q : List[Real]), (d : List[Real])))"))
  let t1300 = @simp.rewrite_tac(
    @list.List([poly_entire(), @class.de_morgan_thm()]),
  )
  let t1299 = @simp.asm_rewrite_tac(@list.List([]))
  let t1298 = @tactics.disch_then(fn(
    x1295 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x1295
    let t1297 = @tactics.assume_tac(th_2)
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1297)
  })
  let t1294 = @tactics.disch_then(fn(
    x1291 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x1291
    let t1293 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.mp_tac(th_1), t1293)
  })
  let t1290 = @tactics.undisch_tac(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"))
  let t1289 = @tactics.disch_then(fn(
    x1288 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1285 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1286 = @tactics.assume_tac(x1285)
      fn(
        x1287 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1286(x1287)
      }
    })(@bool.conjunct1(x1288))
  })
  let t1284 = @list.List([
    @meson.asm_meson_tac(@list.List([poly_diff_zero()])),
    @tactics.all_tac,
  ])
  let t1283 = @tactics.subgoal_then(@term_syntax.parse_term("!(poly((p : List[Real])) == poly(NIL))"), fn(
    x1280 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1281 = @tactics.assume_tac(x1280)
    fn(
      x1282 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1281(x1282)
    }
  })
  let t1279 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1273 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1274 = @tactics.assume_tac(x1273)
        fn(
          x1275 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1274(x1275)
        }
      },
      fn(
        x1276 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1277 = @tactics.mp_tac(x1276)
        fn(
          x1278 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1277(x1278)
        }
      },
    ),
  )
  let t1272 = @tactics.disch_then(fn(
    x1269 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1269
    let t1271 = @tactics.assume_tac(
      @drule.match_mp(poly_squarefree_decomp_order())(th),
    )
    @tactics.then_tac(@tactics.mp_tac(th), t1271)
  })
  let t1309 = @tactics.then_tac(
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
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t1272,
                                    ),
                                    t1279,
                                  ),
                                  t1283,
                                ),
                                t1284,
                              ),
                              t1289,
                            ),
                            t1290,
                          ),
                          t1294,
                        ),
                        t1298,
                      ),
                      t1299,
                    ),
                    t1300,
                  ),
                  @tactics.strip_tac,
                ),
                t1301,
              ),
              t1306,
            ),
            t1307,
          ),
          @tactics.conj_tac,
        ),
        @tactics.gen_tac,
      ),
      @class.cond_cases_tac,
    ),
    t1308,
  )
  poly_squarefree_decomp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], ∀ d : List[Real], ∀ e : List[Real], ∀ r : List[Real], ∀ s : List[Real], !(poly(poly_diff(p)) == poly(NIL)) && poly(p) == poly(poly_mul(q, d)) && poly(poly_diff(p)) == poly(poly_mul(e, d)) && poly(d) == poly(poly_add(poly_mul(r, p), poly_mul(s, poly_diff(p)))) → rsquarefree(q) && (∀ a : Real, (poly(q, a) == real_of_num(0)) == (poly(p, a) == real_of_num(0)))"),
      t1309,
    ),
  )
}

///|
let poly_squarefree_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_SQUAREFREE_DECOMP",
)

///|
/// `POLY_SQUAREFREE_DECOMP`
pub fn poly_squarefree_decomp() -> @kernel.Thm {
  poly_squarefree_decomp_c.get()
}

///|
/// normalize
fn step_100() -> Unit raise {
  let t1310 = @term_syntax.parse_term("(normalize : (List[Real]) -> List[Real])(NIL) == NIL && normalize(CONS((h : Real), (t : List[Real]))) == (if normalize(t) == NIL { if h == real_of_num(0) { NIL } else { [h] } } else { CONS(h, normalize(t)) })")
  normalize_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t1310),
  )
}

///|
let normalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("normalize")

///|
/// `normalize`
pub fn normalize() -> @kernel.Thm {
  normalize_c.get()
}

///|
/// POLY_NORMALIZE
fn step_101() -> Unit raise {
  let t1321 = @simp.rewrite_tac(
    @list.List([@analysis.real_mul_rzero(), @realax.real_add_lid()]),
  )
  let t1320 = @simp.asm_rewrite_tac(@list.List([poly()]))
  let t1319 = @tactics.disch_then(fn(
    x1318 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1315 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1316 = @tactics.subst1_tac(x1315)
      fn(
        x1317 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1316(x1317)
      }
    })(@equal.sym(x1318))
  })
  let t1314 = @tactics.undisch_tac(
    @term_syntax.parse_term("poly(normalize((t : List[Real]))) == poly(t)"),
  )
  let t1313 = @simp.asm_rewrite_tac(@list.List([poly(), @class.fun_eq_thm()]))
  let t1312 = @simp.asm_rewrite_tac(@list.List([]))
  let t1311 = @class.asm_cases_tac(@term_syntax.parse_term("(h : Real) == real_of_num(0)"))
  let t1322 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @lists.list_induct_tac,
                    @simp.rewrite_tac(@list.List([normalize(), poly()])),
                  ),
                  t1311,
                ),
                t1312,
              ),
              @class.cond_cases_tac,
            ),
            t1313,
          ),
          t1314,
        ),
        t1319,
      ),
      t1320,
    ),
    t1321,
  )
  poly_normalize_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly(normalize(p)) == poly(p)"), t1322),
  )
}

///|
let poly_normalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_NORMALIZE")

///|
/// `POLY_NORMALIZE`
pub fn poly_normalize() -> @kernel.Thm {
  poly_normalize_c.get()
}

///|
/// degree
fn step_102() -> Unit raise {
  degree_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(degree : (List[Real]) -> Num)((p : List[Real])) == PRE(LENGTH(normalize(p)))"),
    ),
  )
}

///|
let degree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("degree")

///|
/// `degree`
pub fn degree() -> @kernel.Thm {
  degree_c.get()
}

///|
/// DEGREE_ZERO
fn step_103() -> Unit raise {
  let t1341 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.pre()]))
  let t1340 = @simp.asm_rewrite_tac(@list.List([]))
  let t1339 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1338 = @tactics.subgoal_then(@term_syntax.parse_term("normalize((t : List[Real])) == NIL"), fn(
    x1336 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x1336
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1335 = @simp.asm_rewrite_tac(@list.List([]))
  let t1334 = @simp.rewrite_tac(@list.List([normalize(), @lists.all()]))
  let t1333 = @simp.rewrite_tac(@list.List([poly_zero()]))
  let t1331 = @term_syntax.parse_term("(p : List[Real])")
  let t1332 = @tactics.spec_tac(@term_syntax.parse_term("(p : List[Real])"), t1331)
  let t1342 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.pop_assum(fn(
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
                        let s1329 = @tactics.mp_tac(x1328)
                        fn(
                          x1330 : (
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
                          s1329(x1330)
                        }
                      }),
                      t1332,
                    ),
                    t1333,
                  ),
                  @lists.list_induct_tac,
                ),
                t1334,
              ),
              @tactics.strip_tac,
            ),
            t1335,
          ),
          t1338,
        ),
        t1339,
      ),
      t1340,
    ),
    t1341,
  ])
  let t1327 = @tactics.subgoal_then(@term_syntax.parse_term("normalize((p : List[Real])) == NIL"), fn(
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
    let s1325 = @tactics.subst1_tac(x1324)
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
  })
  let t1323 = @simp.rewrite_tac(@list.List([degree()]))
  let t1343 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1323),
      t1327,
    ),
    t1342,
  )
  degree_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], poly(p) == poly(NIL) → degree(p) == 0"),
      t1343,
    ),
  )
}

///|
let degree_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEGREE_ZERO")

///|
/// `DEGREE_ZERO`
pub fn degree_zero() -> @kernel.Thm {
  degree_zero_c.get()
}

///|
/// POLY_ROOTS_FINITE_SET
fn step_104() -> Unit raise {
  let t1369 = @simp.asm_rewrite_tac(
    @list.List([@sets.subset(), @sets.in_elim_thm()]),
  )
  let t1364 = @simp.asm_rewrite_tac(@list.List([]))
  let t1365 = @tactics.then_tac(
    @tactics.match_mp_tac(@bool.conjunct2(@sets.finite_rules())),
    t1364,
  )
  let t1363 = @meson.meson_tac(@list.List([]))
  let t1366 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @sets.extension(),
          @sets.in_elim_thm(),
          @sets.in_insert(),
          @arith.lt(),
        ]),
      ),
      t1363,
    ),
    t1365,
  ])
  let t1367 = @tactics.thenl(
    @tactics.subgoal_then(
      @term_syntax.parse_term("{(x : Real) | ∃ n : Num, n < SUC((N : Num)) && x == (i : (Num) -> Real)(n)} == INSERT(i(N), {(x : Real) | ∃ n : Num, n < N && x == i(n)})"),
      fn(
        x1360 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s1361 = @tactics.subst1_tac(x1360)
        fn(
          x1362 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s1361(x1362)
        }
      },
    ),
    t1366,
  )
  let t1359 = @simp.rewrite_tac(
    @list.List([
      @sets.extension(),
      @sets.in_elim_thm(),
      @sets.not_in_empty(),
      @arith.lt(),
    ]),
  )
  let t1368 = @list.List([
    @tactics.then_tac(
      @tactics.subgoal_then(
        @term_syntax.parse_term("{(x : Real) | ∃ n : Num, n < 0 && x == (i : (Num) -> Real)(n)} == {}"),
        fn(
          x1357 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th = x1357
          @simp.rewrite_tac(@list.List([th, @sets.finite_rules()]))
        },
      ),
      t1359,
    ),
    t1367,
  ])
  let t1356 = @tactics.pop_assum_list(fn(
    x1355 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t1354 = @term_syntax.parse_term("(N : Num)")
  let t1370 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.spec_tac(@term_syntax.parse_term("(N : Num)"), t1354),
          t1356,
        ),
        @nums.induct_tac,
      ),
      t1368,
    ),
    t1369,
  ])
  let t1353 = @tactics.exists_tac(
    @term_syntax.parse_term("{(x : Real) | ∃ n : Num, n < (N : Num) && x == (i : (Num) -> Real)(n)}"),
  )
  let t1352 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1351 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(i : (Num) -> Real)"))(fn(
      x1348 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1349 = @tactics.assume_tac(x1348)
      fn(
        x1350 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1349(x1350)
      }
    }),
  )
  let t1347 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(
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
      let s1345 = @tactics.mp_tac(x1344)
      fn(
        x1346 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1345(x1346)
      }
    }),
  )
  let t1371 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @simp.rewrite_tac(@list.List([poly_roots_finite()])),
              ),
              t1347,
            ),
            t1351,
          ),
          t1352,
        ),
        t1353,
      ),
      @tactics.conj_tac,
    ),
    t1370,
  )
  poly_roots_finite_set_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], !(poly(p) == poly(NIL)) → FINITE({(x : Real) | poly(p, x) == real_of_num(0)})"),
      t1371,
    ),
  )
}

///|
let poly_roots_finite_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ROOTS_FINITE_SET",
)

///|
/// `POLY_ROOTS_FINITE_SET`
pub fn poly_roots_finite_set() -> @kernel.Thm {
  poly_roots_finite_set_c.get()
}

///|
/// POLY_MONO
fn step_105() -> Unit raise {
  let t1379 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1378 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1377 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t1376 = @simp.rewrite_tac(
    @list.List([@real.real_abs_triangle(), @analysis.real_le_ladd()]),
  )
  let t1375 = @tactics.exists_tac(
    @term_syntax.parse_term("abs((h : Real)) + abs((x : Real) * poly((t : List[Real]), x))"),
  )
  let t1374 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t1373 = @simp.rewrite_tac(
    @list.List([
      poly(),
      @analysis.real_le_refl(),
      @lists.map(),
      @real.real_abs_0(),
    ]),
  )
  let t1372 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t1380 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
                      t1372,
                    ),
                    @tactics.disch_tac,
                  ),
                  @lists.list_induct_tac,
                ),
                t1373,
              ),
              t1374,
            ),
            t1375,
          ),
          t1376,
        ),
        t1377,
      ),
      t1378,
    ),
    t1379,
  )
  poly_mono_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ k : Real, ∀ p : List[Real], abs(x) <= k → abs(poly(p, x)) <= poly(MAP(abs, p), k)"),
      t1380,
    ),
  )
}

///|
let poly_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MONO")

///|
/// `POLY_MONO`
pub fn poly_mono() -> @kernel.Thm {
  poly_mono_c.get()
}

///|
/// POLY_DIFF_CONV
fn step_106() -> Unit raise {
  let aux_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1381 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1381
    },
    @list.List([@bool.conjunct1(poly_diff_aux())]),
  )
  let aux_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1382 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1382
    },
    @list.List([@bool.conjunct2(poly_diff_aux())]),
  )
  let diff_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1383 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1383
    },
    @lib.butlast(@bool.conjuncts_rule(poly_diff_clauses())),
  )
  let diff_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1384 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1384
    },
    @list.List([@lib.last(@bool.conjuncts_rule(poly_diff_clauses()))]),
  )
  fn poly_diff_aux_conv(x1385 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1385
    let t1386 = @equal.rand_conv(
      @equal.thenc(@equal.land_conv(@calc_num.num_suc_conv), poly_diff_aux_conv),
    )
    @equal.orelsec(
      aux_conv0,
      @equal.thenc(
        @equal.thenc(aux_conv1, @equal.land_conv(@calc_rat.real_rat_mul_conv)),
        t1386,
      ),
    )(tm)
  }
  poly_diff_conv_c.set(
    @equal.orelsec(diff_conv0, @equal.thenc(diff_conv1, poly_diff_aux_conv)),
  )
}

///|
let poly_diff_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("POLY_DIFF_CONV")

///|
/// `POLY_DIFF_CONV`
pub fn poly_diff_conv(x : @kernel.Term) -> @kernel.Thm raise {
  poly_diff_conv_c.get()(x)
}

///|
/// POLY_CMUL_CONV
fn step_107() -> Unit raise {
  let cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1387 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1387
    },
    @list.List([@bool.conjunct1(poly_cmul())]),
  )
  let cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1388 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1388
    },
    @list.List([@bool.conjunct2(poly_cmul())]),
  )
  fn poly_cmul_conv_1(x1389 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1389
    let t1390 = @equal.rand_conv(poly_cmul_conv_1)
    @equal.orelsec(
      cmul_conv0,
      @equal.thenc(
        @equal.thenc(cmul_conv1, @equal.land_conv(@calc_rat.real_rat_mul_conv)),
        t1390,
      ),
    )(tm)
  }
  poly_cmul_conv_c.set(poly_cmul_conv_1)
}

///|
let poly_cmul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("POLY_CMUL_CONV")

///|
/// `POLY_CMUL_CONV`
pub fn poly_cmul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  poly_cmul_conv_c.get()(x)
}

///|
/// POLY_ADD_CONV
fn step_108() -> Unit raise {
  let add_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1391 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1391
    },
    @lib.butlast(@bool.conjuncts_rule(poly_add_clauses())),
  )
  let add_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1392 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1392
    },
    @list.List([@lib.last(@bool.conjuncts_rule(poly_add_clauses()))]),
  )
  fn poly_add_conv_1(x1393 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1393
    let t1394 = @equal.rand_conv(poly_add_conv_1)
    @equal.orelsec(
      add_conv0,
      @equal.thenc(
        @equal.thenc(add_conv1, @equal.land_conv(@calc_rat.real_rat_add_conv)),
        t1394,
      ),
    )(tm)
  }
  poly_add_conv_c.set(poly_add_conv_1)
}

///|
let poly_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("POLY_ADD_CONV")

///|
/// `POLY_ADD_CONV`
pub fn poly_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  poly_add_conv_c.get()(x)
}

///|
/// POLY_MUL_CONV
fn step_109() -> Unit raise {
  let mul_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1395 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1395
    },
    @list.List([@bool.conjunct1(poly_mul_clauses())]),
  )
  let mul_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1396 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1396
    },
    @list.List([@bool.conjunct1(@bool.conjunct2(poly_mul_clauses()))]),
  )
  let mul_conv2 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1397 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1397
    },
    @list.List([@bool.conjunct2(@bool.conjunct2(poly_mul_clauses()))]),
  )
  fn poly_mul_conv_1(x1398 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1398
    let t1399 = @equal.rand_conv(@equal.rand_conv(poly_mul_conv_1))
    let t1400 = @equal.thenc(
      @equal.thenc(
        @equal.thenc(mul_conv2, @equal.land_conv(poly_cmul_conv)),
        t1399,
      ),
      poly_add_conv,
    )
    @equal.orelsec(
      @equal.orelsec(mul_conv0, @equal.thenc(mul_conv1, poly_cmul_conv)),
      t1400,
    )(tm)
  }
  poly_mul_conv_c.set(poly_mul_conv_1)
}

///|
let poly_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("POLY_MUL_CONV")

///|
/// `POLY_MUL_CONV`
pub fn poly_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  poly_mul_conv_c.get()(x)
}

///|
/// POLY_NORMALIZE_CONV
fn step_110() -> Unit raise {
  let t1401 = @simp.rewrite_tac(@list.List([normalize()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("normalize(CONS((h : Real), (t : List[Real]))) == ((n : List[Real]) => if n == NIL { if h == real_of_num(0) { NIL } else { [h] } } else { CONS(h, n) })(normalize(t))"),
    t1401,
  )
  let norm_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1402 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1402
    },
    @list.List([@bool.conjunct1(normalize())]),
  )
  let norm_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1403 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1403
    },
    @list.List([pth]),
  )
  let norm_conv2 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1404 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1405 = @equal.depth_conv(x1404)
      fn(x1406 : @kernel.Term) -> @kernel.Thm raise { s1405(x1406) }
    },
    @list.List([
      @class.cond_clauses(),
      @lists.not_cons_nil(),
      @bool.eqt_intro(@bool.spec_all(@theorems.eq_refl())),
    ]),
  )
  fn poly_normalize_conv_1(x1407 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1407
    let t1408 = @equal.rator_conv(
      @equal.rand_conv(
        @equal.rator_conv(@equal.land_conv(@calc_rat.real_rat_eq_conv)),
      ),
    )
    @equal.orelsec(
      norm_conv0,
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(norm_conv1, @equal.rand_conv(poly_normalize_conv_1)),
            @equal.beta_conv,
          ),
          t1408,
        ),
        norm_conv2,
      ),
    )(tm)
  }
  poly_normalize_conv_c.set(poly_normalize_conv_1)
}

///|
let poly_normalize_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "POLY_NORMALIZE_CONV",
)

///|
/// `POLY_NORMALIZE_CONV`
pub fn poly_normalize_conv(x : @kernel.Term) -> @kernel.Thm raise {
  poly_normalize_conv_c.get()(x)
}

///|
/// NOT_POLY_CMUL_NIL
fn step_111() -> Unit raise {
  let t1409 = @simp.simp_tac(@list.List([poly_cmul(), @lists.not_cons_nil()]))
  let t1410 = @list.List([@simp.simp_tac(@list.List([])), t1409])
  let t1411 = @tactics.thenl(
    @tactics.then_tac(@tactics.strip_tac, @lists.list_induct_tac),
    t1410,
  )
  not_poly_cmul_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ h : Real, ∀ p : List[Real], !(p == NIL) → !(poly_cmul(h, p) == NIL)"),
      t1411,
    ),
  )
}

///|
let not_poly_cmul_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_POLY_CMUL_NIL",
)

///|
/// `NOT_POLY_CMUL_NIL`
pub fn not_poly_cmul_nil() -> @kernel.Thm {
  not_poly_cmul_nil_c.get()
}

///|
/// NOT_POLY_MUL_NIL
fn step_112() -> Unit raise {
  let t1414 = @simp.simp_tac(
    @list.List([poly_cmul(), poly_add(), @lists.not_cons_nil()]),
  )
  let t1415 = @list.List([
    @simp.simp_tac(@list.List([poly_cmul(), @lists.not_cons_nil()])),
    t1414,
  ])
  let t1412 = @term_syntax.parse_term("(t : List[Real])")
  let t1413 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t1412)
  let t1416 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.simp_tac(@list.List([poly_mul(), @lists.not_cons_nil()])),
        t1413,
      ),
      @lists.list_induct_tac,
    ),
    t1415,
  )
  let t1417 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1416]),
  )
  let t1418 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1417]),
  )
  not_poly_mul_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) → !(poly_mul(p1, p2) == NIL)"),
      t1418,
    ),
  )
}

///|
let not_poly_mul_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_POLY_MUL_NIL",
)

///|
/// `NOT_POLY_MUL_NIL`
pub fn not_poly_mul_nil() -> @kernel.Thm {
  not_poly_mul_nil_c.get()
}

///|
/// NOT_POLY_EXP_NIL
fn step_113() -> Unit raise {
  let lem001 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ p : List[Real], !(p == NIL) → !(poly_exp(p, (n : Num)) == NIL)"),
  )
  let t1419 = @bool.spec(@term_syntax.parse_term("CONS((h : Real), (t : List[Real]))"), lem001)
  let lem002 = @simp.simp_rule(@list.List([@lists.not_cons_nil()]))(t1419)
  let t1420 = @simp.simp_tac(
    @list.List([lem002, not_poly_mul_nil(), poly_exp(), @lists.not_cons_nil()]),
  )
  let t1421 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1420]),
  )
  let t1422 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @simp.simp_tac(@list.List([poly_exp(), @lists.not_cons_nil()])),
      t1421,
    ]),
  )
  not_poly_exp_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : List[Real], !(p == NIL) → !(poly_exp(p, n) == NIL)"),
      t1422,
    ),
  )
}

///|
let not_poly_exp_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_POLY_EXP_NIL",
)

///|
/// `NOT_POLY_EXP_NIL`
pub fn not_poly_exp_nil() -> @kernel.Thm {
  not_poly_exp_nil_c.get()
}

///|
/// NOT_POLY_EXP_X_NIL
fn step_114() -> Unit raise {
  let t1423 = @simp.simp_tac(@list.List([@lists.not_cons_nil()]))
  let lem01 = @tactics.prove(@term_syntax.parse_term("!([real_of_num(0), real_of_num(1)] == NIL)"), t1423)
  let t1424 = @simp.asm_simp_tac(
    @list.List([poly_exp(), not_poly_mul_nil(), lem01]),
  )
  let t1425 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @simp.simp_tac(@list.List([poly_exp(), @lists.not_cons_nil()])),
      t1424,
    ]),
  )
  not_poly_exp_x_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, !(poly_exp([real_of_num(0), real_of_num(1)], n) == NIL)"),
      t1425,
    ),
  )
}

///|
let not_poly_exp_x_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NOT_POLY_EXP_X_NIL",
)

///|
/// `NOT_POLY_EXP_X_NIL`
pub fn not_poly_exp_x_nil() -> @kernel.Thm {
  not_poly_exp_x_nil_c.get()
}

///|
/// POLY_CMUL_LID
fn step_115() -> Unit raise {
  let t1426 = @simp.simp_tac(
    @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) * (h : Real) == h"))]),
  )
  let t1427 = @tactics.then_tac(
    @simp.asm_simp_tac(@list.List([poly_cmul()])),
    t1426,
  )
  let t1428 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_cmul()])), t1427]),
  )
  poly_cmul_lid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly_cmul(real_of_num(1), p) == p"), t1428),
  )
}

///|
let poly_cmul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CMUL_LID")

///|
/// `POLY_CMUL_LID`
pub fn poly_cmul_lid() -> @kernel.Thm {
  poly_cmul_lid_c.get()
}

///|
/// POLY_MUL_LID
fn step_116() -> Unit raise {
  let t1429 = @simp.simp_tac(@list.List([poly_cmul_lid()]))
  let t1430 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([poly_mul()])),
    t1429,
  )
  let t1431 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_mul(), poly_cmul()])), t1430]),
  )
  poly_mul_lid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly_mul([real_of_num(1)], p) == p"), t1431),
  )
}

///|
let poly_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MUL_LID")

///|
/// `POLY_MUL_LID`
pub fn poly_mul_lid() -> @kernel.Thm {
  poly_mul_lid_c.get()
}

///|
/// POLY_MUL_RID
fn step_117() -> Unit raise {
  let t1432 = @calc_rat.real_arith(
    @term_syntax.parse_term("(h : Real) * real_of_num(1) == h"),
  )
  let t1433 = @simp.asm_simp_tac(
    @list.List([
      poly_mul(),
      poly_cmul(),
      poly_add(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      @calc_rat.real_arith(@term_syntax.parse_term("(h : Real) + real_of_num(0) == h")),
      t1432,
    ]),
  )
  let t1434 = @tactics.then_tac(
    @class.asm_cases_tac(@term_syntax.parse_term("(t : List[Real]) == NIL")),
    t1433,
  )
  let t1435 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_mul()])), t1434]),
  )
  poly_mul_rid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], poly_mul(p, [real_of_num(1)]) == p"), t1435),
  )
}

///|
let poly_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_MUL_RID")

///|
/// `POLY_MUL_RID`
pub fn poly_mul_rid() -> @kernel.Thm {
  poly_mul_rid_c.get()
}

///|
/// POLY_ADD_SYM
fn step_118() -> Unit raise {
  let lem1 = @kernel.assume_rule(@term_syntax.parse_term("∀ y : List[Real], poly_add((t : List[Real]), y) == poly_add(y, t)"))
  let lem2 = @bool.spec(@term_syntax.parse_term("(t' : List[Real])"), lem1)
  let t1438 = @term_syntax.parse_term("(h' : Real)")
  let t1439 = @simp.simp_tac(
    @list.List([
      @bool.specl(
        @list.List([@term_syntax.parse_term("(h : Real)"), t1438]),
        @realax.real_add_sym(),
      ),
    ]),
  )
  let t1437 = @simp.once_rewrite_tac(@list.List([lem2]))
  let t1440 = @tactics.then_tac(
    @tactics.then_tac(@simp.simp_tac(@list.List([poly_add_clauses()])), t1437),
    t1439,
  )
  let t1441 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_add()])), t1440]),
  )
  let t1436 = @simp.simp_tac(@list.List([poly_add()]))
  let t1442 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([
      @tactics.thenl(
        @lists.list_induct_tac,
        @list.List([@simp.simp_tac(@list.List([poly_add()])), t1436]),
      ),
      t1441,
    ]),
  )
  poly_add_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : List[Real], ∀ y : List[Real], poly_add(x, y) == poly_add(y, x)"), t1442),
  )
}

///|
let poly_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ADD_SYM")

///|
/// `POLY_ADD_SYM`
pub fn poly_add_sym() -> @kernel.Thm {
  poly_add_sym_c.get()
}

///|
/// POLY_ADD_ASSOC
fn step_119() -> Unit raise {
  let lem1 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ y : List[Real], ∀ z : List[Real], poly_add((t : List[Real]), poly_add(y, z)) == poly_add(poly_add(t, y), z)"),
  )
  let t1443 = @term_syntax.parse_term("(t'' : List[Real])")
  let lem2 = @bool.specl(
    @list.List([@term_syntax.parse_term("(t' : List[Real])"), t1443]),
    lem1,
  )
  let t1445 = @simp.simp_tac(@list.List([lem2]))
  let t1444 = @simp.simp_tac(@list.List([@realax.real_add_assoc()]))
  let t1446 = @tactics.then_tac(
    @tactics.then_tac(@simp.simp_tac(@list.List([poly_add_clauses()])), t1444),
    t1445,
  )
  let t1447 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_add_clauses()])), t1446]),
  )
  let t1448 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_add_clauses()])), t1447]),
  )
  let t1449 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([poly_add_clauses()])), t1448]),
  )
  poly_add_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : List[Real], ∀ y : List[Real], ∀ z : List[Real], poly_add(x, poly_add(y, z)) == poly_add(poly_add(x, y), z)"),
      t1449,
    ),
  )
}

///|
let poly_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ADD_ASSOC")

///|
/// `POLY_ADD_ASSOC`
pub fn poly_add_assoc() -> @kernel.Thm {
  poly_add_assoc_c.get()
}

///|
/// TL_POLY_MUL_X
fn step_120() -> Unit raise {
  let t1460 = @simp.asm_simp_tac(
    @list.List([
      poly_cmul(),
      poly_add(),
      @lists.not_cons_nil(),
      @lists.hd(),
      @lists.tl(),
      @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) * (h : Real) + (h' : Real) == h'")),
    ]),
  )
  let t1461 = @list.List([
    @simp.simp_tac(@list.List([poly_cmul(), poly_add()])),
    t1460,
  ])
  let t1458 = @term_syntax.parse_term("(t : List[Real])")
  let t1459 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[Real])"), t1458)
  let t1456 = @term_syntax.parse_term("(h : Real)")
  let t1457 = @tactics.spec_tac(@term_syntax.parse_term("(h : Real)"), t1456)
  let t1455 = @simp.simp_tac(@list.List([@lists.tl(), poly_mul_lid()]))
  let t1454 = @simp.simp_tac(@list.List([@lists.not_cons_nil()]))
  let t1453 = @simp.once_rewrite_tac(@list.List([poly_add()]))
  let t1452 = @simp.once_rewrite_tac(@list.List([poly_cmul()]))
  let t1451 = @simp.simp_tac(@list.List([@lists.not_cons_nil()]))
  let t1462 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.once_rewrite_tac(@list.List([poly_mul()])),
                    t1451,
                  ),
                  t1452,
                ),
                t1453,
              ),
              t1454,
            ),
            t1455,
          ),
          t1457,
        ),
        t1459,
      ),
      @lists.list_induct_tac,
    ),
    t1461,
  )
  let t1450 = @simp.simp_tac(
    @list.List([
      @lists.not_cons_nil(),
      poly_cmul(),
      poly_add(),
      @lists.tl(),
      poly_mul(),
    ]),
  )
  let t1463 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([
      @tactics.then_tac(@simp.once_rewrite_tac(@list.List([poly_mul()])), t1450),
      t1462,
    ]),
  )
  tl_poly_mul_x_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], TL(poly_mul([real_of_num(0), real_of_num(1)], p)) == p"), t1463),
  )
}

///|
let tl_poly_mul_x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TL_POLY_MUL_X")

///|
/// `TL_POLY_MUL_X`
pub fn tl_poly_mul_x() -> @kernel.Thm {
  tl_poly_mul_x_c.get()
}

///|
/// HD_POLY_MUL_X
fn step_121() -> Unit raise {
  let t1464 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.simp_tac(
      @list.List([
        poly_mul(),
        @lists.not_cons_nil(),
        poly_cmul(),
        poly_add(),
        @lists.hd(),
        @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) * (h : Real) + real_of_num(0) == real_of_num(0)")),
      ]),
    ),
  )
  hd_poly_mul_x_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ p : List[Real], HD(poly_mul([real_of_num(0), real_of_num(1)], p)) == real_of_num(0)"), t1464),
  )
}

///|
let hd_poly_mul_x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_POLY_MUL_X")

///|
/// `HD_POLY_MUL_X`
pub fn hd_poly_mul_x() -> @kernel.Thm {
  hd_poly_mul_x_c.get()
}

///|
/// TL_POLY_EXP_X_SUC
fn step_122() -> Unit raise {
  let t1465 = @simp.simp_tac(@list.List([poly_exp(), tl_poly_mul_x()]))
  tl_poly_exp_x_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, TL(poly_exp([real_of_num(0), real_of_num(1)], SUC(n))) == poly_exp([real_of_num(0), real_of_num(1)], n)"),
      t1465,
    ),
  )
}

///|
let tl_poly_exp_x_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TL_POLY_EXP_X_SUC",
)

///|
/// `TL_POLY_EXP_X_SUC`
pub fn tl_poly_exp_x_suc() -> @kernel.Thm {
  tl_poly_exp_x_suc_c.get()
}

///|
/// HD_POLY_EXP_X_SUC
fn step_123() -> Unit raise {
  let t1466 = @simp.simp_tac(@list.List([poly_exp(), hd_poly_mul_x()]))
  let t1467 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @simp.simp_tac(
        @list.List([
          poly_exp(),
          poly_add(),
          @lists.hd(),
          @lists.tl(),
          poly_cmul(),
          poly_mul(),
          @lists.not_cons_nil(),
          @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) * real_of_num(1) + real_of_num(0) == real_of_num(0)")),
        ]),
      ),
      t1466,
    ]),
  )
  hd_poly_exp_x_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, HD(poly_exp([real_of_num(0), real_of_num(1)], SUC(n))) == real_of_num(0)"),
      t1467,
    ),
  )
}

///|
let hd_poly_exp_x_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HD_POLY_EXP_X_SUC",
)

///|
/// `HD_POLY_EXP_X_SUC`
pub fn hd_poly_exp_x_suc() -> @kernel.Thm {
  hd_poly_exp_x_suc_c.get()
}

///|
/// HD_POLY_ADD
fn step_124() -> Unit raise {
  let t1470 = @simp.simp_tac(@list.List([@lists.hd()]))
  let t1468 = @term_syntax.parse_term("(t' : List[Real])")
  let t1469 = @simp.once_rewrite_tac(
    @list.List([
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(h' : Real)"), t1468]),
        @lists.not_cons_nil(),
      ),
    ]),
  )
  let t1471 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(@list.List([@lists.not_cons_nil(), poly_add()])),
      t1469,
    ),
    t1470,
  )
  let t1472 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1471]),
  )
  let t1473 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1472]),
  )
  hd_poly_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) → HD(poly_add(p1, p2)) == HD(p1) + HD(p2)"),
      t1473,
    ),
  )
}

///|
let hd_poly_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_POLY_ADD")

///|
/// `HD_POLY_ADD`
pub fn hd_poly_add() -> @kernel.Thm {
  hd_poly_add_c.get()
}

///|
/// HD_POLY_CMUL
fn step_125() -> Unit raise {
  let t1474 = @simp.simp_tac(
    @list.List([@lists.not_cons_nil(), poly_cmul(), @lists.hd()]),
  )
  let t1475 = @list.List([@simp.simp_tac(@list.List([])), t1474])
  let t1476 = @tactics.thenl(
    @tactics.then_tac(@tactics.strip_tac, @lists.list_induct_tac),
    t1475,
  )
  hd_poly_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ p : List[Real], !(p == NIL) → HD(poly_cmul(x, p)) == x * HD(p)"),
      t1476,
    ),
  )
}

///|
let hd_poly_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_POLY_CMUL")

///|
/// `HD_POLY_CMUL`
pub fn hd_poly_cmul() -> @kernel.Thm {
  hd_poly_cmul_c.get()
}

///|
/// TL_POLY_CMUL
fn step_126() -> Unit raise {
  let t1477 = @simp.simp_tac(
    @list.List([@lists.not_cons_nil(), poly_cmul(), @lists.tl()]),
  )
  let t1478 = @list.List([@simp.simp_tac(@list.List([])), t1477])
  let t1479 = @tactics.thenl(
    @tactics.then_tac(@tactics.strip_tac, @lists.list_induct_tac),
    t1478,
  )
  tl_poly_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ p : List[Real], !(p == NIL) → TL(poly_cmul(x, p)) == poly_cmul(x, TL(p))"),
      t1479,
    ),
  )
}

///|
let tl_poly_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TL_POLY_CMUL")

///|
/// `TL_POLY_CMUL`
pub fn tl_poly_cmul() -> @kernel.Thm {
  tl_poly_cmul_c.get()
}

///|
/// HD_POLY_MUL
fn step_127() -> Unit raise {
  let t1481 = @tactics.then_tac(
    @simp.asm_simp_tac(
      @list.List([poly_cmul(), poly_add(), @lists.not_cons_nil(), @lists.hd()]),
    ),
    @calc_rat.real_arith_tac,
  )
  let t1482 = @list.List([
    @simp.asm_simp_tac(@list.List([poly_cmul(), @lists.hd()])),
    t1481,
  ])
  let t1480 = @class.asm_cases_tac(@term_syntax.parse_term("(t : List[Real]) == NIL"))
  let t1483 = @tactics.thenl(
    @tactics.then_tac(
      @simp.simp_tac(@list.List([@lists.not_cons_nil(), poly_mul()])),
      t1480,
    ),
    t1482,
  )
  let t1484 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1483]),
  )
  let t1485 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([])), t1484]),
  )
  hd_poly_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], !(p1 == NIL) && !(p2 == NIL) → HD(poly_mul(p1, p2)) == HD(p1) * HD(p2)"),
      t1485,
    ),
  )
}

///|
let hd_poly_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_POLY_MUL")

///|
/// `HD_POLY_MUL`
pub fn hd_poly_mul() -> @kernel.Thm {
  hd_poly_mul_c.get()
}

///|
/// HD_POLY_EXP
fn step_128() -> Unit raise {
  let t1489 = @tactics.then_tac(
    @simp.asm_simp_tac(
      @list.List([
        not_poly_cmul_nil(),
        not_poly_exp_nil(),
        @lists.not_cons_nil(),
        hd_poly_add(),
        @lists.hd(),
        hd_poly_cmul(),
        @equal.gsym(@analysis.pow()),
      ]),
    ),
    @calc_rat.real_arith_tac,
  )
  let t1490 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        hd_poly_cmul(),
        not_poly_cmul_nil(),
        not_poly_exp_nil(),
        @lists.not_cons_nil(),
        @lists.hd(),
        @equal.gsym(@analysis.pow()),
      ]),
    ),
    t1489,
  ])
  let t1488 = @class.asm_cases_tac(@term_syntax.parse_term("(t : List[Real]) == NIL"))
  let t1491 = @tactics.thenl(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @lists.hd(),
          @equal.gsym(@analysis.pow()),
          @lists.not_cons_nil(),
          poly_mul(),
        ]),
      ),
      t1488,
    ),
    t1490,
  )
  let t1492 = @list.List([@simp.simp_tac(@list.List([])), t1491])
  let t1493 = @tactics.thenl(
    @tactics.then_tac(
      @simp.simp_tac(@list.List([poly_exp()])),
      @lists.list_induct_tac,
    ),
    t1492,
  )
  let t1486 = @simp.simp_tac(@list.List([@lists.hd(), @analysis.pow()]))
  let t1487 = @list.List([@simp.simp_tac(@list.List([])), t1486])
  let t1494 = @tactics.thenl(
    @nums.induct_tac,
    @list.List([
      @tactics.thenl(
        @tactics.then_tac(
          @simp.simp_tac(@list.List([poly_exp()])),
          @lists.list_induct_tac,
        ),
        t1487,
      ),
      t1493,
    ]),
  )
  hd_poly_exp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ p : List[Real], !(p == NIL) → HD(poly_exp(p, n)) == pow(HD(p), n)"),
      t1494,
    ),
  )
}

///|
let hd_poly_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_POLY_EXP")

///|
/// `HD_POLY_EXP`
pub fn hd_poly_exp() -> @kernel.Thm {
  hd_poly_exp_c.get()
}

///|
/// POLY_ADD_IDENT
fn step_129() -> Unit raise {
  let l1 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ x : List[Real], (∀ y : List[Real], poly_add(x, y) == y && poly_add(y, x) == y) → (∀ y : List[Real], poly_add(CONS((h : Real), (t : List[Real])), y) == y && poly_add(y, CONS(h, t)) == y)"),
  )
  let l2 = @bool.spec(@term_syntax.parse_term("(NIL : List[Real])"), l1)
  let l3 = @simp.simp_rule(@list.List([poly_add_clauses()]))(l2)
  let l4 = @bool.spec(@term_syntax.parse_term("(NIL : List[Real])"), l3)
  let l5 = @bool.conjunct1(l4)
  let l6 = @simp.simp_rule(
    @list.List([poly_add_clauses(), @lists.not_cons_nil()]),
  )(l5)
  let l7 = @bool.not_intro(@bool.disch_all(l6))
  let t1495 = @simp.simp_tac(@list.List([l7]))
  let t1496 = @list.List([@simp.simp_tac(@list.List([])), t1495])
  let t1497 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@iterate.neutral()])),
        @canon.select_elim_tac,
      ),
      @lists.list_induct_tac,
    ),
    t1496,
  )
  poly_add_ident_c.set(
    @tactics.prove(@term_syntax.parse_term("neutral(poly_add) == NIL"), t1497),
  )
}

///|
let poly_add_ident_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_ADD_IDENT")

///|
/// `POLY_ADD_IDENT`
pub fn poly_add_ident() -> @kernel.Thm {
  poly_add_ident_c.get()
}

///|
/// POLY_ADD_NEUTRAL
fn step_130() -> Unit raise {
  let t1498 = @simp.simp_tac(@list.List([poly_add_ident(), poly_add_clauses()]))
  poly_add_neutral_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : List[Real], poly_add(neutral(poly_add), x) == x"), t1498),
  )
}

///|
let poly_add_neutral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ADD_NEUTRAL",
)

///|
/// `POLY_ADD_NEUTRAL`
pub fn poly_add_neutral() -> @kernel.Thm {
  poly_add_neutral_c.get()
}

///|
/// MONOIDAL_POLY_ADD
fn step_131() -> Unit raise {
  let lem1 = @bool.conj(
    poly_add_sym(),
    @bool.conj(poly_add_assoc(), poly_add_neutral()),
  )
  let t1499 = @tactics.accept_tac(lem1)
  let t1500 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@iterate.monoidal()])),
    t1499,
  )
  monoidal_poly_add_c.set(
    @tactics.prove(@term_syntax.parse_term("monoidal(poly_add)"), t1500),
  )
}

///|
let monoidal_poly_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MONOIDAL_POLY_ADD",
)

///|
/// `MONOIDAL_POLY_ADD`
pub fn monoidal_poly_add() -> @kernel.Thm {
  monoidal_poly_add_c.get()
}

///|
/// POLY_DIFF_AUX_ADD_LEMMA
fn step_132() -> Unit raise {
  let lem = @calc_rat.real_arith(
    @term_syntax.parse_term("∀ n : Num, ∀ h : Real, ∀ h' : Real, real_of_num(n) * h + real_of_num(n) * h' == real_of_num(n) * (h + h')"),
  )
  let t1506 = @simp.asm_simp_tac(@list.List([]))
  let t1505 = @simp.once_rewrite_tac(@list.List([lem]))
  let t1504 = @simp.once_rewrite_tac(@list.List([poly_add_clauses()]))
  let t1503 = @simp.once_rewrite_tac(@list.List([poly_diff_aux()]))
  let t1502 = @simp.once_rewrite_tac(@list.List([poly_add_clauses()]))
  let t1501 = @simp.simp_tac(@list.List([poly_add_clauses(), poly_diff_aux()]))
  let t1507 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @lists.list_induct_tac,
                    @simp.simp_tac(
                      @list.List([poly_add_clauses(), poly_diff_aux()]),
                    ),
                  ),
                  @lists.list_induct_tac,
                ),
                t1501,
              ),
              @tactics.strip_tac,
            ),
            t1502,
          ),
          t1503,
        ),
        t1504,
      ),
      t1505,
    ),
    t1506,
  )
  poly_diff_aux_add_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : List[Real], ∀ t2 : List[Real], ∀ n : Num, poly_diff_aux(n, poly_add(t1, t2)) == poly_add(poly_diff_aux(n, t1), poly_diff_aux(n, t2))"),
      t1507,
    ),
  )
}

///|
let poly_diff_aux_add_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_ADD_LEMMA",
)

///|
/// `POLY_DIFF_AUX_ADD_LEMMA`
pub fn poly_diff_aux_add_lemma() -> @kernel.Thm {
  poly_diff_aux_add_lemma_c.get()
}

///|
/// POLYDIFF_ADD
fn step_133() -> Unit raise {
  let t1508 = @simp.simp_tac(
    @list.List([poly_add_clauses(), @lists.not_cons_nil()]),
  )
  let lem1 = @tactics.prove(
    @term_syntax.parse_term("∀ h0 : Real, ∀ t0 : List[Real], ∀ h1 : Real, ∀ t1 : List[Real], !(poly_add(CONS(h0, t0), CONS(h1, t1)) == NIL)"),
    t1508,
  )
  let t1512 = @simp.simp_tac(@list.List([]))
  let t1511 = @simp.rewrite_tac(@list.List([@lists.tl()]))
  let t1510 = @simp.once_rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1509 = @simp.rewrite_tac(@list.List([poly_add()]))
  let t1513 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1509),
        t1510,
      ),
      t1511,
    ),
    t1512,
  )
  let lem2 = @tactics.prove(
    @term_syntax.parse_term("∀ h0 : Real, ∀ t0 : List[Real], ∀ h1 : Real, ∀ t1 : List[Real], TL(poly_add(CONS(h0, t0), CONS(h1, t1))) == poly_add(TL(CONS(h0, t0)), TL(CONS(h1, t1)))"),
    t1513,
  )
  let t1515 = @simp.simp_tac(@list.List([lem2, poly_diff_aux_add_lemma()]))
  let t1514 = @simp.once_rewrite_tac(@list.List([lem1, @lists.not_cons_nil()]))
  let t1516 = @tactics.then_tac(
    @tactics.then_tac(@simp.simp_tac(@list.List([poly_diff()])), t1514),
    t1515,
  )
  let t1517 = @simp.simp_tac(
    @list.List([poly_add(), poly_diff(), poly_add_clauses()]),
  )
  let t1518 = @simp.simp_tac(@list.List([poly_add(), poly_diff()]))
  let t1519 = @list.List([
    @simp.simp_tac(@list.List([poly_add(), poly_diff()])),
    t1518,
    t1517,
    t1516,
  ])
  let t1520 = @tactics.thenl(@tactics.repeat_tac(@lists.list_induct_tac), t1519)
  polydiff_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p1 : List[Real], ∀ p2 : List[Real], poly_diff(poly_add(p1, p2)) == poly_add(poly_diff(p1), poly_diff(p2))"),
      t1520,
    ),
  )
}

///|
let polydiff_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYDIFF_ADD")

///|
/// `POLYDIFF_ADD`
pub fn polydiff_add() -> @kernel.Thm {
  polydiff_add_c.get()
}

///|
/// POLY_DIFF_AUX_POLY_CMUL
fn step_134() -> Unit raise {
  let lem01 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ c : Real, ∀ n : Num, poly_diff_aux(n, poly_cmul(c, (t : List[Real]))) == poly_cmul(c, poly_diff_aux(n, t))"),
  )
  let t1521 = @term_syntax.parse_term("SUC((n : Num))")
  let lem02 = @bool.specl(
    @list.List([@term_syntax.parse_term("(c : Real)"), t1521]),
    lem01,
  )
  let t1522 = @simp.simp_tac(
    @list.List([
      poly_cmul(),
      poly_diff_aux(),
      lem02,
      @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == b * (a * c)")),
    ]),
  )
  let t1523 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@lists.list_induct_tac, @tactics.strip_tac),
      @tactics.strip_tac,
    ),
    t1522,
  )
  poly_diff_aux_poly_cmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ c : Real, ∀ n : Num, poly_diff_aux(n, poly_cmul(c, p)) == poly_cmul(c, poly_diff_aux(n, p))"),
      t1523,
    ),
  )
}

///|
let poly_diff_aux_poly_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_DIFF_AUX_POLY_CMUL",
)

///|
/// `POLY_DIFF_AUX_POLY_CMUL`
pub fn poly_diff_aux_poly_cmul() -> @kernel.Thm {
  poly_diff_aux_poly_cmul_c.get()
}

///|
/// POLY_CMUL_POLY_DIFF
fn step_135() -> Unit raise {
  let t1524 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.simp_tac(
      @list.List([
        poly_diff(),
        poly_diff_aux_poly_cmul(),
        tl_poly_cmul(),
        poly_cmul(),
        @lists.not_cons_nil(),
      ]),
    ),
  )
  poly_cmul_poly_diff_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ c : Real, poly_diff(poly_cmul(c, p)) == poly_cmul(c, poly_diff(p))"),
      t1524,
    ),
  )
}

///|
let poly_cmul_poly_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_CMUL_POLY_DIFF",
)

///|
/// `POLY_CMUL_POLY_DIFF`
pub fn poly_cmul_poly_diff() -> @kernel.Thm {
  poly_cmul_poly_diff_c.get()
}

///|
/// POLY_CMUL_LENGTH
fn step_136() -> Unit raise {
  let t1525 = @simp.asm_simp_tac(@list.List([@lists.length()]))
  let t1526 = @tactics.then_tac(
    @simp.simp_tac(@list.List([poly_cmul()])),
    t1525,
  )
  let t1527 = @list.List([@simp.simp_tac(@list.List([poly_cmul()])), t1526])
  let t1528 = @tactics.thenl(
    @tactics.then_tac(@tactics.strip_tac, @lists.list_induct_tac),
    t1527,
  )
  poly_cmul_length_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Real, ∀ p : List[Real], LENGTH(poly_cmul(c, p)) == LENGTH(p)"),
      t1528,
    ),
  )
}

///|
let poly_cmul_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_CMUL_LENGTH",
)

///|
/// `POLY_CMUL_LENGTH`
pub fn poly_cmul_length() -> @kernel.Thm {
  poly_cmul_length_c.get()
}

///|
/// POLY_ADD_LENGTH
fn step_137() -> Unit raise {
  let t1534 = @simp.asm_simp_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("!((x : Num) > (y : Num)) → !(SUC(x) > SUC(y))")),
    ]),
  )
  let t1535 = @list.List([
    @simp.asm_simp_tac(
      @list.List([
        @int.arith_rule(@term_syntax.parse_term("(x : Num) > (y : Num) → SUC(x) > SUC(y)")),
      ]),
    ),
    t1534,
  ])
  let t1533 = @class.asm_cases_tac(
    @term_syntax.parse_term("LENGTH((t : List[Real])) > LENGTH((t' : List[Real]))"),
  )
  let t1532 = @simp.once_rewrite_tac(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("MAX((x : Num), (y : Num)) == (if x > y { x } else { y })")),
    ]),
  )
  let t1531 = @simp.asm_simp_tac(@list.List([]))
  let t1530 = @simp.simp_tac(
    @list.List([@lists.hd(), @lists.tl(), @lists.length()]),
  )
  let t1529 = @simp.once_rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t1536 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.simp_tac(@list.List([poly_add(), @lists.length()])),
              t1529,
            ),
            t1530,
          ),
          t1531,
        ),
        t1532,
      ),
      t1533,
    ),
    t1535,
  )
  let t1537 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([
      @tactics.then_tac(
        @simp.simp_tac(@list.List([poly_add(), @lists.length()])),
        @int.arith_tac,
      ),
      t1536,
    ]),
  )
  let t1538 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([
      @tactics.then_tac(
        @simp.simp_tac(@list.List([poly_add(), @lists.length()])),
        @int.arith_tac,
      ),
      t1537,
    ]),
  )
  poly_add_length_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ q : List[Real], LENGTH(poly_add(p, q)) == MAX(LENGTH(p), LENGTH(q))"),
      t1538,
    ),
  )
}

///|
let poly_add_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_ADD_LENGTH",
)

///|
/// `POLY_ADD_LENGTH`
pub fn poly_add_length() -> @kernel.Thm {
  poly_add_length_c.get()
}

///|
/// POLY_MUL_LENGTH
fn step_138() -> Unit raise {
  let lemma01 = @kernel.assume_rule(
    @term_syntax.parse_term("∀ h : Real, ∀ t' : List[Real], LENGTH(poly_mul((t : List[Real]), CONS(h, t'))) >= LENGTH(t)"),
  )
  let t1539 = @term_syntax.parse_term("(t' : List[Real])")
  let lemma02 = @bool.specl(
    @list.List([@term_syntax.parse_term("(h' : Real)"), t1539]),
    lemma01,
  )
  let lemma03 = @simp.once_rewrite_rule(
    @list.List([
      @int.arith_rule(@term_syntax.parse_term("((x : Num) >= (y : Num)) == (SUC(x) >= SUC(y))")),
    ]),
  )(lemma02)
  let lemma05 = @int.arith_rule(
    @term_syntax.parse_term("(y : Num) >= (z : Num) → (x : Num) + (y - x) >= z"),
  )
  let t1542 = @bool.gen_all(lemma05)
  let t1540 = @term_syntax.parse_term("SUC(LENGTH((t : List[Real])))")
  let t1541 = @term_syntax.parse_term("LENGTH(poly_cmul((h : Real), CONS((h' : Real), (t' : List[Real]))))")
  let lemma06 = @bool.specl(
    @list.List([
      @term_syntax.parse_term("SUC(LENGTH(poly_mul((t : List[Real]), CONS((h' : Real), (t' : List[Real])))))"),
      t1541,
      t1540,
    ]),
    t1542,
  )
  let lemma07 = @drule.match_mp(lemma06)(lemma03)
  let t1544 = @simp.asm_simp_tac(
    @list.List([
      poly_add_length(),
      @lists.length(),
      lemma07,
      @int.arith_rule(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, MAX(x, y) == x + (y - x)")),
    ]),
  )
  let t1545 = @list.List([
    @tactics.then_tac(
      @simp.asm_simp_tac(@list.List([poly_cmul_length(), @lists.length()])),
      @int.arith_tac,
    ),
    t1544,
  ])
  let t1543 = @class.asm_cases_tac(@term_syntax.parse_term("(t : List[Real]) == NIL"))
  let t1546 = @tactics.thenl(
    @tactics.then_tac(@simp.simp_tac(@list.List([poly_mul()])), t1543),
    t1545,
  )
  let t1547 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([
      @tactics.then_tac(
        @simp.simp_tac(@list.List([poly_mul_clauses()])),
        @int.arith_tac,
      ),
      t1546,
    ]),
  )
  poly_mul_length_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ h : Real, ∀ t : List[Real], LENGTH(poly_mul(p, CONS(h, t))) >= LENGTH(p)"),
      t1547,
    ),
  )
}

///|
let poly_mul_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_MUL_LENGTH",
)

///|
/// `POLY_MUL_LENGTH`
pub fn poly_mul_length() -> @kernel.Thm {
  poly_mul_length_c.get()
}

///|
/// POLY_EXP_X_REC
fn step_139() -> Unit raise {
  let t1548 = @bool.spec(@term_syntax.parse_term("SUC((n : Num))"), not_poly_exp_x_nil())
  let lem01 = @drule.match_mp(@lists.cons_hd_tl())(t1548)
  let lem02 = @simp.once_rewrite_rule(
    @list.List([hd_poly_exp_x_suc(), tl_poly_exp_x_suc()]),
  )(lem01)
  let t1549 = @tactics.accept_tac(@bool.gen_all(lem02))
  poly_exp_x_rec_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, poly_exp([real_of_num(0), real_of_num(1)], SUC(n)) == CONS(real_of_num(0), poly_exp([real_of_num(0), real_of_num(1)], n))"),
      t1549,
    ),
  )
}

///|
let poly_exp_x_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_EXP_X_REC")

///|
/// `POLY_EXP_X_REC`
pub fn poly_exp_x_rec() -> @kernel.Thm {
  poly_exp_x_rec_c.get()
}

///|
/// POLY_MUL_LENGTH2
fn step_140() -> Unit raise {
  let t1550 = @tactics.then_tac(
    @lists.list_induct_tac,
    @simp.simp_tac(@list.List([@lists.not_cons_nil(), poly_mul_length()])),
  )
  poly_mul_length2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ q : List[Real], ∀ p : List[Real], !(q == NIL) → LENGTH(poly_mul(p, q)) >= LENGTH(p)"),
      t1550,
    ),
  )
}

///|
let poly_mul_length2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_MUL_LENGTH2",
)

///|
/// `POLY_MUL_LENGTH2`
pub fn poly_mul_length2() -> @kernel.Thm {
  poly_mul_length2_c.get()
}

///|
/// POLY_EXP_X_LENGTH
fn step_141() -> Unit raise {
  let t1551 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_simp_tac(
      @list.List([
        poly_exp(),
        @lists.length(),
        poly_exp_x_rec(),
        @int.arith_rule(@term_syntax.parse_term("(SUC((x : Num)) == SUC((y : Num))) == (x == y)")),
      ]),
    ),
  )
  poly_exp_x_length_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, LENGTH(poly_exp([real_of_num(0), real_of_num(1)], n)) == SUC(n)"),
      t1551,
    ),
  )
}

///|
let poly_exp_x_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "POLY_EXP_X_LENGTH",
)

///|
/// `POLY_EXP_X_LENGTH`
pub fn poly_exp_x_length() -> @kernel.Thm {
  poly_exp_x_length_c.get()
}

///|
/// POLY_SUM_EQUIV
fn step_142() -> Unit raise {
  let lem000 = @int.arith_rule(
    @term_syntax.parse_term("0 <= 0 + 1 && 0 <= LENGTH((t : List[Real]))"),
  )
  let t1552 = @term_syntax.parse_term("LENGTH((t : List[Real]))")
  let t1553 = @term_syntax.parse_term("0")
  let t1554 = @term_syntax.parse_term("0")
  let lem001 = @bool.specl(
    @list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t1554, t1553, t1552]),
    @iterate.sum_combine_r(),
  )
  let lem002 = @bool.mp(lem001, lem000)
  let t1555 = @term_syntax.parse_term("LENGTH((t : List[Real]))")
  let t1556 = @term_syntax.parse_term("1")
  let lem003 = @bool.specl(
    @list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t1556, t1555]),
    @iterate.sum_offset_0(),
  )
  let lem004 = @kernel.assume_rule(@term_syntax.parse_term("!((t : List[Real]) == NIL)"))
  let lem005 = @simp.once_rewrite_rule(
    @list.List([@equal.gsym(@lists.length_eq_nil())]),
  )(lem004)
  let lem006 = @simp.once_rewrite_rule(
    @list.List([@int.arith_rule(@term_syntax.parse_term("!((x : Num) == 0) == (1 <= x)"))]),
  )(lem005)
  let lem007 = @bool.mp(lem003, lem006)
  let lem017 = @int.arith_rule(
    @term_syntax.parse_term("1 <= LENGTH((t : List[Real])) → LENGTH(t) - 1 == PRE(LENGTH(t))"),
  )
  let lem018 = @bool.mp(lem017, lem006)
  let t1578 = @simp.simp_tac(@list.List([]))
  let t1577 = @simp.once_rewrite_tac(@list.List([lem018]))
  let t1576 = @simp.simp_tac(@list.List([@lists.not_cons_nil()]))
  let t1575 = @simp.asm_simp_tac(@list.List([]))
  let t1574 = @simp.once_rewrite_tac(@list.List([@iterate.sum_lmul()]))
  let t1573 = @simp.once_rewrite_tac(@list.List([@iterate.nsum_lmul()]))
  let t1572 = @simp.once_rewrite_tac(
    @list.List([
      @calc_rat.real_arith(@term_syntax.parse_term("(A : Real) * ((B : Real) * (C : Real)) == B * (A * C)")),
    ]),
  )
  let t1571 = @simp.once_rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t1570 = @simp.once_rewrite_tac(@list.List([@realax.real_pow()]))
  let t1569 = @simp.simp_tac(@list.List([@lists.el(), @lists.tl()]))
  let t1568 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t1567 = @simp.once_rewrite_tac(@list.List([lem007]))
  let t1566 = @simp.simp_tac(@list.List([@lists.el(), @lists.hd()]))
  let t1565 = @simp.once_rewrite_tac(@list.List([@iterate.sum_sing()]))
  let t1564 = @simp.once_rewrite_tac(
    @list.List([@iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(0, 0)"))]),
  )
  let t1563 = @simp.once_rewrite_tac(
    @list.List([@int.arith_rule(@term_syntax.parse_term("0 + 1 == 1"))]),
  )
  let t1562 = @simp.once_rewrite_tac(@list.List([@equal.gsym(lem002)]))
  let t1561 = @simp.once_rewrite_tac(@list.List([poly()]))
  let t1579 = @tactics.then_tac(
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
                                          @simp.asm_simp_tac(
                                            @list.List([
                                              poly_const(),
                                              @lists.length(),
                                              @arith.pre(),
                                            ]),
                                          ),
                                          t1561,
                                        ),
                                        t1562,
                                      ),
                                      t1563,
                                    ),
                                    t1564,
                                  ),
                                  t1565,
                                ),
                                @tactics.beta_tac,
                              ),
                              t1566,
                            ),
                            t1567,
                          ),
                          @tactics.beta_tac,
                        ),
                        t1568,
                      ),
                      t1569,
                    ),
                    t1570,
                  ),
                  t1571,
                ),
                t1572,
              ),
              t1573,
            ),
            t1574,
          ),
          t1575,
        ),
        t1576,
      ),
      t1577,
    ),
    t1578,
  )
  let t1560 = @simp.once_rewrite_tac(@list.List([@lists.hd()]))
  let t1559 = @simp.once_rewrite_tac(@list.List([@lists.el()]))
  let t1558 = @simp.once_rewrite_tac(@list.List([@iterate.sum_sing()]))
  let t1557 = @simp.once_rewrite_tac(
    @list.List([@iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(0, 0)"))]),
  )
  let t1580 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.asm_simp_tac(
                  @list.List([poly_const(), @lists.length(), @arith.pre()]),
                ),
                t1557,
              ),
              t1558,
            ),
            @tactics.beta_tac,
          ),
          t1559,
        ),
        t1560,
      ),
      @calc_rat.real_arith_tac,
    ),
    t1579,
  ])
  let t1581 = @tactics.thenl(
    @class.asm_cases_tac(@term_syntax.parse_term("(t : List[Real]) == NIL")),
    t1580,
  )
  let t1582 = @tactics.thenl(
    @lists.list_induct_tac,
    @list.List([@simp.simp_tac(@list.List([@lists.not_cons_nil()])), t1581]),
  )
  poly_sum_equiv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[Real], ∀ x : Real, !(p == NIL) → poly(p, x) == sum(op_dot_dot(0, PRE(LENGTH(p))), (i : Num) => EL(i, p) * pow(x, i))"),
      t1582,
    ),
  )
}

///|
let poly_sum_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_SUM_EQUIV")

///|
/// `POLY_SUM_EQUIV`
pub fn poly_sum_equiv() -> @kernel.Thm {
  poly_sum_equiv_c.get()
}

///|
/// ITERATE_RADD_POLYADD
fn step_143() -> Unit raise {
  let t1583 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_simp_tac(
      @list.List([
        @iterate.iterate_clauses_numseg(),
        @iterate.monoidal_real_add(),
        monoidal_poly_add(),
        @arith.le_0(),
        poly_add_v1(),
      ]),
    ),
  )
  iterate_radd_polyadd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : Real, ∀ f : (Num) -> List[Real], iterate(op_plus, op_dot_dot(0, n), (i : Num) => poly(f(i), x)) == poly(iterate(poly_add, op_dot_dot(0, n), f), x)"),
      t1583,
    ),
  )
}

///|
let iterate_radd_polyadd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ITERATE_RADD_POLYADD",
)

///|
/// `ITERATE_RADD_POLYADD`
pub fn iterate_radd_polyadd() -> @kernel.Thm {
  iterate_radd_polyadd_c.get()
}

///|
/// Library/poly.ml:1685
fn step_144() -> Unit raise {
  let t1585 = ("diff", @term_syntax.parse_term("poly_diff"))
  let t1586 = (
    "exp",
    @term_syntax.parse_term("poly_exp"),
  )
  @lib.do_list(
    fn(x1584 : (String, @kernel.Term)) -> Unit raise {
      @preterm.reduce_interface(x1584.0, x1584.1)
    },
    @list.List([
      ("divides", @term_syntax.parse_term("poly_divides")),
      t1586,
      t1585,
    ]),
  )
}

///|
/// Library/poly.ml:1690
fn step_145() -> Unit raise {
  @printer.unparse_as_infix("exp")
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
}
