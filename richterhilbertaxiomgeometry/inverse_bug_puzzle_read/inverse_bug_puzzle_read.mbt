// Translated from upstream RichterHilbertAxiomGeometry/inverse_bug_puzzle_read.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/inverse_bug_puzzle_read.ml:22
fn step_1() -> Unit raise {
  @preterm.new_type_abbrev("triple", @term_syntax.parse_type("(Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])"))
}

///|
/// VEC2_TAC
fn step_2() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  vec2_tac_c.set(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @vectors.forall_2(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_2(), @vectors.vector_add(), @vectors.vec(), @vectors.dot(), @vectors.orthogonal(), @vectors.basis(), @vectors.vector_neg(), @vectors.vector_sub(), @vectors.vector_mul(), @calc_num.arith()])), t1))
}

///|
let vec2_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VEC2_TAC")

///|
/// `VEC2_TAC`
pub fn vec2_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vec2_tac_c.get())(x)
}

///|
/// oriented_area
fn step_3() -> Unit raise {
  oriented_area_c.set(@pair.new_definition(@term_syntax.parse_term("(oriented_area : ((Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])) -> Real)(((a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2]))) == ((op_dollar(b, 1) - op_dollar(a, 1)) * (op_dollar(c, 2) - op_dollar(a, 2)) - (op_dollar(c, 1) - op_dollar(a, 1)) * (op_dollar(b, 2) - op_dollar(a, 2))) / real_of_num(2)")))
}

///|
let oriented_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oriented_area")

///|
/// `oriented_area`
pub fn oriented_area() -> @kernel.Thm {
  oriented_area_c.get()
}

///|
/// move
fn step_4() -> Unit raise {
  move__c.set(@pair.new_definition(
    // `move` is a MoonBit keyword, which the term syntax cannot name yet
    @preterm.term_of_preterm(
      @preterm.retypecheck(@list.List([]), @parser.parse_preterm(@lexer.lex("\n  forall A B C A' B' C':real^2. move (A,B,C) (A',B',C') <=>\n  (B = B' /\\  C = C' /\\  collinear {vec 0,C - B,A' - A} \\/\n  A = A' /\\  C = C' /\\  collinear {vec 0,C - A,B' - B} \\/\n  A = A' /\\  B = B' /\\  collinear {vec 0,B - A,C' - C})")).0),
    ),
  ))
}

///|
let move__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("move")

///|
/// `move`
pub fn move_() -> @kernel.Thm {
  move__c.get()
}

///|
/// reachable
fn step_5() -> Unit raise {
  reachable_c.set(@readable.newdefinition("∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), (reachable : ((Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])) -> Bool)(p, p') == (∃ n : Num, ∃ s : (Num) -> (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), s(0) == p && s(n) == p' && (∀ m : Num, 0 <= m && m < n → op_move(s(m), s(SUC(m)))))"))
}

///|
let reachable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachable")

///|
/// `reachable`
pub fn reachable() -> @kernel.Thm {
  reachable_c.get()
}

///|
/// reachableN
fn step_6() -> Unit raise {
  reachablen_c.set(@readable.newdefinition("∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ n : Num, (reachableN : ((Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), Num) -> Bool)(p, p', n) == (∃ s : (Num) -> (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), s(0) == p && s(n) == p' && (∀ m : Num, 0 <= m && m < n → op_move(s(m), s(SUC(m)))))"))
}

///|
let reachablen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN")

///|
/// `reachableN`
pub fn reachablen() -> @kernel.Thm {
  reachablen_c.get()
}

///|
/// move2Cond
fn step_7() -> Unit raise {
  move2cond_c.set(@readable.newdefinition("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], (move2Cond : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]) -> Bool)(A, B, A', B') == (!collinear({B, A, A'}) && !collinear({A', B, B'}) || !collinear({A, B, B'}) && !collinear({B', A, A'}))"))
}

///|
let move2cond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("move2Cond")

///|
/// `move2Cond`
pub fn move2cond() -> @kernel.Thm {
  move2cond_c.get()
}

///|
/// oriented_areaSymmetry
fn step_8() -> Unit raise {
  oriented_areasymmetry_c.set(@readable.prove(
    "oriented_area(((A : Cart[Real, 2]), (B : Cart[Real, 2]), (C : Cart[Real, 2]))) == oriented_area(((A' : Cart[Real, 2]), (B' : Cart[Real, 2]), (C' : Cart[Real, 2]))) → oriented_area((B, C, A)) == oriented_area((B', C', A')) && oriented_area((C, A, B)) == oriented_area((C', A', B')) && oriented_area((A, C, B)) == oriented_area((A', C', B')) && oriented_area((B, A, C)) == oriented_area((B', A', C')) && oriented_area((C, B, A)) == oriented_area((C', B', A'))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("oriented_area", () => oriented_area())],
        ),
        vec2_tac,
      ],
    ),
  ))
}

///|
let oriented_areasymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oriented_areaSymmetry")

///|
/// `oriented_areaSymmetry`
pub fn oriented_areasymmetry() -> @kernel.Thm {
  oriented_areasymmetry_c.get()
}

///|
/// COLLINEAR_3_2Dzero
fn step_12() -> Unit raise {
  collinear_3_2dzero_c.set(@readable.prove(
    "∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], collinear({vec(0), y, z}) == (op_dollar(z, 1) * op_dollar(y, 2) == op_dollar(y, 1) * op_dollar(z, 2))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("COLLINEAR_3_2D", () => @vectors.collinear_3_2d())],
        ),
        vec2_tac,
      ],
    ),
  ))
}

///|
let collinear_3_2dzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_3_2Dzero")

///|
/// `COLLINEAR_3_2Dzero`
pub fn collinear_3_2dzero() -> @kernel.Thm {
  collinear_3_2dzero_c.get()
}

///|
/// Noncollinear_3ImpliesDistinct
fn step_14() -> Unit raise {
  noncollinear_3impliesdistinct_c.set(@readable.prove(
    "!collinear({(a : Cart[Real, _]), (b : Cart[Real, _]), (c : Cart[Real, _])}) → !(a == b) && !(a == c) && !(b == c)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm(
          "COLLINEAR_BETWEEN_CASES",
          () => @vectors.collinear_between_cases(),
        ),
        @readable.Thm("BETWEEN_REFL", () => @vectors.between_refl()),
      ],
    ),
  ))
}

///|
let noncollinear_3impliesdistinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Noncollinear_3ImpliesDistinct")

///|
/// `Noncollinear_3ImpliesDistinct`
pub fn noncollinear_3impliesdistinct() -> @kernel.Thm {
  noncollinear_3impliesdistinct_c.get()
}

///|
/// collinearSymmetry
fn step_18() -> Unit raise {
  collinearsymmetry_c.set(@readable.prove(
    "collinear({(A : Cart[Real, _]), (B : Cart[Real, _]), (C : Cart[Real, _])}) → collinear({A, C, B}) && collinear({B, A, C}) && collinear({B, C, A}) && collinear({C, A, B}) && collinear({C, B, A})",
    @readable.steps(
      [
        @readable.have(
          "SUBSET({A, C, B}, {A, B, C}) && SUBSET({B, A, C}, {A, B, C}) && SUBSET({B, C, A}, {A, B, C}) && SUBSET({C, A, B}, {A, B, C}) && SUBSET({C, B, A}, {A, B, C})",
          "",
          @readable.by(@readable.set, []),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let collinearsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("collinearSymmetry")

///|
/// `collinearSymmetry`
pub fn collinearsymmetry() -> @kernel.Thm {
  collinearsymmetry_c.get()
}

///|
/// Noncollinear_2Span
fn step_21() -> Unit raise {
  noncollinear_2span_c.set(@readable.prove(
    "∀ u : Cart[Real, 2], ∀ v : Cart[Real, 2], ∀ w : Cart[Real, 2], !collinear({vec(0), v, w}) → (∃ s : Real, ∃ t : Real, op_pct(s, v) + op_pct(t, w) == u)",
    @readable.steps(
      [
        @readable.intro_tac("forall u v w, H1"),
        @readable.have(
          "!(op_dollar(v, 1) * op_dollar(w, 2) - op_dollar(w, 1) * op_dollar(v, 2) == real_of_num(0))",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("COLLINEAR_3_2Dzero", () => collinear_3_2dzero()),
              @readable.Thm("REAL_SUB_0", () => @realarith.real_sub_0()),
            ],
          ),
        ),
        @readable.consider(
          "M",
          "∃ M : Cart[Cart[Real, 2], 2], M == transp(vector([v, w]))",
          "Mexists",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.have(
          "!(det(M) == real_of_num(0)) && (∀ x : Cart[Real, 2], op_dollar(matrix_vector_mul(M, x), 1) == op_dollar(v, 1) * op_dollar(x, 1) + op_dollar(w, 1) * op_dollar(x, 2) && op_dollar(matrix_vector_mul(M, x), 2) == op_dollar(v, 2) * op_dollar(x, 1) + op_dollar(w, 2) * op_dollar(x, 2))",
          "MatMult",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("H1'"),
              @readable.Label("Mexists"),
              @readable.Thm("matrix_vector_mul", () => @vectors.matrix_vector_mul()),
              @readable.Thm("DIMINDEX_2", () => @cart.dimindex_2()),
              @readable.Thm("SUM_2", () => @vectors.sum_2()),
              @readable.Thm("TRANSP_COMPONENT", () => @vectors.transp_component()),
              @readable.Thm("VECTOR_2", () => @vectors.vector_2()),
              @readable.Thm("LAMBDA_BETA", () => @cart.lambda_beta()),
              @readable.Thm("ARITH", () => @calc_num.arith()),
              @readable.Thm("CART_EQ", () => @cart.cart_eq()),
              @readable.Thm("FORALL_2", () => @vectors.forall_2()),
              @readable.Thm("DET_2", () => @determinants.det_2()),
            ],
          ),
        ),
        @readable.have(
          "∀ r : Num, ∀ n : Num, !(r < n) && r <= MIN(n, n) → r == n",
          "",
          @readable.by(@readable.arithmetic, []),
        ),
        @readable.consider(
          "x",
          "∃ x : Cart[Real, 2], matrix_vector_mul(M, x) == u",
          "xDef",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MatMult"),
              @readable.Prev,
              @readable.Thm("DET_EQ_0_RANK", () => @determinants.det_eq_0_rank()),
              @readable.Thm("RANK_BOUND", () => @vectors.rank_bound()),
              @readable.Thm(
                "MATRIX_FULL_LINEAR_EQUATIONS",
                () => @vectors.matrix_full_linear_equations(),
              ),
            ],
          ),
        ),
        @readable.exists("op_dollar(x, 1)"),
        @readable.exists("op_dollar(x, 2)"),
        @readable.have(
          "op_dollar(x, 1) * op_dollar(v, 1) + op_dollar(x, 2) * op_dollar(w, 1) == op_dollar(u, 1) && op_dollar(x, 1) * op_dollar(v, 2) + op_dollar(x, 2) * op_dollar(w, 2) == op_dollar(u, 2)",
          "xDef",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MatMult"),
              @readable.Label("xDef"),
              @readable.Thm("REAL_MUL_SYM", () => @realax.real_mul_sym()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Prev,
            @readable.Thm("CART_EQ", () => @cart.cart_eq()),
            @readable.Thm("LAMBDA_BETA", () => @cart.lambda_beta()),
            @readable.Thm("FORALL_2", () => @vectors.forall_2()),
            @readable.Thm("SUM_2", () => @vectors.sum_2()),
            @readable.Thm("DIMINDEX_2", () => @cart.dimindex_2()),
            @readable.Thm("VECTOR_2", () => @vectors.vector_2()),
            @readable.Thm("vector_add", () => @vectors.vector_add()),
            @readable.Thm("vector_mul", () => @vectors.vector_mul()),
            @readable.Thm("ARITH", () => @calc_num.arith()),
          ],
        ),
      ],
    ),
  ))
}

///|
let noncollinear_2span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Noncollinear_2Span")

///|
/// `Noncollinear_2Span`
pub fn noncollinear_2span() -> @kernel.Thm {
  noncollinear_2span_c.get()
}

///|
/// moveInvariant
fn step_42() -> Unit raise {
  moveinvariant_c.set(@readable.prove(
    "∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), op_move(p, p') → oriented_area(p) == oriented_area(p')",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("move", () => move_()),
            @readable.Thm("oriented_area", () => oriented_area()),
            @readable.Thm("COLLINEAR_LEMMA", () => @vectors.collinear_lemma()),
            @readable.Thm("vector_mul", () => @vectors.vector_mul()),
          ],
        ),
        vec2_tac,
      ],
    ),
  ))
}

///|
let moveinvariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("moveInvariant")

///|
/// `moveInvariant`
pub fn moveinvariant() -> @kernel.Thm {
  moveinvariant_c.get()
}

///|
/// ReachLemma
fn step_46() -> Unit raise {
  reachlemma_c.set(@readable.prove(
    "∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachable(p, p') == (∃ n : Num, reachableN(p, p', n))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("reachable", () => reachable()),
            @readable.Thm("reachableN", () => reachablen()),
          ],
        ),
      ],
    ),
  ))
}

///|
let reachlemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ReachLemma")

///|
/// `ReachLemma`
pub fn reachlemma() -> @kernel.Thm {
  reachlemma_c.get()
}

///|
/// reachableN_CLAUSES
fn step_49() -> Unit raise {
  reachablen_clauses_c.set(@readable.prove(
    "∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachableN(p, p', 0) == (p == p') && (∀ n : Num, reachableN(p, p', SUC(n)) == (∃ q : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachableN(p, q, n) && op_move(q, p')))",
    @readable.steps(
      [
        @readable.intro_tac("forall p p'"),
        @readable.consider(
          "s0",
          "∃ s0 : (Num) -> (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), s0 == ((m : Num) => p)",
          "s0exists",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "reachableN(p, p', 0) == (p == p')",
          "0CLAUSE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("s0exists"),
              @readable.Thm("LE_0", () => @arith.le_0()),
              @readable.Thm("reachableN", () => reachablen()),
              @readable.Thm("LT", () => @arith.lt()),
            ],
          ),
        ),
        @readable.have(
          "∀ n : Num, reachableN(p, p', SUC(n)) → (∃ q : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachableN(p, q, n) && op_move(q, p'))",
          "Imp1",
          @readable.steps(
            [
              @readable.intro_tac("forall n, H1"),
              @readable.consider(
                "s",
                "∃ s : (Num) -> (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), s(0) == p && s(SUC(n)) == p' && (∀ m : Num, m < SUC(n) → op_move(s(m), s(SUC(m))))",
                "sDef",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Thm("LE_0", () => @arith.le_0()),
                    @readable.Thm("reachableN", () => reachablen()),
                  ],
                ),
              ),
              @readable.consider(
                "q",
                "∃ q : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), q == s(n)",
                "qDef",
                @readable.by(@readable.fol, []),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("sDef"),
                  @readable.Label("qDef"),
                  @readable.Thm("LE_0", () => @arith.le_0()),
                  @readable.Thm("reachableN", () => reachablen()),
                  @readable.Thm("LT", () => @arith.lt()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "∀ n : Num, (∃ q : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachableN(p, q, n) && op_move(q, p')) → reachableN(p, p', SUC(n))",
          "Imp2",
          @readable.steps(
            [
              @readable.intro_tac("forall n"),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("IMP_CONJ", () => @theorems.imp_conj()),
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall q, nReach, move_qp'"),
              @readable.consider(
                "s",
                "∃ s : (Num) -> (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), s(0) == p && s(n) == q && (∀ m : Num, m < n → op_move(s(m), s(SUC(m))))",
                "sDef",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("nReach"),
                    @readable.Thm("reachableN", () => reachablen()),
                    @readable.Thm("LT", () => @arith.lt()),
                    @readable.Thm("LE_0", () => @arith.le_0()),
                  ],
                ),
              ),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("reachableN", () => reachablen()),
                  @readable.Thm("LT", () => @arith.lt()),
                  @readable.Thm("LE_0", () => @arith.le_0()),
                ],
              ),
              @readable.exists("(m : Num) => if m < SUC(n) { s(m) } else { p' }"),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("sDef"),
                  @readable.Label("move_qp'"),
                  @readable.Thm("LT_0", () => @arith.lt_0()),
                  @readable.Thm("LT_REFL", () => @arith.lt_refl()),
                  @readable.Thm("LT", () => @arith.lt()),
                  @readable.Thm("LT_SUC", () => @arith.lt_suc()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("0CLAUSE"), @readable.Label("Imp1"), @readable.Label("Imp2")],
        ),
      ],
    ),
  ))
}

///|
let reachablen_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_CLAUSES")

///|
/// `reachableN_CLAUSES`
pub fn reachablen_clauses() -> @kernel.Thm {
  reachablen_clauses_c.get()
}

///|
/// reachableInvariant
fn step_57() -> Unit raise {
  reachableinvariant_c.set(@readable.prove(
    "∀ p : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∀ p' : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), reachable(p, p') → oriented_area(p) == oriented_area(p')",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("ReachLemma", () => reachlemma()),
            @readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm()),
            @readable.Thm("SWAP_FORALL_THM", () => @theorems.swap_forall_thm()),
          ],
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("num_INDUCTION", () => @nums.num_induction()),
        ),
        @readable.by(
          @readable.simplify,
          [@readable.Thm("reachableN_CLAUSES", () => reachablen_clauses())],
        ),
        @readable.intro_tac("forall n, nStep"),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("nStep"),
            @readable.Thm("moveInvariant", () => moveinvariant()),
          ],
        ),
      ],
    ),
  ))
}

///|
let reachableinvariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableInvariant")

///|
/// `reachableInvariant`
pub fn reachableinvariant() -> @kernel.Thm {
  reachableinvariant_c.get()
}

///|
/// reachableN_One
fn step_64() -> Unit raise {
  reachablen_one_c.set(@readable.prove(
    "reachableN((P0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), (P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), 1) == op_move(P0, P1)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ONE", () => @arith.one()),
        @readable.Thm("reachableN", () => reachablen()),
        @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
      ],
    ),
  ))
}

///|
let reachablen_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_One")

///|
/// `reachableN_One`
pub fn reachablen_one() -> @kernel.Thm {
  reachablen_one_c.get()
}

///|
/// reachableN_Two
fn step_66() -> Unit raise {
  reachablen_two_c.set(@readable.prove(
    "reachableN((P0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), (P2 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), 2) == (∃ P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), op_move(P0, P1) && op_move(P1, P2))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("TWO", () => @arith.two()),
        @readable.Thm("reachableN_One", () => reachablen_one()),
        @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
      ],
    ),
  ))
}

///|
let reachablen_two_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_Two")

///|
/// `reachableN_Two`
pub fn reachablen_two() -> @kernel.Thm {
  reachablen_two_c.get()
}

///|
/// reachableN_Three
fn step_69() -> Unit raise {
  reachablen_three_c.set(@readable.prove(
    "reachableN((P0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), (P3 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), 3) == (∃ P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P2 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), op_move(P0, P1) && op_move(P1, P2) && op_move(P2, P3))",
    @readable.by(
      @readable.fol,
      [
        @readable.TermRule(@int.arith_rule, "3 == SUC(2)"),
        @readable.Thm("reachableN_Two", () => reachablen_two()),
        @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
      ],
    ),
  ))
}

///|
let reachablen_three_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_Three")

///|
/// `reachableN_Three`
pub fn reachablen_three() -> @kernel.Thm {
  reachablen_three_c.get()
}

///|
/// reachableN_Four
fn step_72() -> Unit raise {
  reachablen_four_c.set(@readable.prove(
    "reachableN((P0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), (P4 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), 4) == (∃ P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P2 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P3 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), op_move(P0, P1) && op_move(P1, P2) && op_move(P2, P3) && op_move(P3, P4))",
    @readable.by(
      @readable.fol,
      [
        @readable.TermRule(@int.arith_rule, "4 == SUC(3)"),
        @readable.Thm("reachableN_Three", () => reachablen_three()),
        @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
      ],
    ),
  ))
}

///|
let reachablen_four_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_Four")

///|
/// `reachableN_Four`
pub fn reachablen_four() -> @kernel.Thm {
  reachablen_four_c.get()
}

///|
/// reachableN_Five
fn step_74() -> Unit raise {
  reachablen_five_c.set(@readable.prove(
    "reachableN((P0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), (P5 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2])), 5) == (∃ P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P2 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P3 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P4 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), op_move(P0, P1) && op_move(P1, P2) && op_move(P2, P3) && op_move(P3, P4) && op_move(P4, P5))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.TermRule(@int.arith_rule, "5 == SUC(4)"),
            @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("reachableN_Four", () => reachablen_four())],
        ),
      ],
    ),
  ))
}

///|
let reachablen_five_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN_Five")

///|
/// `reachableN_Five`
pub fn reachablen_five() -> @kernel.Thm {
  reachablen_five_c.get()
}

///|
/// moveSymmetry
fn step_76() -> Unit raise {
  movesymmetry_c.set(@readable.prove(
    "op_move(((A : Cart[Real, 2]), (B : Cart[Real, 2]), (C : Cart[Real, 2])), ((A' : Cart[Real, 2]), (B' : Cart[Real, 2]), (C' : Cart[Real, 2]))) → op_move((B, C, A), (B', C', A')) && op_move((C, A, B), (C', A', B')) && op_move((A, C, B), (A', C', B')) && op_move((B, A, C), (B', A', C')) && op_move((C, B, A), (C', B', A'))",
    @readable.steps(
      [
        @readable.have(
          "∀ X : Cart[Real, 2], ∀ Y : Cart[Real, 2], ∀ Z : Cart[Real, 2], ∀ X' : Cart[Real, 2], collinear({vec(0), Z - Y, X' - X}) → collinear({vec(0), Y - Z, X' - X})",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [@readable.Thm("COLLINEAR_3_2Dzero", () => collinear_3_2dzero())],
              ),
              vec2_tac,
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(@readable.rewrite, [@readable.Thm("move", () => move_())]),
        @readable.have(
          "∀ X : Cart[Real, 2], ∀ Y : Cart[Real, 2], ∀ Z : Cart[Real, 2], ∀ X' : Cart[Real, 2], collinear({vec(0), Z - Y, X' - X}) → collinear({vec(0), Y - Z, X' - X})",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [@readable.Thm("COLLINEAR_3_2Dzero", () => collinear_3_2dzero())],
              ),
              vec2_tac,
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(@readable.rewrite, [@readable.Thm("move", () => move_())]),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let movesymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("moveSymmetry")

///|
/// `moveSymmetry`
pub fn movesymmetry() -> @kernel.Thm {
  movesymmetry_c.get()
}

///|
/// reachableNSymmetry
fn step_78() -> Unit raise {
  reachablensymmetry_c.set(@readable.prove(
    "∀ n : Num, ∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], reachableN((A, B, C), (A', B', C'), n) → reachableN((B, C, A), (B', C', A'), n) && reachableN((C, A, B), (C', A', B'), n) && reachableN((A, C, B), (A', C', B'), n) && reachableN((B, A, C), (B', A', C'), n) && reachableN((C, B, A), (C', B', A'), n)",
    @readable.steps(
      [
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("num_INDUCTION", () => @nums.num_induction()),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("reachableN_CLAUSES", () => reachablen_clauses())],
        ),
        @readable.by(
          @readable.simplify,
          [@readable.Thm("PAIR_EQ", () => @pair.pair_eq())],
        ),
        @readable.intro_tac("forall n, nStep, forall A B C A' B' C'"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm()),
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
          ],
        ),
        @readable.intro_tac("forall [X] [Y] [Z], XYZexists"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm(
              "RIGHT_AND_EXISTS_THM",
              () => @theorems.right_and_exists_thm(),
            ),
            @readable.Thm("LEFT_AND_EXISTS_THM", () => @theorems.left_and_exists_thm()),
          ],
        ),
        @readable.exists("(Y, Z, X)"),
        @readable.exists("(Z, X, Y)"),
        @readable.exists("(X, Z, Y)"),
        @readable.exists("(Y, X, Z)"),
        @readable.exists("(Z, Y, X)"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("nStep"),
            @readable.Label("XYZexists"),
            @readable.Thm("moveSymmetry", () => movesymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let reachablensymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableNSymmetry")

///|
/// `reachableNSymmetry`
pub fn reachablensymmetry() -> @kernel.Thm {
  reachablensymmetry_c.get()
}

///|
/// ORIENTED_AREA_COLLINEAR_CONG
fn step_83() -> Unit raise {
  oriented_area_collinear_cong_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : _, ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C : Cart[Real, 2], oriented_area((A, B, C)) == oriented_area((A', B', (C' : Cart[Real, 2]))) → collinear({A, B, C}) == collinear({A', B', C'})",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("COLLINEAR_3_2D", () => @vectors.collinear_3_2d()),
            @readable.Thm("oriented_area", () => oriented_area()),
          ],
        ),
        @readable.by(@readable.real_ring, []),
      ],
    ),
  ))
}

///|
let oriented_area_collinear_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORIENTED_AREA_COLLINEAR_CONG")

///|
/// `ORIENTED_AREA_COLLINEAR_CONG`
pub fn oriented_area_collinear_cong() -> @kernel.Thm {
  oriented_area_collinear_cong_c.get()
}

///|
/// Basic2move_THM
fn step_85() -> Unit raise {
  basic2move_thm_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({B, A, A'}) → (∃ X : Cart[Real, 2], op_move((A, B, C), (A, B, X)) && op_move((A, B, X), (A', B, X)))",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A', H1 H2"),
        @readable.have(
          "∀ r : Real, op_pct(r, A - B) == op_pct(-r, B - A) && op_pct(r, A - B) == op_pct(r, A - B) + op_pct(real_of_num(0), C - B)",
          "add0vector_mul",
          vec2_tac,
        ),
        @readable.have(
          "!(∃ r : Real, A' - A == op_pct(r, A - B))",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("COLLINEAR_3", () => @vectors.collinear_3()),
              @readable.Thm("COLLINEAR_LEMMA", () => @vectors.collinear_lemma()),
            ],
          ),
        ),
        @readable.consider(
          "r t",
          "∃ r : Real, ∃ t : Real, A' - A == op_pct(r, A - B) + op_pct(t, C - B)",
          "rExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("COLLINEAR_3", () => @vectors.collinear_3()),
              @readable.Thm("Noncollinear_2Span", () => noncollinear_2span()),
            ],
          ),
        ),
        @readable.have(
          "!(t == real_of_num(0))",
          "tNonzero",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Label("add0vector_mul"), @readable.Label("H2'")],
          ),
        ),
        @readable.consider(
          "s X",
          "∃ s : Real, ∃ X : Cart[Real, 2], s == r / t && X == C + op_pct(s, A - B)",
          "Xexists",
          @readable.by(@readable.fol, [@readable.Label("rExists")]),
        ),
        @readable.have(
          "A' - A == op_pct(t * s, A - B) + op_pct(t, C - B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("rExists"),
              @readable.Label("tNonzero"),
              @readable.Thm("REAL_DIV_LMUL", () => @real.real_div_lmul()),
            ],
          ),
        ),
        @readable.have(
          "A' - A == op_pct(t, X - B) && X - C == op_pct(-s, B - A)",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [@readable.Prev, @readable.Label("Xexists")],
              ),
              vec2_tac,
            ],
          ),
        ),
        @readable.have(
          "collinear({vec(0), B - A, X - C}) && collinear({vec(0), X - B, A' - A})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("COLLINEAR_LEMMA", () => @vectors.collinear_lemma()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("move", () => move_())],
        ),
      ],
    ),
  ))
}

///|
let basic2move_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Basic2move_THM")

///|
/// `Basic2move_THM`
pub fn basic2move_thm() -> @kernel.Thm {
  basic2move_thm_c.get()
}

///|
/// FourStepMoveAB
fn step_89() -> Unit raise {
  fourstepmoveab_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], !collinear({A, B, C}) → !collinear({B, A, A'}) && !collinear({A', B, B'}) → (∃ X : Cart[Real, 2], ∃ Y : Cart[Real, 2], op_move((A, B, C), (A, B, X)) && op_move((A, B, X), (A', B, X)) && op_move((A', B, X), (A', B, Y)) && op_move((A', B, Y), (A', B', Y)))",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B', H1, H2"),
        @readable.consider(
          "X",
          "∃ X : Cart[Real, 2], op_move((A, B, C), (A, B, X)) && op_move((A, B, X), (A', B, X))",
          "ABX",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("Basic2move_THM", () => basic2move_thm()),
            ],
          ),
        ),
        @readable.have(
          "!collinear({A, B, X}) && !collinear({A', B, X})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("moveInvariant", () => moveinvariant()),
              @readable.Thm(
                "ORIENTED_AREA_COLLINEAR_CONG",
                () => oriented_area_collinear_cong(),
              ),
            ],
          ),
        ),
        @readable.have(
          "!collinear({B, A', X})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "Y",
          "∃ Y : Cart[Real, 2], op_move((B, A', X), (B, A', Y)) && op_move((B, A', Y), (B', A', Y))",
          "BA'Y",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("Basic2move_THM", () => basic2move_thm()),
            ],
          ),
        ),
        @readable.have(
          "op_move((A', B, X), (A', B, Y)) && op_move((A', B, Y), (A', B', Y))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BA'Y"),
              @readable.Thm("moveSymmetry", () => movesymmetry()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("ABX")]),
      ],
    ),
  ))
}

///|
let fourstepmoveab_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourStepMoveAB")

///|
/// `FourStepMoveAB`
pub fn fourstepmoveab() -> @kernel.Thm {
  fourstepmoveab_c.get()
}

///|
/// FourStepMoveABBAreach
fn step_93() -> Unit raise {
  fourstepmoveabbareach_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], !collinear({A, B, C}) && move2Cond(A, B, A', B') → (∃ Y : Cart[Real, 2], reachableN((A, B, C), (A', B', Y), 4))",
    @readable.steps_then(
      [@readable.intro_tac("forall A B C A' B', H1 H2")],
      @readable.case_split(
        "Case1 | Case2    ",
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H2"),
            @readable.Thm("move2Cond", () => move2cond()),
          ],
        ),
        @list.List(["!collinear({B, A, A'}) && !collinear({A', B, B'})", "!collinear({A, B, B'}) && !collinear({B', A, A'})"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Thm("FourStepMoveAB", () => fourstepmoveab()),
                    @readable.Thm("reachableN_Four", () => reachablen_four()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "!collinear({B, A, C})",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.consider(
                  "X Y",
                  "∃ X : Cart[Real, 2], ∃ Y : Cart[Real, 2], op_move((B, A, C), (B, A, X)) && op_move((B, A, X), (B', A, X)) && op_move((B', A, X), (B', A, Y)) && op_move((B', A, Y), (B', A', Y))",
                  "BAX",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Case2"),
                      @readable.Prev,
                      @readable.Thm("FourStepMoveAB", () => fourstepmoveab()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("moveSymmetry", () => movesymmetry()),
                    @readable.Thm("reachableN_Four", () => reachablen_four()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let fourstepmoveabbareach_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourStepMoveABBAreach")

///|
/// `FourStepMoveABBAreach`
pub fn fourstepmoveabbareach() -> @kernel.Thm {
  fourstepmoveabbareach_c.get()
}

///|
/// NotMove2ImpliesCollinear
fn step_96() -> Unit raise {
  notmove2impliescollinear_v1_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({A', B', C'}) && !(A == A') && !(B == B') && !move2Cond(A, B, A', B') → collinear({A, B, A', B'})",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1 H1' H2 H2' H3"),
        @readable.have(
          "!(A == B) && !(A' == B')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Thm(
                "Noncollinear_3ImpliesDistinct",
                () => noncollinear_3impliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET({A, B, A', B'}, {A, A', B, B'}) && SUBSET({A, B, A', B'}, {B, B', A', A}) && SUBSET({A, B, A', B'}, {A', B', B, A})",
          "set4symmetry",
          @readable.by(@sets.set_tac, []),
        ),
      ],
      @readable.case_split(
        "Case1 | Case2 | Case3 | Case4    ",
        @readable.by(
          @readable.fol,
          [@readable.Label("H3"), @readable.Thm("move2Cond", () => move2cond())],
        ),
        @list.List(["collinear({B, A, A'}) && collinear({A, B, B'})", "collinear({B, A, A'}) && collinear({B', A, A'})", "collinear({A', B, B'}) && collinear({A, B, B'})", "collinear({A', B, B'}) && collinear({B', A, A'})"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Distinct"),
                    @readable.Label("H2"),
                    @readable.Label("H2'"),
                    @readable.Label("set4symmetry"),
                    @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
                    @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Distinct"),
                    @readable.Label("H2"),
                    @readable.Label("H2'"),
                    @readable.Label("set4symmetry"),
                    @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
                    @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Distinct"),
                    @readable.Label("H2"),
                    @readable.Label("H2'"),
                    @readable.Label("set4symmetry"),
                    @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
                    @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Distinct"),
                    @readable.Label("H2"),
                    @readable.Label("H2'"),
                    @readable.Label("set4symmetry"),
                    @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
                    @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let notmove2impliescollinear_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NotMove2ImpliesCollinear")

///|
/// `NotMove2ImpliesCollinear`
pub fn notmove2impliescollinear_v1() -> @kernel.Thm {
  notmove2impliescollinear_v1_c.get()
}

///|
/// NotMove2ImpliesCollinear
fn step_100() -> Unit raise {
  notmove2impliescollinear_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({A', B', C'}) && !(A == A') && !(B == B') && !move2Cond(A, B, A', B') → collinear({A, B, A', B'})",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1 H1' H2 H2' H3"),
        @readable.have(
          "!(A == B) && !(A' == B')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Thm(
                "Noncollinear_3ImpliesDistinct",
                () => noncollinear_3impliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET({A, B, A', B'}, {A, A', B, B'}) && SUBSET({A, B, A', B'}, {B, B', A', A}) && SUBSET({A, B, A', B'}, {A', B', B, A})",
          "set4symmetry",
          @readable.by(@sets.set_tac, []),
        ),
        @readable.have(
          "collinear({B, A, A'}) && collinear({A, B, B'}) || collinear({B, A, A'}) && collinear({B', A, A'}) || collinear({A', B, B'}) && collinear({A, B, B'}) || collinear({A', B, B'}) && collinear({B', A, A'})",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Label("H3"), @readable.Thm("move2Cond", () => move2cond())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Distinct"),
            @readable.Label("H2"),
            @readable.Label("H2'"),
            @readable.Label("set4symmetry"),
            @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
            @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
            @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let notmove2impliescollinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NotMove2ImpliesCollinear")

///|
/// `NotMove2ImpliesCollinear`
pub fn notmove2impliescollinear() -> @kernel.Thm {
  notmove2impliescollinear_c.get()
}

///|
/// DistinctImplies2moveable
fn step_101() -> Unit raise {
  distinctimplies2moveable_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({A', B', C'}) && !(A == A') && !(B == B') && !(C == C') → move2Cond(A, B, A', B') || move2Cond(B, C, B', C')",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1 H1' H2a H2b H2c"),
        @readable.have(
          "SUBSET({A, B, B'}, {A, B, A', B'}) && SUBSET({B, B', C}, {B, C, B', C'})",
          "3subset4",
          @readable.by(@sets.set_tac, []),
        ),
        @readable.assuming(
          "!move2Cond(A, B, A', B') && !move2Cond(B, C, B', C')",
          "Con",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "collinear({A, B, A', B'}) && collinear({B, C, B', C'})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Label("H2a"),
              @readable.Label("H2b"),
              @readable.Label("H2c"),
              @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NotMove2ImpliesCollinear",
                () => notmove2impliescollinear(),
              ),
            ],
          ),
        ),
        @readable.have(
          "collinear({A, B, C})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("3subset4"),
              @readable.Label("H2a"),
              @readable.Label("H2b"),
              @readable.Label("H2c"),
              @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
              @readable.Thm("COLLINEAR_3_TRANS", () => @vectors.collinear_3_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Label("H1"), @readable.Label("H1'")],
        ),
      ],
    ),
  ))
}

///|
let distinctimplies2moveable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DistinctImplies2moveable")

///|
/// `DistinctImplies2moveable`
pub fn distinctimplies2moveable() -> @kernel.Thm {
  distinctimplies2moveable_c.get()
}

///|
/// SameCdiffAB
fn step_104() -> Unit raise {
  samecdiffab_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({A', B', C'}) → C == C' && !(A == A') && !(B == B') → (∃ Y : Cart[Real, 2], reachableN((A, B, C), (Y, B', C'), 2) || reachableN((A, B, C), (A', B', Y), 4))",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2"),
        @readable.have(
          "SUBSET({B, B', A}, {A, B, A', B'}) && SUBSET({A, B, C}, {B, B', A, C})",
          "easy_set",
          @readable.by(@sets.set_tac, []),
        ),
      ],
      @readable.case_split(
        "Ncol | move | col_Nmove    ",
        @readable.by(@readable.fol, []),
        @list.List(["!collinear({C, B, B'})", "move2Cond(A, B, A', B')", "collinear({C, B, B'}) && !move2Cond(A, B, A', B')"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.consider(
                  "X",
                  "∃ X : Cart[Real, 2], op_move((B, C, A), (B, C, X)) && op_move((B, C, X), (B', C', X))",
                  "BCX",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("easy_set"),
                      @readable.Label("H1"),
                      @readable.Label("H2"),
                      @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm("Basic2move_THM", () => basic2move_thm()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("BCX"),
                    @readable.Thm("reachableN_Two", () => reachablen_two()),
                    @readable.Thm("reachableNSymmetry", () => reachablensymmetry()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Thm(
                      "FourStepMoveABBAreach",
                      () => fourstepmoveabbareach(),
                    ),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "collinear({B, B', A}) && collinear({B, B', C})",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H1"),
                      @readable.Label("H2"),
                      @readable.Label("easy_set"),
                      @readable.Thm(
                        "NotMove2ImpliesCollinear",
                        () => notmove2impliescollinear(),
                      ),
                      @readable.Thm(
                        "COLLINEAR_SUBSET",
                        () => @vectors.collinear_subset(),
                      ),
                      @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H2"),
                    @readable.Label("easy_set"),
                    @readable.Label("H1"),
                    @readable.Thm("COLLINEAR_4_3", () => @vectors.collinear_4_3()),
                    @readable.Thm("COLLINEAR_SUBSET", () => @vectors.collinear_subset()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let samecdiffab_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SameCdiffAB")

///|
/// `SameCdiffAB`
pub fn samecdiffab() -> @kernel.Thm {
  samecdiffab_c.get()
}

///|
/// FourMovesToCorrectTwo
fn step_107() -> Unit raise {
  fourmovestocorrecttwo_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && !collinear({A', B', C'}) → (∃ n : Num, n < 5 && (∃ Y : Cart[Real, 2], reachableN((A, B, C), (A', B', Y), n) || reachableN((A, B, C), (A', Y, C'), n) || reachableN((A, B, C), (Y, B', C'), n)))",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1"),
        @readable.have(
          "!collinear({B, C, A}) && !collinear({B', C', A'}) && !collinear({C, A, B}) && !collinear({C', A', B'})",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "0 < 5 && 2 < 5 && 3 < 5 && 4 < 5",
          "easy_arith",
          @int.arith_tac,
        ),
      ],
      @readable.case_split(
        "case01 | case2 | case3    ",
        @readable.by(@readable.fol, []),
        @list.List(["(A == A' && B == B' && C == C' || A == A' && B == B' && !(C == C') || A == A' && !(B == B') && C == C' || !(A == A') && B == B' && C == C')", "(A == A' && !(B == B') && !(C == C') || !(A == A') && B == B' && !(C == C') || !(A == A') && !(B == B') && C == C')", "!(A == A') && !(B == B') && !(C == C')"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("easy_arith"),
                    @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Label("H1'"),
                    @readable.Label("easy_arith"),
                    @readable.Thm("SameCdiffAB", () => samecdiffab()),
                    @readable.Thm("reachableNSymmetry", () => reachablensymmetry()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.exists("4"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("easy_arith"),
                    @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
                  ],
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Label("H1'"),
                    @readable.Thm(
                      "DistinctImplies2moveable",
                      () => distinctimplies2moveable(),
                    ),
                    @readable.Thm(
                      "FourStepMoveABBAreach",
                      () => fourstepmoveabbareach(),
                    ),
                    @readable.Thm("reachableNSymmetry", () => reachablensymmetry()),
                    @readable.Thm("reachableN_Four", () => reachablen_four()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let fourmovestocorrecttwo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourMovesToCorrectTwo")

///|
/// `FourMovesToCorrectTwo`
pub fn fourmovestocorrecttwo() -> @kernel.Thm {
  fourmovestocorrecttwo_c.get()
}

///|
/// CorrectFinalPoint
fn step_111() -> Unit raise {
  correctfinalpoint_c.set(@readable.prove(
    "oriented_area(((A : Cart[Real, 2]), (B : Cart[Real, 2]), (C : Cart[Real, 2]))) == oriented_area((A, B, (C' : Cart[Real, 2]))) → op_move((A, B, C), (A, B, C'))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("move", () => move_()),
            @readable.Thm("oriented_area", () => oriented_area()),
            @readable.Thm("COLLINEAR_3_2Dzero", () => collinear_3_2dzero()),
          ],
        ),
        vec2_tac,
      ],
    ),
  ))
}

///|
let correctfinalpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CorrectFinalPoint")

///|
/// `CorrectFinalPoint`
pub fn correctfinalpoint() -> @kernel.Thm {
  correctfinalpoint_c.get()
}

///|
/// FiveMovesOrLess
fn step_112() -> Unit raise {
  fivemovesorless_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], !collinear({A, B, C}) && oriented_area((A, B, C)) == oriented_area((A', B', C')) → (∃ n : Num, n <= 5 && reachableN((A, B, C), (A', B', C'), n))",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1 H2"),
        @readable.have(
          "!collinear({A', B', C'})",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm(
                "ORIENTED_AREA_COLLINEAR_CONG",
                () => oriented_area_collinear_cong(),
              ),
            ],
          ),
        ),
        @readable.have(
          "!(A == B) && !(A == C) && !(B == C) && !(A' == B') && !(A' == C') && !(B' == C')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm(
                "Noncollinear_3ImpliesDistinct",
                () => noncollinear_3impliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "n Y",
          "∃ n : Num, ∃ Y : Cart[Real, 2], n < 5 && (reachableN((A, B, C), (A', B', Y), n) || reachableN((A, B, C), (A', Y, C'), n) || reachableN((A, B, C), (Y, B', C'), n))",
          "2Correct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Thm("FourMovesToCorrectTwo", () => fourmovestocorrecttwo()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "A'B'Y | A'YC' | YB'C'    ",
        @readable.by(@readable.fol, [@readable.Label("2Correct")]),
        @list.List(["reachableN((A, B, C), (A', B', Y), n)", "reachableN((A, B, C), (A', Y, C'), n)", "reachableN((A, B, C), (Y, B', C'), n)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "oriented_area((A', B', Y)) == oriented_area((A', B', C'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H2"),
                      @readable.Thm("ReachLemma", () => reachlemma()),
                      @readable.Thm("reachableInvariant", () => reachableinvariant()),
                    ],
                  ),
                ),
                @readable.have(
                  "op_move((A', B', Y), (A', B', C'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("Distinct"),
                      @readable.Thm("CorrectFinalPoint", () => correctfinalpoint()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("A'B'Y"),
                    @readable.Prev,
                    @readable.Label("2Correct"),
                    @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
                    @readable.Thm("LE_SUC_LT", () => @arith.le_suc_lt()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "oriented_area((A', C', Y)) == oriented_area((A', C', B'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H2"),
                      @readable.Prev,
                      @readable.Thm("ReachLemma", () => reachlemma()),
                      @readable.Thm("reachableInvariant", () => reachableinvariant()),
                      @readable.Thm(
                        "oriented_areaSymmetry",
                        () => oriented_areasymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "op_move((A', Y, C'), (A', B', C'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("Distinct"),
                      @readable.Thm("CorrectFinalPoint", () => correctfinalpoint()),
                      @readable.Thm("moveSymmetry", () => movesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("A'YC'"),
                    @readable.Prev,
                    @readable.Label("2Correct"),
                    @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
                    @readable.Thm("LE_SUC_LT", () => @arith.le_suc_lt()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "oriented_area((B', C', Y)) == oriented_area((B', C', A'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H2"),
                      @readable.Prev,
                      @readable.Thm("ReachLemma", () => reachlemma()),
                      @readable.Thm("reachableInvariant", () => reachableinvariant()),
                      @readable.Thm(
                        "oriented_areaSymmetry",
                        () => oriented_areasymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "op_move((Y, B', C'), (A', B', C'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("Distinct"),
                      @readable.Thm("CorrectFinalPoint", () => correctfinalpoint()),
                      @readable.Thm("moveSymmetry", () => movesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("YB'C'"),
                    @readable.Prev,
                    @readable.Label("2Correct"),
                    @readable.Thm("reachableN_CLAUSES", () => reachablen_clauses()),
                    @readable.Thm("LE_SUC_LT", () => @arith.le_suc_lt()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let fivemovesorless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FiveMovesOrLess")

///|
/// `FiveMovesOrLess`
pub fn fivemovesorless() -> @kernel.Thm {
  fivemovesorless_c.get()
}

///|
/// NOTENOUGH_4
fn step_118() -> Unit raise {
  notenough_4_c.set(@readable.prove(
    "∃ p0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ p4 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), oriented_area(p0) == oriented_area(p4) && !reachableN(p0, p4, 4)",
    @readable.steps(
      [
        @readable.consider(
          "p0 p4",
          "∃ p0 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ p4 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), p0 == (vector([real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1)]), vector([real_of_num(1), real_of_num(0)])) && p4 == (vector([real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(2)]), vector([real_of_num(2), real_of_num(1)]))",
          "p04Def",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "oriented_area(p0) == oriented_area(p4)",
          "equal_areas",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [@readable.Prev, @readable.Thm("oriented_area", () => oriented_area())],
              ),
              vec2_tac,
            ],
          ),
        ),
        @readable.have(
          "!reachableN(p0, p4, 4)",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Label("p04Def"),
                  @readable.Thm("reachableN_Four", () => reachablen_four()),
                  @readable.Thm("NOT_EXISTS_THM", () => @class.not_exists_thm()),
                  @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
                  @readable.Thm("move", () => move_()),
                  @readable.Thm("COLLINEAR_3_2Dzero", () => collinear_3_2dzero()),
                  @readable.Thm("FORALL_VECTOR_2", () => @vectors.forall_vector_2()),
                ],
              ),
              vec2_tac,
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("equal_areas")]),
      ],
    ),
  ))
}

///|
let notenough_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOTENOUGH_4")

///|
/// `NOTENOUGH_4`
pub fn notenough_4() -> @kernel.Thm {
  notenough_4_c.get()
}

///|
/// FiveMovesOrLess_STRONG
fn step_121() -> Unit raise {
  fivemovesorless_strong_c.set(@readable.prove(
    "∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ A' : Cart[Real, 2], ∀ B' : Cart[Real, 2], ∀ C' : Cart[Real, 2], oriented_area((A, B, C)) == oriented_area((A', B', C')) → (∃ n : Num, n <= 5 && reachableN((A, B, C), (A', B', C'), n))",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1"),
        @readable.have(
          "(∀ X : Cart[Real, 2], ∀ Y : Cart[Real, 2], collinear({X, Y, Y})) && (∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ A' : Cart[Real, 2], op_move((A, B, B), (A', B, B))) && (∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ B' : Cart[Real, 2], collinear({A, B, C}) && collinear({A, B', C}) → op_move((A, B, C), (A, B', C)))",
          "EZcollinear",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("move", () => move_()),
                  @readable.Thm("COLLINEAR_3_2D", () => @vectors.collinear_3_2d()),
                ],
              ),
              vec2_tac,
            ],
          ),
        ),
      ],
      @readable.case_split(
        "ABCncol | ABCcol    ",
        @readable.by(@readable.fol, []),
        @list.List(["!collinear({A, B, C})", "collinear({A, B, C})"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Thm("FiveMovesOrLess", () => fivemovesorless()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "collinear({A', B', C'})",
                  "A'B'C'col",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H1"),
                      @readable.Thm(
                        "ORIENTED_AREA_COLLINEAR_CONG",
                        () => oriented_area_collinear_cong(),
                      ),
                    ],
                  ),
                ),
                @readable.consider(
                  "P1 P2 P3 P4",
                  "∃ P1 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P2 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P3 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), ∃ P4 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]), P1 == (A, C, C) && P2 == (B', C, C) && P3 == (B', B', C) && P4 == (B', B', C')",
                  "P1234exist",
                  @readable.by(@readable.fol, []),
                ),
                @readable.have(
                  "op_move((A, B, C), P1) && op_move(P1, P2) && op_move(P2, P3) && op_move(P3, P4) && op_move(P4, (A', B', C'))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ABCcol"),
                      @readable.Label("A'B'C'col"),
                      @readable.Label("EZcollinear"),
                      @readable.Label("P1234exist"),
                      @readable.Thm("collinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm("moveSymmetry", () => movesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("reachableN_Five", () => reachablen_five()),
                    @readable.Thm("LE_REFL", () => @arith.le_refl()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let fivemovesorless_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FiveMovesOrLess_STRONG")

///|
/// `FiveMovesOrLess_STRONG`
pub fn fivemovesorless_strong() -> @kernel.Thm {
  fivemovesorless_strong_c.get()
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
  step_12()
  step_14()
  step_18()
  step_21()
  step_42()
  step_46()
  step_49()
  step_57()
  step_64()
  step_66()
  step_69()
  step_72()
  step_74()
  step_76()
  step_78()
  step_83()
  step_85()
  step_89()
  step_93()
  step_96()
  step_100()
  step_101()
  step_104()
  step_107()
  step_111()
  step_112()
  step_118()
  step_121()
}
