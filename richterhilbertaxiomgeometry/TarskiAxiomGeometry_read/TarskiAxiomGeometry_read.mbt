// Translated from upstream RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:19
fn step_1() -> Unit raise {
  @kernel.new_type("TarskiPlane", 0L)
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:21
fn step_2() -> Unit raise {
  @readable.newconstant("≃", @term_syntax.parse_type("((TarskiPlane, TarskiPlane), (TarskiPlane, TarskiPlane)) -> Bool"))
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:22
fn step_3() -> Unit raise {
  @readable.newconstant("ℬ", @term_syntax.parse_type("(TarskiPlane, TarskiPlane, TarskiPlane) -> Bool"))
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:24
fn step_4() -> Unit raise {
  @readable.parseasinfix("≃", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:25
fn step_5() -> Unit raise {
  @readable.parseasinfix("≊", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:26
fn step_6() -> Unit raise {
  @readable.parseasinfix("on_line", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/TarskiAxiomGeometry_read.ml:27
fn step_7() -> Unit raise {
  @readable.parseasinfix("equal_line", (12L, "right"))
}

///|
/// cong_DEF
fn step_8() -> Unit raise {
  cong_def_c.set(@readable.newdefinition("(TarskiTriangleCong : ((TarskiPlane, TarskiPlane, TarskiPlane), (TarskiPlane, TarskiPlane, TarskiPlane)) -> Bool)(((a : TarskiPlane), (b : TarskiPlane), (c : TarskiPlane)), ((x : TarskiPlane), (y : TarskiPlane), (z : TarskiPlane))) == (TarskiCong((a, b), (x, y)) && TarskiCong((a, c), (x, z)) && TarskiCong((b, c), (y, z)))"))
}

///|
let cong_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cong_DEF")

///|
/// `cong_DEF`
pub fn cong_def() -> @kernel.Thm {
  cong_def_c.get()
}

///|
/// is_ordered_DEF
fn step_9() -> Unit raise {
  is_ordered_def_c.set(@readable.newdefinition("(is_ordered : ((TarskiPlane, TarskiPlane, TarskiPlane, TarskiPlane)) -> Bool)(((a : TarskiPlane), (b : TarskiPlane), (c : TarskiPlane), (d : TarskiPlane))) == (TarskiBetween(a, b, c) && TarskiBetween(a, b, d) && TarskiBetween(a, c, d) && TarskiBetween(b, c, d))"))
}

///|
let is_ordered_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_ordered_DEF")

///|
/// `is_ordered_DEF`
pub fn is_ordered_def() -> @kernel.Thm {
  is_ordered_def_c.get()
}

///|
/// Line_DEF
fn step_10() -> Unit raise {
  line_def_c.set(@readable.newdefinition("(on_line : (TarskiPlane, (TarskiPlane, TarskiPlane)) -> Bool)((x : TarskiPlane), ((a : TarskiPlane), (b : TarskiPlane))) == (!(a == b) && (TarskiBetween(a, b, x) || TarskiBetween(a, x, b) || TarskiBetween(x, a, b)))"))
}

///|
let line_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Line_DEF")

///|
/// `Line_DEF`
pub fn line_def() -> @kernel.Thm {
  line_def_c.get()
}

///|
/// LineEq_DEF
fn step_11() -> Unit raise {
  lineeq_def_c.set(@readable.newdefinition("(equal_line : ((TarskiPlane, TarskiPlane), (TarskiPlane, TarskiPlane)) -> Bool)(((a : TarskiPlane), (b : TarskiPlane)), ((x : TarskiPlane), (y : TarskiPlane))) == (!(a == b) && !(x == y) && (∀ c : TarskiPlane, on_line(c, (a, b)) == on_line(c, (x, y))))"))
}

///|
let lineeq_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineEq_DEF")

///|
/// `LineEq_DEF`
pub fn lineeq_def() -> @kernel.Thm {
  lineeq_def_c.get()
}

///|
/// A1
fn step_12() -> Unit raise {
  a1_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, TarskiCong((a, b), (b, a))"))
}

///|
let a1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A1")

///|
/// `A1`
pub fn a1() -> @kernel.Thm {
  a1_c.get()
}

///|
/// A2
fn step_13() -> Unit raise {
  a2_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ p : TarskiPlane, ∀ q : TarskiPlane, ∀ r : TarskiPlane, ∀ s : TarskiPlane, TarskiCong((a, b), (p, q)) && TarskiCong((a, b), (r, s)) → TarskiCong((p, q), (r, s))"))
}

///|
let a2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A2")

///|
/// `A2`
pub fn a2() -> @kernel.Thm {
  a2_c.get()
}

///|
/// A3
fn step_14() -> Unit raise {
  a3_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, TarskiCong((a, b), (c, c)) → a == b"))
}

///|
let a3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A3")

///|
/// `A3`
pub fn a3() -> @kernel.Thm {
  a3_c.get()
}

///|
/// A4
fn step_15() -> Unit raise {
  a4_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ q : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∃ x : TarskiPlane, TarskiBetween(q, a, x) && TarskiCong((a, x), (b, c))"))
}

///|
let a4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A4")

///|
/// `A4`
pub fn a4() -> @kernel.Thm {
  a4_c.get()
}

///|
/// A5
fn step_16() -> Unit raise {
  a5_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ x : TarskiPlane, ∀ a' : TarskiPlane, ∀ b' : TarskiPlane, ∀ c' : TarskiPlane, ∀ x' : TarskiPlane, !(a == b) && TarskiTriangleCong((a, b, c), (a', b', c')) && TarskiBetween(a, b, x) && TarskiBetween(a', b', x') && TarskiCong((b, x), (b', x')) → TarskiCong((c, x), (c', x'))"))
}

///|
let a5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A5")

///|
/// `A5`
pub fn a5() -> @kernel.Thm {
  a5_c.get()
}

///|
/// A6
fn step_17() -> Unit raise {
  a6_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, TarskiBetween(a, b, a) → a == b"))
}

///|
let a6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A6")

///|
/// `A6`
pub fn a6() -> @kernel.Thm {
  a6_c.get()
}

///|
/// A7
fn step_18() -> Unit raise {
  a7_c.set(@readable.newaxiom("∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ p : TarskiPlane, ∀ q : TarskiPlane, ∀ z : TarskiPlane, TarskiBetween(a, p, z) && TarskiBetween(b, q, z) → (∃ x : TarskiPlane, TarskiBetween(p, x, b) && TarskiBetween(q, x, a))"))
}

///|
let a7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("A7")

///|
/// `A7`
pub fn a7() -> @kernel.Thm {
  a7_c.get()
}

///|
/// EquivReflexive
fn step_19() -> Unit raise {
  equivreflexive_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, TarskiCong((a, b), (a, b))",
    @readable.by(
      @readable.fol,
      [@readable.Thm("A1", () => a1()), @readable.Thm("A2", () => a2())],
    ),
  ))
}

///|
let equivreflexive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EquivReflexive")

///|
/// `EquivReflexive`
pub fn equivreflexive() -> @kernel.Thm {
  equivreflexive_c.get()
}

///|
/// EquivSymmetric
fn step_23() -> Unit raise {
  equivsymmetric_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, TarskiCong((a, b), (c, d)) → TarskiCong((c, d), (a, b))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("EquivReflexive", () => equivreflexive()),
        @readable.Thm("A2", () => a2()),
      ],
    ),
  ))
}

///|
let equivsymmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EquivSymmetric")

///|
/// `EquivSymmetric`
pub fn equivsymmetric() -> @kernel.Thm {
  equivsymmetric_c.get()
}

///|
/// EquivTransitive
fn step_25() -> Unit raise {
  equivtransitive_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ p : TarskiPlane, ∀ q : TarskiPlane, ∀ r : TarskiPlane, ∀ s : TarskiPlane, TarskiCong((a, b), (p, q)) && TarskiCong((p, q), (r, s)) → TarskiCong((a, b), (r, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("EquivSymmetric", () => equivsymmetric()),
        @readable.Thm("A2", () => a2()),
      ],
    ),
  ))
}

///|
let equivtransitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EquivTransitive")

///|
/// `EquivTransitive`
pub fn equivtransitive() -> @kernel.Thm {
  equivtransitive_c.get()
}

///|
/// Baaa_THM
fn step_27() -> Unit raise {
  baaa_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, TarskiBetween(a, a, a) && TarskiCong((a, a), (b, b))",
    @readable.by(
      @readable.fol,
      [@readable.Thm("A4", () => a4()), @readable.Thm("A3", () => a3())],
    ),
  ))
}

///|
let baaa_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Baaa_THM")

///|
/// `Baaa_THM`
pub fn baaa_thm() -> @kernel.Thm {
  baaa_thm_c.get()
}

///|
/// Bqaa_THM
fn step_30() -> Unit raise {
  bqaa_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ q : TarskiPlane, TarskiBetween(q, a, a)",
    @readable.by(
      @readable.fol,
      [@readable.Thm("A4", () => a4()), @readable.Thm("A3", () => a3())],
    ),
  ))
}

///|
let bqaa_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Bqaa_THM")

///|
/// `Bqaa_THM`
pub fn bqaa_thm() -> @kernel.Thm {
  bqaa_thm_c.get()
}

///|
/// C1_THM
fn step_31() -> Unit raise {
  c1_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ x : TarskiPlane, ∀ y : TarskiPlane, !(a == b) && TarskiBetween(a, b, x) && TarskiBetween(a, b, y) && TarskiCong((b, x), (b, y)) → y == x",
    @readable.steps(
      [
        @readable.intro_tac("forall a b x y, H1 H2 H3 H4"),
        @readable.have(
          "TarskiTriangleCong((a, b, y), (a, b, y))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((y, x), (y, y))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Label("H4"),
              @readable.Thm("A5", () => a5()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("A3", () => a3())]),
      ],
    ),
  ))
}

///|
let c1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C1_THM")

///|
/// `C1_THM`
pub fn c1_thm() -> @kernel.Thm {
  c1_thm_c.get()
}

///|
/// Bsymmetry_THM
fn step_34() -> Unit raise {
  bsymmetry_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ p : TarskiPlane, ∀ z : TarskiPlane, TarskiBetween(a, p, z) → TarskiBetween(z, p, a)",
    @readable.steps(
      [
        @readable.intro_tac("forall a p z, H1"),
        @readable.have(
          "TarskiBetween(p, z, z)",
          "",
          @readable.by(@readable.fol, [@readable.Thm("Bqaa_THM", () => bqaa_thm())]),
        ),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(p, x, p) && TarskiBetween(z, x, a)",
          "xExists",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Label("H1"), @readable.Thm("A7", () => a7())],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("A6", () => a6())]),
      ],
    ),
  ))
}

///|
let bsymmetry_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Bsymmetry_THM")

///|
/// `Bsymmetry_THM`
pub fn bsymmetry_thm() -> @kernel.Thm {
  bsymmetry_thm_c.get()
}

///|
/// Baaq_THM
fn step_38() -> Unit raise {
  baaq_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ q : TarskiPlane, TarskiBetween(a, a, q)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Bqaa_THM", () => bqaa_thm()),
        @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
      ],
    ),
  ))
}

///|
let baaq_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Baaq_THM")

///|
/// `Baaq_THM`
pub fn baaq_thm() -> @kernel.Thm {
  baaq_thm_c.get()
}

///|
/// BEquality_THM
fn step_40() -> Unit raise {
  bequality_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, TarskiBetween(a, b, c) && TarskiBetween(b, a, c) → a == b",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c, H1 H2"),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(b, x, b) && TarskiBetween(a, x, a)",
          "A7implies",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("H1"),
              @readable.Thm("A7", () => a7()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("A6", () => a6())]),
      ],
    ),
  ))
}

///|
let bequality_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEquality_THM")

///|
/// `BEquality_THM`
pub fn bequality_thm() -> @kernel.Thm {
  bequality_thm_c.get()
}

///|
/// B124and234then123_THM
fn step_41() -> Unit raise {
  b124and234then123_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, TarskiBetween(a, b, d) && TarskiBetween(b, c, d) → TarskiBetween(a, b, c)",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2"),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(b, x, b) && TarskiBetween(c, x, a)",
          "A7implies",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("A7", () => a7()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("A6", () => a6()),
            @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let b124and234then123_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B124and234then123_THM")

///|
/// `B124and234then123_THM`
pub fn b124and234then123_thm() -> @kernel.Thm {
  b124and234then123_thm_c.get()
}

///|
/// BTransitivity_THM
fn step_42() -> Unit raise {
  btransitivity_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(b == c) && TarskiBetween(a, b, c) && TarskiBetween(b, c, d) → TarskiBetween(a, c, d)",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2 H3"),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(a, c, x) && TarskiCong((c, x), (c, d))",
          "X1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiBetween(x, c, b)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Prev,
              @readable.Thm("B124and234then123_THM", () => b124and234then123_thm()),
            ],
          ),
        ),
        @readable.have(
          "x == d",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("H1"),
              @readable.Label("H3"),
              @readable.Label("X1"),
              @readable.Thm("C1_THM", () => c1_thm()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("X1")]),
      ],
    ),
  ))
}

///|
let btransitivity_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BTransitivity_THM")

///|
/// `BTransitivity_THM`
pub fn btransitivity_thm() -> @kernel.Thm {
  btransitivity_thm_c.get()
}

///|
/// BTransitivityOrdered_THM
fn step_45() -> Unit raise {
  btransitivityordered_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(b == c) && TarskiBetween(a, b, c) && TarskiBetween(b, c, d) → is_ordered((a, b, c, d))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2 H3"),
        @readable.have(
          "TarskiBetween(a, c, d)",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("BTransitivity_THM", () => btransitivity_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(d, b, a)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("H1"),
              @readable.Label("H3"),
              @readable.Thm("BTransitivity_THM", () => btransitivity_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H2"),
            @readable.Prev,
            @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            @readable.Label("X1"),
            @readable.Label("H3"),
            @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let btransitivityordered_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BTransitivityOrdered_THM")

///|
/// `BTransitivityOrdered_THM`
pub fn btransitivityordered_thm() -> @kernel.Thm {
  btransitivityordered_thm_c.get()
}

///|
/// B124and234Ordered_THM
fn step_48() -> Unit raise {
  b124and234ordered_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, TarskiBetween(a, b, d) && TarskiBetween(b, c, d) → is_ordered((a, b, c, d))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2"),
        @readable.have(
          "TarskiBetween(a, b, c)",
          "Babc",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("B124and234then123_THM", () => b124and234then123_thm()),
            ],
          ),
        ),
        @readable.assuming(
          "!(b == c)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Bqaa_THM", () => bqaa_thm()),
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Babc"),
            @readable.Prev,
            @readable.Label("H2"),
            @readable.Thm("BTransitivityOrdered_THM", () => btransitivityordered_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let b124and234ordered_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B124and234Ordered_THM")

///|
/// `B124and234Ordered_THM`
pub fn b124and234ordered_thm() -> @kernel.Thm {
  b124and234ordered_thm_c.get()
}

///|
/// SegmentAddition_THM
fn step_50() -> Unit raise {
  segmentaddition_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ a' : TarskiPlane, ∀ b' : TarskiPlane, ∀ c' : TarskiPlane, TarskiBetween(a, b, c) && TarskiBetween(a', b', c') && TarskiCong((a, b), (a', b')) && TarskiCong((b, c), (b', c')) → TarskiCong((a, c), (a', c'))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c a' b' c', H1 H2 H3 H4"),
        @readable.assuming(
          "!(a == b)",
          "aNOTb",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A3", () => a3()),
              @readable.Label("H4"),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((a, b, a), (a', b', a'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("Baaa_THM", () => baaa_thm()),
              @readable.Label("H3"),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("aNOTb"),
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Label("H4"),
            @readable.Thm("A5", () => a5()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmentaddition_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentAddition_THM")

///|
/// `SegmentAddition_THM`
pub fn segmentaddition_thm() -> @kernel.Thm {
  segmentaddition_thm_c.get()
}

///|
/// CongruenceDoubleSymmetry_THM
fn step_53() -> Unit raise {
  congruencedoublesymmetry_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, TarskiCong((a, b), (c, d)) → TarskiCong((b, a), (d, c))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("A1", () => a1()),
        @readable.Thm("EquivTransitive", () => equivtransitive()),
      ],
    ),
  ))
}

///|
let congruencedoublesymmetry_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CongruenceDoubleSymmetry_THM")

///|
/// `CongruenceDoubleSymmetry_THM`
pub fn congruencedoublesymmetry_thm() -> @kernel.Thm {
  congruencedoublesymmetry_thm_c.get()
}

///|
/// C1prime_THM
fn step_54() -> Unit raise {
  c1prime_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ x : TarskiPlane, ∀ y : TarskiPlane, !(a == b) && TarskiBetween(a, b, x) && TarskiBetween(a, b, y) && TarskiCong((a, x), (a, y)) → x == y",
    @readable.steps(
      [
        @readable.intro_tac("forall a b x y, H1 H2 H3 H4"),
        @readable.consider(
          "m",
          "∃ m : TarskiPlane, TarskiBetween(b, a, m) && TarskiCong((a, m), (a, b))",
          "X1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiBetween(m, a, b)",
          "X2",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            ],
          ),
        ),
        @readable.have(
          "!(m == a)",
          "X3",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A3", () => a3()),
              @readable.Label("H1"),
            ],
          ),
        ),
        @readable.have(
          "is_ordered((m, a, b, x))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("X2"),
              @readable.Label("H2"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(m, a, x)",
          "X4",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.have(
          "is_ordered((m, a, b, y))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("X2"),
              @readable.Label("H3"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(m, a, y)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("X3"),
            @readable.Label("X4"),
            @readable.Label("H4"),
            @readable.Thm("C1_THM", () => c1_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let c1prime_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C1prime_THM")

///|
/// `C1prime_THM`
pub fn c1prime_thm() -> @kernel.Thm {
  c1prime_thm_c.get()
}

///|
/// SegmentSubtraction_THM
fn step_55() -> Unit raise {
  segmentsubtraction_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ a' : TarskiPlane, ∀ b' : TarskiPlane, ∀ c' : TarskiPlane, TarskiBetween(a, b, c) && TarskiBetween(a', b', c') && TarskiCong((a, b), (a', b')) && TarskiCong((a, c), (a', c')) → TarskiCong((b, c), (b', c'))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c a' b' c', H1 H2 H3 H4"),
        @readable.assuming(
          "!(a == b)",
          "Z1",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A3", () => a3()),
              @readable.Label("H4"),
            ],
          ),
        ),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(a, b, x) && TarskiCong((b, x), (b', c'))",
          "Z2",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiCong((a, x), (a', c'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("SegmentAddition_THM", () => segmentaddition_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((a, x), (a, c))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H4"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Prev,
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "x == c",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Z1"),
              @readable.Label("Z2"),
              @readable.Label("H1"),
              @readable.Thm("C1prime_THM", () => c1prime_thm()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Z2")]),
      ],
    ),
  ))
}

///|
let segmentsubtraction_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentSubtraction_THM")

///|
/// `SegmentSubtraction_THM`
pub fn segmentsubtraction_thm() -> @kernel.Thm {
  segmentsubtraction_thm_c.get()
}

///|
/// EasyAngleTransport_THM
fn step_58() -> Unit raise {
  easyangletransport_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ O : TarskiPlane, ∀ b : TarskiPlane, !(O == a) → (∃ x : TarskiPlane, ∃ y : TarskiPlane, TarskiBetween(b, O, x) && TarskiBetween(a, O, y) && TarskiTriangleCong((x, y, O), (a, b, O)))",
    @readable.steps(
      [
        @readable.intro_tac("forall a O b, H1"),
        @readable.consider(
          "x y",
          "∃ x : TarskiPlane, ∃ y : TarskiPlane, TarskiBetween(b, O, x) && TarskiCong((O, x), (O, a)) && TarskiBetween(a, O, y) && TarskiCong((O, y), (O, b))",
          "X2",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiCong((x, O), (a, O))",
          "X3",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((a, O, x), (x, O, a))",
          "X5",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A1", () => a1()),
              @readable.Label("X2"),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((x, y), (a, b))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("X5"),
              @readable.Label("X2"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Thm("A5", () => a5()),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((x, y, O), (a, b, O))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X3"),
              @readable.Label("X2"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("X2"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let easyangletransport_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EasyAngleTransport_THM")

///|
/// `EasyAngleTransport_THM`
pub fn easyangletransport_thm() -> @kernel.Thm {
  easyangletransport_thm_c.get()
}

///|
/// B123and134Ordered_THM
fn step_60() -> Unit raise {
  b123and134ordered_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, TarskiBetween(a, b, c) && TarskiBetween(a, c, d) → is_ordered((a, b, c, d))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2"),
        @readable.have(
          "is_ordered((d, c, b, a))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("H1"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Thm("B124and234Ordered_THM", () => b124and234ordered_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(d, b, a) && TarskiBetween(d, c, b)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let b123and134ordered_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B123and134Ordered_THM")

///|
/// `B123and134Ordered_THM`
pub fn b123and134ordered_thm() -> @kernel.Thm {
  b123and134ordered_thm_c.get()
}

///|
/// BextendToLine_THM
fn step_62() -> Unit raise {
  bextendtoline_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(a == b) && TarskiBetween(a, b, c) && TarskiBetween(a, b, d) → (∃ x : TarskiPlane, is_ordered((a, b, c, x)) && is_ordered((a, b, d, x)))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2 H3"),
        @readable.consider(
          "u",
          "∃ u : TarskiPlane, TarskiBetween(a, c, u) && TarskiCong((c, u), (b, d))",
          "X1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "is_ordered((a, b, c, u))",
          "X2",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("X1"),
              @readable.Thm("B123and134Ordered_THM", () => b123and134ordered_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(u, c, b)",
          "X3",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X2"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((u, c), (b, d))",
          "X4",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("A1", () => a1()),
              @readable.Label("X1"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, u)",
          "X5",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X2"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, TarskiBetween(a, d, x) && TarskiCong((d, x), (b, c))",
          "Y1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "is_ordered((a, b, d, x))",
          "Y2",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Label("Y1"),
              @readable.Thm("B123and134Ordered_THM", () => b123and134ordered_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, b), (d, x))",
          "Y5",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("A1", () => a1()),
              @readable.Label("Y1"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, x)",
          "Y6",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Y2"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((u, b), (b, x))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X3"),
              @readable.Label("Y2"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
              @readable.Label("X4"),
              @readable.Label("Y5"),
              @readable.Thm("SegmentAddition_THM", () => segmentaddition_thm()),
            ],
          ),
        ),
        @readable.have(
          "u == x",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("A1", () => a1()),
              @readable.Prev,
              @readable.Thm("EquivTransitive", () => equivtransitive()),
              @readable.Label("H1"),
              @readable.Label("X5"),
              @readable.Label("Y6"),
              @readable.Thm("C1_THM", () => c1_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Label("X2"), @readable.Label("Y2")],
        ),
      ],
    ),
  ))
}

///|
let bextendtoline_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BextendToLine_THM")

///|
/// `BextendToLine_THM`
pub fn bextendtoline_thm() -> @kernel.Thm {
  bextendtoline_thm_c.get()
}

///|
/// GuptaEasy_THM
fn step_64() -> Unit raise {
  guptaeasy_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(a == b) && TarskiBetween(a, b, c) && TarskiBetween(a, b, d) && !(b == c) && !(b == d) → !TarskiBetween(c, b, d)",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2 H3 H4 H5"),
        @readable.assuming("TarskiBetween(c, b, d)", "H6", @readable.by(@readable.fol, [])),
        @readable.consider(
          "x",
          "∃ x : TarskiPlane, is_ordered((a, b, c, x)) && is_ordered((a, b, d, x))",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("BextendToLine_THM", () => bextendtoline_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(b, d, x)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.have(
          "is_ordered((c, b, d, x))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H5"),
              @readable.Label("H6"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(b, c, x) && TarskiBetween(c, b, x)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X1"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("BEquality_THM", () => bequality_thm()),
            @readable.Label("H4"),
          ],
        ),
      ],
    ),
  ))
}

///|
let guptaeasy_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GuptaEasy_THM")

///|
/// `GuptaEasy_THM`
pub fn guptaeasy_thm() -> @kernel.Thm {
  guptaeasy_thm_c.get()
}

///|
/// Inner5Segments_THM
fn step_67() -> Unit raise {
  inner5segments_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ x : TarskiPlane, ∀ a' : TarskiPlane, ∀ b' : TarskiPlane, ∀ c' : TarskiPlane, ∀ x' : TarskiPlane, TarskiTriangleCong((a, b, c), (a', b', c')) && TarskiBetween(a, x, c) && TarskiBetween(a', x', c') && TarskiCong((c, x), (c', x')) → TarskiCong((b, x), (b', x'))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c x a' b' c' x', H1 H2 H3 H4"),
        @readable.have(
          "TarskiCong((a, b), (a', b')) && TarskiCong((a, c), (a', c')) && TarskiCong((b, c), (b', c'))",
          "X1",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("cong_DEF", () => cong_def())],
          ),
        ),
        @readable.assuming(
          "!(x == c)",
          "Case2",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H4"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Prev,
              @readable.Thm("A3", () => a3()),
              @readable.Label("X1"),
            ],
          ),
        ),
        @readable.have(
          "!(a == c)",
          "X2",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("A6", () => a6()), @readable.Prev],
          ),
        ),
        @readable.consider(
          "y",
          "∃ y : TarskiPlane, TarskiBetween(a, c, y) && TarskiCong((c, y), (a, c))",
          "X3",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.consider(
          "y'",
          "∃ y' : TarskiPlane, TarskiBetween(a', c', y') && TarskiCong((c', y'), (a, c))",
          "X4",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiCong((c, y), (c', y'))",
          "X5",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, b), (c', b'))",
          "X6",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((a, c, b), (a', c', b'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("cong_DEF", () => cong_def()),
              @readable.Label("X1"),
              @readable.Prev,
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((b, y), (b', y'))",
          "X7",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X2"),
              @readable.Label("X3"),
              @readable.Label("X4"),
              @readable.Label("X5"),
              @readable.Thm("A5", () => a5()),
            ],
          ),
        ),
        @readable.have(
          "!(y == c)",
          "X8",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A3", () => a3()),
              @readable.Label("X2"),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(y, c, x)",
          "X9",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X3"),
              @readable.Label("H2"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Thm("B124and234then123_THM", () => b124and234then123_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(y', c', a') && TarskiBetween(c', x', a')",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X4"),
              @readable.Label("H3"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(y', c', x')",
          "X10",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B124and234then123_THM", () => b124and234then123_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((y, c, b), (y', c', b'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X5"),
              @readable.Label("X7"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Thm("cong_DEF", () => cong_def()),
              @readable.Label("X6"),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("X8"),
            @readable.Label("X9"),
            @readable.Label("X10"),
            @readable.Label("H4"),
            @readable.Thm("A5", () => a5()),
          ],
        ),
      ],
    ),
  ))
}

///|
let inner5segments_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Inner5Segments_THM")

///|
/// `Inner5Segments_THM`
pub fn inner5segments_thm() -> @kernel.Thm {
  inner5segments_thm_c.get()
}

///|
/// RhombusDiagBisect_THM
fn step_68() -> Unit raise {
  rhombusdiagbisect_thm_c.set(@readable.prove(
    "∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, ∀ c' : TarskiPlane, ∀ d' : TarskiPlane, TarskiBetween(b, c, d') && TarskiBetween(b, d, c') && TarskiCong((c, d'), (c, d)) && TarskiCong((d, c'), (c, d)) && TarskiCong((d', c'), (c, d)) → (∃ e : TarskiPlane, TarskiBetween(c, e, c') && TarskiBetween(d, e, d') && TarskiCong((c, e), (c', e)) && TarskiCong((d, e), (d', e)))",
    @readable.steps(
      [
        @readable.intro_tac("forall b c d c' d', H1 H2 H3 H4 H5"),
        @readable.have(
          "TarskiBetween(d', c, b) && TarskiBetween(c', d, b)",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            ],
          ),
        ),
        @readable.consider(
          "e",
          "∃ e : TarskiPlane, TarskiBetween(c, e, c') && TarskiBetween(d, e, d')",
          "X2",
          @readable.by(
            @readable.fol,
            [@readable.Label("X1"), @readable.Thm("A7", () => a7())],
          ),
        ),
        @readable.have(
          "TarskiCong((c, d), (c, d'))",
          "X3",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, c'), (c, c'))",
          "X4",
          @readable.by(
            @readable.fol,
            [@readable.Thm("EquivReflexive", () => equivreflexive())],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((c, d, c'), (c, d', c'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H5"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("H4"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
              @readable.Label("X3"),
              @readable.Label("X4"),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((d, e), (d', e))",
          "X5",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X2"),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("Inner5Segments_THM", () => inner5segments_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((d, c), (d, c'))",
          "X7",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H4"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((d, d'), (d, d'))",
          "X8",
          @readable.by(
            @readable.fol,
            [@readable.Thm("EquivReflexive", () => equivreflexive())],
          ),
        ),
        @readable.have(
          "TarskiCong((c, d'), (c', d'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("A1", () => a1()),
              @readable.Label("H5"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("H3"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((d, c, d'), (d, c', d'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Label("X7"),
              @readable.Label("X8"),
              @readable.Prev,
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, e), (c', e))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X2"),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("Inner5Segments_THM", () => inner5segments_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Label("X2"), @readable.Label("X5")],
        ),
      ],
    ),
  ))
}

///|
let rhombusdiagbisect_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RhombusDiagBisect_THM")

///|
/// `RhombusDiagBisect_THM`
pub fn rhombusdiagbisect_thm() -> @kernel.Thm {
  rhombusdiagbisect_thm_c.get()
}

///|
/// FlatNormal_THM
fn step_70() -> Unit raise {
  flatnormal_thm_c.set(@readable.prove(
    "∀ a : _, ∀ b : _, ∀ c : TarskiPlane, ∀ d : TarskiPlane, ∀ d' : TarskiPlane, ∀ e : TarskiPlane, TarskiBetween(d, e, d') && TarskiCong((c, d'), (c, d)) && TarskiCong((d, e), (d', e)) && !(c == d) && !(e == d) → (∃ p : TarskiPlane, ∃ r : TarskiPlane, ∃ q : TarskiPlane, TarskiBetween(p, r, q) && TarskiBetween(r, c, d') && TarskiBetween(e, c, p) && TarskiTriangleCong((r, c, p), (r, c, q)) && TarskiCong((r, c), (e, c)) && TarskiCong((p, r), (d, e)))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d d' e, H1 H2 H3 H4 H5"),
        @readable.have(
          "!(c == d')",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H4"),
              @readable.Label("H2"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A3", () => a3()),
            ],
          ),
        ),
        @readable.consider(
          "p r",
          "∃ p : TarskiPlane, ∃ r : TarskiPlane, TarskiBetween(e, c, p) && TarskiBetween(d', c, r) && TarskiTriangleCong((p, r, c), (d', e, c))",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("EasyAngleTransport_THM", () => easyangletransport_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((p, r), (d', e)) && TarskiCong((p, c), (d', c)) && TarskiCong((r, c), (e, c))",
          "X2",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X1"),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((p, r), (d, e))",
          "X3",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("X2"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "!(p == r)",
          "X4",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("H5"),
              @readable.Thm("A3", () => a3()),
            ],
          ),
        ),
        @readable.consider(
          "q",
          "∃ q : TarskiPlane, TarskiBetween(p, r, q) && TarskiCong((r, q), (e, d))",
          "X5",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "TarskiCong((c, p), (c, d))",
          "X7",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X2"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Label("H2"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, q), (c, d))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X4"),
              @readable.Label("X1"),
              @readable.Label("X5"),
              @readable.Label("H1"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Thm("A5", () => a5()),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((r, c, p), (r, c, q))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("X7"),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
              @readable.Label("X5"),
              @readable.Label("X3"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("X1"),
            @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            @readable.Label("X5"),
            @readable.Prev,
            @readable.Label("X2"),
            @readable.Label("X1"),
            @readable.Label("X3"),
          ],
        ),
      ],
    ),
  ))
}

///|
let flatnormal_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FlatNormal_THM")

///|
/// `FlatNormal_THM`
pub fn flatnormal_thm() -> @kernel.Thm {
  flatnormal_thm_c.get()
}

///|
/// EqDist2PointsBetween_THM
fn step_72() -> Unit raise {
  eqdist2pointsbetween_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ p : TarskiPlane, ∀ q : TarskiPlane, !(a == b) && TarskiBetween(a, b, c) && TarskiCong((a, p), (a, q)) && TarskiCong((b, p), (b, q)) → TarskiCong((c, p), (c, q))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c p q, H1 H2 H3 H4"),
        @readable.have(
          "TarskiTriangleCong((a, b, p), (a, b, q))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Label("H3"),
              @readable.Label("H4"),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((p, c), (q, c))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("A5", () => a5()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm(
              "CongruenceDoubleSymmetry_THM",
              () => congruencedoublesymmetry_thm(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let eqdist2pointsbetween_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EqDist2PointsBetween_THM")

///|
/// `EqDist2PointsBetween_THM`
pub fn eqdist2pointsbetween_thm() -> @kernel.Thm {
  eqdist2pointsbetween_thm_c.get()
}

///|
/// EqDist2PointsInnerBetween_THM
fn step_73() -> Unit raise {
  eqdist2pointsinnerbetween_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ x : TarskiPlane, ∀ c : TarskiPlane, ∀ p : TarskiPlane, ∀ q : TarskiPlane, TarskiBetween(a, x, c) && TarskiCong((a, p), (a, q)) && TarskiCong((c, p), (c, q)) → TarskiCong((x, p), (x, q))",
    @readable.steps(
      [
        @readable.intro_tac("forall a x c p q, H1 H2 H3"),
        @readable.have(
          "TarskiTriangleCong((a, p, c), (a, q, c))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((p, x), (q, x))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("EquivReflexive", () => equivreflexive()),
              @readable.Thm("Inner5Segments_THM", () => inner5segments_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm(
              "CongruenceDoubleSymmetry_THM",
              () => congruencedoublesymmetry_thm(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let eqdist2pointsinnerbetween_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EqDist2PointsInnerBetween_THM")

///|
/// `EqDist2PointsInnerBetween_THM`
pub fn eqdist2pointsinnerbetween_thm() -> @kernel.Thm {
  eqdist2pointsinnerbetween_thm_c.get()
}

///|
/// Gupta_THM
fn step_74() -> Unit raise {
  gupta_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(a == b) && TarskiBetween(a, b, c) && TarskiBetween(a, b, d) → TarskiBetween(b, d, c) || TarskiBetween(b, c, d)",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d, H1 H2 H3"),
        @readable.assuming(
          "!(b == c) && !(b == d) && !(c == d)",
          "H4",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Baaq_THM", () => baaq_thm()),
              @readable.Thm("Bqaa_THM", () => bqaa_thm()),
            ],
          ),
        ),
        @readable.assuming(
          "!TarskiBetween(b, d, c)",
          "H5",
          @readable.by(@readable.fol, []),
        ),
        @readable.consider(
          "d'",
          "∃ d' : TarskiPlane, TarskiBetween(a, c, d') && TarskiCong((c, d'), (c, d))",
          "X1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.consider(
          "c'",
          "∃ c' : TarskiPlane, TarskiBetween(a, d, c') && TarskiCong((d, c'), (c, d))",
          "X2",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "is_ordered((a, b, c, d'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("X1"),
              @readable.Thm("B123and134Ordered_THM", () => b123and134ordered_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, d') && TarskiBetween(b, c, d')",
          "X3",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.have(
          "is_ordered((a, b, d, c'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Label("X2"),
              @readable.Thm("B123and134Ordered_THM", () => b123and134ordered_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, c') && TarskiBetween(b, d, c')",
          "X4",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.have(
          "!(c == d')",
          "X5",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Label("H4"),
              @readable.Thm("A3", () => a3()),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
            ],
          ),
        ),
        @readable.have(
          "!(d == c')",
          "X6",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X2"),
              @readable.Label("H4"),
              @readable.Thm("A3", () => a3()),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
            ],
          ),
        ),
        @readable.have(
          "!(b == d')",
          "X7",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X3"),
              @readable.Label("H4"),
              @readable.Thm("A6", () => a6()),
            ],
          ),
        ),
        @readable.have(
          "!(b == c')",
          "X8",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X4"),
              @readable.Label("H4"),
              @readable.Thm("A6", () => a6()),
            ],
          ),
        ),
        @readable.consider(
          "u",
          "∃ u : TarskiPlane, TarskiBetween(c, d', u) && TarskiCong((d', u), (b, d))",
          "Y1",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "is_ordered((b, c, d', u))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X5"),
              @readable.Label("X3"),
              @readable.Label("Y1"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(b, c, u) && TarskiBetween(b, d', u)",
          "Y2",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.consider(
          "b'",
          "∃ b' : TarskiPlane, TarskiBetween(d, c', b') && TarskiCong((c', b'), (b, c))",
          "Y3",
          @readable.by(@readable.fol, [@readable.Thm("A4", () => a4())]),
        ),
        @readable.have(
          "is_ordered((b, d, c', b'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X6"),
              @readable.Label("X4"),
              @readable.Label("Y3"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(b, d, b') && TarskiBetween(b, c', b')",
          "Y4",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("is_ordered_DEF", () => is_ordered_def())],
          ),
        ),
        @readable.have(
          "TarskiCong((c, d'), (c', d))",
          "Y7",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X2"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Label("X1"),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((c, u), (c', b))",
          "Y8",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Y1"),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
              @readable.Label("X4"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("Y7"),
              @readable.Thm("SegmentAddition_THM", () => segmentaddition_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((b, c), (b', c'))",
          "Y10",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Y3"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((b, u), (b, b'))",
          "Y11",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Y4"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("Y2"),
              @readable.Label("Y10"),
              @readable.Label("Y8"),
              @readable.Thm("SegmentAddition_THM", () => segmentaddition_thm()),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.have(
          "is_ordered((a, b, d', u))",
          "Y12",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X7"),
              @readable.Label("X3"),
              @readable.Label("Y2"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "is_ordered((a, b, c', b'))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X8"),
              @readable.Label("X4"),
              @readable.Label("Y4"),
              @readable.Thm(
                "BTransitivityOrdered_THM",
                () => btransitivityordered_thm(),
              ),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, u) && TarskiBetween(a, b, b')",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Y12"),
              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
            ],
          ),
        ),
        @readable.have(
          "u == b'",
          "Y13",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("Y11"),
              @readable.Thm("C1_THM", () => c1_thm()),
            ],
          ),
        ),
        @readable.have(
          "TarskiTriangleCong((b, c, c'), (b', c', c))",
          "Z2",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("A1", () => a1()),
              @readable.Label("Y10"),
              @readable.Label("Y13"),
              @readable.Label("Y8"),
              @readable.Thm("EquivSymmetric", () => equivsymmetric()),
              @readable.Thm(
                "CongruenceDoubleSymmetry_THM",
                () => congruencedoublesymmetry_thm(),
              ),
              @readable.Thm("cong_DEF", () => cong_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiCong((d', c'), (c, d))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Y3"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("H4"),
              @readable.Label("Z2"),
              @readable.Label("X3"),
              @readable.Label("Y7"),
              @readable.Thm("A5", () => a5()),
              @readable.Thm("A1", () => a1()),
              @readable.Thm("EquivTransitive", () => equivtransitive()),
            ],
          ),
        ),
        @readable.consider(
          "e",
          "∃ e : TarskiPlane, TarskiBetween(c, e, c') && TarskiBetween(d, e, d') && TarskiCong((c, e), (c', e)) && TarskiCong((d, e), (d', e))",
          "Z4",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("X3"),
              @readable.Label("X4"),
              @readable.Label("X1"),
              @readable.Label("X2"),
              @readable.Thm("RhombusDiagBisect_THM", () => rhombusdiagbisect_thm()),
            ],
          ),
        ),
        @readable.have(
          "!(e == c)",
          "U1",
          @readable.steps(
            [
              @readable.assuming("e == c", "U2", @readable.by(@readable.fol, [])),
              @readable.have(
                "c' == c",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("U2"),
                    @readable.Label("Z4"),
                    @readable.Thm("EquivSymmetric", () => equivsymmetric()),
                    @readable.Thm("A3", () => a3()),
                  ],
                ),
              ),
              @readable.have(
                "TarskiBetween(b, d, c)",
                "U3",
                @readable.by(@readable.fol, [@readable.Prev, @readable.Label("X4")]),
              ),
              @readable.by(
                @readable.fol,
                [@readable.Prev, @readable.Label("U3"), @readable.Label("H5")],
              ),
            ],
          ),
        ),
        @readable.have(
          "e == d",
          "V1",
          @readable.steps(
            [
              @readable.assuming("!(e == d)", "V2", @readable.by(@readable.fol, [])),
              @readable.consider(
                "p r q",
                "∃ p : TarskiPlane, ∃ r : TarskiPlane, ∃ q : TarskiPlane, TarskiBetween(p, r, q) && TarskiBetween(r, c, d') && TarskiBetween(e, c, p) && TarskiTriangleCong((r, c, p), (r, c, q)) && TarskiCong((r, c), (e, c)) && TarskiCong((p, r), (d, e))",
                "W1",
                @readable.steps(
                  [
                    @readable.by_thm(
                      th => @tactics.mp_tac(th),
                      @readable.TermsRule(
                        tms => th => @bool.ispecl(tms, th),
                        ["a", "b", "c", "d", "d'", "e"],
                        @readable.Thm("FlatNormal_THM", () => flatnormal_thm()),
                      ),
                    ),
                    @readable.by(
                      @readable.fol,
                      [
                        @readable.Label("Z4"),
                        @readable.Label("X1"),
                        @readable.Label("H4"),
                        @readable.Label("V2"),
                      ],
                    ),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((r, p), (r, q)) && TarskiCong((c, p), (c, q))",
                "W2",
                @readable.by(
                  @readable.fol,
                  [@readable.Label("W1"), @readable.Thm("cong_DEF", () => cong_def())],
                ),
              ),
              @readable.have(
                "!(c == r)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("W1"),
                    @readable.Label("U1"),
                    @readable.Thm("EquivSymmetric", () => equivsymmetric()),
                    @readable.Thm("A3", () => a3()),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((d', p), (d', q))",
                "W3",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("W1"),
                    @readable.Label("W2"),
                    @readable.Thm(
                      "EqDist2PointsBetween_THM",
                      () => eqdist2pointsbetween_thm(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((b', p), (b', q))",
                "W4",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Y1"),
                    @readable.Label("Y13"),
                    @readable.Label("X5"),
                    @readable.Label("W2"),
                    @readable.Label("W3"),
                    @readable.Thm(
                      "EqDist2PointsBetween_THM",
                      () => eqdist2pointsbetween_thm(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((b, p), (b, q))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("X3"),
                    @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                    @readable.Label("X5"),
                    @readable.Label("W3"),
                    @readable.Label("W2"),
                    @readable.Thm(
                      "EqDist2PointsBetween_THM",
                      () => eqdist2pointsbetween_thm(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((c', p), (c', q))",
                "W7",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Y4"),
                    @readable.Label("W4"),
                    @readable.Prev,
                    @readable.Thm(
                      "EqDist2PointsInnerBetween_THM",
                      () => eqdist2pointsinnerbetween_thm(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "is_ordered((c', e, c, p))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Z4"),
                    @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                    @readable.Label("U1"),
                    @readable.Label("W1"),
                    @readable.Thm(
                      "BTransitivityOrdered_THM",
                      () => btransitivityordered_thm(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "TarskiBetween(c', c, p)",
                "W8",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                  ],
                ),
              ),
              @readable.have(
                "!(c' == c)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Z4"),
                    @readable.Label("U1"),
                    @readable.Thm("A6", () => a6()),
                  ],
                ),
              ),
              @readable.have(
                "TarskiCong((p, p), (p, q))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("W8"),
                    @readable.Label("W7"),
                    @readable.Label("W2"),
                    @readable.Thm(
                      "EqDist2PointsBetween_THM",
                      () => eqdist2pointsbetween_thm(),
                    ),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("W1"),
                  @readable.Thm("A6", () => a6()),
                  @readable.Thm("EquivSymmetric", () => equivsymmetric()),
                  @readable.Thm("A3", () => a3()),
                  @readable.Label("V2"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("V1"),
            @readable.Label("Z4"),
            @readable.Thm("EquivSymmetric", () => equivsymmetric()),
            @readable.Thm("A3", () => a3()),
            @readable.Label("X3"),
          ],
        ),
      ],
    ),
  ))
}

///|
let gupta_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Gupta_THM")

///|
/// `Gupta_THM`
pub fn gupta_thm() -> @kernel.Thm {
  gupta_thm_c.get()
}

///|
/// I1part1_THM
fn step_82() -> Unit raise {
  i1part1_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ x : TarskiPlane, !(a == b) && !(a == x) && on_line(x, (a, b)) → (∀ c : TarskiPlane, on_line(c, (a, b)) → on_line(c, (a, x)))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b x, H1 H2 H3, forall c, H4"),
        @readable.have(
          "TarskiBetween(a, b, x) || TarskiBetween(a, x, b) || TarskiBetween(x, a, b)",
          "X1",
          @readable.by(
            @readable.fol,
            [@readable.Label("H3"), @readable.Thm("Line_DEF", () => line_def())],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, b, c) || TarskiBetween(a, c, b) || TarskiBetween(c, a, b)",
          "X2",
          @readable.by(
            @readable.fol,
            [@readable.Label("H4"), @readable.Thm("Line_DEF", () => line_def())],
          ),
        ),
        @readable.assuming(
          "!(x == b) && !(b == c)",
          "Case2",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H4"),
              @readable.Label("X1"),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("H2"),
              @readable.Thm("Line_DEF", () => line_def()),
            ],
          ),
        ),
        @readable.have(
          "TarskiBetween(a, x, c) || TarskiBetween(a, c, x) || TarskiBetween(x, a, c)",
          "",
          @readable.case_split(
            "Y1 | Y2 | Y3    ",
            @readable.by(@readable.fol, [@readable.Label("X1")]),
            @list.List(["TarskiBetween(a, b, x)", "TarskiBetween(a, x, b)", "TarskiBetween(x, a, b)"]),
            @list.List(
              [
                @readable.case_split(
                  "Y11 | Bacb | Bcab    ",
                  @readable.by(@readable.fol, [@readable.Label("X2")]),
                  @list.List(["TarskiBetween(a, b, c)", "TarskiBetween(a, c, b)", "TarskiBetween(c, a, b)"]),
                  @list.List(
                    [
                      @readable.steps(
                        [
                          @readable.have(
                            "TarskiBetween(b, x, c) || TarskiBetween(b, c, x)",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("Y1"),
                                @readable.Label("H1"),
                                @readable.Thm("Gupta_THM", () => gupta_thm()),
                              ],
                            ),
                          ),
                          @readable.have(
                            "is_ordered((a, b, x, c)) || is_ordered((a, b, c, x))",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("Case2"),
                                @readable.Label("Y1"),
                                @readable.Label("Y11"),
                                @readable.Prev,
                                @readable.Thm(
                                  "BTransitivityOrdered_THM",
                                  () => btransitivityordered_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.have(
                            "is_ordered((a, c, b, x))",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("Y1"),
                                @readable.Thm(
                                  "B123and134Ordered_THM",
                                  () => b123and134ordered_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.have(
                            "is_ordered((c, a, b, x))",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("H1"),
                                @readable.Prev,
                                @readable.Label("Y1"),
                                @readable.Thm(
                                  "BTransitivityOrdered_THM",
                                  () => btransitivityordered_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                @readable.case_split(
                  "Babc | Y22 | Bcab    ",
                  @readable.by(@readable.fol, [@readable.Label("X2")]),
                  @list.List(["TarskiBetween(a, b, c)", "TarskiBetween(a, c, b)", "TarskiBetween(c, a, b)"]),
                  @list.List(
                    [
                      @readable.steps(
                        [
                          @readable.have(
                            "is_ordered((a, x, b, c))",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("Y2"),
                                @readable.Thm(
                                  "B123and134Ordered_THM",
                                  () => b123and134ordered_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.consider(
                            "m",
                            "∃ m : TarskiPlane, TarskiBetween(b, a, m) && TarskiCong((a, m), (a, b))",
                            "X5",
                            @readable.by(
                              @readable.fol,
                              [@readable.Prev, @readable.Thm("A4", () => a4())],
                            ),
                          ),
                          @readable.have(
                            "!(a == m)",
                            "X6",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("H1"),
                                @readable.Label("X5"),
                                @readable.Thm("EquivSymmetric", () => equivsymmetric()),
                                @readable.Thm("A3", () => a3()),
                              ],
                            ),
                          ),
                          @readable.have(
                            "TarskiBetween(m, a, b)",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("X5"),
                                @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                              ],
                            ),
                          ),
                          @readable.have(
                            "TarskiBetween(m, a, c) && TarskiBetween(m, a, x)",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("Y22"),
                                @readable.Label("Y2"),
                                @readable.Thm(
                                  "B124and234then123_THM",
                                  () => b124and234then123_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Label("X6"),
                              @readable.Thm("Gupta_THM", () => gupta_thm()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.have(
                            "TarskiBetween(c, a, x)",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("Y2"),
                                @readable.Thm(
                                  "B124and234then123_THM",
                                  () => b124and234then123_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                @readable.case_split(
                  "Babc | Bacb | Bcab    ",
                  @readable.by(@readable.fol, [@readable.Label("X2")]),
                  @list.List(["TarskiBetween(a, b, c)", "TarskiBetween(a, c, b)", "TarskiBetween(c, a, b)"]),
                  @list.List(
                    [
                      @readable.steps(
                        [
                          @readable.have(
                            "is_ordered((x, a, b, c))",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("H1"),
                                @readable.Prev,
                                @readable.Label("Y3"),
                                @readable.Thm(
                                  "BTransitivityOrdered_THM",
                                  () => btransitivityordered_thm(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Thm("is_ordered_DEF", () => is_ordered_def()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("Y3"),
                              @readable.Prev,
                              @readable.Thm(
                                "B124and234then123_THM",
                                () => b124and234then123_thm(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.have(
                            "TarskiBetween(b, a, x) && TarskiBetween(b, a, c)",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("Y3"),
                                @readable.Prev,
                                @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Label("H1"),
                              @readable.Thm("Gupta_THM", () => gupta_thm()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
            @readable.Label("H2"),
            @readable.Thm("Line_DEF", () => line_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let i1part1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1part1_THM")

///|
/// `I1part1_THM`
pub fn i1part1_thm() -> @kernel.Thm {
  i1part1_thm_c.get()
}

///|
/// I1part2_THM
fn step_85() -> Unit raise {
  i1part2_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ x : TarskiPlane, !(a == b) && !(a == x) && on_line(x, (a, b)) → equal_line((a, b), (a, x))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b x, H1 H2 H3"),
        @readable.have(
          "∀ c : TarskiPlane, on_line(c, (a, b)) == on_line(c, (a, x))",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall c"),
              @readable.eq_tac(
                "Left",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("H2"),
                    @readable.Label("H3"),
                    @readable.Thm("I1part1_THM", () => i1part1_thm()),
                  ],
                ),
              ),
              @readable.have(
                "on_line(b, (a, x))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H3"),
                    @readable.Thm("Line_DEF", () => line_def()),
                    @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
                    @readable.Label("H2"),
                    @readable.Thm("Line_DEF", () => line_def()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("H1"),
                  @readable.Label("H2"),
                  @readable.Thm("I1part1_THM", () => i1part1_thm()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Prev,
            @readable.Thm("LineEq_DEF", () => lineeq_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let i1part2_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1part2_THM")

///|
/// `I1part2_THM`
pub fn i1part2_thm() -> @kernel.Thm {
  i1part2_thm_c.get()
}

///|
/// LineEqRefl_THM
fn step_88() -> Unit raise {
  lineeqrefl_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, !(a == b) → equal_line((a, b), (a, b))",
    @readable.by(@readable.fol, [@readable.Thm("LineEq_DEF", () => lineeq_def())]),
  ))
}

///|
let lineeqrefl_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineEqRefl_THM")

///|
/// `LineEqRefl_THM`
pub fn lineeqrefl_thm() -> @kernel.Thm {
  lineeqrefl_thm_c.get()
}

///|
/// LineEqA1_THM
fn step_89() -> Unit raise {
  lineeqa1_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, !(a == b) → equal_line((a, b), (b, a))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b, H1"),
        @readable.have(
          "∀ c : TarskiPlane, on_line(c, (a, b)) == on_line(c, (b, a))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("Line_DEF", () => line_def()),
              @readable.Thm("Bsymmetry_THM", () => bsymmetry_thm()),
              @readable.Label("H1"),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm("LineEq_DEF", () => lineeq_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let lineeqa1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineEqA1_THM")

///|
/// `LineEqA1_THM`
pub fn lineeqa1_thm() -> @kernel.Thm {
  lineeqa1_thm_c.get()
}

///|
/// LineEqSymmetric_THM
fn step_90() -> Unit raise {
  lineeqsymmetric_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, !(a == b) && !(c == d) → equal_line((a, b), (c, d)) → equal_line((c, d), (a, b))",
    @readable.by(@readable.fol, [@readable.Thm("LineEq_DEF", () => lineeq_def())]),
  ))
}

///|
let lineeqsymmetric_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineEqSymmetric_THM")

///|
/// `LineEqSymmetric_THM`
pub fn lineeqsymmetric_thm() -> @kernel.Thm {
  lineeqsymmetric_thm_c.get()
}

///|
/// LineEqTrans_THM
fn step_91() -> Unit raise {
  lineeqtrans_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, ∀ e : TarskiPlane, ∀ f : TarskiPlane, !(a == b) && !(c == d) && !(e == f) → equal_line((a, b), (c, d)) → equal_line((c, d), (e, f)) → equal_line((a, b), (e, f))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b c d e f, H1, H2, H3"),
        @readable.have(
          "∀ y : TarskiPlane, on_line(y, (a, b)) == on_line(y, (e, f))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("LineEq_DEF", () => lineeq_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Thm("LineEq_DEF", () => lineeq_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let lineeqtrans_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineEqTrans_THM")

///|
/// `LineEqTrans_THM`
pub fn lineeqtrans_thm() -> @kernel.Thm {
  lineeqtrans_thm_c.get()
}

///|
/// onlineEq_THM
fn step_92() -> Unit raise {
  onlineeq_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ c : TarskiPlane, ∀ d : TarskiPlane, ∀ x : TarskiPlane, on_line(x, (a, b)) → equal_line((a, b), (c, d)) → on_line(x, (c, d))",
    @readable.by(@readable.fol, [@readable.Thm("LineEq_DEF", () => lineeq_def())]),
  ))
}

///|
let onlineeq_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("onlineEq_THM")

///|
/// `onlineEq_THM`
pub fn onlineeq_thm() -> @kernel.Thm {
  onlineeq_thm_c.get()
}

///|
/// I1part2Reverse_THM
fn step_93() -> Unit raise {
  i1part2reverse_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ y : TarskiPlane, !(a == b) && !(b == y) → on_line(y, (a, b)) → equal_line((a, b), (y, b))",
    @readable.steps(
      [
        @readable.intro_tac("forall a b y, H1, H3"),
        @readable.have(
          "equal_line((a, b), (b, a)) && equal_line((b, y), (y, b))",
          "Y1",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("LineEqA1_THM", () => lineeqa1_thm())],
          ),
        ),
        @readable.have(
          "on_line(y, (b, a))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Label("Y1"),
              @readable.Thm("onlineEq_THM", () => onlineeq_thm()),
            ],
          ),
        ),
        @readable.have(
          "equal_line((a, b), (b, y))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("Y1"),
              @readable.Thm("I1part2_THM", () => i1part2_thm()),
              @readable.Thm("LineEqTrans_THM", () => lineeqtrans_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Label("Y1"),
            @readable.Thm("LineEqTrans_THM", () => lineeqtrans_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let i1part2reverse_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1part2Reverse_THM")

///|
/// `I1part2Reverse_THM`
pub fn i1part2reverse_thm() -> @kernel.Thm {
  i1part2reverse_thm_c.get()
}

///|
/// I1_THM
fn step_98() -> Unit raise {
  i1_thm_c.set(@readable.prove(
    "∀ a : TarskiPlane, ∀ b : TarskiPlane, ∀ x : TarskiPlane, ∀ y : TarskiPlane, !(a == b) && !(x == y) && on_line(a, (x, y)) && on_line(b, (x, y)) → equal_line((x, y), (a, b))",
    @readable.steps_then(
      [@readable.intro_tac("forall a b x y, H1 H2 H3 H4")],
      @readable.case_split(
        "H5 | H6    ",
        @readable.by(@readable.fol, []),
        @list.List(["x == b", "!(x == b)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "equal_line((b, a), (a, b)) && equal_line((x, y), (b, y))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Thm("LineEqA1_THM", () => lineeqa1_thm()),
                      @readable.Label("H2"),
                      @readable.Label("H5"),
                      @readable.Thm("LineEqRefl_THM", () => lineeqrefl_thm()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H3"),
                    @readable.Label("H5"),
                    @readable.Label("H2"),
                    @readable.Thm("I1part2_THM", () => i1part2_thm()),
                    @readable.Label("H1"),
                    @readable.Label("H2"),
                    @readable.Prev,
                    @readable.Thm("LineEqTrans_THM", () => lineeqtrans_thm()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "equal_line((x, y), (x, b))",
                  "P4",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H2"),
                      @readable.Label("H6"),
                      @readable.Label("H4"),
                      @readable.Thm("I1part2_THM", () => i1part2_thm()),
                    ],
                  ),
                ),
                @readable.have(
                  "on_line(a, (x, b))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H2"),
                      @readable.Label("H6"),
                      @readable.Label("H3"),
                      @readable.Thm("onlineEq_THM", () => onlineeq_thm()),
                    ],
                  ),
                ),
                @readable.have(
                  "equal_line((x, b), (a, b))",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H6"),
                      @readable.Label("H1"),
                      @readable.Thm("I1part2Reverse_THM", () => i1part2reverse_thm()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("H2"),
                    @readable.Label("H6"),
                    @readable.Label("P4"),
                    @readable.Prev,
                    @readable.Thm("LineEqTrans_THM", () => lineeqtrans_thm()),
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
let i1_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1_THM")

///|
/// `I1_THM`
pub fn i1_thm() -> @kernel.Thm {
  i1_thm_c.get()
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
  step_23()
  step_25()
  step_27()
  step_30()
  step_31()
  step_34()
  step_38()
  step_40()
  step_41()
  step_42()
  step_45()
  step_48()
  step_50()
  step_53()
  step_54()
  step_55()
  step_58()
  step_60()
  step_62()
  step_64()
  step_67()
  step_68()
  step_70()
  step_72()
  step_73()
  step_74()
  step_82()
  step_85()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_98()
}
