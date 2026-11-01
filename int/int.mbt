// Translated from upstream int.ml; edit this file directly.

///|
/// integer
fn step_1() -> Unit raise {
  integer_c.set(
    @pair.new_definition(@term_syntax.parse_term("(integer : (Real) -> Bool)((x : Real)) == (∃ n : Num, abs(x) == real_of_num(n))")),
  )
}

///|
let integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("integer")

///|
/// `integer`
pub fn integer() -> @kernel.Thm {
  integer_c.get()
}

///|
/// is_int
fn step_2() -> Unit raise {
  let t1 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([integer()])),
        @tactics.ap_term_tac,
      ),
      @tactics.abs_tac,
    ),
    @calc_rat.real_arith_tac,
  )
  is_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("integer((x : Real)) == (∃ n : Num, x == real_of_num(n) || x == -real_of_num(n))"),
      t1,
    ),
  )
}

///|
let is_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_int")

///|
/// `is_int`
pub fn is_int() -> @kernel.Thm {
  is_int_c.get()
}

///|
/// int_tybij
fn step_3() -> Unit raise {
  let t2 = @simp.rewrite_tac(
    @list.List([
      is_int(),
      @realax.real_of_num_eq(),
      @theorems.exists_or_thm(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t3 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")), t2)
  int_tybij_c.set(
    @class.new_type_definition(
      "int",
      ("int_of_real", "real_of_int"),
      @tactics.prove(@term_syntax.parse_term("∃ x : Real, integer(x)"), t3),
    ),
  )
}

///|
let int_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_tybij")

///|
/// `int_tybij`
pub fn int_tybij() -> @kernel.Thm {
  int_tybij_c.get()
}

///|
let int_abstr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_abstr")

///|
/// `int_abstr`
pub fn int_abstr() -> @kernel.Thm {
  int_abstr_c.get()
}

///|
let int_rep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_rep")

///|
/// `int_rep`
pub fn int_rep() -> @kernel.Thm {
  int_rep_c.get()
}

///|
/// int_abstr, int_rep
fn step_4() -> Unit raise {
  let t4 = @bool.spec_all(@bool.conjunct2(int_tybij()))
  let (int_abstr, int_rep) = (@bool.spec_all(@bool.conjunct1(int_tybij())), t4)
  int_abstr_c.set(int_abstr)
  int_rep_c.set(int_rep)
}

///|
/// dest_int_rep
fn step_5() -> Unit raise {
  let t5 = @simp.rewrite_tac(
    @list.List([@equal.gsym(is_int()), int_rep(), int_abstr()]),
  )
  dest_int_rep_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ i : Int, ∃ n : Num, real_of_int(i) == real_of_num(n) || real_of_int(i) == -real_of_num(n)"),
      t5,
    ),
  )
}

///|
let dest_int_rep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dest_int_rep")

///|
/// `dest_int_rep`
pub fn dest_int_rep() -> @kernel.Thm {
  dest_int_rep_c.get()
}

///|
/// INTEGER_REAL_OF_INT
fn step_6() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([int_tybij()]))
  integer_real_of_int_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, integer(real_of_int(x))"), t6),
  )
}

///|
let integer_real_of_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INTEGER_REAL_OF_INT",
)

///|
/// `INTEGER_REAL_OF_INT`
pub fn integer_real_of_int() -> @kernel.Thm {
  integer_real_of_int_c.get()
}

///|
/// int_eq
fn step_7() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t11 = @term_syntax.parse_term("int_of_real")
  let t14 = @tactics.pop_assum(fn(
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
    (fn(
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
      let s9 = @tactics.mp_tac(x8)
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
    })(((x12 : @kernel.Thm) => @equal.ap_term(t11, x12))(x13))
  })
  let t7 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.eq_tac,
          ),
          @tactics.disch_tac,
        ),
        t7,
      ),
      t14,
    ),
    t15,
  )
  int_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (x == y) == (real_of_int(x) == real_of_int(y))"),
      t16,
    ),
  )
}

///|
let int_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_eq")

///|
/// `int_eq`
pub fn int_eq() -> @kernel.Thm {
  int_eq_c.get()
}

///|
/// int.ml:61
fn step_8() -> Unit raise {
  let t18 = ("&", @term_syntax.parse_term("(int_of_num : (Num) -> Int)"))
  let t19 = ("min", @term_syntax.parse_term("(int_min : (Int, Int) -> Int)"))
  let t20 = ("max", @term_syntax.parse_term("(int_max : (Int, Int) -> Int)"))
  let t21 = ("abs", @term_syntax.parse_term("(int_abs : (Int) -> Int)"))
  let t22 = ("pow", @term_syntax.parse_term("(int_pow : (Int, Num) -> Int)"))
  let t23 = ("--", @term_syntax.parse_term("(int_neg : (Int) -> Int)"))
  let t24 = (">=", @term_syntax.parse_term("(int_ge : (Int, Int) -> Bool)"))
  let t25 = (">", @term_syntax.parse_term("(int_gt : (Int, Int) -> Bool)"))
  let t26 = ("<=", @term_syntax.parse_term("(int_le : (Int, Int) -> Bool)"))
  let t27 = ("<", @term_syntax.parse_term("(int_lt : (Int, Int) -> Bool)"))
  let t28 = ("*", @term_syntax.parse_term("(int_mul : (Int, Int) -> Int)"))
  let t29 = ("-", @term_syntax.parse_term("(int_sub : (Int, Int) -> Int)"))
  @lib.do_list(
    fn(x17 : (String, @kernel.Term)) -> Unit raise {
      @preterm.overload_interface(x17.0, x17.1)
    },
    @list.List([
      ("+", @term_syntax.parse_term("(int_add : (Int, Int) -> Int)")),
      t29,
      t28,
      t27,
      t26,
      t25,
      t24,
      t23,
      t22,
      t21,
      t20,
      t19,
      t18,
    ]),
  )
}

///|
/// `prioritize_int`
pub fn prioritize_int(x30 : Unit) -> Unit raise {
  let _ = x30
  @preterm.prioritize_overload(@kernel.mk_type("int", @list.List([])))
}

///|
/// int_le
fn step_9() -> Unit raise {
  int_le_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_le : (Int, Int) -> Bool)((x : Int), (y : Int)) == (real_of_int(x) <= real_of_int(y))"),
    ),
  )
}

///|
let int_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_le")

///|
/// `int_le`
pub fn int_le() -> @kernel.Thm {
  int_le_c.get()
}

///|
/// int_lt
fn step_10() -> Unit raise {
  int_lt_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_lt : (Int, Int) -> Bool)((x : Int), (y : Int)) == (real_of_int(x) < real_of_int(y))"),
    ),
  )
}

///|
let int_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_lt")

///|
/// `int_lt`
pub fn int_lt() -> @kernel.Thm {
  int_lt_c.get()
}

///|
/// int_ge
fn step_11() -> Unit raise {
  int_ge_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_ge : (Int, Int) -> Bool)((x : Int), (y : Int)) == (real_of_int(x) >= real_of_int(y))"),
    ),
  )
}

///|
let int_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_ge")

///|
/// `int_ge`
pub fn int_ge() -> @kernel.Thm {
  int_ge_c.get()
}

///|
/// int_gt
fn step_12() -> Unit raise {
  int_gt_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_gt : (Int, Int) -> Bool)((x : Int), (y : Int)) == (real_of_int(x) > real_of_int(y))"),
    ),
  )
}

///|
let int_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_gt")

///|
/// `int_gt`
pub fn int_gt() -> @kernel.Thm {
  int_gt_c.get()
}

///|
/// int_of_num
fn step_13() -> Unit raise {
  int_of_num_c.set(
    @pair.new_definition(@term_syntax.parse_term("(int_of_num : (Num) -> Int)((n : Num)) == int_of_real(real_of_num(n))")),
  )
}

///|
let int_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_of_num")

///|
/// `int_of_num`
pub fn int_of_num() -> @kernel.Thm {
  int_of_num_c.get()
}

///|
/// int_of_num_th
fn step_14() -> Unit raise {
  let t31 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_eq(),
      @theorems.exists_or_thm(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t32 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([int_of_num(), @equal.gsym(int_rep()), is_int()]),
    ),
    t31,
  )
  int_of_num_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, real_of_int(int_of_num(n)) == real_of_num(n)"),
      t32,
    ),
  )
}

///|
let int_of_num_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_of_num_th")

///|
/// `int_of_num_th`
pub fn int_of_num_th() -> @kernel.Thm {
  int_of_num_th_c.get()
}

///|
/// int_neg
fn step_15() -> Unit raise {
  int_neg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_neg : (Int) -> Int)((i : Int)) == int_of_real(-real_of_int(i))"),
    ),
  )
}

///|
let int_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_neg")

///|
/// `int_neg`
pub fn int_neg() -> @kernel.Thm {
  int_neg_c.get()
}

///|
/// int_neg_th
fn step_16() -> Unit raise {
  let t34 = @simp.asm_rewrite_tac(
    @list.List([
      @calc_int.real_neg_neg(),
      @theorems.exists_or_thm(),
      @real.real_eq_neg2(),
      @realax.real_of_num_eq(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t33 = @tactics.strip_assume_tac(
    @bool.spec(@term_syntax.parse_term("(x : Int)"), dest_int_rep()),
  )
  let t35 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([int_neg(), @equal.gsym(int_rep()), is_int()]),
        ),
        @tactics.gen_tac,
      ),
      t33,
    ),
    t34,
  )
  int_neg_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, real_of_int(int_neg(x)) == -real_of_int(x)"),
      t35,
    ),
  )
}

///|
let int_neg_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_neg_th")

///|
/// `int_neg_th`
pub fn int_neg_th() -> @kernel.Thm {
  int_neg_th_c.get()
}

///|
/// int_add
fn step_17() -> Unit raise {
  int_add_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_add : (Int, Int) -> Int)((x : Int), (y : Int)) == int_of_real(real_of_int(x) + real_of_int(y))"),
    ),
  )
}

///|
let int_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_add")

///|
/// `int_add`
pub fn int_add() -> @kernel.Thm {
  int_add_c.get()
}

///|
/// int_add_th
fn step_18() -> Unit raise {
  let t56 = @equal.gsym(@theorems.exists_refl())
  let t57 = @simp.rewrite_tac(
    @list.List([
      @theorems.exists_or_thm(),
      @equal.gsym(@calc_int.real_neg_add()),
      @real.real_eq_neg2(),
      @realax.real_of_num_add(),
      @realax.real_of_num_eq(),
      t56,
    ]),
  )
  let t55 = @tactics.try_tac(
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("(d : Num)")),
      @calc_rat.real_arith_tac,
    ),
  )
  let t54 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@realax.real_of_num_add()),
      @theorems.or_exists_thm(),
      @calc_int.real_neg_add(),
    ]),
  )
  let t53 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(
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
    }),
  )
  let t49 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t46 = @term_syntax.parse_term("(n : Num)")
  let t47 = @bool.specl(
    @list.List([@term_syntax.parse_term("(m : Num)"), t46]),
    @arith.le_cases(),
  )
  let t48 = @tactics.disj_cases_then(fn(
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
  })(t47)
  let t42 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.exists_refl())]),
  )
  let t41 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_of_num_add(),
      @realax.real_of_num_eq(),
      @theorems.exists_or_thm(),
    ]),
  )
  let t39 = @bool.spec(@term_syntax.parse_term("(y : Int)"), dest_int_rep())
  let t40 = @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
    @tactics.disj_cases_tac,
  )(t39)
  let t37 = @bool.spec(@term_syntax.parse_term("(x : Int)"), dest_int_rep())
  let t38 = @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
    @tactics.disj_cases_tac,
  )(t37)
  let t36 = @tactics.repeat_tac(@tactics.gen_tac)
  let t58 = @tactics.then_tac(
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
                            int_add(),
                            @equal.gsym(int_rep()),
                            is_int(),
                          ]),
                        ),
                        t36,
                      ),
                      t38,
                    ),
                    t40,
                  ),
                  t41,
                ),
                t42,
              ),
              t48,
            ),
            t49,
          ),
          t53,
        ),
        t54,
      ),
      t55,
    ),
    t57,
  )
  int_add_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, real_of_int(x + y) == real_of_int(x) + real_of_int(y)"),
      t58,
    ),
  )
}

///|
let int_add_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_add_th")

///|
/// `int_add_th`
pub fn int_add_th() -> @kernel.Thm {
  int_add_th_c.get()
}

///|
/// int_sub
fn step_19() -> Unit raise {
  int_sub_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_sub : (Int, Int) -> Int)((x : Int), (y : Int)) == int_of_real(real_of_int(x) - real_of_int(y))"),
    ),
  )
}

///|
let int_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_sub")

///|
/// `int_sub`
pub fn int_sub() -> @kernel.Thm {
  int_sub_c.get()
}

///|
/// int_sub_th
fn step_20() -> Unit raise {
  let t60 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t59 = @equal.gsym(int_add_th())
  let t61 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([int_sub(), @realax.real_sub(), @equal.gsym(int_neg_th()), t59]),
    ),
    t60,
  )
  int_sub_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, real_of_int(x - y) == real_of_int(x) - real_of_int(y)"),
      t61,
    ),
  )
}

///|
let int_sub_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_sub_th")

///|
/// `int_sub_th`
pub fn int_sub_th() -> @kernel.Thm {
  int_sub_th_c.get()
}

///|
/// int_mul
fn step_21() -> Unit raise {
  int_mul_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_mul : (Int, Int) -> Int)((x : Int), (y : Int)) == int_of_real(real_of_int(x) * real_of_int(y))"),
    ),
  )
}

///|
let int_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_mul")

///|
/// `int_mul`
pub fn int_mul() -> @kernel.Thm {
  int_mul_c.get()
}

///|
/// int_mul_th
fn step_22() -> Unit raise {
  let t69 = @simp.rewrite_tac(
    @list.List([
      @real.real_eq_neg2(),
      @realax.real_of_num_eq(),
      @equal.gsym(@theorems.exists_refl()),
    ]),
  )
  let t68 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_mul_lneg(),
      @calc_int.real_mul_rneg(),
      @calc_int.real_neg_neg(),
      @realax.real_of_num_mul(),
    ]),
  )
  let t67 = @simp.asm_rewrite_tac(
    @list.List([
      @realax.real_of_num_add(),
      @realax.real_of_num_eq(),
      @theorems.exists_or_thm(),
    ]),
  )
  let t65 = @bool.spec(@term_syntax.parse_term("(y : Int)"), dest_int_rep())
  let t66 = @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
    @tactics.disj_cases_tac,
  )(t65)
  let t63 = @bool.spec(@term_syntax.parse_term("(x : Int)"), dest_int_rep())
  let t64 = @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(
    @tactics.disj_cases_tac,
  )(t63)
  let t62 = @simp.rewrite_tac(
    @list.List([int_mul(), @equal.gsym(int_rep()), is_int()]),
  )
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t62),
            t64,
          ),
          t66,
        ),
        t67,
      ),
      t68,
    ),
    t69,
  )
  int_mul_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, real_of_int(x * y) == real_of_int(x) * real_of_int(y)"),
      t70,
    ),
  )
}

///|
let int_mul_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_mul_th")

///|
/// `int_mul_th`
pub fn int_mul_th() -> @kernel.Thm {
  int_mul_th_c.get()
}

///|
/// int_abs
fn step_23() -> Unit raise {
  int_abs_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_abs : (Int) -> Int)((x : Int)) == int_of_real(abs(real_of_int(x)))"),
    ),
  )
}

///|
let int_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_abs")

///|
/// `int_abs`
pub fn int_abs() -> @kernel.Thm {
  int_abs_c.get()
}

///|
/// int_abs_th
fn step_24() -> Unit raise {
  let t71 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_neg()), int_neg_th(), int_abstr()]),
  )
  let t72 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([int_abs(), @realax.real_abs()])),
      ),
      @class.cond_cases_tac,
    ),
    t71,
  )
  int_abs_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, real_of_int(int_abs(x)) == abs(real_of_int(x))"),
      t72,
    ),
  )
}

///|
let int_abs_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_abs_th")

///|
/// `int_abs_th`
pub fn int_abs_th() -> @kernel.Thm {
  int_abs_th_c.get()
}

///|
/// int_sgn
fn step_25() -> Unit raise {
  int_sgn_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_sgn : (Int) -> Int)((x : Int)) == int_of_real(real_sgn(real_of_int(x)))"),
    ),
  )
}

///|
let int_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_sgn")

///|
/// `int_sgn`
pub fn int_sgn() -> @kernel.Thm {
  int_sgn_c.get()
}

///|
/// int_sgn_th
fn step_26() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([is_int()]))
  let t73 = @tactics.repeat_tac(
    @tactics.then_tac(
      @class.cond_cases_tac,
      @simp.asm_rewrite_tac(@list.List([])),
    ),
  )
  let t75 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(
          @list.List([int_sgn(), @real.real_sgn(), @equal.gsym(int_rep())]),
        ),
      ),
      t73,
    ),
    t74,
  )
  int_sgn_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, real_of_int(int_sgn(x)) == real_sgn(real_of_int(x))"),
      t75,
    ),
  )
}

///|
let int_sgn_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_sgn_th")

///|
/// `int_sgn_th`
pub fn int_sgn_th() -> @kernel.Thm {
  int_sgn_th_c.get()
}

///|
/// int_max
fn step_27() -> Unit raise {
  int_max_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_max : (Int, Int) -> Int)((x : Int), (y : Int)) == int_of_real(max(real_of_int(x), real_of_int(y)))"),
    ),
  )
}

///|
let int_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_max")

///|
/// `int_max`
pub fn int_max() -> @kernel.Thm {
  int_max_c.get()
}

///|
/// int_max_th
fn step_28() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t76 = @simp.rewrite_tac(@list.List([int_max(), @realax.real_max()]))
  let t78 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t76),
      @class.cond_cases_tac,
    ),
    t77,
  )
  int_max_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, real_of_int(max(x, y)) == max(real_of_int(x), real_of_int(y))"),
      t78,
    ),
  )
}

///|
let int_max_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_max_th")

///|
/// `int_max_th`
pub fn int_max_th() -> @kernel.Thm {
  int_max_th_c.get()
}

///|
/// int_min
fn step_29() -> Unit raise {
  int_min_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_min : (Int, Int) -> Int)((x : Int), (y : Int)) == int_of_real(min(real_of_int(x), real_of_int(y)))"),
    ),
  )
}

///|
let int_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_min")

///|
/// `int_min`
pub fn int_min() -> @kernel.Thm {
  int_min_c.get()
}

///|
/// int_min_th
fn step_30() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t79 = @simp.rewrite_tac(@list.List([int_min(), @realax.real_min()]))
  let t81 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t79),
      @class.cond_cases_tac,
    ),
    t80,
  )
  int_min_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, real_of_int(min(x, y)) == min(real_of_int(x), real_of_int(y))"),
      t81,
    ),
  )
}

///|
let int_min_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_min_th")

///|
/// `int_min_th`
pub fn int_min_th() -> @kernel.Thm {
  int_min_th_c.get()
}

///|
/// int_pow
fn step_31() -> Unit raise {
  int_pow_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_pow : (Int, Num) -> Int)((x : Int), (n : Num)) == int_of_real(pow(real_of_int(x), n))"),
    ),
  )
}

///|
let int_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_pow")

///|
/// `int_pow`
pub fn int_pow() -> @kernel.Thm {
  int_pow_c.get()
}

///|
/// int_pow_th
fn step_32() -> Unit raise {
  let t87 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(int_mul()), int_mul_th()]),
  )
  let t88 = @tactics.then_tac(
    @tactics.pop_assum(fn(
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
      (fn(
        x83 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s84 = @tactics.subst1_tac(x83)
        fn(
          x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s84(x85)
        }
      })(@equal.sym(x86))
    }),
    t87,
  )
  let t89 = @list.List([
    @simp.rewrite_tac(@list.List([@equal.gsym(int_of_num()), int_of_num_th()])),
    t88,
  ])
  let t82 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t90 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([int_pow()])),
        ),
        @nums.induct_tac,
      ),
      t82,
    ),
    t89,
  )
  int_pow_th_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : Num, real_of_int(int_pow(x, n)) == pow(real_of_int(x), n)"),
      t90,
    ),
  )
}

///|
let int_pow_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_pow_th")

///|
/// `int_pow_th`
pub fn int_pow_th() -> @kernel.Thm {
  int_pow_th_c.get()
}

///|
/// REAL_OF_INT_CLAUSES
fn step_33() -> Unit raise {
  let t91 = @simp.rewrite_tac(
    @list.List([
      int_eq(),
      int_ge(),
      int_gt(),
      int_le(),
      int_lt(),
      int_max_th(),
      int_min_th(),
      int_of_num_th(),
      int_neg_th(),
      int_abs_th(),
      int_max_th(),
      int_min_th(),
      int_sgn_th(),
      int_add_th(),
      int_sub_th(),
      int_mul_th(),
      int_pow_th(),
    ]),
  )
  real_of_int_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Int, ∀ y : Int, (real_of_int(x) == real_of_int(y)) == (x == y)) && (∀ x : Int, ∀ y : Int, (real_of_int(x) >= real_of_int(y)) == (x >= y)) && (∀ x : Int, ∀ y : Int, (real_of_int(x) > real_of_int(y)) == (x > y)) && (∀ x : Int, ∀ y : Int, (real_of_int(x) <= real_of_int(y)) == (x <= y)) && (∀ x : Int, ∀ y : Int, (real_of_int(x) < real_of_int(y)) == (x < y)) && (∀ x : Int, ∀ y : Int, max(real_of_int(x), real_of_int(y)) == real_of_int(max(x, y))) && (∀ x : Int, ∀ y : Int, min(real_of_int(x), real_of_int(y)) == real_of_int(min(x, y))) && (∀ n : Num, real_of_num(n) == real_of_int(int_of_num(n))) && (∀ x : Int, -real_of_int(x) == real_of_int(-x)) && (∀ x : Int, abs(real_of_int(x)) == real_of_int(abs(x))) && (∀ x : Int, ∀ y : Int, max(real_of_int(x), real_of_int(y)) == real_of_int(max(x, y))) && (∀ x : Int, ∀ y : Int, min(real_of_int(x), real_of_int(y)) == real_of_int(min(x, y))) && (∀ x : Int, real_sgn(real_of_int(x)) == real_of_int(int_sgn(x))) && (∀ x : Int, ∀ y : Int, real_of_int(x) + real_of_int(y) == real_of_int(x + y)) && (∀ x : Int, ∀ y : Int, real_of_int(x) - real_of_int(y) == real_of_int(x - y)) && (∀ x : Int, ∀ y : Int, real_of_int(x) * real_of_int(y) == real_of_int(x * y)) && (∀ x : Int, ∀ n : Num, pow(real_of_int(x), n) == real_of_int(pow(x, n)))"),
      t91,
    ),
  )
}

///|
let real_of_int_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_INT_CLAUSES",
)

///|
/// `REAL_OF_INT_CLAUSES`
pub fn real_of_int_clauses() -> @kernel.Thm {
  real_of_int_clauses_c.get()
}

///|
/// INT_IMAGE
fn step_34() -> Unit raise {
  let t108 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_of_num()), int_of_num_th()]),
  )
  let t107 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t106 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t105 = @simp.rewrite_tac(@list.List([int_of_num(), int_neg()]))
  let t104 = @tactics.disch_then(fn(
    x101 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s102 = @tactics.subst1_tac(x101)
    fn(
      x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s102(x103)
    }
  })
  let t100 = @simp.rewrite_tac(@list.List([int_abstr()]))
  let t96 = @term_syntax.parse_term("int_of_real")
  let t99 = @tactics.pop_assum(fn(
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
    (fn(
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
      let s94 = @tactics.mp_tac(x93)
      fn(
        x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s94(x95)
      }
    })(((x97 : @kernel.Thm) => @equal.ap_term(t96, x97))(x98))
  })
  let t92 = @bool.spec(@term_syntax.parse_term("(x : Int)"), dest_int_rep())
  let t109 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(
                      @tactics.disj_cases_tac,
                    )(t92),
                  ),
                  t99,
                ),
                t100,
              ),
              t104,
            ),
            t105,
          ),
          @list.List([@tactics.disj1_tac, @tactics.disj2_tac]),
        ),
        t106,
      ),
      t107,
    ),
    t108,
  )
  int_image_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, (∃ n : Num, x == int_of_num(n)) || (∃ n : Num, x == int_neg(int_of_num(n)))"),
      t109,
    ),
  )
}

///|
let int_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_IMAGE")

///|
/// `INT_IMAGE`
pub fn int_image() -> @kernel.Thm {
  int_image_c.get()
}

///|
/// FORALL_INT_CASES
fn step_35() -> Unit raise {
  let t110 = @meson.meson_tac(@list.List([int_image()]))
  forall_int_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∀ x : Int, P(x)) == ((∀ n : Num, P(int_of_num(n))) && (∀ n : Num, P(-int_of_num(n))))"),
      t110,
    ),
  )
}

///|
let forall_int_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_INT_CASES",
)

///|
/// `FORALL_INT_CASES`
pub fn forall_int_cases() -> @kernel.Thm {
  forall_int_cases_c.get()
}

///|
/// EXISTS_INT_CASES
fn step_36() -> Unit raise {
  let t111 = @meson.meson_tac(@list.List([int_image()]))
  exists_int_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∃ x : Int, P(x)) == ((∃ n : Num, P(int_of_num(n))) || (∃ n : Num, P(-int_of_num(n))))"),
      t111,
    ),
  )
}

///|
let exists_int_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_INT_CASES",
)

///|
/// `EXISTS_INT_CASES`
pub fn exists_int_cases() -> @kernel.Thm {
  exists_int_cases_c.get()
}

///|
/// INT_LT_DISCRETE
fn step_37() -> Unit raise {
  let t135 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.le_suc_lt(), @arith.lt_suc_le()]),
  )
  let t133 = @term_syntax.parse_term("SUC(0)")
  let t134 = @simp.rewrite_tac(
    @list.List([
      @equal.sym(@simp.rewrite_conv(@list.List([@calc_num.arith_suc()]))(t133)),
    ]),
  )
  let t130 = @equal.gsym(@arith.add1())
  let t131 = @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(t130)
  let t132 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), t131]))
  let t129 = @simp.rewrite_tac(
    @list.List([
      @realax.real_of_num_le(),
      @real.real_of_num_lt(),
      @realax.real_of_num_add(),
    ]),
  )
  let t128 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_sub()), @real.real_le_sub_radd()]),
  )
  let t127 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t126 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@realax.real_add_assoc())]),
  )
  let t125 = @simp.rewrite_tac(
    @list.List([
      @calc_int.real_le_lneg(),
      @real.real_lt_lneg(),
      @calc_int.real_le_rneg(),
      @real.real_lt_rneg(),
    ]),
  )
  let t124 = @simp.rewrite_tac(
    @list.List([@calc_int.real_le_neg2(), @real.real_lt_neg2()]),
  )
  let t123 = @simp.rewrite_tac(@list.List([int_neg_th(), int_of_num_th()]))
  let t121 = @bool.spec(@term_syntax.parse_term("(y : Int)"), int_image())
  let t122 = @tactics.disj_cases_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(
      x118 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s119 = @tactics.subst1_tac(x118)
      fn(
        x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s119(x120)
      }
    }),
  )(t121)
  let t116 = @bool.spec(@term_syntax.parse_term("(x : Int)"), int_image())
  let t117 = @tactics.disj_cases_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(
      x113 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s114 = @tactics.subst1_tac(x113)
      fn(
        x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s114(x115)
      }
    }),
  )(t116)
  let t112 = @simp.rewrite_tac(@list.List([int_le(), int_lt(), int_add_th()]))
  let t136 = @tactics.then_tac(
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
                            t112,
                          ),
                          t117,
                        ),
                        t122,
                      ),
                      t123,
                    ),
                    t124,
                  ),
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
        t132,
      ),
      t134,
    ),
    t135,
  )
  int_lt_discrete_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_lt(x, y) == int_le(int_add(x, int_of_num(1)), y)"), t136),
  )
}

///|
let int_lt_discrete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_DISCRETE",
)

///|
/// `INT_LT_DISCRETE`
pub fn int_lt_discrete() -> @kernel.Thm {
  int_lt_discrete_c.get()
}

///|
/// INT_GT_DISCRETE
fn step_38() -> Unit raise {
  let t138 = @tactics.match_accept_tac(int_lt_discrete())
  let t137 = @equal.gsym(int_lt())
  let t139 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        int_gt(),
        int_ge(),
        @realax.real_ge(),
        @realax.real_gt(),
        @equal.gsym(int_le()),
        t137,
      ]),
    ),
    t138,
  )
  int_gt_discrete_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_gt(x, y) == int_ge(x, int_add(y, int_of_num(1)))"), t139),
  )
}

///|
let int_gt_discrete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GT_DISCRETE",
)

///|
/// `INT_GT_DISCRETE`
pub fn int_gt_discrete() -> @kernel.Thm {
  int_gt_discrete_c.get()
}

///|
/// `is_intconst`
pub fn is_intconst(x140 : @kernel.Term) -> Bool raise {
  let tm = x140
  match tm {
    @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), n) =>
      @nums.is_numeral(n)
    @kernel.Term::Comb(
      @kernel.Term::Const("int_neg", _),
      @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), n_1)
    ) =>
      @nums.is_numeral(n_1) &&
      !@num.eq_num(@basics.dest_numeral(n_1), @num.num_0)
    _ => false
  }
}

///|
/// `dest_intconst`
pub fn dest_intconst(x141 : @kernel.Term) -> @num.Num raise {
  let tm = x141
  match tm {
    @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), n) =>
      @basics.dest_numeral(n)
    @kernel.Term::Comb(
      @kernel.Term::Const("int_neg", _),
      @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), n_1)
    ) => {
      let nn = @basics.dest_numeral(n_1)
      if @num.neq_num(nn, @num.num_0) {
        @num.minus_num(@basics.dest_numeral(n_1))
      } else {
        raise Failure("dest_intconst")
      }
    }
    _ => raise Failure("dest_intconst")
  }
}

///|
/// mk_intconst
fn step_39() -> Unit raise {
  let cast_tm = @term_syntax.parse_term("int_of_num")
  let neg_tm = @term_syntax.parse_term("int_neg")
  let mk_numconst : (@num.Num) -> @kernel.Term raise = fn(
    x142 : @num.Num,
  ) -> @kernel.Term raise {
    let n = x142
    @kernel.mk_comb(cast_tm, @nums.mk_numeral(n))
  }
  mk_intconst_c.set(fn(x143 : @num.Num) -> @kernel.Term raise {
    let x = x143
    if @num.lt_num(x, @num.num_0) {
      @kernel.mk_comb(neg_tm, mk_numconst(@num.minus_num(x)))
    } else {
      mk_numconst(x)
    }
  })
}

///|
let mk_intconst_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_intconst",
)

///|
/// `mk_intconst`
pub fn mk_intconst(x : @num.Num) -> @kernel.Term raise {
  mk_intconst_c.get()(x)
}

///|
/// INT_OF_REAL_THM
fn step_40() -> Unit raise {
  let dest = @term_syntax.parse_term("real_of_int")
  let real_ty = @parser.parse_type("real")
  let int_ty = @parser.parse_type("int")
  let t144 = @tactics.then_tac(
    @class.cond_cases_tac,
    @simp.rewrite_tac(@list.List([])),
  )
  let cond_th = @tactics.prove(
    @term_syntax.parse_term("real_of_int(if (b : Bool) { (x : Int) } else { (y : Int) }) == (if b { real_of_int(x) } else { real_of_int(y) })"),
    t144,
  )
  let thlist = @lib.map(
    @equal.gsym,
    @list.List([
      int_eq(),
      int_le(),
      int_lt(),
      int_ge(),
      int_gt(),
      int_of_num_th(),
      int_neg_th(),
      int_add_th(),
      int_mul_th(),
      int_sgn_th(),
      int_sub_th(),
      int_abs_th(),
      int_max_th(),
      int_min_th(),
      int_pow_th(),
      cond_th,
    ]),
  )
  let rew_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x145 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s146 = @equal.depth_conv(x145)
      fn(x147 : @kernel.Term) -> @kernel.Thm raise { s146(x147) }
    },
    thlist,
  )
  let int_tm_of_real_var : (@kernel.Term) -> @kernel.Term raise = fn(
    x148 : @kernel.Term,
  ) -> @kernel.Term raise {
    let v = x148
    let (s, ty) = @kernel.dest_var(v)
    if ty == real_ty {
      @kernel.mk_comb(dest, @kernel.mk_var(s, int_ty))
    } else {
      v
    }
  }
  let int_of_real_var : (@kernel.Term) -> @kernel.Term raise = fn(
    x149 : @kernel.Term,
  ) -> @kernel.Term raise {
    let v_1 = x149
    let (s_1, ty_1) = @kernel.dest_var(v_1)
    if ty_1 == real_ty {
      @kernel.mk_var(s_1, int_ty)
    } else {
      v_1
    }
  }
  let int_of_real_thm1 : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x150 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th = x150
    let t151 = @kernel.freesl(@kernel.hyp(th))
    let newavs = @lib.subtract(@kernel.frees(@kernel.concl(th)), t151)
    let (avs, bod) = @basics.strip_forall(@kernel.concl(th))
    let allavs = newavs.concat(avs)
    let avs_p = @lib.map(int_tm_of_real_var, allavs)
    let avs_p_p = @lib.map(int_of_real_var, avs)
    @bool.genl(avs_p_p, rew_rule(@bool.specl(avs_p, @bool.genl(newavs, th))))
  }
  fn int_of_real_thm_1(x152 : @kernel.Thm) -> @kernel.Thm raise {
    let th_1 = x152
    if @basics.is_conj(@kernel.concl(th_1)) {
      let t153 = int_of_real_thm_1(@bool.conjunct2(th_1))
      @bool.conj(int_of_real_thm_1(@bool.conjunct1(th_1)), t153)
    } else {
      int_of_real_thm1(th_1)
    }
  }
  int_of_real_thm_c.set(int_of_real_thm_1)
}

///|
let int_of_real_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_OF_REAL_THM",
)

///|
/// `INT_OF_REAL_THM`
pub fn int_of_real_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  int_of_real_thm_c.get()(x)
}

///|
/// INT_ABS_0
fn step_41() -> Unit raise {
  int_abs_0_c.set(int_of_real_thm(@real.real_abs_0()))
}

///|
let int_abs_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_0")

///|
/// `INT_ABS_0`
pub fn int_abs_0() -> @kernel.Thm {
  int_abs_0_c.get()
}

///|
/// INT_ABS_1
fn step_42() -> Unit raise {
  int_abs_1_c.set(int_of_real_thm(@real.real_abs_1()))
}

///|
let int_abs_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_1")

///|
/// `INT_ABS_1`
pub fn int_abs_1() -> @kernel.Thm {
  int_abs_1_c.get()
}

///|
/// INT_ABS_ABS
fn step_43() -> Unit raise {
  int_abs_abs_c.set(int_of_real_thm(@real.real_abs_abs()))
}

///|
let int_abs_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_ABS")

///|
/// `INT_ABS_ABS`
pub fn int_abs_abs() -> @kernel.Thm {
  int_abs_abs_c.get()
}

///|
/// INT_ABS_BETWEEN
fn step_44() -> Unit raise {
  int_abs_between_c.set(int_of_real_thm(@real.real_abs_between()))
}

///|
let int_abs_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_BETWEEN",
)

///|
/// `INT_ABS_BETWEEN`
pub fn int_abs_between() -> @kernel.Thm {
  int_abs_between_c.get()
}

///|
/// INT_ABS_BETWEEN1
fn step_45() -> Unit raise {
  int_abs_between1_c.set(int_of_real_thm(@real.real_abs_between1()))
}

///|
let int_abs_between1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_BETWEEN1",
)

///|
/// `INT_ABS_BETWEEN1`
pub fn int_abs_between1() -> @kernel.Thm {
  int_abs_between1_c.get()
}

///|
/// INT_ABS_BETWEEN2
fn step_46() -> Unit raise {
  int_abs_between2_c.set(int_of_real_thm(@real.real_abs_between2()))
}

///|
let int_abs_between2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_BETWEEN2",
)

///|
/// `INT_ABS_BETWEEN2`
pub fn int_abs_between2() -> @kernel.Thm {
  int_abs_between2_c.get()
}

///|
/// INT_ABS_BOUND
fn step_47() -> Unit raise {
  int_abs_bound_c.set(int_of_real_thm(@real.real_abs_bound()))
}

///|
let int_abs_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_BOUND")

///|
/// `INT_ABS_BOUND`
pub fn int_abs_bound() -> @kernel.Thm {
  int_abs_bound_c.get()
}

///|
/// INT_ABS_BOUNDS
fn step_48() -> Unit raise {
  int_abs_bounds_c.set(int_of_real_thm(@real.real_abs_bounds()))
}

///|
let int_abs_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_BOUNDS")

///|
/// `INT_ABS_BOUNDS`
pub fn int_abs_bounds() -> @kernel.Thm {
  int_abs_bounds_c.get()
}

///|
/// INT_ABS_CASES
fn step_49() -> Unit raise {
  int_abs_cases_c.set(int_of_real_thm(@real.real_abs_cases()))
}

///|
let int_abs_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_CASES")

///|
/// `INT_ABS_CASES`
pub fn int_abs_cases() -> @kernel.Thm {
  int_abs_cases_c.get()
}

///|
/// INT_ABS_CIRCLE
fn step_50() -> Unit raise {
  int_abs_circle_c.set(int_of_real_thm(@real.real_abs_circle()))
}

///|
let int_abs_circle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_CIRCLE")

///|
/// `INT_ABS_CIRCLE`
pub fn int_abs_circle() -> @kernel.Thm {
  int_abs_circle_c.get()
}

///|
/// INT_ABS_LE
fn step_51() -> Unit raise {
  int_abs_le_c.set(int_of_real_thm(@real.real_abs_le()))
}

///|
let int_abs_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_LE")

///|
/// `INT_ABS_LE`
pub fn int_abs_le() -> @kernel.Thm {
  int_abs_le_c.get()
}

///|
/// INT_ABS_MUL
fn step_52() -> Unit raise {
  int_abs_mul_c.set(int_of_real_thm(@real.real_abs_mul()))
}

///|
let int_abs_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_MUL")

///|
/// `INT_ABS_MUL`
pub fn int_abs_mul() -> @kernel.Thm {
  int_abs_mul_c.get()
}

///|
/// INT_ABS_NEG
fn step_53() -> Unit raise {
  int_abs_neg_c.set(int_of_real_thm(@calc_int.real_abs_neg()))
}

///|
let int_abs_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_NEG")

///|
/// `INT_ABS_NEG`
pub fn int_abs_neg() -> @kernel.Thm {
  int_abs_neg_c.get()
}

///|
/// INT_ABS_NUM
fn step_54() -> Unit raise {
  int_abs_num_c.set(int_of_real_thm(@calc_int.real_abs_num()))
}

///|
let int_abs_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_NUM")

///|
/// `INT_ABS_NUM`
pub fn int_abs_num() -> @kernel.Thm {
  int_abs_num_c.get()
}

///|
/// INT_ABS_NZ
fn step_55() -> Unit raise {
  int_abs_nz_c.set(int_of_real_thm(@real.real_abs_nz()))
}

///|
let int_abs_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_NZ")

///|
/// `INT_ABS_NZ`
pub fn int_abs_nz() -> @kernel.Thm {
  int_abs_nz_c.get()
}

///|
/// INT_ABS_POS
fn step_56() -> Unit raise {
  int_abs_pos_c.set(int_of_real_thm(@real.real_abs_pos()))
}

///|
let int_abs_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_POS")

///|
/// `INT_ABS_POS`
pub fn int_abs_pos() -> @kernel.Thm {
  int_abs_pos_c.get()
}

///|
/// INT_ABS_POW
fn step_57() -> Unit raise {
  int_abs_pow_c.set(int_of_real_thm(@real.real_abs_pow()))
}

///|
let int_abs_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_POW")

///|
/// `INT_ABS_POW`
pub fn int_abs_pow() -> @kernel.Thm {
  int_abs_pow_c.get()
}

///|
/// INT_ABS_REFL
fn step_58() -> Unit raise {
  int_abs_refl_c.set(int_of_real_thm(@real.real_abs_refl()))
}

///|
let int_abs_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_REFL")

///|
/// `INT_ABS_REFL`
pub fn int_abs_refl() -> @kernel.Thm {
  int_abs_refl_c.get()
}

///|
/// INT_ABS_SGN
fn step_59() -> Unit raise {
  int_abs_sgn_c.set(int_of_real_thm(@real.real_abs_sgn()))
}

///|
let int_abs_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_SGN")

///|
/// `INT_ABS_SGN`
pub fn int_abs_sgn() -> @kernel.Thm {
  int_abs_sgn_c.get()
}

///|
/// INT_ABS_SIGN
fn step_60() -> Unit raise {
  int_abs_sign_c.set(int_of_real_thm(@real.real_abs_sign()))
}

///|
let int_abs_sign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_SIGN")

///|
/// `INT_ABS_SIGN`
pub fn int_abs_sign() -> @kernel.Thm {
  int_abs_sign_c.get()
}

///|
/// INT_ABS_SIGN2
fn step_61() -> Unit raise {
  int_abs_sign2_c.set(int_of_real_thm(@real.real_abs_sign2()))
}

///|
let int_abs_sign2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_SIGN2")

///|
/// `INT_ABS_SIGN2`
pub fn int_abs_sign2() -> @kernel.Thm {
  int_abs_sign2_c.get()
}

///|
/// INT_ABS_STILLNZ
fn step_62() -> Unit raise {
  int_abs_stillnz_c.set(int_of_real_thm(@real.real_abs_stillnz()))
}

///|
let int_abs_stillnz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_STILLNZ",
)

///|
/// `INT_ABS_STILLNZ`
pub fn int_abs_stillnz() -> @kernel.Thm {
  int_abs_stillnz_c.get()
}

///|
/// INT_ABS_SUB
fn step_63() -> Unit raise {
  int_abs_sub_c.set(int_of_real_thm(@real.real_abs_sub()))
}

///|
let int_abs_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_SUB")

///|
/// `INT_ABS_SUB`
pub fn int_abs_sub() -> @kernel.Thm {
  int_abs_sub_c.get()
}

///|
/// INT_ABS_SUB_ABS
fn step_64() -> Unit raise {
  int_abs_sub_abs_c.set(int_of_real_thm(@real.real_abs_sub_abs()))
}

///|
let int_abs_sub_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_SUB_ABS",
)

///|
/// `INT_ABS_SUB_ABS`
pub fn int_abs_sub_abs() -> @kernel.Thm {
  int_abs_sub_abs_c.get()
}

///|
/// INT_ABS_TRIANGLE
fn step_65() -> Unit raise {
  int_abs_triangle_c.set(int_of_real_thm(@real.real_abs_triangle()))
}

///|
let int_abs_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ABS_TRIANGLE",
)

///|
/// `INT_ABS_TRIANGLE`
pub fn int_abs_triangle() -> @kernel.Thm {
  int_abs_triangle_c.get()
}

///|
/// INT_ABS_ZERO
fn step_66() -> Unit raise {
  int_abs_zero_c.set(int_of_real_thm(@real.real_abs_zero()))
}

///|
let int_abs_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_ZERO")

///|
/// `INT_ABS_ZERO`
pub fn int_abs_zero() -> @kernel.Thm {
  int_abs_zero_c.get()
}

///|
/// INT_ADD2_SUB2
fn step_67() -> Unit raise {
  int_add2_sub2_c.set(int_of_real_thm(@real.real_add2_sub2()))
}

///|
let int_add2_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD2_SUB2")

///|
/// `INT_ADD2_SUB2`
pub fn int_add2_sub2() -> @kernel.Thm {
  int_add2_sub2_c.get()
}

///|
/// INT_ADD_AC
fn step_68() -> Unit raise {
  int_add_ac_c.set(int_of_real_thm(@calc_int.real_add_ac()))
}

///|
let int_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_AC")

///|
/// `INT_ADD_AC`
pub fn int_add_ac() -> @kernel.Thm {
  int_add_ac_c.get()
}

///|
/// INT_ADD_ASSOC
fn step_69() -> Unit raise {
  int_add_assoc_c.set(int_of_real_thm(@realax.real_add_assoc()))
}

///|
let int_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_ASSOC")

///|
/// `INT_ADD_ASSOC`
pub fn int_add_assoc() -> @kernel.Thm {
  int_add_assoc_c.get()
}

///|
/// INT_ADD_LDISTRIB
fn step_70() -> Unit raise {
  int_add_ldistrib_c.set(int_of_real_thm(@realax.real_add_ldistrib()))
}

///|
let int_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ADD_LDISTRIB",
)

///|
/// `INT_ADD_LDISTRIB`
pub fn int_add_ldistrib() -> @kernel.Thm {
  int_add_ldistrib_c.get()
}

///|
/// INT_ADD_LID
fn step_71() -> Unit raise {
  int_add_lid_c.set(int_of_real_thm(@realax.real_add_lid()))
}

///|
let int_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_LID")

///|
/// `INT_ADD_LID`
pub fn int_add_lid() -> @kernel.Thm {
  int_add_lid_c.get()
}

///|
/// INT_ADD_LINV
fn step_72() -> Unit raise {
  int_add_linv_c.set(int_of_real_thm(@realax.real_add_linv()))
}

///|
let int_add_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_LINV")

///|
/// `INT_ADD_LINV`
pub fn int_add_linv() -> @kernel.Thm {
  int_add_linv_c.get()
}

///|
/// INT_ADD_RDISTRIB
fn step_73() -> Unit raise {
  int_add_rdistrib_c.set(int_of_real_thm(@real.real_add_rdistrib()))
}

///|
let int_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_ADD_RDISTRIB",
)

///|
/// `INT_ADD_RDISTRIB`
pub fn int_add_rdistrib() -> @kernel.Thm {
  int_add_rdistrib_c.get()
}

///|
/// INT_ADD_RID
fn step_74() -> Unit raise {
  int_add_rid_c.set(int_of_real_thm(@calc_int.real_add_rid()))
}

///|
let int_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_RID")

///|
/// `INT_ADD_RID`
pub fn int_add_rid() -> @kernel.Thm {
  int_add_rid_c.get()
}

///|
/// INT_ADD_RINV
fn step_75() -> Unit raise {
  int_add_rinv_c.set(int_of_real_thm(@calc_int.real_add_rinv()))
}

///|
let int_add_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_RINV")

///|
/// `INT_ADD_RINV`
pub fn int_add_rinv() -> @kernel.Thm {
  int_add_rinv_c.get()
}

///|
/// INT_ADD_SUB
fn step_76() -> Unit raise {
  int_add_sub_c.set(int_of_real_thm(@real.real_add_sub()))
}

///|
let int_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_SUB")

///|
/// `INT_ADD_SUB`
pub fn int_add_sub() -> @kernel.Thm {
  int_add_sub_c.get()
}

///|
/// INT_ADD_SUB2
fn step_77() -> Unit raise {
  int_add_sub2_c.set(int_of_real_thm(@real.real_add_sub2()))
}

///|
let int_add_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_SUB2")

///|
/// `INT_ADD_SUB2`
pub fn int_add_sub2() -> @kernel.Thm {
  int_add_sub2_c.get()
}

///|
/// INT_ADD_SYM
fn step_78() -> Unit raise {
  int_add_sym_c.set(int_of_real_thm(@realax.real_add_sym()))
}

///|
let int_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_SYM")

///|
/// `INT_ADD_SYM`
pub fn int_add_sym() -> @kernel.Thm {
  int_add_sym_c.get()
}

///|
/// INT_BOUNDS_LE
fn step_79() -> Unit raise {
  int_bounds_le_c.set(int_of_real_thm(@real.real_bounds_le()))
}

///|
let int_bounds_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_BOUNDS_LE")

///|
/// `INT_BOUNDS_LE`
pub fn int_bounds_le() -> @kernel.Thm {
  int_bounds_le_c.get()
}

///|
/// INT_BOUNDS_LT
fn step_80() -> Unit raise {
  int_bounds_lt_c.set(int_of_real_thm(@real.real_bounds_lt()))
}

///|
let int_bounds_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_BOUNDS_LT")

///|
/// `INT_BOUNDS_LT`
pub fn int_bounds_lt() -> @kernel.Thm {
  int_bounds_lt_c.get()
}

///|
/// INT_DIFFSQ
fn step_81() -> Unit raise {
  int_diffsq_c.set(int_of_real_thm(@real.real_diffsq()))
}

///|
let int_diffsq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIFFSQ")

///|
/// `INT_DIFFSQ`
pub fn int_diffsq() -> @kernel.Thm {
  int_diffsq_c.get()
}

///|
/// INT_ENTIRE
fn step_82() -> Unit raise {
  int_entire_c.set(int_of_real_thm(@realarith.real_entire()))
}

///|
let int_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ENTIRE")

///|
/// `INT_ENTIRE`
pub fn int_entire() -> @kernel.Thm {
  int_entire_c.get()
}

///|
/// INT_EQ_ADD_LCANCEL
fn step_83() -> Unit raise {
  int_eq_add_lcancel_c.set(int_of_real_thm(@calc_int.real_eq_add_lcancel()))
}

///|
let int_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_ADD_LCANCEL",
)

///|
/// `INT_EQ_ADD_LCANCEL`
pub fn int_eq_add_lcancel() -> @kernel.Thm {
  int_eq_add_lcancel_c.get()
}

///|
/// INT_EQ_ADD_LCANCEL_0
fn step_84() -> Unit raise {
  int_eq_add_lcancel_0_c.set(int_of_real_thm(@real.real_eq_add_lcancel_0()))
}

///|
let int_eq_add_lcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_ADD_LCANCEL_0",
)

///|
/// `INT_EQ_ADD_LCANCEL_0`
pub fn int_eq_add_lcancel_0() -> @kernel.Thm {
  int_eq_add_lcancel_0_c.get()
}

///|
/// INT_EQ_ADD_RCANCEL
fn step_85() -> Unit raise {
  int_eq_add_rcancel_c.set(int_of_real_thm(@calc_int.real_eq_add_rcancel()))
}

///|
let int_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_ADD_RCANCEL",
)

///|
/// `INT_EQ_ADD_RCANCEL`
pub fn int_eq_add_rcancel() -> @kernel.Thm {
  int_eq_add_rcancel_c.get()
}

///|
/// INT_EQ_ADD_RCANCEL_0
fn step_86() -> Unit raise {
  int_eq_add_rcancel_0_c.set(int_of_real_thm(@real.real_eq_add_rcancel_0()))
}

///|
let int_eq_add_rcancel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_ADD_RCANCEL_0",
)

///|
/// `INT_EQ_ADD_RCANCEL_0`
pub fn int_eq_add_rcancel_0() -> @kernel.Thm {
  int_eq_add_rcancel_0_c.get()
}

///|
/// INT_EQ_IMP_LE
fn step_87() -> Unit raise {
  int_eq_imp_le_c.set(int_of_real_thm(@real.real_eq_imp_le()))
}

///|
let int_eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EQ_IMP_LE")

///|
/// `INT_EQ_IMP_LE`
pub fn int_eq_imp_le() -> @kernel.Thm {
  int_eq_imp_le_c.get()
}

///|
/// INT_EQ_LCANCEL_IMP
fn step_88() -> Unit raise {
  int_eq_lcancel_imp_c.set(int_of_real_thm(@real.real_eq_lcancel_imp()))
}

///|
let int_eq_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_LCANCEL_IMP",
)

///|
/// `INT_EQ_LCANCEL_IMP`
pub fn int_eq_lcancel_imp() -> @kernel.Thm {
  int_eq_lcancel_imp_c.get()
}

///|
/// INT_EQ_MUL_LCANCEL
fn step_89() -> Unit raise {
  int_eq_mul_lcancel_c.set(int_of_real_thm(@real.real_eq_mul_lcancel()))
}

///|
let int_eq_mul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_MUL_LCANCEL",
)

///|
/// `INT_EQ_MUL_LCANCEL`
pub fn int_eq_mul_lcancel() -> @kernel.Thm {
  int_eq_mul_lcancel_c.get()
}

///|
/// INT_EQ_MUL_RCANCEL
fn step_90() -> Unit raise {
  int_eq_mul_rcancel_c.set(int_of_real_thm(@real.real_eq_mul_rcancel()))
}

///|
let int_eq_mul_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_MUL_RCANCEL",
)

///|
/// `INT_EQ_MUL_RCANCEL`
pub fn int_eq_mul_rcancel() -> @kernel.Thm {
  int_eq_mul_rcancel_c.get()
}

///|
/// INT_EQ_NEG2
fn step_91() -> Unit raise {
  int_eq_neg2_c.set(int_of_real_thm(@real.real_eq_neg2()))
}

///|
let int_eq_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EQ_NEG2")

///|
/// `INT_EQ_NEG2`
pub fn int_eq_neg2() -> @kernel.Thm {
  int_eq_neg2_c.get()
}

///|
/// INT_EQ_RCANCEL_IMP
fn step_92() -> Unit raise {
  int_eq_rcancel_imp_c.set(int_of_real_thm(@real.real_eq_rcancel_imp()))
}

///|
let int_eq_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_RCANCEL_IMP",
)

///|
/// `INT_EQ_RCANCEL_IMP`
pub fn int_eq_rcancel_imp() -> @kernel.Thm {
  int_eq_rcancel_imp_c.get()
}

///|
/// INT_EQ_SGN_ABS
fn step_93() -> Unit raise {
  int_eq_sgn_abs_c.set(int_of_real_thm(@real.real_eq_sgn_abs()))
}

///|
let int_eq_sgn_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EQ_SGN_ABS")

///|
/// `INT_EQ_SGN_ABS`
pub fn int_eq_sgn_abs() -> @kernel.Thm {
  int_eq_sgn_abs_c.get()
}

///|
/// INT_EQ_SQUARE_ABS
fn step_94() -> Unit raise {
  int_eq_square_abs_c.set(int_of_real_thm(@real.real_eq_square_abs()))
}

///|
let int_eq_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_SQUARE_ABS",
)

///|
/// `INT_EQ_SQUARE_ABS`
pub fn int_eq_square_abs() -> @kernel.Thm {
  int_eq_square_abs_c.get()
}

///|
/// INT_EQ_SUB_LADD
fn step_95() -> Unit raise {
  int_eq_sub_ladd_c.set(int_of_real_thm(@real.real_eq_sub_ladd()))
}

///|
let int_eq_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_SUB_LADD",
)

///|
/// `INT_EQ_SUB_LADD`
pub fn int_eq_sub_ladd() -> @kernel.Thm {
  int_eq_sub_ladd_c.get()
}

///|
/// INT_EQ_SUB_RADD
fn step_96() -> Unit raise {
  int_eq_sub_radd_c.set(int_of_real_thm(@real.real_eq_sub_radd()))
}

///|
let int_eq_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EQ_SUB_RADD",
)

///|
/// `INT_EQ_SUB_RADD`
pub fn int_eq_sub_radd() -> @kernel.Thm {
  int_eq_sub_radd_c.get()
}

///|
/// INT_EVENPOW_ABS
fn step_97() -> Unit raise {
  int_evenpow_abs_c.set(int_of_real_thm(@real.real_evenpow_abs()))
}

///|
let int_evenpow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_EVENPOW_ABS",
)

///|
/// `INT_EVENPOW_ABS`
pub fn int_evenpow_abs() -> @kernel.Thm {
  int_evenpow_abs_c.get()
}

///|
/// INT_LET_ADD
fn step_98() -> Unit raise {
  int_let_add_c.set(int_of_real_thm(@realarith.real_let_add()))
}

///|
let int_let_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LET_ADD")

///|
/// `INT_LET_ADD`
pub fn int_let_add() -> @kernel.Thm {
  int_let_add_c.get()
}

///|
/// INT_LET_ADD2
fn step_99() -> Unit raise {
  int_let_add2_c.set(int_of_real_thm(@real.real_let_add2()))
}

///|
let int_let_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LET_ADD2")

///|
/// `INT_LET_ADD2`
pub fn int_let_add2() -> @kernel.Thm {
  int_let_add2_c.get()
}

///|
/// INT_LET_ANTISYM
fn step_100() -> Unit raise {
  int_let_antisym_c.set(int_of_real_thm(@real.real_let_antisym()))
}

///|
let int_let_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LET_ANTISYM",
)

///|
/// `INT_LET_ANTISYM`
pub fn int_let_antisym() -> @kernel.Thm {
  int_let_antisym_c.get()
}

///|
/// INT_LET_TOTAL
fn step_101() -> Unit raise {
  int_let_total_c.set(int_of_real_thm(@realarith.real_let_total()))
}

///|
let int_let_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LET_TOTAL")

///|
/// `INT_LET_TOTAL`
pub fn int_let_total() -> @kernel.Thm {
  int_let_total_c.get()
}

///|
/// INT_LET_TRANS
fn step_102() -> Unit raise {
  int_let_trans_c.set(int_of_real_thm(@realarith.real_let_trans()))
}

///|
let int_let_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LET_TRANS")

///|
/// `INT_LET_TRANS`
pub fn int_let_trans() -> @kernel.Thm {
  int_let_trans_c.get()
}

///|
/// INT_LE_01
fn step_103() -> Unit raise {
  int_le_01_c.set(int_of_real_thm(@real.real_le_01()))
}

///|
let int_le_01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_01")

///|
/// `INT_LE_01`
pub fn int_le_01() -> @kernel.Thm {
  int_le_01_c.get()
}

///|
/// INT_LE_ADD
fn step_104() -> Unit raise {
  int_le_add_c.set(int_of_real_thm(@realarith.real_le_add()))
}

///|
let int_le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_ADD")

///|
/// `INT_LE_ADD`
pub fn int_le_add() -> @kernel.Thm {
  int_le_add_c.get()
}

///|
/// INT_LE_ADD2
fn step_105() -> Unit raise {
  int_le_add2_c.set(int_of_real_thm(@real.real_le_add2()))
}

///|
let int_le_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_ADD2")

///|
/// `INT_LE_ADD2`
pub fn int_le_add2() -> @kernel.Thm {
  int_le_add2_c.get()
}

///|
/// INT_LE_ADDL
fn step_106() -> Unit raise {
  int_le_addl_c.set(int_of_real_thm(@real.real_le_addl()))
}

///|
let int_le_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_ADDL")

///|
/// `INT_LE_ADDL`
pub fn int_le_addl() -> @kernel.Thm {
  int_le_addl_c.get()
}

///|
/// INT_LE_ADDR
fn step_107() -> Unit raise {
  int_le_addr_c.set(int_of_real_thm(@real.real_le_addr()))
}

///|
let int_le_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_ADDR")

///|
/// `INT_LE_ADDR`
pub fn int_le_addr() -> @kernel.Thm {
  int_le_addr_c.get()
}

///|
/// INT_LE_ANTISYM
fn step_108() -> Unit raise {
  int_le_antisym_c.set(int_of_real_thm(@realax.real_le_antisym()))
}

///|
let int_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_ANTISYM")

///|
/// `INT_LE_ANTISYM`
pub fn int_le_antisym() -> @kernel.Thm {
  int_le_antisym_c.get()
}

///|
/// INT_LE_DOUBLE
fn step_109() -> Unit raise {
  int_le_double_c.set(int_of_real_thm(@real.real_le_double()))
}

///|
let int_le_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_DOUBLE")

///|
/// `INT_LE_DOUBLE`
pub fn int_le_double() -> @kernel.Thm {
  int_le_double_c.get()
}

///|
/// INT_LE_LADD
fn step_110() -> Unit raise {
  int_le_ladd_c.set(int_of_real_thm(@real.real_le_ladd()))
}

///|
let int_le_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_LADD")

///|
/// `INT_LE_LADD`
pub fn int_le_ladd() -> @kernel.Thm {
  int_le_ladd_c.get()
}

///|
/// INT_LE_LADD_IMP
fn step_111() -> Unit raise {
  int_le_ladd_imp_c.set(int_of_real_thm(@realax.real_le_ladd_imp()))
}

///|
let int_le_ladd_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_LADD_IMP",
)

///|
/// `INT_LE_LADD_IMP`
pub fn int_le_ladd_imp() -> @kernel.Thm {
  int_le_ladd_imp_c.get()
}

///|
/// INT_LE_LCANCEL_IMP
fn step_112() -> Unit raise {
  int_le_lcancel_imp_c.set(int_of_real_thm(@real.real_le_lcancel_imp()))
}

///|
let int_le_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_LCANCEL_IMP",
)

///|
/// `INT_LE_LCANCEL_IMP`
pub fn int_le_lcancel_imp() -> @kernel.Thm {
  int_le_lcancel_imp_c.get()
}

///|
/// INT_LE_LMUL
fn step_113() -> Unit raise {
  int_le_lmul_c.set(int_of_real_thm(@real.real_le_lmul()))
}

///|
let int_le_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_LMUL")

///|
/// `INT_LE_LMUL`
pub fn int_le_lmul() -> @kernel.Thm {
  int_le_lmul_c.get()
}

///|
/// INT_LE_LMUL_EQ
fn step_114() -> Unit raise {
  int_le_lmul_eq_c.set(int_of_real_thm(@real.real_le_lmul_eq()))
}

///|
let int_le_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_LMUL_EQ")

///|
/// `INT_LE_LMUL_EQ`
pub fn int_le_lmul_eq() -> @kernel.Thm {
  int_le_lmul_eq_c.get()
}

///|
/// INT_LE_LNEG
fn step_115() -> Unit raise {
  int_le_lneg_c.set(int_of_real_thm(@calc_int.real_le_lneg()))
}

///|
let int_le_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_LNEG")

///|
/// `INT_LE_LNEG`
pub fn int_le_lneg() -> @kernel.Thm {
  int_le_lneg_c.get()
}

///|
/// INT_LE_LT
fn step_116() -> Unit raise {
  int_le_lt_c.set(int_of_real_thm(@realarith.real_le_lt()))
}

///|
let int_le_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_LT")

///|
/// `INT_LE_LT`
pub fn int_le_lt() -> @kernel.Thm {
  int_le_lt_c.get()
}

///|
/// INT_LE_MAX
fn step_117() -> Unit raise {
  int_le_max_c.set(int_of_real_thm(@real.real_le_max()))
}

///|
let int_le_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_MAX")

///|
/// `INT_LE_MAX`
pub fn int_le_max() -> @kernel.Thm {
  int_le_max_c.get()
}

///|
/// INT_LE_MIN
fn step_118() -> Unit raise {
  int_le_min_c.set(int_of_real_thm(@real.real_le_min()))
}

///|
let int_le_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_MIN")

///|
/// `INT_LE_MIN`
pub fn int_le_min() -> @kernel.Thm {
  int_le_min_c.get()
}

///|
/// INT_LE_MUL
fn step_119() -> Unit raise {
  int_le_mul_c.set(int_of_real_thm(@realax.real_le_mul()))
}

///|
let int_le_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_MUL")

///|
/// `INT_LE_MUL`
pub fn int_le_mul() -> @kernel.Thm {
  int_le_mul_c.get()
}

///|
/// INT_LE_MUL2
fn step_120() -> Unit raise {
  int_le_mul2_c.set(int_of_real_thm(@real.real_le_mul2()))
}

///|
let int_le_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_MUL2")

///|
/// `INT_LE_MUL2`
pub fn int_le_mul2() -> @kernel.Thm {
  int_le_mul2_c.get()
}

///|
/// INT_LE_MUL_EQ
fn step_121() -> Unit raise {
  int_le_mul_eq_c.set(int_of_real_thm(@real.real_le_mul_eq()))
}

///|
let int_le_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_MUL_EQ")

///|
/// `INT_LE_MUL_EQ`
pub fn int_le_mul_eq() -> @kernel.Thm {
  int_le_mul_eq_c.get()
}

///|
/// INT_LE_NEG2
fn step_122() -> Unit raise {
  int_le_neg2_c.set(int_of_real_thm(@calc_int.real_le_neg2()))
}

///|
let int_le_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_NEG2")

///|
/// `INT_LE_NEG2`
pub fn int_le_neg2() -> @kernel.Thm {
  int_le_neg2_c.get()
}

///|
/// INT_LE_NEGL
fn step_123() -> Unit raise {
  int_le_negl_c.set(int_of_real_thm(@real.real_le_negl()))
}

///|
let int_le_negl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_NEGL")

///|
/// `INT_LE_NEGL`
pub fn int_le_negl() -> @kernel.Thm {
  int_le_negl_c.get()
}

///|
/// INT_LE_NEGR
fn step_124() -> Unit raise {
  int_le_negr_c.set(int_of_real_thm(@real.real_le_negr()))
}

///|
let int_le_negr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_NEGR")

///|
/// `INT_LE_NEGR`
pub fn int_le_negr() -> @kernel.Thm {
  int_le_negr_c.get()
}

///|
/// INT_LE_NEGTOTAL
fn step_125() -> Unit raise {
  int_le_negtotal_c.set(int_of_real_thm(@realarith.real_le_negtotal()))
}

///|
let int_le_negtotal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_NEGTOTAL",
)

///|
/// `INT_LE_NEGTOTAL`
pub fn int_le_negtotal() -> @kernel.Thm {
  int_le_negtotal_c.get()
}

///|
/// INT_LE_POW2
fn step_126() -> Unit raise {
  int_le_pow2_c.set(int_of_real_thm(@real.real_le_pow2()))
}

///|
let int_le_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_POW2")

///|
/// `INT_LE_POW2`
pub fn int_le_pow2() -> @kernel.Thm {
  int_le_pow2_c.get()
}

///|
/// INT_LE_POW_2
fn step_127() -> Unit raise {
  int_le_pow_2_c.set(int_of_real_thm(@real.real_le_pow_2()))
}

///|
let int_le_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_POW_2")

///|
/// `INT_LE_POW_2`
pub fn int_le_pow_2() -> @kernel.Thm {
  int_le_pow_2_c.get()
}

///|
/// INT_LE_RADD
fn step_128() -> Unit raise {
  int_le_radd_c.set(int_of_real_thm(@real.real_le_radd()))
}

///|
let int_le_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_RADD")

///|
/// `INT_LE_RADD`
pub fn int_le_radd() -> @kernel.Thm {
  int_le_radd_c.get()
}

///|
/// INT_LE_RCANCEL_IMP
fn step_129() -> Unit raise {
  int_le_rcancel_imp_c.set(int_of_real_thm(@real.real_le_rcancel_imp()))
}

///|
let int_le_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_RCANCEL_IMP",
)

///|
/// `INT_LE_RCANCEL_IMP`
pub fn int_le_rcancel_imp() -> @kernel.Thm {
  int_le_rcancel_imp_c.get()
}

///|
/// INT_LE_REFL
fn step_130() -> Unit raise {
  int_le_refl_c.set(int_of_real_thm(@realax.real_le_refl()))
}

///|
let int_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_REFL")

///|
/// `INT_LE_REFL`
pub fn int_le_refl() -> @kernel.Thm {
  int_le_refl_c.get()
}

///|
/// INT_LE_RMUL
fn step_131() -> Unit raise {
  int_le_rmul_c.set(int_of_real_thm(@real.real_le_rmul()))
}

///|
let int_le_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_RMUL")

///|
/// `INT_LE_RMUL`
pub fn int_le_rmul() -> @kernel.Thm {
  int_le_rmul_c.get()
}

///|
/// INT_LE_RMUL_EQ
fn step_132() -> Unit raise {
  int_le_rmul_eq_c.set(int_of_real_thm(@real.real_le_rmul_eq()))
}

///|
let int_le_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_RMUL_EQ")

///|
/// `INT_LE_RMUL_EQ`
pub fn int_le_rmul_eq() -> @kernel.Thm {
  int_le_rmul_eq_c.get()
}

///|
/// INT_LE_RNEG
fn step_133() -> Unit raise {
  int_le_rneg_c.set(int_of_real_thm(@calc_int.real_le_rneg()))
}

///|
let int_le_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_RNEG")

///|
/// `INT_LE_RNEG`
pub fn int_le_rneg() -> @kernel.Thm {
  int_le_rneg_c.get()
}

///|
/// INT_LE_SQUARE
fn step_134() -> Unit raise {
  int_le_square_c.set(int_of_real_thm(@realarith.real_le_square()))
}

///|
let int_le_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_SQUARE")

///|
/// `INT_LE_SQUARE`
pub fn int_le_square() -> @kernel.Thm {
  int_le_square_c.get()
}

///|
/// INT_LE_SQUARE_ABS
fn step_135() -> Unit raise {
  int_le_square_abs_c.set(int_of_real_thm(@real.real_le_square_abs()))
}

///|
let int_le_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_SQUARE_ABS",
)

///|
/// `INT_LE_SQUARE_ABS`
pub fn int_le_square_abs() -> @kernel.Thm {
  int_le_square_abs_c.get()
}

///|
/// INT_LE_SUB_LADD
fn step_136() -> Unit raise {
  int_le_sub_ladd_c.set(int_of_real_thm(@real.real_le_sub_ladd()))
}

///|
let int_le_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_SUB_LADD",
)

///|
/// `INT_LE_SUB_LADD`
pub fn int_le_sub_ladd() -> @kernel.Thm {
  int_le_sub_ladd_c.get()
}

///|
/// INT_LE_SUB_RADD
fn step_137() -> Unit raise {
  int_le_sub_radd_c.set(int_of_real_thm(@real.real_le_sub_radd()))
}

///|
let int_le_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_SUB_RADD",
)

///|
/// `INT_LE_SUB_RADD`
pub fn int_le_sub_radd() -> @kernel.Thm {
  int_le_sub_radd_c.get()
}

///|
/// INT_LE_TOTAL
fn step_138() -> Unit raise {
  int_le_total_c.set(int_of_real_thm(@realax.real_le_total()))
}

///|
let int_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_TOTAL")

///|
/// `INT_LE_TOTAL`
pub fn int_le_total() -> @kernel.Thm {
  int_le_total_c.get()
}

///|
/// INT_LE_TRANS
fn step_139() -> Unit raise {
  int_le_trans_c.set(int_of_real_thm(@realax.real_le_trans()))
}

///|
let int_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_TRANS")

///|
/// `INT_LE_TRANS`
pub fn int_le_trans() -> @kernel.Thm {
  int_le_trans_c.get()
}

///|
/// INT_LNEG_UNIQ
fn step_140() -> Unit raise {
  int_lneg_uniq_c.set(int_of_real_thm(@real.real_lneg_uniq()))
}

///|
let int_lneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LNEG_UNIQ")

///|
/// `INT_LNEG_UNIQ`
pub fn int_lneg_uniq() -> @kernel.Thm {
  int_lneg_uniq_c.get()
}

///|
/// INT_LTE_ADD
fn step_141() -> Unit raise {
  int_lte_add_c.set(int_of_real_thm(@realarith.real_lte_add()))
}

///|
let int_lte_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LTE_ADD")

///|
/// `INT_LTE_ADD`
pub fn int_lte_add() -> @kernel.Thm {
  int_lte_add_c.get()
}

///|
/// INT_LTE_ADD2
fn step_142() -> Unit raise {
  int_lte_add2_c.set(int_of_real_thm(@real.real_lte_add2()))
}

///|
let int_lte_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LTE_ADD2")

///|
/// `INT_LTE_ADD2`
pub fn int_lte_add2() -> @kernel.Thm {
  int_lte_add2_c.get()
}

///|
/// INT_LTE_ANTISYM
fn step_143() -> Unit raise {
  int_lte_antisym_c.set(int_of_real_thm(@realarith.real_lte_antisym()))
}

///|
let int_lte_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LTE_ANTISYM",
)

///|
/// `INT_LTE_ANTISYM`
pub fn int_lte_antisym() -> @kernel.Thm {
  int_lte_antisym_c.get()
}

///|
/// INT_LTE_TOTAL
fn step_144() -> Unit raise {
  int_lte_total_c.set(int_of_real_thm(@realarith.real_lte_total()))
}

///|
let int_lte_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LTE_TOTAL")

///|
/// `INT_LTE_TOTAL`
pub fn int_lte_total() -> @kernel.Thm {
  int_lte_total_c.get()
}

///|
/// INT_LTE_TRANS
fn step_145() -> Unit raise {
  int_lte_trans_c.set(int_of_real_thm(@realarith.real_lte_trans()))
}

///|
let int_lte_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LTE_TRANS")

///|
/// `INT_LTE_TRANS`
pub fn int_lte_trans() -> @kernel.Thm {
  int_lte_trans_c.get()
}

///|
/// INT_LT_01
fn step_146() -> Unit raise {
  int_lt_01_c.set(int_of_real_thm(@real.real_lt_01()))
}

///|
let int_lt_01_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_01")

///|
/// `INT_LT_01`
pub fn int_lt_01() -> @kernel.Thm {
  int_lt_01_c.get()
}

///|
/// INT_LT_ADD
fn step_147() -> Unit raise {
  int_lt_add_c.set(int_of_real_thm(@realarith.real_lt_add()))
}

///|
let int_lt_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADD")

///|
/// `INT_LT_ADD`
pub fn int_lt_add() -> @kernel.Thm {
  int_lt_add_c.get()
}

///|
/// INT_LT_ADD1
fn step_148() -> Unit raise {
  int_lt_add1_c.set(int_of_real_thm(@real.real_lt_add1()))
}

///|
let int_lt_add1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADD1")

///|
/// `INT_LT_ADD1`
pub fn int_lt_add1() -> @kernel.Thm {
  int_lt_add1_c.get()
}

///|
/// INT_LT_ADD2
fn step_149() -> Unit raise {
  int_lt_add2_c.set(int_of_real_thm(@real.real_lt_add2()))
}

///|
let int_lt_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADD2")

///|
/// `INT_LT_ADD2`
pub fn int_lt_add2() -> @kernel.Thm {
  int_lt_add2_c.get()
}

///|
/// INT_LT_ADDL
fn step_150() -> Unit raise {
  int_lt_addl_c.set(int_of_real_thm(@real.real_lt_addl()))
}

///|
let int_lt_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADDL")

///|
/// `INT_LT_ADDL`
pub fn int_lt_addl() -> @kernel.Thm {
  int_lt_addl_c.get()
}

///|
/// INT_LT_ADDNEG
fn step_151() -> Unit raise {
  int_lt_addneg_c.set(int_of_real_thm(@real.real_lt_addneg()))
}

///|
let int_lt_addneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADDNEG")

///|
/// `INT_LT_ADDNEG`
pub fn int_lt_addneg() -> @kernel.Thm {
  int_lt_addneg_c.get()
}

///|
/// INT_LT_ADDNEG2
fn step_152() -> Unit raise {
  int_lt_addneg2_c.set(int_of_real_thm(@real.real_lt_addneg2()))
}

///|
let int_lt_addneg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADDNEG2")

///|
/// `INT_LT_ADDNEG2`
pub fn int_lt_addneg2() -> @kernel.Thm {
  int_lt_addneg2_c.get()
}

///|
/// INT_LT_ADDR
fn step_153() -> Unit raise {
  int_lt_addr_c.set(int_of_real_thm(@real.real_lt_addr()))
}

///|
let int_lt_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADDR")

///|
/// `INT_LT_ADDR`
pub fn int_lt_addr() -> @kernel.Thm {
  int_lt_addr_c.get()
}

///|
/// INT_LT_ADD_SUB
fn step_154() -> Unit raise {
  int_lt_add_sub_c.set(int_of_real_thm(@real.real_lt_add_sub()))
}

///|
let int_lt_add_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ADD_SUB")

///|
/// `INT_LT_ADD_SUB`
pub fn int_lt_add_sub() -> @kernel.Thm {
  int_lt_add_sub_c.get()
}

///|
/// INT_LT_ANTISYM
fn step_155() -> Unit raise {
  int_lt_antisym_c.set(int_of_real_thm(@real.real_lt_antisym()))
}

///|
let int_lt_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_ANTISYM")

///|
/// `INT_LT_ANTISYM`
pub fn int_lt_antisym() -> @kernel.Thm {
  int_lt_antisym_c.get()
}

///|
/// INT_LT_GT
fn step_156() -> Unit raise {
  int_lt_gt_c.set(int_of_real_thm(@real.real_lt_gt()))
}

///|
let int_lt_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_GT")

///|
/// `INT_LT_GT`
pub fn int_lt_gt() -> @kernel.Thm {
  int_lt_gt_c.get()
}

///|
/// INT_LT_IMP_LE
fn step_157() -> Unit raise {
  int_lt_imp_le_c.set(int_of_real_thm(@realarith.real_lt_imp_le()))
}

///|
let int_lt_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_IMP_LE")

///|
/// `INT_LT_IMP_LE`
pub fn int_lt_imp_le() -> @kernel.Thm {
  int_lt_imp_le_c.get()
}

///|
/// INT_LT_IMP_NE
fn step_158() -> Unit raise {
  int_lt_imp_ne_c.set(int_of_real_thm(@real.real_lt_imp_ne()))
}

///|
let int_lt_imp_ne_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_IMP_NE")

///|
/// `INT_LT_IMP_NE`
pub fn int_lt_imp_ne() -> @kernel.Thm {
  int_lt_imp_ne_c.get()
}

///|
/// INT_LT_LADD
fn step_159() -> Unit raise {
  int_lt_ladd_c.set(int_of_real_thm(@real.real_lt_ladd()))
}

///|
let int_lt_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_LADD")

///|
/// `INT_LT_LADD`
pub fn int_lt_ladd() -> @kernel.Thm {
  int_lt_ladd_c.get()
}

///|
/// INT_LT_LADD_IMP
fn step_160() -> Unit raise {
  int_lt_ladd_imp_c.set(int_of_real_thm(@real.real_lt_ladd_imp()))
}

///|
let int_lt_ladd_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_LADD_IMP",
)

///|
/// `INT_LT_LADD_IMP`
pub fn int_lt_ladd_imp() -> @kernel.Thm {
  int_lt_ladd_imp_c.get()
}

///|
/// INT_LT_LCANCEL_IMP
fn step_161() -> Unit raise {
  int_lt_lcancel_imp_c.set(int_of_real_thm(@real.real_lt_lcancel_imp()))
}

///|
let int_lt_lcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_LCANCEL_IMP",
)

///|
/// `INT_LT_LCANCEL_IMP`
pub fn int_lt_lcancel_imp() -> @kernel.Thm {
  int_lt_lcancel_imp_c.get()
}

///|
/// INT_LT_LE
fn step_162() -> Unit raise {
  int_lt_le_c.set(int_of_real_thm(@realarith.real_lt_le()))
}

///|
let int_lt_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_LE")

///|
/// `INT_LT_LE`
pub fn int_lt_le() -> @kernel.Thm {
  int_lt_le_c.get()
}

///|
/// INT_LT_LMUL
fn step_163() -> Unit raise {
  int_lt_lmul_c.set(int_of_real_thm(@real.real_lt_lmul()))
}

///|
let int_lt_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_LMUL")

///|
/// `INT_LT_LMUL`
pub fn int_lt_lmul() -> @kernel.Thm {
  int_lt_lmul_c.get()
}

///|
/// INT_LT_LMUL_EQ
fn step_164() -> Unit raise {
  int_lt_lmul_eq_c.set(int_of_real_thm(@real.real_lt_lmul_eq()))
}

///|
let int_lt_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_LMUL_EQ")

///|
/// `INT_LT_LMUL_EQ`
pub fn int_lt_lmul_eq() -> @kernel.Thm {
  int_lt_lmul_eq_c.get()
}

///|
/// INT_LT_LNEG
fn step_165() -> Unit raise {
  int_lt_lneg_c.set(int_of_real_thm(@real.real_lt_lneg()))
}

///|
let int_lt_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_LNEG")

///|
/// `INT_LT_LNEG`
pub fn int_lt_lneg() -> @kernel.Thm {
  int_lt_lneg_c.get()
}

///|
/// INT_LT_MAX
fn step_166() -> Unit raise {
  int_lt_max_c.set(int_of_real_thm(@real.real_lt_max()))
}

///|
let int_lt_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_MAX")

///|
/// `INT_LT_MAX`
pub fn int_lt_max() -> @kernel.Thm {
  int_lt_max_c.get()
}

///|
/// INT_LT_MIN
fn step_167() -> Unit raise {
  int_lt_min_c.set(int_of_real_thm(@real.real_lt_min()))
}

///|
let int_lt_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_MIN")

///|
/// `INT_LT_MIN`
pub fn int_lt_min() -> @kernel.Thm {
  int_lt_min_c.get()
}

///|
/// INT_LT_MUL
fn step_168() -> Unit raise {
  int_lt_mul_c.set(int_of_real_thm(@real.real_lt_mul()))
}

///|
let int_lt_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_MUL")

///|
/// `INT_LT_MUL`
pub fn int_lt_mul() -> @kernel.Thm {
  int_lt_mul_c.get()
}

///|
/// INT_LT_MUL2
fn step_169() -> Unit raise {
  int_lt_mul2_c.set(int_of_real_thm(@real.real_lt_mul2()))
}

///|
let int_lt_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_MUL2")

///|
/// `INT_LT_MUL2`
pub fn int_lt_mul2() -> @kernel.Thm {
  int_lt_mul2_c.get()
}

///|
/// INT_LT_MUL_EQ
fn step_170() -> Unit raise {
  int_lt_mul_eq_c.set(int_of_real_thm(@real.real_lt_mul_eq()))
}

///|
let int_lt_mul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_MUL_EQ")

///|
/// `INT_LT_MUL_EQ`
pub fn int_lt_mul_eq() -> @kernel.Thm {
  int_lt_mul_eq_c.get()
}

///|
/// INT_LT_NEG2
fn step_171() -> Unit raise {
  int_lt_neg2_c.set(int_of_real_thm(@real.real_lt_neg2()))
}

///|
let int_lt_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_NEG2")

///|
/// `INT_LT_NEG2`
pub fn int_lt_neg2() -> @kernel.Thm {
  int_lt_neg2_c.get()
}

///|
/// INT_LT_NEGTOTAL
fn step_172() -> Unit raise {
  int_lt_negtotal_c.set(int_of_real_thm(@real.real_lt_negtotal()))
}

///|
let int_lt_negtotal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_NEGTOTAL",
)

///|
/// `INT_LT_NEGTOTAL`
pub fn int_lt_negtotal() -> @kernel.Thm {
  int_lt_negtotal_c.get()
}

///|
/// INT_LT_POW2
fn step_173() -> Unit raise {
  int_lt_pow2_c.set(int_of_real_thm(@real.real_lt_pow2()))
}

///|
let int_lt_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_POW2")

///|
/// `INT_LT_POW2`
pub fn int_lt_pow2() -> @kernel.Thm {
  int_lt_pow2_c.get()
}

///|
/// INT_LT_POW_2
fn step_174() -> Unit raise {
  int_lt_pow_2_c.set(int_of_real_thm(@real.real_lt_pow_2()))
}

///|
let int_lt_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_POW_2")

///|
/// `INT_LT_POW_2`
pub fn int_lt_pow_2() -> @kernel.Thm {
  int_lt_pow_2_c.get()
}

///|
/// INT_LT_RADD
fn step_175() -> Unit raise {
  int_lt_radd_c.set(int_of_real_thm(@real.real_lt_radd()))
}

///|
let int_lt_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_RADD")

///|
/// `INT_LT_RADD`
pub fn int_lt_radd() -> @kernel.Thm {
  int_lt_radd_c.get()
}

///|
/// INT_LT_RCANCEL_IMP
fn step_176() -> Unit raise {
  int_lt_rcancel_imp_c.set(int_of_real_thm(@real.real_lt_rcancel_imp()))
}

///|
let int_lt_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_RCANCEL_IMP",
)

///|
/// `INT_LT_RCANCEL_IMP`
pub fn int_lt_rcancel_imp() -> @kernel.Thm {
  int_lt_rcancel_imp_c.get()
}

///|
/// INT_LT_REFL
fn step_177() -> Unit raise {
  int_lt_refl_c.set(int_of_real_thm(@realarith.real_lt_refl()))
}

///|
let int_lt_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_REFL")

///|
/// `INT_LT_REFL`
pub fn int_lt_refl() -> @kernel.Thm {
  int_lt_refl_c.get()
}

///|
/// INT_LT_RMUL
fn step_178() -> Unit raise {
  int_lt_rmul_c.set(int_of_real_thm(@real.real_lt_rmul()))
}

///|
let int_lt_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_RMUL")

///|
/// `INT_LT_RMUL`
pub fn int_lt_rmul() -> @kernel.Thm {
  int_lt_rmul_c.get()
}

///|
/// INT_LT_RMUL_EQ
fn step_179() -> Unit raise {
  int_lt_rmul_eq_c.set(int_of_real_thm(@real.real_lt_rmul_eq()))
}

///|
let int_lt_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_RMUL_EQ")

///|
/// `INT_LT_RMUL_EQ`
pub fn int_lt_rmul_eq() -> @kernel.Thm {
  int_lt_rmul_eq_c.get()
}

///|
/// INT_LT_RNEG
fn step_180() -> Unit raise {
  int_lt_rneg_c.set(int_of_real_thm(@real.real_lt_rneg()))
}

///|
let int_lt_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_RNEG")

///|
/// `INT_LT_RNEG`
pub fn int_lt_rneg() -> @kernel.Thm {
  int_lt_rneg_c.get()
}

///|
/// INT_LT_SQUARE
fn step_181() -> Unit raise {
  int_lt_square_c.set(int_of_real_thm(@real.real_lt_square()))
}

///|
let int_lt_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_SQUARE")

///|
/// `INT_LT_SQUARE`
pub fn int_lt_square() -> @kernel.Thm {
  int_lt_square_c.get()
}

///|
/// INT_LT_SQUARE_ABS
fn step_182() -> Unit raise {
  int_lt_square_abs_c.set(int_of_real_thm(@real.real_lt_square_abs()))
}

///|
let int_lt_square_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_SQUARE_ABS",
)

///|
/// `INT_LT_SQUARE_ABS`
pub fn int_lt_square_abs() -> @kernel.Thm {
  int_lt_square_abs_c.get()
}

///|
/// INT_LT_SUB_LADD
fn step_183() -> Unit raise {
  int_lt_sub_ladd_c.set(int_of_real_thm(@real.real_lt_sub_ladd()))
}

///|
let int_lt_sub_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_SUB_LADD",
)

///|
/// `INT_LT_SUB_LADD`
pub fn int_lt_sub_ladd() -> @kernel.Thm {
  int_lt_sub_ladd_c.get()
}

///|
/// INT_LT_SUB_RADD
fn step_184() -> Unit raise {
  int_lt_sub_radd_c.set(int_of_real_thm(@real.real_lt_sub_radd()))
}

///|
let int_lt_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LT_SUB_RADD",
)

///|
/// `INT_LT_SUB_RADD`
pub fn int_lt_sub_radd() -> @kernel.Thm {
  int_lt_sub_radd_c.get()
}

///|
/// INT_LT_TOTAL
fn step_185() -> Unit raise {
  int_lt_total_c.set(int_of_real_thm(@real.real_lt_total()))
}

///|
let int_lt_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_TOTAL")

///|
/// `INT_LT_TOTAL`
pub fn int_lt_total() -> @kernel.Thm {
  int_lt_total_c.get()
}

///|
/// INT_LT_TRANS
fn step_186() -> Unit raise {
  int_lt_trans_c.set(int_of_real_thm(@realarith.real_lt_trans()))
}

///|
let int_lt_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_TRANS")

///|
/// `INT_LT_TRANS`
pub fn int_lt_trans() -> @kernel.Thm {
  int_lt_trans_c.get()
}

///|
/// INT_MAX_ACI
fn step_187() -> Unit raise {
  int_max_aci_c.set(int_of_real_thm(@real.real_max_aci()))
}

///|
let int_max_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_ACI")

///|
/// `INT_MAX_ACI`
pub fn int_max_aci() -> @kernel.Thm {
  int_max_aci_c.get()
}

///|
/// INT_MAX_ASSOC
fn step_188() -> Unit raise {
  int_max_assoc_c.set(int_of_real_thm(@real.real_max_assoc()))
}

///|
let int_max_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_ASSOC")

///|
/// `INT_MAX_ASSOC`
pub fn int_max_assoc() -> @kernel.Thm {
  int_max_assoc_c.get()
}

///|
/// INT_MAX_LE
fn step_189() -> Unit raise {
  int_max_le_c.set(int_of_real_thm(@real.real_max_le()))
}

///|
let int_max_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_LE")

///|
/// `INT_MAX_LE`
pub fn int_max_le() -> @kernel.Thm {
  int_max_le_c.get()
}

///|
/// INT_MAX_LT
fn step_190() -> Unit raise {
  int_max_lt_c.set(int_of_real_thm(@real.real_max_lt()))
}

///|
let int_max_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_LT")

///|
/// `INT_MAX_LT`
pub fn int_max_lt() -> @kernel.Thm {
  int_max_lt_c.get()
}

///|
/// INT_MAX_MAX
fn step_191() -> Unit raise {
  int_max_max_c.set(int_of_real_thm(@real.real_max_max()))
}

///|
let int_max_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_MAX")

///|
/// `INT_MAX_MAX`
pub fn int_max_max() -> @kernel.Thm {
  int_max_max_c.get()
}

///|
/// INT_MAX_MIN
fn step_192() -> Unit raise {
  int_max_min_c.set(int_of_real_thm(@real.real_max_min()))
}

///|
let int_max_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_MIN")

///|
/// `INT_MAX_MIN`
pub fn int_max_min() -> @kernel.Thm {
  int_max_min_c.get()
}

///|
/// INT_MAX_SYM
fn step_193() -> Unit raise {
  int_max_sym_c.set(int_of_real_thm(@real.real_max_sym()))
}

///|
let int_max_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX_SYM")

///|
/// `INT_MAX_SYM`
pub fn int_max_sym() -> @kernel.Thm {
  int_max_sym_c.get()
}

///|
/// INT_MIN_ACI
fn step_194() -> Unit raise {
  int_min_aci_c.set(int_of_real_thm(@real.real_min_aci()))
}

///|
let int_min_aci_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_ACI")

///|
/// `INT_MIN_ACI`
pub fn int_min_aci() -> @kernel.Thm {
  int_min_aci_c.get()
}

///|
/// INT_MIN_ASSOC
fn step_195() -> Unit raise {
  int_min_assoc_c.set(int_of_real_thm(@real.real_min_assoc()))
}

///|
let int_min_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_ASSOC")

///|
/// `INT_MIN_ASSOC`
pub fn int_min_assoc() -> @kernel.Thm {
  int_min_assoc_c.get()
}

///|
/// INT_MIN_LE
fn step_196() -> Unit raise {
  int_min_le_c.set(int_of_real_thm(@real.real_min_le()))
}

///|
let int_min_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_LE")

///|
/// `INT_MIN_LE`
pub fn int_min_le() -> @kernel.Thm {
  int_min_le_c.get()
}

///|
/// INT_MIN_LT
fn step_197() -> Unit raise {
  int_min_lt_c.set(int_of_real_thm(@real.real_min_lt()))
}

///|
let int_min_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_LT")

///|
/// `INT_MIN_LT`
pub fn int_min_lt() -> @kernel.Thm {
  int_min_lt_c.get()
}

///|
/// INT_MIN_MAX
fn step_198() -> Unit raise {
  int_min_max_c.set(int_of_real_thm(@real.real_min_max()))
}

///|
let int_min_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_MAX")

///|
/// `INT_MIN_MAX`
pub fn int_min_max() -> @kernel.Thm {
  int_min_max_c.get()
}

///|
/// INT_MIN_MIN
fn step_199() -> Unit raise {
  int_min_min_c.set(int_of_real_thm(@real.real_min_min()))
}

///|
let int_min_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_MIN")

///|
/// `INT_MIN_MIN`
pub fn int_min_min() -> @kernel.Thm {
  int_min_min_c.get()
}

///|
/// INT_MIN_SYM
fn step_200() -> Unit raise {
  int_min_sym_c.set(int_of_real_thm(@real.real_min_sym()))
}

///|
let int_min_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN_SYM")

///|
/// `INT_MIN_SYM`
pub fn int_min_sym() -> @kernel.Thm {
  int_min_sym_c.get()
}

///|
/// INT_MUL_2
fn step_201() -> Unit raise {
  int_mul_2_c.set(int_of_real_thm(@real.real_mul_2()))
}

///|
let int_mul_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_2")

///|
/// `INT_MUL_2`
pub fn int_mul_2() -> @kernel.Thm {
  int_mul_2_c.get()
}

///|
/// INT_MUL_AC
fn step_202() -> Unit raise {
  int_mul_ac_c.set(int_of_real_thm(@real.real_mul_ac()))
}

///|
let int_mul_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_AC")

///|
/// `INT_MUL_AC`
pub fn int_mul_ac() -> @kernel.Thm {
  int_mul_ac_c.get()
}

///|
/// INT_MUL_ASSOC
fn step_203() -> Unit raise {
  int_mul_assoc_c.set(int_of_real_thm(@realax.real_mul_assoc()))
}

///|
let int_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_ASSOC")

///|
/// `INT_MUL_ASSOC`
pub fn int_mul_assoc() -> @kernel.Thm {
  int_mul_assoc_c.get()
}

///|
/// INT_MUL_LID
fn step_204() -> Unit raise {
  int_mul_lid_c.set(int_of_real_thm(@realax.real_mul_lid()))
}

///|
let int_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_LID")

///|
/// `INT_MUL_LID`
pub fn int_mul_lid() -> @kernel.Thm {
  int_mul_lid_c.get()
}

///|
/// INT_MUL_LNEG
fn step_205() -> Unit raise {
  int_mul_lneg_c.set(int_of_real_thm(@calc_int.real_mul_lneg()))
}

///|
let int_mul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_LNEG")

///|
/// `INT_MUL_LNEG`
pub fn int_mul_lneg() -> @kernel.Thm {
  int_mul_lneg_c.get()
}

///|
/// INT_MUL_LZERO
fn step_206() -> Unit raise {
  int_mul_lzero_c.set(int_of_real_thm(@calc_int.real_mul_lzero()))
}

///|
let int_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_LZERO")

///|
/// `INT_MUL_LZERO`
pub fn int_mul_lzero() -> @kernel.Thm {
  int_mul_lzero_c.get()
}

///|
/// INT_MUL_POS_LE
fn step_207() -> Unit raise {
  int_mul_pos_le_c.set(int_of_real_thm(@real.real_mul_pos_le()))
}

///|
let int_mul_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_POS_LE")

///|
/// `INT_MUL_POS_LE`
pub fn int_mul_pos_le() -> @kernel.Thm {
  int_mul_pos_le_c.get()
}

///|
/// INT_MUL_POS_LT
fn step_208() -> Unit raise {
  int_mul_pos_lt_c.set(int_of_real_thm(@real.real_mul_pos_lt()))
}

///|
let int_mul_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_POS_LT")

///|
/// `INT_MUL_POS_LT`
pub fn int_mul_pos_lt() -> @kernel.Thm {
  int_mul_pos_lt_c.get()
}

///|
/// INT_MUL_RID
fn step_209() -> Unit raise {
  int_mul_rid_c.set(int_of_real_thm(@realarith.real_mul_rid()))
}

///|
let int_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_RID")

///|
/// `INT_MUL_RID`
pub fn int_mul_rid() -> @kernel.Thm {
  int_mul_rid_c.get()
}

///|
/// INT_MUL_RNEG
fn step_210() -> Unit raise {
  int_mul_rneg_c.set(int_of_real_thm(@calc_int.real_mul_rneg()))
}

///|
let int_mul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_RNEG")

///|
/// `INT_MUL_RNEG`
pub fn int_mul_rneg() -> @kernel.Thm {
  int_mul_rneg_c.get()
}

///|
/// INT_MUL_RZERO
fn step_211() -> Unit raise {
  int_mul_rzero_c.set(int_of_real_thm(@calc_int.real_mul_rzero()))
}

///|
let int_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_RZERO")

///|
/// `INT_MUL_RZERO`
pub fn int_mul_rzero() -> @kernel.Thm {
  int_mul_rzero_c.get()
}

///|
/// INT_MUL_SYM
fn step_212() -> Unit raise {
  int_mul_sym_c.set(int_of_real_thm(@realax.real_mul_sym()))
}

///|
let int_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_SYM")

///|
/// `INT_MUL_SYM`
pub fn int_mul_sym() -> @kernel.Thm {
  int_mul_sym_c.get()
}

///|
/// INT_NEG_0
fn step_213() -> Unit raise {
  int_neg_0_c.set(int_of_real_thm(@calc_int.real_neg_0()))
}

///|
let int_neg_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_0")

///|
/// `INT_NEG_0`
pub fn int_neg_0() -> @kernel.Thm {
  int_neg_0_c.get()
}

///|
/// INT_NEG_ADD
fn step_214() -> Unit raise {
  int_neg_add_c.set(int_of_real_thm(@calc_int.real_neg_add()))
}

///|
let int_neg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_ADD")

///|
/// `INT_NEG_ADD`
pub fn int_neg_add() -> @kernel.Thm {
  int_neg_add_c.get()
}

///|
/// INT_NEG_EQ
fn step_215() -> Unit raise {
  int_neg_eq_c.set(int_of_real_thm(@real.real_neg_eq()))
}

///|
let int_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_EQ")

///|
/// `INT_NEG_EQ`
pub fn int_neg_eq() -> @kernel.Thm {
  int_neg_eq_c.get()
}

///|
/// INT_NEG_EQ_0
fn step_216() -> Unit raise {
  int_neg_eq_0_c.set(int_of_real_thm(@real.real_neg_eq_0()))
}

///|
let int_neg_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_EQ_0")

///|
/// `INT_NEG_EQ_0`
pub fn int_neg_eq_0() -> @kernel.Thm {
  int_neg_eq_0_c.get()
}

///|
/// INT_NEG_GE0
fn step_217() -> Unit raise {
  int_neg_ge0_c.set(int_of_real_thm(@real.real_neg_ge0()))
}

///|
let int_neg_ge0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_GE0")

///|
/// `INT_NEG_GE0`
pub fn int_neg_ge0() -> @kernel.Thm {
  int_neg_ge0_c.get()
}

///|
/// INT_NEG_GT0
fn step_218() -> Unit raise {
  int_neg_gt0_c.set(int_of_real_thm(@real.real_neg_gt0()))
}

///|
let int_neg_gt0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_GT0")

///|
/// `INT_NEG_GT0`
pub fn int_neg_gt0() -> @kernel.Thm {
  int_neg_gt0_c.get()
}

///|
/// INT_NEG_LE0
fn step_219() -> Unit raise {
  int_neg_le0_c.set(int_of_real_thm(@real.real_neg_le0()))
}

///|
let int_neg_le0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_LE0")

///|
/// `INT_NEG_LE0`
pub fn int_neg_le0() -> @kernel.Thm {
  int_neg_le0_c.get()
}

///|
/// INT_NEG_LMUL
fn step_220() -> Unit raise {
  int_neg_lmul_c.set(int_of_real_thm(@real.real_neg_lmul()))
}

///|
let int_neg_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_LMUL")

///|
/// `INT_NEG_LMUL`
pub fn int_neg_lmul() -> @kernel.Thm {
  int_neg_lmul_c.get()
}

///|
/// INT_NEG_LT0
fn step_221() -> Unit raise {
  int_neg_lt0_c.set(int_of_real_thm(@real.real_neg_lt0()))
}

///|
let int_neg_lt0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_LT0")

///|
/// `INT_NEG_LT0`
pub fn int_neg_lt0() -> @kernel.Thm {
  int_neg_lt0_c.get()
}

///|
/// INT_NEG_MINUS1
fn step_222() -> Unit raise {
  int_neg_minus1_c.set(int_of_real_thm(@real.real_neg_minus1()))
}

///|
let int_neg_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_MINUS1")

///|
/// `INT_NEG_MINUS1`
pub fn int_neg_minus1() -> @kernel.Thm {
  int_neg_minus1_c.get()
}

///|
/// INT_NEG_MUL2
fn step_223() -> Unit raise {
  int_neg_mul2_c.set(int_of_real_thm(@real.real_neg_mul2()))
}

///|
let int_neg_mul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_MUL2")

///|
/// `INT_NEG_MUL2`
pub fn int_neg_mul2() -> @kernel.Thm {
  int_neg_mul2_c.get()
}

///|
/// INT_NEG_NEG
fn step_224() -> Unit raise {
  int_neg_neg_c.set(int_of_real_thm(@calc_int.real_neg_neg()))
}

///|
let int_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_NEG")

///|
/// `INT_NEG_NEG`
pub fn int_neg_neg() -> @kernel.Thm {
  int_neg_neg_c.get()
}

///|
/// INT_NEG_RMUL
fn step_225() -> Unit raise {
  int_neg_rmul_c.set(int_of_real_thm(@real.real_neg_rmul()))
}

///|
let int_neg_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_RMUL")

///|
/// `INT_NEG_RMUL`
pub fn int_neg_rmul() -> @kernel.Thm {
  int_neg_rmul_c.get()
}

///|
/// INT_NEG_SUB
fn step_226() -> Unit raise {
  int_neg_sub_c.set(int_of_real_thm(@realarith.real_neg_sub()))
}

///|
let int_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_SUB")

///|
/// `INT_NEG_SUB`
pub fn int_neg_sub() -> @kernel.Thm {
  int_neg_sub_c.get()
}

///|
/// INT_NOT_EQ
fn step_227() -> Unit raise {
  int_not_eq_c.set(int_of_real_thm(@real.real_not_eq()))
}

///|
let int_not_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NOT_EQ")

///|
/// `INT_NOT_EQ`
pub fn int_not_eq() -> @kernel.Thm {
  int_not_eq_c.get()
}

///|
/// INT_NOT_LE
fn step_228() -> Unit raise {
  int_not_le_c.set(int_of_real_thm(@real.real_not_le()))
}

///|
let int_not_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NOT_LE")

///|
/// `INT_NOT_LE`
pub fn int_not_le() -> @kernel.Thm {
  int_not_le_c.get()
}

///|
/// INT_NOT_LT
fn step_229() -> Unit raise {
  int_not_lt_c.set(int_of_real_thm(@realarith.real_not_lt()))
}

///|
let int_not_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NOT_LT")

///|
/// `INT_NOT_LT`
pub fn int_not_lt() -> @kernel.Thm {
  int_not_lt_c.get()
}

///|
/// INT_OF_NUM_ADD
fn step_230() -> Unit raise {
  int_of_num_add_c.set(int_of_real_thm(@realax.real_of_num_add()))
}

///|
let int_of_num_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_ADD")

///|
/// `INT_OF_NUM_ADD`
pub fn int_of_num_add() -> @kernel.Thm {
  int_of_num_add_c.get()
}

///|
/// INT_OF_NUM_CLAUSES
fn step_231() -> Unit raise {
  int_of_num_clauses_c.set(int_of_real_thm(@real.real_of_num_clauses()))
}

///|
let int_of_num_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_CLAUSES",
)

///|
/// `INT_OF_NUM_CLAUSES`
pub fn int_of_num_clauses() -> @kernel.Thm {
  int_of_num_clauses_c.get()
}

///|
/// INT_OF_NUM_EQ
fn step_232() -> Unit raise {
  int_of_num_eq_c.set(int_of_real_thm(@realax.real_of_num_eq()))
}

///|
let int_of_num_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_EQ")

///|
/// `INT_OF_NUM_EQ`
pub fn int_of_num_eq() -> @kernel.Thm {
  int_of_num_eq_c.get()
}

///|
/// INT_OF_NUM_GE
fn step_233() -> Unit raise {
  int_of_num_ge_c.set(int_of_real_thm(@real.real_of_num_ge()))
}

///|
let int_of_num_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_GE")

///|
/// `INT_OF_NUM_GE`
pub fn int_of_num_ge() -> @kernel.Thm {
  int_of_num_ge_c.get()
}

///|
/// INT_OF_NUM_GT
fn step_234() -> Unit raise {
  int_of_num_gt_c.set(int_of_real_thm(@real.real_of_num_gt()))
}

///|
let int_of_num_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_GT")

///|
/// `INT_OF_NUM_GT`
pub fn int_of_num_gt() -> @kernel.Thm {
  int_of_num_gt_c.get()
}

///|
/// INT_OF_NUM_LE
fn step_235() -> Unit raise {
  int_of_num_le_c.set(int_of_real_thm(@realax.real_of_num_le()))
}

///|
let int_of_num_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_LE")

///|
/// `INT_OF_NUM_LE`
pub fn int_of_num_le() -> @kernel.Thm {
  int_of_num_le_c.get()
}

///|
/// INT_OF_NUM_LT
fn step_236() -> Unit raise {
  int_of_num_lt_c.set(int_of_real_thm(@real.real_of_num_lt()))
}

///|
let int_of_num_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_LT")

///|
/// `INT_OF_NUM_LT`
pub fn int_of_num_lt() -> @kernel.Thm {
  int_of_num_lt_c.get()
}

///|
/// INT_OF_NUM_MAX
fn step_237() -> Unit raise {
  int_of_num_max_c.set(int_of_real_thm(@real.real_of_num_max()))
}

///|
let int_of_num_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_MAX")

///|
/// `INT_OF_NUM_MAX`
pub fn int_of_num_max() -> @kernel.Thm {
  int_of_num_max_c.get()
}

///|
/// INT_OF_NUM_MIN
fn step_238() -> Unit raise {
  int_of_num_min_c.set(int_of_real_thm(@real.real_of_num_min()))
}

///|
let int_of_num_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_MIN")

///|
/// `INT_OF_NUM_MIN`
pub fn int_of_num_min() -> @kernel.Thm {
  int_of_num_min_c.get()
}

///|
/// INT_OF_NUM_MOD
fn step_239() -> Unit raise {
  int_of_num_mod_c.set(int_of_real_thm(@real.real_of_num_mod()))
}

///|
let int_of_num_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_MOD")

///|
/// `INT_OF_NUM_MOD`
pub fn int_of_num_mod() -> @kernel.Thm {
  int_of_num_mod_c.get()
}

///|
/// INT_OF_NUM_MUL
fn step_240() -> Unit raise {
  int_of_num_mul_c.set(int_of_real_thm(@realax.real_of_num_mul()))
}

///|
let int_of_num_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_MUL")

///|
/// `INT_OF_NUM_MUL`
pub fn int_of_num_mul() -> @kernel.Thm {
  int_of_num_mul_c.get()
}

///|
/// INT_OF_NUM_POW
fn step_241() -> Unit raise {
  int_of_num_pow_c.set(int_of_real_thm(@calc_int.real_of_num_pow()))
}

///|
let int_of_num_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_POW")

///|
/// `INT_OF_NUM_POW`
pub fn int_of_num_pow() -> @kernel.Thm {
  int_of_num_pow_c.get()
}

///|
/// INT_OF_NUM_SUB
fn step_242() -> Unit raise {
  int_of_num_sub_c.set(int_of_real_thm(@real.real_of_num_sub()))
}

///|
let int_of_num_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_SUB")

///|
/// `INT_OF_NUM_SUB`
pub fn int_of_num_sub() -> @kernel.Thm {
  int_of_num_sub_c.get()
}

///|
/// INT_OF_NUM_SUB_CASES
fn step_243() -> Unit raise {
  int_of_num_sub_cases_c.set(int_of_real_thm(@real.real_of_num_sub_cases()))
}

///|
let int_of_num_sub_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_SUB_CASES",
)

///|
/// `INT_OF_NUM_SUB_CASES`
pub fn int_of_num_sub_cases() -> @kernel.Thm {
  int_of_num_sub_cases_c.get()
}

///|
/// INT_OF_NUM_SUC
fn step_244() -> Unit raise {
  int_of_num_suc_c.set(int_of_real_thm(@real.real_of_num_suc()))
}

///|
let int_of_num_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_SUC")

///|
/// `INT_OF_NUM_SUC`
pub fn int_of_num_suc() -> @kernel.Thm {
  int_of_num_suc_c.get()
}

///|
/// INT_POS
fn step_245() -> Unit raise {
  int_pos_c.set(int_of_real_thm(@realarith.real_pos()))
}

///|
let int_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POS")

///|
/// `INT_POS`
pub fn int_pos() -> @kernel.Thm {
  int_pos_c.get()
}

///|
/// INT_POS_EQ_SQUARE
fn step_246() -> Unit raise {
  int_pos_eq_square_c.set(int_of_real_thm(@real.real_pos_eq_square()))
}

///|
let int_pos_eq_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POS_EQ_SQUARE",
)

///|
/// `INT_POS_EQ_SQUARE`
pub fn int_pos_eq_square() -> @kernel.Thm {
  int_pos_eq_square_c.get()
}

///|
/// INT_POS_NZ
fn step_247() -> Unit raise {
  int_pos_nz_c.set(int_of_real_thm(@real.real_lt_imp_nz()))
}

///|
let int_pos_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POS_NZ")

///|
/// `INT_POS_NZ`
pub fn int_pos_nz() -> @kernel.Thm {
  int_pos_nz_c.get()
}

///|
/// INT_POW2_ABS
fn step_248() -> Unit raise {
  int_pow2_abs_c.set(int_of_real_thm(@real.real_pow2_abs()))
}

///|
let int_pow2_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW2_ABS")

///|
/// `INT_POW2_ABS`
pub fn int_pow2_abs() -> @kernel.Thm {
  int_pow2_abs_c.get()
}

///|
/// INT_POW_1
fn step_249() -> Unit raise {
  int_pow_1_c.set(int_of_real_thm(@real.real_pow_1()))
}

///|
let int_pow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_1")

///|
/// `INT_POW_1`
pub fn int_pow_1() -> @kernel.Thm {
  int_pow_1_c.get()
}

///|
/// INT_POW_1_LE
fn step_250() -> Unit raise {
  int_pow_1_le_c.set(int_of_real_thm(@real.real_pow_1_le()))
}

///|
let int_pow_1_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_1_LE")

///|
/// `INT_POW_1_LE`
pub fn int_pow_1_le() -> @kernel.Thm {
  int_pow_1_le_c.get()
}

///|
/// INT_POW_1_LT
fn step_251() -> Unit raise {
  int_pow_1_lt_c.set(int_of_real_thm(@real.real_pow_1_lt()))
}

///|
let int_pow_1_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_1_LT")

///|
/// `INT_POW_1_LT`
pub fn int_pow_1_lt() -> @kernel.Thm {
  int_pow_1_lt_c.get()
}

///|
/// INT_POW_2
fn step_252() -> Unit raise {
  int_pow_2_c.set(int_of_real_thm(@realarith.real_pow_2()))
}

///|
let int_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_2")

///|
/// `INT_POW_2`
pub fn int_pow_2() -> @kernel.Thm {
  int_pow_2_c.get()
}

///|
/// INT_POW_ADD
fn step_253() -> Unit raise {
  int_pow_add_c.set(int_of_real_thm(@real.real_pow_add()))
}

///|
let int_pow_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_ADD")

///|
/// `INT_POW_ADD`
pub fn int_pow_add() -> @kernel.Thm {
  int_pow_add_c.get()
}

///|
/// INT_POW_EQ
fn step_254() -> Unit raise {
  int_pow_eq_c.set(int_of_real_thm(@real.real_pow_eq()))
}

///|
let int_pow_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ")

///|
/// `INT_POW_EQ`
pub fn int_pow_eq() -> @kernel.Thm {
  int_pow_eq_c.get()
}

///|
/// INT_POW_EQ_0
fn step_255() -> Unit raise {
  int_pow_eq_0_c.set(int_of_real_thm(@real.real_pow_eq_0()))
}

///|
let int_pow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ_0")

///|
/// `INT_POW_EQ_0`
pub fn int_pow_eq_0() -> @kernel.Thm {
  int_pow_eq_0_c.get()
}

///|
/// INT_POW_EQ_1
fn step_256() -> Unit raise {
  int_pow_eq_1_c.set(int_of_real_thm(@real.real_pow_eq_1()))
}

///|
let int_pow_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ_1")

///|
/// `INT_POW_EQ_1`
pub fn int_pow_eq_1() -> @kernel.Thm {
  int_pow_eq_1_c.get()
}

///|
/// INT_POW_EQ_1_IMP
fn step_257() -> Unit raise {
  int_pow_eq_1_imp_c.set(int_of_real_thm(@real.real_pow_eq_1_imp()))
}

///|
let int_pow_eq_1_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_EQ_1_IMP",
)

///|
/// `INT_POW_EQ_1_IMP`
pub fn int_pow_eq_1_imp() -> @kernel.Thm {
  int_pow_eq_1_imp_c.get()
}

///|
/// INT_POW_EQ_ABS
fn step_258() -> Unit raise {
  int_pow_eq_abs_c.set(int_of_real_thm(@real.real_pow_eq_abs()))
}

///|
let int_pow_eq_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ_ABS")

///|
/// `INT_POW_EQ_ABS`
pub fn int_pow_eq_abs() -> @kernel.Thm {
  int_pow_eq_abs_c.get()
}

///|
/// INT_POW_EQ_EQ
fn step_259() -> Unit raise {
  int_pow_eq_eq_c.set(int_of_real_thm(@real.real_pow_eq_eq()))
}

///|
let int_pow_eq_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ_EQ")

///|
/// `INT_POW_EQ_EQ`
pub fn int_pow_eq_eq() -> @kernel.Thm {
  int_pow_eq_eq_c.get()
}

///|
/// INT_POW_EQ_ODD
fn step_260() -> Unit raise {
  int_pow_eq_odd_c.set(int_of_real_thm(@real.real_pow_eq_odd()))
}

///|
let int_pow_eq_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EQ_ODD")

///|
/// `INT_POW_EQ_ODD`
pub fn int_pow_eq_odd() -> @kernel.Thm {
  int_pow_eq_odd_c.get()
}

///|
/// INT_POW_EQ_ODD_EQ
fn step_261() -> Unit raise {
  int_pow_eq_odd_eq_c.set(int_of_real_thm(@real.real_pow_eq_odd_eq()))
}

///|
let int_pow_eq_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_EQ_ODD_EQ",
)

///|
/// `INT_POW_EQ_ODD_EQ`
pub fn int_pow_eq_odd_eq() -> @kernel.Thm {
  int_pow_eq_odd_eq_c.get()
}

///|
/// INT_POW_LBOUND
fn step_262() -> Unit raise {
  int_pow_lbound_c.set(int_of_real_thm(@real.real_pow_lbound()))
}

///|
let int_pow_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LBOUND")

///|
/// `INT_POW_LBOUND`
pub fn int_pow_lbound() -> @kernel.Thm {
  int_pow_lbound_c.get()
}

///|
/// INT_POW_LE
fn step_263() -> Unit raise {
  int_pow_le_c.set(int_of_real_thm(@real.real_pow_le()))
}

///|
let int_pow_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LE")

///|
/// `INT_POW_LE`
pub fn int_pow_le() -> @kernel.Thm {
  int_pow_le_c.get()
}

///|
/// INT_POW_LE2
fn step_264() -> Unit raise {
  int_pow_le2_c.set(int_of_real_thm(@real.real_pow_le2()))
}

///|
let int_pow_le2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LE2")

///|
/// `INT_POW_LE2`
pub fn int_pow_le2() -> @kernel.Thm {
  int_pow_le2_c.get()
}

///|
/// INT_POW_LE2_ODD
fn step_265() -> Unit raise {
  int_pow_le2_odd_c.set(int_of_real_thm(@real.real_pow_le2_odd()))
}

///|
let int_pow_le2_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LE2_ODD",
)

///|
/// `INT_POW_LE2_ODD`
pub fn int_pow_le2_odd() -> @kernel.Thm {
  int_pow_le2_odd_c.get()
}

///|
/// INT_POW_LE2_ODD_EQ
fn step_266() -> Unit raise {
  int_pow_le2_odd_eq_c.set(int_of_real_thm(@real.real_pow_le2_odd_eq()))
}

///|
let int_pow_le2_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LE2_ODD_EQ",
)

///|
/// `INT_POW_LE2_ODD_EQ`
pub fn int_pow_le2_odd_eq() -> @kernel.Thm {
  int_pow_le2_odd_eq_c.get()
}

///|
/// INT_POW_LE2_REV
fn step_267() -> Unit raise {
  int_pow_le2_rev_c.set(int_of_real_thm(@real.real_pow_le2_rev()))
}

///|
let int_pow_le2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LE2_REV",
)

///|
/// `INT_POW_LE2_REV`
pub fn int_pow_le2_rev() -> @kernel.Thm {
  int_pow_le2_rev_c.get()
}

///|
/// INT_POW_LE_1
fn step_268() -> Unit raise {
  int_pow_le_1_c.set(int_of_real_thm(@real.real_pow_le_1()))
}

///|
let int_pow_le_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LE_1")

///|
/// `INT_POW_LE_1`
pub fn int_pow_le_1() -> @kernel.Thm {
  int_pow_le_1_c.get()
}

///|
/// INT_POW_LT
fn step_269() -> Unit raise {
  int_pow_lt_c.set(int_of_real_thm(@real.real_pow_lt()))
}

///|
let int_pow_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LT")

///|
/// `INT_POW_LT`
pub fn int_pow_lt() -> @kernel.Thm {
  int_pow_lt_c.get()
}

///|
/// INT_POW_LT2
fn step_270() -> Unit raise {
  int_pow_lt2_c.set(int_of_real_thm(@real.real_pow_lt2()))
}

///|
let int_pow_lt2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LT2")

///|
/// `INT_POW_LT2`
pub fn int_pow_lt2() -> @kernel.Thm {
  int_pow_lt2_c.get()
}

///|
/// INT_POW_LT2_ODD
fn step_271() -> Unit raise {
  int_pow_lt2_odd_c.set(int_of_real_thm(@real.real_pow_lt2_odd()))
}

///|
let int_pow_lt2_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LT2_ODD",
)

///|
/// `INT_POW_LT2_ODD`
pub fn int_pow_lt2_odd() -> @kernel.Thm {
  int_pow_lt2_odd_c.get()
}

///|
/// INT_POW_LT2_ODD_EQ
fn step_272() -> Unit raise {
  int_pow_lt2_odd_eq_c.set(int_of_real_thm(@real.real_pow_lt2_odd_eq()))
}

///|
let int_pow_lt2_odd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LT2_ODD_EQ",
)

///|
/// `INT_POW_LT2_ODD_EQ`
pub fn int_pow_lt2_odd_eq() -> @kernel.Thm {
  int_pow_lt2_odd_eq_c.get()
}

///|
/// INT_POW_LT2_REV
fn step_273() -> Unit raise {
  int_pow_lt2_rev_c.set(int_of_real_thm(@real.real_pow_lt2_rev()))
}

///|
let int_pow_lt2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_LT2_REV",
)

///|
/// `INT_POW_LT2_REV`
pub fn int_pow_lt2_rev() -> @kernel.Thm {
  int_pow_lt2_rev_c.get()
}

///|
/// INT_POW_LT_1
fn step_274() -> Unit raise {
  int_pow_lt_1_c.set(int_of_real_thm(@real.real_pow_lt_1()))
}

///|
let int_pow_lt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_LT_1")

///|
/// `INT_POW_LT_1`
pub fn int_pow_lt_1() -> @kernel.Thm {
  int_pow_lt_1_c.get()
}

///|
/// INT_POW_MONO
fn step_275() -> Unit raise {
  int_pow_mono_c.set(int_of_real_thm(@real.real_pow_mono()))
}

///|
let int_pow_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_MONO")

///|
/// `INT_POW_MONO`
pub fn int_pow_mono() -> @kernel.Thm {
  int_pow_mono_c.get()
}

///|
/// INT_POW_MONO_LT
fn step_276() -> Unit raise {
  int_pow_mono_lt_c.set(int_of_real_thm(@real.real_pow_mono_lt()))
}

///|
let int_pow_mono_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_POW_MONO_LT",
)

///|
/// `INT_POW_MONO_LT`
pub fn int_pow_mono_lt() -> @kernel.Thm {
  int_pow_mono_lt_c.get()
}

///|
/// INT_POW_MUL
fn step_277() -> Unit raise {
  int_pow_mul_c.set(int_of_real_thm(@real.real_pow_mul()))
}

///|
let int_pow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_MUL")

///|
/// `INT_POW_MUL`
pub fn int_pow_mul() -> @kernel.Thm {
  int_pow_mul_c.get()
}

///|
/// INT_POW_NEG
fn step_278() -> Unit raise {
  int_pow_neg_c.set(int_of_real_thm(@calc_int.real_pow_neg()))
}

///|
let int_pow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_NEG")

///|
/// `INT_POW_NEG`
pub fn int_pow_neg() -> @kernel.Thm {
  int_pow_neg_c.get()
}

///|
/// INT_POW_NZ
fn step_279() -> Unit raise {
  int_pow_nz_c.set(int_of_real_thm(@real.real_pow_nz()))
}

///|
let int_pow_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_NZ")

///|
/// `INT_POW_NZ`
pub fn int_pow_nz() -> @kernel.Thm {
  int_pow_nz_c.get()
}

///|
/// INT_POW_ONE
fn step_280() -> Unit raise {
  int_pow_one_c.set(int_of_real_thm(@real.real_pow_one()))
}

///|
let int_pow_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_ONE")

///|
/// `INT_POW_ONE`
pub fn int_pow_one() -> @kernel.Thm {
  int_pow_one_c.get()
}

///|
/// INT_POW_POW
fn step_281() -> Unit raise {
  int_pow_pow_c.set(int_of_real_thm(@real.real_pow_pow()))
}

///|
let int_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_POW")

///|
/// `INT_POW_POW`
pub fn int_pow_pow() -> @kernel.Thm {
  int_pow_pow_c.get()
}

///|
/// INT_POW_ZERO
fn step_282() -> Unit raise {
  int_pow_zero_c.set(int_of_real_thm(@real.real_pow_zero()))
}

///|
let int_pow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_ZERO")

///|
/// `INT_POW_ZERO`
pub fn int_pow_zero() -> @kernel.Thm {
  int_pow_zero_c.get()
}

///|
/// INT_RNEG_UNIQ
fn step_283() -> Unit raise {
  int_rneg_uniq_c.set(int_of_real_thm(@real.real_rneg_uniq()))
}

///|
let int_rneg_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_RNEG_UNIQ")

///|
/// `INT_RNEG_UNIQ`
pub fn int_rneg_uniq() -> @kernel.Thm {
  int_rneg_uniq_c.get()
}

///|
/// INT_SGN
fn step_284() -> Unit raise {
  int_sgn_v1_c.set(int_of_real_thm(@real.real_sgn()))
}

///|
let int_sgn_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN")

///|
/// `INT_SGN`
pub fn int_sgn_v1() -> @kernel.Thm {
  int_sgn_v1_c.get()
}

///|
/// INT_SGNS_EQ
fn step_285() -> Unit raise {
  int_sgns_eq_c.set(int_of_real_thm(@real.real_sgns_eq()))
}

///|
let int_sgns_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGNS_EQ")

///|
/// `INT_SGNS_EQ`
pub fn int_sgns_eq() -> @kernel.Thm {
  int_sgns_eq_c.get()
}

///|
/// INT_SGNS_EQ_ALT
fn step_286() -> Unit raise {
  int_sgns_eq_alt_c.set(int_of_real_thm(@real.real_sgns_eq_alt()))
}

///|
let int_sgns_eq_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SGNS_EQ_ALT",
)

///|
/// `INT_SGNS_EQ_ALT`
pub fn int_sgns_eq_alt() -> @kernel.Thm {
  int_sgns_eq_alt_c.get()
}

///|
/// INT_SGN_0
fn step_287() -> Unit raise {
  int_sgn_0_c.set(int_of_real_thm(@real.real_sgn_0()))
}

///|
let int_sgn_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_0")

///|
/// `INT_SGN_0`
pub fn int_sgn_0() -> @kernel.Thm {
  int_sgn_0_c.get()
}

///|
/// INT_SGN_ABS
fn step_288() -> Unit raise {
  int_sgn_abs_c.set(int_of_real_thm(@real.real_sgn_abs()))
}

///|
let int_sgn_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_ABS")

///|
/// `INT_SGN_ABS`
pub fn int_sgn_abs() -> @kernel.Thm {
  int_sgn_abs_c.get()
}

///|
/// INT_SGN_ABS_ALT
fn step_289() -> Unit raise {
  int_sgn_abs_alt_c.set(int_of_real_thm(@real.real_sgn_abs_alt()))
}

///|
let int_sgn_abs_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SGN_ABS_ALT",
)

///|
/// `INT_SGN_ABS_ALT`
pub fn int_sgn_abs_alt() -> @kernel.Thm {
  int_sgn_abs_alt_c.get()
}

///|
/// INT_SGN_CASES
fn step_290() -> Unit raise {
  int_sgn_cases_c.set(int_of_real_thm(@real.real_sgn_cases()))
}

///|
let int_sgn_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_CASES")

///|
/// `INT_SGN_CASES`
pub fn int_sgn_cases() -> @kernel.Thm {
  int_sgn_cases_c.get()
}

///|
/// INT_SGN_EQ
fn step_291() -> Unit raise {
  int_sgn_eq_c.set(int_of_real_thm(@real.real_sgn_eq()))
}

///|
let int_sgn_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_EQ")

///|
/// `INT_SGN_EQ`
pub fn int_sgn_eq() -> @kernel.Thm {
  int_sgn_eq_c.get()
}

///|
/// INT_SGN_EQ_INEQ
fn step_292() -> Unit raise {
  int_sgn_eq_ineq_c.set(int_of_real_thm(@real.real_sgn_eq_ineq()))
}

///|
let int_sgn_eq_ineq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SGN_EQ_INEQ",
)

///|
/// `INT_SGN_EQ_INEQ`
pub fn int_sgn_eq_ineq() -> @kernel.Thm {
  int_sgn_eq_ineq_c.get()
}

///|
/// INT_SGN_INEQS
fn step_293() -> Unit raise {
  int_sgn_ineqs_c.set(int_of_real_thm(@real.real_sgn_ineqs()))
}

///|
let int_sgn_ineqs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_INEQS")

///|
/// `INT_SGN_INEQS`
pub fn int_sgn_ineqs() -> @kernel.Thm {
  int_sgn_ineqs_c.get()
}

///|
/// INT_SGN_INT_SGN
fn step_294() -> Unit raise {
  int_sgn_int_sgn_c.set(int_of_real_thm(@real.real_sgn_real_sgn()))
}

///|
let int_sgn_int_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SGN_INT_SGN",
)

///|
/// `INT_SGN_INT_SGN`
pub fn int_sgn_int_sgn() -> @kernel.Thm {
  int_sgn_int_sgn_c.get()
}

///|
/// INT_SGN_MUL
fn step_295() -> Unit raise {
  int_sgn_mul_c.set(int_of_real_thm(@real.real_sgn_mul()))
}

///|
let int_sgn_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_MUL")

///|
/// `INT_SGN_MUL`
pub fn int_sgn_mul() -> @kernel.Thm {
  int_sgn_mul_c.get()
}

///|
/// INT_SGN_NEG
fn step_296() -> Unit raise {
  int_sgn_neg_c.set(int_of_real_thm(@real.real_sgn_neg()))
}

///|
let int_sgn_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_NEG")

///|
/// `INT_SGN_NEG`
pub fn int_sgn_neg() -> @kernel.Thm {
  int_sgn_neg_c.get()
}

///|
/// INT_SGN_POW
fn step_297() -> Unit raise {
  int_sgn_pow_c.set(int_of_real_thm(@real.real_sgn_pow()))
}

///|
let int_sgn_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_POW")

///|
/// `INT_SGN_POW`
pub fn int_sgn_pow() -> @kernel.Thm {
  int_sgn_pow_c.get()
}

///|
/// INT_SGN_POW_2
fn step_298() -> Unit raise {
  int_sgn_pow_2_c.set(int_of_real_thm(@real.real_sgn_pow_2()))
}

///|
let int_sgn_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SGN_POW_2")

///|
/// `INT_SGN_POW_2`
pub fn int_sgn_pow_2() -> @kernel.Thm {
  int_sgn_pow_2_c.get()
}

///|
/// INT_SOS_EQ_0
fn step_299() -> Unit raise {
  int_sos_eq_0_c.set(int_of_real_thm(@real.real_sos_eq_0()))
}

///|
let int_sos_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SOS_EQ_0")

///|
/// `INT_SOS_EQ_0`
pub fn int_sos_eq_0() -> @kernel.Thm {
  int_sos_eq_0_c.get()
}

///|
/// INT_SUB_0
fn step_300() -> Unit raise {
  int_sub_0_c.set(int_of_real_thm(@realarith.real_sub_0()))
}

///|
let int_sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_0")

///|
/// `INT_SUB_0`
pub fn int_sub_0() -> @kernel.Thm {
  int_sub_0_c.get()
}

///|
/// INT_SUB_ABS
fn step_301() -> Unit raise {
  int_sub_abs_c.set(int_of_real_thm(@real.real_sub_abs()))
}

///|
let int_sub_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_ABS")

///|
/// `INT_SUB_ABS`
pub fn int_sub_abs() -> @kernel.Thm {
  int_sub_abs_c.get()
}

///|
/// INT_SUB_ADD
fn step_302() -> Unit raise {
  int_sub_add_c.set(int_of_real_thm(@real.real_sub_add()))
}

///|
let int_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_ADD")

///|
/// `INT_SUB_ADD`
pub fn int_sub_add() -> @kernel.Thm {
  int_sub_add_c.get()
}

///|
/// INT_SUB_ADD2
fn step_303() -> Unit raise {
  int_sub_add2_c.set(int_of_real_thm(@real.real_sub_add2()))
}

///|
let int_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_ADD2")

///|
/// `INT_SUB_ADD2`
pub fn int_sub_add2() -> @kernel.Thm {
  int_sub_add2_c.get()
}

///|
/// INT_SUB_LDISTRIB
fn step_304() -> Unit raise {
  int_sub_ldistrib_c.set(int_of_real_thm(@real.real_sub_ldistrib()))
}

///|
let int_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SUB_LDISTRIB",
)

///|
/// `INT_SUB_LDISTRIB`
pub fn int_sub_ldistrib() -> @kernel.Thm {
  int_sub_ldistrib_c.get()
}

///|
/// INT_SUB_LE
fn step_305() -> Unit raise {
  int_sub_le_c.set(int_of_real_thm(@realarith.real_sub_le()))
}

///|
let int_sub_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_LE")

///|
/// `INT_SUB_LE`
pub fn int_sub_le() -> @kernel.Thm {
  int_sub_le_c.get()
}

///|
/// INT_SUB_LNEG
fn step_306() -> Unit raise {
  int_sub_lneg_c.set(int_of_real_thm(@real.real_sub_lneg()))
}

///|
let int_sub_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_LNEG")

///|
/// `INT_SUB_LNEG`
pub fn int_sub_lneg() -> @kernel.Thm {
  int_sub_lneg_c.get()
}

///|
/// INT_SUB_LT
fn step_307() -> Unit raise {
  int_sub_lt_c.set(int_of_real_thm(@realarith.real_sub_lt()))
}

///|
let int_sub_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_LT")

///|
/// `INT_SUB_LT`
pub fn int_sub_lt() -> @kernel.Thm {
  int_sub_lt_c.get()
}

///|
/// INT_SUB_LZERO
fn step_308() -> Unit raise {
  int_sub_lzero_c.set(int_of_real_thm(@real.real_sub_lzero()))
}

///|
let int_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_LZERO")

///|
/// `INT_SUB_LZERO`
pub fn int_sub_lzero() -> @kernel.Thm {
  int_sub_lzero_c.get()
}

///|
/// INT_SUB_NEG2
fn step_309() -> Unit raise {
  int_sub_neg2_c.set(int_of_real_thm(@real.real_sub_neg2()))
}

///|
let int_sub_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_NEG2")

///|
/// `INT_SUB_NEG2`
pub fn int_sub_neg2() -> @kernel.Thm {
  int_sub_neg2_c.get()
}

///|
/// INT_SUB_RDISTRIB
fn step_310() -> Unit raise {
  int_sub_rdistrib_c.set(int_of_real_thm(@real.real_sub_rdistrib()))
}

///|
let int_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SUB_RDISTRIB",
)

///|
/// `INT_SUB_RDISTRIB`
pub fn int_sub_rdistrib() -> @kernel.Thm {
  int_sub_rdistrib_c.get()
}

///|
/// INT_SUB_REFL
fn step_311() -> Unit raise {
  int_sub_refl_c.set(int_of_real_thm(@real.real_sub_refl()))
}

///|
let int_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_REFL")

///|
/// `INT_SUB_REFL`
pub fn int_sub_refl() -> @kernel.Thm {
  int_sub_refl_c.get()
}

///|
/// INT_SUB_RNEG
fn step_312() -> Unit raise {
  int_sub_rneg_c.set(int_of_real_thm(@real.real_sub_rneg()))
}

///|
let int_sub_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_RNEG")

///|
/// `INT_SUB_RNEG`
pub fn int_sub_rneg() -> @kernel.Thm {
  int_sub_rneg_c.get()
}

///|
/// INT_SUB_RZERO
fn step_313() -> Unit raise {
  int_sub_rzero_c.set(int_of_real_thm(@real.real_sub_rzero()))
}

///|
let int_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_RZERO")

///|
/// `INT_SUB_RZERO`
pub fn int_sub_rzero() -> @kernel.Thm {
  int_sub_rzero_c.get()
}

///|
/// INT_SUB_SUB
fn step_314() -> Unit raise {
  int_sub_sub_c.set(int_of_real_thm(@real.real_sub_sub()))
}

///|
let int_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_SUB")

///|
/// `INT_SUB_SUB`
pub fn int_sub_sub() -> @kernel.Thm {
  int_sub_sub_c.get()
}

///|
/// INT_SUB_SUB2
fn step_315() -> Unit raise {
  int_sub_sub2_c.set(int_of_real_thm(@real.real_sub_sub2()))
}

///|
let int_sub_sub2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_SUB2")

///|
/// `INT_SUB_SUB2`
pub fn int_sub_sub2() -> @kernel.Thm {
  int_sub_sub2_c.get()
}

///|
/// INT_SUB_TRIANGLE
fn step_316() -> Unit raise {
  int_sub_triangle_c.set(int_of_real_thm(@real.real_sub_triangle()))
}

///|
let int_sub_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_SUB_TRIANGLE",
)

///|
/// `INT_SUB_TRIANGLE`
pub fn int_sub_triangle() -> @kernel.Thm {
  int_sub_triangle_c.get()
}

///|
/// INT_WLOG_LE
fn step_317() -> Unit raise {
  let t154 = @meson.meson_tac(@list.List([int_le_total()]))
  int_wlog_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Int, ∀ y : Int, (P : (Int, Int) -> Bool)(x, y) == P(y, x)) && (∀ x : Int, ∀ y : Int, x <= y → P(x, y)) → (∀ x : Int, ∀ y : Int, P(x, y))"),
      t154,
    ),
  )
}

///|
let int_wlog_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_WLOG_LE")

///|
/// `INT_WLOG_LE`
pub fn int_wlog_le() -> @kernel.Thm {
  int_wlog_le_c.get()
}

///|
/// INT_WLOG_LT
fn step_318() -> Unit raise {
  let t155 = @meson.meson_tac(@list.List([int_lt_total()]))
  int_wlog_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Int, (P : (Int, Int) -> Bool)(x, x)) && (∀ x : Int, ∀ y : Int, P(x, y) == P(y, x)) && (∀ x : Int, ∀ y : Int, x < y → P(x, y)) → (∀ x : Int, ∀ y : Int, P(x, y))"),
      t155,
    ),
  )
}

///|
let int_wlog_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_WLOG_LT")

///|
/// `INT_WLOG_LT`
pub fn int_wlog_lt() -> @kernel.Thm {
  int_wlog_lt_c.get()
}

///|
/// INT_WLOG_LE_3
fn step_319() -> Unit raise {
  let t156 = @meson.meson_tac(@list.List([int_le_total()]))
  int_wlog_le_3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int, Int, Int) -> Bool, (∀ x : Int, ∀ y : Int, ∀ z : Int, P(x, y, z) → P(y, x, z) && P(x, z, y)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, x <= y && y <= z → P(x, y, z)) → (∀ x : Int, ∀ y : Int, ∀ z : Int, P(x, y, z))"),
      t156,
    ),
  )
}

///|
let int_wlog_le_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_WLOG_LE_3")

///|
/// `INT_WLOG_LE_3`
pub fn int_wlog_le_3() -> @kernel.Thm {
  int_wlog_le_3_c.get()
}

///|
/// INT_FORALL_POS
fn step_320() -> Unit raise {
  let t167 = @simp.rewrite_tac(@list.List([int_of_num_le(), @arith.le_0()]))
  let t168 = @tactics.then_tac(
    @tactics.first_assum(@tactics.match_mp_tac),
    t167,
  )
  let t166 = @simp.asm_rewrite_tac(@list.List([int_neg_0()]))
  let t165 = @tactics.disch_then(fn(
    x162 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s163 = @tactics.subst1_tac(x162)
    fn(
      x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s163(x164)
    }
  })
  let t161 = @simp.asm_rewrite_tac(
    @list.List([int_le_rneg(), int_add_lid(), int_of_num_le(), @arith.le()]),
  )
  let t160 = @bool.spec(@term_syntax.parse_term("(i : Int)"), int_image())
  let t169 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disj_cases_then(
            @tactics.choose_then(fn(
              x157 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s158 = @tactics.subst1_tac(x157)
              fn(
                x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s158(x159)
              }
            }),
          )(t160),
          t161,
        ),
        t165,
      ),
      t166,
    ),
    t168,
  ])
  let t170 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
        @tactics.disch_tac,
      ),
      @tactics.gen_tac,
    ),
    t169,
  )
  int_forall_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∀ n : Num, P(int_of_num(n))) == (∀ i : Int, int_le(int_of_num(0), i) → P(i))"),
      t170,
    ),
  )
}

///|
let int_forall_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_FORALL_POS")

///|
/// `INT_FORALL_POS`
pub fn int_forall_pos() -> @kernel.Thm {
  int_forall_pos_c.get()
}

///|
/// INT_EXISTS_POS
fn step_321() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([]))
  let t172 = @simp.rewrite_tac(
    @list.List([@class.not_exists_thm(), int_forall_pos()]),
  )
  let t174 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.gen_rewrite_tac(
          fn(
            x171 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x171
          },
          @list.List([
            @class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (!p == !q)")),
          ]),
        ),
      ),
      t172,
    ),
    t173,
  )
  int_exists_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∃ n : Num, P(int_of_num(n))) == (∃ i : Int, int_le(int_of_num(0), i) && P(i))"),
      t174,
    ),
  )
}

///|
let int_exists_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EXISTS_POS")

///|
/// `INT_EXISTS_POS`
pub fn int_exists_pos() -> @kernel.Thm {
  int_exists_pos_c.get()
}

///|
/// INT_FORALL_ABS
fn step_322() -> Unit raise {
  let t175 = @meson.meson_tac(@list.List([int_abs_pos(), int_abs_refl()]))
  let t176 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_forall_pos()])),
    t175,
  )
  int_forall_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∀ n : Num, P(int_of_num(n))) == (∀ x : Int, P(int_abs(x)))"),
      t176,
    ),
  )
}

///|
let int_forall_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_FORALL_ABS")

///|
/// `INT_FORALL_ABS`
pub fn int_forall_abs() -> @kernel.Thm {
  int_forall_abs_c.get()
}

///|
/// INT_EXISTS_ABS
fn step_323() -> Unit raise {
  let t179 = @meson.meson_tac(@list.List([]))
  let t178 = @simp.rewrite_tac(
    @list.List([@class.not_exists_thm(), int_forall_abs()]),
  )
  let t180 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.gen_rewrite_tac(
          fn(
            x177 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x177
          },
          @list.List([
            @class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (!p == !q)")),
          ]),
        ),
      ),
      t178,
    ),
    t179,
  )
  int_exists_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, (∃ n : Num, P(int_of_num(n))) == (∃ x : Int, P(int_abs(x)))"),
      t180,
    ),
  )
}

///|
let int_exists_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_EXISTS_ABS")

///|
/// `INT_EXISTS_ABS`
pub fn int_exists_abs() -> @kernel.Thm {
  int_exists_abs_c.get()
}

///|
/// INT_POW
fn step_324() -> Unit raise {
  let t181 = @simp.rewrite_tac(
    @lib.map(int_of_real_thm, @bool.conjuncts_rule(@realax.real_pow())),
  )
  int_pow_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("pow((x : Int), 0) == int_of_num(1) && (∀ n : Num, pow(x, SUC(n)) == x * pow(x, n))"),
      t181,
    ),
  )
}

///|
let int_pow_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW")

///|
/// `INT_POW`
pub fn int_pow_v1() -> @kernel.Thm {
  int_pow_v1_c.get()
}

///|
/// INT_ABS
fn step_325() -> Unit raise {
  let t182 = @simp.rewrite_tac(@list.List([int_eq()]))
  let t183 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.mp_tac(
          int_of_real_thm(
            @bool.spec(@term_syntax.parse_term("(x : Real)"), @realax.real_abs()),
          ),
        ),
      ),
      @class.cond_cases_tac,
    ),
    t182,
  )
  int_abs_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, int_abs(x) == (if int_le(int_of_num(0), x) { x } else { int_neg(x) })"),
      t183,
    ),
  )
}

///|
let int_abs_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS")

///|
/// `INT_ABS`
pub fn int_abs_v1() -> @kernel.Thm {
  int_abs_v1_c.get()
}

///|
/// INT_GE
fn step_326() -> Unit raise {
  let t184 = @simp.rewrite_tac(
    @list.List([int_ge(), int_le(), @realax.real_ge()]),
  )
  int_ge_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_ge(x, y) == int_le(y, x)"), t184),
  )
}

///|
let int_ge_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GE")

///|
/// `INT_GE`
pub fn int_ge_v1() -> @kernel.Thm {
  int_ge_v1_c.get()
}

///|
/// INT_GT
fn step_327() -> Unit raise {
  let t185 = @simp.rewrite_tac(
    @list.List([int_gt(), int_lt(), @realax.real_gt()]),
  )
  int_gt_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_gt(x, y) == int_lt(y, x)"), t185),
  )
}

///|
let int_gt_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GT")

///|
/// `INT_GT`
pub fn int_gt_v1() -> @kernel.Thm {
  int_gt_v1_c.get()
}

///|
/// INT_LT
fn step_328() -> Unit raise {
  let t186 = @simp.rewrite_tac(
    @list.List([int_lt(), int_le(), @realax.real_lt()]),
  )
  int_lt_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_lt(x, y) == !int_le(y, x)"), t186),
  )
}

///|
let int_lt_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT")

///|
/// `INT_LT`
pub fn int_lt_v1() -> @kernel.Thm {
  int_lt_v1_c.get()
}

///|
/// INT_ARITH
fn step_329() -> Unit raise {
  let t187 = @simp.rewrite_tac(
    @list.List([int_not_le(), int_not_lt(), int_not_eq(), int_lt_discrete()]),
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("!((x : Int) <= (y : Int)) == (y + int_of_num(1) <= x) && !(x < y) == (y <= x) && !(x == y) == (x + int_of_num(1) <= y || y + int_of_num(1) <= x) && (x < y) == (x + int_of_num(1) <= y)"),
    t187,
  )
  let atom_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x188 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x188
    },
    @list.List([pth]),
  )
  let bub_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x189 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s190 = @equal.top_sweep_conv(x189)
      fn(x191 : @kernel.Term) -> @kernel.Thm raise { s190(x191) }
    },
    @list.List([
      int_eq(),
      int_le(),
      int_lt(),
      int_ge(),
      int_gt(),
      int_of_num_th(),
      int_neg_th(),
      int_add_th(),
      int_mul_th(),
      int_sub_th(),
      int_pow_th(),
      int_abs_th(),
      int_max_th(),
      int_min_th(),
    ]),
  )
  let base_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.try_conv(atom_conv),
    bub_conv,
  )
  let nnf_norm_conv : (@kernel.Term) -> @kernel.Thm raise = @canon.gen_nnf_conv(
    false,
  )(
    (
      base_conv,
      fn(x192 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
        let t = x192
        let t193 = base_conv(@bool.mk_neg(t))
        (base_conv(t), t193)
      },
    ),
  )
  let t198 = @equal.depth_binop_conv(
    @term_syntax.parse_term("op_bslash_slash"),
    @canon.conds_elim_conv,
  )
  let t197 = @simp.gen_rewrite_conv(
    fn(
      x194 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s195 = @equal.depth_conv(x194)
      fn(x196 : @kernel.Term) -> @kernel.Thm raise { s195(x196) }
    },
    @list.List([int_gt_v1(), int_ge_v1()]),
  )
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.top_depth_conv(@equal.beta_conv),
            @canon.presimp_conv,
          ),
          t197,
        ),
        @canon.nnf_conv,
      ),
      t198,
    ),
    nnf_norm_conv,
  )
  let p_tm = @term_syntax.parse_term("(p : Bool)")
  let not_tm = @term_syntax.parse_term("op_tilde")
  let pth_1 = @class.taut(@basics.mk_eq(@bool.mk_neg(@bool.mk_neg(p_tm)), p_tm))
  int_arith_v1_c.set(fn(x199 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x199
    let th0 = @kernel.inst_rule(@list.List([(tm, p_tm)]), pth_1)
    let th1 = init_conv(@bool.mk_neg(tm))
    let th2 = @calc_rat.real_arith(
      @bool.mk_neg(@kernel.rand(@kernel.concl(th1))),
    )
    @kernel.eq_mp(
      th0,
      @kernel.eq_mp(@equal.ap_term(not_tm, @equal.sym(th1)), th2),
    )
  })
}

///|
let int_arith_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_ARITH",
)

///|
/// `INT_ARITH`
pub fn int_arith_v1(x : @kernel.Term) -> @kernel.Thm raise {
  int_arith_v1_c.get()(x)
}

///|
/// INT_ARITH_TAC
fn step_330() -> Unit raise {
  int_arith_tac_v1_c.set(
    @tactics.conv_tac(fn(x200 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(int_arith_v1(x200))
    }),
  )
}

///|
let int_arith_tac_v1_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "INT_ARITH_TAC",
)

///|
/// `INT_ARITH_TAC`
pub fn int_arith_tac_v1(x : @tactics.Goal) -> @tactics.Goalstate raise {
  int_arith_tac_v1_c.get()(x)
}

///|
/// ASM_INT_ARITH_TAC
fn step_331() -> Unit raise {
  asm_int_arith_tac_v1_c.set(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.first_x_assum(fn(
          x210 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x201 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s202 = @tactics.mp_tac(x201)
            fn(
              x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s202(x203)
            }
          })(
            ((x209 : @kernel.Thm) => {
              @lib.check(
                fn(x208 : @kernel.Thm) -> Bool raise {
                  (fn(x206 : @kernel.Term) -> Bool raise {
                    (fn(x204 : Bool) -> Bool raise { !x204 })(
                      (fn(x205 : @kernel.Term) -> Bool raise {
                        @basics.is_forall(x205)
                      })(x206),
                    )
                  })(
                    (fn(x207 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x207)
                    })(x208),
                  )
                },
                x209,
              )
            })(x210),
          )
        }),
      ),
      int_arith_tac_v1,
    ),
  )
}

///|
let asm_int_arith_tac_v1_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "ASM_INT_ARITH_TAC",
)

///|
/// `ASM_INT_ARITH_TAC`
pub fn asm_int_arith_tac_v1(x : @tactics.Goal) -> @tactics.Goalstate raise {
  asm_int_arith_tac_v1_c.get()(x)
}

///|
/// INT_SUB
fn step_332() -> Unit raise {
  int_sub_v1_c.set(int_arith_v1(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_sub(x, y) == int_add(x, int_neg(y))")))
}

///|
let int_sub_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB")

///|
/// `INT_SUB`
pub fn int_sub_v1() -> @kernel.Thm {
  int_sub_v1_c.get()
}

///|
/// INT_MAX
fn step_333() -> Unit raise {
  int_max_v1_c.set(
    int_arith_v1(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_max(x, y) == (if int_le(x, y) { y } else { x })")),
  )
}

///|
let int_max_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MAX")

///|
/// `INT_MAX`
pub fn int_max_v1() -> @kernel.Thm {
  int_max_v1_c.get()
}

///|
/// INT_MIN
fn step_334() -> Unit raise {
  int_min_v1_c.set(
    int_arith_v1(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_min(x, y) == (if int_le(x, y) { x } else { y })")),
  )
}

///|
let int_min_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MIN")

///|
/// `INT_MIN`
pub fn int_min_v1() -> @kernel.Thm {
  int_min_v1_c.get()
}

///|
/// INT_OF_NUM_EXISTS
fn step_335() -> Unit raise {
  let t214 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t213 = @simp.rewrite_tac(@list.List([@theorems.or_exists_thm()]))
  let t212 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(x : Int)"), int_image()),
  )
  let t211 = @simp.asm_simp_tac(@list.List([int_pos()]))
  let t215 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
              @tactics.strip_tac,
            ),
            t211,
          ),
          t212,
        ),
        t213,
      ),
      t214,
    ),
    asm_int_arith_tac_v1,
  )
  int_of_num_exists_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, (∃ n : Num, x == int_of_num(n)) == int_le(int_of_num(0), x)"), t215),
  )
}

///|
let int_of_num_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_EXISTS",
)

///|
/// `INT_OF_NUM_EXISTS`
pub fn int_of_num_exists() -> @kernel.Thm {
  int_of_num_exists_c.get()
}

///|
/// INT_LE_DISCRETE
fn step_336() -> Unit raise {
  int_le_discrete_c.set(
    int_arith_v1(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_le(x, y) == int_lt(x, int_add(y, int_of_num(1)))")),
  )
}

///|
let int_le_discrete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_DISCRETE",
)

///|
/// `INT_LE_DISCRETE`
pub fn int_le_discrete() -> @kernel.Thm {
  int_le_discrete_c.get()
}

///|
/// INT_LE_TRANS_LE
fn step_337() -> Unit raise {
  let t216 = @meson.meson_tac(@list.List([int_le_trans(), int_le_refl()]))
  int_le_trans_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_le(x, y) == (∀ z : Int, int_le(y, z) → int_le(x, z))"),
      t216,
    ),
  )
}

///|
let int_le_trans_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_TRANS_LE",
)

///|
/// `INT_LE_TRANS_LE`
pub fn int_le_trans_le() -> @kernel.Thm {
  int_le_trans_le_c.get()
}

///|
/// INT_LE_TRANS_LT
fn step_338() -> Unit raise {
  let t220 = @term_syntax.parse_term("int_add((y : Int), int_of_num(1))")
  let t223 = @tactics.disch_then(fn(
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
    (fn(
      x217 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s218 = @tactics.mp_tac(x217)
      fn(
        x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s218(x219)
      }
    })(((x221 : @kernel.Thm) => @bool.spec(t220, x221))(x222))
  })
  let t224 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        @list.List([int_arith_tac_v1, @tactics.all_tac]),
      ),
      t223,
    ),
    int_arith_tac_v1,
  )
  int_le_trans_lt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_le(x, y) == (∀ z : Int, int_lt(y, z) → int_lt(x, z))"),
      t224,
    ),
  )
}

///|
let int_le_trans_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LE_TRANS_LT",
)

///|
/// `INT_LE_TRANS_LT`
pub fn int_le_trans_lt() -> @kernel.Thm {
  int_le_trans_lt_c.get()
}

///|
/// INT_MUL_EQ_1
fn step_339() -> Unit raise {
  let t230 = @simp.rewrite_tac(@list.List([@arith.mult_eq_1()]))
  let t228 = int_arith_v1(@term_syntax.parse_term("!(int_of_num((n : Num)) == int_neg(int_of_num(1)))"))
  let t229 = @simp.asm_rewrite_tac(
    @list.List([
      int_mul_lneg(),
      int_mul_rneg(),
      int_neg_neg(),
      int_arith_v1(@term_syntax.parse_term("!(int_neg(int_of_num((n : Num))) == int_of_num(1))")),
      int_of_num_mul(),
      t228,
      int_of_num_eq(),
      int_neg_eq(),
    ]),
  )
  let t227 = @tactics.repeat_tac(@tactics.strip_tac)
  let t226 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(y : Int)"), int_image()),
  )
  let t225 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(x : Int)"), int_image()),
  )
  let t231 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t225),
          t226,
        ),
        t227,
      ),
      t229,
    ),
    t230,
  )
  int_mul_eq_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (x * y == int_of_num(1)) == (x == int_of_num(1) && y == int_of_num(1) || x == -int_of_num(1) && y == -int_of_num(1))"),
      t231,
    ),
  )
}

///|
let int_mul_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_EQ_1")

///|
/// `INT_MUL_EQ_1`
pub fn int_mul_eq_1() -> @kernel.Thm {
  int_mul_eq_1_c.get()
}

///|
/// INT_ABS_MUL_1
fn step_340() -> Unit raise {
  let t239 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_forall_pos()),
      int_of_num_mul(),
      int_of_num_eq(),
      @arith.mult_eq_1(),
    ]),
  )
  let t237 = @term_syntax.parse_term("(a : Int)")
  let t238 = @tactics.spec_tac(@term_syntax.parse_term("int_abs((x : Int))"), t237)
  let t236 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(x : Int)"), int_abs_pos()),
  )
  let t234 = @term_syntax.parse_term("(b : Int)")
  let t235 = @tactics.spec_tac(@term_syntax.parse_term("int_abs((y : Int))"), t234)
  let t233 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Int)"), int_abs_pos()),
  )
  let t232 = @simp.rewrite_tac(@list.List([int_abs_mul()]))
  let t240 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t232),
            t233,
          ),
          t235,
        ),
        t236,
      ),
      t238,
    ),
    t239,
  )
  int_abs_mul_1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (abs(x * y) == int_of_num(1)) == (abs(x) == int_of_num(1) && abs(y) == int_of_num(1))"),
      t240,
    ),
  )
}

///|
let int_abs_mul_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_MUL_1")

///|
/// `INT_ABS_MUL_1`
pub fn int_abs_mul_1() -> @kernel.Thm {
  int_abs_mul_1_c.get()
}

///|
/// INT_WOP
fn step_341() -> Unit raise {
  let t247 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_le()), @class.contrapos_thm()]),
  )
  let t246 = @simp.gen_rewrite_tac(
    fn(
      x243 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s244 = @equal.land_conv(x243)
      fn(x245 : @kernel.Term) -> @kernel.Thm raise { s244(x245) }
    },
    @list.List([@arith.num_wop()]),
  )
  let t242 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t241 = @simp.rewrite_tac(
    @list.List([
      @theorems.imp_conj(),
      @equal.gsym(int_forall_pos()),
      int_of_num_le(),
    ]),
  )
  let t248 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(
            @list.List([
              @meson.meson(
                @list.List([]),
                @term_syntax.parse_term("(∃ x : _, (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == !(∀ x : _, P(x) → !Q(x))"),
              ),
            ]),
          ),
          t241,
        ),
        t242,
      ),
      t246,
    ),
    t247,
  )
  int_wop_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ x : Int, int_of_num(0) <= x && (P : (Int) -> Bool)(x)) == (∃ x : Int, int_of_num(0) <= x && P(x) && (∀ y : Int, int_of_num(0) <= y && P(y) → x <= y))"),
      t248,
    ),
  )
}

///|
let int_wop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_WOP")

///|
/// `INT_WOP`
pub fn int_wop() -> @kernel.Thm {
  int_wop_c.get()
}

///|
/// INT_ARCH
fn step_342() -> Unit raise {
  let t272 = int_arith_v1(
    @term_syntax.parse_term("!((d : Int) == int_of_num(0)) → int_lt(int_of_num(0), d) || int_lt(int_of_num(0), int_neg(d))"),
  )
  let t273 = @meson.asm_meson_tac(
    @list.List([int_arith_v1(@term_syntax.parse_term("int_mul(int_neg((x : Int)), (y : Int)) == int_mul(x, int_neg(y))")), t272]),
  )
  let t270 = int_arith_v1(
    @term_syntax.parse_term("!((d : Int) == int_of_num(0)) → int_lt(int_of_num(0), d) || int_lt(int_of_num(0), int_neg(d))"),
  )
  let t271 = @list.List([
    @meson.asm_meson_tac(
      @list.List([int_arith_v1(@term_syntax.parse_term("int_mul(int_neg((x : Int)), (y : Int)) == int_mul(x, int_neg(y))")), t270]),
    ),
    @tactics.all_tac,
  ])
  let t269 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Int, ∀ d : Int, !(d == int_of_num(0)) → (∃ c : Int, int_lt(x, int_mul(c, d)))"),
    fn(
      x266 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s267 = @tactics.assume_tac(x266)
      fn(
        x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s267(x268)
      }
    },
  )
  let t264 = @meson.asm_meson_tac(
    @list.List([
      int_pos(),
      int_le_lmul(),
      int_arith_v1(
        @term_syntax.parse_term("(x : Int) + int_of_num(1) <= int_of_num((n : Num)) && int_of_num(n) * int_of_num(1) <= int_of_num(n) * (d : Int) → x + int_of_num(1) <= int_of_num(n) * d"),
      ),
    ]),
  )
  let t263 = @simp.rewrite_tac(@list.List([int_lt_discrete(), int_add_lid()]))
  let t265 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t263),
      t264,
    ),
    @tactics.all_tac,
  ])
  let t262 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ x : Int, ∀ d : Int, int_lt(int_of_num(0), d) → (∃ c : Int, int_lt(x, int_mul(c, d)))"),
    fn(
      x259 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s260 = @tactics.assume_tac(x259)
      fn(
        x261 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s260(x261)
      }
    },
  )
  let t258 = @list.List([
    @meson.asm_meson_tac(@list.List([int_le_total()])),
    @tactics.all_tac,
  ])
  let t257 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Int, ∃ n : Num, int_le(x, int_of_num(n))"), fn(
    x254 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s255 = @tactics.assume_tac(x254)
    fn(
      x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s255(x256)
    }
  })
  let t252 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t253 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.gsym(int_forall_pos()), int_of_num_le()]),
      ),
      t252,
    ),
    @tactics.all_tac,
  ])
  let t274 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.subgoal_then(
                    @term_syntax.parse_term("∀ x : Int, int_le(int_of_num(0), x) → (∃ n : Num, int_le(x, int_of_num(n)))"),
                    fn(
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
                      let s250 = @tactics.assume_tac(x249)
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
                        s250(x251)
                      }
                    },
                  ),
                  t253,
                ),
                t257,
              ),
              t258,
            ),
            t262,
          ),
          t265,
        ),
        t269,
      ),
      t271,
    ),
    t273,
  )
  int_arch_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ d : Int, !(d == int_of_num(0)) → (∃ c : Int, int_lt(x, int_mul(c, d)))"),
      t274,
    ),
  )
}

///|
let int_arch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ARCH")

///|
/// `INT_ARCH`
pub fn int_arch() -> @kernel.Thm {
  int_arch_c.get()
}

///|
/// INT_DIVMOD_EXIST_0
fn step_343() -> Unit raise {
  let t316 = @term_syntax.parse_term("if int_le(int_of_num(0), (n : Int)) { int_add((q : Int), int_of_num(1)) } else { int_sub(q, int_of_num(1)) }")
  let t319 = @tactics.disch_then(fn(
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
      let s314 = @tactics.mp_tac(x313)
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
    })(((x317 : @kernel.Thm) => @bool.spec(t316, x317))(x318))
  })
  let t312 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t308 = @term_syntax.parse_term("int_sub((r : Int), int_abs((n : Int)))")
  let t311 = @tactics.first_x_assum(fn(
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
    (fn(
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
      let s306 = @tactics.mp_tac(x305)
      fn(
        x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s306(x307)
      }
    })(((x309 : @kernel.Thm) => @bool.spec(t308, x309))(x310))
  })
  let t304 = @simp.asm_rewrite_tac(@list.List([]))
  let t303 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Int)"))
  let t302 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t301 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_and_exists_thm(),
      @theorems.right_and_exists_thm(),
    ]),
  )
  let t300 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Int)"))
  let t299 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t320 = @tactics.then_tac(
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
                        @simp.gen_rewrite_tac(
                          fn(
                            x296 : (@kernel.Term) -> @kernel.Thm raise,
                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            let s297 = @equal.land_conv(x296)
                            fn(x298 : @kernel.Term) -> @kernel.Thm raise {
                              s297(x298)
                            }
                          },
                          @list.List([int_wop()]),
                        ),
                        t299,
                      ),
                      t300,
                    ),
                    t301,
                  ),
                  t302,
                ),
                t303,
              ),
              @tactics.strip_tac,
            ),
            t304,
          ),
          t311,
        ),
        t312,
      ),
      t319,
    ),
    asm_int_arith_tac_v1,
  )
  let t295 = @list.List([
    asm_int_arith_tac_v1,
    @tactics.then_tac(
      @tactics.exists_tac(@term_syntax.parse_term("int_neg((s : Int))")),
      int_arith_tac_v1,
    ),
  ])
  let t294 = @tactics.exists_tac(@term_syntax.parse_term("int_add((m : Int), int_mul((s : Int), (n : Int)))"))
  let t291 = @term_syntax.parse_term("(s : Int)")
  let t293 = @tactics.disch_then((x292 : @kernel.Thm) => {
    @tactics.x_choose_tac(t291, x292)
  })
  let t289 = @drule.match_mp(int_arch())
  let t286 = @term_syntax.parse_term("int_neg((m : Int))")
  let t321 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_assum(fn(
              x290 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x288 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x283 : @kernel.Thm,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let s284 = @tactics.mp_tac(x283)
                  fn(
                    x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    s284(x285)
                  }
                })(((x287 : @kernel.Thm) => @bool.spec(t286, x287))(x288))
              })(t289(x290))
            }),
            t293,
          ),
          t294,
        ),
        @tactics.conj_tac,
      ),
      t295,
    ),
    t320,
  ])
  let t282 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ r : Int, int_le(int_of_num(0), r) && (∃ q : Int, (m : Int) == int_add(int_mul((n : Int), q), r))"),
    fn(
      x279 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s280 = @tactics.mp_tac(x279)
      fn(
        x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s280(x281)
      }
    },
  )
  let t278 = @simp.gen_rewrite_tac(
    fn(
      x277 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x277
    },
    @list.List([@theorems.swap_exists_thm()]),
  )
  let t276 = @simp.asm_rewrite_tac(
    @list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl()]),
  )
  let t275 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t322 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t275),
          t276,
        ),
        t278,
      ),
      t282,
    ),
    t321,
  )
  int_divmod_exist_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∃ q : Int, ∃ r : Int, (if n == int_of_num(0) { q == int_of_num(0) && r == m } else { int_of_num(0) <= r && r < abs(n) && m == q * n + r })"),
      t322,
    ),
  )
}

///|
let int_divmod_exist_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVMOD_EXIST_0",
)

///|
/// `INT_DIVMOD_EXIST_0`
pub fn int_divmod_exist_0() -> @kernel.Thm {
  int_divmod_exist_0_c.get()
}

///|
/// int.ml:816
fn step_344() -> Unit raise {
  @printer.parse_as_infix("div", (22L, "left"))
}

///|
/// int.ml:817
fn step_345() -> Unit raise {
  @printer.parse_as_infix("rem", (22L, "left"))
}

///|
/// INT_DIVISION_0
fn step_346() -> Unit raise {
  let t323 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(
    int_divmod_exist_0(),
  )
  int_division_0_c.set(
    @nums.new_specification(@list.List(["div", "rem"]))(t323),
  )
}

///|
let int_division_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVISION_0")

///|
/// `INT_DIVISION_0`
pub fn int_division_0() -> @kernel.Thm {
  int_division_0_c.get()
}

///|
/// INT_DIVISION
fn step_347() -> Unit raise {
  let t324 = @meson.meson_tac(@list.List([int_division_0()]))
  int_division_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, !(n == int_of_num(0)) → m == div(m, n) * n + rem(m, n) && int_of_num(0) <= rem(m, n) && rem(m, n) < abs(n)"),
      t324,
    ),
  )
}

///|
let int_division_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVISION")

///|
/// `INT_DIVISION`
pub fn int_division() -> @kernel.Thm {
  int_division_c.get()
}

///|
/// INT_DIVISION_SIMP
fn step_348() -> Unit raise {
  let t327 = @tactics.conv_tac(int_arith_v1)
  let t326 = @simp.asm_simp_tac(@list.List([]))
  let t325 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t328 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.mp_tac(int_division_0()), t325),
        @class.cond_cases_tac,
      ),
      t326,
    ),
    t327,
  )
  int_division_simp_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_add(int_mul(div(m, n), n), rem(m, n)) == m"), t328),
  )
}

///|
let int_division_simp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVISION_SIMP",
)

///|
/// `INT_DIVISION_SIMP`
pub fn int_division_simp() -> @kernel.Thm {
  int_division_simp_c.get()
}

///|
/// INT_REM_POS
fn step_349() -> Unit raise {
  let t329 = @meson.meson_tac(@list.List([int_division()]))
  int_rem_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, !(b == int_of_num(0)) → int_le(int_of_num(0), rem(a, b))"),
      t329,
    ),
  )
}

///|
let int_rem_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_POS")

///|
/// `INT_REM_POS`
pub fn int_rem_pos() -> @kernel.Thm {
  int_rem_pos_c.get()
}

///|
/// INT_DIV_0
fn step_350() -> Unit raise {
  let t330 = @meson.meson_tac(@list.List([int_division_0()]))
  int_div_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Int, div(m, int_of_num(0)) == int_of_num(0)"), t330))
}

///|
let int_div_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_0")

///|
/// `INT_DIV_0`
pub fn int_div_0() -> @kernel.Thm {
  int_div_0_c.get()
}

///|
/// INT_REM_0
fn step_351() -> Unit raise {
  let t331 = @meson.meson_tac(@list.List([int_division_0()]))
  int_rem_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Int, rem(m, int_of_num(0)) == m"), t331))
}

///|
let int_rem_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_0")

///|
/// `INT_REM_0`
pub fn int_rem_0() -> @kernel.Thm {
  int_rem_0_c.get()
}

///|
/// INT_REM_POS_EQ
fn step_352() -> Unit raise {
  let t333 = @simp.asm_simp_tac(@list.List([int_rem_0(), int_rem_pos()]))
  let t332 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t334 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t332),
    t333,
  )
  int_rem_pos_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_le(int_of_num(0), rem(m, n)) == (n == int_of_num(0) → int_le(int_of_num(0), m))"),
      t334,
    ),
  )
}

///|
let int_rem_pos_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_POS_EQ")

///|
/// `INT_REM_POS_EQ`
pub fn int_rem_pos_eq() -> @kernel.Thm {
  int_rem_pos_eq_c.get()
}

///|
/// INT_REM_DIV
fn step_353() -> Unit raise {
  let t335 = @simp.rewrite_tac(@list.List([int_division_simp()]))
  let t336 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        int_arith_v1(@term_syntax.parse_term("((a : Int) == int_sub((b : Int), (c : Int))) == (int_add(c, a) == b)")),
      ]),
    ),
    t335,
  )
  int_rem_div_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, rem(m, n) == int_sub(m, int_mul(div(m, n), n))"), t336),
  )
}

///|
let int_rem_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_DIV")

///|
/// `INT_REM_DIV`
pub fn int_rem_div() -> @kernel.Thm {
  int_rem_div_c.get()
}

///|
/// INT_LT_REM
fn step_354() -> Unit raise {
  let t337 = @meson.meson_tac(
    @list.List([
      int_division(),
      int_lt_refl(),
      int_arith_v1(@term_syntax.parse_term("int_lt(int_of_num(0), (n : Int)) → int_abs(n) == n")),
    ]),
  )
  int_lt_rem_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ n : Int, int_lt(int_of_num(0), n) → int_lt(rem(x, n), n)"), t337),
  )
}

///|
let int_lt_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_REM")

///|
/// `INT_LT_REM`
pub fn int_lt_rem() -> @kernel.Thm {
  int_lt_rem_c.get()
}

///|
/// INT_LT_REM_EQ
fn step_355() -> Unit raise {
  let t342 = @simp.asm_simp_tac(@list.List([int_rem_pos()]))
  let t341 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(int_let_trans()),
  )
  let t340 = @simp.rewrite_tac(@list.List([int_lt_rem()]))
  let t339 = @simp.asm_simp_tac(@list.List([int_rem_0(), int_lt_refl()]))
  let t338 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t343 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t338),
            t339,
          ),
          @tactics.eq_tac,
        ),
        t340,
      ),
      t341,
    ),
    t342,
  )
  int_lt_rem_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_lt(rem(m, n), n) == (int_lt(int_of_num(0), n) || n == int_of_num(0) && int_lt(m, int_of_num(0)))"),
      t343,
    ),
  )
}

///|
let int_lt_rem_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_REM_EQ")

///|
/// `INT_LT_REM_EQ`
pub fn int_lt_rem_eq() -> @kernel.Thm {
  int_lt_rem_eq_c.get()
}

///|
let int_le_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_LE_CONV")

///|
/// `INT_LE_CONV`
pub fn int_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_le_conv_c.get()(x)
}

///|
let int_lt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_LT_CONV")

///|
/// `INT_LT_CONV`
pub fn int_lt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_lt_conv_c.get()(x)
}

///|
let int_ge_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_GE_CONV")

///|
/// `INT_GE_CONV`
pub fn int_ge_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_ge_conv_c.get()(x)
}

///|
let int_gt_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_GT_CONV")

///|
/// `INT_GT_CONV`
pub fn int_gt_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_gt_conv_c.get()(x)
}

///|
let int_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_EQ_CONV")

///|
/// `INT_EQ_CONV`
pub fn int_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_eq_conv_c.get()(x)
}

///|
/// INT_LE_CONV, INT_LT_CONV, INT_GE_CONV, INT_GT_CONV, INT_EQ_CONV
fn step_356() -> Unit raise {
  let tth = @class.taut(
    @term_syntax.parse_term("(false && false) == false && (false && true) == false && (true && false) == false && (true && true) == true"),
  )
  let nth = @class.taut(@term_syntax.parse_term("!true == false && !false == true"))
  let t345 = @simp.gen_rewrite_conv(
    fn(
      x344 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x344
    },
    @list.List([tth]),
  )
  let num2_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.binop_conv(@calc_num.num_eq_conv),
    t345,
  )
  let t347 = @simp.gen_rewrite_conv(
    fn(
      x346 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x346
    },
    @list.List([nth]),
  )
  let num2_ne_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.rand_conv(num2_eq_conv),
    t347,
  )
  let t351 = @simp.rewrite_tac(@list.List([@arith.le(), @arith.add_eq_0()]))
  let t350 = @simp.rewrite_tac(
    @list.List([int_of_num_add(), int_of_num_le(), @arith.le_0()]),
  )
  let t349 = @simp.rewrite_tac(@list.List([int_le_lneg(), int_le_rneg()]))
  let t352 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([int_le_neg2()])), t349),
      t350,
    ),
    t351,
  )
  let t353 = (
    @term_syntax.parse_term("(-int_of_num((m : Num)) <= int_of_num((n : Num))) == true && (int_of_num(m) <= int_of_num(n)) == (m <= n) && (-int_of_num(m) <= -int_of_num(n)) == (n <= m) && (int_of_num(m) <= -int_of_num(n)) == (m == 0 && n == 0)"),
    t352,
  )
  let (int_le_conv_1, int_lt_conv_1, int_ge_conv_1, int_gt_conv_1, int_eq_conv_1
  ) = match
    @bool.conjuncts_rule(
      (fn(
        x348 : (
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
        @tactics.prove(x348.0, x348.1)
      })(t353),
    ) {
    More(
      pth_le1,
      tail=More(pth_le2a, tail=More(pth_le2b, tail=More(pth_le3, tail=Empty)))
    ) => {
      let t357 = @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x356 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x356
          },
          @list.List([pth_le3]),
        ),
        num2_eq_conv,
      )
      let t358 = @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x355 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x355
          },
          @list.List([pth_le2a, pth_le2b]),
        ),
        @calc_num.num_le_conv,
      )
      let int_le_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
        @list.List([
          @simp.gen_rewrite_conv(
            fn(
              x354 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x354
            },
            @list.List([pth_le1]),
          ),
          t358,
          t357,
        ]),
      )
      let t360 = @tactics.conv_tac(@class.taut)
      let t361 = @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            pth_le1,
            pth_le2a,
            pth_le2b,
            pth_le3,
            @equal.gsym(@arith.not_le()),
            int_lt_v1(),
          ]),
        ),
        t360,
      )
      let t362 = (
        @term_syntax.parse_term("(int_of_num((m : Num)) < -int_of_num((n : Num))) == false && (int_of_num(m) < int_of_num(n)) == (m < n) && (-int_of_num(m) < -int_of_num(n)) == (n < m) && (-int_of_num(m) < int_of_num(n)) == !(m == 0 && n == 0)"),
        t361,
      )
      match
        @bool.conjuncts_rule(
          (fn(
            x359 : (
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
            @tactics.prove(x359.0, x359.1)
          })(t362),
        ) {
        More(
          pth_lt1,
          tail=More(
            pth_lt2a,
            tail=More(pth_lt2b, tail=More(pth_lt3, tail=Empty))
          )
        ) => {
          let t366 = @equal.thenc(
            @simp.gen_rewrite_conv(
              fn(
                x365 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x365
              },
              @list.List([pth_lt3]),
            ),
            num2_ne_conv,
          )
          let t367 = @equal.thenc(
            @simp.gen_rewrite_conv(
              fn(
                x364 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x364
              },
              @list.List([pth_lt2a, pth_lt2b]),
            ),
            @calc_num.num_lt_conv,
          )
          let int_lt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
            @list.List([
              @simp.gen_rewrite_conv(
                fn(
                  x363 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  x363
                },
                @list.List([pth_lt1]),
              ),
              t367,
              t366,
            ]),
          )
          let t369 = @tactics.conv_tac(@class.taut)
          let t370 = @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([pth_le1, pth_le2a, pth_le2b, pth_le3, int_ge_v1()]),
            ),
            t369,
          )
          let t371 = (
            @term_syntax.parse_term("(int_of_num((m : Num)) >= -int_of_num((n : Num))) == true && (int_of_num(m) >= int_of_num(n)) == (n <= m) && (-int_of_num(m) >= -int_of_num(n)) == (m <= n) && (-int_of_num(m) >= int_of_num(n)) == (m == 0 && n == 0)"),
            t370,
          )
          match
            @bool.conjuncts_rule(
              (fn(
                x368 : (
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
                  ) raise,
                ),
              ) -> @kernel.Thm raise {
                @tactics.prove(x368.0, x368.1)
              })(t371),
            ) {
            More(
              pth_ge1,
              tail=More(
                pth_ge2a,
                tail=More(pth_ge2b, tail=More(pth_ge3, tail=Empty))
              )
            ) => {
              let t375 = @equal.thenc(
                @simp.gen_rewrite_conv(
                  fn(
                    x374 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x374
                  },
                  @list.List([pth_ge3]),
                ),
                num2_eq_conv,
              )
              let t376 = @equal.thenc(
                @simp.gen_rewrite_conv(
                  fn(
                    x373 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x373
                  },
                  @list.List([pth_ge2a, pth_ge2b]),
                ),
                @calc_num.num_le_conv,
              )
              let int_ge_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                @list.List([
                  @simp.gen_rewrite_conv(
                    fn(
                      x372 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      x372
                    },
                    @list.List([pth_ge1]),
                  ),
                  t376,
                  t375,
                ]),
              )
              let t378 = @tactics.conv_tac(@class.taut)
              let t379 = @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([pth_lt1, pth_lt2a, pth_lt2b, pth_lt3, int_gt_v1()]),
                ),
                t378,
              )
              let t380 = (
                @term_syntax.parse_term("(-int_of_num((m : Num)) > int_of_num((n : Num))) == false && (int_of_num(m) > int_of_num(n)) == (n < m) && (-int_of_num(m) > -int_of_num(n)) == (m < n) && (int_of_num(m) > -int_of_num(n)) == !(m == 0 && n == 0)"),
                t379,
              )
              match
                @bool.conjuncts_rule(
                  (fn(
                    x377 : (
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
                      ) raise,
                    ),
                  ) -> @kernel.Thm raise {
                    @tactics.prove(x377.0, x377.1)
                  })(t380),
                ) {
                More(
                  pth_gt1,
                  tail=More(
                    pth_gt2a,
                    tail=More(pth_gt2b, tail=More(pth_gt3, tail=Empty))
                  )
                ) => {
                  let t384 = @equal.thenc(
                    @simp.gen_rewrite_conv(
                      fn(
                        x383 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x383
                      },
                      @list.List([pth_gt3]),
                    ),
                    num2_ne_conv,
                  )
                  let t385 = @equal.thenc(
                    @simp.gen_rewrite_conv(
                      fn(
                        x382 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        x382
                      },
                      @list.List([pth_gt2a, pth_gt2b]),
                    ),
                    @calc_num.num_lt_conv,
                  )
                  let int_gt_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                    @list.List([
                      @simp.gen_rewrite_conv(
                        fn(
                          x381 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          x381
                        },
                        @list.List([pth_gt1]),
                      ),
                      t385,
                      t384,
                    ]),
                  )
                  let t389 = @tactics.conv_tac(@class.taut)
                  let t388 = @simp.rewrite_tac(
                    @list.List([
                      pth_le1,
                      pth_le2a,
                      pth_le2b,
                      pth_le3,
                      @arith.le(),
                      @arith.le_0(),
                    ]),
                  )
                  let t387 = @equal.gsym(@arith.le_antisym())
                  let t390 = @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([@equal.gsym(int_le_antisym()), t387]),
                      ),
                      t388,
                    ),
                    t389,
                  )
                  let t391 = (
                    @term_syntax.parse_term("(int_of_num((m : Num)) == int_of_num((n : Num))) == (m == n) && (-int_of_num(m) == -int_of_num(n)) == (m == n) && (-int_of_num(m) == int_of_num(n)) == (m == 0 && n == 0) && (int_of_num(m) == -int_of_num(n)) == (m == 0 && n == 0)"),
                    t390,
                  )
                  match
                    @bool.conjuncts_rule(
                      (fn(
                        x386 : (
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
                          ) raise,
                        ),
                      ) -> @kernel.Thm raise {
                        @tactics.prove(x386.0, x386.1)
                      })(t391),
                    ) {
                    More(
                      pth_eq1a,
                      tail=More(
                        pth_eq1b,
                        tail=More(pth_eq2a, tail=More(pth_eq2b, tail=Empty))
                      )
                    ) => {
                      let t394 = @equal.thenc(
                        @simp.gen_rewrite_conv(
                          fn(
                            x393 : (@kernel.Term) -> @kernel.Thm raise,
                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            x393
                          },
                          @list.List([pth_eq2a, pth_eq2b]),
                        ),
                        num2_eq_conv,
                      )
                      let int_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
                        @list.List([
                          @equal.thenc(
                            @simp.gen_rewrite_conv(
                              fn(
                                x392 : (@kernel.Term) -> @kernel.Thm raise,
                              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                x392
                              },
                              @list.List([pth_eq1a, pth_eq1b]),
                            ),
                            @calc_num.num_eq_conv,
                          ),
                          t394,
                        ]),
                      )
                      (
                        int_le_conv, int_lt_conv, int_ge_conv, int_gt_conv, int_eq_conv,
                      )
                    }
                    _ => raise @lib.MatchFailure("tscript.ml:927")
                  }
                }
                _ => raise @lib.MatchFailure("tscript.ml:916")
              }
            }
            _ => raise @lib.MatchFailure("tscript.ml:905")
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:893")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:880")
  }
  int_le_conv_c.set(int_le_conv_1)
  int_lt_conv_c.set(int_lt_conv_1)
  int_ge_conv_c.set(int_ge_conv_1)
  int_gt_conv_c.set(int_gt_conv_1)
  int_eq_conv_c.set(int_eq_conv_1)
}

///|
/// INT_NEG_CONV
fn step_357() -> Unit raise {
  let t395 = @simp.rewrite_tac(@list.List([int_neg_neg(), int_neg_0()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("int_neg(int_of_num(0)) == int_of_num(0) && int_neg(int_neg(int_of_num((x : Num)))) == int_of_num(x)"),
    t395,
  )
  int_neg_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x396 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x396
      },
      @list.List([pth]),
    ),
  )
}

///|
let int_neg_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_NEG_CONV")

///|
/// `INT_NEG_CONV`
pub fn int_neg_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_neg_conv_c.get()(x)
}

///|
/// INT_MUL_CONV
fn step_358() -> Unit raise {
  let t397 = @simp.rewrite_tac(@list.List([int_mul_lzero(), int_mul_rzero()]))
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("int_of_num(0) * int_of_num((x : Num)) == int_of_num(0) && int_of_num(0) * -int_of_num(x) == int_of_num(0) && int_of_num(x) * int_of_num(0) == int_of_num(0) && -int_of_num(x) * int_of_num(0) == int_of_num(0)"),
    t397,
  )
  let t399 = @simp.rewrite_tac(@list.List([int_of_num_mul()]))
  let t400 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([int_mul_lneg(), int_mul_rneg(), int_neg_neg()]),
    ),
    t399,
  )
  let t401 = (
    @term_syntax.parse_term("(int_of_num((m : Num)) * int_of_num((n : Num)) == int_of_num(m * n) && -int_of_num(m) * -int_of_num(n) == int_of_num(m * n)) && -int_of_num(m) * int_of_num(n) == -int_of_num(m * n) && int_of_num(m) * -int_of_num(n) == -int_of_num(m * n)"),
    t400,
  )
  let (pth1, pth2) = @bool.conj_pair(
    (fn(
      x398 : (
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
      @tactics.prove(x398.0, x398.1)
    })(t401),
  )
  let t406 = @equal.rand_conv(@equal.rand_conv(@calc_num.num_mult_conv))
  let t407 = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x405 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x405
      },
      @list.List([pth2]),
    ),
    t406,
  )
  let t404 = @equal.rand_conv(@calc_num.num_mult_conv)
  let t408 = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x403 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x403
      },
      @list.List([pth1]),
    ),
    t404,
  )
  int_mul_conv_c.set(
    @equal.first_conv(
      @list.List([
        @simp.gen_rewrite_conv(
          fn(
            x402 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x402
          },
          @list.List([pth0]),
        ),
        t408,
        t407,
      ]),
    ),
  )
}

///|
let int_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_MUL_CONV")

///|
/// `INT_MUL_CONV`
pub fn int_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_mul_conv_c.get()(x)
}

///|
/// INT_ADD_CONV
fn step_359() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("int_neg")
  let amp_tm = @term_syntax.parse_term("int_of_num")
  let add_tm = @term_syntax.parse_term("int_add")
  let t409 = @term_syntax.parse_term("int_add")
  let dest : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x410 : @kernel.Term,
  ) => @basics.dest_binop(t409, x410)
  let m_tm = @term_syntax.parse_term("(m : Num)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let t411 = @simp.rewrite_tac(@list.List([int_add_linv(), int_add_rinv()]))
  let pth0 = @tactics.prove(
    @term_syntax.parse_term("int_add(int_neg(int_of_num((m : Num))), int_of_num(m)) == int_of_num(0) && int_add(int_of_num(m), int_neg(int_of_num(m))) == int_of_num(0)"),
    t411,
  )
  let t417 = @simp.rewrite_tac(@list.List([int_add_rinv(), int_add_lid()]))
  let t416 = @simp.rewrite_tac(
    @list.List([int_add_assoc(), int_add_linv(), int_add_lid()]),
  )
  let t415 = @simp.once_rewrite_tac(@list.List([int_add_sym()]))
  let t414 = @simp.rewrite_tac(@list.List([int_add_rinv(), int_add_lid()]))
  let t413 = @simp.rewrite_tac(
    @list.List([int_add_assoc(), int_add_linv(), int_add_lid()]),
  )
  let t418 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([@equal.gsym(int_of_num_add()), int_neg_add()]),
            ),
            t413,
          ),
          t414,
        ),
        t415,
      ),
      t416,
    ),
    t417,
  )
  let t419 = (
    @term_syntax.parse_term("-int_of_num((m : Num)) + -int_of_num((n : Num)) == -int_of_num(m + n) && -int_of_num(m) + int_of_num(m + n) == int_of_num(n) && -int_of_num(m + n) + int_of_num(m) == -int_of_num(n) && int_of_num(m + n) + -int_of_num(m) == int_of_num(n) && int_of_num(m) + -int_of_num(m + n) == -int_of_num(n) && int_of_num(m) + int_of_num(n) == int_of_num(m + n)"),
    t418,
  )
  int_add_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x412 : (
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
          @tactics.prove(x412.0, x412.1)
        })(t419),
      ) {
      More(
        pth1,
        tail=More(
          pth2,
          tail=More(
            pth3,
            tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=Empty)))
          )
        )
      ) =>
        @equal.orelsec(
          @simp.gen_rewrite_conv(
            fn(
              x420 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              x420
            },
            @list.List([pth0]),
          ),
          fn(x421 : @kernel.Term) -> @kernel.Thm raise {
            let tm = x421
            try {
              let (l, r) = dest(tm)
              if !is_intconst(l) || !is_intconst(r) {
                raise Failure("")
              } else if @kernel.rator(l) == neg_tm {
                if @kernel.rator(r) == neg_tm {
                  let t422 = (@kernel.rand(@kernel.rand(r)), n_tm)
                  let th1 = @kernel.inst_rule(
                    @list.List([(@kernel.rand(@kernel.rand(l)), m_tm), t422]),
                    pth1,
                  )
                  let tm1 = @kernel.rand(
                    @kernel.rand(@kernel.rand(@kernel.concl(th1))),
                  )
                  let th2 = @equal.ap_term(
                    neg_tm,
                    @equal.ap_term(amp_tm, @calc_num.num_add_conv(tm1)),
                  )
                  @kernel.trans(th1, th2)
                } else {
                  let m = @kernel.rand(@kernel.rand(l))
                  let n = @kernel.rand(r)
                  let m_p = @basics.dest_numeral(m)
                  let n_p = @basics.dest_numeral(n)
                  if @num.le_num(m_p, n_p) {
                    let p = @nums.mk_numeral(@num.sub_num(n_p, m_p))
                    let th1_1 = @kernel.inst_rule(
                      @list.List([(m, m_tm), (p, n_tm)]),
                      pth2,
                    )
                    let th2_1 = @calc_num.num_add_conv(
                      @kernel.rand(
                        @kernel.rand(@equal.lhand(@kernel.concl(th1_1))),
                      ),
                    )
                    let t423 = @equal.ap_term(amp_tm, @equal.sym(th2_1))
                    let th3 = @equal.ap_term(@kernel.rator(tm), t423)
                    @kernel.trans(th3, th1_1)
                  } else {
                    let p_1 = @nums.mk_numeral(@num.sub_num(m_p, n_p))
                    let th1_2 = @kernel.inst_rule(
                      @list.List([(n, m_tm), (p_1, n_tm)]),
                      pth3,
                    )
                    let th2_2 = @calc_num.num_add_conv(
                      @kernel.rand(
                        @kernel.rand(
                          @equal.lhand(@equal.lhand(@kernel.concl(th1_2))),
                        ),
                      ),
                    )
                    let th3_1 = @equal.ap_term(
                      neg_tm,
                      @equal.ap_term(amp_tm, @equal.sym(th2_2)),
                    )
                    let t424 = @kernel.rand(tm)
                    let th4 = @equal.ap_thm(@equal.ap_term(add_tm, th3_1), t424)
                    @kernel.trans(th4, th1_2)
                  }
                }
              } else if @kernel.rator(r) == neg_tm {
                let m_1 = @kernel.rand(l)
                let n_1 = @kernel.rand(@kernel.rand(r))
                let m_p_1 = @basics.dest_numeral(m_1)
                let n_p_1 = @basics.dest_numeral(n_1)
                if @num.le_num(n_p_1, m_p_1) {
                  let p_2 = @nums.mk_numeral(@num.sub_num(m_p_1, n_p_1))
                  let th1_3 = @kernel.inst_rule(
                    @list.List([(n_1, m_tm), (p_2, n_tm)]),
                    pth4,
                  )
                  let th2_3 = @calc_num.num_add_conv(
                    @kernel.rand(
                      @equal.lhand(@equal.lhand(@kernel.concl(th1_3))),
                    ),
                  )
                  let th3_2 = @equal.ap_term(
                    add_tm,
                    @equal.ap_term(amp_tm, @equal.sym(th2_3)),
                  )
                  let th4_1 = @equal.ap_thm(th3_2, @kernel.rand(tm))
                  @kernel.trans(th4_1, th1_3)
                } else {
                  let p_3 = @nums.mk_numeral(@num.sub_num(n_p_1, m_p_1))
                  let th1_4 = @kernel.inst_rule(
                    @list.List([(m_1, m_tm), (p_3, n_tm)]),
                    pth5,
                  )
                  let th2_4 = @calc_num.num_add_conv(
                    @kernel.rand(
                      @kernel.rand(
                        @kernel.rand(@equal.lhand(@kernel.concl(th1_4))),
                      ),
                    ),
                  )
                  let th3_3 = @equal.ap_term(
                    neg_tm,
                    @equal.ap_term(amp_tm, @equal.sym(th2_4)),
                  )
                  let th4_2 = @equal.ap_term(@kernel.rator(tm), th3_3)
                  @kernel.trans(th4_2, th1_4)
                }
              } else {
                let t425 = (@kernel.rand(r), n_tm)
                let th1_5 = @kernel.inst_rule(
                  @list.List([(@kernel.rand(l), m_tm), t425]),
                  pth6,
                )
                let tm1_1 = @kernel.rand(@kernel.rand(@kernel.concl(th1_5)))
                let th2_5 = @equal.ap_term(
                  amp_tm,
                  @calc_num.num_add_conv(tm1_1),
                )
                @kernel.trans(th1_5, th2_5)
              }
            } catch {
              Failure(_) => raise Failure("INT_ADD_CONV")
              e => raise e
            }
          },
        )
      _ => raise @lib.MatchFailure("tscript.ml:977")
    },
  )
}

///|
let int_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_ADD_CONV")

///|
/// `INT_ADD_CONV`
pub fn int_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_add_conv_c.get()(x)
}

///|
/// INT_SUB_CONV
fn step_360() -> Unit raise {
  let t427 = @equal.try_conv(@equal.rand_conv(int_neg_conv))
  int_sub_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x426 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x426
          },
          @list.List([int_sub_v1()]),
        ),
        t427,
      ),
      int_add_conv,
    ),
  )
}

///|
let int_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_SUB_CONV")

///|
/// `INT_SUB_CONV`
pub fn int_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_sub_conv_c.get()(x)
}

///|
/// INT_POW_CONV
fn step_361() -> Unit raise {
  let t429 = @simp.rewrite_tac(@list.List([int_of_num_pow(), int_pow_neg()]))
  let t430 = (
    @term_syntax.parse_term("pow(int_of_num((x : Num)), (n : Num)) == int_of_num(EXP(x, n)) && pow(-int_of_num(x), n) == (if EVEN(n) { int_of_num(EXP(x, n)) } else { -int_of_num(EXP(x, n)) })"),
    t429,
  )
  let (pth1, pth2) = @bool.conj_pair(
    (fn(
      x428 : (
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
      @tactics.prove(x428.0, x428.1)
    })(t430),
  )
  let t431 = @simp.rewrite_tac(@list.List([]))
  let tth = @tactics.prove(
    @term_syntax.parse_term("(if true { (x : Int) } else { (y : Int) }) == x && (if false { x } else { y }) == y"),
    t431,
  )
  let neg_tm = @term_syntax.parse_term("int_neg")
  let t437 = @simp.gen_rewrite_conv(
    fn(
      x436 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x436
    },
    @list.List([tth]),
  )
  let t435 = @equal.rator_conv(
    @equal.rator_conv(@equal.rand_conv(@calc_num.num_even_conv)),
  )
  let t439 = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x434 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x434
          },
          @list.List([pth2]),
        ),
        t435,
      ),
      t437,
    ),
    fn(x438 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x438
      if @kernel.rator(tm) == neg_tm {
        @equal.rand_conv(@equal.rand_conv(@calc_num.num_exp_conv))(tm)
      } else {
        @equal.rand_conv(@calc_num.num_exp_conv)(tm)
      }
    },
  )
  let t433 = @equal.rand_conv(@calc_num.num_exp_conv)
  int_pow_conv_c.set(
    @equal.orelsec(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x432 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x432
          },
          @list.List([pth1]),
        ),
        t433,
      ),
      t439,
    ),
  )
}

///|
let int_pow_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_POW_CONV")

///|
/// `INT_POW_CONV`
pub fn int_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_pow_conv_c.get()(x)
}

///|
/// INT_ABS_CONV
fn step_362() -> Unit raise {
  let t440 = @simp.rewrite_tac(@list.List([int_abs_neg(), int_abs_num()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("int_abs(int_neg(int_of_num((x : Num)))) == int_of_num(x) && int_abs(int_of_num(x)) == int_of_num(x)"),
    t440,
  )
  int_abs_conv_c.set(
    @simp.gen_rewrite_conv(
      fn(
        x441 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x441
      },
      @list.List([pth]),
    ),
  )
}

///|
let int_abs_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_ABS_CONV")

///|
/// `INT_ABS_CONV`
pub fn int_abs_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_abs_conv_c.get()(x)
}

///|
/// INT_MAX_CONV
fn step_363() -> Unit raise {
  let t444 = @simp.gen_rewrite_conv(
    fn(
      x443 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x443
    },
    @list.List([@class.cond_clauses()]),
  )
  let t442 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(int_le_conv)))
  int_max_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(int_max_v1()), t442), t444),
  )
}

///|
let int_max_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_MAX_CONV")

///|
/// `INT_MAX_CONV`
pub fn int_max_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_max_conv_c.get()(x)
}

///|
/// INT_MIN_CONV
fn step_364() -> Unit raise {
  let t447 = @simp.gen_rewrite_conv(
    fn(
      x446 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x446
    },
    @list.List([@class.cond_clauses()]),
  )
  let t445 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(int_le_conv)))
  int_min_conv_c.set(
    @equal.thenc(@equal.thenc(@simp.rewr_conv(int_min_v1()), t445), t447),
  )
}

///|
let int_min_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_MIN_CONV")

///|
/// `INT_MIN_CONV`
pub fn int_min_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_min_conv_c.get()(x)
}

///|
/// INT_SGN_CONV
fn step_365() -> Unit raise {
  let t454 = @simp.gen_rewrite_conv(
    fn(
      x453 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x453
    },
    @list.List([@class.cond_clauses()]),
  )
  let t452 = @equal.rator_conv(@equal.land_conv(int_lt_conv))
  let t455 = @equal.thenc(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x451 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x451
        },
        @list.List([@bool.conjunct2(@bool.spec_all(@class.cond_clauses()))]),
      ),
      t452,
    ),
    t454,
  )
  let t456 = @equal.orelsec(
    @simp.gen_rewrite_conv(
      fn(
        x450 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x450
      },
      @list.List([@bool.conjunct1(@bool.spec_all(@class.cond_clauses()))]),
    ),
    t455,
  )
  let t449 = @equal.rator_conv(@equal.land_conv(int_lt_conv))
  int_sgn_conv_c.set(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x448 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x448
          },
          @list.List([int_sgn_v1()]),
        ),
        t449,
      ),
      t456,
    ),
  )
}

///|
let int_sgn_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("INT_SGN_CONV")

///|
/// `INT_SGN_CONV`
pub fn int_sgn_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_sgn_conv_c.get()(x)
}

///|
/// INT_POLY_CONV
fn step_366() -> Unit raise {
  let t457 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_pow_v1()])),
    int_arith_tac_v1,
  )
  let sth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Int, ∀ y : Int, ∀ z : Int, x + (y + z) == x + y + z) && (∀ x : Int, ∀ y : Int, x + y == y + x) && (∀ x : Int, int_of_num(0) + x == x) && (∀ x : Int, ∀ y : Int, ∀ z : Int, x * (y * z) == x * y * z) && (∀ x : Int, ∀ y : Int, x * y == y * x) && (∀ x : Int, int_of_num(1) * x == x) && (∀ x : Int, int_of_num(0) * x == int_of_num(0)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, x * (y + z) == x * y + x * z) && (∀ x : Int, pow(x, 0) == int_of_num(1)) && (∀ x : Int, ∀ n : Num, pow(x, SUC(n)) == x * pow(x, n))"),
    t457,
  )
  let rth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Int, -x == -int_of_num(1) * x) && (∀ x : Int, ∀ y : Int, x - y == x + -int_of_num(1) * y)"),
    int_arith_tac_v1,
  )
  let is_semiring_constant : (@kernel.Term) -> Bool raise = is_intconst
  let semiring_add_conv : (@kernel.Term) -> @kernel.Thm raise = int_add_conv
  let semiring_mul_conv : (@kernel.Term) -> @kernel.Thm raise = int_mul_conv
  let semiring_pow_conv : (@kernel.Term) -> @kernel.Thm raise = int_pow_conv
  let (_, _, _, _, _, int_poly_conv_1) = @normalizer.semiring_normalizers_conv(
    sth,
  )(rth)(
    (
      is_semiring_constant, semiring_add_conv, semiring_mul_conv, semiring_pow_conv,
    ),
  )(fn(x458 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x459 : @kernel.Term) -> Bool raise { @lib.compare(x458, x459) < 0 }
  })
  int_poly_conv_c.set(int_poly_conv_1)
}

///|
let int_poly_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_POLY_CONV",
)

///|
/// `INT_POLY_CONV`
pub fn int_poly_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_poly_conv_c.get()(x)
}

///|
let int_ring_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_RING",
)

///|
/// `INT_RING`
pub fn int_ring(x : @kernel.Term) -> @kernel.Thm raise {
  int_ring_c.get()(x)
}

///|
let int_ideal_cofactors_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise,
] = @lib.Cell::new("int_ideal_cofactors")

///|
/// `int_ideal_cofactors`
pub fn int_ideal_cofactors(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
  int_ideal_cofactors_c.get()(x)
}

///|
/// INT_RING, int_ideal_cofactors
fn step_367() -> Unit raise {
  let t464 = @simp.rewrite_tac(@list.List([@equal.gsym(int_entire())]))
  let t463 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_sub_0())]))
  let t460 = @equal.gsym(int_of_num_mul())
  let t461 = @equal.gsym(int_of_num_add())
  let t462 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_of_num_eq()), t461, t460]),
  )
  let t465 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([@arith.mult_clauses(), @arith.eq_add_lcancel()]),
          ),
          t462,
        ),
        t463,
      ),
      t464,
    ),
    int_arith_tac_v1,
  )
  let int_integral = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Int, int_of_num(0) * x == int_of_num(0)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, (x + y == x + z) == (y == z)) && (∀ w : Int, ∀ x : Int, ∀ y : Int, ∀ z : Int, (w * y + x * z == w * z + x * y) == (w == x || y == z))"),
    t465,
  )
  let int_ty = @parser.parse_type("int")
  let t466 = @term_syntax.parse_term("int_pow")
  let t467 = @basics.genvar(@kernel.bool_ty)
  let t468 = @term_syntax.parse_term("int_mul")
  let t469 = @basics.genvar(@kernel.bool_ty)
  let t470 = @term_syntax.parse_term("int_sub")
  let t471 = @term_syntax.parse_term("int_add")
  let (pure_, ideal) = @grobner.ring_and_ideal_conv(
    (
      dest_intconst,
      mk_intconst,
      int_eq_conv,
      @term_syntax.parse_term("int_neg"),
      t471,
      t470,
      t469,
      t468,
      t467,
      t466,
      int_integral,
      @bool.truth(),
      int_poly_conv,
    ),
  )
  let (int_ring, int_ideal_cofactors) = (
    pure_,
    fn(
      x472 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> @list.List[@kernel.Term] raise) raise {
      let tms = x472
      fn(x473 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        let tm = x473
        if @lib.forall(
            fn(x474 : @kernel.Term) -> Bool raise {
              let t = x474
              @kernel.type_of(t) == int_ty
            },
            tms.prepend(tm),
          ) {
          ideal(tms)(tm)
        } else {
          raise Failure("int_ideal_cofactors: not all terms have type :int")
        }
      }
    },
  )
  int_ring_c.set(int_ring)
  int_ideal_cofactors_c.set(int_ideal_cofactors)
}

///|
/// int.ml:1151
fn step_368() -> Unit raise {
  @preterm.make_overloadable("divides", @parser.parse_type("A->A->bool"))
}

///|
/// int.ml:1152
fn step_369() -> Unit raise {
  @preterm.make_overloadable("mod", @parser.parse_type("A->A->A->bool"))
}

///|
/// int.ml:1153
fn step_370() -> Unit raise {
  @preterm.make_overloadable("coprime", @parser.parse_type("A#A->bool"))
}

///|
/// int.ml:1154
fn step_371() -> Unit raise {
  @preterm.make_overloadable("gcd", @parser.parse_type("A#A->A"))
}

///|
/// int.ml:1155
fn step_372() -> Unit raise {
  @preterm.make_overloadable("lcm", @parser.parse_type("A#A->A"))
}

///|
/// int.ml:1161
fn step_373() -> Unit raise {
  @printer.parse_as_infix("==", (10L, "right"))
}

///|
/// cong
fn step_374() -> Unit raise {
  cong_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_eq_eq : (A, A, (A, A) -> Bool) -> Bool)((x : A), (y : A), (rel : (A, A) -> Bool)) == rel(x, y)"),
    ),
  )
}

///|
let cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cong")

///|
/// `cong`
pub fn cong() -> @kernel.Thm {
  cong_c.get()
}

///|
/// real_mod
fn step_375() -> Unit raise {
  real_mod_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_mod : (Real, Real, Real) -> Bool)((n : Real), (x : Real), (y : Real)) == (∃ q : Real, integer(q) && x - y == q * n)"),
    ),
  )
}

///|
let real_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_mod")

///|
/// `real_mod`
pub fn real_mod() -> @kernel.Thm {
  real_mod_c.get()
}

///|
/// int.ml:1173
fn step_376() -> Unit raise {
  @preterm.overload_interface("mod", @term_syntax.parse_term("real_mod"))
}

///|
/// int.ml:1179
fn step_377() -> Unit raise {
  @printer.parse_as_infix("divides", (12L, "right"))
}

///|
/// int.ml:1180
fn step_378() -> Unit raise {
  @preterm.overload_interface(
    "divides",
    @term_syntax.parse_term("(int_divides : (Int, Int) -> Bool)"),
  )
}

///|
/// int_divides
fn step_379() -> Unit raise {
  int_divides_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_divides : (Int, Int) -> Bool)((a : Int), (b : Int)) == (∃ x : Int, b == a * x)"),
    ),
  )
}

///|
let int_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_divides")

///|
/// `int_divides`
pub fn int_divides() -> @kernel.Thm {
  int_divides_c.get()
}

///|
/// INT_DIVIDES_LE
fn step_380() -> Unit raise {
  let t478 = @tactics.match_mp_tac(int_le_mul())
  let t477 = @tactics.repeat_tac(@tactics.strip_tac)
  let t476 = @simp.rewrite_tac(
    @list.List([
      int_arith_v1(@term_syntax.parse_term("((x : Int) <= x * (y : Int)) == (int_of_num(0) <= x * (y - int_of_num(1)))")),
    ]),
  )
  let t475 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool) || (r : Bool)) == (!q && !r → p)")),
    ]),
  )
  let t479 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.simp_tac(
              @list.List([
                int_divides(),
                @theorems.left_imp_exists_thm(),
                int_abs_mul(),
                int_entire(),
              ]),
            ),
            t475,
          ),
          t476,
        ),
        t477,
      ),
      t478,
    ),
    asm_int_arith_tac_v1,
  )
  int_divides_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, divides(x, y) → abs(x) <= abs(y) || y == int_of_num(0)"),
      t479,
    ),
  )
}

///|
let int_divides_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIVIDES_LE")

///|
/// `INT_DIVIDES_LE`
pub fn int_divides_le() -> @kernel.Thm {
  int_divides_le_c.get()
}

///|
/// int.ml:1196
fn step_381() -> Unit raise {
  @printer.parse_as_prefix("mod")
}

///|
/// int.ml:1197
fn step_382() -> Unit raise {
  @preterm.overload_interface(
    "mod",
    @term_syntax.parse_term("(int_mod : (Int, Int, Int) -> Bool)"),
  )
}

///|
/// int_mod
fn step_383() -> Unit raise {
  int_mod_c.set(
    @pair.new_definition(@term_syntax.parse_term("(int_mod : (Int, Int, Int) -> Bool)((n : Int), (x : Int), (y : Int)) == divides(n, x - y)")),
  )
}

///|
let int_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_mod")

///|
/// `int_mod`
pub fn int_mod() -> @kernel.Thm {
  int_mod_c.get()
}

///|
/// int_congruent
fn step_384() -> Unit raise {
  let t480 = @simp.rewrite_tac(@list.List([int_mod(), cong(), int_divides()]))
  int_congruent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, y, int_mod(n)) == (∃ d : Int, x - y == n * d)"),
      t480,
    ),
  )
}

///|
let int_congruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_congruent")

///|
/// `int_congruent`
pub fn int_congruent() -> @kernel.Thm {
  int_congruent_c.get()
}

///|
/// INT_CONG_IMP_EQ
fn step_385() -> Unit raise {
  let t485 = @drule.match_mp(int_divides_le())
  let t487 = @tactics.first_assum(fn(
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
    })(t485(x486))
  })
  let t481 = @tactics.repeat_tac(@tactics.strip_tac)
  let t488 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([int_congruent(), @equal.gsym(int_divides())]),
        ),
        t481,
      ),
      t487,
    ),
    asm_int_arith_tac_v1,
  )
  int_cong_imp_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, abs(x - y) < n && op_eq_eq(x, y, mod(n)) → x == y"),
      t488,
    ),
  )
}

///|
let int_cong_imp_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_IMP_EQ",
)

///|
/// `INT_CONG_IMP_EQ`
pub fn int_cong_imp_eq() -> @kernel.Thm {
  int_cong_imp_eq_c.get()
}

///|
/// int.ml:1216
fn step_386() -> Unit raise {
  @preterm.overload_interface(
    "coprime",
    @term_syntax.parse_term("(int_coprime : ((Int, Int)) -> Bool)"),
  )
}

///|
/// int_coprime
fn step_387() -> Unit raise {
  int_coprime_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, (int_coprime : ((Int, Int)) -> Bool)((a, b)) == (∃ x : Int, ∃ y : Int, a * x + b * y == int_of_num(1))"),
    ),
  )
}

///|
let int_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_coprime")

///|
/// `int_coprime`
pub fn int_coprime() -> @kernel.Thm {
  int_coprime_c.get()
}

///|
/// INTEGER_TAC
fn step_388() -> Unit raise {
  let int_ty = @parser.parse_type("int")
  let t490 = @equal.land_conv(int_poly_conv)
  let int_polyeq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.gen_rewrite_conv(
      fn(
        x489 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x489
      },
      @list.List([@equal.gsym(int_sub_0())]),
    ),
    t490,
  )
  let pth = int_arith_v1(@term_syntax.parse_term("∀ a : Int, ∀ x : Int, (a == int_of_num(0)) == (x == x + a)"))
  let is_defined : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(
    x491 : @kernel.Term,
  ) -> ((@kernel.Term) -> Bool raise) raise {
    let v = x491
    fn(x492 : @kernel.Term) -> Bool raise {
      let t = x492
      let mons = @lib.striplist(
        (x493 : @kernel.Term) => @basics.dest_binary("int_add", x493),
        t,
      )
      @lib.mem(v, mons) &&
      @lib.forall(
        fn(x494 : @kernel.Term) -> Bool raise {
          let m = x494
          v == m || !@basics.free_in(v, m)
        },
        mons,
      )
    }
  }
  let isolate_variable : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x495 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let vars = x495
    fn(x496 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x496
      let th = int_polyeq_conv(tm)
      let th_p = @equal.thenc(@equal.sym_conv, int_polyeq_conv)(tm)
      let (v_3, th1) = (
        @lib.find(
          fn(x497 : @kernel.Term) -> Bool raise {
            let v_1 = x497
            let t498 = @equal.lhand(@kernel.rand(@kernel.concl(th)))
            is_defined(v_1)(t498)
          },
          vars,
        ),
        th_p,
      ) catch {
        Failure(_) =>
          (
            @lib.find(
              fn(x499 : @kernel.Term) -> Bool raise {
                let v_2 = x499
                let t500 = @equal.lhand(@kernel.rand(@kernel.concl(th_p)))
                is_defined(v_2)(t500)
              },
              vars,
            ),
            th,
          )
        e => raise e
      }
      let th2 = @kernel.trans(
        th1,
        @bool.specl(
          @list.List([@equal.lhs(@kernel.rand(@kernel.concl(th1))), v_3]),
          pth,
        ),
      )
      @equal.conv_rule(@equal.rand_conv(@equal.rand_conv(int_poly_conv)), th2)
    }
  }
  let unwind_polys_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x501 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x501
    let (vars_1, bod) = @basics.strip_exists(tm_1)
    let cjs = @basics.conjuncts(bod)
    let th1_1 = @lib.tryfind(isolate_variable(vars_1), cjs)
    let eq = @equal.lhand(@kernel.concl(th1_1))
    let bod_p = @bool.list_mk_conj(
      @lib.subtract(cjs, @list.List([eq])).prepend(eq),
    )
    let th2_1 = @canon.conj_aci_rule(@basics.mk_eq(bod, bod_p))
    let th3 = @kernel.trans(
      th2_1,
      @drule.mk_conj_rule(
        th1_1,
        @kernel.refl(@kernel.rand(@kernel.rand(@kernel.concl(th2_1)))),
      ),
    )
    let v_4 = @equal.lhs(@equal.lhand(@kernel.rand(@kernel.concl(th3))))
    let vars_p = @lib.subtract(vars_1, @list.List([v_4])).concat(
      @list.List([v_4]),
    )
    let t502 = @drule.mk_exists_rule(v_4, th3)
    let th4 = @equal.conv_rule(
      @equal.rand_conv(@simp.rewr_conv(@theorems.unwind_thm2())),
      t502,
    )
    let imp_rule : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise = fn(
      x503 : @list.List[@kernel.Term],
    ) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise {
      let v_5 = x503
      fn(x504 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
        let v_p = x504
        @bool.disch_all(
          @lib.itlist(
            @bool.simple_choose,
            v_5,
            @lib.itlist(@bool.simple_exists, v_p, @kernel.assume_rule(bod)),
          ),
        )
      }
    }
    let t505 = imp_rule(vars_p)(vars_1)
    let th5 = @bool.imp_antisym_rule(imp_rule(vars_1)(vars_p), t505)
    @kernel.trans(
      th5,
      @lib.itlist(
        @drule.mk_exists_rule,
        @lib.subtract(vars_1, @list.List([v_4])),
        th4,
      ),
    )
  }
  let zero_tm = @term_syntax.parse_term("int_of_num(0)")
  let one_tm = @term_syntax.parse_term("int_of_num(1)")
  let mul_tm = @term_syntax.parse_term("int_mul")
  let add_tm = @term_syntax.parse_term("int_add")
  let neg_tm = @term_syntax.parse_term("op_minus_minus")
  let dest_mul : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x506 : @kernel.Term,
  ) => @basics.dest_binop(mul_tm, x506)
  let dest_add : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = (
    x507 : @kernel.Term,
  ) => @basics.dest_binop(add_tm, x507)
  let mk_mul : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x510 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x511 : @kernel.Term) -> @kernel.Term raise {
      ((x508 : @kernel.Term, x509 : @kernel.Term) => {
        @basics.mk_binop(mul_tm, x508, x509)
      })(x510, x511)
    }
  }
  let mk_add : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x514 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x515 : @kernel.Term) -> @kernel.Term raise {
      ((x512 : @kernel.Term, x513 : @kernel.Term) => {
        @basics.mk_binop(add_tm, x512, x513)
      })(x514, x515)
    }
  }
  let scrub_var : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
    x516 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let v_6 = x516
    fn(x517 : @kernel.Term) -> @kernel.Term raise {
      let m_1 = x517
      let ps = @lib.striplist(dest_mul, m_1)
      let ps_p = @lib.subtract(ps, @list.List([v_6]))
      if ps_p == @list.List([]) {
        one_tm
      } else {
        @lib.end_itlist(
          fn(x518 : @kernel.Term, x519 : @kernel.Term) -> @kernel.Term raise {
            let s520 = mk_mul(x518)
            s520(x519)
          },
          ps_p,
        )
      }
    }
  }
  let find_multipliers : (@kernel.Term) -> ((@list.List[@kernel.Term]) -> @kernel.Term raise) raise = fn(
    x521 : @kernel.Term,
  ) -> ((@list.List[@kernel.Term]) -> @kernel.Term raise) raise {
    let v_7 = x521
    fn(x522 : @list.List[@kernel.Term]) -> @kernel.Term raise {
      let mons_1 = x522
      let mons1 = @lib.filter(
        fn(x523 : @kernel.Term) -> Bool raise {
          let m_2 = x523
          @basics.free_in(v_7, m_2)
        },
        mons_1,
      )
      let mons2 = @lib.map(scrub_var(v_7), mons1)
      if mons2 == @list.List([]) {
        zero_tm
      } else {
        @lib.end_itlist(
          fn(x524 : @kernel.Term, x525 : @kernel.Term) -> @kernel.Term raise {
            let s526 = mk_add(x524)
            s526(x525)
          },
          mons2,
        )
      }
    }
  }
  let isolate_monomials : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @list.List[@kernel.Term],
    @kernel.Term,
  ) raise) raise = fn(
    x527 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise) raise {
    let vars_2 = x527
    fn(x528 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
      let tm_2 = x528
      let (cmons, vmons) = @lib.partition(
        fn(x529 : @kernel.Term) -> Bool raise {
          let m_3 = x529
          @lib.intersect(@kernel.frees(m_3), vars_2) == @list.List([])
        },
        @lib.striplist(dest_add, tm_2),
      )
      let cofactors = @lib.map(
        fn(x530 : @kernel.Term) -> @kernel.Term raise {
          let v_8 = x530
          find_multipliers(v_8)(vmons)
        },
        vars_2,
      )
      let cnc = if cmons == @list.List([]) {
        zero_tm
      } else {
        @kernel.mk_comb(
          neg_tm,
          @lib.end_itlist(
            fn(x531 : @kernel.Term, x532 : @kernel.Term) -> @kernel.Term raise {
              let s533 = mk_add(x531)
              s533(x532)
            },
            cmons,
          ),
        )
      }
      (cofactors, cnc)
    }
  }
  let isolate_variables : (@list.List[@kernel.Term]) -> ((
    @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> (
    @kernel.Term,
    @list.List[(@kernel.Term, @kernel.Term)],
  ) raise) raise) raise = fn(
    x534 : @list.List[@kernel.Term],
  ) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> (
    @kernel.Term,
    @list.List[(@kernel.Term, @kernel.Term)],
  ) raise) raise) raise {
    let evs = x534
    fn(
      x535 : @list.List[@kernel.Term],
    ) -> ((@kernel.Term) -> (
      @kernel.Term,
      @list.List[(@kernel.Term, @kernel.Term)],
    ) raise) raise {
      let ps_1 = x535
      fn(
        x536 : @kernel.Term,
      ) -> (@kernel.Term, @list.List[(@kernel.Term, @kernel.Term)]) raise {
        let eq_1 = x536
        let vars_3 = @lib.filter(
          fn(x537 : @kernel.Term) -> Bool raise {
            let v_9 = x537
            @kernel.vfree_in(v_9, eq_1)
          },
          evs,
        )
        let (qs, p) = isolate_monomials(vars_3)(eq_1)
        let rs = @lib.filter(
          fn(x538 : @kernel.Term) -> Bool raise {
            let t_1 = x538
            @kernel.type_of(t_1) == int_ty
          },
          qs.concat(ps_1),
        )
        let rs_1 = int_ideal_cofactors(rs)(p)
        (eq_1, @lib.zip(@lib.chop_list(@lib.length(qs), rs_1).0, vars_3))
      }
    }
  }
  let subst_in_poly : (@list.List[(@kernel.Term, @kernel.Term)]) -> ((
    @kernel.Term,
  ) -> @kernel.Term raise) raise = fn(
    x539 : @list.List[(@kernel.Term, @kernel.Term)],
  ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let i = x539
    fn(x540 : @kernel.Term) -> @kernel.Term raise {
      let p_1 = x540
      @equal.rhs(@kernel.concl(int_poly_conv(@kernel.vsubst(i, p_1))))
    }
  }
  fn solve_idealism(
    x541 : @list.List[@kernel.Term],
    x542 : @list.List[@kernel.Term],
    x543 : @list.List[@kernel.Term],
  ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
    let evs_1 = x541
    let ps_2 = x542
    let eqs = x543
    if evs_1 == @list.List([]) {
      @list.List([])
    } else {
      let (eq_2, cfs) = @lib.tryfind(isolate_variables(evs_1)(ps_2), eqs)
      let evs_p = @lib.subtract(
        evs_1,
        @lib.map(
          fn(x544 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x544.1
          },
          cfs,
        ),
      )
      let t545 = @lib.subtract(eqs, @list.List([eq_2]))
      let eqs_p = @lib.map(subst_in_poly(cfs), t545)
      cfs.concat(solve_idealism(evs_p, ps_2, eqs_p))
    }
  }
  fn genvar_exists_conv(x546 : @kernel.Term) -> @kernel.Thm raise {
    let tm_3 = x546
    if !@basics.is_exists(tm_3) {
      @kernel.refl(tm_3)
    } else {
      let (ev, bod_1) = @basics.dest_exists(tm_3)
      let gv = @basics.genvar(@kernel.type_of(ev))
      let t547 = @equal.binder_conv(genvar_exists_conv)
      @equal.thenc(@equal.gen_alpha_conv(gv), t547)(tm_3)
    }
  }
  let exists_poly_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = fn(
    x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) as gl = x548
    let (evs_2, bod_2) = @basics.strip_exists(w)
    let ps_3 = @lib.mapfilter(
      fn(x555 : (String, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x553 : @kernel.Thm) -> @kernel.Term raise {
          (fn(x551 : @kernel.Term) -> @kernel.Term raise {
            ((x550 : @kernel.Term) => {
              @lib.check(
                fn(x549 : @kernel.Term) -> Bool raise {
                  let t_2 = x549
                  @kernel.type_of(t_2) == int_ty
                },
                x550,
              )
            })(@equal.lhs(x551))
          })(
            (fn(x552 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x552)
            })(x553),
          )
        })(
          (fn(x554 : (String, @kernel.Thm)) -> @kernel.Thm raise { x554.1 })(
            x555,
          ),
        )
      },
      asl,
    )
    let cfs_1 = solve_idealism(
      evs_2,
      ps_3,
      @lib.map(@equal.lhs, @basics.conjuncts(bod_2)),
    )
    let t564 = @tactics.conv_tac(int_ring)
    let t563 = @tactics.repeat_tac(
      @tactics.pop_assum(fn(
        x560 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s561 = @tactics.mp_tac(x560)
        fn(
          x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s561(x562)
        }
      }),
    )
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x556 : @kernel.Term,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s557 = @tactics.exists_tac(x556)
            fn(
              x558 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s557(x558)
            }
          },
          @lib.map(
            fn(x559 : @kernel.Term) -> @kernel.Term raise {
              let v_10 = x559
              @lib.rev_assocd(v_10, cfs_1, zero_tm)
            },
            evs_2,
          ),
        ),
        t563,
      ),
      t564,
    )(gl)
  }
  let t565 = @drule.match_mp(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("!((x : _) == (y : _)) → x == y || (p : Bool) → p"),
    ),
  )
  let scrub_neq_tac : (@kernel.Thm) -> ((
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
    x566 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.match_mp_tac(t565(x566))
  }
  let t584 = @tactics.conv_tac(@equal.once_depth_conv(int_polyeq_conv))
  let t583 = @tactics.conv_tac(genvar_exists_conv)
  let t582 = @tactics.repeat_tac(@tactics.disch_tac)
  let t581 = @tactics.pop_assum_list(fn(
    x580 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
  let t578 = @class.taut(
    @term_syntax.parse_term("((a : Bool) || (b : Bool) && (c : Bool)) == ((a || b) && (a || c))"),
  )
  let t579 = @simp.rewrite_tac(@list.List([@equal.gsym(int_entire()), t578]))
  let t577 = @tactics.conv_tac(@equal.once_depth_conv(int_polyeq_conv))
  let t576 = @tactics.repeat_tac(
    @tactics.first_x_assum(fn(
      x575 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x572 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s573 = @tactics.mp_tac(x572)
        fn(
          x574 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s573(x574)
        }
      })(@equal.sym(x575))
    }),
  )
  let t571 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_and_exists_thm(),
      @theorems.right_and_exists_thm(),
      @theorems.left_or_exists_thm(),
      @theorems.right_or_exists_thm(),
    ]),
  )
  let t570 = @tactics.repeat_tac(@tactics.first_x_assum(scrub_neq_tac))
  let t569 = @tactics.conv_tac(@equal.repeatc(unwind_polys_conv))
  let t568 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_and_exists_thm(),
      @theorems.right_and_exists_thm(),
      @theorems.left_or_exists_thm(),
      @theorems.right_or_exists_thm(),
    ]),
  )
  let t567 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac),
  )
  integer_tac_v1_c.set(
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
                              @simp.rewrite_tac(
                                @list.List([
                                  int_coprime(),
                                  int_congruent(),
                                  int_divides(),
                                ]),
                              ),
                              t567,
                            ),
                            t568,
                          ),
                          t569,
                        ),
                        t570,
                      ),
                      t571,
                    ),
                    t576,
                  ),
                  t577,
                ),
                t579,
              ),
              t581,
            ),
            t582,
          ),
          t583,
        ),
        t584,
      ),
      exists_poly_tac,
    ),
  )
}

///|
let integer_tac_v1_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "INTEGER_TAC",
)

///|
/// `INTEGER_TAC`
pub fn integer_tac_v1(x : @tactics.Goal) -> @tactics.Goalstate raise {
  integer_tac_v1_c.get()(x)
}

///|
/// `INTEGER_RULE`
pub fn integer_rule_v1(x585 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x585
  @tactics.prove(tm, integer_tac_v1)
}

///|
/// INT_DIVMOD_UNIQ
fn step_389() -> Unit raise {
  let t611 = @tactics.conv_tac(int_ring)
  let t612 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.ap_term_tac,
      @tactics.repeat_tac(
        @tactics.pop_assum(fn(
          x608 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s609 = @tactics.mp_tac(x608)
          fn(
            x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s609(x610)
          }
        }),
      ),
    ),
    t611,
  )
  let t613 = @list.List([
    @tactics.then_tac(
      @tactics.match_mp_tac(int_le_rmul()),
      asm_int_arith_tac_v1,
    ),
    t612,
  ])
  let t607 = @tactics.match_mp_tac(
    int_arith_v1(
      @term_syntax.parse_term("int_of_num(1) * abs((n : Int)) <= abs((q : Int) - div((m : Int), n)) * abs(n) && abs(rem(m, n) - (r : Int)) == abs((q - div(m, n)) * n) → !(abs(rem(m, n) - r) < abs(n))"),
    ),
  )
  let t606 = @list.List([
    asm_int_arith_tac_v1,
    @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)"))),
  ])
  let t605 = @tactics.subgoal_then(
    @term_syntax.parse_term("abs(rem((m : Int), (n : Int)) - (r : Int)) < abs(n)"),
    fn(
      x602 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s603 = @tactics.mp_tac(x602)
      fn(
        x604 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s603(x604)
      }
    },
  )
  let t600 = @tactics.conv_tac(int_ring)
  let t601 = @list.List([
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.pop_assum(fn(
          x597 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s598 = @tactics.mp_tac(x597)
          fn(
            x599 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s598(x599)
          }
        }),
      ),
      t600,
    ),
    @tactics.all_tac,
  ])
  let t596 = @class.asm_cases_tac(@term_syntax.parse_term("div((m : Int), (n : Int)) == (q : Int)"))
  let t593 = @drule.match_mp(int_division())
  let t590 = @term_syntax.parse_term("(m : Int)")
  let t595 = @tactics.disch_then(fn(
    x594 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x592 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
        ((x591 : @kernel.Thm) => @bool.spec(t590, x591))(x592),
      )
    })(t593(x594))
  })
  let t589 = @tactics.subgoal_then(@term_syntax.parse_term("!((n : Int) == int_of_num(0))"), fn(
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
    let s587 = @tactics.mp_tac(x586)
    fn(
      x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s587(x588)
    }
  })
  let t614 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.gen_tac),
                        @tactics.strip_tac,
                      ),
                      t589,
                    ),
                    @list.List([asm_int_arith_tac_v1, @tactics.all_tac]),
                  ),
                  t595,
                ),
                t596,
              ),
              t601,
            ),
            t605,
          ),
          t606,
        ),
        t607,
      ),
      @tactics.conj_tac,
    ),
    t613,
  )
  int_divmod_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ q : Int, ∀ r : Int, m == q * n + r && int_of_num(0) <= r && r < abs(n) → div(m, n) == q && rem(m, n) == r"),
      t614,
    ),
  )
}

///|
let int_divmod_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVMOD_UNIQ",
)

///|
/// `INT_DIVMOD_UNIQ`
pub fn int_divmod_uniq() -> @kernel.Thm {
  int_divmod_uniq_c.get()
}

///|
/// INT_DIV_UNIQ
fn step_390() -> Unit raise {
  let t615 = @meson.meson_tac(@list.List([int_divmod_uniq()]))
  int_div_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ q : Int, ∀ r : Int, m == q * n + r && int_of_num(0) <= r && r < abs(n) → div(m, n) == q"),
      t615,
    ),
  )
}

///|
let int_div_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_UNIQ")

///|
/// `INT_DIV_UNIQ`
pub fn int_div_uniq() -> @kernel.Thm {
  int_div_uniq_c.get()
}

///|
/// INT_REM_UNIQ
fn step_391() -> Unit raise {
  let t616 = @meson.meson_tac(@list.List([int_divmod_uniq()]))
  int_rem_uniq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ q : Int, ∀ r : Int, m == q * n + r && int_of_num(0) <= r && r < abs(n) → rem(m, n) == r"),
      t616,
    ),
  )
}

///|
let int_rem_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_UNIQ")

///|
/// `INT_REM_UNIQ`
pub fn int_rem_uniq() -> @kernel.Thm {
  int_rem_uniq_c.get()
}

///|
let int_div_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_LT")

///|
/// `INT_DIV_LT`
pub fn int_div_lt() -> @kernel.Thm {
  int_div_lt_c.get()
}

///|
let int_rem_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_LT")

///|
/// `INT_REM_LT`
pub fn int_rem_lt() -> @kernel.Thm {
  int_rem_lt_c.get()
}

///|
/// INT_DIV_LT, INT_REM_LT
fn step_392() -> Unit raise {
  let t622 = @tactics.match_mp_tac(int_divmod_uniq())
  let t621 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("(((p : Bool) → (q : Bool)) && (p → (r : Bool))) == (p → q && r)"),
      ),
    ]),
  )
  let t620 = @simp.asm_rewrite_tac(@list.List([int_div_0(), int_rem_0()]))
  let t619 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t618 = @tactics.repeat_tac(@tactics.gen_tac)
  let t623 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                t618,
              ),
              t619,
            ),
            t620,
          ),
          t621,
        ),
        @tactics.strip_tac,
      ),
      t622,
    ),
    asm_int_arith_tac_v1,
  )
  let t624 = (
    @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, (!(n == int_of_num(0)) → int_of_num(0) <= m) && m < n → div(m, n) == int_of_num(0)) && (∀ m : Int, ∀ n : Int, (!(n == int_of_num(0)) → int_of_num(0) <= m) && m < n → rem(m, n) == m)"),
    t623,
  )
  let (int_div_lt, int_rem_lt) = @bool.conj_pair(
    (fn(
      x617 : (
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
      @tactics.prove(x617.0, x617.1)
    })(t624),
  )
  int_div_lt_c.set(int_div_lt)
  int_rem_lt_c.set(int_rem_lt)
}

///|
let int_div_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_RNEG")

///|
/// `INT_DIV_RNEG`
pub fn int_div_rneg() -> @kernel.Thm {
  int_div_rneg_c.get()
}

///|
let int_rem_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_RNEG")

///|
/// `INT_REM_RNEG`
pub fn int_rem_rneg() -> @kernel.Thm {
  int_rem_rneg_c.get()
}

///|
/// INT_DIV_RNEG, INT_REM_RNEG
fn step_393() -> Unit raise {
  let t630 = @term_syntax.parse_term("(n : Int)")
  let t631 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(m : Int)"), t630]), int_division()),
  )
  let t629 = @tactics.match_mp_tac(int_divmod_uniq())
  let t628 = @simp.asm_rewrite_tac(
    @list.List([int_div_0(), int_rem_0(), int_neg_0()]),
  )
  let t627 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t626 = @tactics.repeat_tac(@tactics.gen_tac)
  let t632 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
              t626,
            ),
            t627,
          ),
          t628,
        ),
        t629,
      ),
      t631,
    ),
    asm_int_arith_tac_v1,
  )
  let t633 = (
    @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, div(m, -n) == -div(m, n)) && (∀ m : Int, ∀ n : Int, rem(m, -n) == rem(m, n))"),
    t632,
  )
  let (int_div_rneg, int_rem_rneg) = @bool.conj_pair(
    (fn(
      x625 : (
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
      @tactics.prove(x625.0, x625.1)
    })(t633),
  )
  int_div_rneg_c.set(int_div_rneg)
  int_rem_rneg_c.set(int_rem_rneg)
}

///|
/// INT_REM_RABS
fn step_394() -> Unit raise {
  let t634 = @simp.rewrite_tac(
    @list.List([
      forall_int_cases(),
      int_abs_neg(),
      int_rem_rneg(),
      int_abs_num(),
    ]),
  )
  int_rem_rabs_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, rem(x, abs(y)) == rem(x, y)"), t634),
  )
}

///|
let int_rem_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_RABS")

///|
/// `INT_REM_RABS`
pub fn int_rem_rabs() -> @kernel.Thm {
  int_rem_rabs_c.get()
}

///|
/// INT_REM_REM
fn step_395() -> Unit raise {
  let t640 = @meson.asm_meson_tac(@list.List([int_division()]))
  let t639 = @simp.rewrite_tac(@list.List([int_mul_lzero(), int_add_lid()]))
  let t638 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num(0)"))
  let t637 = @tactics.match_mp_tac(int_rem_uniq())
  let t636 = @simp.asm_rewrite_tac(@list.List([int_rem_0()]))
  let t635 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t641 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t635),
            t636,
          ),
          t637,
        ),
        t638,
      ),
      t639,
    ),
    t640,
  )
  int_rem_rem_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, rem(rem(m, n), n) == rem(m, n)"), t641),
  )
}

///|
let int_rem_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_REM")

///|
/// `INT_REM_REM`
pub fn int_rem_rem() -> @kernel.Thm {
  int_rem_rem_c.get()
}

///|
/// INT_REM_EQ
fn step_396() -> Unit raise {
  let t661 = @tactics.conv_tac(int_ring)
  let t660 = @simp.asm_simp_tac(@list.List([]))
  let t658 = @term_syntax.parse_term("(p : Int)")
  let t659 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(n : Int)"), t658]), int_division()),
  )
  let t657 = @tactics.exists_tac(@term_syntax.parse_term("div((n : Int), (p : Int)) + (d : Int)"))
  let t656 = @tactics.match_mp_tac(int_rem_uniq())
  let t655 = @simp.asm_rewrite_tac(
    @list.List([int_rem_0(), int_mul_lzero(), int_add_lid()]),
  )
  let t654 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Int) == int_of_num(0)"))
  let t653 = @tactics.disch_then(fn(
    x650 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s651 = @tactics.subst1_tac(x650)
    fn(
      x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s651(x652)
    }
  })
  let t649 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Int)"))
  let t662 = @tactics.then_tac(
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
                        @theorems.left_imp_exists_thm(),
                        int_eq_sub_radd(),
                      ]),
                    ),
                    t649,
                  ),
                  t653,
                ),
                t654,
              ),
              t655,
            ),
            t656,
          ),
          t657,
        ),
        t659,
      ),
      t660,
    ),
    t661,
  )
  let t648 = @tactics.conv_tac(int_ring)
  let t647 = @simp.asm_rewrite_tac(@list.List([]))
  let t645 = @term_syntax.parse_term("(p : Int)")
  let t646 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Int)"), t645]),
      int_division_simp(),
    ),
  )
  let t643 = @term_syntax.parse_term("(p : Int)")
  let t644 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Int)"), t643]),
      int_division_simp(),
    ),
  )
  let t663 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_tac,
              @tactics.exists_tac(@term_syntax.parse_term("div((m : Int), (p : Int)) - div((n : Int), p)")),
            ),
            t644,
          ),
          t646,
        ),
        t647,
      ),
      t648,
    ),
    t662,
  ])
  let t642 = @simp.rewrite_tac(@list.List([int_congruent()]))
  let t664 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t642),
      @tactics.eq_tac,
    ),
    t663,
  )
  int_rem_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, (rem(m, p) == rem(n, p)) == op_eq_eq(m, n, mod(p))"),
      t664,
    ),
  )
}

///|
let int_rem_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_EQ")

///|
/// `INT_REM_EQ`
pub fn int_rem_eq() -> @kernel.Thm {
  int_rem_eq_c.get()
}

///|
let int_div_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_ZERO")

///|
/// `INT_DIV_ZERO`
pub fn int_div_zero() -> @kernel.Thm {
  int_div_zero_c.get()
}

///|
let int_rem_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_ZERO")

///|
/// `INT_REM_ZERO`
pub fn int_rem_zero() -> @kernel.Thm {
  int_rem_zero_c.get()
}

///|
/// INT_DIV_ZERO, INT_REM_ZERO
fn step_397() -> Unit raise {
  let t668 = @tactics.match_mp_tac(int_divmod_uniq())
  let t667 = @simp.asm_rewrite_tac(@list.List([int_div_0(), int_rem_0()]))
  let t666 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t669 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
            @tactics.gen_tac,
          ),
          t666,
        ),
        t667,
      ),
      t668,
    ),
    asm_int_arith_tac_v1,
  )
  let t670 = (
    @term_syntax.parse_term("(∀ n : Int, div(int_of_num(0), n) == int_of_num(0)) && (∀ n : Int, rem(int_of_num(0), n) == int_of_num(0))"),
    t669,
  )
  let (int_div_zero, int_rem_zero) = @bool.conj_pair(
    (fn(
      x665 : (
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
      @tactics.prove(x665.0, x665.1)
    })(t670),
  )
  int_div_zero_c.set(int_div_zero)
  int_rem_zero_c.set(int_rem_zero)
}

///|
/// INT_REM_EQ_0
fn step_398() -> Unit raise {
  let t673 = @tactics.conv_tac(integer_rule_v1)
  let t672 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t671 = @tactics.subst1_tac(
    @equal.sym(@bool.spec(@term_syntax.parse_term("(n : Int)"), int_rem_zero())),
  )
  let t674 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t671),
      t672,
    ),
    t673,
  )
  int_rem_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, (rem(m, n) == int_of_num(0)) == divides(n, m)"),
      t674,
    ),
  )
}

///|
let int_rem_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_EQ_0")

///|
/// `INT_REM_EQ_0`
pub fn int_rem_eq_0() -> @kernel.Thm {
  int_rem_eq_0_c.get()
}

///|
/// INT_MUL_DIV_EQ
fn step_399() -> Unit raise {
  let t679 = @tactics.conv_tac(int_ring)
  let t678 = @simp.rewrite_tac(@list.List([@equal.gsym(int_rem_eq_0())]))
  let t676 = @term_syntax.parse_term("(n : Int)")
  let t677 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(m : Int)"), t676]),
      int_division_simp(),
    ),
  )
  let t675 = @tactics.repeat_tac(@tactics.gen_tac)
  let t680 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
          t675,
        ),
        t677,
      ),
      t678,
    ),
    t679,
  )
  int_mul_div_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, (n * div(m, n) == m) == divides(n, m)) && (∀ m : Int, ∀ n : Int, (div(m, n) * n == m) == divides(n, m))"),
      t680,
    ),
  )
}

///|
let int_mul_div_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_DIV_EQ")

///|
/// `INT_MUL_DIV_EQ`
pub fn int_mul_div_eq() -> @kernel.Thm {
  int_mul_div_eq_c.get()
}

///|
/// INT_CONG_LREM
fn step_400() -> Unit raise {
  let t681 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_rem_eq()), int_rem_rem()]),
  )
  int_cong_lrem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(rem(x, n), y, mod(n)) == op_eq_eq(x, y, mod(n))"),
      t681,
    ),
  )
}

///|
let int_cong_lrem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_LREM")

///|
/// `INT_CONG_LREM`
pub fn int_cong_lrem() -> @kernel.Thm {
  int_cong_lrem_c.get()
}

///|
/// INT_CONG_RREM
fn step_401() -> Unit raise {
  let t682 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_rem_eq()), int_rem_rem()]),
  )
  int_cong_rrem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ n : Int, op_eq_eq(x, rem(y, n), mod(n)) == op_eq_eq(x, y, mod(n))"),
      t682,
    ),
  )
}

///|
let int_cong_rrem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_RREM")

///|
/// `INT_CONG_RREM`
pub fn int_cong_rrem() -> @kernel.Thm {
  int_cong_rrem_c.get()
}

///|
/// INT_REM_MOD_SELF
fn step_402() -> Unit raise {
  let t683 = @tactics.conv_tac(integer_rule_v1)
  let t684 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_cong_lrem()])),
    t683,
  )
  int_rem_mod_self_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, op_eq_eq(rem(m, n), m, mod(n))"), t684),
  )
}

///|
let int_rem_mod_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_MOD_SELF",
)

///|
/// `INT_REM_MOD_SELF`
pub fn int_rem_mod_self() -> @kernel.Thm {
  int_rem_mod_self_c.get()
}

///|
/// INT_REM_REM_MUL
fn step_403() -> Unit raise {
  let t690 = @tactics.conv_tac(integer_rule_v1)
  let t687 = @term_syntax.parse_term("(n : Int) * (p : Int)")
  let t688 = @tactics.mp_tac(
    @bool.ispecl(
      @list.List([@term_syntax.parse_term("(m : Int)"), t687]),
      int_rem_mod_self(),
    ),
  )
  let t686 = @term_syntax.parse_term("(n : Int) * (p : Int)")
  let t689 = @list.List([
    @tactics.mp_tac(
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(m : Int)"), t686]),
        int_rem_mod_self(),
      ),
    ),
    t688,
  ])
  let t685 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t691 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t685),
      t689,
    ),
    t690,
  )
  int_rem_rem_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, ∀ p : Int, rem(rem(m, n * p), n) == rem(m, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, rem(rem(m, n * p), p) == rem(m, p))"),
      t691,
    ),
  )
}

///|
let int_rem_rem_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_REM_MUL",
)

///|
/// `INT_REM_REM_MUL`
pub fn int_rem_rem_mul() -> @kernel.Thm {
  int_rem_rem_mul_c.get()
}

///|
/// INT_CONG_SOLVE_BOUNDS
fn step_404() -> Unit raise {
  let t692 = @meson.meson_tac(@list.List([int_division(), int_rem_mod_self()]))
  int_cong_solve_bounds_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ n : Int, !(n == int_of_num(0)) → (∃ x : Int, int_of_num(0) <= x && x < abs(n) && op_eq_eq(x, a, mod(n)))"),
      t692,
    ),
  )
}

///|
let int_cong_solve_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_SOLVE_BOUNDS",
)

///|
/// `INT_CONG_SOLVE_BOUNDS`
pub fn int_cong_solve_bounds() -> @kernel.Thm {
  int_cong_solve_bounds_c.get()
}

///|
/// INT_NEG_REM
fn step_405() -> Unit raise {
  let t695 = @simp.rewrite_tac(@list.List([int_rem_mod_self()]))
  let t694 = @tactics.match_mp_tac(
    integer_rule_v1(
      @term_syntax.parse_term("op_eq_eq((a : Int), (b : Int), mod((n : Int))) → op_eq_eq(-a, -b, mod(n))"),
    ),
  )
  let t693 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t696 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t693),
      t694,
    ),
    t695,
  )
  int_neg_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ p : Int, rem(-rem(n, p), p) == rem(-n, p)"),
      t696,
    ),
  )
}

///|
let int_neg_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NEG_REM")

///|
/// `INT_NEG_REM`
pub fn int_neg_rem() -> @kernel.Thm {
  int_neg_rem_c.get()
}

///|
/// INT_ADD_REM
fn step_406() -> Unit raise {
  let t699 = @simp.rewrite_tac(@list.List([int_rem_mod_self()]))
  let t698 = @tactics.match_mp_tac(
    integer_rule_v1(
      @term_syntax.parse_term("op_eq_eq((x : Int), (x' : Int), mod((n : Int))) && op_eq_eq((y : Int), (y' : Int), mod(n)) → op_eq_eq(x + y, x' + y', mod(n))"),
    ),
  )
  let t697 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t700 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t697),
      t698,
    ),
    t699,
  )
  int_add_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, rem(rem(m, p) + rem(n, p), p) == rem(m + n, p)"),
      t700,
    ),
  )
}

///|
let int_add_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_REM")

///|
/// `INT_ADD_REM`
pub fn int_add_rem() -> @kernel.Thm {
  int_add_rem_c.get()
}

///|
/// INT_SUB_REM
fn step_407() -> Unit raise {
  let t703 = @simp.rewrite_tac(@list.List([int_rem_mod_self()]))
  let t702 = @tactics.match_mp_tac(
    integer_rule_v1(
      @term_syntax.parse_term("op_eq_eq((x : Int), (x' : Int), mod((n : Int))) && op_eq_eq((y : Int), (y' : Int), mod(n)) → op_eq_eq(x - y, x' - y', mod(n))"),
    ),
  )
  let t701 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t704 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t701),
      t702,
    ),
    t703,
  )
  int_sub_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, rem(rem(m, p) - rem(n, p), p) == rem(m - n, p)"),
      t704,
    ),
  )
}

///|
let int_sub_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_REM")

///|
/// `INT_SUB_REM`
pub fn int_sub_rem() -> @kernel.Thm {
  int_sub_rem_c.get()
}

///|
/// INT_MUL_REM
fn step_408() -> Unit raise {
  let t707 = @simp.rewrite_tac(@list.List([int_rem_mod_self()]))
  let t706 = @tactics.match_mp_tac(
    integer_rule_v1(
      @term_syntax.parse_term("op_eq_eq((x : Int), (x' : Int), mod((n : Int))) && op_eq_eq((y : Int), (y' : Int), mod(n)) → op_eq_eq(x * y, x' * y', mod(n))"),
    ),
  )
  let t705 = @simp.rewrite_tac(@list.List([int_rem_eq()]))
  let t708 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t705),
      t706,
    ),
    t707,
  )
  int_mul_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, rem(rem(m, p) * rem(n, p), p) == rem(m * n, p)"),
      t708,
    ),
  )
}

///|
let int_mul_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_MUL_REM")

///|
/// `INT_MUL_REM`
pub fn int_mul_rem() -> @kernel.Thm {
  int_mul_rem_c.get()
}

///|
/// INT_POW_REM
fn step_409() -> Unit raise {
  let t716 = @simp.rewrite_tac(@list.List([int_mul_rem()]))
  let t715 = @simp.rewrite_tac(@list.List([int_rem_rem()]))
  let t714 = @simp.asm_rewrite_tac(@list.List([]))
  let t713 = @simp.gen_rewrite_tac(
    fn(
      x710 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s711 = @equal.land_conv(x710)
      fn(x712 : @kernel.Term) -> @kernel.Thm raise { s711(x712) }
    },
    @list.List([@equal.gsym(int_mul_rem())]),
  )
  let t709 = @simp.rewrite_tac(@list.List([int_pow_v1()]))
  let t717 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
              t709,
            ),
            @tactics.gen_tac,
          ),
          t713,
        ),
        t714,
      ),
      t715,
    ),
    t716,
  )
  int_pow_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Num, ∀ p : Int, rem(pow(rem(m, p), n), p) == rem(pow(m, n), p)"),
      t717,
    ),
  )
}

///|
let int_pow_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_REM")

///|
/// `INT_POW_REM`
pub fn int_pow_rem() -> @kernel.Thm {
  int_pow_rem_c.get()
}

///|
let int_of_num_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_DIV")

///|
/// `INT_OF_NUM_DIV`
pub fn int_of_num_div() -> @kernel.Thm {
  int_of_num_div_c.get()
}

///|
let int_of_num_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_OF_NUM_REM")

///|
/// `INT_OF_NUM_REM`
pub fn int_of_num_rem() -> @kernel.Thm {
  int_of_num_rem_c.get()
}

///|
/// INT_OF_NUM_DIV, INT_OF_NUM_REM
fn step_410() -> Unit raise {
  let t726 = @simp.asm_rewrite_tac(@list.List([]))
  let t725 = @tactics.match_mp_tac(@arith.division())
  let t724 = @simp.rewrite_tac(
    @list.List([int_pos(), int_of_num_eq(), int_of_num_lt()]),
  )
  let t723 = @simp.rewrite_tac(
    @list.List([int_of_num_mul(), int_of_num_add(), int_abs_num()]),
  )
  let t722 = @tactics.match_mp_tac(int_divmod_uniq())
  let t721 = @simp.asm_rewrite_tac(
    @list.List([int_div_0(), int_rem_0(), @arith.div_zero(), @arith.mod_zero()]),
  )
  let t720 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t719 = @tactics.repeat_tac(@tactics.gen_tac)
  let t727 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                  t719,
                ),
                t720,
              ),
              t721,
            ),
            t722,
          ),
          t723,
        ),
        t724,
      ),
      t725,
    ),
    t726,
  )
  let t728 = (
    @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, div(int_of_num(m), int_of_num(n)) == int_of_num(DIV(m, n))) && (∀ m : Num, ∀ n : Num, rem(int_of_num(m), int_of_num(n)) == int_of_num(MOD(m, n)))"),
    t727,
  )
  let (int_of_num_div, int_of_num_rem) = @bool.conj_pair(
    (fn(
      x718 : (
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
      @tactics.prove(x718.0, x718.1)
    })(t728),
  )
  int_of_num_div_c.set(int_of_num_div)
  int_of_num_rem_c.set(int_of_num_rem)
}

///|
let int_div_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_REFL")

///|
/// `INT_DIV_REFL`
pub fn int_div_refl() -> @kernel.Thm {
  int_div_refl_c.get()
}

///|
let int_rem_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_REFL")

///|
/// `INT_REM_REFL`
pub fn int_rem_refl() -> @kernel.Thm {
  int_rem_refl_c.get()
}

///|
/// INT_DIV_REFL, INT_REM_REFL
fn step_411() -> Unit raise {
  let t732 = @tactics.match_mp_tac(int_divmod_uniq())
  let t731 = @list.List([
    @meson.asm_meson_tac(@list.List([int_div_0(), int_rem_0()])),
    @tactics.all_tac,
  ])
  let t730 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Int)"))
  let t733 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
            t730,
          ),
          @class.cond_cases_tac,
        ),
        t731,
      ),
      t732,
    ),
    asm_int_arith_tac_v1,
  )
  let t734 = (
    @term_syntax.parse_term("(∀ n : Int, div(n, n) == (if n == int_of_num(0) { int_of_num(0) } else { int_of_num(1) })) && (∀ n : Int, rem(n, n) == int_of_num(0))"),
    t733,
  )
  let (int_div_refl, int_rem_refl) = @bool.conj_pair(
    (fn(
      x729 : (
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
      @tactics.prove(x729.0, x729.1)
    })(t734),
  )
  int_div_refl_c.set(int_div_refl)
  int_rem_refl_c.set(int_rem_refl)
}

///|
let int_div_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_LNEG")

///|
/// `INT_DIV_LNEG`
pub fn int_div_lneg() -> @kernel.Thm {
  int_div_lneg_c.get()
}

///|
let int_rem_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_LNEG")

///|
/// `INT_REM_LNEG`
pub fn int_rem_lneg() -> @kernel.Thm {
  int_rem_lneg_c.get()
}

///|
/// INT_DIV_LNEG, INT_REM_LNEG
fn step_412() -> Unit raise {
  let t751 = @simp.asm_rewrite_tac(@list.List([]))
  let t750 = @simp.asm_rewrite_tac(
    @list.List([
      int_sgn_abs_alt(),
      int_arith_v1(
        @term_syntax.parse_term("(-(m : Int) == (-(x : Int) - (y : Int)) * (z : Int) + (w : Int)) == (m == x * z + (y * z - w))"),
      ),
    ]),
  )
  let t747 = @drule.match_mp(int_division())
  let t744 = @term_syntax.parse_term("(m : Int)")
  let t749 = @tactics.first_assum(fn(
    x748 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x746 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x741 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s742 = @tactics.mp_tac(x741)
        fn(
          x743 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s742(x743)
        }
      })(((x745 : @kernel.Thm) => @bool.spec(t744, x745))(x746))
    })(t747(x748))
  })
  let t740 = @tactics.match_mp_tac(int_divmod_uniq())
  let t739 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(@list.List([int_div_0(), int_rem_0(), int_sgn_0()])),
      int_arith_tac_v1,
    ),
    @tactics.all_tac,
  ])
  let t738 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t736 = @term_syntax.parse_term("(n : Int)")
  let t737 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Int)"), t736]),
  )
  let t752 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
                    t737,
                  ),
                  t738,
                ),
                t739,
              ),
              t740,
            ),
            t749,
          ),
          @class.cond_cases_tac,
        ),
        t750,
      ),
      t751,
    ),
    asm_int_arith_tac_v1,
  )
  let t753 = (
    @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, div(-m, n) == (if rem(m, n) == int_of_num(0) { -div(m, n) } else { -div(m, n) - int_sgn(n) })) && (∀ m : Int, ∀ n : Int, rem(-m, n) == (if rem(m, n) == int_of_num(0) { int_of_num(0) } else { abs(n) - rem(m, n) }))"),
    t752,
  )
  let (int_div_lneg, int_rem_lneg) = @bool.conj_pair(
    (fn(
      x735 : (
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
      @tactics.prove(x735.0, x735.1)
    })(t753),
  )
  int_div_lneg_c.set(int_div_lneg)
  int_rem_lneg_c.set(int_rem_lneg)
}

///|
/// INT_DIV_NEG2
fn step_413() -> Unit raise {
  let t754 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([int_div_rneg(), int_div_lneg(), int_sgn_neg(), int_rem_rneg()]),
    ),
    int_arith_tac_v1,
  )
  int_div_neg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, div(-m, -n) == (if rem(m, n) == int_of_num(0) { div(m, n) } else { div(m, n) + int_sgn(n) })"),
      t754,
    ),
  )
}

///|
let int_div_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_NEG2")

///|
/// `INT_DIV_NEG2`
pub fn int_div_neg2() -> @kernel.Thm {
  int_div_neg2_c.get()
}

///|
/// INT_REM_NEG2
fn step_414() -> Unit raise {
  let t755 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_rem_lneg(), int_rem_rneg()])),
    int_arith_tac_v1,
  )
  int_rem_neg2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, rem(-m, -n) == (if rem(m, n) == int_of_num(0) { int_of_num(0) } else { abs(n) - rem(m, n) })"),
      t755,
    ),
  )
}

///|
let int_rem_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_NEG2")

///|
/// `INT_REM_NEG2`
pub fn int_rem_neg2() -> @kernel.Thm {
  int_rem_neg2_c.get()
}

///|
let int_div_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_1")

///|
/// `INT_DIV_1`
pub fn int_div_1() -> @kernel.Thm {
  int_div_1_c.get()
}

///|
let int_rem_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_1")

///|
/// `INT_REM_1`
pub fn int_rem_1() -> @kernel.Thm {
  int_rem_1_c.get()
}

///|
/// INT_DIV_1, INT_REM_1
fn step_415() -> Unit raise {
  let t757 = @tactics.match_mp_tac(int_divmod_uniq())
  let t758 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
        @tactics.gen_tac,
      ),
      t757,
    ),
    int_arith_tac_v1,
  )
  let t759 = (
    @term_syntax.parse_term("(∀ n : Int, div(n, int_of_num(1)) == n) && (∀ n : Int, rem(n, int_of_num(1)) == int_of_num(0))"),
    t758,
  )
  let (int_div_1, int_rem_1) = @bool.conj_pair(
    (fn(
      x756 : (
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
      @tactics.prove(x756.0, x756.1)
    })(t759),
  )
  int_div_1_c.set(int_div_1)
  int_rem_1_c.set(int_rem_1)
}

///|
let int_div_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_MUL")

///|
/// `INT_DIV_MUL`
pub fn int_div_mul() -> @kernel.Thm {
  int_div_mul_c.get()
}

///|
let int_rem_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_MUL")

///|
/// `INT_REM_MUL`
pub fn int_rem_mul() -> @kernel.Thm {
  int_rem_mul_c.get()
}

///|
/// INT_DIV_MUL, INT_REM_MUL
fn step_416() -> Unit raise {
  let t766 = @tactics.match_mp_tac(int_divmod_uniq())
  let t765 = @simp.asm_rewrite_tac(@list.List([int_rem_0(), int_mul_rzero()]))
  let t764 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t763 = @tactics.repeat_tac(@tactics.gen_tac)
  let t761 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t762 = @list.List([@meson.meson_tac(@list.List([int_mul_sym()])), t761])
  let t767 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.match_mp_tac(
                  @class.taut(
                    @term_syntax.parse_term("(((p : Bool) → (p' : Bool)) && ((q : Bool) → (q' : Bool))) && p && q → (p && p') && q && q'"),
                  ),
                ),
                @tactics.conj_tac,
              ),
              t762,
            ),
            t763,
          ),
          t764,
        ),
        t765,
      ),
      t766,
    ),
    asm_int_arith_tac_v1,
  )
  let t768 = (
    @term_syntax.parse_term("((∀ m : Int, ∀ n : Int, !(n == int_of_num(0)) → div(m * n, n) == m) && (∀ m : Int, ∀ n : Int, !(m == int_of_num(0)) → div(m * n, m) == n)) && (∀ m : Int, ∀ n : Int, rem(m * n, n) == int_of_num(0)) && (∀ m : Int, ∀ n : Int, rem(m * n, m) == int_of_num(0))"),
    t767,
  )
  let (int_div_mul, int_rem_mul) = @bool.conj_pair(
    (fn(
      x760 : (
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
      @tactics.prove(x760.0, x760.1)
    })(t768),
  )
  int_div_mul_c.set(int_div_mul)
  int_rem_mul_c.set(int_rem_mul)
}

///|
/// INT_DIV_LT_EQ
fn step_417() -> Unit raise {
  let t793 = @meson.asm_meson_tac(@list.List([int_rem_mul()]))
  let t792 = @simp.rewrite_tac(
    @list.List([
      int_arith_v1(
        @term_syntax.parse_term("(!((m : Int) < (n : Int) * -(c : Int)) == (-m < n * c)) == !(m == n * -c)"),
      ),
    ]),
  )
  let t791 = @simp.asm_rewrite_tac(
    @list.List([int_arith_v1(@term_syntax.parse_term("(-(a : Int) <= (b : Int)) == !(a < -b)"))]),
  )
  let t790 = @simp.rewrite_tac(
    @list.List([int_lt_sub_radd(), @equal.gsym(int_le_discrete())]),
  )
  let t789 = @simp.asm_simp_tac(
    @list.List([int_sgn_v1(), int_of_num_lt(), @arith.le_1()]),
  )
  let t787 = @simp.asm_simp_tac(@list.List([int_lt_lmul_eq(), int_of_num_lt()]))
  let t786 = @simp.rewrite_tac(
    @list.List([
      int_arith_v1(@term_syntax.parse_term("-((q : Int) * int_of_num((n : Num)) + int_of_num(0)) == int_of_num(n) * -q")),
    ]),
  )
  let t785 = @simp.asm_simp_tac(@list.List([int_of_num_eq(), @arith.le_1()]))
  let t783 = @term_syntax.parse_term("(r : Int) == rem(int_of_num((m : Num)), int_of_num((n : Num)))")
  let t784 = @tactics.map_every(
    @simp.abbrev_tac,
    @list.List([@term_syntax.parse_term("(q : Int) == div(int_of_num((m : Num)), int_of_num((n : Num)))"), t783]),
  )
  let t782 = @term_syntax.parse_term("int_of_num((n : Num))")
  let t788 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.mp_tac(
                @bool.specl(
                  @list.List([@term_syntax.parse_term("int_of_num((m : Num))"), t782]),
                  int_division(),
                ),
              ),
              t784,
            ),
            t785,
          ),
          @tactics.disch_tac,
        ),
        t786,
      ),
      t787,
    ),
    @tactics.all_tac,
  ])
  let t781 = @simp.rewrite_tac(@list.List([int_div_lneg()]))
  let t780 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t778 = @simp.asm_simp_tac(
    @list.List([@arith.rdiv_lt_eq(), @arith.le_1()]),
  )
  let t777 = @simp.rewrite_tac(
    @list.List([
      int_of_num_lt(),
      int_arith_v1(@term_syntax.parse_term("!(int_of_num((m : Num)) < -int_of_num((n : Num)))")),
    ]),
  )
  let t776 = @simp.rewrite_tac(@list.List([int_mul_rneg(), int_of_num_mul()]))
  let t779 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([int_of_num_div(), forall_int_cases()])),
          t776,
        ),
        t777,
      ),
      t778,
    ),
    @tactics.disch_tac,
  ])
  let t775 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")),
  )
  let t774 = @simp.gen_rewrite_tac(
    fn(
      x773 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x773
    },
    @list.List([forall_int_cases()]),
  )
  let t772 = @simp.rewrite_tac(
    @list.List([@theorems.right_forall_imp_thm(), int_of_num_lt()]),
  )
  let t771 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t770 = @simp.rewrite_tac(
    @list.List([int_arith_v1(@term_syntax.parse_term("!(int_of_num(0) < -int_of_num((n : Num)))"))]),
  )
  let t794 = @tactics.then_tac(
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
                                    @simp.gen_rewrite_tac(
                                      fn(
                                        x769 : (@kernel.Term) -> @kernel.Thm raise,
                                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                        x769
                                      },
                                      @list.List([forall_int_cases()]),
                                    ),
                                    t770,
                                  ),
                                  t771,
                                ),
                                t772,
                              ),
                              @tactics.disch_tac,
                            ),
                            t774,
                          ),
                          t775,
                        ),
                        @tactics.conj_tac,
                      ),
                      t779,
                    ),
                    t780,
                  ),
                  t781,
                ),
                @class.cond_cases_tac,
              ),
              t788,
            ),
            t789,
          ),
          t790,
        ),
        t791,
      ),
      t792,
    ),
    t793,
  )
  int_div_lt_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, int_of_num(0) < a → (div(b, a) < c) == (b < a * c)"),
      t794,
    ),
  )
}

///|
let int_div_lt_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_LT_EQ")

///|
/// `INT_DIV_LT_EQ`
pub fn int_div_lt_eq() -> @kernel.Thm {
  int_div_lt_eq_c.get()
}

///|
/// INT_LE_DIV_EQ
fn step_418() -> Unit raise {
  let t795 = @simp.simp_tac(
    @list.List([@equal.gsym(int_not_lt()), int_div_lt_eq()]),
  )
  int_le_div_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, int_of_num(0) < a → (c <= div(b, a)) == (a * c <= b)"),
      t795,
    ),
  )
}

///|
let int_le_div_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_DIV_EQ")

///|
/// `INT_LE_DIV_EQ`
pub fn int_le_div_eq() -> @kernel.Thm {
  int_le_div_eq_c.get()
}

///|
/// INT_DIV_LE_EQ
fn step_419() -> Unit raise {
  let t796 = @simp.simp_tac(@list.List([int_le_discrete(), int_div_lt_eq()]))
  int_div_le_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, int_of_num(0) < a → (div(b, a) <= c) == (b < a * (c + int_of_num(1)))"),
      t796,
    ),
  )
}

///|
let int_div_le_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_LE_EQ")

///|
/// `INT_DIV_LE_EQ`
pub fn int_div_le_eq() -> @kernel.Thm {
  int_div_le_eq_c.get()
}

///|
/// INT_LT_DIV_EQ
fn step_420() -> Unit raise {
  let t797 = @simp.simp_tac(
    @list.List([@equal.gsym(int_not_le()), int_div_le_eq()]),
  )
  int_lt_div_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, int_of_num(0) < a → (c < div(b, a)) == (a * (c + int_of_num(1)) <= b)"),
      t797,
    ),
  )
}

///|
let int_lt_div_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_DIV_EQ")

///|
/// `INT_LT_DIV_EQ`
pub fn int_lt_div_eq() -> @kernel.Thm {
  int_lt_div_eq_c.get()
}

///|
/// INT_DIV_LE
fn step_421() -> Unit raise {
  let t814 = @simp.asm_simp_tac(@list.List([int_of_num_le(), @arith.le_1()]))
  let t813 = @simp.rewrite_tac(@list.List([int_abs_pos()]))
  let t812 = @tactics.match_mp_tac(int_le_lmul())
  let t811 = @simp.asm_simp_tac(@list.List([int_of_num_lt(), @arith.le_1()]))
  let t810 = @tactics.match_mp_tac(
    int_arith_v1(
      @term_syntax.parse_term("int_of_num(0) < (n : Int) && abs((m : Int)) * int_of_num(1) <= abs(m) * n → n * -abs(m) <= m && m < n * (abs(m) + int_of_num(1))"),
    ),
  )
  let t809 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Int)"))
  let t808 = @simp.asm_simp_tac(
    @list.List([
      int_le_div_eq(),
      int_div_le_eq(),
      int_of_num_lt(),
      @arith.le_1(),
    ]),
  )
  let t807 = @simp.rewrite_tac(
    @list.List([
      int_arith_v1(
        @term_syntax.parse_term("(abs((x : Int)) <= (a : Int)) == (-a <= x && x <= a)"),
      ),
    ]),
  )
  let t806 = @simp.asm_rewrite_tac(
    @list.List([int_div_0(), int_abs_num(), int_abs_pos()]),
  )
  let t805 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t804 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t803 = @simp.gen_rewrite_tac(
    fn(
      x802 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x802
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t801 = @simp.rewrite_tac(@list.List([int_div_rneg(), int_abs_neg()]))
  let t815 = @tactics.then_tac(
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
                            @simp.gen_rewrite_tac(
                              fn(
                                x798 : (@kernel.Term) -> @kernel.Thm raise,
                              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                let s799 = @equal.binder_conv(x798)
                                fn(x800 : @kernel.Term) -> @kernel.Thm raise {
                                  s799(x800)
                                }
                              },
                              @list.List([forall_int_cases()]),
                            ),
                            t801,
                          ),
                          t803,
                        ),
                        t804,
                      ),
                      t805,
                    ),
                    t806,
                  ),
                  t807,
                ),
                t808,
              ),
              t809,
            ),
            t810,
          ),
          t811,
        ),
        t812,
      ),
      t813,
    ),
    t814,
  )
  int_div_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, abs(div(m, n)) <= abs(m)"), t815),
  )
}

///|
let int_div_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_LE")

///|
/// `INT_DIV_LE`
pub fn int_div_le() -> @kernel.Thm {
  int_div_le_c.get()
}

///|
let int_div_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_DIV")

///|
/// `INT_DIV_DIV`
pub fn int_div_div() -> @kernel.Thm {
  int_div_div_c.get()
}

///|
let int_rem_mul_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_MUL_REM",
)

///|
/// `INT_REM_MUL_REM`
pub fn int_rem_mul_rem() -> @kernel.Thm {
  int_rem_mul_rem_c.get()
}

///|
/// INT_DIV_DIV, INT_REM_MUL_REM
fn step_422() -> Unit raise {
  let t835 = @tactics.match_mp_tac(int_le_rmul())
  let t836 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          int_arith_v1(@term_syntax.parse_term("(n : Int) * ((p : Int) - int_of_num(1)) + n == n * p")),
          int_abs_mul(),
        ]),
      ),
      t835,
    ),
    int_arith_tac_v1,
  )
  let t834 = @simp.asm_simp_tac(@list.List([int_division()]))
  let t833 = @simp.asm_simp_tac(
    @list.List([
      int_le_lmul_eq(),
      int_le_sub_ladd(),
      @equal.gsym(int_lt_discrete()),
    ]),
  )
  let t832 = @simp.asm_simp_tac(@list.List([int_lt_rem()]))
  let t837 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(int_let_add2()), t832),
        t833,
      ),
      t834,
    ),
    t836,
  ])
  let t831 = @term_syntax.parse_term("(n : Int) * (abs((p : Int)) - int_of_num(1)) + n")
  let t838 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.trans_tac(int_lte_trans())(t831),
      @tactics.conj_tac,
    ),
    t837,
  )
  let t839 = @simp.asm_simp_tac(
    @list.List([int_le_add(), int_le_mul(), int_lt_imp_le(), int_division()]),
  )
  let t840 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([int_rem_div()])),
      int_arith_tac_v1,
    ),
    t839,
    t838,
  ])
  let t830 = @tactics.repeat_tac(@tactics.conj_tac)
  let t829 = @tactics.match_mp_tac(int_divmod_uniq())
  let t828 = @simp.gen_rewrite_tac(
    fn(
      x825 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s826 = @equal.land_conv(x825)
      fn(x827 : @kernel.Term) -> @kernel.Thm raise { s826(x827) }
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t824 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([int_rem_div()])),
      int_arith_tac_v1,
    ),
    @tactics.all_tac,
  ])
  let t823 = @simp.asm_rewrite_tac(
    @list.List([int_mul_rzero(), int_div_0(), int_rem_0()]),
  )
  let t822 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Int) == int_of_num(0)"))
  let t821 = @simp.asm_rewrite_tac(@list.List([]))
  let t820 = @class.asm_cases_tac(@term_syntax.parse_term("int_of_num(0) < (n : Int)"))
  let t819 = @simp.asm_rewrite_tac(
    @list.List([
      int_mul_lzero(),
      int_div_0(),
      int_rem_0(),
      int_div_zero(),
      int_add_lid(),
      int_le_lt(),
    ]),
  )
  let t818 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t817 = @tactics.repeat_tac(@tactics.gen_tac)
  let t841 = @tactics.thenl(
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
                            @list.List([@theorems.and_forall_thm()]),
                          ),
                          t817,
                        ),
                        t818,
                      ),
                      t819,
                    ),
                    t820,
                  ),
                  t821,
                ),
                t822,
              ),
              t823,
            ),
            t824,
          ),
          t828,
        ),
        t829,
      ),
      t830,
    ),
    t840,
  )
  let t842 = (
    @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, ∀ p : Int, int_of_num(0) <= n → div(div(m, n), p) == div(m, n * p)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, int_of_num(0) <= n → rem(m, n * p) == n * rem(div(m, n), p) + rem(m, n))"),
    t841,
  )
  let (int_div_div, int_rem_mul_rem) = @bool.conj_pair(
    (fn(
      x816 : (
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
      @tactics.prove(x816.0, x816.1)
    })(t842),
  )
  int_div_div_c.set(int_div_div)
  int_rem_mul_rem_c.set(int_rem_mul_rem)
}

///|
/// INT_DIV_EQ_0
fn step_423() -> Unit raise {
  let t851 = @simp.asm_simp_tac(
    @list.List([
      @equal.gsym(int_le_antisym()),
      int_div_le_eq(),
      int_le_div_eq(),
      @theorems.conj_sym(),
      int_of_num_lt(),
      @arith.le_1(),
      int_add_lid(),
      int_mul_rzero(),
      int_mul_rid(),
    ]),
  )
  let t850 = @simp.asm_rewrite_tac(
    @list.List([int_div_0(), int_of_num_eq(), int_abs_num()]),
  )
  let t849 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t847 = @term_syntax.parse_term("(n : Num)")
  let t848 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Int)"), t847]),
  )
  let t846 = @simp.rewrite_tac(
    @list.List([int_div_rneg(), int_neg_eq_0(), int_abs_neg()]),
  )
  let t852 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x843 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s844 = @equal.binder_conv(x843)
                fn(x845 : @kernel.Term) -> @kernel.Thm raise { s844(x845) }
              },
              @list.List([forall_int_cases()]),
            ),
            t846,
          ),
          t848,
        ),
        t849,
      ),
      t850,
    ),
    t851,
  )
  int_div_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, (div(m, n) == int_of_num(0)) == (n == int_of_num(0) || int_of_num(0) <= m && m < abs(n))"),
      t852,
    ),
  )
}

///|
let int_div_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_EQ_0")

///|
/// `INT_DIV_EQ_0`
pub fn int_div_eq_0() -> @kernel.Thm {
  int_div_eq_0_c.get()
}

///|
/// INT_REM_EQ_SELF
fn step_424() -> Unit raise {
  let t853 = @simp.rewrite_tac(@list.List([int_div_eq_0(), int_entire()]))
  let t854 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          int_rem_div(),
          int_arith_v1(@term_syntax.parse_term("((m : Int) - (x : Int) == m) == (x == int_of_num(0))")),
        ]),
      ),
      t853,
    ),
    int_arith_tac_v1,
  )
  int_rem_eq_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, (rem(m, n) == m) == (n == int_of_num(0) || int_of_num(0) <= m && m < abs(n))"),
      t854,
    ),
  )
}

///|
let int_rem_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_EQ_SELF",
)

///|
/// `INT_REM_EQ_SELF`
pub fn int_rem_eq_self() -> @kernel.Thm {
  int_rem_eq_self_c.get()
}

///|
/// INT_REM_UNIQUE
fn step_425() -> Unit raise {
  let t863 = @simp.asm_simp_tac(
    @list.List([@equal.gsym(int_rem_eq()), int_rem_eq_self()]),
  )
  let t862 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_rem_eq()), int_rem_rem()]),
  )
  let t861 = @simp.asm_simp_tac(@list.List([int_division()]))
  let t864 = @tactics.thenl(
    @tactics.eq_tac,
    @list.List([
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
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
              let s858 = @tactics.subst1_tac(x857)
              fn(
                x859 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s858(x859)
              }
            })(@equal.sym(x860))
          }),
          t861,
        ),
        t862,
      ),
      t863,
    ]),
  )
  let t856 = @tactics.conv_tac(integer_rule_v1)
  let t865 = @list.List([
    @tactics.then_tac(
      @simp.asm_rewrite_tac(
        @list.List([int_rem_0(), int_abs_0(), int_let_antisym()]),
      ),
      t856,
    ),
    t864,
  ])
  let t855 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t866 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t855),
    t865,
  )
  int_rem_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, (rem(m, n) == p) == ((n == int_of_num(0) && m == p || int_of_num(0) <= p && p < abs(n)) && op_eq_eq(m, p, mod(n)))"),
      t866,
    ),
  )
}

///|
let int_rem_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_UNIQUE")

///|
/// `INT_REM_UNIQUE`
pub fn int_rem_unique() -> @kernel.Thm {
  int_rem_unique_c.get()
}

///|
/// INT_DIV_REM
fn step_426() -> Unit raise {
  let t874 = @simp.rewrite_tac(@list.List([int_add_ac(), int_mul_ac()]))
  let t873 = @simp.asm_simp_tac(@list.List([int_division()]))
  let t872 = @tactics.exists_tac(@term_syntax.parse_term("rem((m : Int), (n : Int))"))
  let t871 = @tactics.match_mp_tac(int_div_uniq())
  let t870 = @tactics.conv_tac(@equal.sym_conv)
  let t869 = @simp.asm_simp_tac(
    @list.List([int_rem_mul_rem(), int_lt_imp_le()]),
  )
  let t868 = @simp.asm_rewrite_tac(
    @list.List([int_le_lt(), int_div_0(), int_rem_zero()]),
  )
  let t867 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t875 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t867),
                  t868,
                ),
                @tactics.disch_tac,
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
    t874,
  )
  int_div_rem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, int_of_num(0) <= n → rem(div(m, n), p) == div(rem(m, n * p), n)"),
      t875,
    ),
  )
}

///|
let int_div_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_REM")

///|
/// `INT_DIV_REM`
pub fn int_div_rem() -> @kernel.Thm {
  int_div_rem_c.get()
}

///|
/// INT_REM_REM_LE
fn step_427() -> Unit raise {
  let t881 = @meson.asm_meson_tac(@list.List([int_division()]))
  let t879 = @term_syntax.parse_term("abs((n : Int))")
  let t880 = @tactics.trans_tac(int_lte_trans())(t879)
  let t878 = @simp.asm_rewrite_tac(@list.List([int_rem_pos_eq()]))
  let t877 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Int) == int_of_num(0)"))
  let t876 = @simp.rewrite_tac(@list.List([int_rem_eq_self()]))
  let t882 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t876),
          t877,
        ),
        t878,
      ),
      t880,
    ),
    t881,
  )
  int_rem_rem_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, !(n == int_of_num(0)) && abs(n) <= abs(p) → rem(rem(m, n), p) == rem(m, n)"),
      t882,
    ),
  )
}

///|
let int_rem_rem_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_REM_LE")

///|
/// `INT_REM_REM_LE`
pub fn int_rem_rem_le() -> @kernel.Thm {
  int_rem_rem_le_c.get()
}

///|
/// INT_LE_DIV
fn step_428() -> Unit raise {
  let t883 = @simp.rewrite_tac(@list.List([int_of_num_div(), int_pos()]))
  let t884 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @equal.gsym(int_forall_pos()),
        @theorems.imp_conj(),
        @theorems.right_forall_imp_thm(),
      ]),
    ),
    t883,
  )
  int_le_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_of_num(0) <= m && int_of_num(0) <= n → int_of_num(0) <= div(m, n)"),
      t884,
    ),
  )
}

///|
let int_le_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LE_DIV")

///|
/// `INT_LE_DIV`
pub fn int_le_div() -> @kernel.Thm {
  int_le_div_c.get()
}

///|
/// INT_LT_DIV
fn step_429() -> Unit raise {
  let t886 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_div_eq_0()])),
    asm_int_arith_tac_v1,
  )
  let t887 = @list.List([
    @tactics.then_tac(@tactics.match_mp_tac(int_le_div()), asm_int_arith_tac_v1),
    t886,
  ])
  let t885 = @simp.rewrite_tac(
    @list.List([
      int_arith_v1(@term_syntax.parse_term("(int_of_num(0) < (x : Int)) == (int_of_num(0) <= x && !(x == int_of_num(0)))")),
    ]),
  )
  let t888 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t885),
      @tactics.conj_tac,
    ),
    t887,
  )
  int_lt_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_of_num(0) < n && n <= m → int_of_num(0) < div(m, n)"),
      t888,
    ),
  )
}

///|
let int_lt_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LT_DIV")

///|
/// `INT_LT_DIV`
pub fn int_lt_div() -> @kernel.Thm {
  int_lt_div_c.get()
}

///|
/// INT_REM_LE_EQ
fn step_430() -> Unit raise {
  let t899 = @simp.rewrite_tac(
    @list.List([int_of_num_clauses(), int_of_num_rem(), @arith.mod_le()]),
  )
  let t897 = @equal.gsym(int_forall_abs())
  let t898 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_forall_pos()), t897]),
  )
  let t895 = @term_syntax.parse_term("(n : Int)")
  let t896 = @tactics.map_every(
    fn(
      x893 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let t = x893
      @tactics.spec_tac(t, t)
    },
    @list.List([@term_syntax.parse_term("(m : Int)"), t895]),
  )
  let t892 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_rem_rabs())]))
  let t891 = @list.List([
    @meson.asm_meson_tac(@list.List([int_rem_pos(), int_le_trans()])),
    @tactics.all_tac,
  ])
  let t890 = @simp.asm_simp_tac(@list.List([int_rem_0(), int_le_refl()]))
  let t889 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t900 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t889),
                t890,
              ),
              @tactics.eq_tac,
            ),
            t891,
          ),
          t892,
        ),
        t896,
      ),
      t898,
    ),
    t899,
  )
  int_rem_le_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, (rem(m, n) <= m) == (n == int_of_num(0) || int_of_num(0) <= m)"),
      t900,
    ),
  )
}

///|
let int_rem_le_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_LE_EQ")

///|
/// `INT_REM_LE_EQ`
pub fn int_rem_le_eq() -> @kernel.Thm {
  int_rem_le_eq_c.get()
}

///|
/// INT_REM_LE
fn step_431() -> Unit raise {
  let t901 = @meson.meson_tac(@list.List([int_rem_le_eq(), int_le_trans()]))
  int_rem_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ p : Int, (n == int_of_num(0) || int_of_num(0) <= m) && m <= p → rem(m, n) <= p"),
      t901,
    ),
  )
}

///|
let int_rem_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_LE")

///|
/// `INT_REM_LE`
pub fn int_rem_le() -> @kernel.Thm {
  int_rem_le_c.get()
}

///|
/// INT_REM_MUL_ADD
fn step_432() -> Unit raise {
  let t902 = @simp.rewrite_tac(
    @list.List([int_rem_mul(), int_add_lid(), int_add_rid(), int_rem_rem()]),
  )
  let t903 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([@equal.gsym(int_add_rem())])),
    t902,
  )
  int_rem_mul_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, ∀ p : Int, rem(m * n + p, n) == rem(p, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, rem(n * m + p, n) == rem(p, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, rem(p + m * n, n) == rem(p, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, rem(p + n * m, n) == rem(p, n))"),
      t903,
    ),
  )
}

///|
let int_rem_mul_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_MUL_ADD",
)

///|
/// `INT_REM_MUL_ADD`
pub fn int_rem_mul_add() -> @kernel.Thm {
  int_rem_mul_add_c.get()
}

///|
/// INT_DIV_MUL_ADD
fn step_433() -> Unit raise {
  let t908 = @simp.asm_rewrite_tac(@list.List([]))
  let t906 = @term_syntax.parse_term("(n : Int)")
  let t907 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(p : Int)"), t906]), int_division()),
  )
  let t905 = @tactics.exists_tac(@term_syntax.parse_term("rem((p : Int), (n : Int))"))
  let t904 = @tactics.match_mp_tac(int_div_uniq())
  let t909 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t904),
          t905,
        ),
        t907,
      ),
      t908,
    ),
    asm_int_arith_tac_v1,
  )
  int_div_mul_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Int, ∀ n : Int, ∀ p : Int, !(n == int_of_num(0)) → div(m * n + p, n) == m + div(p, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, !(n == int_of_num(0)) → div(n * m + p, n) == m + div(p, n)) && (∀ m : Int, ∀ n : Int, ∀ p : Int, !(n == int_of_num(0)) → div(p + m * n, n) == div(p, n) + m) && (∀ m : Int, ∀ n : Int, ∀ p : Int, !(n == int_of_num(0)) → div(p + n * m, n) == div(p, n) + m)"),
      t909,
    ),
  )
}

///|
let int_div_mul_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIV_MUL_ADD",
)

///|
/// `INT_DIV_MUL_ADD`
pub fn int_div_mul_add() -> @kernel.Thm {
  int_div_mul_add_c.get()
}

///|
/// INT_CONG_DIV2
fn step_434() -> Unit raise {
  let t916 = @simp.simp_tac(
    @list.List([@equal.gsym(int_rem_eq()), int_div_rem(), int_pos()]),
  )
  let t914 = integer_rule_v1(
    @term_syntax.parse_term("op_eq_eq((a : Int), (b : Int), mod(-(n : Int))) == op_eq_eq(a, b, mod(n))"),
  )
  let t915 = @simp.rewrite_tac(
    @list.List([
      int_div_rneg(),
      int_mul_lneg(),
      integer_rule_v1(
        @term_syntax.parse_term("op_eq_eq(-(a : Int), -(b : Int), mod((n : Int))) == op_eq_eq(a, b, mod(n))"),
      ),
      t914,
    ]),
  )
  let t917 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        (x913 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            2,
            fn(
              x910 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s911 = @equal.binder_conv(x910)
              fn(x912 : @kernel.Term) -> @kernel.Thm raise { s911(x912) }
            },
            x913,
          )
        },
        @list.List([forall_int_cases()]),
      ),
      t915,
    ),
    t916,
  )
  int_cong_div2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, ∀ n : Int, op_eq_eq(a, b, mod(m * n)) → op_eq_eq(div(a, m), div(b, m), mod(n))"),
      t917,
    ),
  )
}

///|
let int_cong_div2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_CONG_DIV2")

///|
/// `INT_CONG_DIV2`
pub fn int_cong_div2() -> @kernel.Thm {
  int_cong_div2_c.get()
}

///|
/// INT_REM_2_CASES
fn step_435() -> Unit raise {
  let t918 = @term_syntax.parse_term("int_of_num(2)")
  let t919 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.mp_tac(
        @bool.specl(
          @list.List([@term_syntax.parse_term("(n : Int)"), t918]),
          int_division(),
        ),
      ),
    ),
    int_arith_tac_v1,
  )
  int_rem_2_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, rem(n, int_of_num(2)) == int_of_num(0) || rem(n, int_of_num(2)) == int_of_num(1)"),
      t919,
    ),
  )
}

///|
let int_rem_2_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_2_CASES",
)

///|
/// `INT_REM_2_CASES`
pub fn int_rem_2_cases() -> @kernel.Thm {
  int_rem_2_cases_c.get()
}

///|
/// NOT_INT_REM_2
fn step_436() -> Unit raise {
  let t921 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t920 = @tactics.mp_tac(int_rem_2_cases())
  let t922 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])),
        t920,
      ),
      t921,
    ),
    int_arith_tac_v1,
  )
  not_int_rem_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, !(rem(n, int_of_num(2)) == int_of_num(0)) == (rem(n, int_of_num(2)) == int_of_num(1))) && (∀ n : Int, !(rem(n, int_of_num(2)) == int_of_num(1)) == (rem(n, int_of_num(2)) == int_of_num(0)))"),
      t922,
    ),
  )
}

///|
let not_int_rem_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_INT_REM_2")

///|
/// `NOT_INT_REM_2`
pub fn not_int_rem_2() -> @kernel.Thm {
  not_int_rem_2_c.get()
}

///|
/// INT_REM_2_DIVIDES
fn step_437() -> Unit raise {
  let t923 = @simp.rewrite_tac(@list.List([int_rem_eq_0()]))
  let t924 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@bool.conjunct1(not_int_rem_2()))]),
    ),
    t923,
  )
  int_rem_2_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ n : Int, (rem(n, int_of_num(2)) == int_of_num(0)) == divides(int_of_num(2), n)) && (∀ n : Int, (rem(n, int_of_num(2)) == int_of_num(1)) == !divides(int_of_num(2), n))"),
      t924,
    ),
  )
}

///|
let int_rem_2_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_2_DIVIDES",
)

///|
/// `INT_REM_2_DIVIDES`
pub fn int_rem_2_divides() -> @kernel.Thm {
  int_rem_2_divides_c.get()
}

///|
/// INT_REM_2_EXPAND
fn step_438() -> Unit raise {
  let t925 = @meson.meson_tac(@list.List([int_rem_2_divides()]))
  int_rem_2_expand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, rem(x, int_of_num(2)) == (if divides(int_of_num(2), x) { int_of_num(0) } else { int_of_num(1) })"),
      t925,
    ),
  )
}

///|
let int_rem_2_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_2_EXPAND",
)

///|
/// `INT_REM_2_EXPAND`
pub fn int_rem_2_expand() -> @kernel.Thm {
  int_rem_2_expand_c.get()
}

///|
/// INT_REM_2_NEG
fn step_439() -> Unit raise {
  let t926 = @simp.rewrite_tac(
    @list.List([
      integer_rule_v1(@term_syntax.parse_term("divides((a : Int), -(x : Int)) == divides(a, x)")),
    ]),
  )
  let t927 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(@list.List([int_rem_2_expand()])),
    ),
    t926,
  )
  int_rem_2_neg_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Int, rem(-x, int_of_num(2)) == rem(x, int_of_num(2))"), t927),
  )
}

///|
let int_rem_2_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REM_2_NEG")

///|
/// `INT_REM_2_NEG`
pub fn int_rem_2_neg() -> @kernel.Thm {
  int_rem_2_neg_c.get()
}

///|
/// INT_DIVIDES_DIV_SELF
fn step_440() -> Unit raise {
  let t928 = @meson.meson_tac(@list.List([int_mul_div_eq(), int_divides()]))
  int_divides_div_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ d : Int, divides(d, n) → divides(div(n, d), n)"),
      t928,
    ),
  )
}

///|
let int_divides_div_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_DIV_SELF",
)

///|
/// `INT_DIVIDES_DIV_SELF`
pub fn int_divides_div_self() -> @kernel.Thm {
  int_divides_div_self_c.get()
}

///|
/// INT_DIV_BY_DIV
fn step_441() -> Unit raise {
  let t929 = @meson.meson_tac(
    @list.List([
      int_divides_div_self(),
      int_mul_div_eq(),
      int_ring(
        @term_syntax.parse_term("(a : Int) * (x : Int) == (n : Int) && a * (y : Int) == n && !(n == int_of_num(0)) → x == y"),
      ),
    ]),
  )
  int_div_by_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, !(n == int_of_num(0)) && divides(m, n) → div(n, div(n, m)) == m"),
      t929,
    ),
  )
}

///|
let int_div_by_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_DIV_BY_DIV")

///|
/// `INT_DIV_BY_DIV`
pub fn int_div_by_div() -> @kernel.Thm {
  int_div_by_div_c.get()
}

///|
/// INT_DIVIDES_DIV_DIVIDES
fn step_442() -> Unit raise {
  let t939 = @simp.asm_rewrite_tac(@list.List([]))
  let t938 = @class.asm_cases_tac(@term_syntax.parse_term("(e : Int) == int_of_num(0)"))
  let t937 = @simp.gen_rewrite_tac(
    fn(
      x936 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x930 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s931 = @equal.land_conv(x930)
        fn(x932 : @kernel.Term) -> @kernel.Thm raise { s931(x932) }
      })(
        (fn(
          x933 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s934 = @equal.land_conv(x933)
          fn(x935 : @kernel.Term) -> @kernel.Thm raise { s934(x935) }
        })(x936),
      )
    },
    @list.List([@equal.gsym(@bool.conjunct1(int_mul_div_eq()))]),
  )
  let t940 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t937),
        t938,
      ),
      t939,
    ),
    integer_tac_v1,
  )
  int_divides_div_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ d : Int, ∀ e : Int, divides(d, n) && (n == int_of_num(0) → e == int_of_num(0)) → divides(div(n, d), e) == divides(n, d * e)"),
      t940,
    ),
  )
}

///|
let int_divides_div_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_DIV_DIVIDES",
)

///|
/// `INT_DIVIDES_DIV_DIVIDES`
pub fn int_divides_div_divides() -> @kernel.Thm {
  int_divides_div_divides_c.get()
}

///|
/// INT_DIVIDES_DIVIDES_DIV
fn step_443() -> Unit raise {
  let t946 = @simp.asm_rewrite_tac(@list.List([int_div_zero(), int_div_0()]))
  let t945 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Int) == int_of_num(0)"))
  let t944 = @simp.gen_rewrite_tac(
    fn(
      x941 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s942 = @equal.land_conv(x941)
      fn(x943 : @kernel.Term) -> @kernel.Thm raise { s942(x943) }
    },
    @list.List([@equal.gsym(@bool.conjunct1(int_mul_div_eq()))]),
  )
  let t947 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t944),
        t945,
      ),
      t946,
    ),
    integer_tac_v1,
  )
  int_divides_divides_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ d : Int, ∀ e : Int, divides(d, n) → divides(e, div(n, d)) == divides(d * e, n)"),
      t947,
    ),
  )
}

///|
let int_divides_divides_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_DIVIDES_DIV",
)

///|
/// `INT_DIVIDES_DIVIDES_DIV`
pub fn int_divides_divides_div() -> @kernel.Thm {
  int_divides_divides_div_c.get()
}

///|
/// INT_DIVIDES_DIVIDES_DIV_EQ
fn step_444() -> Unit raise {
  let t949 = @simp.rewrite_tac(@list.List([int_divides_divides_div()]))
  let t948 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((r : Bool) → (p : Bool)) && (p → (q : Bool) == r) → (p && q) == r"),
    ),
  )
  let t950 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t948),
      t949,
    ),
    integer_tac_v1,
  )
  int_divides_divides_div_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ d : Int, ∀ e : Int, (divides(d, n) && divides(e, div(n, d))) == divides(d * e, n)"),
      t950,
    ),
  )
}

///|
let int_divides_divides_div_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_DIVIDES_DIV_EQ",
)

///|
/// `INT_DIVIDES_DIVIDES_DIV_EQ`
pub fn int_divides_divides_div_eq() -> @kernel.Thm {
  int_divides_divides_div_eq_c.get()
}

///|
let int_div_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_DIV_CONV",
)

///|
/// `INT_DIV_CONV`
pub fn int_div_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_div_conv_c.get()(x)
}

///|
let int_rem_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_REM_CONV",
)

///|
/// `INT_REM_CONV`
pub fn int_rem_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_rem_conv_c.get()(x)
}

///|
/// INT_DIV_CONV, INT_REM_CONV
fn step_445() -> Unit raise {
  let t951 = @meson.meson_tac(@list.List([int_divmod_uniq()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("(q : Int) * (n : Int) + (r : Int) == (m : Int) → int_of_num(0) <= r → r < abs(n) → div(m, n) == q && rem(m, n) == r"),
    t951,
  )
  let m = @term_syntax.parse_term("(m : Int)")
  let n = @term_syntax.parse_term("(n : Int)")
  let q = @term_syntax.parse_term("(q : Int)")
  let r = @term_syntax.parse_term("(r : Int)")
  let dtm = @term_syntax.parse_term("div")
  let mtm = @term_syntax.parse_term("rem")
  let emod_num : (@num.Num) -> ((@num.Num) -> @num.Num raise) raise = fn(
    x952 : @num.Num,
  ) -> ((@num.Num) -> @num.Num raise) raise {
    let x = x952
    fn(x953 : @num.Num) -> @num.Num raise {
      let y = x953
      let r_1 = @num.mod_num(x, y)
      if @num.lt_num(r_1, @num.num_of_int64(0L)) {
        @num.add_num(r_1, @num.abs_num(y))
      } else {
        r_1
      }
    }
  }
  let equo_num : (@num.Num) -> ((@num.Num) -> @num.Num raise) raise = fn(
    x954 : @num.Num,
  ) -> ((@num.Num) -> @num.Num raise) raise {
    let x_1 = x954
    fn(x955 : @num.Num) -> @num.Num raise {
      let y_1 = x955
      @num.quo_num(@num.sub_num(x_1, emod_num(x_1)(y_1)), y_1)
    }
  }
  let int_divmod_conv : (@num.Num) -> ((@num.Num) -> @kernel.Thm raise) raise = fn(
    x956 : @num.Num,
  ) -> ((@num.Num) -> @kernel.Thm raise) raise {
    let x_2 = x956
    fn(x957 : @num.Num) -> @kernel.Thm raise {
      let y_2 = x957
      let k = equo_num(x_2)(y_2)
      let l = emod_num(x_2)(y_2)
      let t958 = (mk_intconst(l), r)
      let t959 = (mk_intconst(k), q)
      let t960 = (mk_intconst(y_2), n)
      let th0 = @kernel.inst_rule(
        @list.List([(mk_intconst(x_2), m), t960, t959, t958]),
        pth,
      )
      let tm0 = @equal.lhand(@equal.lhand(@kernel.concl(th0)))
      let th1 = @equal.thenc(@equal.land_conv(int_mul_conv), int_add_conv)(tm0)
      let th2 = @bool.mp(th0, th1)
      let tm2 = @equal.lhand(@kernel.concl(th2))
      let th3 = @bool.mp(th2, @bool.eqt_elim(int_le_conv(tm2)))
      let tm3 = @equal.lhand(@kernel.concl(th3))
      @bool.mp(
        th3,
        @bool.eqt_elim(
          @equal.thenc(@equal.rand_conv(int_abs_conv), int_lt_conv)(tm3),
        ),
      )
    }
  }
  let (int_div_conv, int_rem_conv) = (
    fn(x961 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x961
      try {
        let (l_1, r_2) = @basics.dest_binop(dtm, tm)
        let t962 = dest_intconst(r_2)
        @bool.conjunct1(int_divmod_conv(dest_intconst(l_1))(t962))
      } catch {
        Failure(_) => raise Failure("INT_DIV_CONV")
        e => raise e
      }
    },
    fn(x963 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x963
      try {
        let (l_2, r_3) = @basics.dest_binop(mtm, tm_1)
        let t964 = dest_intconst(r_3)
        @bool.conjunct2(int_divmod_conv(dest_intconst(l_2))(t964))
      } catch {
        Failure(_) => raise Failure("INT_MOD_CONV")
        e => raise e
      }
    },
  )
  int_div_conv_c.set(int_div_conv)
  int_rem_conv_c.set(int_rem_conv)
}

///|
/// int_red_conv_list
fn step_446() -> Unit raise {
  let t966 = (@term_syntax.parse_term("min((x : Int), (y : Int))"), int_min_conv)
  let t967 = (@term_syntax.parse_term("max((x : Int), (y : Int))"), int_max_conv)
  let t968 = (@term_syntax.parse_term("pow((x : Int), (n : Num))"), int_pow_conv)
  let t969 = (@term_syntax.parse_term("rem((x : Int), (y : Int))"), int_rem_conv)
  let t970 = (@term_syntax.parse_term("div((x : Int), (y : Int))"), int_div_conv)
  let t971 = (@term_syntax.parse_term("(x : Int) * (y : Int)"), int_mul_conv)
  let t972 = (@term_syntax.parse_term("(x : Int) - (y : Int)"), int_sub_conv)
  let t973 = (@term_syntax.parse_term("(x : Int) + (y : Int)"), int_add_conv)
  let t974 = (@term_syntax.parse_term("abs((x : Int))"), int_abs_conv)
  let t975 = (@term_syntax.parse_term("int_sgn((x : Int))"), int_sgn_conv)
  let t965 = @equal.changed_conv(int_neg_conv)
  let t976 = (@term_syntax.parse_term("-(x : Int)"), t965)
  let t977 = (@term_syntax.parse_term("(x : Int) == (y : Int)"), int_eq_conv)
  let t978 = (@term_syntax.parse_term("(x : Int) > (y : Int)"), int_gt_conv)
  let t979 = (@term_syntax.parse_term("(x : Int) >= (y : Int)"), int_ge_conv)
  let t980 = (@term_syntax.parse_term("(x : Int) < (y : Int)"), int_lt_conv)
  int_red_conv_list_c.set(
    @list.List([
      (@term_syntax.parse_term("(x : Int) <= (y : Int)"), int_le_conv),
      t980,
      t979,
      t978,
      t977,
      t976,
      t975,
      t974,
      t973,
      t972,
      t971,
      t970,
      t969,
      t968,
      t967,
      t966,
    ]),
  )
}

///|
let int_red_conv_list_c : @lib.Cell[@list.List[(@kernel.Term, @equal.Conv)]] = @lib.Cell::new(
  "int_red_conv_list",
)

///|
/// `int_red_conv_list`
pub fn int_red_conv_list() -> @list.List[(@kernel.Term, @equal.Conv)] {
  int_red_conv_list_c.get()
}

///|
/// INT_RED_CONV
fn step_447() -> Unit raise {
  let gconv_net = @lib.itlist(
    fn(
      x985 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
      x986 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
    ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
      let s987 = ((x984 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => {
        @lib.uncurry(
          fn(
            x981 : @kernel.Term,
            x982 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[
            @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
          ] raise) raise {
            fn(
              x983 : @nets.Net[
                @simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise],
              ],
            ) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
              @simp.net_of_conv(x981, x982, x983)
            }
          },
          x984,
        )
      })(x985)
      s987(x986)
    },
    int_red_conv_list(),
    @simp.basic_net(),
  )
  int_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let int_red_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_RED_CONV",
)

///|
/// `INT_RED_CONV`
pub fn int_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_red_conv_c.get()(x)
}

///|
/// INT_REDUCE_CONV
fn step_448() -> Unit raise {
  int_reduce_conv_c.set(@equal.depth_conv(int_red_conv))
}

///|
let int_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "INT_REDUCE_CONV",
)

///|
/// `INT_REDUCE_CONV`
pub fn int_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_reduce_conv_c.get()(x)
}

///|
/// int_compute_add_convs
fn step_449() -> Unit raise {
  let convlist = @lib.map(
    fn(
      x988 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise),
    ) -> (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise) raise {
      let (pat, the_conv) = x988
      let (c, args) = @basics.strip_comb(pat)
      (c, Int::to_int64(@lib.length(args)), the_conv)
    },
    int_red_conv_list(),
  )
  int_compute_add_convs_c.set(fn(x989 : @compute.Compset) -> Unit raise {
    let _ as compset = x989
    @lib.itlist(
      fn(
        x990 : (@kernel.Term, Int64, (@kernel.Term) -> @kernel.Thm raise),
        x991 : Unit,
      ) -> Unit raise {
        let newc = x990
        let _ = x991
        @compute.add_conv(newc, compset)
      },
      convlist,
      (),
    )
  })
}

///|
let int_compute_add_convs_c : @lib.Cell[(@compute.Compset) -> Unit raise] = @lib.Cell::new(
  "int_compute_add_convs",
)

///|
/// `int_compute_add_convs`
pub fn int_compute_add_convs(x : @compute.Compset) -> Unit raise {
  int_compute_add_convs_c.get()(x)
}

///|
/// INT_COMPUTE_CONV
fn step_450() -> Unit raise {
  let cs = @compute.bool_compset(())
  let t992 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, A, A) -> A)"), t992)
  int_compute_add_convs(cs)
  int_compute_conv_c.set(@compute.weak_cbv_conv(cs))
}

///|
let int_compute_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_COMPUTE_CONV",
)

///|
/// `INT_COMPUTE_CONV`
pub fn int_compute_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_compute_conv_c.get()(x)
}

///|
/// INT_2_DIVIDES_ADD
fn step_451() -> Unit raise {
  let t998 = @tactics.conv_tac(int_reduce_conv)
  let t997 = @simp.asm_rewrite_tac(@list.List([]))
  let t996 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(n : Int)"), int_rem_2_cases()),
  )
  let t995 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(m : Int)"), int_rem_2_cases()),
  )
  let t994 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_add_rem())]))
  let t993 = @simp.rewrite_tac(@list.List([@equal.gsym(int_rem_2_divides())]))
  let t999 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t993),
            t994,
          ),
          t995,
        ),
        t996,
      ),
      t997,
    ),
    t998,
  )
  int_2_divides_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(int_of_num(2), m + n) == (divides(int_of_num(2), m) == divides(int_of_num(2), n))"),
      t999,
    ),
  )
}

///|
let int_2_divides_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_2_DIVIDES_ADD",
)

///|
/// `INT_2_DIVIDES_ADD`
pub fn int_2_divides_add() -> @kernel.Thm {
  int_2_divides_add_c.get()
}

///|
/// INT_2_DIVIDES_SUB
fn step_452() -> Unit raise {
  let t1005 = @tactics.conv_tac(int_reduce_conv)
  let t1004 = @simp.asm_rewrite_tac(@list.List([]))
  let t1003 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(n : Int)"), int_rem_2_cases()),
  )
  let t1002 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(m : Int)"), int_rem_2_cases()),
  )
  let t1001 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_sub_rem())]))
  let t1000 = @simp.rewrite_tac(@list.List([@equal.gsym(int_rem_2_divides())]))
  let t1006 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1000),
            t1001,
          ),
          t1002,
        ),
        t1003,
      ),
      t1004,
    ),
    t1005,
  )
  int_2_divides_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(int_of_num(2), m - n) == (divides(int_of_num(2), m) == divides(int_of_num(2), n))"),
      t1006,
    ),
  )
}

///|
let int_2_divides_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_2_DIVIDES_SUB",
)

///|
/// `INT_2_DIVIDES_SUB`
pub fn int_2_divides_sub() -> @kernel.Thm {
  int_2_divides_sub_c.get()
}

///|
/// INT_2_DIVIDES_MUL
fn step_453() -> Unit raise {
  let t1012 = @tactics.conv_tac(int_reduce_conv)
  let t1011 = @simp.asm_rewrite_tac(@list.List([]))
  let t1010 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(n : Int)"), int_rem_2_cases()),
  )
  let t1009 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(m : Int)"), int_rem_2_cases()),
  )
  let t1008 = @simp.once_rewrite_tac(@list.List([@equal.gsym(int_mul_rem())]))
  let t1007 = @simp.rewrite_tac(@list.List([@equal.gsym(int_rem_2_divides())]))
  let t1013 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1007),
            t1008,
          ),
          t1009,
        ),
        t1010,
      ),
      t1011,
    ),
    t1012,
  )
  int_2_divides_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(int_of_num(2), m * n) == (divides(int_of_num(2), m) || divides(int_of_num(2), n))"),
      t1013,
    ),
  )
}

///|
let int_2_divides_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_2_DIVIDES_MUL",
)

///|
/// `INT_2_DIVIDES_MUL`
pub fn int_2_divides_mul() -> @kernel.Thm {
  int_2_divides_mul_c.get()
}

///|
/// INT_2_DIVIDES_POW
fn step_454() -> Unit raise {
  let t1016 = @tactics.conv_tac(@class.taut)
  let t1017 = @tactics.then_tac(
    @simp.asm_rewrite_tac(@list.List([int_2_divides_mul(), @nums.not_suc()])),
    t1016,
  )
  let t1015 = @tactics.conv_tac(int_reduce_conv)
  let t1018 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([@equal.gsym(@bool.conjunct2(int_rem_2_divides()))]),
      ),
      t1015,
    ),
    t1017,
  ])
  let t1014 = @simp.rewrite_tac(@list.List([int_pow_v1()]))
  let t1019 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      t1014,
    ),
    t1018,
  )
  int_2_divides_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, ∀ k : Num, divides(int_of_num(2), pow(n, k)) == (divides(int_of_num(2), n) && !(k == 0))"),
      t1019,
    ),
  )
}

///|
let int_2_divides_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_2_DIVIDES_POW",
)

///|
/// `INT_2_DIVIDES_POW`
pub fn int_2_divides_pow() -> @kernel.Thm {
  int_2_divides_pow_c.get()
}

///|
/// INT_REM_DOWN_CONV
fn step_455() -> Unit raise {
  let t1021 = @equal.gsym(int_pow_rem())
  let t1022 = @equal.gsym(int_mul_rem())
  let t1023 = @equal.gsym(int_sub_rem())
  let t1024 = @equal.gsym(int_add_rem())
  let addmul_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1020 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1020
    },
    @list.List([@equal.gsym(int_neg_rem()), t1024, t1023, t1022, t1021]),
  )
  let mod_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1025 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1025
    },
    @list.List([int_rem_rem()]),
  )
  let upconv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1026 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1027 = @equal.depth_conv(x1026)
      fn(x1028 : @kernel.Term) -> @kernel.Thm raise { s1027(x1028) }
    },
    @list.List([
      int_neg_rem(),
      int_add_rem(),
      int_sub_rem(),
      int_mul_rem(),
      int_pow_rem(),
      int_rem_rem(),
    ]),
  )
  fn downconv(x1029 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1029
    let t1031 = @equal.sub_conv(downconv)
    let t1030 = @equal.thenc(mod_conv, downconv)
    @equal.orelsec(
      @equal.orelsec(
        @equal.thenc(addmul_conv, @equal.land_conv(downconv)),
        t1030,
      ),
      t1031,
    )(tm)
  }
  int_rem_down_conv_c.set(@equal.thenc(downconv, upconv))
}

///|
let int_rem_down_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "INT_REM_DOWN_CONV",
)

///|
/// `INT_REM_DOWN_CONV`
pub fn int_rem_down_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_rem_down_conv_c.get()(x)
}

///|
/// INT_POW_REM_CONV
fn step_456() -> Unit raise {
  let t1035 = @tactics.conv_tac(int_rem_down_conv)
  let t1033 = @equal.gsym(int_of_num_rem())
  let t1034 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(int_of_num_clauses()), t1033]),
  )
  let t1036 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(@list.List([int_rem_rneg(), int_pow_neg()])),
          @class.cond_cases_tac,
        ),
        t1034,
      ),
      t1035,
    ),
    @tactics.refl_tac,
  )
  let t1037 = (
    @term_syntax.parse_term("(rem(pow(int_of_num((m : Num)), (k : Num)), int_of_num((n : Num))) == int_of_num(MOD(EXP(m, k), n)) && rem(pow(int_of_num(m), k), -int_of_num(n)) == int_of_num(MOD(EXP(m, k), n))) && rem(pow(-int_of_num(m), k), int_of_num(n)) == (if EVEN(k) { int_of_num(MOD(EXP(m, k), n)) } else { rem(-int_of_num(MOD(EXP(m, k), n)), int_of_num(n)) }) && rem(pow(-int_of_num(m), k), -int_of_num(n)) == (if EVEN(k) { int_of_num(MOD(EXP(m, k), n)) } else { rem(-int_of_num(MOD(EXP(m, k), n)), int_of_num(n)) })"),
    t1036,
  )
  let (pth_0, pth_1) = @bool.conj_pair(
    (fn(
      x1032 : (
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
      @tactics.prove(x1032.0, x1032.1)
    })(t1037),
  )
  let t1044 = @equal.try_conv(int_neg_conv)
  let t1045 = @equal.thenc(
    @equal.land_conv(
      @equal.rand_conv(
        @equal.thenc(@equal.rand_conv(@calc_num.exp_mod_conv), t1044),
      ),
    ),
    int_rem_conv,
  )
  let t1046 = @equal.orelsec(@equal.rand_conv(@calc_num.exp_mod_conv), t1045)
  let t1043 = @simp.gen_rewrite_conv(
    fn(
      x1042 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1042
    },
    @list.List([@class.cond_clauses()]),
  )
  let t1041 = @equal.rator_conv(@equal.land_conv(@calc_num.num_even_conv))
  let t1047 = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @simp.gen_rewrite_conv(
          fn(
            x1040 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            x1040
          },
          @list.List([pth_1]),
        ),
        t1041,
      ),
      t1043,
    ),
    t1046,
  )
  let t1039 = @equal.rand_conv(@calc_num.exp_mod_conv)
  let conv : (@kernel.Term) -> @kernel.Thm raise = @equal.orelsec(
    @equal.thenc(
      @simp.gen_rewrite_conv(
        fn(
          x1038 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x1038
        },
        @list.List([pth_0]),
      ),
      t1039,
    ),
    t1047,
  )
  int_pow_rem_conv_c.set(fn(x1048 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1048
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(
          @kernel.Term::Const("rem", _),
          @kernel.Term::Comb(
            @kernel.Term::Comb(@kernel.Term::Const("int_pow", _), m),
            k
          )
        ),
        n
      ) if is_intconst(m) && @nums.is_numeral(k) && is_intconst(n) => conv(tm)
      _ => raise Failure("INT_POW_REM_CONV")
    }
  })
}

///|
let int_pow_rem_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_POW_REM_CONV",
)

///|
/// `INT_POW_REM_CONV`
pub fn int_pow_rem_conv(x : @kernel.Term) -> @kernel.Thm raise {
  int_pow_rem_conv_c.get()(x)
}

///|
/// WF_INT_MEASURE
fn step_457() -> Unit raise {
  let t1055 = @meson.asm_meson_tac(@list.List([]))
  let t1054 = @simp.rewrite_tac(
    @list.List([@equal.gsym(int_of_num_lt()), int_forall_pos()]),
  )
  let t1053 = @list.List([
    @tactics.match_mp_tac(@arith.num_wf()),
    @tactics.all_tac,
  ])
  let t1052 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∀ x : A, (m : (A) -> Int)(x) == int_of_num(n) → (P : (A) -> Bool)(x)"),
    fn(
      x1049 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1050 = @tactics.mp_tac(x1049)
      fn(
        x1051 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1050(x1051)
      }
    },
  )
  let t1056 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1052),
        t1053,
      ),
      t1054,
    ),
    t1055,
  )
  wf_int_measure_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ m : (A) -> Int, (∀ x : A, int_of_num(0) <= m(x)) && (∀ x : A, (∀ y : A, m(y) < m(x) → P(y)) → P(x)) → (∀ x : A, P(x))"),
      t1056,
    ),
  )
}

///|
let wf_int_measure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_INT_MEASURE")

///|
/// `WF_INT_MEASURE`
pub fn wf_int_measure() -> @kernel.Thm {
  wf_int_measure_c.get()
}

///|
/// WF_INT_MEASURE_2
fn step_458() -> Unit raise {
  let t1057 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_uncurry(),
      @equal.gsym(@pair.forall_pair_thm()),
      wf_int_measure(),
    ]),
  )
  wf_int_measure_2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ m : (A, B) -> Int, (∀ x : A, ∀ y : B, int_of_num(0) <= m(x, y)) && (∀ x : A, ∀ y : B, (∀ x' : A, ∀ y' : B, m(x', y') < m(x, y) → P(x', y')) → P(x, y)) → (∀ x : A, ∀ y : B, P(x, y))"),
      t1057,
    ),
  )
}

///|
let wf_int_measure_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_INT_MEASURE_2",
)

///|
/// `WF_INT_MEASURE_2`
pub fn wf_int_measure_2() -> @kernel.Thm {
  wf_int_measure_2_c.get()
}

///|
/// INT_GCD_EXISTS
fn step_459() -> Unit raise {
  let int_gcd_exists_cases = int_arith_v1(
    @term_syntax.parse_term("((a : Int) == int_of_num(0) || (b : Int) == int_of_num(0)) || abs(a - b) + abs(b) < abs(a) + abs(b) || abs(a + b) + abs(b) < abs(a) + abs(b) || abs(a) + abs(b - a) < abs(a) + abs(b) || abs(a) + abs(b + a) < abs(a) + abs(b)"),
  )
  let t1071 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1070 = @tactics.ante_res_then(fn(
    x1067 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1068 = @tactics.mp_tac(x1067)
    fn(
      x1069 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1068(x1069)
    }
  })
  let t1072 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(t1070)),
      t1071,
    ),
    integer_tac_v1,
  )
  let t1066 = @meson.meson_tac(
    @list.List([
      integer_rule_v1(@term_syntax.parse_term("divides((d : Int), d)")),
      int_mul_rid(),
    ]),
  )
  let t1065 = @simp.rewrite_tac(
    @list.List([int_mul_lzero(), int_add_lid(), int_add_rid()]),
  )
  let t1073 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.strip_tac,
          @simp.asm_rewrite_tac(
            @list.List([integer_rule_v1(@term_syntax.parse_term("divides((d : Int), int_of_num(0))"))]),
          ),
        ),
        t1065,
      ),
      t1066,
    ),
    t1072,
  ])
  let t1064 = @tactics.disj_cases_then(fn(
    x1061 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1062 = @tactics.mp_tac(x1061)
    fn(
      x1063 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1062(x1063)
    }
  })(int_gcd_exists_cases)
  let t1060 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1059 = @simp.rewrite_tac(@list.List([]))
  let t1058 = @tactics.exists_tac(@term_syntax.parse_term("(x : Int) => (y : Int) => abs(x) + abs(y)"))
  let t1074 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(wf_int_measure_2()), t1058),
            t1059,
          ),
          t1060,
        ),
        @list.List([int_arith_tac_v1, @tactics.all_tac]),
      ),
      t1064,
    ),
    t1073,
  )
  int_gcd_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ d : Int, divides(d, a) && divides(d, b) && (∃ x : Int, ∃ y : Int, d == a * x + b * y)"),
      t1074,
    ),
  )
}

///|
let int_gcd_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD_EXISTS")

///|
/// `INT_GCD_EXISTS`
pub fn int_gcd_exists() -> @kernel.Thm {
  int_gcd_exists_c.get()
}

///|
/// INT_GCD_EXISTS_POS
fn step_460() -> Unit raise {
  let t1079 = int_arith_v1(
    @term_syntax.parse_term("(a : Int) * -(x : Int) + (b : Int) * -(y : Int) == -(a * x + b * y)"),
  )
  let t1080 = @meson.asm_meson_tac(
    @list.List([
      integer_rule_v1(@term_syntax.parse_term("divides(-(d : Int), (x : Int)) == divides(d, x)")),
      t1079,
    ]),
  )
  let t1078 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(d : Int)"), int_le_negtotal()),
  )
  let t1075 = @term_syntax.parse_term("(b : Int)")
  let t1076 = @bool.specl(
    @list.List([@term_syntax.parse_term("(a : Int)"), t1075]),
    int_gcd_exists(),
  )
  let t1077 = @tactics.x_choose_tac(@term_syntax.parse_term("(d : Int)"), t1076)
  let t1081 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1077),
      t1078,
    ),
    t1080,
  )
  int_gcd_exists_pos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∃ d : Int, int_of_num(0) <= d && divides(d, a) && divides(d, b) && (∃ x : Int, ∃ y : Int, d == a * x + b * y)"),
      t1081,
    ),
  )
}

///|
let int_gcd_exists_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_GCD_EXISTS_POS",
)

///|
/// `INT_GCD_EXISTS_POS`
pub fn int_gcd_exists_pos() -> @kernel.Thm {
  int_gcd_exists_pos_c.get()
}

///|
/// int.ml:1973
fn step_461() -> Unit raise {
  @preterm.overload_interface("gcd", @term_syntax.parse_term("(int_gcd : ((Int, Int)) -> Int)"))
}

///|
/// int.ml:1974
fn step_462() -> Unit raise {
  @preterm.overload_interface("lcm", @term_syntax.parse_term("(int_lcm : ((Int, Int)) -> Int)"))
}

///|
/// int_gcd
fn step_463() -> Unit raise {
  let t1082 = @simp.rewrite_rule(
    @list.List([@pair.exists_uncurry(), @class.skolem_thm()]),
  )(int_gcd_exists_pos())
  int_gcd_c.set(@nums.new_specification(@list.List(["int_gcd"]))(t1082))
}

///|
let int_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_gcd")

///|
/// `int_gcd`
pub fn int_gcd() -> @kernel.Thm {
  int_gcd_c.get()
}

///|
/// int_lcm
fn step_464() -> Unit raise {
  int_lcm_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(int_lcm : ((Int, Int)) -> Int)(((m : Int), (n : Int))) == (if m * n == int_of_num(0) { int_of_num(0) } else { div(abs(m * n), gcd((m, n))) })"),
    ),
  )
}

///|
let int_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_lcm")

///|
/// `int_lcm`
pub fn int_lcm() -> @kernel.Thm {
  int_lcm_c.get()
}

///|
/// INT_DIVIDES_LABS
fn step_465() -> Unit raise {
  let t1083 = @simp.simp_tac(@list.List([int_abs_v1()]))
  let t1084 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1083),
      @class.cond_cases_tac,
    ),
    integer_tac_v1,
  )
  int_divides_labs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ n : Int, divides(abs(d), n) == divides(d, n)"),
      t1084,
    ),
  )
}

///|
let int_divides_labs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LABS",
)

///|
/// `INT_DIVIDES_LABS`
pub fn int_divides_labs() -> @kernel.Thm {
  int_divides_labs_c.get()
}

///|
/// INT_DIVIDES_RABS
fn step_466() -> Unit raise {
  let t1085 = @simp.simp_tac(@list.List([int_abs_v1()]))
  let t1086 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1085),
      @class.cond_cases_tac,
    ),
    integer_tac_v1,
  )
  int_divides_rabs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Int, ∀ n : Int, divides(d, abs(n)) == divides(d, n)"),
      t1086,
    ),
  )
}

///|
let int_divides_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_RABS",
)

///|
/// `INT_DIVIDES_RABS`
pub fn int_divides_rabs() -> @kernel.Thm {
  int_divides_rabs_c.get()
}

///|
/// INT_DIVIDES_ABS
fn step_467() -> Unit raise {
  let t1087 = @simp.rewrite_tac(
    @list.List([int_divides_labs(), int_divides_rabs()]),
  )
  int_divides_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ d : Int, ∀ n : Int, divides(abs(d), n) == divides(d, n)) && (∀ d : Int, ∀ n : Int, divides(d, abs(n)) == divides(d, n))"),
      t1087,
    ),
  )
}

///|
let int_divides_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_ABS",
)

///|
/// `INT_DIVIDES_ABS`
pub fn int_divides_abs() -> @kernel.Thm {
  int_divides_abs_c.get()
}

///|
/// INT_LCM_POS
fn step_468() -> Unit raise {
  let t1089 = @simp.asm_simp_tac(
    @list.List([int_pos(), int_abs_pos(), int_le_div(), int_gcd()]),
  )
  let t1088 = @simp.rewrite_tac(@list.List([int_lcm()]))
  let t1090 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1088),
      @class.cond_cases_tac,
    ),
    t1089,
  )
  int_lcm_pos_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, int_of_num(0) <= lcm((m, n))"), t1090),
  )
}

///|
let int_lcm_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM_POS")

///|
/// `INT_LCM_POS`
pub fn int_lcm_pos() -> @kernel.Thm {
  int_lcm_pos_c.get()
}

///|
/// INT_MUL_GCD_LCM
fn step_469() -> Unit raise {
  let t1095 = @meson.asm_meson_tac(
    @list.List([
      int_gcd(),
      integer_rule_v1(
        @term_syntax.parse_term("divides((d : Int), (m : Int)) → divides(d, m * (n : Int)) && divides(d, -(m * n))"),
      ),
    ]),
  )
  let t1094 = @simp.rewrite_tac(@list.List([int_abs_v1()]))
  let t1093 = @simp.rewrite_tac(@list.List([int_mul_div_eq()]))
  let t1092 = @simp.asm_rewrite_tac(
    @list.List([int_mul_rzero(), int_abs_num()]),
  )
  let t1091 = @simp.rewrite_tac(@list.List([int_lcm()]))
  let t1096 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1091),
            @class.cond_cases_tac,
          ),
          t1092,
        ),
        t1093,
      ),
      t1094,
    ),
    t1095,
  )
  int_mul_gcd_lcm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, gcd((m, n)) * lcm((m, n)) == abs(m * n)"),
      t1096,
    ),
  )
}

///|
let int_mul_gcd_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_MUL_GCD_LCM",
)

///|
/// `INT_MUL_GCD_LCM`
pub fn int_mul_gcd_lcm() -> @kernel.Thm {
  int_mul_gcd_lcm_c.get()
}

///|
/// INT_MUL_LCM_GCD
fn step_470() -> Unit raise {
  let t1097 = @meson.meson_tac(@list.List([int_mul_sym(), int_mul_gcd_lcm()]))
  int_mul_lcm_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, lcm((m, n)) * gcd((m, n)) == abs(m * n)"),
      t1097,
    ),
  )
}

///|
let int_mul_lcm_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_MUL_LCM_GCD",
)

///|
/// `INT_MUL_LCM_GCD`
pub fn int_mul_lcm_gcd() -> @kernel.Thm {
  int_mul_lcm_gcd_c.get()
}

///|
/// INT_DIVIDES_LCM_GCD
fn step_471() -> Unit raise {
  let t1114 = @simp.rewrite_tac(@list.List([int_mul_sym()]))
  let t1115 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x1111 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1112 = @tactics.subst1_tac(x1111)
      fn(
        x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1112(x1113)
      }
    }),
    t1114,
  )
  let t1116 = @list.List([
    @meson.meson_tac(
      @list.List([
        int_gcd(),
        integer_rule_v1(
          @term_syntax.parse_term("divides((d : Int), (m : Int)) → divides(d, m * (n : Int))"),
        ),
      ]),
    ),
    t1115,
  ])
  let t1110 = @simp.asm_rewrite_tac(
    @list.List([int_abs_zero(), int_divides_abs()]),
  )
  let t1104 = @drule.part_match(
    fn(x1103 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1103))
    },
    int_divides_divides_div(),
  )
  let t1099 = @simp.asm_rewrite_tac(@list.List([]))
  let t1098 = @simp.rewrite_tac(@list.List([int_lcm()]))
  let t1117 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1098),
                @class.cond_cases_tac,
              ),
              t1099,
            ),
            @list.List([integer_tac_v1, @tactics.all_tac]),
          ),
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
            (fn(
              x1108 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x1106 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x1105 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1100 : @kernel.Thm,
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
                    let s1101 = @tactics.mp_tac(x1100)
                    fn(
                      x1102 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1101(x1102)
                    }
                  })(t1104(x1105))
                })(@equal.lhand(x1106))
              })(
                (fn(
                  x1107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @kernel.Term raise {
                  x1107.1
                })(x1108),
              )
            })(x1109)(x1109)
          },
        ),
        t1110,
      ),
      @tactics.ants_tac,
    ),
    t1116,
  )
  int_divides_lcm_gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ d : Int, divides(d, lcm((m, n))) == divides(d * gcd((m, n)), m * n)"),
      t1117,
    ),
  )
}

///|
let int_divides_lcm_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_DIVIDES_LCM_GCD",
)

///|
/// `INT_DIVIDES_LCM_GCD`
pub fn int_divides_lcm_gcd() -> @kernel.Thm {
  int_divides_lcm_gcd_c.get()
}

///|
/// INT_LCM_DIVIDES
fn step_472() -> Unit raise {
  let t1136 = @term_syntax.parse_term("(n : Int)")
  let t1137 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(m : Int)"), t1136]), int_gcd()),
  )
  let t1134 = @tactics.disch_then(fn(
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
    let s1132 = @tactics.subst1_tac(x1131)
    fn(
      x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1132(x1133)
    }
  })
  let t1135 = @list.List([
    @meson.meson_tac(
      @list.List([
        int_gcd(),
        integer_rule_v1(
          @term_syntax.parse_term("divides((d : Int), (m : Int)) → divides(d, m * (n : Int))"),
        ),
      ]),
    ),
    t1134,
  ])
  let t1130 = @simp.asm_rewrite_tac(
    @list.List([int_abs_zero(), int_divides_abs()]),
  )
  let t1124 = @drule.part_match(
    fn(x1123 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1123))
    },
    int_divides_div_divides(),
  )
  let t1119 = @simp.asm_rewrite_tac(@list.List([]))
  let t1118 = @simp.rewrite_tac(@list.List([int_lcm()]))
  let t1138 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t1118,
                    ),
                    @class.cond_cases_tac,
                  ),
                  t1119,
                ),
                @list.List([integer_tac_v1, @tactics.all_tac]),
              ),
              fn(
                x1129 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
                  x1128 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1126 : @kernel.Term,
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
                      x1125 : @kernel.Term,
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
                        let s1121 = @tactics.mp_tac(x1120)
                        fn(
                          x1122 : (
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
                          s1121(x1122)
                        }
                      })(t1124(x1125))
                    })(@equal.lhand(x1126))
                  })(
                    (fn(
                      x1127 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> @kernel.Term raise {
                      x1127.1
                    })(x1128),
                  )
                })(x1129)(x1129)
              },
            ),
            t1130,
          ),
          @tactics.ants_tac,
        ),
        t1135,
      ),
      t1137,
    ),
    integer_tac_v1,
  )
  int_lcm_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, ∀ d : Int, divides(lcm((m, n)), d) == (divides(m, d) && divides(n, d))"),
      t1138,
    ),
  )
}

///|
let int_lcm_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_LCM_DIVIDES",
)

///|
/// `INT_LCM_DIVIDES`
pub fn int_lcm_divides() -> @kernel.Thm {
  int_lcm_divides_c.get()
}

///|
/// INT_LCM
fn step_473() -> Unit raise {
  let t1140 = @term_syntax.parse_term("(n : Int)")
  let t1141 = @tactics.mp_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("(m : Int)"), t1140]), int_gcd()),
  )
  let t1139 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1142 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([int_lcm_divides(), int_divides_lcm_gcd()]),
        ),
        t1139,
      ),
      t1141,
    ),
    integer_tac_v1,
  )
  int_lcm_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Int, ∀ n : Int, divides(m, lcm((m, n))) && divides(n, lcm((m, n))) && (∀ d : Int, divides(m, d) && divides(n, d) → divides(lcm((m, n)), d))"),
      t1142,
    ),
  )
}

///|
let int_lcm_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_LCM")

///|
/// `INT_LCM`
pub fn int_lcm_v1() -> @kernel.Thm {
  int_lcm_v1_c.get()
}

///|
/// INTEGER_TAC
fn step_474() -> Unit raise {
  let gcd_tm = @term_syntax.parse_term("gcd")
  let dest_gcd : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(
    x1143 : @kernel.Term,
  ) -> (@kernel.Term, @kernel.Term) raise {
    let tm = x1143
    let (l, r) = @kernel.dest_comb(tm)
    if l == gcd_tm {
      @pair.dest_pair(r)
    } else {
      raise Failure("dest_gcd")
    }
  }
  let gcd_elim_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), fn(
    x1158 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
      x1144 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let (asl, w) = x1144
      let gts = @basics.find_terms(
        (x1146 : @kernel.Term) => @lib.can(dest_gcd, x1146),
        w,
      )
      let ths = @lib.map(
        fn(x1147 : @kernel.Term) -> @kernel.Thm raise {
          let tm_1 = x1147
          let (a, b) = dest_gcd(tm_1)
          @bool.specl(@list.List([a, b]), int_gcd())
        },
        gts,
      )
      let t1157 = @tactics.map_every(
        fn(
          x1151 : (@kernel.Term, @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1152 = @tactics.spec_tac(x1151.0, x1151.1)
          fn(
            x1153 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1152(x1153)
          }
        },
        @lib.zip(
          gts,
          @lib.map(
            fn(x1156 : @kernel.Term) -> @kernel.Term raise {
              (fn(x1154 : @kernel.HolType) -> @kernel.Term raise {
                @basics.genvar(x1154)
              })(
                (fn(x1155 : @kernel.Term) -> @kernel.HolType raise {
                  @kernel.type_of(x1155)
                })(x1156),
              )
            },
            gts,
          ),
        ),
      )
      @tactics.then_tac(
        @tactics.map_every(
          fn(
            x1148 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1149 = @tactics.mp_tac(x1148)
            fn(
              x1150 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1149(x1150)
            }
          },
          ths,
        ),
        t1157,
      )
    })(x1158)(x1158)
  })
  let t1159 = @tactics.then_tac(gcd_elim_tac, integer_tac_v1)
  let pth = @tactics.prove(
    @term_syntax.parse_term("∀ d : Int, ∀ a : Int, ∀ b : Int, divides(d, gcd((a, b))) == (divides(d, a) && divides(d, b))"),
    t1159,
  )
  let t1163 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.gen_tac, @tactics.conj_tac),
  )
  integer_tac_c.set(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x1160 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1161 = @equal.top_depth_conv(x1160)
              fn(x1162 : @kernel.Term) -> @kernel.Thm raise { s1161(x1162) }
            },
            @list.List([
              pth,
              int_divides_abs(),
              int_divides_lcm_gcd(),
              int_lcm_divides(),
            ]),
          ),
          t1163,
        ),
        gcd_elim_tac,
      ),
      integer_tac_v1,
    ),
  )
}

///|
let integer_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("INTEGER_TAC")

///|
/// `INTEGER_TAC`
pub fn integer_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  integer_tac_c.get()(x)
}

///|
/// `INTEGER_RULE`
pub fn integer_rule(x1164 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1164
  @tactics.prove(tm, integer_tac)
}

///|
/// num_of_int
fn step_475() -> Unit raise {
  num_of_int_c.set(
    @pair.new_definition(@term_syntax.parse_term("(num_of_int : (Int) -> Num)((x : Int)) == select((n : Num) => int_of_num(n) == x)")),
  )
}

///|
let num_of_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_of_int")

///|
/// `num_of_int`
pub fn num_of_int() -> @kernel.Thm {
  num_of_int_c.get()
}

///|
/// NUM_OF_INT_OF_NUM
fn step_476() -> Unit raise {
  let t1165 = @simp.rewrite_tac(
    @list.List([num_of_int(), int_of_num_eq(), @class.select_unique()]),
  )
  num_of_int_of_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, num_of_int(int_of_num(n)) == n"), t1165),
  )
}

///|
let num_of_int_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUM_OF_INT_OF_NUM",
)

///|
/// `NUM_OF_INT_OF_NUM`
pub fn num_of_int_of_num() -> @kernel.Thm {
  num_of_int_of_num_c.get()
}

///|
/// INT_OF_NUM_OF_INT
fn step_477() -> Unit raise {
  let t1167 = @meson.meson_tac(@list.List([]))
  let t1166 = @tactics.conv_tac(@class.select_conv)
  let t1168 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@equal.gsym(int_forall_pos()), num_of_int()]),
        ),
        @tactics.gen_tac,
      ),
      t1166,
    ),
    t1167,
  )
  int_of_num_of_int_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, int_of_num(0) <= x → int_of_num(num_of_int(x)) == x"),
      t1168,
    ),
  )
}

///|
let int_of_num_of_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_OF_NUM_OF_INT",
)

///|
/// `INT_OF_NUM_OF_INT`
pub fn int_of_num_of_int() -> @kernel.Thm {
  int_of_num_of_int_c.get()
}

///|
/// NUM_OF_INT
fn step_478() -> Unit raise {
  let t1169 = @meson.meson_tac(@list.List([int_of_num_of_int(), int_pos()]))
  num_of_int_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, (int_of_num(0) <= x) == (int_of_num(num_of_int(x)) == x)"),
      t1169,
    ),
  )
}

///|
let num_of_int_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_OF_INT")

///|
/// `NUM_OF_INT`
pub fn num_of_int_v1() -> @kernel.Thm {
  num_of_int_v1_c.get()
}

///|
/// NUM_OF_INT_ADD
fn step_479() -> Unit raise {
  let t1170 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_forall_pos()),
      int_of_num_add(),
      num_of_int_of_num(),
    ]),
  )
  let t1171 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
    ),
    t1170,
  )
  num_of_int_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_of_num(0) <= x && int_of_num(0) <= y → num_of_int(x + y) == num_of_int(x) + num_of_int(y)"),
      t1171,
    ),
  )
}

///|
let num_of_int_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_OF_INT_ADD")

///|
/// `NUM_OF_INT_ADD`
pub fn num_of_int_add() -> @kernel.Thm {
  num_of_int_add_c.get()
}

///|
/// NUM_OF_INT_MUL
fn step_480() -> Unit raise {
  let t1172 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_forall_pos()),
      int_of_num_mul(),
      num_of_int_of_num(),
    ]),
  )
  let t1173 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@theorems.right_forall_imp_thm(), @theorems.imp_conj()]),
    ),
    t1172,
  )
  num_of_int_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, int_of_num(0) <= x && int_of_num(0) <= y → num_of_int(x * y) == num_of_int(x) * num_of_int(y)"),
      t1173,
    ),
  )
}

///|
let num_of_int_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_OF_INT_MUL")

///|
/// `NUM_OF_INT_MUL`
pub fn num_of_int_mul() -> @kernel.Thm {
  num_of_int_mul_c.get()
}

///|
/// NUM_OF_INT_POW
fn step_481() -> Unit raise {
  let t1175 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_forall_pos()),
      int_of_num_pow(),
      num_of_int_of_num(),
    ]),
  )
  let t1176 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x1174 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1174
      },
      @list.List([@theorems.swap_forall_thm()]),
    ),
    t1175,
  )
  num_of_int_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : Num, int_of_num(0) <= x → num_of_int(pow(x, n)) == EXP(num_of_int(x), n)"),
      t1176,
    ),
  )
}

///|
let num_of_int_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_OF_INT_POW")

///|
/// `NUM_OF_INT_POW`
pub fn num_of_int_pow() -> @kernel.Thm {
  num_of_int_pow_c.get()
}

///|
/// int.ml:2108
fn step_482() -> Unit raise {
  @preterm.overload_interface(
    "divides",
    @term_syntax.parse_term("(num_divides : (Num, Num) -> Bool)"),
  )
}

///|
/// int.ml:2109
fn step_483() -> Unit raise {
  @preterm.overload_interface(
    "mod",
    @term_syntax.parse_term("(num_mod : (Num, Num, Num) -> Bool)"),
  )
}

///|
/// int.ml:2110
fn step_484() -> Unit raise {
  @preterm.overload_interface(
    "coprime",
    @term_syntax.parse_term("(num_coprime : ((Num, Num)) -> Bool)"),
  )
}

///|
/// int.ml:2111
fn step_485() -> Unit raise {
  @preterm.overload_interface("gcd", @term_syntax.parse_term("(num_gcd : ((Num, Num)) -> Num)"))
}

///|
/// int.ml:2112
fn step_486() -> Unit raise {
  @preterm.overload_interface("lcm", @term_syntax.parse_term("(num_lcm : ((Num, Num)) -> Num)"))
}

///|
/// num_divides
fn step_487() -> Unit raise {
  num_divides_c.set(
    @pair.new_definition(@term_syntax.parse_term("(num_divides : (Num, Num) -> Bool)((a : Num), (b : Num)) == divides(int_of_num(a), int_of_num(b))")),
  )
}

///|
let num_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_divides")

///|
/// `num_divides`
pub fn num_divides() -> @kernel.Thm {
  num_divides_c.get()
}

///|
/// num_mod
fn step_488() -> Unit raise {
  num_mod_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(num_mod : (Num, Num, Num) -> Bool)((n : Num), (x : Num), (y : Num)) == mod(int_of_num(n), int_of_num(x), int_of_num(y))"),
    ),
  )
}

///|
let num_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_mod")

///|
/// `num_mod`
pub fn num_mod() -> @kernel.Thm {
  num_mod_c.get()
}

///|
/// num_congruent
fn step_489() -> Unit raise {
  let t1177 = @simp.rewrite_tac(@list.List([cong(), num_mod()]))
  num_congruent_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, num_mod(n)) == op_eq_eq(int_of_num(x), int_of_num(y), mod(int_of_num(n)))"),
      t1177,
    ),
  )
}

///|
let num_congruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_congruent")

///|
/// `num_congruent`
pub fn num_congruent() -> @kernel.Thm {
  num_congruent_c.get()
}

///|
/// num_coprime
fn step_490() -> Unit raise {
  num_coprime_c.set(
    @pair.new_definition(@term_syntax.parse_term("(num_coprime : ((Num, Num)) -> Bool)(((a : Num), (b : Num))) == coprime((int_of_num(a), int_of_num(b)))")),
  )
}

///|
let num_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_coprime")

///|
/// `num_coprime`
pub fn num_coprime() -> @kernel.Thm {
  num_coprime_c.get()
}

///|
/// num_gcd
fn step_491() -> Unit raise {
  num_gcd_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(num_gcd : ((Num, Num)) -> Num)(((a : Num), (b : Num))) == num_of_int(gcd((int_of_num(a), int_of_num(b))))"),
    ),
  )
}

///|
let num_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_gcd")

///|
/// `num_gcd`
pub fn num_gcd() -> @kernel.Thm {
  num_gcd_c.get()
}

///|
/// num_lcm
fn step_492() -> Unit raise {
  num_lcm_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(num_lcm : ((Num, Num)) -> Num)(((a : Num), (b : Num))) == num_of_int(lcm((int_of_num(a), int_of_num(b))))"),
    ),
  )
}

///|
let num_lcm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_lcm")

///|
/// `num_lcm`
pub fn num_lcm() -> @kernel.Thm {
  num_lcm_c.get()
}

///|
/// NUM_TO_INT_CONV
fn step_493() -> Unit raise {
  let t1178 = @meson.meson_tac(@list.List([]))
  let t1179 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([int_exists_pos(), int_forall_pos()])),
    t1178,
  )
  let pth_relativize = @tactics.prove(
    @term_syntax.parse_term("(∀ n : Num, (P : (Int) -> Bool)(int_of_num(n))) == (∀ i : Int, !(int_of_num(0) <= i) || P(i)) && (∃ n : Num, P(int_of_num(n))) == (∃ i : Int, int_of_num(0) <= i && P(i))"),
    t1179,
  )
  let relation_conv : (@kernel.Term) -> @kernel.Thm raise = ((
    x1183 : @list.List[@kernel.Thm],
  ) => {
    @simp.gen_rewrite_conv(
      fn(
        x1180 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1181 = @equal.top_sweep_conv(x1180)
        fn(x1182 : @kernel.Term) -> @kernel.Thm raise { s1181(x1182) }
      },
      x1183,
    )
  })(
    ((x1184 : @list.List[@kernel.Thm]) => @lib.map(@equal.gsym, x1184))(
      @list.List([
        int_of_num_eq(),
        int_of_num_le(),
        int_of_num_lt(),
        int_of_num_ge(),
        int_of_num_gt(),
        int_of_num_suc(),
        int_of_num_add(),
        int_of_num_mul(),
        int_of_num_pow(),
      ]),
    ),
  )
  let quantifier_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1185 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1186 = @equal.depth_conv(x1185)
      fn(x1187 : @kernel.Term) -> @kernel.Thm raise { s1186(x1187) }
    },
    @list.List([pth_relativize]),
  )
  num_to_int_conv_c.set(
    @equal.thenc(
      @equal.thenc(@grobner.num_simplify_conv, relation_conv),
      quantifier_conv,
    ),
  )
}

///|
let num_to_int_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "NUM_TO_INT_CONV",
)

///|
/// `NUM_TO_INT_CONV`
pub fn num_to_int_conv(x : @kernel.Term) -> @kernel.Thm raise {
  num_to_int_conv_c.get()(x)
}

///|
/// ARITH_RULE
fn step_494() -> Unit raise {
  let t1198 = @list.List([
    int_of_num_eq(),
    int_of_num_le(),
    int_of_num_lt(),
    int_of_num_ge(),
    int_of_num_gt(),
    int_of_num_add(),
    @bool.spec(@term_syntax.parse_term("NUMERAL((k : Num))"), int_of_num_mul()),
    int_of_num_max(),
    int_of_num_min(),
  ])
  let t1199 = ((x1196 : @list.List[@kernel.Thm]) => {
    @simp.gen_rewrite_conv(
      fn(
        x1193 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1194 = @equal.top_sweep_conv(x1193)
        fn(x1195 : @kernel.Term) -> @kernel.Thm raise { s1194(x1195) }
      },
      x1196,
    )
  })(((x1197 : @list.List[@kernel.Thm]) => @lib.map(@equal.gsym, x1197))(t1198))
  let t1191 = @equal.binop_conv(@normalizer.num_normalize_conv)
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @grobner.num_simplify_conv,
          @simp.gen_rewrite_conv(
            fn(
              x1188 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1189 = @equal.depth_conv(x1188)
              fn(x1190 : @kernel.Term) -> @kernel.Thm raise { s1189(x1190) }
            },
            @list.List([@arith.add1()]),
          ),
        ),
        (x1192 : @kernel.Term) => @canon.prop_atom_conv(t1191, x1192),
      ),
      @canon.prenex_conv,
    ),
    t1199,
  )
  let is_numimage : (@kernel.Term) -> Bool raise = fn(
    x1200 : @kernel.Term,
  ) -> Bool raise {
    let t = x1200
    match t {
      @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), n) if !@nums.is_numeral(
          n,
        ) => true
      _ => false
    }
  }
  arith_rule_c.set(fn(x1201 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1201
    try {
      let th1 = init_conv(tm)
      let tm1 = @kernel.rand(@kernel.concl(th1))
      let (avs, bod) = @basics.strip_forall(tm1)
      let nim = @lib.setify(@basics.find_terms(is_numimage, bod))
      let gvs = @lib.map(
        fn(x1204 : @kernel.Term) -> @kernel.Term raise {
          (fn(x1202 : @kernel.HolType) -> @kernel.Term raise {
            @basics.genvar(x1202)
          })(
            (fn(x1203 : @kernel.Term) -> @kernel.HolType raise {
              @kernel.type_of(x1203)
            })(x1204),
          )
        },
        nim,
      )
      let pths = @lib.map(
        fn(x1205 : @kernel.Term) -> @kernel.Thm raise {
          let v = x1205
          @bool.spec(@kernel.rand(v), int_pos())
        },
        nim,
      )
      let ibod = @lib.itlist(
        fn(x1212 : @kernel.Thm, x1213 : @kernel.Term) -> @kernel.Term raise {
          (fn(
            x1209 : @kernel.Term,
          ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
            fn(x1210 : @kernel.Term) -> @kernel.Term raise {
              ((x1207 : @kernel.Term, x1208 : @kernel.Term) => {
                @lib.curry(
                  fn(
                    x1206 : (@kernel.Term, @kernel.Term),
                  ) -> @kernel.Term raise {
                    @bool.mk_imp(x1206.0, x1206.1)
                  },
                  x1207,
                  x1208,
                )
              })(x1209, x1210)
            }
          })(
            (fn(x1211 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x1211)
            })(x1212),
          )(x1213)
        },
        pths,
        bod,
      )
      let gbod = @basics.subst(@lib.zip(gvs, nim), ibod)
      let t1214 = int_arith_v1(gbod)
      let th2 = @kernel.inst_rule(@lib.zip(nim, gvs), t1214)
      let th3 = @bool.genl(
        avs,
        @lib.rev_itlist(
          fn(x1217 : @kernel.Thm, x1218 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(
              x1215 : @kernel.Thm,
            ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
              fn(x1216 : @kernel.Thm) -> @kernel.Thm raise {
                @bool.mp(x1215, x1216)
              }
            })(x1218)(x1217)
          },
          pths,
          th2,
        ),
      )
      @kernel.eq_mp(@equal.sym(th1), th3)
    } catch {
      Failure(msg) => {
        let t1219 = "`: " + msg
        raise Failure("ARITH_RULE `" + (@printer.string_of_term(tm) + t1219))
      }
      e => raise e
    }
  })
}

///|
let arith_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "ARITH_RULE",
)

///|
/// `ARITH_RULE`
pub fn arith_rule(x : @kernel.Term) -> @kernel.Thm raise {
  arith_rule_c.get()(x)
}

///|
/// ARITH_TAC
fn step_495() -> Unit raise {
  arith_tac_c.set(
    @tactics.conv_tac(fn(x1220 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(arith_rule(x1220))
    }),
  )
}

///|
let arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("ARITH_TAC")

///|
/// `ARITH_TAC`
pub fn arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  arith_tac_c.get()(x)
}

///|
/// ASM_ARITH_TAC
fn step_496() -> Unit raise {
  asm_arith_tac_c.set(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.first_x_assum(fn(
          x1230 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x1221 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1222 = @tactics.mp_tac(x1221)
            fn(
              x1223 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1222(x1223)
            }
          })(
            ((x1229 : @kernel.Thm) => {
              @lib.check(
                fn(x1228 : @kernel.Thm) -> Bool raise {
                  (fn(x1226 : @kernel.Term) -> Bool raise {
                    (fn(x1224 : Bool) -> Bool raise { !x1224 })(
                      (fn(x1225 : @kernel.Term) -> Bool raise {
                        @basics.is_forall(x1225)
                      })(x1226),
                    )
                  })(
                    (fn(x1227 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x1227)
                    })(x1228),
                  )
                },
                x1229,
              )
            })(x1230),
          )
        }),
      ),
      arith_tac,
    ),
  )
}

///|
let asm_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "ASM_ARITH_TAC",
)

///|
/// `ASM_ARITH_TAC`
pub fn asm_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  asm_arith_tac_c.get()(x)
}

///|
/// INT_ARITH
fn step_497() -> Unit raise {
  let t1231 = @simp.rewrite_tac(
    @list.List([int_not_le(), int_not_lt(), int_not_eq(), int_lt_discrete()]),
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("!((x : Int) <= (y : Int)) == (y + int_of_num(1) <= x) && !(x < y) == (y <= x) && !(x == y) == (x + int_of_num(1) <= y || y + int_of_num(1) <= x) && (x < y) == (x + int_of_num(1) <= y)"),
    t1231,
  )
  let atom_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1232 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1232
    },
    @list.List([pth]),
  )
  let bub_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1233 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1234 = @equal.top_sweep_conv(x1233)
      fn(x1235 : @kernel.Term) -> @kernel.Thm raise { s1234(x1235) }
    },
    @list.List([
      int_eq(),
      int_le(),
      int_lt(),
      int_ge(),
      int_gt(),
      int_of_num_th(),
      int_neg_th(),
      int_add_th(),
      int_mul_th(),
      int_sub_th(),
      int_pow_th(),
      int_abs_th(),
      int_max_th(),
      int_min_th(),
    ]),
  )
  let base_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.try_conv(atom_conv),
    bub_conv,
  )
  let nnf_norm_conv : (@kernel.Term) -> @kernel.Thm raise = @canon.gen_nnf_conv(
    false,
  )(
    (
      base_conv,
      fn(x1236 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
        let t = x1236
        let t1237 = base_conv(@bool.mk_neg(t))
        (base_conv(t), t1237)
      },
    ),
  )
  let x_tm = @term_syntax.parse_term("(x : Int)")
  let y_tm = @term_syntax.parse_term("(y : Int)")
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let pth_pos = @bool.spec(n_tm, int_pos())
  let pth_add = @bool.specl(@list.List([x_tm, y_tm]), int_le_add())
  let pth_mul = @bool.specl(@list.List([x_tm, y_tm]), int_le_mul())
  let pth_pow = @bool.specl(@list.List([x_tm, n_tm]), int_pow_le())
  fn rule(x1238 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1238
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("int_of_num", _), rtm) =>
        @kernel.inst_rule(@list.List([(rtm, n_tm)]), pth_pos)
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("int_add", _), ltm),
        rtm_1
      ) => {
        let lth = rule(ltm)
        let rth = rule(rtm_1)
        let t1239 = @bool.conj(lth, rth)
        @bool.mp(
          @kernel.inst_rule(@list.List([(ltm, x_tm), (rtm_1, y_tm)]), pth_add),
          t1239,
        )
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("int_mul", _), ltm_1),
        rtm_2
      ) => {
        let lth_1 = rule(ltm_1)
        let rth_1 = rule(rtm_2)
        let t1240 = @bool.conj(lth_1, rth_1)
        @bool.mp(
          @kernel.inst_rule(@list.List([(ltm_1, x_tm), (rtm_2, y_tm)]), pth_mul),
          t1240,
        )
      }
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("int_pow", _), ltm_2),
        rtm_3
      ) => {
        let lth_2 = rule(ltm_2)
        @bool.mp(
          @kernel.inst_rule(@list.List([(ltm_2, x_tm), (rtm_3, n_tm)]), pth_pow),
          lth_2,
        )
      }
      _ => raise Failure("INT_POS_RULE")
    }
  }
  let int_pos_rule : (@kernel.Term) -> @kernel.Thm raise = rule
  let t1250 = @metis.asm_metis_tac(@list.List([int_divmod_uniq()]))
  let t1249 = @simp.asm_simp_tac(@list.List([int_division(), int_le_div()]))
  let t1248 = @term_syntax.parse_term("rem((m : Int), (n : Int))")
  let t1251 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x1245 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s1246 = @tactics.exists_tac(x1245)
          fn(
            x1247 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s1246(x1247)
          }
        },
        @list.List([@term_syntax.parse_term("div((m : Int), (n : Int))"), t1248]),
      ),
      t1249,
    ),
    t1250,
  ])
  let t1252 = @tactics.thenl(
    @tactics.then_tac(@tactics.eq_tac, @tactics.strip_tac),
    t1251,
  )
  let t1244 = @simp.rewrite_tac(@list.List([int_div_0(), int_rem_0()]))
  let t1243 = @simp.rewrite_tac(
    @list.List([
      @theorems.unwind_thm2(),
      @equal.gsym(@theorems.conj_assoc()),
      @theorems.right_exists_and_thm(),
    ]),
  )
  let t1253 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(@list.List([int_abs_num(), int_let_antisym()])),
        t1243,
      ),
      t1244,
    ),
    t1252,
  ])
  let t1242 = @simp.asm_rewrite_tac(@list.List([]))
  let t1241 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
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
  ) raise = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([@equal.gsym(int_lt_discrete())])),
        t1241,
      ),
      t1242,
    ),
    t1253,
  )
  let divrem_elim_thm = @tactics.prove(
    @term_syntax.parse_term("(P : (Int, Int) -> Bool)(div((m : Int), (n : Int)), rem(m, n)) == (∃ q : Int, ∃ r : Int, (n == int_of_num(0) && q == int_of_num(0) && r == m || m == q * n + r && int_of_num(0) <= r && r + int_of_num(1) <= abs(n)) && P(q, r))"),
    tac,
  )
  let divrem_elim_thm_p = @tactics.prove(
    @term_syntax.parse_term("(P : (Int, Int) -> Bool)(div((m : Int), (n : Int)), rem(m, n)) == (∃ q : Int, ∃ r : Int, (n == int_of_num(0) && q == int_of_num(0) && r == m || m == q * n + r && (int_of_num(0) <= m && int_of_num(0) <= n → int_of_num(0) <= q) && int_of_num(0) <= r && r + int_of_num(1) <= abs(n)) && P(q, r))"),
    tac,
  )
  let t1254 = @simp.simp_tac(@list.List([divrem_elim_thm_p, int_abs_v1()]))
  let divrem_elim_thm_pos = @tactics.prove(
    @term_syntax.parse_term("int_of_num(0) <= (m : Int) && int_of_num(0) <= (n : Int) → (P : (Int, Int) -> Bool)(div(m, n), rem(m, n)) == (∃ q : Int, ∃ r : Int, (n == int_of_num(0) && q == int_of_num(0) && r == m || m == q * n + r && int_of_num(0) <= q && int_of_num(0) <= r && r + int_of_num(1) <= n) && P(q, r))"),
    t1254,
  )
  let beta2_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.rator_conv(@equal.beta_conv),
    @equal.beta_conv,
  )
  let div_tm = @term_syntax.parse_term("div")
  let rem_tm = @term_syntax.parse_term("rem")
  let p_tm = @term_syntax.parse_term("(P : (Int, Int) -> Bool)")
  let m_tm = @term_syntax.parse_term("(m : Int)")
  let n_tm_1 = @term_syntax.parse_term("(n : Int)")
  let is_div : (@kernel.Term) -> Bool raise = fn(
    x1256 : @kernel.Term,
  ) -> Bool raise {
    ((x1255 : @kernel.Term) => @basics.is_binop(div_tm, x1255))(x1256)
  }
  let is_rem : (@kernel.Term) -> Bool raise = fn(
    x1258 : @kernel.Term,
  ) -> Bool raise {
    ((x1257 : @kernel.Term) => @basics.is_binop(rem_tm, x1257))(x1258)
  }
  let is_divrem : (@kernel.Term) -> Bool raise = fn(
    x1259 : @kernel.Term,
  ) -> Bool raise {
    let tm_1 = x1259
    is_div(tm_1) || is_rem(tm_1)
  }
  fn conv(x1260 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x1260
    try {
      let t_2 = @lib.hd(
        @lib.sort(
          fn(x1261 : @kernel.Term, x1262 : @kernel.Term) -> Bool raise {
            @basics.free_in(x1261, x1262)
          },
          @basics.find_terms(
            fn(x1263 : @kernel.Term) -> Bool raise {
              let t_1 = x1263
              is_divrem(t_1) && @basics.free_in(t_1, tm_2)
            },
            tm_2,
          ),
        ),
      )
      let x = @equal.lhand(t_2)
      let y = @kernel.rand(t_2)
      let dtm = @kernel.mk_comb(@kernel.mk_comb(div_tm, x), y)
      let rtm_4 = @kernel.mk_comb(@kernel.mk_comb(rem_tm, x), y)
      let vd = @basics.genvar(@kernel.type_of(dtm))
      let vr = @basics.genvar(@kernel.type_of(rtm_4))
      let p = @basics.list_mk_abs(
        @list.List([vd, vr]),
        @basics.subst(@list.List([(vd, dtm), (vr, rtm_4)]), tm_2),
      )
      let th0 = @kernel.inst_rule(
        @list.List([(p, p_tm), (x, m_tm), (y, n_tm_1)]),
        divrem_elim_thm_pos,
      )
      let th1 = try {
        let (ltm_3, rtm_5) = @basics.dest_conj(@equal.lhand(@kernel.concl(th0)))
        let t1264 = int_pos_rule(@kernel.rand(rtm_5))
        @bool.mp(th0, @bool.conj(int_pos_rule(@kernel.rand(ltm_3)), t1264))
      } catch {
        Failure(_) =>
          @kernel.inst_rule(
            @list.List([(p, p_tm), (x, m_tm), (y, n_tm_1)]),
            divrem_elim_thm,
          )
        e => raise e
      }
      let t1268 = @lib.funpow(
        2,
        fn(
          x1265 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1266 = @equal.binder_conv(x1265)
          fn(x1267 : @kernel.Term) -> @kernel.Thm raise { s1266(x1267) }
        },
        @equal.rand_conv(beta2_conv),
      )
      let th2 = @equal.conv_rule(
        @equal.comb2_conv(@equal.rand_conv(beta2_conv), t1268),
        th1,
      )
      let th3 = @equal.conv_rule(
        @equal.rand_conv(
          @lib.funpow(
            2,
            fn(
              x1269 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1270 = @equal.binder_conv(x1269)
              fn(x1271 : @kernel.Term) -> @kernel.Thm raise { s1270(x1271) }
            },
            int_reduce_conv,
          ),
        ),
        th2,
      )
      @equal.conv_rule(
        @equal.rand_conv(
          @equal.binder_conv(@equal.binder_conv(@equal.rand_conv(conv))),
        ),
        th3,
      )
    } catch {
      Failure(_) => @kernel.refl(tm_2)
      e => raise e
    }
  }
  fn topconv(x1272 : @kernel.Term) -> @kernel.Thm raise {
    let tm_3 = x1272
    if @basics.is_forall(tm_3) || @basics.is_exists(tm_3) {
      @equal.binder_conv(topconv)(tm_3)
    } else {
      conv(tm_3)
    }
  }
  let int_divrem_elim_conv : (@kernel.Term) -> @kernel.Thm raise = topconv
  let t1277 = @equal.depth_binop_conv(
    @term_syntax.parse_term("op_bslash_slash"),
    @canon.conds_elim_conv,
  )
  let t1276 = @simp.gen_rewrite_conv(
    fn(
      x1273 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1274 = @equal.depth_conv(x1273)
      fn(x1275 : @kernel.Term) -> @kernel.Thm raise { s1274(x1275) }
    },
    @list.List([int_gt_v1(), int_ge_v1()]),
  )
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @equal.thenc(
              @equal.thenc(
                @equal.top_depth_conv(@equal.beta_conv),
                @canon.presimp_conv,
              ),
              t1276,
            ),
            @canon.nnf_conv,
          ),
          t1277,
        ),
        int_reduce_conv,
      ),
      int_divrem_elim_conv,
    ),
    nnf_norm_conv,
  )
  let p_tm_1 = @term_syntax.parse_term("(p : Bool)")
  let not_tm = @term_syntax.parse_term("op_tilde")
  let pth_1 = @class.taut(
    @basics.mk_eq(@bool.mk_neg(@bool.mk_neg(p_tm_1)), p_tm_1),
  )
  int_arith_c.set(fn(x1278 : @kernel.Term) -> @kernel.Thm raise {
    let tm_4 = x1278
    try {
      let th0_1 = @kernel.inst_rule(@list.List([(tm_4, p_tm_1)]), pth_1)
      let th1_1 = init_conv(@bool.mk_neg(tm_4))
      let th2_1 = @calc_rat.real_arith(
        @bool.mk_neg(@kernel.rand(@kernel.concl(th1_1))),
      )
      @kernel.eq_mp(
        th0_1,
        @kernel.eq_mp(@equal.ap_term(not_tm, @equal.sym(th1_1)), th2_1),
      )
    } catch {
      Failure(m) => {
        let t1279 = "`: " + m
        raise Failure("INT_ARITH `" + (@printer.string_of_term(tm_4) + t1279))
      }
      e => raise e
    }
  })
}

///|
let int_arith_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_ARITH",
)

///|
/// `INT_ARITH`
pub fn int_arith(x : @kernel.Term) -> @kernel.Thm raise {
  int_arith_c.get()(x)
}

///|
/// INT_ARITH_TAC
fn step_498() -> Unit raise {
  int_arith_tac_c.set(
    @tactics.conv_tac(fn(x1280 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_intro(int_arith(x1280))
    }),
  )
}

///|
let int_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "INT_ARITH_TAC",
)

///|
/// `INT_ARITH_TAC`
pub fn int_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  int_arith_tac_c.get()(x)
}

///|
/// ASM_INT_ARITH_TAC
fn step_499() -> Unit raise {
  asm_int_arith_tac_c.set(
    @tactics.then_tac(
      @tactics.repeat_tac(
        @tactics.first_x_assum(fn(
          x1290 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x1281 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1282 = @tactics.mp_tac(x1281)
            fn(
              x1283 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1282(x1283)
            }
          })(
            ((x1289 : @kernel.Thm) => {
              @lib.check(
                fn(x1288 : @kernel.Thm) -> Bool raise {
                  (fn(x1286 : @kernel.Term) -> Bool raise {
                    (fn(x1284 : Bool) -> Bool raise { !x1284 })(
                      (fn(x1285 : @kernel.Term) -> Bool raise {
                        @basics.is_forall(x1285)
                      })(x1286),
                    )
                  })(
                    (fn(x1287 : @kernel.Thm) -> @kernel.Term raise {
                      @kernel.concl(x1287)
                    })(x1288),
                  )
                },
                x1289,
              )
            })(x1290),
          )
        }),
      ),
      int_arith_tac,
    ),
  )
}

///|
let asm_int_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "ASM_INT_ARITH_TAC",
)

///|
/// `ASM_INT_ARITH_TAC`
pub fn asm_int_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  asm_int_arith_tac_c.get()(x)
}

///|
/// BINARY_INDUCT
fn step_500() -> Unit raise {
  let t1293 = @meson.asm_meson_tac(@list.List([]))
  let t1292 = @tactics.strip_assume_tac(
    arith_rule(
      @term_syntax.parse_term("(n : Num) == 0 || DIV(n, 2) < n && (n == 2 * DIV(n, 2) || n == 2 * DIV(n, 2) + 1)"),
    ),
  )
  let t1291 = @tactics.match_mp_tac(@arith.num_wf())
  let t1294 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac),
          t1291,
        ),
        @tactics.gen_tac,
      ),
      t1292,
    ),
    t1293,
  )
  binary_induct_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, P(0) && (∀ n : Num, P(n) → P(2 * n) && P(2 * n + 1)) → (∀ n : Num, P(n))"),
      t1294,
    ),
  )
}

///|
let binary_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_INDUCT")

///|
/// `BINARY_INDUCT`
pub fn binary_induct() -> @kernel.Thm {
  binary_induct_c.get()
}

///|
/// NUM_CASES_BINARY
fn step_501() -> Unit raise {
  let t1295 = @meson.meson_tac(
    @list.List([
      arith_rule(@term_syntax.parse_term("(n : Num) == 2 * DIV(n, 2) || n == 2 * DIV(n, 2) + 1")),
    ]),
  )
  num_cases_binary_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ n : Num, P(n)) == ((∀ n : Num, P(2 * n)) && (∀ n : Num, P(2 * n + 1)))"),
      t1295,
    ),
  )
}

///|
let num_cases_binary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NUM_CASES_BINARY",
)

///|
/// `NUM_CASES_BINARY`
pub fn num_cases_binary() -> @kernel.Thm {
  num_cases_binary_c.get()
}

///|
/// num_WF_DOWN
fn step_502() -> Unit raise {
  let t1318 = @meson.asm_meson_tac(
    @list.List([
      arith_rule(@term_syntax.parse_term("!((m : Num) <= (n : Num)) → n == m - 1 - (m - 1 - n)")),
    ]),
  )
  let t1317 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1316 = @simp.asm_simp_tac(
    @list.List([
      arith_rule(@term_syntax.parse_term("!((m : Num) <= (p : Num)) → m - 1 - (m - 1 - p) == p")),
    ]),
  )
  let t1312 = @term_syntax.parse_term("(m : Num) - 1 - (p : Num)")
  let t1315 = @tactics.first_x_assum(fn(
    x1314 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1309 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1310 = @tactics.mp_tac(x1309)
      fn(
        x1311 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1310(x1311)
      }
    })(((x1313 : @kernel.Thm) => @bool.spec(t1312, x1313))(x1314))
  })
  let t1308 = @simp.asm_simp_tac(@list.List([]))
  let t1307 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= (p : Num)"))
  let t1306 = @list.List([
    asm_arith_tac,
    @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")),
  ])
  let t1305 = @tactics.disch_then(fn(
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
    let th = x1302
    let t1304 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t1304)
  })
  let t1319 = @list.List([
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
                          @tactics.match_mp_tac(@arith.num_wf()),
                          @tactics.gen_tac,
                        ),
                        t1305,
                      ),
                      @tactics.conj_tac,
                    ),
                    t1306,
                  ),
                  t1307,
                ),
                t1308,
              ),
              @tactics.strip_tac,
            ),
            t1315,
          ),
          t1316,
        ),
        t1317,
      ),
      asm_arith_tac,
    ),
    t1318,
  ])
  let t1301 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, (P : (Num) -> Bool)((m : Num) - 1 - i)"), fn(
    x1298 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1299 = @tactics.mp_tac(x1298)
    fn(
      x1300 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1299(x1300)
    }
  })
  let t1297 = @list.List([
    @meson.asm_meson_tac(@list.List([@arith.le_0()])),
    @tactics.all_tac,
  ])
  let t1296 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1320 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.repeat_tac(@tactics.gen_tac),
            @tactics.strip_tac,
          ),
          t1296,
        ),
        t1297,
      ),
      t1301,
    ),
    t1319,
  )
  num_wf_down_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ m : Num, (∀ n : Num, m <= n → P(n)) && (∀ n : Num, n < m && (∀ p : Num, n < p → P(p)) → P(n)) → (∀ n : Num, P(n))"),
      t1320,
    ),
  )
}

///|
let num_wf_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_WF_DOWN")

///|
/// `num_WF_DOWN`
pub fn num_wf_down() -> @kernel.Thm {
  num_wf_down_c.get()
}

///|
/// INT_REM_REM_POW_MIN
fn step_503() -> Unit raise {
  let t1343 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_le()]))
  let t1342 = @tactics.match_mp_tac(int_pow_mono())
  let t1341 = @simp.asm_rewrite_tac(@list.List([int_pow_eq_0(), int_abs_pow()]))
  let t1340 = @tactics.match_mp_tac(int_rem_rem_le())
  let t1338 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([@arith.not_le()])),
  )
  let t1337 = @simp.rewrite_tac(@list.List([int_pow_add(), int_rem_rem_mul()]))
  let t1334 = @simp.gen_rewrite_rule(
    fn(
      x1333 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x1333
    },
    @list.List([@arith.le_exists()]),
  )
  let t1335 = @tactics.choose_then(fn(
    x1330 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1331 = @tactics.subst1_tac(x1330)
    fn(
      x1332 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1331(x1332)
    }
  })
  let t1339 = @list.List([
    @tactics.then_tac(
      @tactics.first_x_assum(fn(
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
        t1335(t1334(x1336))
      }),
      t1337,
    ),
    t1338,
  ])
  let t1329 = @simp.asm_rewrite_tac(@list.List([]))
  let t1327 = @simp.rewrite_tac(
    @list.List([
      arith_rule(@term_syntax.parse_term("MIN((m : Num), (n : Num)) == (if n <= m { n } else { m })")),
    ]),
  )
  let t1326 = @simp.asm_rewrite_tac(@list.List([int_rem_0(), int_rem_1()]))
  let t1324 = @term_syntax.parse_term("(n : Num) == 0")
  let t1325 = @tactics.map_every(
    @class.asm_cases_tac,
    @list.List([@term_syntax.parse_term("(m : Num) == 0"), t1324]),
  )
  let t1328 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(
          @list.List([
            int_pow_zero(),
            arith_rule(@term_syntax.parse_term("(MIN((a : Num), (b : Num)) == 0) == (a == 0 || b == 0)")),
          ]),
        ),
        t1325,
      ),
      t1326,
    ),
    t1327,
  ])
  let t1323 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Int) == int_of_num(0)"))
  let t1322 = @simp.asm_rewrite_tac(@list.List([int_rem_zero()]))
  let t1321 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Int) == int_of_num(0)"))
  let t1344 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t1321,
                        ),
                        t1322,
                      ),
                      t1323,
                    ),
                    t1328,
                  ),
                  @class.cond_cases_tac,
                ),
                t1329,
              ),
              t1339,
            ),
            t1340,
          ),
          t1341,
        ),
        t1342,
      ),
      t1343,
    ),
    asm_int_arith_tac,
  )
  int_rem_rem_pow_min_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ p : Int, ∀ m : Num, ∀ n : Num, rem(rem(x, pow(p, m)), pow(p, n)) == rem(x, pow(p, MIN(m, n)))"),
      t1344,
    ),
  )
}

///|
let int_rem_rem_pow_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_REM_REM_POW_MIN",
)

///|
/// `INT_REM_REM_POW_MIN`
pub fn int_rem_rem_pow_min() -> @kernel.Thm {
  int_rem_rem_pow_min_c.get()
}

///|
/// NUM_GCD
fn step_504() -> Unit raise {
  let t1345 = @simp.rewrite_tac(
    @list.List([num_gcd(), @equal.gsym(num_of_int_v1()), int_gcd()]),
  )
  num_gcd_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, int_of_num(num_gcd((a, b))) == gcd((int_of_num(a), int_of_num(b)))"), t1345),
  )
}

///|
let num_gcd_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_GCD")

///|
/// `NUM_GCD`
pub fn num_gcd_v1() -> @kernel.Thm {
  num_gcd_v1_c.get()
}

///|
/// NUM_LCM
fn step_505() -> Unit raise {
  let t1346 = @simp.rewrite_tac(
    @list.List([num_lcm(), @equal.gsym(num_of_int_v1()), int_lcm_pos()]),
  )
  num_lcm_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, int_of_num(num_lcm((a, b))) == lcm((int_of_num(a), int_of_num(b)))"), t1346),
  )
}

///|
let num_lcm_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_LCM")

///|
/// `NUM_LCM`
pub fn num_lcm_v1() -> @kernel.Thm {
  num_lcm_v1_c.get()
}

///|
/// CONG
fn step_506() -> Unit raise {
  let t1347 = @simp.rewrite_tac(
    @list.List([
      num_congruent(),
      @equal.gsym(int_rem_eq()),
      int_of_num_rem(),
      int_of_num_eq(),
    ]),
  )
  cong_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, y, num_mod(n)) == (MOD(x, n) == MOD(y, n))"),
      t1347,
    ),
  )
}

///|
let cong_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG")

///|
/// `CONG`
pub fn cong_v1() -> @kernel.Thm {
  cong_v1_c.get()
}

///|
/// CONG_LMOD
fn step_507() -> Unit raise {
  let t1348 = @simp.rewrite_tac(@list.List([cong_v1(), @arith.mod_mod_refl()]))
  cong_lmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(MOD(x, n), y, num_mod(n)) == op_eq_eq(x, y, num_mod(n))"),
      t1348,
    ),
  )
}

///|
let cong_lmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_LMOD")

///|
/// `CONG_LMOD`
pub fn cong_lmod() -> @kernel.Thm {
  cong_lmod_c.get()
}

///|
/// CONG_RMOD
fn step_508() -> Unit raise {
  let t1349 = @simp.rewrite_tac(@list.List([cong_v1(), @arith.mod_mod_refl()]))
  cong_rmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ n : Num, op_eq_eq(x, MOD(y, n), num_mod(n)) == op_eq_eq(x, y, num_mod(n))"),
      t1349,
    ),
  )
}

///|
let cong_rmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_RMOD")

///|
/// `CONG_RMOD`
pub fn cong_rmod() -> @kernel.Thm {
  cong_rmod_c.get()
}

///|
/// CONG_DIV2
fn step_509() -> Unit raise {
  let t1350 = @simp.simp_tac(@list.List([cong_v1(), @arith.div_mod()]))
  cong_div2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ m : Num, ∀ n : Num, op_eq_eq(a, b, mod(m * n)) → op_eq_eq(DIV(a, m), DIV(b, m), mod(n))"),
      t1350,
    ),
  )
}

///|
let cong_div2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_DIV2")

///|
/// `CONG_DIV2`
pub fn cong_div2() -> @kernel.Thm {
  cong_div2_c.get()
}

///|
/// divides
fn step_510() -> Unit raise {
  let t1359 = @simp.simp_tac(
    @list.List([int_of_num_of_int(), int_abs_pos(), int_abs_abs()]),
  )
  let t1358 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(int_of_num_mul()), int_abs_mul()]),
  )
  let t1356 = int_arith(
    @term_syntax.parse_term("(int_of_num((m : Num)) == int_of_num((n : Num))) == (abs(int_of_num(m)) == abs(int_of_num(n)))"),
  )
  let t1357 = @simp.simp_tac(@list.List([@equal.gsym(int_of_num_eq()), t1356]))
  let t1355 = @tactics.exists_tac(@term_syntax.parse_term("num_of_int(abs((x : Int)))"))
  let t1352 = @term_syntax.parse_term("(x : Int)")
  let t1354 = @tactics.disch_then((x1353 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1352, x1353)
  })
  let t1351 = @list.List([
    @tactics.all_tac,
    @meson.meson_tac(@list.List([int_of_num_mul(), int_of_num_eq()])),
  ])
  let t1360 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @simp.rewrite_tac(@list.List([num_divides(), int_divides()])),
                @tactics.eq_tac,
              ),
              t1351,
            ),
            t1354,
          ),
          t1355,
        ),
        t1357,
      ),
      t1358,
    ),
    t1359,
  )
  divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("num_divides((a : Num), (b : Num)) == (∃ x : Num, b == a * x)"),
      t1360,
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
/// DIVIDES_LE
fn step_511() -> Unit raise {
  let t1363 = @simp.rewrite_tac(
    @list.List([
      @arith.le_mult_lcancel(),
      @arith.mult_eq_0(),
      arith_rule(@term_syntax.parse_term("((m : Num) <= m * (n : Num)) == (m * 1 <= m * n)")),
    ]),
  )
  let t1364 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.subgoal_then(
        @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= m * n || m * n == 0"),
        fn(
          x1361 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let th = x1361
          @meson.meson_tac(@list.List([divides(), th]))
        },
      ),
      t1363,
    ),
    asm_arith_tac,
  )
  divides_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, num_divides(m, n) → m <= n || n == 0"),
      t1364,
    ),
  )
}

///|
let divides_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LE")

///|
/// `DIVIDES_LE`
pub fn divides_le() -> @kernel.Thm {
  divides_le_c.get()
}

///|
/// DIVIDES_LE_STRONG
fn step_512() -> Unit raise {
  let t1368 = @meson.meson_tac(@list.List([@arith.mult_clauses()]))
  let t1367 = @simp.rewrite_tac(@list.List([divides()]))
  let t1366 = @simp.asm_simp_tac(
    @list.List([divides_le(), @arith.le_1(), @arith.le_0()]),
  )
  let t1365 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1369 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1365),
        t1366,
      ),
      t1367,
    ),
    t1368,
  )
  divides_le_strong_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, num_divides(m, n) → 1 <= m && m <= n || n == 0"),
      t1369,
    ),
  )
}

///|
let divides_le_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_LE_STRONG",
)

///|
/// `DIVIDES_LE_STRONG`
pub fn divides_le_strong() -> @kernel.Thm {
  divides_le_strong_c.get()
}

///|
/// DIVIDES_LE_IMP
fn step_513() -> Unit raise {
  let t1370 = @meson.meson_tac(@list.List([divides_le(), @arith.le_refl()]))
  divides_le_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, num_divides(m, n) && (n == 0 → m == 0) → m <= n"),
      t1370,
    ),
  )
}

///|
let divides_le_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_LE_IMP")

///|
/// `DIVIDES_LE_IMP`
pub fn divides_le_imp() -> @kernel.Thm {
  divides_le_imp_c.get()
}

///|
/// PROPERLY_DIVIDES_LE_IMP
fn step_514() -> Unit raise {
  let t1374 = @simp.simp_tac(
    @list.List([@arith.le_mult_lcancel(), @arith.mult_eq_0()]),
  )
  let t1373 = @simp.rewrite_tac(
    @list.List([
      @grobner.num_ring(
        @term_syntax.parse_term("!((m : Num) == m * (d : Num)) == (!(m == 0) && !(d == 1))"),
      ),
    ]),
  )
  let t1372 = @simp.simp_tac(
    @list.List([
      @theorems.imp_conj(),
      divides(),
      @theorems.left_imp_exists_thm(),
    ]),
  )
  let t1371 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1375 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1371),
          t1372,
        ),
        t1373,
      ),
      t1374,
    ),
    arith_tac,
  )
  properly_divides_le_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, divides(m, n) && !(n == 0) && !(m == n) → 2 * m <= n"),
      t1375,
    ),
  )
}

///|
let properly_divides_le_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PROPERLY_DIVIDES_LE_IMP",
)

///|
/// `PROPERLY_DIVIDES_LE_IMP`
pub fn properly_divides_le_imp() -> @kernel.Thm {
  properly_divides_le_imp_c.get()
}

///|
/// DIVIDES_ANTISYM
fn step_515() -> Unit raise {
  let t1381 = @drule.match_mp(divides_le_strong())
  let t1383 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
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
      })(t1381(x1382))
    }),
  )
  let t1376 = @meson.meson_tac(@list.List([@arith.mult_clauses()]))
  let t1377 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(@simp.rewrite_tac(@list.List([divides()])), t1376),
  ])
  let t1384 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        t1377,
      ),
      t1383,
    ),
    arith_tac,
  )
  divides_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, (num_divides(m, n) && num_divides(n, m)) == (m == n)"),
      t1384,
    ),
  )
}

///|
let divides_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_ANTISYM",
)

///|
/// `DIVIDES_ANTISYM`
pub fn divides_antisym() -> @kernel.Thm {
  divides_antisym_c.get()
}

///|
/// DIVIDES_ONE
fn step_516() -> Unit raise {
  let t1385 = @meson.meson_tac(
    @list.List([@arith.mult_eq_1(), @arith.mult_clauses()]),
  )
  let t1386 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([divides()])),
    t1385,
  )
  divides_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, num_divides(n, 1) == (n == 1)"), t1386),
  )
}

///|
let divides_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_ONE")

///|
/// `DIVIDES_ONE`
pub fn divides_one() -> @kernel.Thm {
  divides_one_c.get()
}

///|
/// DIV_ADD
fn step_517() -> Unit raise {
  let t1390 = @simp.asm_simp_tac(
    @list.List([@arith.div_mult_add(), @arith.div_mult()]),
  )
  let t1389 = @simp.rewrite_tac(@list.List([divides()]))
  let t1388 = @simp.asm_simp_tac(
    @list.List([@arith.div_zero(), @arith.add_clauses()]),
  )
  let t1387 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1391 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1387),
          t1388,
        ),
        t1389,
      ),
      @tactics.strip_tac,
    ),
    t1390,
  )
  div_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a) || divides(d, b) → DIV(a + b, d) == DIV(a, d) + DIV(b, d)"),
      t1391,
    ),
  )
}

///|
let div_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_ADD")

///|
/// `DIV_ADD`
pub fn div_add() -> @kernel.Thm {
  div_add_c.get()
}

///|
/// DIVIDES_MOD
fn step_518() -> Unit raise {
  let t1392 = @meson.meson_tac(@list.List([@arith.mult_sym()]))
  let t1393 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([divides(), @arith.mod_eq_0()])),
    t1392,
  )
  divides_mod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, num_divides(m, n) == (MOD(n, m) == 0)"),
      t1393,
    ),
  )
}

///|
let divides_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_MOD")

///|
/// `DIVIDES_MOD`
pub fn divides_mod() -> @kernel.Thm {
  divides_mod_c.get()
}

///|
/// DIVIDES_DIV_MULT
fn step_519() -> Unit raise {
  let t1394 = @equal.gsym(num_divides())
  let t1395 = @equal.gsym(int_of_num_div())
  let t1396 = @equal.gsym(int_of_num_mul())
  let t1397 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_of_num_eq()),
      t1396,
      t1395,
      int_mul_div_eq(),
      t1394,
    ]),
  )
  divides_div_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, num_divides(m, n) == (DIV(n, m) * m == n)"),
      t1397,
    ),
  )
}

///|
let divides_div_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIV_MULT",
)

///|
/// `DIVIDES_DIV_MULT`
pub fn divides_div_mult() -> @kernel.Thm {
  divides_div_mult_c.get()
}

///|
/// DIV_BY_DIV
fn step_520() -> Unit raise {
  let t1398 = @equal.gsym(int_of_num_div())
  let t1399 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_of_num_eq()),
      t1398,
      num_divides(),
      int_div_by_div(),
    ]),
  )
  div_by_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, !(n == 0) && divides(m, n) → DIV(n, DIV(n, m)) == m"),
      t1399,
    ),
  )
}

///|
let div_by_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_BY_DIV")

///|
/// `DIV_BY_DIV`
pub fn div_by_div() -> @kernel.Thm {
  div_by_div_c.get()
}

///|
/// DIVIDES_DIV_DIVIDES
fn step_521() -> Unit raise {
  let t1400 = @equal.gsym(int_of_num_mul())
  let t1401 = @equal.gsym(int_of_num_div())
  let t1402 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_of_num_eq()),
      t1401,
      num_divides(),
      t1400,
      int_divides_div_divides(),
    ]),
  )
  divides_div_divides_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ d : Num, ∀ e : Num, divides(d, n) && (n == 0 → e == 0) → divides(DIV(n, d), e) == divides(n, d * e)"),
      t1402,
    ),
  )
}

///|
let divides_div_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIV_DIVIDES",
)

///|
/// `DIVIDES_DIV_DIVIDES`
pub fn divides_div_divides() -> @kernel.Thm {
  divides_div_divides_c.get()
}

///|
/// DIVIDES_DIV_SELF
fn step_522() -> Unit raise {
  let t1403 = @simp.rewrite_tac(
    @list.List([
      num_divides(),
      @equal.gsym(int_of_num_div()),
      int_divides_div_self(),
    ]),
  )
  divides_div_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ d : Num, num_divides(d, n) → num_divides(DIV(n, d), n)"),
      t1403,
    ),
  )
}

///|
let divides_div_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIV_SELF",
)

///|
/// `DIVIDES_DIV_SELF`
pub fn divides_div_self() -> @kernel.Thm {
  divides_div_self_c.get()
}

///|
/// DIVIDES_DIVIDES_DIV
fn step_523() -> Unit raise {
  let t1404 = @equal.gsym(int_of_num_mul())
  let t1405 = @equal.gsym(int_of_num_div())
  let t1406 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(int_of_num_eq()),
      t1405,
      num_divides(),
      t1404,
      int_divides_divides_div(),
    ]),
  )
  divides_divides_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ d : Num, ∀ e : Num, divides(d, n) → divides(e, DIV(n, d)) == divides(d * e, n)"),
      t1406,
    ),
  )
}

///|
let divides_divides_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIVIDES_DIV",
)

///|
/// `DIVIDES_DIVIDES_DIV`
pub fn divides_divides_div() -> @kernel.Thm {
  divides_divides_div_c.get()
}

///|
/// DIVIDES_DIVIDES_DIV_EQ
fn step_524() -> Unit raise {
  let t1408 = @simp.rewrite_tac(@list.List([int_divides_divides_div_eq()]))
  let t1407 = @equal.gsym(int_of_num_mul())
  let t1409 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([num_divides(), @equal.gsym(int_of_num_div()), t1407]),
    ),
    t1408,
  )
  divides_divides_div_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ d : Num, ∀ e : Num, (divides(d, n) && divides(e, DIV(n, d))) == divides(d * e, n)"),
      t1409,
    ),
  )
}

///|
let divides_divides_div_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIVIDES_DIV_EQ",
)

///|
/// `DIVIDES_DIVIDES_DIV_EQ`
pub fn divides_divides_div_eq() -> @kernel.Thm {
  divides_divides_div_eq_c.get()
}

///|
/// DIVIDES_DIVIDES_DIV_IMP
fn step_525() -> Unit raise {
  let t1410 = @meson.meson_tac(@list.List([divides_divides_div_eq()]))
  divides_divides_div_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ d : Num, ∀ e : Num, num_divides(d * e, n) → num_divides(e, DIV(n, d))"),
      t1410,
    ),
  )
}

///|
let divides_divides_div_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIVIDES_DIVIDES_DIV_IMP",
)

///|
/// `DIVIDES_DIVIDES_DIV_IMP`
pub fn divides_divides_div_imp() -> @kernel.Thm {
  divides_divides_div_imp_c.get()
}

///|
/// MULT_DIV
fn step_526() -> Unit raise {
  let t1415 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.div_0(),
      @equal.gsym(@arith.mult_assoc()),
      @arith.div_mult(),
    ]),
  )
  let t1414 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t1413 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1411 = @simp.simp_tac(
    @list.List([divides(), @theorems.left_imp_exists_thm()]),
  )
  let t1412 = @list.List([
    @meson.meson_tac(@list.List([@arith.mult_sym()])),
    t1411,
  ])
  let t1416 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.match_mp_tac(
              @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")),
            ),
            @tactics.conj_tac,
          ),
          t1412,
        ),
        t1413,
      ),
      t1414,
    ),
    t1415,
  )
  mult_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, ∀ p : Num, divides(p, m) → DIV(m * n, p) == DIV(m, p) * n) && (∀ m : Num, ∀ n : Num, ∀ p : Num, divides(p, n) → DIV(m * n, p) == m * DIV(n, p))"),
      t1416,
    ),
  )
}

///|
let mult_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_DIV")

///|
/// `MULT_DIV`
pub fn mult_div() -> @kernel.Thm {
  mult_div_c.get()
}

///|
/// NUMBER_TAC
fn step_527() -> Unit raise {
  let conva : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1417 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1418 = @equal.try_conv(x1417)
      fn(x1419 : @kernel.Term) -> @kernel.Thm raise { s1418(x1419) }
    },
    @list.List([@equal.gsym(divides_antisym())]),
  )
  fn antisym_conv(x1420 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1420
    if @basics.is_forall(tm) || @basics.is_exists(tm) {
      @equal.binder_conv(antisym_conv)(tm)
    } else if @basics.is_conj(tm) || @basics.is_disj(tm) {
      @equal.binop_conv(antisym_conv)(tm)
    } else if @basics.is_imp(tm) {
      @equal.rand_conv(antisym_conv)(tm)
    } else {
      conva(tm)
    }
  }
  let t1425 = @meson.meson_tac(@list.List([]))
  let t1424 = @simp.rewrite_tac(
    @list.List([@class.not_exists_thm(), int_forall_pos()]),
  )
  let t1426 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.gen_rewrite_tac(
        fn(
          x1421 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1422 = @equal.rand_conv(x1421)
          fn(x1423 : @kernel.Term) -> @kernel.Thm raise { s1422(x1423) }
        },
        @list.List([
          @class.taut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)")),
        ]),
      ),
      t1424,
    ),
    t1425,
  )
  let pth_relativize = @tactics.prove(
    @term_syntax.parse_term("(∀ n : Num, (P : (Int) -> Bool)(int_of_num(n))) == (∀ i : Int, int_of_num(0) <= i → P(i)) && (∃ n : Num, P(int_of_num(n))) == (∃ i : Int, int_of_num(0) <= i && P(i))"),
    t1426,
  )
  let relation_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1427 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1428 = @equal.top_sweep_conv(x1427)
      fn(x1429 : @kernel.Term) -> @kernel.Thm raise { s1428(x1429) }
    },
    @lib.map(
      @equal.gsym,
      @list.List([
        int_of_num_eq(),
        int_of_num_le(),
        int_of_num_lt(),
        int_of_num_ge(),
        int_of_num_gt(),
        int_of_num_suc(),
        int_of_num_add(),
        int_of_num_mul(),
        int_of_num_pow(),
      ]),
    )
    .prepend(num_lcm_v1())
    .prepend(num_gcd_v1())
    .prepend(num_coprime())
    .prepend(num_congruent())
    .prepend(num_divides()),
  )
  let quantifier_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x1430 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1431 = @equal.depth_conv(x1430)
      fn(x1432 : @kernel.Term) -> @kernel.Thm raise { s1431(x1432) }
    },
    @list.List([pth_relativize]),
  )
  let t1441 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1440 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t1439 = @tactics.conv_tac(@equal.thenc(relation_conv, quantifier_conv))
  let t1433 = @tactics.conv_tac(antisym_conv)
  number_tac_c.set(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(
                  @tactics.orelse_tac(
                    @tactics.orelse_tac(@tactics.conj_tac, @tactics.gen_tac),
                    @tactics.eq_tac,
                  ),
                ),
                t1433,
              ),
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
                (fn(
                  x1434 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let (_, w) = x1434
                  @tactics.map_every(
                    fn(
                      x1436 : @kernel.Term,
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
                      let v = x1436
                      @tactics.spec_tac(v, v)
                    },
                    @kernel.frees(w),
                  )
                })(x1438)(x1438)
              },
            ),
            t1439,
          ),
          t1440,
        ),
        t1441,
      ),
      integer_tac,
    ),
  )
}

///|
let number_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NUMBER_TAC")

///|
/// `NUMBER_TAC`
pub fn number_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  number_tac_c.get()(x)
}

///|
/// `NUMBER_RULE`
pub fn number_rule(x1442 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1442
  @tactics.prove(tm, number_tac)
}

///|
/// COPRIME_LMOD
fn step_528() -> Unit raise {
  let t1443 = number_rule(
    @term_syntax.parse_term("op_eq_eq((a : Num), (b : Num), num_mod((n : Num))) && num_coprime((a, n)) → num_coprime((b, n))"),
  )
  let t1444 = @meson.meson_tac(
    @list.List([
      cong_lmod(),
      number_rule(@term_syntax.parse_term("op_eq_eq((x : Num), x, num_mod((n : Num)))")),
      t1443,
    ]),
  )
  coprime_lmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, num_coprime((MOD(a, n), n)) == num_coprime((a, n))"),
      t1444,
    ),
  )
}

///|
let coprime_lmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_LMOD")

///|
/// `COPRIME_LMOD`
pub fn coprime_lmod() -> @kernel.Thm {
  coprime_lmod_c.get()
}

///|
/// COPRIME_RMOD
fn step_529() -> Unit raise {
  let t1445 = @simp.rewrite_tac(@list.List([coprime_lmod()]))
  let t1446 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        number_rule(@term_syntax.parse_term("num_coprime(((a : Num), (b : Num))) == num_coprime((b, a))")),
      ]),
    ),
    t1445,
  )
  coprime_rmod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ n : Num, num_coprime((n, MOD(a, n))) == num_coprime((n, a))"),
      t1446,
    ),
  )
}

///|
let coprime_rmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_RMOD")

///|
/// `COPRIME_RMOD`
pub fn coprime_rmod() -> @kernel.Thm {
  coprime_rmod_c.get()
}

///|
/// INT_CONG_NUM_EXISTS
fn step_530() -> Unit raise {
  let t1472 = @tactics.conv_tac(integer_rule)
  let t1471 = @simp.rewrite_tac(@list.List([int_abs_v1()]))
  let t1470 = @simp.rewrite_tac(
    @list.List([
      integer_rule(
        @term_syntax.parse_term("op_eq_eq((x : Int) + (a : Int), x, mod((n : Int))) == divides(n, a)"),
      ),
    ]),
  )
  let t1473 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_then(fn(
            x1467 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s1468 = @tactics.subst1_tac(x1467)
            fn(
              x1469 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s1468(x1469)
            }
          }),
          t1470,
        ),
        t1471,
      ),
      @class.cond_cases_tac,
    ),
    t1472,
  )
  let t1466 = @tactics.match_mp_tac(int_le_lmul())
  let t1465 = @simp.rewrite_tac(@list.List([int_abs_mul()]))
  let t1464 = @tactics.match_mp_tac(
    int_arith(@term_syntax.parse_term("abs((x : Int)) * int_of_num(1) <= (y : Int) → int_of_num(0) <= x + y")),
  )
  let t1463 = @simp.asm_rewrite_tac(@list.List([]))
  let t1462 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Int) == int_of_num(0)"))
  let t1474 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.pop_assum(fn(
                    x1459 : @kernel.Thm,
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
                    let s1460 = @tactics.mp_tac(x1459)
                    fn(
                      x1461 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1460(x1461)
                    }
                  }),
                  t1462,
                ),
                t1463,
              ),
              @list.List([asm_arith_tac, @tactics.all_tac]),
            ),
            t1464,
          ),
          t1465,
        ),
        t1466,
      ),
      asm_int_arith_tac,
    ),
    t1473,
  ])
  let t1452 = @drule.part_match(
    fn(x1451 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x1451))
    },
    int_of_num_of_int(),
  )
  let t1447 = @tactics.exists_tac(
    @term_syntax.parse_term("num_of_int((x : Int) + abs(x * (y : Int)))"),
  )
  let t1475 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1447),
        fn(
          x1458 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
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
            x1457 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x1455 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x1454 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                (fn(
                  x1453 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  (fn(
                    x1448 : @kernel.Thm,
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
                    let s1449 = @tactics.mp_tac(x1448)
                    fn(
                      x1450 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1449(x1450)
                    }
                  })(t1452(x1453))
                })(@equal.lhand(x1454))
              })(@kernel.rator(x1455))
            })(
              (fn(
                x1456 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> @kernel.Term raise {
                x1456.1
              })(x1457),
            )
          })(x1458)(x1458)
        },
      ),
      @tactics.ants_tac,
    ),
    t1474,
  )
  int_cong_num_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ y : Int, (y == int_of_num(0) → int_of_num(0) <= x) → (∃ n : Num, op_eq_eq(int_of_num(n), x, mod(y)))"),
      t1475,
    ),
  )
}

///|
let int_cong_num_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "INT_CONG_NUM_EXISTS",
)

///|
/// `INT_CONG_NUM_EXISTS`
pub fn int_cong_num_exists() -> @kernel.Thm {
  int_cong_num_exists_c.get()
}

///|
/// GCD
fn step_531() -> Unit raise {
  gcd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Num, ∀ b : Num, (divides(gcd((a, b)), a) && divides(gcd((a, b)), b)) && (∀ e : Num, divides(e, a) && divides(e, b) → divides(e, gcd((a, b))))"),
      number_tac,
    ),
  )
}

///|
let gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD")

///|
/// `GCD`
pub fn gcd() -> @kernel.Thm {
  gcd_c.get()
}

///|
/// coprime
fn step_532() -> Unit raise {
  let t1483 = @simp.rewrite_tac(@list.List([gcd()]))
  let t1479 = @term_syntax.parse_term("num_gcd(((a : Num), (b : Num)))")
  let t1482 = @tactics.disch_then(fn(
    x1481 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1476 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1477 = @tactics.mp_tac(x1476)
      fn(
        x1478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1477(x1478)
      }
    })(((x1480 : @kernel.Thm) => @bool.spec(t1479, x1480))(x1481))
  })
  let t1484 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.eq_tac,
          @list.List([@tactics.conv_tac(number_rule), @tactics.all_tac]),
        ),
        t1482,
      ),
      t1483,
    ),
    number_tac,
  )
  coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("coprime(((a : Num), (b : Num))) == (∀ d : Num, divides(d, a) && divides(d, b) → d == 1)"),
      t1484,
    ),
  )
}

///|
let coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("coprime")

///|
/// `coprime`
pub fn coprime() -> @kernel.Thm {
  coprime_c.get()
}

///|
/// prime
fn step_533() -> Unit raise {
  prime_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(prime : (Num) -> Bool)((p : Num)) == (!(p == 1) && (∀ x : Num, divides(x, p) → x == 1 || x == p))"),
    ),
  )
}

///|
let prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prime")

///|
/// `prime`
pub fn prime() -> @kernel.Thm {
  prime_c.get()
}

///|
/// ONE_OR_PRIME
fn step_534() -> Unit raise {
  let t1486 = @simp.asm_rewrite_tac(@list.List([divides_one()]))
  let t1485 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1487 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @simp.rewrite_tac(@list.List([prime()])),
      ),
      t1485,
    ),
    t1486,
  )
  one_or_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, (p == 1 || prime(p)) == (∀ n : Num, divides(n, p) → n == 1 || n == p)"),
      t1487,
    ),
  )
}

///|
let one_or_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONE_OR_PRIME")

///|
/// `ONE_OR_PRIME`
pub fn one_or_prime() -> @kernel.Thm {
  one_or_prime_c.get()
}

///|
/// ONE_OR_PRIME_DIVIDES_OR_COPRIME
fn step_535() -> Unit raise {
  let t1503 = @tactics.conv_tac(number_rule)
  let t1502 = @tactics.pop_assum(fn(
    x1499 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1500 = @tactics.mp_tac(x1499)
    fn(
      x1501 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1500(x1501)
    }
  })
  let t1498 = @tactics.match_mp_tac(@theorems.mono_or())
  let t1494 = @term_syntax.parse_term("(n : Num)")
  let t1497 = @tactics.first_x_assum(fn(
    x1496 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
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
    })(((x1495 : @kernel.Thm) => @bool.spec(t1494, x1495))(x1496))
  })
  let t1490 = @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()]))
  let t1489 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1504 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([one_or_prime()])),
                  t1489,
                ),
                @tactics.disch_tac,
              ),
              t1490,
            ),
            t1497,
          ),
          t1498,
        ),
        @tactics.conj_tac,
      ),
      t1502,
    ),
    t1503,
  )
  let t1505 = @meson.asm_meson_tac(@list.List([prime(), coprime()]))
  let t1488 = @tactics.conv_tac(number_rule)
  let t1506 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.asm_rewrite_tac(@list.List([])),
          @tactics.gen_tac,
        ),
        @tactics.disj1_tac,
      ),
      t1488,
    ),
    t1505,
    t1504,
  ])
  let t1507 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.strip_tac,
    ),
    t1506,
  )
  one_or_prime_divides_or_coprime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, (p == 1 || prime(p)) == (∀ n : Num, divides(p, n) || coprime((p, n)))"),
      t1507,
    ),
  )
}

///|
let one_or_prime_divides_or_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ONE_OR_PRIME_DIVIDES_OR_COPRIME",
)

///|
/// `ONE_OR_PRIME_DIVIDES_OR_COPRIME`
pub fn one_or_prime_divides_or_coprime() -> @kernel.Thm {
  one_or_prime_divides_or_coprime_c.get()
}

///|
/// PRIME_COPRIME_EQ_NONDIVISIBLE
fn step_536() -> Unit raise {
  let t1532 = @tactics.conv_tac(number_rule)
  let t1531 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t1530 = @tactics.pop_assum(fn(
    x1527 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1528 = @tactics.mp_tac(x1527)
    fn(
      x1529 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1528(x1529)
    }
  })
  let t1526 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) → q || p → p == !q")),
  )
  let t1525 = @simp.simp_tac(
    @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) || !p"))]),
  )
  let t1524 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1523 = @tactics.disch_then(fn(
    x1520 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s1521 = @tactics.subst1_tac(x1520)
    fn(
      x1522 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s1521(x1522)
    }
  })
  let t1519 = @simp.asm_rewrite_tac(@list.List([]))
  let t1533 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.mp_tac(
                        @bool.spec(
                          @term_syntax.parse_term("(p : Num)"),
                          one_or_prime_divides_or_coprime(),
                        ),
                      ),
                      t1519,
                    ),
                    t1523,
                  ),
                  @tactics.eq_tac,
                ),
                t1524,
              ),
              t1525,
            ),
            @tactics.gen_tac,
          ),
          t1526,
        ),
        t1530,
      ),
      t1531,
    ),
    t1532,
  )
  let t1518 = @tactics.conv_tac(number_rule)
  let t1517 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(p : Bool) && (q : Bool) → p == !q → false")),
  )
  let t1513 = @term_syntax.parse_term("1")
  let t1516 = @tactics.disch_then(fn(
    x1515 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    })(((x1514 : @kernel.Thm) => @bool.spec(t1513, x1514))(x1515))
  })
  let t1534 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([prime()])), t1516),
        t1517,
      ),
      t1518,
    ),
    t1533,
  ])
  let t1509 = @simp.asm_rewrite_tac(@list.List([]))
  let t1508 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t1535 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")), t1508),
      t1509,
    ),
    t1534,
  )
  prime_coprime_eq_nondivisible_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, prime(p) == (∀ n : Num, num_coprime((p, n)) == !num_divides(p, n))"),
      t1535,
    ),
  )
}

///|
let prime_coprime_eq_nondivisible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PRIME_COPRIME_EQ_NONDIVISIBLE",
)

///|
/// `PRIME_COPRIME_EQ_NONDIVISIBLE`
pub fn prime_coprime_eq_nondivisible() -> @kernel.Thm {
  prime_coprime_eq_nondivisible_c.get()
}

///|
/// ZERO_ONE_OR_PRIME_DIVPROD
fn step_537() -> Unit raise {
  let t1539 = @meson.asm_meson_tac(
    @list.List([
      prime(),
      coprime(),
      number_rule(
        @term_syntax.parse_term("∀ d : Num, ∀ a : Num, ∀ b : Num, divides(d, a * b) && coprime((d, a)) → divides(d, b)"),
      ),
    ]),
  )
  let t1538 = @list.List([@tactics.all_tac, @tactics.conv_tac(number_rule)])
  let t1537 = @simp.asm_rewrite_tac(
    @list.List([
      number_rule(@term_syntax.parse_term("num_divides(0, (n : Num)) == (n == 0)")),
      @arith.mult_eq_0(),
    ]),
  )
  let t1536 = @simp.asm_rewrite_tac(
    @list.List([number_rule(@term_syntax.parse_term("num_divides(1, (n : Num))"))]),
  )
  let t1540 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1536),
          t1537,
        ),
        @tactics.eq_tac,
      ),
      t1538,
    ),
    t1539,
  )
  zero_one_or_prime_divprod_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, ∀ a : Num, ∀ b : Num, p == 0 || p == 1 || prime(p) → divides(p, a * b) == (divides(p, a) || divides(p, b))"),
      t1540,
    ),
  )
}

///|
let zero_one_or_prime_divprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZERO_ONE_OR_PRIME_DIVPROD",
)

///|
/// `ZERO_ONE_OR_PRIME_DIVPROD`
pub fn zero_one_or_prime_divprod() -> @kernel.Thm {
  zero_one_or_prime_divprod_c.get()
}

///|
/// ZERO_ONE_OR_PRIME
fn step_538() -> Unit raise {
  let t1576 = @simp.asm_simp_tac(
    @list.List([
      @arith.mult_clauses(),
      arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)")),
    ]),
  )
  let t1575 = @simp.rewrite_tac(
    @list.List([@arith.le_mult_lcancel(), @arith.le_mult_rcancel()]),
  )
  let t1573 = arith_rule(@term_syntax.parse_term("((a : Num) * (b : Num) <= b) == (a * b <= 1 * b)"))
  let t1574 = @simp.once_rewrite_tac(
    @list.List([
      arith_rule(@term_syntax.parse_term("((a : Num) * (b : Num) <= a) == (a * b <= a * 1)")),
      t1573,
    ]),
  )
  let t1570 = @drule.match_mp(divides_le_strong())
  let t1572 = @tactics.first_x_assum(fn(
    x1571 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
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
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1568 = @tactics.mp_tac(x1567)
      fn(
        x1569 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1568(x1569)
      }
    })(t1570(x1571))
  })
  let t1566 = @simp.rewrite_tac(
    @list.List([number_rule(@term_syntax.parse_term("num_divides((n : Num), n)"))]),
  )
  let t1565 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(
      @list.List([
        @arith.mult_eq_0(),
        @arith.mult_eq_1(),
        @class.de_morgan_thm(),
      ]),
    ),
  )
  let t1564 = @tactics.first_x_assum(fn(
    x1563 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1560 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1561 = @tactics.subst_all_tac(x1560)
      fn(
        x1562 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1561(x1562)
      }
    })(@equal.sym(x1563))
  })
  let t1555 = @term_syntax.parse_term("(b : Num)")
  let t1556 = @list.List([@term_syntax.parse_term("(a : Num)"), t1555])
  let t1559 = @tactics.first_x_assum(fn(
    x1558 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1552 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1553 = @tactics.mp_tac(x1552)
      fn(
        x1554 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1553(x1554)
      }
    })(((x1557 : @kernel.Thm) => @bool.specl(t1556, x1557))(x1558))
  })
  let t1551 = @tactics.disch_then(fn(
    x1550 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x1547 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s1548 = @tactics.assume_tac(x1547)
      fn(
        x1549 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s1548(x1549)
      }
    })(@equal.sym(x1550))
  })
  let t1545 = @term_syntax.parse_term("(b : Num)")
  let t1546 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(a : Num)"), t1545]),
  )
  let t1544 = @simp.asm_rewrite_tac(
    @list.List([prime(), divides(), @theorems.left_imp_exists_thm()]),
  )
  let t1543 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1542 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)"))]),
  )
  let t1541 = @simp.simp_tac(@list.List([zero_one_or_prime_divprod()]))
  let t1577 = @tactics.then_tac(
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
                                    @tactics.gen_tac, @tactics.eq_tac,
                                  ),
                                  t1541,
                                ),
                                @tactics.disch_tac,
                              ),
                              t1542,
                            ),
                            t1543,
                          ),
                          t1544,
                        ),
                        t1546,
                      ),
                      t1551,
                    ),
                    t1559,
                  ),
                  t1564,
                ),
                t1565,
              ),
              t1566,
            ),
            @tactics.strip_tac,
          ),
          t1572,
        ),
        t1574,
      ),
      t1575,
    ),
    t1576,
  )
  zero_one_or_prime_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Num, (p == 0 || p == 1 || prime(p)) == (∀ a : Num, ∀ b : Num, divides(p, a * b) → divides(p, a) || divides(p, b))"),
      t1577,
    ),
  )
}

///|
let zero_one_or_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ZERO_ONE_OR_PRIME",
)

///|
/// `ZERO_ONE_OR_PRIME`
pub fn zero_one_or_prime() -> @kernel.Thm {
  zero_one_or_prime_c.get()
}

///|
/// int.ml:2634
fn step_539() -> Unit raise {
  @preterm.make_overloadable("zpow", @parser.parse_type("A->int->A"))
}

///|
/// int.ml:2635
fn step_540() -> Unit raise {
  @printer.parse_as_infix("zpow", (24L, "left"))
}

///|
/// int.ml:2636
fn step_541() -> Unit raise {
  @preterm.overload_interface(
    "zpow",
    @term_syntax.parse_term("(real_zpow : (Real, Int) -> Real)"),
  )
}

///|
/// real_zpow
fn step_542() -> Unit raise {
  real_zpow_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_zpow : (Real, Int) -> Real)((z : Real), (i : Int)) == (if int_of_num(0) <= i { pow(z, num_of_int(i)) } else { inv(pow(z, num_of_int(-i))) })"),
    ),
  )
}

///|
let real_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_zpow")

///|
/// `real_zpow`
pub fn real_zpow() -> @kernel.Thm {
  real_zpow_c.get()
}

///|
/// REAL_POW_ZPOW
fn step_543() -> Unit raise {
  let t1578 = @simp.rewrite_tac(
    @list.List([real_zpow(), int_pos(), num_of_int_of_num()]),
  )
  real_pow_zpow_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, pow(x, n) == zpow(x, int_of_num(n))"), t1578),
  )
}

///|
let real_pow_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_ZPOW")

///|
/// `REAL_POW_ZPOW`
pub fn real_pow_zpow() -> @kernel.Thm {
  real_pow_zpow_c.get()
}

///|
/// REAL_ZPOW_NUM
fn step_544() -> Unit raise {
  let t1579 = @simp.rewrite_tac(
    @list.List([real_zpow(), int_pos(), num_of_int_of_num()]),
  )
  real_zpow_num_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, zpow(x, int_of_num(n)) == pow(x, n)"), t1579),
  )
}

///|
let real_zpow_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_NUM")

///|
/// `REAL_ZPOW_NUM`
pub fn real_zpow_num() -> @kernel.Thm {
  real_zpow_num_c.get()
}

///|
/// REAL_ZPOW_0
fn step_545() -> Unit raise {
  let t1580 = @simp.rewrite_tac(
    @list.List([real_zpow_num(), @realax.real_pow()]),
  )
  real_zpow_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, zpow(x, int_of_num(0)) == real_of_num(1)"), t1580),
  )
}

///|
let real_zpow_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_0")

///|
/// `REAL_ZPOW_0`
pub fn real_zpow_0() -> @kernel.Thm {
  real_zpow_0_c.get()
}

///|
/// REAL_ZPOW_1
fn step_546() -> Unit raise {
  let t1581 = @simp.rewrite_tac(
    @list.List([real_zpow_num(), @real.real_pow_1()]),
  )
  real_zpow_1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, zpow(x, int_of_num(1)) == x"), t1581),
  )
}

///|
let real_zpow_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_1")

///|
/// `REAL_ZPOW_1`
pub fn real_zpow_1() -> @kernel.Thm {
  real_zpow_1_c.get()
}

///|
/// REAL_ZPOW_2
fn step_547() -> Unit raise {
  let t1582 = @simp.rewrite_tac(
    @list.List([real_zpow_num(), @realarith.real_pow_2()]),
  )
  real_zpow_2_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, zpow(x, int_of_num(2)) == x * x"), t1582),
  )
}

///|
let real_zpow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_2")

///|
/// `REAL_ZPOW_2`
pub fn real_zpow_2() -> @kernel.Thm {
  real_zpow_2_c.get()
}

///|
/// REAL_ZPOW_ONE
fn step_548() -> Unit raise {
  let t1583 = @simp.rewrite_tac(
    @list.List([
      real_zpow(),
      @real.real_pow_one(),
      @real.real_inv_1(),
      @class.cond_id(),
    ]),
  )
  real_zpow_one_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Int, zpow(real_of_num(1), n) == real_of_num(1)"), t1583),
  )
}

///|
let real_zpow_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_ONE")

///|
/// `REAL_ZPOW_ONE`
pub fn real_zpow_one() -> @kernel.Thm {
  real_zpow_one_c.get()
}

///|
/// REAL_ZPOW_NEG
fn step_549() -> Unit raise {
  let t1587 = @meson.meson_tac(@list.List([@real.real_inv_inv()]))
  let t1586 = @simp.asm_simp_tac(
    @list.List([
      real_zpow(),
      @class.cond_swap(),
      int_neg_neg(),
      int_arith(
        @term_syntax.parse_term("!((n : Int) == int_of_num(0)) → (int_of_num(0) <= -n) == !(int_of_num(0) <= n)"),
      ),
    ]),
  )
  let t1585 = @simp.asm_rewrite_tac(
    @list.List([int_neg_0(), real_zpow_0(), @real.real_inv_1()]),
  )
  let t1584 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Int) == int_of_num(0)"))
  let t1588 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1584),
        t1585,
      ),
      t1586,
    ),
    t1587,
  )
  real_zpow_neg_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, zpow(x, -n) == inv(zpow(x, n))"),
      t1588,
    ),
  )
}

///|
let real_zpow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_NEG")

///|
/// `REAL_ZPOW_NEG`
pub fn real_zpow_neg() -> @kernel.Thm {
  real_zpow_neg_c.get()
}

///|
/// REAL_ZPOW_MINUS1
fn step_550() -> Unit raise {
  let t1589 = @simp.rewrite_tac(@list.List([real_zpow_neg(), real_zpow_1()]))
  real_zpow_minus1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, zpow(x, -int_of_num(1)) == inv(x)"), t1589),
  )
}

///|
let real_zpow_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ZPOW_MINUS1",
)

///|
/// `REAL_ZPOW_MINUS1`
pub fn real_zpow_minus1() -> @kernel.Thm {
  real_zpow_minus1_c.get()
}

///|
/// REAL_ZPOW_ZERO
fn step_551() -> Unit raise {
  let t1591 = @meson.meson_tac(
    @list.List([@realax.real_inv_0(), @real.real_inv_1()]),
  )
  let t1590 = @simp.rewrite_tac(
    @list.List([@real.real_pow_zero(), int_neg_eq_0(), int_of_num_eq()]),
  )
  let t1592 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([forall_int_cases(), real_zpow_neg(), real_zpow_num()]),
      ),
      t1590,
    ),
    t1591,
  )
  real_zpow_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Int, zpow(real_of_num(0), n) == (if n == int_of_num(0) { real_of_num(1) } else { real_of_num(0) })"),
      t1592,
    ),
  )
}

///|
let real_zpow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_ZERO")

///|
/// `REAL_ZPOW_ZERO`
pub fn real_zpow_zero() -> @kernel.Thm {
  real_zpow_zero_c.get()
}

///|
/// REAL_ZPOW_POW
fn step_552() -> Unit raise {
  let t1593 = @simp.rewrite_tac(@list.List([real_zpow_neg(), real_zpow_num()]))
  real_zpow_pow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : Real, ∀ n : Num, zpow(x, int_of_num(n)) == pow(x, n)) && (∀ x : Real, ∀ n : Num, zpow(x, -int_of_num(n)) == inv(pow(x, n)))"),
      t1593,
    ),
  )
}

///|
let real_zpow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_POW")

///|
/// `REAL_ZPOW_POW`
pub fn real_zpow_pow() -> @kernel.Thm {
  real_zpow_pow_c.get()
}

///|
/// REAL_INV_ZPOW
fn step_553() -> Unit raise {
  let t1594 = @simp.rewrite_tac(
    @list.List([@real.real_inv_pow(), @real.real_inv_inv()]),
  )
  let t1595 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([forall_int_cases(), real_zpow_pow()])),
    t1594,
  )
  real_inv_zpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, inv(zpow(x, n)) == zpow(inv(x), n)"),
      t1595,
    ),
  )
}

///|
let real_inv_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_ZPOW")

///|
/// `REAL_INV_ZPOW`
pub fn real_inv_zpow() -> @kernel.Thm {
  real_inv_zpow_c.get()
}

///|
/// REAL_ZPOW_INV
fn step_554() -> Unit raise {
  let t1596 = @simp.rewrite_tac(@list.List([real_inv_zpow()]))
  real_zpow_inv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, zpow(inv(x), n) == inv(zpow(x, n))"),
      t1596,
    ),
  )
}

///|
let real_zpow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_INV")

///|
/// `REAL_ZPOW_INV`
pub fn real_zpow_inv() -> @kernel.Thm {
  real_zpow_inv_c.get()
}

///|
/// REAL_ZPOW_ZPOW
fn step_555() -> Unit raise {
  let t1598 = @simp.rewrite_tac(@list.List([@real.real_pow_pow()]))
  let t1597 = @simp.rewrite_tac(
    @list.List([
      real_zpow_pow(),
      @real.real_inv_pow(),
      int_of_num_mul(),
      @real.real_inv_inv(),
    ]),
  )
  let t1599 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          forall_int_cases(),
          int_mul_lneg(),
          int_mul_rneg(),
          int_neg_neg(),
        ]),
      ),
      t1597,
    ),
    t1598,
  )
  real_zpow_zpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Int, ∀ n : Int, zpow(zpow(x, m), n) == zpow(x, m * n)"),
      t1599,
    ),
  )
}

///|
let real_zpow_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_ZPOW")

///|
/// `REAL_ZPOW_ZPOW`
pub fn real_zpow_zpow() -> @kernel.Thm {
  real_zpow_zpow_c.get()
}

///|
/// REAL_ZPOW_MUL
fn step_556() -> Unit raise {
  let t1600 = @simp.rewrite_tac(
    @list.List([
      forall_int_cases(),
      real_zpow_pow(),
      @real.real_pow_mul(),
      @real.real_inv_mul(),
    ]),
  )
  real_zpow_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ n : Int, zpow(x * y, n) == zpow(x, n) * zpow(y, n)"),
      t1600,
    ),
  )
}

///|
let real_zpow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_MUL")

///|
/// `REAL_ZPOW_MUL`
pub fn real_zpow_mul() -> @kernel.Thm {
  real_zpow_mul_c.get()
}

///|
/// REAL_ZPOW_DIV
fn step_557() -> Unit raise {
  let t1601 = @simp.rewrite_tac(
    @list.List([@realax.real_div(), real_inv_zpow(), real_zpow_mul()]),
  )
  real_zpow_div_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ n : Int, zpow(x / y, n) == zpow(x, n) / zpow(y, n)"),
      t1601,
    ),
  )
}

///|
let real_zpow_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_DIV")

///|
/// `REAL_ZPOW_DIV`
pub fn real_zpow_div() -> @kernel.Thm {
  real_zpow_div_c.get()
}

///|
/// REAL_ZPOW_ADD
fn step_558() -> Unit raise {
  let t1630 = @simp.asm_simp_tac(
    @list.List([
      @realax.real_mul_linv(),
      @real.real_pow_eq_0(),
      @realax.real_mul_lid(),
    ]),
  )
  let t1629 = @simp.rewrite_tac(
    @list.List([@real.real_pow_add(), real_zpow_num(), @realax.real_mul_assoc()]),
  )
  let t1627 = arith_rule(@term_syntax.parse_term("-(n : Int) + (n + (m : Int)) == m"))
  let t1628 = @simp.simp_tac(@list.List([@equal.gsym(int_of_num_add()), t1627]))
  let t1626 = @simp.rewrite_tac(
    @list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()]),
  )
  let t1625 = @term_syntax.parse_term("(p : Num)")
  let t1631 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(n : Num)"), t1625]),
          ),
          t1626,
        ),
        t1628,
      ),
      t1629,
    ),
    t1630,
  )
  let t1624 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t1623 = @simp.rewrite_tac(
    @list.List([int_arith(@term_syntax.parse_term("-(-(x : Int) + (y : Int)) == -y + x"))]),
  )
  let t1622 = @simp.rewrite_tac(
    @list.List([
      @real.real_inv_mul(),
      @real.real_inv_inv(),
      @equal.gsym(real_zpow_neg()),
    ]),
  )
  let t1621 = @simp.gen_rewrite_tac(
    fn(
      x1618 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1619 = @equal.land_conv(x1618)
      fn(x1620 : @kernel.Term) -> @kernel.Thm raise { s1619(x1620) }
    },
    @list.List([@equal.gsym(@real.real_eq_inv2())]),
  )
  let t1632 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1621),
          t1622,
        ),
        t1623,
      ),
      t1624,
    ),
    t1631,
  ])
  let t1617 = @tactics.match_mp_tac(@arith.wlog_le())
  let t1616 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t1615 = @simp.gen_rewrite_tac(
    fn(
      x1614 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1608 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1609 = @equal.land_conv(x1608)
        fn(x1610 : @kernel.Term) -> @kernel.Thm raise { s1609(x1610) }
      })(
        (fn(
          x1611 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1612 = @equal.once_depth_conv(x1611)
          fn(x1613 : @kernel.Term) -> @kernel.Thm raise { s1612(x1613) }
        })(x1614),
      )
    },
    @list.List([@realax.real_mul_sym(), int_add_sym()]),
  )
  let t1607 = @simp.gen_rewrite_tac(
    fn(
      x1604 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1605 = @equal.land_conv(x1604)
      fn(x1606 : @kernel.Term) -> @kernel.Thm raise { s1605(x1606) }
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t1603 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1602 = @simp.rewrite_tac(
    @list.List([real_zpow_pow(), @real.real_pow_add(), @real.real_inv_mul()]),
  )
  let t1633 = @tactics.thenl(
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
                        forall_int_cases(),
                        @equal.gsym(int_neg_add()),
                        int_of_num_add(),
                      ]),
                    ),
                    t1602,
                  ),
                  t1603,
                ),
                t1607,
              ),
              t1615,
            ),
            t1616,
          ),
          @tactics.disch_tac,
        ),
        t1617,
      ),
      @tactics.conj_tac,
    ),
    t1632,
  )
  real_zpow_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Int, ∀ n : Int, !(x == real_of_num(0)) → zpow(x, m + n) == zpow(x, m) * zpow(x, n)"),
      t1633,
    ),
  )
}

///|
let real_zpow_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_ADD")

///|
/// `REAL_ZPOW_ADD`
pub fn real_zpow_add() -> @kernel.Thm {
  real_zpow_add_c.get()
}

///|
/// REAL_ZPOW_SUB
fn step_559() -> Unit raise {
  let t1634 = @simp.simp_tac(
    @list.List([
      int_sub_v1(),
      real_zpow_add(),
      real_zpow_neg(),
      @realax.real_div(),
    ]),
  )
  real_zpow_sub_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ m : Int, ∀ n : Int, !(x == real_of_num(0)) → zpow(x, m - n) == zpow(x, m) / zpow(x, n)"),
      t1634,
    ),
  )
}

///|
let real_zpow_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_SUB")

///|
/// `REAL_ZPOW_SUB`
pub fn real_zpow_sub() -> @kernel.Thm {
  real_zpow_sub_c.get()
}

///|
/// REAL_ZPOW_LE
fn step_560() -> Unit raise {
  let t1635 = @simp.simp_tac(
    @list.List([
      forall_int_cases(),
      real_zpow_pow(),
      @real.real_le_inv_eq(),
      @real.real_pow_le(),
    ]),
  )
  real_zpow_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, real_of_num(0) <= x → real_of_num(0) <= zpow(x, n)"),
      t1635,
    ),
  )
}

///|
let real_zpow_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_LE")

///|
/// `REAL_ZPOW_LE`
pub fn real_zpow_le() -> @kernel.Thm {
  real_zpow_le_c.get()
}

///|
/// REAL_ZPOW_LT
fn step_561() -> Unit raise {
  let t1636 = @simp.simp_tac(
    @list.List([
      forall_int_cases(),
      real_zpow_pow(),
      @real.real_lt_inv_eq(),
      @real.real_pow_lt(),
    ]),
  )
  real_zpow_lt_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Int, real_of_num(0) < x → real_of_num(0) < zpow(x, n)"), t1636),
  )
}

///|
let real_zpow_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_LT")

///|
/// `REAL_ZPOW_LT`
pub fn real_zpow_lt() -> @kernel.Thm {
  real_zpow_lt_c.get()
}

///|
/// REAL_ZPOW_EQ_0
fn step_562() -> Unit raise {
  let t1637 = @simp.rewrite_tac(
    @list.List([int_neg_eq_0(), @real.real_pow_eq_0(), int_of_num_eq()]),
  )
  let t1638 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([forall_int_cases(), real_zpow_pow(), @real.real_inv_eq_0()]),
    ),
    t1637,
  )
  real_zpow_eq_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, (zpow(x, n) == real_of_num(0)) == (x == real_of_num(0) && !(n == int_of_num(0)))"),
      t1638,
    ),
  )
}

///|
let real_zpow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ZPOW_EQ_0")

///|
/// `REAL_ZPOW_EQ_0`
pub fn real_zpow_eq_0() -> @kernel.Thm {
  real_zpow_eq_0_c.get()
}

///|
/// REAL_ABS_ZPOW
fn step_563() -> Unit raise {
  let t1639 = @simp.rewrite_tac(
    @list.List([
      forall_int_cases(),
      real_zpow_pow(),
      @real.real_abs_inv(),
      @real.real_abs_pow(),
    ]),
  )
  real_abs_zpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, abs(zpow(x, n)) == zpow(abs(x), n)"),
      t1639,
    ),
  )
}

///|
let real_abs_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ABS_ZPOW")

///|
/// `REAL_ABS_ZPOW`
pub fn real_abs_zpow() -> @kernel.Thm {
  real_abs_zpow_c.get()
}

///|
/// REAL_SGN_ZPOW
fn step_564() -> Unit raise {
  let t1641 = @simp.rewrite_tac(
    @list.List([@real.real_sgn_inv(), @real.real_inv_sgn()]),
  )
  let t1640 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sgn_pow())]))
  let t1642 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([forall_int_cases(), real_zpow_pow()])),
      t1640,
    ),
    t1641,
  )
  real_sgn_zpow_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Real, ∀ n : Int, real_sgn(zpow(x, n)) == zpow(real_sgn(x), n)"),
      t1642,
    ),
  )
}

///|
let real_sgn_zpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SGN_ZPOW")

///|
/// `REAL_SGN_ZPOW`
pub fn real_sgn_zpow() -> @kernel.Thm {
  real_sgn_zpow_c.get()
}

///|
/// int.ml:2765
fn step_565() -> Unit raise {
  @realax.prioritize_num(())
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
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
  step_298()
  step_299()
  step_300()
  step_301()
  step_302()
  step_303()
  step_304()
  step_305()
  step_306()
  step_307()
  step_308()
  step_309()
  step_310()
  step_311()
  step_312()
  step_313()
  step_314()
  step_315()
  step_316()
  step_317()
  step_318()
  step_319()
  step_320()
  step_321()
  step_322()
  step_323()
  step_324()
  step_325()
  step_326()
  step_327()
  step_328()
  step_329()
  step_330()
  step_331()
  step_332()
  step_333()
  step_334()
  step_335()
  step_336()
  step_337()
  step_338()
  step_339()
  step_340()
  step_341()
  step_342()
  step_343()
  step_344()
  step_345()
  step_346()
  step_347()
  step_348()
  step_349()
  step_350()
  step_351()
  step_352()
  step_353()
  step_354()
  step_355()
  step_356()
  step_357()
  step_358()
  step_359()
  step_360()
  step_361()
  step_362()
  step_363()
  step_364()
  step_365()
  step_366()
  step_367()
  step_368()
  step_369()
  step_370()
  step_371()
  step_372()
  step_373()
  step_374()
  step_375()
  step_376()
  step_377()
  step_378()
  step_379()
  step_380()
  step_381()
  step_382()
  step_383()
  step_384()
  step_385()
  step_386()
  step_387()
  step_388()
  step_389()
  step_390()
  step_391()
  step_392()
  step_393()
  step_394()
  step_395()
  step_396()
  step_397()
  step_398()
  step_399()
  step_400()
  step_401()
  step_402()
  step_403()
  step_404()
  step_405()
  step_406()
  step_407()
  step_408()
  step_409()
  step_410()
  step_411()
  step_412()
  step_413()
  step_414()
  step_415()
  step_416()
  step_417()
  step_418()
  step_419()
  step_420()
  step_421()
  step_422()
  step_423()
  step_424()
  step_425()
  step_426()
  step_427()
  step_428()
  step_429()
  step_430()
  step_431()
  step_432()
  step_433()
  step_434()
  step_435()
  step_436()
  step_437()
  step_438()
  step_439()
  step_440()
  step_441()
  step_442()
  step_443()
  step_444()
  step_445()
  step_446()
  step_447()
  step_448()
  step_449()
  step_450()
  step_451()
  step_452()
  step_453()
  step_454()
  step_455()
  step_456()
  step_457()
  step_458()
  step_459()
  step_460()
  step_461()
  step_462()
  step_463()
  step_464()
  step_465()
  step_466()
  step_467()
  step_468()
  step_469()
  step_470()
  step_471()
  step_472()
  step_473()
  step_474()
  step_475()
  step_476()
  step_477()
  step_478()
  step_479()
  step_480()
  step_481()
  step_482()
  step_483()
  step_484()
  step_485()
  step_486()
  step_487()
  step_488()
  step_489()
  step_490()
  step_491()
  step_492()
  step_493()
  step_494()
  step_495()
  step_496()
  step_497()
  step_498()
  step_499()
  step_500()
  step_501()
  step_502()
  step_503()
  step_504()
  step_505()
  step_506()
  step_507()
  step_508()
  step_509()
  step_510()
  step_511()
  step_512()
  step_513()
  step_514()
  step_515()
  step_516()
  step_517()
  step_518()
  step_519()
  step_520()
  step_521()
  step_522()
  step_523()
  step_524()
  step_525()
  step_526()
  step_527()
  step_528()
  step_529()
  step_530()
  step_531()
  step_532()
  step_533()
  step_534()
  step_535()
  step_536()
  step_537()
  step_538()
  step_539()
  step_540()
  step_541()
  step_542()
  step_543()
  step_544()
  step_545()
  step_546()
  step_547()
  step_548()
  step_549()
  step_550()
  step_551()
  step_552()
  step_553()
  step_554()
  step_555()
  step_556()
  step_557()
  step_558()
  step_559()
  step_560()
  step_561()
  step_562()
  step_563()
  step_564()
  step_565()
}
