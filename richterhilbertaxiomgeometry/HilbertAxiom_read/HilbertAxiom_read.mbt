// Translated from upstream RichterHilbertAxiomGeometry/HilbertAxiom_read.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:27
fn step_1() -> Unit raise {
  @kernel.new_type("point", 0L)
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:28
fn step_2() -> Unit raise {
  @readable.newconstant("Between", @term_syntax.parse_type("(Point, Point, Point) -> Bool"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:29
fn step_3() -> Unit raise {
  @readable.newconstant("Line", @term_syntax.parse_type("((Point) -> Bool) -> Bool"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:30
fn step_4() -> Unit raise {
  @readable.newconstant("≡", @term_syntax.parse_type("((Point) -> Bool, (Point) -> Bool) -> Bool"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:32
fn step_5() -> Unit raise {
  @readable.parseasinfix("≅", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:33
fn step_6() -> Unit raise {
  @readable.parseasinfix("same_side", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:34
fn step_7() -> Unit raise {
  @readable.parseasinfix("≡", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:35
fn step_8() -> Unit raise {
  @readable.parseasinfix("<__", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:36
fn step_9() -> Unit raise {
  @readable.parseasinfix("<_ang", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:37
fn step_10() -> Unit raise {
  @readable.parseasinfix("suppl", (12L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:38
fn step_11() -> Unit raise {
  @readable.parseasinfix("∉", (11L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:39
fn step_12() -> Unit raise {
  @readable.parseasinfix("∥", (12L, "right"))
}

///|
/// NOTIN
fn step_13() -> Unit raise {
  notin_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀a l. a ∉ l ⇔ ¬(a ∈ l)")))
}

///|
let notin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOTIN")

///|
/// `NOTIN`
pub fn notin() -> @kernel.Thm {
  notin_c.get()
}

///|
/// INTER_TENSOR
fn step_14() -> Unit raise {
  inter_tensor_c.set(@readable.prove(
    "\n  forall s s' t t'.  s SUBSET s' /\\  t SUBSET t'  ==>  s INTER t SUBSET s' INTER t'",
    @readable.by(@readable.set, []),
  ))
}

///|
let inter_tensor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTER_TENSOR")

///|
/// `INTER_TENSOR`
pub fn inter_tensor() -> @kernel.Thm {
  inter_tensor_c.get()
}

///|
/// Interval_DEF
fn step_16() -> Unit raise {
  interval_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A B. Open (A, B) = {X | Between A X B}")))
}

///|
let interval_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Interval_DEF")

///|
/// `Interval_DEF`
pub fn interval_def() -> @kernel.Thm {
  interval_def_c.get()
}

///|
/// Collinear_DEF
fn step_17() -> Unit raise {
  collinear_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Collinear A B C  ⇔\n  ∃l. Line l ∧ A ∈ l ∧ B ∈ l ∧ C ∈ l")))
}

///|
let collinear_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Collinear_DEF")

///|
/// `Collinear_DEF`
pub fn collinear_def() -> @kernel.Thm {
  collinear_def_c.get()
}

///|
/// SameSide_DEF
fn step_18() -> Unit raise {
  sameside_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  A,B same_side l  ⇔\n  Line l ∧ ¬ ∃X.  X ∈ l  ∧  X ∈ Open (A, B)")))
}

///|
let sameside_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SameSide_DEF")

///|
/// `SameSide_DEF`
pub fn sameside_def() -> @kernel.Thm {
  sameside_def_c.get()
}

///|
/// Ray_DEF
fn step_19() -> Unit raise {
  ray_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A B. ray A B = {X | ¬(A = B) ∧ Collinear A B X ∧ A ∉ Open (X, B)}")))
}

///|
let ray_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Ray_DEF")

///|
/// `Ray_DEF`
pub fn ray_def() -> @kernel.Thm {
  ray_def_c.get()
}

///|
/// Ordered_DEF
fn step_20() -> Unit raise {
  ordered_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ordered A B C D  ⇔\n  B ∈ Open (A, C) ∧ B ∈ Open (A, D) ∧ C ∈ Open (A, D) ∧ C ∈ Open (B, D)")))
}

///|
let ordered_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Ordered_DEF")

///|
/// `Ordered_DEF`
pub fn ordered_def() -> @kernel.Thm {
  ordered_def_c.get()
}

///|
/// InteriorAngle_DEF
fn step_21() -> Unit raise {
  interiorangle_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A O B.  int_angle A O B =\n    {P | ¬Collinear A O B ∧ ∃a b.\n               Line a ∧ O ∈ a ∧ A ∈ a ∧ Line b ∧ O ∈ b ∧ B ∈ b ∧\n               P ∉ a ∧ P ∉ b ∧ P,B same_side a ∧ P,A same_side b}")))
}

///|
let interiorangle_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorAngle_DEF")

///|
/// `InteriorAngle_DEF`
pub fn interiorangle_def() -> @kernel.Thm {
  interiorangle_def_c.get()
}

///|
/// InteriorTriangle_DEF
fn step_22() -> Unit raise {
  interiortriangle_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A B C.  int_triangle A B C =\n    {P | P ∈ int_angle A B C  ∧\n         P ∈ int_angle B C A  ∧\n         P ∈ int_angle C A B}")))
}

///|
let interiortriangle_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorTriangle_DEF")

///|
/// `InteriorTriangle_DEF`
pub fn interiortriangle_def() -> @kernel.Thm {
  interiortriangle_def_c.get()
}

///|
/// Tetralateral_DEF
fn step_23() -> Unit raise {
  tetralateral_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Tetralateral A B C D  ⇔\n  ¬(A = B) ∧ ¬(A = C) ∧ ¬(A = D) ∧ ¬(B = C) ∧ ¬(B = D) ∧ ¬(C = D) ∧\n  ¬Collinear A B C ∧ ¬Collinear B C D ∧ ¬Collinear C D A ∧ ¬Collinear D A B")))
}

///|
let tetralateral_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Tetralateral_DEF")

///|
/// `Tetralateral_DEF`
pub fn tetralateral_def() -> @kernel.Thm {
  tetralateral_def_c.get()
}

///|
/// Quadrilateral_DEF
fn step_24() -> Unit raise {
  quadrilateral_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Quadrilateral A B C D  ⇔\n  Tetralateral A B C D ∧\n  Open (A, B) ∩ Open (C, D) = ∅ ∧\n  Open (B, C) ∩ Open (D, A) = ∅")))
}

///|
let quadrilateral_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Quadrilateral_DEF")

///|
/// `Quadrilateral_DEF`
pub fn quadrilateral_def() -> @kernel.Thm {
  quadrilateral_def_c.get()
}

///|
/// ConvexQuad_DEF
fn step_25() -> Unit raise {
  convexquad_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ConvexQuadrilateral A B C D  ⇔\n  Quadrilateral A B C D ∧\n  A ∈ int_angle B C D ∧ B ∈ int_angle C D A ∧ C ∈ int_angle D A B ∧ D ∈ int_angle A B C")))
}

///|
let convexquad_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConvexQuad_DEF")

///|
/// `ConvexQuad_DEF`
pub fn convexquad_def() -> @kernel.Thm {
  convexquad_def_c.get()
}

///|
/// Segment_DEF
fn step_26() -> Unit raise {
  segment_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  seg A B = {A, B} ∪ Open (A, B)")))
}

///|
let segment_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Segment_DEF")

///|
/// `Segment_DEF`
pub fn segment_def() -> @kernel.Thm {
  segment_def_c.get()
}

///|
/// SEGMENT
fn step_27() -> Unit raise {
  segment_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Segment s  ⇔  ∃A B. s = seg A B ∧ ¬(A = B)")))
}

///|
let segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEGMENT")

///|
/// `SEGMENT`
pub fn segment() -> @kernel.Thm {
  segment_c.get()
}

///|
/// SegmentOrdering_DEF
fn step_28() -> Unit raise {
  segmentordering_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  s <__ t   ⇔\n  Segment s ∧\n  ∃C D X. t = seg C D ∧ X ∈ Open (C, D) ∧ s ≡ seg C X")))
}

///|
let segmentordering_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentOrdering_DEF")

///|
/// `SegmentOrdering_DEF`
pub fn segmentordering_def() -> @kernel.Thm {
  segmentordering_def_c.get()
}

///|
/// Angle_DEF
fn step_29() -> Unit raise {
  angle_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∡ A O B = ray O A ∪ ray O B")))
}

///|
let angle_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Angle_DEF")

///|
/// `Angle_DEF`
pub fn angle_def() -> @kernel.Thm {
  angle_def_c.get()
}

///|
/// ANGLE
fn step_30() -> Unit raise {
  angle_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Angle α  ⇔  ∃A O B. α = ∡ A O B ∧ ¬Collinear A O B")))
}

///|
let angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE")

///|
/// `ANGLE`
pub fn angle() -> @kernel.Thm {
  angle_c.get()
}

///|
/// AngleOrdering_DEF
fn step_31() -> Unit raise {
  angleordering_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  α <_ang β  ⇔\n  Angle α ∧\n  ∃A O B G. ¬Collinear A O B  ∧  β = ∡ A O B ∧\n             G ∈ int_angle A O B  ∧  α ≡ ∡ A O G")))
}

///|
let angleordering_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleOrdering_DEF")

///|
/// `AngleOrdering_DEF`
pub fn angleordering_def() -> @kernel.Thm {
  angleordering_def_c.get()
}

///|
/// RAY
fn step_32() -> Unit raise {
  ray_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Ray r  ⇔  ∃O A. ¬(O = A) ∧ r = ray O A")))
}

///|
let ray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAY")

///|
/// `RAY`
pub fn ray() -> @kernel.Thm {
  ray_c.get()
}

///|
/// TriangleCong_DEF
fn step_33() -> Unit raise {
  trianglecong_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A B C A' B' C'. (A, B, C) ≅ (A', B', C')  ⇔\n  ¬Collinear A B C ∧ ¬Collinear A' B' C' ∧\n  seg A B ≡ seg A' B' ∧ seg A C ≡ seg A' C' ∧ seg B C ≡ seg B' C' ∧\n  ∡ A B C ≡ ∡ A' B' C' ∧\n  ∡ B C A ≡ ∡ B' C' A' ∧\n  ∡ C A B ≡ ∡ C' A' B'")))
}

///|
let trianglecong_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TriangleCong_DEF")

///|
/// `TriangleCong_DEF`
pub fn trianglecong_def() -> @kernel.Thm {
  trianglecong_def_c.get()
}

///|
/// SupplementaryAngles_DEF
fn step_34() -> Unit raise {
  supplementaryangles_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀α β. α suppl β   ⇔\n  ∃A O B A'. ¬Collinear A O B  ∧  O ∈ Open (A, A')  ∧  α = ∡ A O B  ∧  β = ∡ B O A'")))
}

///|
let supplementaryangles_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementaryAngles_DEF")

///|
/// `SupplementaryAngles_DEF`
pub fn supplementaryangles_def() -> @kernel.Thm {
  supplementaryangles_def_c.get()
}

///|
/// RightAngle_DEF
fn step_35() -> Unit raise {
  rightangle_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀α. Right α  ⇔  ∃β. α suppl β ∧ α ≡ β")))
}

///|
let rightangle_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RightAngle_DEF")

///|
/// `RightAngle_DEF`
pub fn rightangle_def() -> @kernel.Thm {
  rightangle_def_c.get()
}

///|
/// PlaneComplement_DEF
fn step_36() -> Unit raise {
  planecomplement_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀α. complement α = {P | P ∉ α}")))
}

///|
let planecomplement_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PlaneComplement_DEF")

///|
/// `PlaneComplement_DEF`
pub fn planecomplement_def() -> @kernel.Thm {
  planecomplement_def_c.get()
}

///|
/// CONVEX
fn step_37() -> Unit raise {
  convex_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  Convex α  ⇔  ∀A B. A ∈ α ∧ B ∈ α  ⇒ Open (A, B) ⊂ α")))
}

///|
let convex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX")

///|
/// `CONVEX`
pub fn convex() -> @kernel.Thm {
  convex_c.get()
}

///|
/// PARALLEL
fn step_38() -> Unit raise {
  parallel_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀l k. l ∥ k   ⇔\n  Line l ∧ Line k ∧ l ∩ k = ∅")))
}

///|
let parallel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARALLEL")

///|
/// `PARALLEL`
pub fn parallel() -> @kernel.Thm {
  parallel_c.get()
}

///|
/// Parallelogram_DEF
fn step_39() -> Unit raise {
  parallelogram_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀A B C D. Parallelogram A B C D  ⇔\n  Quadrilateral A B C D ∧ ∃a b c d.\n  Line a ∧ A ∈ a ∧ B ∈ a ∧\n  Line b ∧ B ∈ b ∧ C ∈ b ∧\n  Line c  ∧ C ∈ c ∧ D ∈ d ∧\n  Line d ∧ D ∈ d ∧ A ∈ d ∧\n  a ∥ c  ∧  b ∥ d")))
}

///|
let parallelogram_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Parallelogram_DEF")

///|
/// `Parallelogram_DEF`
pub fn parallelogram_def() -> @kernel.Thm {
  parallelogram_def_c.get()
}

///|
/// InteriorCircle_DEF
fn step_40() -> Unit raise {
  interiorcircle_def_c.set(@readable.newdefinition(@readable.parse_qproof(";\n  ∀O R.  int_circle O R = {P | ¬(O = R) ∧ (P = O  ∨  seg O P <__ seg O R)}\n")))
}

///|
let interiorcircle_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorCircle_DEF")

///|
/// `InteriorCircle_DEF`
pub fn interiorcircle_def() -> @kernel.Thm {
  interiorcircle_def_c.get()
}

///|
/// I1
fn step_41() -> Unit raise {
  i1_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B.  ¬(A = B) ⇒ ∃! l. Line l ∧  A ∈ l ∧ B ∈ l")))
}

///|
let i1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1")

///|
/// `I1`
pub fn i1() -> @kernel.Thm {
  i1_c.get()
}

///|
/// I2
fn step_42() -> Unit raise {
  i2_c.set(@readable.newaxiom(@readable.parse_qproof(";∀l. Line l  ⇒  ∃A B. A ∈ l ∧ B ∈ l ∧ ¬(A = B)")))
}

///|
let i2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I2")

///|
/// `I2`
pub fn i2() -> @kernel.Thm {
  i2_c.get()
}

///|
/// I3
fn step_43() -> Unit raise {
  i3_c.set(@readable.newaxiom(@readable.parse_qproof(";∃A B C. ¬(A = B) ∧ ¬(A = C) ∧ ¬(B = C) ∧\n                             ¬Collinear A B C")))
}

///|
let i3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I3")

///|
/// `I3`
pub fn i3() -> @kernel.Thm {
  i3_c.get()
}

///|
/// B1
fn step_44() -> Unit raise {
  b1_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B C. Between A B C ⇒ ¬(A = B) ∧ ¬(A = C) ∧ ¬(B = C) ∧\n            Between C B A ∧ Collinear A B C")))
}

///|
let b1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B1")

///|
/// `B1`
pub fn b1() -> @kernel.Thm {
  b1_c.get()
}

///|
/// B2
fn step_45() -> Unit raise {
  b2_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B. ¬(A = B) ⇒ ∃C. Between A B C")))
}

///|
let b2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B2")

///|
/// `B2`
pub fn b2() -> @kernel.Thm {
  b2_c.get()
}

///|
/// B3
fn step_46() -> Unit raise {
  b3_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B C. ¬(A = B) ∧ ¬(A = C) ∧ ¬(B = C) ∧ Collinear A B C\n    ⇒ (Between A B C ∨ Between B C A ∨ Between C A B) ∧\n        ¬(Between A B C ∧ Between B C A) ∧\n        ¬(Between A B C ∧ Between C A B) ∧\n        ¬(Between B C A ∧ Between C A B)")))
}

///|
let b3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B3")

///|
/// `B3`
pub fn b3() -> @kernel.Thm {
  b3_c.get()
}

///|
/// B4
fn step_47() -> Unit raise {
  b4_c.set(@readable.newaxiom(@readable.parse_qproof(";∀l A B C. Line l ∧ ¬Collinear A B C ∧\n   A ∉ l ∧ B ∉ l ∧ C ∉ l ∧\n   (∃X. X ∈ l ∧ Between A X C) ⇒\n   (∃Y. Y ∈ l ∧ Between A Y B) ∨ (∃Y. Y ∈ l ∧ Between B Y C)")))
}

///|
let b4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B4")

///|
/// `B4`
pub fn b4() -> @kernel.Thm {
  b4_c.get()
}

///|
/// C1
fn step_48() -> Unit raise {
  c1_c.set(@readable.newaxiom(@readable.parse_qproof(";∀s O Z. Segment s ∧ ¬(O = Z)  ⇒\n   ∃! P. P ∈ ray O Z ━ {O}  ∧  seg O P ≡ s")))
}

///|
let c1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C1")

///|
/// `C1`
pub fn c1() -> @kernel.Thm {
  c1_c.get()
}

///|
/// C2Reflexive
fn step_49() -> Unit raise {
  c2reflexive_c.set(@readable.newaxiom(@readable.parse_qproof(";Segment s  ⇒  s ≡ s")))
}

///|
let c2reflexive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C2Reflexive")

///|
/// `C2Reflexive`
pub fn c2reflexive() -> @kernel.Thm {
  c2reflexive_c.get()
}

///|
/// C2Symmetric
fn step_50() -> Unit raise {
  c2symmetric_c.set(@readable.newaxiom(@readable.parse_qproof(";Segment s ∧ Segment t ∧ s ≡ t  ⇒  t ≡ s")))
}

///|
let c2symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C2Symmetric")

///|
/// `C2Symmetric`
pub fn c2symmetric() -> @kernel.Thm {
  c2symmetric_c.get()
}

///|
/// C2Transitive
fn step_51() -> Unit raise {
  c2transitive_c.set(@readable.newaxiom(@readable.parse_qproof(";Segment s ∧ Segment t ∧ Segment u ∧\n   s ≡ t ∧ t ≡ u ⇒  s ≡ u")))
}

///|
let c2transitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C2Transitive")

///|
/// `C2Transitive`
pub fn c2transitive() -> @kernel.Thm {
  c2transitive_c.get()
}

///|
/// C3
fn step_52() -> Unit raise {
  c3_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B C A' B' C'.  B ∈ Open (A, C) ∧ B' ∈ Open (A', C') ∧\n  seg A B ≡ seg A' B' ∧ seg B C ≡ seg B' C'  ⇒\n  seg A C ≡ seg A' C'")))
}

///|
let c3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C3")

///|
/// `C3`
pub fn c3() -> @kernel.Thm {
  c3_c.get()
}

///|
/// C4
fn step_53() -> Unit raise {
  c4_c.set(@readable.newaxiom(@readable.parse_qproof(";∀α O A l Y. Angle α ∧ ¬(O = A) ∧ Line l ∧ O ∈ l ∧ A ∈ l ∧ Y ∉ l\n    ⇒ ∃! r. Ray r  ∧  ∃B. ¬(O = B)  ∧  r = ray O B  ∧\n          B ∉ l  ∧  B,Y same_side l  ∧  ∡ A O B ≡ α")))
}

///|
let c4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C4")

///|
/// `C4`
pub fn c4() -> @kernel.Thm {
  c4_c.get()
}

///|
/// C5Reflexive
fn step_54() -> Unit raise {
  c5reflexive_c.set(@readable.newaxiom(@readable.parse_qproof(";Angle α  ⇒  α ≡ α")))
}

///|
let c5reflexive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C5Reflexive")

///|
/// `C5Reflexive`
pub fn c5reflexive() -> @kernel.Thm {
  c5reflexive_c.get()
}

///|
/// C5Symmetric
fn step_55() -> Unit raise {
  c5symmetric_c.set(@readable.newaxiom(@readable.parse_qproof(";Angle α ∧ Angle β ∧ α ≡ β  ⇒  β ≡ α")))
}

///|
let c5symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C5Symmetric")

///|
/// `C5Symmetric`
pub fn c5symmetric() -> @kernel.Thm {
  c5symmetric_c.get()
}

///|
/// C5Transitive
fn step_56() -> Unit raise {
  c5transitive_c.set(@readable.newaxiom(@readable.parse_qproof(";Angle α ∧ Angle β ∧ Angle γ ∧\n   α ≡ β ∧ β ≡ γ ⇒  α ≡ γ")))
}

///|
let c5transitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C5Transitive")

///|
/// `C5Transitive`
pub fn c5transitive() -> @kernel.Thm {
  c5transitive_c.get()
}

///|
/// C6
fn step_57() -> Unit raise {
  c6_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A B C A' B' C'. ¬Collinear A B C ∧ ¬Collinear A' B' C' ∧\n   seg B A ≡ seg B' A' ∧ seg B C ≡ seg B' C' ∧ ∡ A B C ≡ ∡ A' B' C'\n   ⇒ ∡ B C A ≡ ∡ B' C' A'")))
}

///|
let c6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C6")

///|
/// `C6`
pub fn c6() -> @kernel.Thm {
  c6_c.get()
}

///|
/// IN_Interval
fn step_58() -> Unit raise {
  in_interval_c.set(@readable.prove(
    "\n  forall A B X. X IN Open (A, B)  <=>  Between A X B",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("Interval_DEF", () => interval_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_Interval")

///|
/// `IN_Interval`
pub fn in_interval() -> @kernel.Thm {
  in_interval_c.get()
}

///|
/// IN_Ray
fn step_62() -> Unit raise {
  in_ray_c.set(@readable.prove(
    "\n  forall A B X. X IN ray A B  <=>  ~(A = B) /\\  Collinear A B X /\\  A NOTIN Open (X, B)",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("Ray_DEF", () => ray_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_ray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_Ray")

///|
/// `IN_Ray`
pub fn in_ray() -> @kernel.Thm {
  in_ray_c.get()
}

///|
/// IN_InteriorAngle
fn step_64() -> Unit raise {
  in_interiorangle_c.set(@readable.prove(
    "\n  forall A O B P. P IN int_angle A O B  <=>\n    ~Collinear A O B /\\  ?a b.\n    Line a /\\  O IN a /\\  A IN a /\\  Line b /\\  O IN b /\\  B IN b /\\ \n    P NOTIN a /\\  P NOTIN b /\\  P,B same_side a /\\  P,A same_side b",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("InteriorAngle_DEF", () => interiorangle_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_interiorangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_InteriorAngle")

///|
/// `IN_InteriorAngle`
pub fn in_interiorangle() -> @kernel.Thm {
  in_interiorangle_c.get()
}

///|
/// IN_InteriorTriangle
fn step_66() -> Unit raise {
  in_interiortriangle_c.set(@readable.prove(
    "\n  forall A B C P. P IN int_triangle A B C  <=>\n    P IN int_angle A B C  /\\   P IN int_angle B C A  /\\   P IN int_angle C A B",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("InteriorTriangle_DEF", () => interiortriangle_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_interiortriangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_InteriorTriangle")

///|
/// `IN_InteriorTriangle`
pub fn in_interiortriangle() -> @kernel.Thm {
  in_interiortriangle_c.get()
}

///|
/// IN_PlaneComplement
fn step_68() -> Unit raise {
  in_planecomplement_c.set(@readable.prove(
    "\n  forall alpha. forall P. P IN complement alpha  <=>  P NOTIN alpha",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("PlaneComplement_DEF", () => planecomplement_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_planecomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_PlaneComplement")

///|
/// `IN_PlaneComplement`
pub fn in_planecomplement() -> @kernel.Thm {
  in_planecomplement_c.get()
}

///|
/// IN_InteriorCircle
fn step_70() -> Unit raise {
  in_interiorcircle_c.set(@readable.prove(
    "\n  forall O R P. P IN int_circle O R  <=>\n    ~(O = R) /\\  (P = O  \\/  seg O P <__ seg O R)",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("InteriorCircle_DEF", () => interiorcircle_def()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_interiorcircle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_InteriorCircle")

///|
/// `IN_InteriorCircle`
pub fn in_interiorcircle() -> @kernel.Thm {
  in_interiorcircle_c.get()
}

///|
/// B1'
fn step_72() -> Unit raise {
  b1_p_c.set(@readable.prove(
    "\n  forall A B C.  B IN Open (A, C) ==> ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\ \n            B IN Open (C, A) /\\  Collinear A B C",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("IN_Interval", () => in_interval()),
        @readable.Thm("B1", () => b1()),
      ],
    ),
  ))
}

///|
let b1_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B1'")

///|
/// `B1'`
pub fn b1_p() -> @kernel.Thm {
  b1_p_c.get()
}

///|
/// B2'
fn step_76() -> Unit raise {
  b2_p_c.set(@readable.prove(
    "\n  forall A B. ~(A = B) ==> ?C.  B IN Open (A, C)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("IN_Interval", () => in_interval()),
        @readable.Thm("B2", () => b2()),
      ],
    ),
  ))
}

///|
let b2_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B2'")

///|
/// `B2'`
pub fn b2_p() -> @kernel.Thm {
  b2_p_c.get()
}

///|
/// B3'
fn step_78() -> Unit raise {
  b3_p_c.set(@readable.prove(
    "\n  forall A B C. ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  Collinear A B C\n    ==> (B IN Open (A, C) \\/ C IN Open (B, A) \\/ A IN Open (C, B)) /\\ \n       ~(B IN Open (A, C) /\\  C IN Open (B, A)) /\\ \n       ~(B IN Open (A, C) /\\  A IN Open (C, B)) /\\ \n       ~(C IN Open (B, A) /\\  A IN Open (C, B))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("IN_Interval", () => in_interval()),
        @readable.Thm("B3", () => b3()),
      ],
    ),
  ))
}

///|
let b3_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B3'")

///|
/// `B3'`
pub fn b3_p() -> @kernel.Thm {
  b3_p_c.get()
}

///|
/// B4'
fn step_80() -> Unit raise {
  b4_p_c.set(@readable.prove(
    "\n  forall l A B C. Line l /\\  ~Collinear A B C /\\ \n    A NOTIN l /\\  B NOTIN l /\\  C NOTIN l /\\ \n    (?X. X IN l /\\   X IN Open (A, C)) ==>\n    (?Y. Y IN l /\\   Y IN Open (A, B)) \\/ (?Y. Y IN l /\\   Y IN Open (B, C))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("IN_Interval", () => in_interval()),
        @readable.Thm("B4", () => b4()),
      ],
    ),
  ))
}

///|
let b4_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B4'")

///|
/// `B4'`
pub fn b4_p() -> @kernel.Thm {
  b4_p_c.get()
}

///|
/// B4''
fn step_82() -> Unit raise {
  b4_p_p_c.set(@readable.prove(
    "\n  forall l A B C.\n  Line l /\\  ~Collinear A B C /\\  A NOTIN l /\\  B NOTIN l /\\  C NOTIN l  /\\ \n  A,B same_side l  /\\   B,C same_side l  ==>  A,C same_side l",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("SameSide_DEF", () => sameside_def())],
        ),
        @readable.by(@readable.fol, [@readable.Thm("B4'", () => b4_p())]),
      ],
    ),
  ))
}

///|
let b4_p_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B4''")

///|
/// `B4''`
pub fn b4_p_p() -> @kernel.Thm {
  b4_p_p_c.get()
}

///|
/// DisjointOneNotOther
fn step_85() -> Unit raise {
  disjointonenotother_c.set(@readable.prove(
    "\n  forall l m. (forall x:A. x IN m  ==> x NOTIN l)  <=>  l INTER m = {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("NOTIN", () => notin()),
        @readable.Thm("IN_INTER", () => @sets.in_inter()),
        @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
      ],
    ),
  ))
}

///|
let disjointonenotother_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DisjointOneNotOther")

///|
/// `DisjointOneNotOther`
pub fn disjointonenotother() -> @kernel.Thm {
  disjointonenotother_c.get()
}

///|
/// EquivIntersectionHelp
fn step_89() -> Unit raise {
  equivintersectionhelp_c.set(@readable.prove(
    "\n  forall e x:A. forall l m:A->bool.\n  (l INTER m = {x}  \\/  m INTER l = {x})  /\\   e IN m DIFF {x}   ==>  e NOTIN l",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("NOTIN", () => notin()),
        @readable.Thm("IN_INTER", () => @sets.in_inter()),
        @readable.Thm("IN_SING", () => @sets.in_sing()),
        @readable.Thm("IN_DIFF", () => @sets.in_diff()),
      ],
    ),
  ))
}

///|
let equivintersectionhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EquivIntersectionHelp")

///|
/// `EquivIntersectionHelp`
pub fn equivintersectionhelp() -> @kernel.Thm {
  equivintersectionhelp_c.get()
}

///|
/// CollinearSymmetry
fn step_92() -> Unit raise {
  collinearsymmetry_c.set(@readable.prove(
    "\n  forall A B C. Collinear A B C  ==>\n    Collinear A C B /\\  Collinear B A C /\\  Collinear B C A /\\ \n    Collinear C A B /\\  Collinear C B A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1"),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  B IN l /\\  C IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("Collinear_DEF", () => collinear_def())],
        ),
      ],
    ),
  ))
}

///|
let collinearsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CollinearSymmetry")

///|
/// `CollinearSymmetry`
pub fn collinearsymmetry() -> @kernel.Thm {
  collinearsymmetry_c.get()
}

///|
/// ExistsNewPointOnLine
fn step_94() -> Unit raise {
  existsnewpointonline_c.set(@readable.prove(
    "\n  forall P. Line l /\\  P IN l  ==>  ?Q. Q IN l /\\  ~(P = Q)",
    @readable.steps(
      [
        @readable.intro_tac("forall P, H1"),
        @readable.consider(
          "A B",
          "A IN l /\\  B IN l /\\  ~(A = B)    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("I2", () => i2())],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("l_line")]),
      ],
    ),
  ))
}

///|
let existsnewpointonline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ExistsNewPointOnLine")

///|
/// `ExistsNewPointOnLine`
pub fn existsnewpointonline() -> @kernel.Thm {
  existsnewpointonline_c.get()
}

///|
/// ExistsPointOffLine
fn step_96() -> Unit raise {
  existspointoffline_c.set(@readable.prove(
    "\n  forall l. Line l  ==>  ?Q. Q NOTIN l",
    @readable.steps(
      [
        @readable.intro_tac("forall l, H1"),
        @readable.consider(
          "A B C",
          "~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  ~Collinear A B C    ",
          "Distinct",
          @readable.by(@readable.fol, [@readable.Thm("I3", () => i3())]),
        ),
        @readable.assuming(
          "(A IN l) /\\  (B IN l) /\\  (C IN l)",
          "all_on",
          @readable.by(@readable.fol, [@readable.Thm("NOTIN", () => notin())]),
        ),
        @readable.have(
          "\n    Collinear A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Distinct")]),
      ],
    ),
  ))
}

///|
let existspointoffline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ExistsPointOffLine")

///|
/// `ExistsPointOffLine`
pub fn existspointoffline() -> @kernel.Thm {
  existspointoffline_c.get()
}

///|
/// BetweenLinear
fn step_98() -> Unit raise {
  betweenlinear_c.set(@readable.prove(
    "\n  forall A B C m. Line m /\\  A IN m /\\  C IN m  /\\ \n    (B IN Open (A, C) \\/ C IN Open (B, A)  \\/ A IN Open (C, B))  ==>  B IN m",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C m, H1m H1A H1C H2"),
        @readable.have(
          "\n    ~(A = C) /\\ \n    (Collinear A B C \\/ Collinear B C A \\/ Collinear C A B)",
          "X1",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  B IN l /\\  C IN l    ",
          "X2",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("Collinear_DEF", () => collinear_def())],
          ),
        ),
        @readable.have(
          "\n    l = m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("X1"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Label("H1m"),
              @readable.Label("H1A"),
              @readable.Label("H1C"),
              @readable.Thm("I1", () => i1()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("X2")]),
      ],
    ),
  ))
}

///|
let betweenlinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BetweenLinear")

///|
/// `BetweenLinear`
pub fn betweenlinear() -> @kernel.Thm {
  betweenlinear_c.get()
}

///|
/// CollinearLinear
fn step_101() -> Unit raise {
  collinearlinear_c.set(@readable.prove(
    "\n  forall A B C m. Line m /\\  A IN m /\\  C IN m  /\\ \n    (Collinear A B C \\/ Collinear B C A \\/ Collinear C A B)  /\\ \n    ~(A = C)  ==>  B IN m",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C m, H1m H1A H1C H2 H3"),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  B IN l /\\  C IN l    ",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    l = m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Prev,
              @readable.Label("H1m"),
              @readable.Label("H1A"),
              @readable.Label("H1C"),
              @readable.Thm("I1", () => i1()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("X1")]),
      ],
    ),
  ))
}

///|
let collinearlinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CollinearLinear")

///|
/// `CollinearLinear`
pub fn collinearlinear() -> @kernel.Thm {
  collinearlinear_c.get()
}

///|
/// NonCollinearImpliesDistinct
fn step_102() -> Unit raise {
  noncollinearimpliesdistinct_c.set(@readable.prove(
    "\n  forall A B C. ~Collinear A B C  ==>  ~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1"),
        @readable.assuming(
          "A = B /\\  B = C",
          "equal",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.consider(
          "Q",
          "~(Q = A)    ",
          "notQA",
          @readable.by(@readable.fol, [@readable.Thm("I3", () => i3())]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("equal"),
            @readable.Label("H1"),
            @readable.Thm("I1", () => i1()),
            @readable.Thm("Collinear_DEF", () => collinear_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let noncollinearimpliesdistinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NonCollinearImpliesDistinct")

///|
/// `NonCollinearImpliesDistinct`
pub fn noncollinearimpliesdistinct() -> @kernel.Thm {
  noncollinearimpliesdistinct_c.get()
}

///|
/// NonCollinearRaa
fn step_103() -> Unit raise {
  noncollinearraa_c.set(@readable.prove(
    "\n  forall A B C l.  ~(A = C)  ==>  Line l /\\  A IN l /\\  C IN l  ==>  B NOTIN l\n    ==>  ~Collinear A B C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C l, Distinct, l_line, notBl"),
        @readable.assuming("Collinear A B C", "ANCcol", @readable.by(@readable.fol, [])),
        @readable.consider(
          "m",
          "Line m /\\  A IN m /\\  B IN m /\\  C IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("Collinear_DEF", () => collinear_def())],
          ),
        ),
        @readable.have(
          "\n    m = l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN l",
          "",
          @readable.by(@readable.fol, [@readable.Label("m_line"), @readable.Prev]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("notBl"),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let noncollinearraa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NonCollinearRaa")

///|
/// `NonCollinearRaa`
pub fn noncollinearraa() -> @kernel.Thm {
  noncollinearraa_c.get()
}

///|
/// TwoSidesTriangle1Intersection
fn step_104() -> Unit raise {
  twosidestriangle1intersection_c.set(@readable.prove(
    "\n  forall A B C Y. ~Collinear A B C  /\\   Collinear B C Y  /\\   Collinear A C Y\n     ==> Y = C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C Y, ABCcol BCYcol ACYcol"),
        @readable.assuming("~(C = Y)", "notCY", @readable.by(@readable.fol, [])),
        @readable.consider(
          "l",
          "Line l /\\  C IN l /\\  Y IN l    ",
          "l_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.have(
          "\n    B IN l /\\  A IN l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BCYcol"),
              @readable.Label("ACYcol"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("notCY"),
              @readable.Thm("I1", () => i1()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("l_line"),
            @readable.Thm("Collinear_DEF", () => collinear_def()),
            @readable.Label("ABCcol"),
          ],
        ),
      ],
    ),
  ))
}

///|
let twosidestriangle1intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TwoSidesTriangle1Intersection")

///|
/// `TwoSidesTriangle1Intersection`
pub fn twosidestriangle1intersection() -> @kernel.Thm {
  twosidestriangle1intersection_c.get()
}

///|
/// OriginInRay
fn step_105() -> Unit raise {
  origininray_c.set(@readable.prove(
    "\n  forall O Q. ~(Q = O)  ==>  O IN ray O Q",
    @readable.steps(
      [
        @readable.intro_tac("forall O Q, H1"),
        @readable.have(
          "\n    O NOTIN Open (O, Q)",
          "OOQ",
          @readable.by(
            @readable.fol,
            [@readable.Thm("B1'", () => b1_p()), @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.have(
          "\n    Collinear O Q O",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Label("OOQ"),
            @readable.Thm("IN_Ray", () => in_ray()),
          ],
        ),
      ],
    ),
  ))
}

///|
let origininray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OriginInRay")

///|
/// `OriginInRay`
pub fn origininray() -> @kernel.Thm {
  origininray_c.get()
}

///|
/// EndpointInRay
fn step_107() -> Unit raise {
  endpointinray_c.set(@readable.prove(
    "\n  forall O Q. ~(Q = O)  ==>  Q IN ray O Q",
    @readable.steps(
      [
        @readable.intro_tac("forall O Q, H1"),
        @readable.have(
          "\n    O NOTIN Open (Q, Q)",
          "notOQQ",
          @readable.by(
            @readable.fol,
            [@readable.Thm("B1'", () => b1_p()), @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.have(
          "\n    Collinear O Q Q",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Label("notOQQ"),
            @readable.Thm("IN_Ray", () => in_ray()),
          ],
        ),
      ],
    ),
  ))
}

///|
let endpointinray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EndpointInRay")

///|
/// `EndpointInRay`
pub fn endpointinray() -> @kernel.Thm {
  endpointinray_c.get()
}

///|
/// I1Uniqueness
fn step_108() -> Unit raise {
  i1uniqueness_c.set(@readable.prove(
    "\n  forall X l m. Line l  /\\   Line m  /\\   ~(l = m)  /\\   X IN l  /\\   X IN m\n     ==> l INTER m = {X}",
    @readable.steps(
      [
        @readable.intro_tac("forall X l m, H0l H0m H1 H2l H2m"),
        @readable.assuming("~(l INTER m = {X})", "H3", @readable.by(@readable.fol, [])),
        @readable.consider(
          "A",
          "A IN l INTER m  /\\  ~(A = X)    ",
          "X1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2l"),
              @readable.Label("H2m"),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Label("H3"),
              @readable.Thm("EXTENSION", () => @sets.extension()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H0l"),
            @readable.Label("H0m"),
            @readable.Label("H2l"),
            @readable.Label("H2m"),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Label("X1"),
            @readable.Thm("I1", () => i1()),
            @readable.Label("H1"),
          ],
        ),
      ],
    ),
  ))
}

///|
let i1uniqueness_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I1Uniqueness")

///|
/// `I1Uniqueness`
pub fn i1uniqueness() -> @kernel.Thm {
  i1uniqueness_c.get()
}

///|
/// DisjointLinesImplySameSide
fn step_110() -> Unit raise {
  disjointlinesimplysameside_c.set(@readable.prove(
    "\n  forall l m A B.  Line l /\\  Line m /\\  A IN m /\\  B IN m /\\  l INTER m = {}  ==>  A,B same_side l",
    @readable.steps(
      [
        @readable.intro_tac("forall l m A B, l_line m_line Am Bm lm0"),
        @readable.have(
          "\n      l INTER Open (A,B) = {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Am"),
              @readable.Label("Bm"),
              @readable.Label("m_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Label("lm0"),
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Thm("INTER_TENSOR", () => inter_tensor()),
              @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Prev,
            @readable.Thm("SameSide_DEF", () => sameside_def()),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
          ],
        ),
      ],
    ),
  ))
}

///|
let disjointlinesimplysameside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DisjointLinesImplySameSide")

///|
/// `DisjointLinesImplySameSide`
pub fn disjointlinesimplysameside() -> @kernel.Thm {
  disjointlinesimplysameside_c.get()
}

///|
/// EquivIntersection
fn step_116() -> Unit raise {
  equivintersection_c.set(@readable.prove(
    "\n  forall A B X l m.  Line l /\\  Line m /\\  l INTER m = {X} /\\  A IN m DIFF {X} /\\  B IN m DIFF {X} /\\ \n    X NOTIN Open (A, B)  ==>  A,B same_side l",
    @readable.steps(
      [
        @readable.intro_tac("forall A B X l m, l_line m_line H1 H2l H2m H3"),
        @readable.have(
          "\n    Open (A, B) SUBSET m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Label("H2l"),
              @readable.Label("H2m"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    l INTER Open (A, B) SUBSET {X}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Thm("INTER_TENSOR", () => inter_tensor()),
            ],
          ),
        ),
        @readable.have(
          "\n    l INTER Open (A, B) SUBSET {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Label("H3"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Prev,
            @readable.Thm("SameSide_DEF", () => sameside_def()),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
          ],
        ),
      ],
    ),
  ))
}

///|
let equivintersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EquivIntersection")

///|
/// `EquivIntersection`
pub fn equivintersection() -> @kernel.Thm {
  equivintersection_c.get()
}

///|
/// RayLine
fn step_119() -> Unit raise {
  rayline_c.set(@readable.prove(
    "\n  forall O P l. Line l /\\  O IN l /\\  P IN l  ==>  ray O P  SUBSET l",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("IN_Ray", () => in_ray()),
        @readable.Thm("CollinearLinear", () => collinearlinear()),
        @readable.Thm("SUBSET", () => @sets.subset()),
      ],
    ),
  ))
}

///|
let rayline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RayLine")

///|
/// `RayLine`
pub fn rayline() -> @kernel.Thm {
  rayline_c.get()
}

///|
/// RaySameSide
fn step_121() -> Unit raise {
  raysameside_c.set(@readable.prove(
    "\n  forall l O A P. Line l /\\  O IN l /\\  A NOTIN l /\\  P IN ray O A DIFF {O}\n     ==>  P NOTIN l  /\\   P,A same_side l",
    @readable.steps(
      [
        @readable.intro_tac("forall l O A P, l_line Ol notAl PrOA"),
        @readable.have(
          "\n    ~(O = A)",
          "notOA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Ol"),
              @readable.Label("notAl"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "d",
          "Line d /\\  O IN d /\\  A IN d    ",
          "d_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("notOA"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    ~(l = d)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("notAl"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    l INTER d = {O}",
          "ldO",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Ol"),
              @readable.Label("d_line"),
              @readable.Prev,
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN d DIFF {O}",
          "Ad_O",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("d_line"),
              @readable.Label("notOA"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O A SUBSET d",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Label("d_line"), @readable.Thm("RayLine", () => rayline())],
          ),
        ),
        @readable.have(
          "\n    P IN d DIFF {O}",
          "Pd_O",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("PrOA"),
              @readable.Prev,
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    P NOTIN l",
          "notPl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ldO"),
              @readable.Prev,
              @readable.Thm("EquivIntersectionHelp", () => equivintersectionhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (P, A)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("PrOA"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    P,A same_side l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Ol"),
              @readable.Label("d_line"),
              @readable.Label("ldO"),
              @readable.Label("Ad_O"),
              @readable.Label("Pd_O"),
              @readable.Prev,
              @readable.Thm("EquivIntersection", () => equivintersection()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("notPl"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let raysameside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RaySameSide")

///|
/// `RaySameSide`
pub fn raysameside() -> @kernel.Thm {
  raysameside_c.get()
}

///|
/// IntervalRayEZ
fn step_126() -> Unit raise {
  intervalrayez_c.set(@readable.prove(
    "\n  forall A B C. B IN Open (A, C)  ==>  B IN ray A C DIFF {A}  /\\   C IN ray A B DIFF {A}",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  Collinear A B C",
          "ABC",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    A NOTIN Open (B, C)  /\\   A NOTIN Open (C, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("ABC"),
            @readable.Prev,
            @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            @readable.Thm("IN_Ray", () => in_ray()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            @readable.Thm("IN_SING", () => @sets.in_sing()),
          ],
        ),
      ],
    ),
  ))
}

///|
let intervalrayez_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IntervalRayEZ")

///|
/// `IntervalRayEZ`
pub fn intervalrayez() -> @kernel.Thm {
  intervalrayez_c.get()
}

///|
/// NoncollinearityExtendsToLine
fn step_129() -> Unit raise {
  noncollinearityextendstoline_c.set(@readable.prove(
    "\n  forall A O B X. ~Collinear A O B  ==>  Collinear O B X  /\\  ~(X = O)\n      ==>  ~Collinear A O X",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B X, H1, H2"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "b",
          "Line b /\\  O IN b /\\  B IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    A NOTIN b",
          "notAb",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("b_line"),
              @readable.Label("H1"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    X IN b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("b_line"),
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("b_line"),
            @readable.Prev,
            @readable.Label("H2"),
            @readable.Label("notAb"),
            @readable.Thm("I1", () => i1()),
            @readable.Thm("Collinear_DEF", () => collinear_def()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let noncollinearityextendstoline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NoncollinearityExtendsToLine")

///|
/// `NoncollinearityExtendsToLine`
pub fn noncollinearityextendstoline() -> @kernel.Thm {
  noncollinearityextendstoline_c.get()
}

///|
/// SameSideReflexive
fn step_131() -> Unit raise {
  samesidereflexive_c.set(@readable.prove(
    "\n  forall l A. Line l /\\   A NOTIN l ==> A,A same_side l",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("B1'", () => b1_p()),
        @readable.Thm("SameSide_DEF", () => sameside_def()),
      ],
    ),
  ))
}

///|
let samesidereflexive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SameSideReflexive")

///|
/// `SameSideReflexive`
pub fn samesidereflexive() -> @kernel.Thm {
  samesidereflexive_c.get()
}

///|
/// SameSideSymmetric
fn step_132() -> Unit raise {
  samesidesymmetric_c.set(@readable.prove(
    "\n  forall l A B. Line l /\\   A NOTIN l /\\  B NOTIN l ==>\n  A,B same_side l ==> B,A same_side l",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SameSide_DEF", () => sameside_def()),
        @readable.Thm("B1'", () => b1_p()),
      ],
    ),
  ))
}

///|
let samesidesymmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SameSideSymmetric")

///|
/// `SameSideSymmetric`
pub fn samesidesymmetric() -> @kernel.Thm {
  samesidesymmetric_c.get()
}

///|
/// SameSideTransitive
fn step_133() -> Unit raise {
  samesidetransitive_c.set(@readable.prove(
    "\n  forall l A B C. Line l  ==>  A NOTIN l /\\  B NOTIN l /\\  C NOTIN l  ==>  A,B same_side l\n    ==>  B,C same_side l  ==>  A,C same_side l",
    @readable.steps(
      [
        @readable.intro_tac("forall l A B C, l_line, notABCl, Asim_lB, Bsim_lC"),
        @readable.assuming(
          "Collinear A B C  /\\  ~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("notABCl"),
              @readable.Label("Asim_lB"),
              @readable.Label("Bsim_lC"),
              @readable.Thm("B4''", () => b4_p_p()),
              @readable.Thm("SameSideReflexive", () => samesidereflexive()),
            ],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  A IN m /\\  C IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B IN m",
          "Bm",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Thm("CollinearLinear", () => collinearlinear()),
            ],
          ),
        ),
        @readable.assuming(
          "~(m INTER l = {})",
          "Intersect",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
            ],
          ),
        ),
        @readable.consider(
          "X",
          "X IN l /\\  X IN m    ",
          "Xlm",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear A X B  /\\   Collinear B A C  /\\   Collinear A B C",
          "ABXcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("Bm"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN l /\\  ~(E = X)    ",
          "El_X",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Xlm"),
              @readable.Thm("ExistsNewPointOnLine", () => existsnewpointonline()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E A X",
          "EAXncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("El_X"),
              @readable.Label("Xlm"),
              @readable.Label("notABCl"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "B'",
          "~(B = E)  /\\   B IN Open (E, B')    ",
          "EBB'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notABCl"),
              @readable.Label("El_X"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("B2'", () => b2_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B' = E) /\\  ~(B' = B) /\\  Collinear B E B'",
          "EBB'col",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B B'  /\\   ~Collinear B' B A  /\\   ~Collinear B' A B",
          "ABB'ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EAXncol"),
              @readable.Label("ABXcol"),
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B' B C /\\   ~Collinear B' A C /\\   ~Collinear A B' C",
          "AB'Cncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABB'ncol"),
              @readable.Label("ABXcol"),
              @readable.Label("Distinct"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    B' IN ray E B DIFF {E}  /\\   B IN ray E B' DIFF {E}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EBB'"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.have(
          "\n    B' NOTIN l  /\\   B',B same_side l  /\\   B,B' same_side l",
          "notB'l",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("El_X"),
              @readable.Label("notABCl"),
              @readable.Prev,
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,B' same_side l /\\   B',C same_side l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("ABB'ncol"),
              @readable.Label("notABCl"),
              @readable.Label("notB'l"),
              @readable.Label("Asim_lB"),
              @readable.Prev,
              @readable.Label("AB'Cncol"),
              @readable.Label("Bsim_lC"),
              @readable.Thm("B4''", () => b4_p_p()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Label("AB'Cncol"),
            @readable.Label("notABCl"),
            @readable.Label("notB'l"),
            @readable.Prev,
            @readable.Thm("B4''", () => b4_p_p()),
          ],
        ),
      ],
    ),
  ))
}

///|
let samesidetransitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SameSideTransitive")

///|
/// `SameSideTransitive`
pub fn samesidetransitive() -> @kernel.Thm {
  samesidetransitive_c.get()
}

///|
/// ConverseCrossbar
fn step_141() -> Unit raise {
  conversecrossbar_c.set(@readable.prove(
    "\n  forall O A B G. ~Collinear A O B  /\\   G IN Open (A, B)  ==>  G IN int_angle A O B",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B G, H1 H2"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  O IN a /\\  A IN a    ",
          "a_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.consider(
          "b",
          "Line b /\\  O IN b /\\  B IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  B IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN a  /\\   A NOTIN b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("a_line"),
              @readable.Label("b_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(a = l)  /\\   ~(b = l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    a INTER l = {A}  /\\   b INTER l = {B}",
          "alA",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("a_line"),
              @readable.Label("l_line"),
              @readable.Label("b_line"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = G) /\\  ~(A = B) /\\  ~(G = B)",
          "AGB",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    A NOTIN Open (G, B)  /\\   B NOTIN Open (G, A)",
          "notGAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN l",
          "Gl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H2"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN a  /\\   G NOTIN b",
          "notGa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("alA"),
              @readable.Label("Gl"),
              @readable.Label("AGB"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("EquivIntersectionHelp", () => equivintersectionhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN l DIFF {A} /\\  B IN l DIFF {A} /\\  G IN l DIFF {B} /\\  A IN l DIFF {B}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Gl"),
              @readable.Label("l_line"),
              @readable.Label("AGB"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    G,B same_side a  /\\   G,A same_side b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("l_line"),
              @readable.Label("alA"),
              @readable.Prev,
              @readable.Label("notGAB"),
              @readable.Label("b_line"),
              @readable.Thm("EquivIntersection", () => equivintersection()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("a_line"),
            @readable.Label("b_line"),
            @readable.Label("notGa"),
            @readable.Prev,
            @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let conversecrossbar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConverseCrossbar")

///|
/// `ConverseCrossbar`
pub fn conversecrossbar() -> @kernel.Thm {
  conversecrossbar_c.get()
}

///|
/// InteriorUse
fn step_143() -> Unit raise {
  interioruse_c.set(@readable.prove(
    "\n  forall A O B P a b.\n    Line a /\\  O IN a /\\  A IN a /\\  Line b /\\  O IN b /\\  B IN b  ==>\n    P  IN int_angle A O B  ==>\n    P NOTIN a /\\  P NOTIN b /\\  P,B same_side a /\\  P,A same_side b",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B P a b, aOAbOB, P_AOB"),
        @readable.consider(
          "alpha beta",
          "~Collinear A O B /\\ \n    Line alpha /\\  O IN alpha /\\  A IN alpha /\\ \n    Line beta /\\  O IN beta /\\ B IN beta /\\ \n    P NOTIN alpha /\\  P NOTIN beta /\\ \n    P,B same_side alpha /\\  P,A same_side beta    ",
          "exists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("P_AOB"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha = a /\\  beta = b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("aOAbOB"),
              @readable.Label("exists"),
              @readable.Thm("I1", () => i1()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("exists")]),
      ],
    ),
  ))
}

///|
let interioruse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorUse")

///|
/// `InteriorUse`
pub fn interioruse() -> @kernel.Thm {
  interioruse_c.get()
}

///|
/// InteriorEZHelp
fn step_144() -> Unit raise {
  interiorezhelp_c.set(@readable.prove(
    "\n  forall A O B P. P IN int_angle A O B  ==>\n  ~(P = A) /\\  ~(P = O) /\\  ~(P = B) /\\  ~Collinear A O P",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B P, P_AOB"),
        @readable.consider(
          "a b",
          "~Collinear A O B /\\ \n    Line a /\\  O IN a /\\  A IN a /\\ \n    Line b /\\  O IN b /\\ B IN b /\\ \n    P NOTIN a /\\  P NOTIN b    ",
          "def_int",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("P_AOB"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(P = A) /\\  ~(P = O) /\\  ~(P = B)",
          "PnotAOB",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.have(
          "\n    ~(A = O)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O P",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Prev,
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("PnotAOB"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let interiorezhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorEZHelp")

///|
/// `InteriorEZHelp`
pub fn interiorezhelp() -> @kernel.Thm {
  interiorezhelp_c.get()
}

///|
/// InteriorAngleSymmetry
fn step_146() -> Unit raise {
  interioranglesymmetry_c.set(@readable.prove(
    "\n  forall A O B P: point. P IN int_angle A O B  ==>  P IN int_angle B O A",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("IN_InteriorAngle", () => in_interiorangle())],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("CollinearSymmetry", () => collinearsymmetry())],
        ),
      ],
    ),
  ))
}

///|
let interioranglesymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorAngleSymmetry")

///|
/// `InteriorAngleSymmetry`
pub fn interioranglesymmetry() -> @kernel.Thm {
  interioranglesymmetry_c.get()
}

///|
/// InteriorWellDefined
fn step_147() -> Unit raise {
  interiorwelldefined_c.set(@readable.prove(
    "\n  forall A O B X P. P IN int_angle A O B  /\\   X IN ray O B DIFF {O}  ==>  P IN int_angle A O X",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B X P, H1 H2"),
        @readable.consider(
          "a b",
          "~Collinear A O B /\\ \n    Line a /\\  O IN a /\\  A IN a /\\  P NOTIN a     /\\      Line b /\\  O IN b /\\  B IN b /\\  P NOTIN b /\\ \n    P,B same_side a /\\  P,A same_side b    ",
          "def_int",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(X = O) /\\  ~(O = B) /\\  Collinear O B X",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN a",
          "notBa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O X",
          "AOXnoncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Label("H2'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    X IN b",
          "Xb",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Label("H2'"),
              @readable.Thm("CollinearLinear", () => collinearlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    X NOTIN a  /\\   B,X same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Label("notBa"),
              @readable.Label("H2"),
              @readable.Thm("RaySameSide", () => raysameside()),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    P,X same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Prev,
              @readable.Label("notBa"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("AOXnoncol"),
            @readable.Label("def_int"),
            @readable.Label("Xb"),
            @readable.Prev,
            @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorwelldefined_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorWellDefined")

///|
/// `InteriorWellDefined`
pub fn interiorwelldefined() -> @kernel.Thm {
  interiorwelldefined_c.get()
}

///|
/// WholeRayInterior
fn step_150() -> Unit raise {
  wholerayinterior_c.set(@readable.prove(
    "\n  forall A O B X P. X IN int_angle A O B  /\\   P IN ray O X DIFF {O}  ==>  P IN int_angle A O B",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B X P, XintAOB PrOX"),
        @readable.consider(
          "a b",
          "~Collinear A O B /\\ \n    Line a /\\  O IN a /\\  A IN a /\\  X NOTIN a   /\\    Line b /\\  O IN b /\\  B IN b /\\  X NOTIN b /\\ \n    X,B same_side a /\\  X,A same_side b    ",
          "def_int",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XintAOB"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    P NOTIN a /\\  P,X same_side a /\\  P NOTIN b /\\  P,X same_side b",
          "Psim_abX",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_int"),
              @readable.Label("PrOX"),
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    P,B same_side a  /\\  P,A same_side b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("def_int"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("def_int"),
            @readable.Label("Psim_abX"),
            @readable.Prev,
            @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let wholerayinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WholeRayInterior")

///|
/// `WholeRayInterior`
pub fn wholerayinterior() -> @kernel.Thm {
  wholerayinterior_c.get()
}

///|
/// AngleOrdering
fn step_151() -> Unit raise {
  angleordering_c.set(@readable.prove(
    "\n  forall O A P Q a. ~(O = A)  ==>  Line a /\\  O IN a /\\  A IN a  ==>\n    P NOTIN a /\\  Q NOTIN a  ==>  P,Q same_side a  ==>  ~Collinear P O Q  ==>\n    P IN int_angle Q O A  \\/  Q IN int_angle P O A",
    @readable.steps(
      [
        @readable.intro_tac("forall O A P Q a, H1, H2, H3, H4, H5"),
        @readable.have(
          "\n    ~(P = O) /\\  ~(P = Q) /\\  ~(O = Q)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H5"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "q",
          "Line q /\\  O IN q /\\  Q IN q    ",
          "q_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    P NOTIN q",
          "notPq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H5"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.assuming(
          "~(P IN int_angle Q O A)",
          "notPintQOA",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    ~Collinear Q O A  /\\   ~Collinear P O A",
          "POAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n~(P,A same_side q)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Label("q_line"),
              @readable.Label("H3"),
              @readable.Label("notPq"),
              @readable.Label("H4"),
              @readable.Label("notPintQOA"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN q /\\  G IN Open (P, A)    ",
          "existG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("q_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN int_angle P O A",
          "G_POA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("POAncol"),
              @readable.Label("existG"),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN a /\\  G,P same_side a /\\  ~(G = O)",
          "Gsim_aP",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G,Q same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("Gsim_aP"),
              @readable.Label("H3"),
              @readable.Label("H4"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (Q, G)",
          "notQOG",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear O G Q",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("q_line"),
              @readable.Label("existG"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Q IN ray O G DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Gsim_aP"),
              @readable.Prev,
              @readable.Label("notQOG"),
              @readable.Label("Distinct"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("G_POA"),
            @readable.Prev,
            @readable.Thm("WholeRayInterior", () => wholerayinterior()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angleordering_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleOrdering")

///|
/// `AngleOrdering`
pub fn angleordering() -> @kernel.Thm {
  angleordering_c.get()
}

///|
/// InteriorsDisjointSupplement
fn step_154() -> Unit raise {
  interiorsdisjointsupplement_c.set(@readable.prove(
    "\n  forall A O B A'. ~Collinear A O B  /\\   O IN Open (A, A')  ==>\n    int_angle B O A'  INTER  int_angle A O B = {}",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A', H1 H2"),
        @readable.have(
          "\n    forall D. D IN int_angle A O B  ==>  D NOTIN int_angle B O A'",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall D, H3"),
              @readable.have(
                "\n      ~(A = O) /\\  ~(O = B)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Thm(
                      "NonCollinearImpliesDistinct",
                      () => noncollinearimpliesdistinct(),
                    ),
                  ],
                ),
              ),
              @readable.consider(
                "a b",
                "Line a /\\  O IN a /\\  A IN a /\\  Line b /\\  O IN b /\\  B IN b /\\  A' IN a    ",
                "ab_line",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H2"),
                    @readable.Thm("I1", () => i1()),
                    @readable.Thm("BetweenLinear", () => betweenlinear()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear B O A'",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("H2"),
                    @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm(
                      "NoncollinearityExtendsToLine",
                      () => noncollinearityextendstoline(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      A NOTIN b  /\\   A' NOTIN b",
                "notAb",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ab_line"),
                    @readable.Label("H1"),
                    @readable.Prev,
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~(A',A same_side b)",
                "A'nsim_bA",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ab_line"),
                    @readable.Label("H2"),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      D NOTIN b  /\\   D,A same_side b",
                "DintAOB",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ab_line"),
                    @readable.Label("H3"),
                    @readable.Thm("InteriorUse", () => interioruse()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~(D,A' same_side b)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ab_line"),
                    @readable.Label("notAb"),
                    @readable.Label("DintAOB"),
                    @readable.Label("A'nsim_bA"),
                    @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("ab_line"),
                  @readable.Prev,
                  @readable.Thm("InteriorUse", () => interioruse()),
                  @readable.Thm("NOTIN", () => notin()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("DisjointOneNotOther", () => disjointonenotother()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorsdisjointsupplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorsDisjointSupplement")

///|
/// `InteriorsDisjointSupplement`
pub fn interiorsdisjointsupplement() -> @kernel.Thm {
  interiorsdisjointsupplement_c.get()
}

///|
/// InteriorReflectionInterior
fn step_157() -> Unit raise {
  interiorreflectioninterior_c.set(@readable.prove(
    "\n  forall A O B D A'. O IN Open (A, A')  /\\   D IN int_angle A O B  ==>\n    B  IN int_angle D O A'",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B D A', H1 H2"),
        @readable.consider(
          "a b",
          "~Collinear A O B /\\  Line a /\\  O IN a /\\  A IN a /\\  D NOTIN a /\\ \n    Line b /\\  O IN b /\\  B IN b /\\  D NOTIN b /\\  D,B same_side a    ",
          "DintAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(O = B) /\\  ~(O = A') /\\  B NOTIN a",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D O B",
          "DOB_ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Prev,
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    A' IN a",
          "A'a",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("DintAOB"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    D NOTIN int_angle B O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm(
                "InteriorsDisjointSupplement",
                () => interiorsdisjointsupplement(),
              ),
              @readable.Thm("DisjointOneNotOther", () => disjointonenotother()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Distinct"),
            @readable.Label("DintAOB"),
            @readable.Label("A'a"),
            @readable.Label("DOB_ncol"),
            @readable.Prev,
            @readable.Thm("AngleOrdering", () => angleordering()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorreflectioninterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorReflectionInterior")

///|
/// `InteriorReflectionInterior`
pub fn interiorreflectioninterior() -> @kernel.Thm {
  interiorreflectioninterior_c.get()
}

///|
/// Crossbar_THM
fn step_160() -> Unit raise {
  crossbar_thm_c.set(@readable.prove(
    "\n  forall O A B D. D IN int_angle A O B  ==>  ?G. G IN Open (A, B)  /\\   G IN ray O D DIFF {O}",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B D, H1"),
        @readable.consider(
          "a b",
          "~Collinear A O B /\\ \n    Line a /\\  O IN a /\\  A IN a /\\ \n    Line b /\\  O IN b /\\  B IN b /\\ \n    D NOTIN a /\\  D NOTIN b /\\  D,B same_side a /\\  D,A same_side b    ",
          "DintAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN a",
          "notBa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B) /\\  ~(D = O)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  O IN l /\\  D IN l    ",
          "l_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.consider(
          "A'",
          "O IN Open (A, A')    ",
          "AOA'",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    A' IN a /\\  Collinear A O A' /\\  ~(A' = O)",
          "A'a",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Prev,
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,A' same_side l)",
          "Ansim_lA'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("AOA'"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN int_angle D O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("AOA'"),
              @readable.Thm(
                "InteriorReflectionInterior",
                () => interiorreflectioninterior(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    B,A' same_side l",
          "Bsim_lA'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("DintAOB"),
              @readable.Label("A'a"),
              @readable.Prev,
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O D  /\\   ~Collinear B O D",
          "AODncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("A'a"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN l /\\  B NOTIN l /\\  A' NOTIN l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("AODncol"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,B same_side l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Prev,
              @readable.Label("Bsim_lA'"),
              @readable.Label("Ansim_lA'"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN Open (A, B) /\\  G IN l    ",
          "AGB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear O D G",
          "ODGcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN int_angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Label("AGB"),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN a  /\\   G,B same_side a  /\\   ~(G = O)",
          "Gsim_aB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Prev,
              @readable.Thm("InteriorUse", () => interioruse()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    B,D same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Label("notBa"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    G,D same_side a",
          "Gsim_aD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Label("Gsim_aB"),
              @readable.Label("notBa"),
              @readable.Prev,
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (G, D)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintAOB"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN ray O D DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("ODGcol"),
              @readable.Prev,
              @readable.Label("Gsim_aB"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("AGB"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let crossbar_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Crossbar_THM")

///|
/// `Crossbar_THM`
pub fn crossbar_thm() -> @kernel.Thm {
  crossbar_thm_c.get()
}

///|
/// AlternateConverseCrossbar
fn step_164() -> Unit raise {
  alternateconversecrossbar_c.set(@readable.prove(
    "\n  forall O A B G. Collinear A G B  /\\   G IN int_angle A O B  ==>  G IN Open (A, B)",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B G, H1"),
        @readable.consider(
          "a b",
          "~Collinear A O B  /\\   Line a /\\  O IN a /\\  A IN a  /\\   Line b /\\  O IN b /\\  B IN b  /\\ \n    G,B same_side a  /\\   G,A same_side b    ",
          "GintAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(G = A) /\\  ~(G = B)  /\\   A NOTIN Open (G, B)  /\\   B NOTIN Open (G, A)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("B3'", () => b3_p()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let alternateconversecrossbar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AlternateConverseCrossbar")

///|
/// `AlternateConverseCrossbar`
pub fn alternateconversecrossbar() -> @kernel.Thm {
  alternateconversecrossbar_c.get()
}

///|
/// InteriorOpposite
fn step_165() -> Unit raise {
  interioropposite_c.set(@readable.prove(
    "\n  forall A O B P p. P IN int_angle A O B  ==>  Line p /\\  O IN p /\\  P IN p\n    ==>  ~(A,B same_side p)",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B P p, PintAOB, p_line"),
        @readable.consider(
          "G",
          "G IN Open (A, B) /\\  G IN ray O P    ",
          "Gexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("PintAOB"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("p_line"),
            @readable.Label("p_line"),
            @readable.Prev,
            @readable.Thm("RayLine", () => rayline()),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Label("Gexists"),
            @readable.Thm("SameSide_DEF", () => sameside_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interioropposite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorOpposite")

///|
/// `InteriorOpposite`
pub fn interioropposite() -> @kernel.Thm {
  interioropposite_c.get()
}

///|
/// IntervalTransitivity
fn step_167() -> Unit raise {
  intervaltransitivity_c.set(@readable.prove(
    "\n  forall O P Q R m. Line m  /\\  O IN m  ==>  P IN m DIFF {O} /\\  Q IN m DIFF {O} /\\  R IN m DIFF {O}  ==>\n    O NOTIN Open (P, Q) /\\  O NOTIN Open (Q, R)  ==>  O NOTIN Open (P, R)",
    @readable.steps(
      [
        @readable.intro_tac("forall O P Q R m, H0, H2, H3"),
        @readable.consider(
          "E",
          "E NOTIN m /\\   ~(O = E)    ",
          "notEm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H0"),
              @readable.Thm("ExistsPointOffLine", () => existspointoffline()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  O IN l /\\  E IN l    ",
          "l_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.have(
          "\n    ~(m = l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notEm"),
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    l INTER m = {O}",
          "lmO",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H0"),
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    P NOTIN l /\\   Q NOTIN l /\\  R NOTIN l",
          "notPQRl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("EquivIntersectionHelp", () => equivintersectionhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    P,Q same_side l  /\\   Q,R same_side l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H0"),
              @readable.Label("lmO"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("EquivIntersection", () => equivintersection()),
            ],
          ),
        ),
        @readable.have(
          "\n    P,R same_side l",
          "Psim_lR",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("notPQRl"),
              @readable.Prev,
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Prev,
            @readable.Thm("SameSide_DEF", () => sameside_def()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let intervaltransitivity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IntervalTransitivity")

///|
/// `IntervalTransitivity`
pub fn intervaltransitivity() -> @kernel.Thm {
  intervaltransitivity_c.get()
}

///|
/// RayWellDefinedHalfway
fn step_169() -> Unit raise {
  raywelldefinedhalfway_c.set(@readable.prove(
    "\n  forall O P Q. ~(Q = O)  /\\   P IN ray O Q DIFF {O}  ==>  ray O P SUBSET ray O Q",
    @readable.steps(
      [
        @readable.intro_tac("forall O P Q, H1 H2"),
        @readable.consider(
          "m",
          "Line m /\\  O IN m /\\  Q IN m    ",
          "OQm",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    P IN ray O Q  /\\   ~(P = O)  /\\   O NOTIN Open (P, Q)",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    P IN m  /\\   P IN m DIFF {O}  /\\   Q IN m DIFF {O}",
          "PQm_O",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OQm"),
              @readable.Label("H2'"),
              @readable.Thm("RayLine", () => rayline()),
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Label("H2'"),
              @readable.Label("OQm"),
              @readable.Label("H1"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (P, Q)",
          "notPOQ",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2'"), @readable.Thm("IN_Ray", () => in_ray())],
          ),
        ),
        @readable.by(@readable.rewrite, [@readable.Thm("SUBSET", () => @sets.subset())]),
        @readable.intro_tac("forall [X], XrayOP"),
        @readable.have(
          "\n    X IN m  /\\   O NOTIN Open (X, P)",
          "XrOP",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Label("OQm"),
              @readable.Label("PQm_O"),
              @readable.Label("H2'"),
              @readable.Thm("RayLine", () => rayline()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear O Q X",
          "OQXcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OQm"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.assuming(
          "~(X = O)",
          "notXO",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("OriginInRay", () => origininray())],
          ),
        ),
        @readable.have(
          "\n    X IN m DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XrOP"),
              @readable.Prev,
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (X, Q)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OQm"),
              @readable.Prev,
              @readable.Label("PQm_O"),
              @readable.Label("XrOP"),
              @readable.Label("H2'"),
              @readable.Thm("IntervalTransitivity", () => intervaltransitivity()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("OQXcol"),
            @readable.Prev,
            @readable.Thm("IN_Ray", () => in_ray()),
          ],
        ),
      ],
    ),
  ))
}

///|
let raywelldefinedhalfway_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RayWellDefinedHalfway")

///|
/// `RayWellDefinedHalfway`
pub fn raywelldefinedhalfway() -> @kernel.Thm {
  raywelldefinedhalfway_c.get()
}

///|
/// RayWellDefined
fn step_172() -> Unit raise {
  raywelldefined_c.set(@readable.prove(
    "\n  forall O P Q. ~(Q = O)  /\\   P IN ray O Q DIFF {O}  ==>  ray O P = ray O Q",
    @readable.steps(
      [
        @readable.intro_tac("forall O P Q, H1  H2"),
        @readable.have(
          "\n    ray O P SUBSET ray O Q",
          "PsubsetQ",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("RayWellDefinedHalfway", () => raywelldefinedhalfway()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(P = O)  /\\   Collinear O Q P  /\\   O NOTIN Open (P, Q)",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    Q IN ray O P DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2'"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("H1"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O Q SUBSET ray O P",
          "QsubsetP",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm("RayWellDefinedHalfway", () => raywelldefinedhalfway()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("PsubsetQ"),
            @readable.Label("QsubsetP"),
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
          ],
        ),
      ],
    ),
  ))
}

///|
let raywelldefined_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RayWellDefined")

///|
/// `RayWellDefined`
pub fn raywelldefined() -> @kernel.Thm {
  raywelldefined_c.get()
}

///|
/// OppositeRaysIntersect1pointHelp
fn step_175() -> Unit raise {
  oppositeraysintersect1pointhelp_c.set(@readable.prove(
    "\n  forall A O B X. O IN Open (A, B)  /\\   X IN ray O B DIFF {O}\n    ==>  X NOTIN ray O A  /\\   O IN Open (X, A)",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B X, H1 H2"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B) /\\  Collinear A O B",
          "AOB",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    ~(X = O) /\\  Collinear O B X /\\  O NOTIN Open (X, B)",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  A IN m /\\  B IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("AOB"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    O IN m  /\\  X IN m",
          "Om",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("H2'"),
              @readable.Label("AOB"),
              @readable.Thm("CollinearLinear", () => collinearlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN m DIFF {O}  /\\   X IN m DIFF {O}  /\\   B IN m DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Label("H2'"),
              @readable.Label("AOB"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("m_line"),
            @readable.Label("Om"),
            @readable.Prev,
            @readable.Label("H2'"),
            @readable.Thm("IntervalTransitivity", () => intervaltransitivity()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("IN_Ray", () => in_ray()),
          ],
        ),
      ],
    ),
  ))
}

///|
let oppositeraysintersect1pointhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeRaysIntersect1pointHelp")

///|
/// `OppositeRaysIntersect1pointHelp`
pub fn oppositeraysintersect1pointhelp() -> @kernel.Thm {
  oppositeraysintersect1pointhelp_c.get()
}

///|
/// OppositeRaysIntersect1point
fn step_176() -> Unit raise {
  oppositeraysintersect1point_c.set(@readable.prove(
    "\n  forall A O B. O IN Open (A, B)  ==>  ray O A INTER ray O B  =  {O}",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B, H1"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("SUBSET_ANTISYM_EQ", () => @sets.subset_antisym_eq()),
            ),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
          ],
        ),
        @readable.conj_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("OriginInRay", () => origininray()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Thm(
              "OppositeRaysIntersect1pointHelp",
              () => oppositeraysintersect1pointhelp(),
            ),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            @readable.Thm("IN_SING", () => @sets.in_sing()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let oppositeraysintersect1point_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeRaysIntersect1point")

///|
/// `OppositeRaysIntersect1point`
pub fn oppositeraysintersect1point() -> @kernel.Thm {
  oppositeraysintersect1point_c.get()
}

///|
/// IntervalRay
fn step_180() -> Unit raise {
  intervalray_c.set(@readable.prove(
    "\n  forall A B C. B IN Open (A, C)  ==>  ray A B = ray A C",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("B1'", () => b1_p()),
        @readable.Thm("IntervalRayEZ", () => intervalrayez()),
        @readable.Thm("RayWellDefined", () => raywelldefined()),
      ],
    ),
  ))
}

///|
let intervalray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IntervalRay")

///|
/// `IntervalRay`
pub fn intervalray() -> @kernel.Thm {
  intervalray_c.get()
}

///|
/// Reverse4Order
fn step_182() -> Unit raise {
  reverse4order_c.set(@readable.prove(
    "\n  forall A B C D. ordered A B C D  ==>  ordered D C B A",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("Ordered_DEF", () => ordered_def())],
        ),
        @readable.by(@readable.fol, [@readable.Thm("B1'", () => b1_p())]),
      ],
    ),
  ))
}

///|
let reverse4order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Reverse4Order")

///|
/// `Reverse4Order`
pub fn reverse4order() -> @kernel.Thm {
  reverse4order_c.get()
}

///|
/// TransitivityBetweennessHelp
fn step_184() -> Unit raise {
  transitivitybetweennesshelp_c.set(@readable.prove(
    "\n  forall A B C D. B IN Open (A, C)  /\\   C IN Open (B, D)\n   ==>  B IN Open (A, D)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1"),
        @readable.have(
          "\n    D IN ray B C DIFF {B}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm(
              "OppositeRaysIntersect1pointHelp",
              () => oppositeraysintersect1pointhelp(),
            ),
            @readable.Thm("B1'", () => b1_p()),
          ],
        ),
      ],
    ),
  ))
}

///|
let transitivitybetweennesshelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TransitivityBetweennessHelp")

///|
/// `TransitivityBetweennessHelp`
pub fn transitivitybetweennesshelp() -> @kernel.Thm {
  transitivitybetweennesshelp_c.get()
}

///|
/// TransitivityBetweenness
fn step_185() -> Unit raise {
  transitivitybetweenness_c.set(@readable.prove(
    "\n  forall A B C D. B IN Open (A, C)  /\\   C IN Open (B, D)  ==>  ordered A B C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1"),
        @readable.have(
          "\n    B IN Open (A, D)",
          "ABD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "TransitivityBetweennessHelp",
                () => transitivitybetweennesshelp(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN Open (D, B)  /\\   B IN Open (C, A)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    C IN Open (D, A)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "TransitivityBetweennessHelp",
                () => transitivitybetweennesshelp(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("ABD"),
            @readable.Prev,
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("Ordered_DEF", () => ordered_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let transitivitybetweenness_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TransitivityBetweenness")

///|
/// `TransitivityBetweenness`
pub fn transitivitybetweenness() -> @kernel.Thm {
  transitivitybetweenness_c.get()
}

///|
/// IntervalsAreConvex
fn step_187() -> Unit raise {
  intervalsareconvex_c.set(@readable.prove(
    "\n  forall A B C. B IN Open (A, C)  ==>  Open (A, B)  SUBSET  Open (A, C)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1"),
        @readable.have(
          "\n    forall X. X IN Open (A, B)  ==>  X IN Open (A, C)",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall X, AXB"),
              @readable.have(
                "\n      X IN ray B A DIFF {B}",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("AXB"),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm("IntervalRayEZ", () => intervalrayez()),
                  ],
                ),
              ),
              @readable.have(
                "\n      B IN Open (X, C)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Prev,
                    @readable.Thm(
                      "OppositeRaysIntersect1pointHelp",
                      () => oppositeraysintersect1pointhelp(),
                    ),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("AXB"),
                  @readable.Prev,
                  @readable.Thm(
                    "TransitivityBetweennessHelp",
                    () => transitivitybetweennesshelp(),
                  ),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("SUBSET", () => @sets.subset())],
        ),
      ],
    ),
  ))
}

///|
let intervalsareconvex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IntervalsAreConvex")

///|
/// `IntervalsAreConvex`
pub fn intervalsareconvex() -> @kernel.Thm {
  intervalsareconvex_c.get()
}

///|
/// TransitivityBetweennessVariant
fn step_188() -> Unit raise {
  transitivitybetweennessvariant_c.set(@readable.prove(
    "\n  forall A X B C. X IN Open (A, B)  /\\   B IN Open (A, C)  ==>  ordered A X B C",
    @readable.steps(
      [
        @readable.intro_tac("forall A X B C, H1"),
        @readable.have(
          "\n    X IN ray B A DIFF {B}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN Open (X, C)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Prev,
              @readable.Thm(
                "OppositeRaysIntersect1pointHelp",
                () => oppositeraysintersect1pointhelp(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm("TransitivityBetweenness", () => transitivitybetweenness()),
          ],
        ),
      ],
    ),
  ))
}

///|
let transitivitybetweennessvariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TransitivityBetweennessVariant")

///|
/// `TransitivityBetweennessVariant`
pub fn transitivitybetweennessvariant() -> @kernel.Thm {
  transitivitybetweennessvariant_c.get()
}

///|
/// Interval2sides2aLineHelp
fn step_190() -> Unit raise {
  interval2sides2alinehelp_c.set(@readable.prove(
    "\n  forall A B C X. B IN Open (A, C)  ==>  X NOTIN Open (A, B) \\/ X NOTIN Open (B, C)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C X, H1"),
        @readable.assuming(
          "~(X NOTIN Open (A, B))",
          "AXB",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    ordered A X B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("H1"),
              @readable.Thm(
                "TransitivityBetweennessVariant",
                () => transitivitybetweennessvariant(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [@readable.Prev, @readable.Thm("Ordered_DEF", () => ordered_def())],
              "B IN Open (X, C)",
            ),
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("B3'", () => b3_p()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interval2sides2alinehelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Interval2sides2aLineHelp")

///|
/// `Interval2sides2aLineHelp`
pub fn interval2sides2alinehelp() -> @kernel.Thm {
  interval2sides2alinehelp_c.get()
}

///|
/// Interval2sides2aLine
fn step_193() -> Unit raise {
  interval2sides2aline_c.set(@readable.prove(
    "\n  forall A B C X. Collinear A B C\n    ==>  X NOTIN Open (A, B)  \\/  X NOTIN Open (A, C)  \\/  X NOTIN Open (B, C)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C X, H1"),
        @readable.assuming(
          "~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [@readable.Thm("B1'", () => b1_p()), @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.have(
          "\n    B IN Open (A, C)  \\/  C IN Open (B, A)  \\/  A IN Open (C, B)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Label("H1"), @readable.Thm("B3'", () => b3_p())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("Interval2sides2aLineHelp", () => interval2sides2alinehelp()),
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interval2sides2aline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Interval2sides2aLine")

///|
/// `Interval2sides2aLine`
pub fn interval2sides2aline() -> @kernel.Thm {
  interval2sides2aline_c.get()
}

///|
/// TwosidesTriangle2aLine
fn step_195() -> Unit raise {
  twosidestriangle2aline_c.set(@readable.prove(
    "\n  forall A B C l. Line l /\\  ~Collinear A B C  ==>  A NOTIN l /\\  B NOTIN l /\\  C NOTIN l  ==>\n    ~(A,B same_side l) /\\  ~(B,C same_side l)  ==>  A,C same_side l",
    @readable.steps_then(
      [
        @readable.intro_tac("forall  A B C l, H1, off_l, H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
          "ABCdistinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  A IN m /\\  C IN m    ",
          "m_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.assuming(
          "~(l INTER m = {})",
          "lmIntersect",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("m_line"),
              @readable.Thm(
                "DisjointLinesImplySameSide",
                () => disjointlinesimplysameside(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "Y",
          "Y IN l /\\  Y IN m    ",
          "Ylm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("lmIntersect"),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.consider(
          "X Z",
          "X IN l  /\\   X IN Open (A, B)  /\\   Z IN l  /\\   Z IN Open (C, B)    ",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  Y IN m DIFF {A}  /\\   Y IN m DIFF {C}  /\\   C IN m DIFF {A}  /\\   A IN m DIFF {C}",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Label("Ylm"),
              @readable.Label("off_l"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("m_line"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.consider(
          "p",
          "Line p /\\  B IN p /\\  A IN p    ",
          "p_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "q",
          "Line q /\\  B IN q /\\  C IN q    ",
          "q_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    X IN p  /\\  Z IN q",
          "Xp",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("p_line"),
              @readable.Label("H2'"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Label("q_line"),
              @readable.Label("H2'"),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN q /\\  B NOTIN m /\\  C NOTIN p",
          "vertex_off_line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("q_line"),
              @readable.Label("m_line"),
              @readable.Label("p_line"),
              @readable.Label("H1"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    X NOTIN q  /\\   X,A same_side q  /\\   Z NOTIN p  /\\   Z,C same_side p",
          "Xsim_qA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("q_line"),
              @readable.Label("p_line"),
              @readable.Prev,
              @readable.Label("H2'"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(m = p)  /\\   ~(m = q)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("vertex_off_line"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    p INTER m = {A}  /\\   q INTER m = {C}",
          "pmA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("p_line"),
              @readable.Label("m_line"),
              @readable.Label("q_line"),
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("Xp"),
              @readable.Label("H2'"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    Y NOTIN p  /\\   Y NOTIN q",
          "notYpq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Thm("EquivIntersectionHelp", () => equivintersectionhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    X IN ray A B DIFF {A}  /\\   Z IN ray C B DIFF {C}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2'"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
              @readable.Label("H2'"),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    X NOTIN m  /\\   Z NOTIN m  /\\   X,B same_side m  /\\   B,Z same_side m",
          "notXZm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("vertex_off_line"),
              @readable.Prev,
              @readable.Thm("RaySameSide", () => raysameside()),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    X,Z same_side m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Label("vertex_off_line"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear X Y Z /\\  Y NOTIN Open (X, Z) /\\   ~(Y = X) /\\  ~(Y = Z) /\\  ~(X = Z)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2'"),
              @readable.Label("Ylm"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Label("notXZm"),
              @readable.Label("Xsim_qA"),
              @readable.Label("Xp"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Z IN Open (X, Y)  \\/  X IN Open (Z, Y)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "ZXY | XZY    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["X IN Open (Z, Y)", "Z IN Open (X, Y)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      ~(Z,Y same_side p)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("p_line"),
                      @readable.Label("Xp"),
                      @readable.Prev,
                      @readable.Thm("SameSide_DEF", () => sameside_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(C,Y same_side p)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("p_line"),
                      @readable.Label("Xsim_qA"),
                      @readable.Label("vertex_off_line"),
                      @readable.Label("notYpq"),
                      @readable.Prev,
                      @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      A IN Open (C, Y)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("p_line"),
                      @readable.Label("m_line"),
                      @readable.Label("pmA"),
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Thm("EquivIntersection", () => equivintersection()),
                      @readable.Thm("NOTIN", () => notin()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("Ylm"),
                    @readable.Label("off_l"),
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm("IntervalRayEZ", () => intervalrayez()),
                    @readable.Thm("RaySameSide", () => raysameside()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      ~(X,Y same_side q)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("q_line"),
                      @readable.Label("Xp"),
                      @readable.Prev,
                      @readable.Thm("SameSide_DEF", () => sameside_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(A,Y same_side q)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("q_line"),
                      @readable.Label("Xsim_qA"),
                      @readable.Label("vertex_off_line"),
                      @readable.Label("notYpq"),
                      @readable.Prev,
                      @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      C IN Open (Y, A)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("q_line"),
                      @readable.Label("m_line"),
                      @readable.Label("pmA"),
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Thm("EquivIntersection", () => equivintersection()),
                      @readable.Thm("NOTIN", () => notin()),
                      @readable.Thm("B1'", () => b1_p()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("Ylm"),
                    @readable.Label("off_l"),
                    @readable.Prev,
                    @readable.Thm("IntervalRayEZ", () => intervalrayez()),
                    @readable.Thm("RaySameSide", () => raysameside()),
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
let twosidestriangle2aline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TwosidesTriangle2aLine")

///|
/// `TwosidesTriangle2aLine`
pub fn twosidestriangle2aline() -> @kernel.Thm {
  twosidestriangle2aline_c.get()
}

///|
/// LineUnionOf2Rays
fn step_197() -> Unit raise {
  lineunionof2rays_c.set(@readable.prove(
    "\n  forall A O B l. Line l /\\  A IN l /\\  B IN l  ==>  O IN Open (A, B)\n   ==>  l = ray O A UNION ray O B",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B l, H1, H2"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B) /\\  O IN l",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("H1"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O A UNION ray O B  SUBSET  l",
          "AOBsub_l",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("RayLine", () => rayline()),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    forall X. X IN l  ==>  X IN ray O A  \\/  X IN ray O B",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall X, Xl"),
              @readable.assuming(
                "~(X IN ray O B)",
                "notXrOB",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      Collinear O B X  /\\   Collinear X A B  /\\   Collinear O A X",
                "XABcol",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Label("H1"),
                    @readable.Label("Xl"),
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      O IN Open (X, B)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("notXrOB"),
                    @readable.Label("Distinct"),
                    @readable.Prev,
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      O NOTIN Open (X, A)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Thm("NOTIN", () => notin()),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Label("XABcol"),
                    @readable.Prev,
                    @readable.Label("H2"),
                    @readable.Thm("Interval2sides2aLine", () => interval2sides2aline()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("Distinct"),
                  @readable.Label("XABcol"),
                  @readable.Prev,
                  @readable.Thm("IN_Ray", () => in_ray()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    l SUBSET ray O A UNION ray O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_UNION", () => @sets.in_union()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("AOBsub_l"),
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
          ],
        ),
      ],
    ),
  ))
}

///|
let lineunionof2rays_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LineUnionOf2Rays")

///|
/// `LineUnionOf2Rays`
pub fn lineunionof2rays() -> @kernel.Thm {
  lineunionof2rays_c.get()
}

///|
/// AtMost2Sides
fn step_201() -> Unit raise {
  atmost2sides_c.set(@readable.prove(
    "\n  forall A B C l.  Line l  ==>  A NOTIN l /\\  B NOTIN l /\\  C NOTIN l\n   ==>  A,B same_side l  \\/  A,C same_side l  \\/  B,C same_side l",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C l, l_line, H2"),
        @readable.assuming(
          "~(A = C)",
          "notAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H2"),
              @readable.Thm("SameSideReflexive", () => samesidereflexive()),
            ],
          ),
        ),
        @readable.assuming(
          "Collinear A B C",
          "ABCcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H2"),
              @readable.Thm("TwosidesTriangle2aLine", () => twosidestriangle2aline()),
            ],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  A IN m /\\  B IN m /\\  C IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notAC"),
              @readable.Prev,
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.assuming(
          "~(m INTER l = {})",
          "m_lNot0",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
            ],
          ),
        ),
        @readable.consider(
          "X",
          "X IN l /\\  X IN m    ",
          "Xlm",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN m DIFF {X}  /\\   B IN m DIFF {X}  /\\   C IN m DIFF {X}",
          "ABCm_X",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    X NOTIN Open (A, B)  \\/  X NOTIN Open (A, C)  \\/  X NOTIN Open (B, C)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABCcol"),
              @readable.Thm("Interval2sides2aLine", () => interval2sides2aline()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Label("m_line"),
            @readable.Label("m_line"),
            @readable.Label("Xlm"),
            @readable.Label("H2"),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            @readable.Label("ABCm_X"),
            @readable.Prev,
            @readable.Thm("EquivIntersection", () => equivintersection()),
          ],
        ),
      ],
    ),
  ))
}

///|
let atmost2sides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AtMost2Sides")

///|
/// `AtMost2Sides`
pub fn atmost2sides() -> @kernel.Thm {
  atmost2sides_c.get()
}

///|
/// FourPointsOrder
fn step_203() -> Unit raise {
  fourpointsorder_c.set(@readable.prove(
    "\n  forall A B C X l.  Line l /\\  A IN l /\\  B IN l /\\  C IN l /\\  X IN l  ==>\n    ~(X = A) /\\  ~(X = B) /\\  ~(X = C)  ==>  B IN Open (A, C)\n   ==>  ordered X A B C  \\/  ordered A X B C  \\/\n       ordered A B X C  \\/  ordered A B C X",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C X l, H1, H2, H3"),
        @readable.have(
          "\n    A IN Open (X, B)  \\/  X IN Open (A, B)  \\/  X IN Open (B, C)  \\/  C IN Open (B, X)",
          "",
          @readable.steps(
            [
              @readable.have(
                "\n      ~(A = B) /\\  ~(B = C)",
                "ABCdistinct",
                @readable.by(
                  @readable.fol,
                  [@readable.Label("H3"), @readable.Thm("B1'", () => b1_p())],
                ),
              ),
              @readable.have(
                "\n      Collinear A B X /\\  Collinear A C X /\\  Collinear C B X",
                "ACXcol",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      A IN Open (X, B)  \\/  X IN Open (A, B)  \\/  B IN Open (A, X)",
                "3pos",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H2"),
                    @readable.Label("ABCdistinct"),
                    @readable.Prev,
                    @readable.Thm("B3'", () => b3_p()),
                    @readable.Thm("B1'", () => b1_p()),
                  ],
                ),
              ),
              @readable.assuming(
                "B IN Open (A, X)",
                "ABX",
                @readable.by(@readable.fol, [@readable.Label("3pos")]),
              ),
              @readable.have(
                "\n      B NOTIN Open (C, X)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ACXcol"),
                    @readable.Label("H3"),
                    @readable.Prev,
                    @readable.Thm("Interval2sides2aLine", () => interval2sides2aline()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("H2"),
                  @readable.Label("ABCdistinct"),
                  @readable.Label("ACXcol"),
                  @readable.Prev,
                  @readable.Thm("B3'", () => b3_p()),
                  @readable.Thm("B1'", () => b1_p()),
                  @readable.Thm("NOTIN", () => notin()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H3"),
            @readable.Thm("B1'", () => b1_p()),
            @readable.Thm("TransitivityBetweenness", () => transitivitybetweenness()),
            @readable.Thm(
              "TransitivityBetweennessVariant",
              () => transitivitybetweennessvariant(),
            ),
            @readable.Thm("Reverse4Order", () => reverse4order()),
          ],
        ),
      ],
    ),
  ))
}

///|
let fourpointsorder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourPointsOrder")

///|
/// `FourPointsOrder`
pub fn fourpointsorder() -> @kernel.Thm {
  fourpointsorder_c.get()
}

///|
/// HilbertAxiomRedundantByMoore
fn step_205() -> Unit raise {
  hilbertaxiomredundantbymoore_c.set(@readable.prove(
    "\n  forall A B C D l.  Line l /\\  A IN l /\\  B IN l /\\  C IN l /\\  D IN l  ==>\n    ~(A = B) /\\  ~(A = C) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(B = D) /\\  ~(C = D)\n   ==>  ordered D A B C \\/ ordered A D B C \\/ ordered A B D C \\/ ordered A B C D \\/\n       ordered D A C B \\/ ordered A D C B \\/ ordered A C D B \\/ ordered A C B D \\/\n       ordered D C A B \\/ ordered C D A B \\/ ordered C A D B \\/ ordered C A B D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D l, H1, H2"),
        @readable.have(
          "\n    Collinear A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN Open (A, C)  \\/  C IN Open (A, B)  \\/  A IN Open (C, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("FourPointsOrder", () => fourpointsorder()),
          ],
        ),
      ],
    ),
  ))
}

///|
let hilbertaxiomredundantbymoore_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HilbertAxiomRedundantByMoore")

///|
/// `HilbertAxiomRedundantByMoore`
pub fn hilbertaxiomredundantbymoore() -> @kernel.Thm {
  hilbertaxiomredundantbymoore_c.get()
}

///|
/// InteriorTransitivity
fn step_207() -> Unit raise {
  interiortransitivity_c.set(@readable.prove(
    "\n  forall A O B M G.  G IN int_angle A O B  /\\   M IN int_angle A O G\n   ==>  M IN int_angle A O B",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B M G, GintAOB MintAOG"),
        @readable.have(
          "\n    ~Collinear A O B",
          "AOBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintAOB"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.consider(
          "G'",
          "G' IN Open (A, B)  /\\   G' IN ray O G DIFF {O}    ",
          "CrossG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintAOB"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN int_angle A O G'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MintAOG"),
              @readable.Prev,
              @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
            ],
          ),
        ),
        @readable.consider(
          "M'",
          "M' IN Open (A, G')  /\\   M' IN ray O M DIFF {O}    ",
          "CrossM",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("Crossbar_THM", () => crossbar_thm())],
          ),
        ),
        @readable.have(
          "\n    ~(M' = O) /\\  ~(M = O) /\\  Collinear O M M' /\\  O NOTIN Open (M', M)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN ray O M' DIFF {O}",
          "MrOM'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    Open (A, G') SUBSET Open (A, B)  /\\   M' IN Open (A, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CrossG"),
              @readable.Thm("IntervalsAreConvex", () => intervalsareconvex()),
              @readable.Label("CrossM"),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    M' IN int_angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBncol"),
              @readable.Prev,
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("MrOM'"),
            @readable.Thm("WholeRayInterior", () => wholerayinterior()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiortransitivity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorTransitivity")

///|
/// `InteriorTransitivity`
pub fn interiortransitivity() -> @kernel.Thm {
  interiortransitivity_c.get()
}

///|
/// HalfPlaneConvexNonempty
fn step_210() -> Unit raise {
  halfplaneconvexnonempty_c.set(@readable.prove(
    "\n  forall l H A.  Line l /\\  A NOTIN l  ==>  H = {X | X NOTIN l  /\\   X,A same_side l}\n    ==>  ~(H = {})  /\\   H SUBSET complement l  /\\   Convex H",
    @readable.steps(
      [
        @readable.intro_tac("forall l H A, l_line, HalfPlane"),
        @readable.have(
          "\n    forall X. X IN H  <=>  X NOTIN l  /\\   X,A same_side l",
          "Hdef",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("HalfPlane"),
              @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    H SUBSET complement l",
          "Hsub",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_PlaneComplement", () => in_planecomplement()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,A same_side l  /\\   A IN H",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Thm("SameSideReflexive", () => samesidereflexive()),
              @readable.Label("Hdef"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(H = {})",
          "Hnonempty",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.have(
          "\n    forall P Q X.  P IN H /\\  Q IN H /\\  X IN Open (P, Q)  ==>  X IN H",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall P Q X, PXQ"),
              @readable.have(
                "\n      P NOTIN l  /\\   P,A same_side l  /\\   Q NOTIN l  /\\   Q,A same_side l",
                "PQinH",
                @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Hdef")]),
              ),
              @readable.have(
                "\n      P,Q same_side l",
                "Psim_lQ",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("l_line"),
                    @readable.Prev,
                    @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.have(
                "\n      X NOTIN l",
                "notXl",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("PXQ"),
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Open (X, P) SUBSET Open (P, Q)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("PXQ"),
                    @readable.Thm("IntervalsAreConvex", () => intervalsareconvex()),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm("SUBSET", () => @sets.subset()),
                  ],
                ),
              ),
              @readable.have(
                "\n      X,P same_side l",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("l_line"),
                    @readable.Prev,
                    @readable.Thm("SUBSET", () => @sets.subset()),
                    @readable.Label("Psim_lQ"),
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      X,A same_side l",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("l_line"),
                    @readable.Label("notXl"),
                    @readable.Label("PQinH"),
                    @readable.Prev,
                    @readable.Label("Psim_lQ"),
                    @readable.Label("PQinH"),
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [@readable.Prev, @readable.Label("notXl"), @readable.Label("Hdef")],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Hnonempty"),
            @readable.Label("Hsub"),
            @readable.Prev,
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("CONVEX", () => convex()),
          ],
        ),
      ],
    ),
  ))
}

///|
let halfplaneconvexnonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HalfPlaneConvexNonempty")

///|
/// `HalfPlaneConvexNonempty`
pub fn halfplaneconvexnonempty() -> @kernel.Thm {
  halfplaneconvexnonempty_c.get()
}

///|
/// PlaneSeparation
fn step_214() -> Unit raise {
  planeseparation_c.set(@readable.prove(
    "\n  forall l.  Line l\n   ==>  ?H1 H2. H1 INTER H2 = {}  /\\   ~(H1 = {})  /\\   ~(H2 = {})  /\\ \n         Convex H1  /\\   Convex H2  /\\   complement l = H1 UNION H2  /\\ \n         forall P Q. P IN H1 /\\  Q IN H2  ==>  ~(P,Q same_side l)",
    @readable.steps(
      [
        @readable.intro_tac("forall l, l_line"),
        @readable.consider(
          "A",
          "A NOTIN l    ",
          "notAl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Thm("ExistsPointOffLine", () => existspointoffline()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN l  /\\   ~(A = E)    ",
          "El",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Thm("I2", () => i2()),
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "B",
          "E IN Open (A, B)  /\\   ~(E = B)  /\\   Collinear A E B    ",
          "AEB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B2'", () => b2_p()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN l",
          "notBl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Label("El"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("notAl"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,B same_side l)",
          "Ansim_lB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("El"),
              @readable.Label("AEB"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.consider(
          "H1 H2",
          "H1 = {X | X NOTIN l  /\\   X,A same_side l}  /\\ \n    H2 = {X | X NOTIN l  /\\   X,B same_side l}    ",
          "H12sets",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    forall X. (X IN H1  <=>  X NOTIN l /\\  X,A same_side l) /\\ \n         (X IN H2  <=>  X NOTIN l /\\  X,B same_side l)",
          "H12def",
          @readable.by(
            @readable.simplify,
            [@readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()), @readable.Prev],
          ),
        ),
        @readable.have(
          "\n    H1 INTER H2 = {}",
          "H12disjoint",
          @readable.steps(
            [
              @readable.assuming(
                "~(H1 INTER H2 = {})",
                "nonempty",
                @readable.by(@readable.fol, []),
              ),
              @readable.consider(
                "V",
                "V IN H1 /\\  V IN H2    ",
                "VinH12",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                  ],
                ),
              ),
              @readable.have(
                "\n      V NOTIN l  /\\   V,A same_side l  /\\   V NOTIN l  /\\   V,B same_side l",
                "",
                @readable.by(@readable.fol, [@readable.Prev, @readable.Label("H12def")]),
              ),
              @readable.have(
                "\n      A,B same_side l",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("l_line"),
                    @readable.Prev,
                    @readable.Label("notAl"),
                    @readable.Label("notBl"),
                    @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Ansim_lB")]),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(H1 = {}) /\\  ~(H2 = {}) /\\  H1 SUBSET complement l /\\  H2 SUBSET complement l /\\ \n    Convex H1 /\\  Convex H2",
          "H12convex_nonempty",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("notAl"),
              @readable.Label("notBl"),
              @readable.Label("H12sets"),
              @readable.Thm("HalfPlaneConvexNonempty", () => halfplaneconvexnonempty()),
            ],
          ),
        ),
        @readable.have(
          "\n    H1 UNION H2  SUBSET  complement l",
          "H12sub",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H12convex_nonempty"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    forall C. C IN complement l  ==>  C IN H1 UNION H2",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall C, compl"),
              @readable.have(
                "\n      C NOTIN l",
                "notCl",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("IN_PlaneComplement", () => in_planecomplement()),
                  ],
                ),
              ),
              @readable.have(
                "\n      C,A same_side l  \\/  C,B same_side l",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("l_line"),
                    @readable.Label("notAl"),
                    @readable.Label("notBl"),
                    @readable.Prev,
                    @readable.Label("Ansim_lB"),
                    @readable.Thm("AtMost2Sides", () => atmost2sides()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("notCl"),
                  @readable.Prev,
                  @readable.Label("H12def"),
                  @readable.Thm("IN_UNION", () => @sets.in_union()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    complement l  SUBSET  H1 UNION H2",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("SUBSET", () => @sets.subset())],
          ),
        ),
        @readable.have(
          "\n    complement l  =  H1 UNION H2",
          "compl_H1unionH2",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H12sub"),
              @readable.Prev,
              @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
            ],
          ),
        ),
        @readable.have(
          "\n    forall P Q. P IN H1 /\\  Q IN H2  ==>  ~(P,Q same_side l)",
          "opp_sides",
          @readable.steps(
            [
              @readable.intro_tac("forall P Q, both"),
              @readable.have(
                "\n      P NOTIN l  /\\   P,A same_side l  /\\    Q NOTIN l  /\\   Q,B same_side l",
                "PH1_QH2",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H12def"),
                    @readable.Thm("IN", () => @sets.in_()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("l_line"),
                  @readable.Prev,
                  @readable.Label("notAl"),
                  @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
                  @readable.Label("notBl"),
                  @readable.Label("Ansim_lB"),
                  @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H12disjoint"),
            @readable.Label("H12convex_nonempty"),
            @readable.Label("compl_H1unionH2"),
            @readable.Label("opp_sides"),
          ],
        ),
      ],
    ),
  ))
}

///|
let planeseparation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PlaneSeparation")

///|
/// `PlaneSeparation`
pub fn planeseparation() -> @kernel.Thm {
  planeseparation_c.get()
}

///|
/// TetralateralSymmetry
fn step_218() -> Unit raise {
  tetralateralsymmetry_c.set(@readable.prove(
    "\n  forall A B C D.  Tetralateral A B C D\n    ==>  Tetralateral B C D A /\\  Tetralateral A B D C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1"),
        @readable.have(
          "\n    ~Collinear A B D /\\  ~Collinear B D C /\\  ~Collinear D C A /\\  ~Collinear C A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let tetralateralsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TetralateralSymmetry")

///|
/// `TetralateralSymmetry`
pub fn tetralateralsymmetry() -> @kernel.Thm {
  tetralateralsymmetry_c.get()
}

///|
/// EasyEmptyIntersectionsTetralateralHelp
fn step_220() -> Unit raise {
  easyemptyintersectionstetralateralhelp_c.set(@readable.prove(
    "\n  forall A B C D. Tetralateral A B C D  ==>  Open (A, B) INTER Open (B, C) = {}",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1"),
        @readable.have(
          "\n    forall X. X IN Open (B, C)  ==>  X NOTIN Open (A, B)",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall X, BXC"),
              @readable.have(
                "\n      ~Collinear A B C /\\  Collinear B X C /\\  ~(X = B)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear A X B",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm(
                      "NoncollinearityExtendsToLine",
                      () => noncollinearityextendstoline(),
                    ),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Thm("B1'", () => b1_p()),
                  @readable.Thm("NOTIN", () => notin()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("DisjointOneNotOther", () => disjointonenotother()),
          ],
        ),
      ],
    ),
  ))
}

///|
let easyemptyintersectionstetralateralhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EasyEmptyIntersectionsTetralateralHelp")

///|
/// `EasyEmptyIntersectionsTetralateralHelp`
pub fn easyemptyintersectionstetralateralhelp() -> @kernel.Thm {
  easyemptyintersectionstetralateralhelp_c.get()
}

///|
/// EasyEmptyIntersectionsTetralateral
fn step_221() -> Unit raise {
  easyemptyintersectionstetralateral_c.set(@readable.prove(
    "\n  forall A B C D. Tetralateral A B C D\n   ==>  Open (A, B) INTER Open (B, C) = {}  /\\   Open (B, C) INTER Open (C, D) = {}  /\\ \n       Open (C, D) INTER Open (D, A) = {}  /\\   Open (D, A) INTER Open (A, B) = {}",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1"),
        @readable.have(
          "\n    Tetralateral B C D A  /\\  Tetralateral C D A B  /\\  Tetralateral D A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("TetralateralSymmetry", () => tetralateralsymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm(
              "EasyEmptyIntersectionsTetralateralHelp",
              () => easyemptyintersectionstetralateralhelp(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let easyemptyintersectionstetralateral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EasyEmptyIntersectionsTetralateral")

///|
/// `EasyEmptyIntersectionsTetralateral`
pub fn easyemptyintersectionstetralateral() -> @kernel.Thm {
  easyemptyintersectionstetralateral_c.get()
}

///|
/// SegmentSameSideOppositeLine
fn step_224() -> Unit raise {
  segmentsamesideoppositeline_c.set(@readable.prove(
    "\n  forall A B C D a c.  Quadrilateral A B C D  ==>\n    Line a /\\  A IN a /\\  B IN a  ==>  Line c /\\  C IN c /\\  D IN c\n    ==>  A,B same_side c  \\/  C,D same_side a",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D a c, H1, a_line, c_line"),
        @readable.assuming(
          "~(C,D same_side a)",
          "CDnsim_a",
          @readable.by(@readable.fol, []),
        ),
        @readable.consider(
          "G",
          "G IN a /\\  G IN Open (C, D)    ",
          "CGD",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("a_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN c /\\  Collinear G B A",
          "Gc",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Prev,
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Label("a_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B C D  /\\   ~Collinear C D A  /\\   Open (A, B) INTER Open (C, D) = {}",
          "quadABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN c /\\  B NOTIN c /\\  ~(A = G) /\\  ~(B = G)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("c_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("Gc"),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN Open (A, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("quadABCD"),
              @readable.Label("CGD"),
              @readable.Thm("DisjointOneNotOther", () => disjointonenotother()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN ray G B DIFF {G}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("Gc"),
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("c_line"),
            @readable.Label("Gc"),
            @readable.Label("Distinct"),
            @readable.Prev,
            @readable.Thm("RaySameSide", () => raysameside()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmentsamesideoppositeline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentSameSideOppositeLine")

///|
/// `SegmentSameSideOppositeLine`
pub fn segmentsamesideoppositeline() -> @kernel.Thm {
  segmentsamesideoppositeline_c.get()
}

///|
/// ConvexImpliesQuad
fn step_226() -> Unit raise {
  conveximpliesquad_c.set(@readable.prove(
    "\n  forall A B C D. Tetralateral A B C D  ==>\n    C IN int_angle D A B  /\\   D IN int_angle A B C\n    ==>  Quadrilateral A B C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1, H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(B = C) /\\  ~(A = D)",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  A IN a /\\  B IN a    ",
          "a_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "b",
          "Line b /\\  B IN b /\\  C IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "d",
          "Line d /\\  D IN d /\\  A IN d    ",
          "d_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    Open (B, C) SUBSET b  /\\   Open (A, B) SUBSET a",
          "BCbABa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("b_line"),
              @readable.Label("a_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.have(
          "\n    D,A same_side b  /\\   C,D same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("a_line"),
              @readable.Label("b_line"),
              @readable.Label("d_line"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    b INTER Open (D, A) = {}  /\\   a INTER Open (C, D) = {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("b_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("BCbABa"),
            @readable.Prev,
            @readable.Thm("INTER_TENSOR", () => inter_tensor()),
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
            @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
            @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let conveximpliesquad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConvexImpliesQuad")

///|
/// `ConvexImpliesQuad`
pub fn conveximpliesquad() -> @kernel.Thm {
  conveximpliesquad_c.get()
}

///|
/// DiagonalsIntersectImpliesConvexQuad
fn step_227() -> Unit raise {
  diagonalsintersectimpliesconvexquad_c.set(@readable.prove(
    "\n  forall A B C D G. ~Collinear B C D  ==>\n    G IN Open (A, C)  /\\   G IN Open (B, D)\n    ==>  ConvexQuadrilateral A B C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D G, BCDncol, DiagInt"),
        @readable.have(
          "\n    ~(B = C) /\\  ~(B = D) /\\  ~(C = D) /\\  ~(C = A) /\\  ~(A = G) /\\  ~(D = G) /\\  ~(B = G)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCDncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Label("DiagInt"),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear A G C /\\  Collinear B G D",
          "Gcols",
          @readable.by(
            @readable.fol,
            [@readable.Label("DiagInt"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C D G /\\  ~Collinear B C G",
          "Gncols",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCDncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("Distinct"),
              @readable.Label("Gcols"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C D A",
          "CDAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("Distinct"),
              @readable.Label("Gcols"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B C /\\  ~Collinear D A G",
          "ABCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Gncols"),
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("Distinct"),
              @readable.Label("Gcols"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D A B",
          "DABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("Distinct"),
              @readable.Label("Gcols"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = D)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DABncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    Tetralateral A B C D",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Label("BCDncol"),
              @readable.Label("CDAncol"),
              @readable.Label("DABncol"),
              @readable.Label("ABCncol"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN ray C G DIFF {C}  /\\   B IN ray D G DIFF {D}  /\\   C IN ray A G DIFF {A}  /\\   D IN ray B G DIFF {B}",
          "ArCG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DiagInt"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN int_angle B C D /\\  G IN int_angle C D A /\\  G IN int_angle D A B /\\  G IN int_angle A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCDncol"),
              @readable.Label("CDAncol"),
              @readable.Label("DABncol"),
              @readable.Label("ABCncol"),
              @readable.Label("DiagInt"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle B C D /\\  B IN int_angle C D A /\\  C IN int_angle D A B /\\  D IN int_angle A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("ArCG"),
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("TetraABCD"),
            @readable.Prev,
            @readable.Thm("ConvexImpliesQuad", () => conveximpliesquad()),
            @readable.Thm("ConvexQuad_DEF", () => convexquad_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let diagonalsintersectimpliesconvexquad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DiagonalsIntersectImpliesConvexQuad")

///|
/// `DiagonalsIntersectImpliesConvexQuad`
pub fn diagonalsintersectimpliesconvexquad() -> @kernel.Thm {
  diagonalsintersectimpliesconvexquad_c.get()
}

///|
/// DoubleNotSimImpliesDiagonalsIntersect
fn step_230() -> Unit raise {
  doublenotsimimpliesdiagonalsintersect_c.set(@readable.prove(
    "\n  forall A B C D l m.  Line l /\\  A IN l /\\  C IN l  ==>  Line m /\\  B IN m /\\  D IN m  ==>\n    Tetralateral A B C D  ==>  ~(B,D same_side l)  ==>  ~(A,C same_side m)\n    ==>  (?G. G IN Open (A, C) INTER Open (B, D)) /\\  ConvexQuadrilateral A B C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D l m, l_line, m_line, H1, H2, H3"),
        @readable.have(
          "\n    ~Collinear A B C /\\  ~Collinear B C D /\\  ~Collinear C D A /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN Open (A, C) /\\  G IN m    ",
          "AGC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Label("m_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN l",
          "Gl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Prev,
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN m /\\  B NOTIN l /\\  D NOTIN l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(l = m) /\\  B IN m DIFF {G} /\\  D IN m DIFF {G}",
          "BDm_G",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("m_line"),
              @readable.Label("Gl"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    l INTER m = {G}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Label("Gl"),
              @readable.Label("AGC"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN Open (B, D)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Label("BDm_G"),
              @readable.Label("H2"),
              @readable.Thm("EquivIntersection", () => equivintersection()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("AGC"),
            @readable.Prev,
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Label("TetraABCD"),
            @readable.Thm(
              "DiagonalsIntersectImpliesConvexQuad",
              () => diagonalsintersectimpliesconvexquad(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let doublenotsimimpliesdiagonalsintersect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DoubleNotSimImpliesDiagonalsIntersect")

///|
/// `DoubleNotSimImpliesDiagonalsIntersect`
pub fn doublenotsimimpliesdiagonalsintersect() -> @kernel.Thm {
  doublenotsimimpliesdiagonalsintersect_c.get()
}

///|
/// ConvexQuadImpliesDiagonalsIntersect
fn step_232() -> Unit raise {
  convexquadimpliesdiagonalsintersect_c.set(@readable.prove(
    "\n  forall A B C D l m.  Line l /\\  A IN l /\\  C IN l  ==>  Line m /\\  B IN m /\\  D IN m  ==>\n    ConvexQuadrilateral A B C D\n    ==>  ~(B,D same_side l) /\\  ~(A,C same_side m) /\\ \n       (?G. G IN Open (A, C) INTER Open (B, D)) /\\  ~Quadrilateral A B D C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D l m, l_line, m_line, ConvQuadABCD"),
        @readable.have(
          "\n    Tetralateral A B C D /\\  A IN int_angle B C D /\\  D IN int_angle A B C",
          "convquadABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ConvQuadABCD"),
              @readable.Thm("ConvexQuad_DEF", () => convexquad_def()),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,D same_side l)  /\\   ~(A,C same_side m)",
          "opp_sides",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("convquadABCD"),
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Thm("InteriorOpposite", () => interioropposite()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN Open (A, C) INTER Open (B, D)    ",
          "Gexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Label("convquadABCD"),
              @readable.Label("opp_sides"),
              @readable.Thm(
                "DoubleNotSimImpliesDiagonalsIntersect",
                () => doublenotsimimpliesdiagonalsintersect(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(Open (B, D) INTER Open (C, A) = {})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Quadrilateral A B D C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("opp_sides"), @readable.Label("Gexists"), @readable.Prev],
        ),
      ],
    ),
  ))
}

///|
let convexquadimpliesdiagonalsintersect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConvexQuadImpliesDiagonalsIntersect")

///|
/// `ConvexQuadImpliesDiagonalsIntersect`
pub fn convexquadimpliesdiagonalsintersect() -> @kernel.Thm {
  convexquadimpliesdiagonalsintersect_c.get()
}

///|
/// FourChoicesTetralateralHelp
fn step_235() -> Unit raise {
  fourchoicestetralateralhelp_v1_c.set(@readable.prove(
    "\n  forall A B C D. Tetralateral A B C D  /\\   C IN int_angle D A B\n    ==>  ConvexQuadrilateral A B C D \\/ C IN int_triangle D A B",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1 CintDAB"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(D = A) /\\  ~(A = C) /\\  ~(B = D) /\\  ~Collinear A B C /\\  ~Collinear B C D /\\  ~Collinear C D A /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "a d",
          "Line a /\\  A IN a /\\  B IN a  /\\ \n    Line d /\\  D IN d /\\  A IN d    ",
          "ad_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "l m",
          "Line l /\\  A IN l /\\  C IN l  /\\ \n    Line m /\\  B IN m /\\  D IN m    ",
          "lm_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    C NOTIN a /\\  C NOTIN d /\\  B NOTIN l /\\  D NOTIN l /\\  A NOTIN m /\\  C NOTIN m /\\  ~Collinear A B D /\\  ~Collinear B D A",
          "tetra'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("ad_line"),
              @readable.Label("lm_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,D same_side l)",
          "Bsim_lD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CintDAB"),
              @readable.Label("lm_line"),
              @readable.Thm("InteriorOpposite", () => interioropposite()),
              @readable.Prev,
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.assuming(
          "A,C same_side m",
          "same",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("lm_line"),
              @readable.Label("H1"),
              @readable.Label("Bsim_lD"),
              @readable.Thm(
                "DoubleNotSimImpliesDiagonalsIntersect",
                () => doublenotsimimpliesdiagonalsintersect(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C,A same_side m",
          "Csim_mA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("lm_line"),
              @readable.Prev,
              @readable.Label("tetra'"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,B same_side d  /\\   C,D same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ad_line"),
              @readable.Label("CintDAB"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN int_angle A B D  /\\   C IN int_angle B D A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tetra'"),
              @readable.Label("ad_line"),
              @readable.Label("lm_line"),
              @readable.Label("Csim_mA"),
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("CintDAB"),
            @readable.Prev,
            @readable.Thm("IN_InteriorTriangle", () => in_interiortriangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let fourchoicestetralateralhelp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourChoicesTetralateralHelp")

///|
/// `FourChoicesTetralateralHelp`
pub fn fourchoicestetralateralhelp_v1() -> @kernel.Thm {
  fourchoicestetralateralhelp_v1_c.get()
}

///|
/// FourChoicesTetralateralHelp
fn step_237() -> Unit raise {
  fourchoicestetralateralhelp_c.set(@readable.prove(
    "\n  forall A B C D. Tetralateral A B C D  /\\   C IN int_angle D A B\n    ==>  ConvexQuadrilateral A B C D \\/ C IN int_triangle D A B",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1 CintDAB"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(D = A) /\\  ~(A = C) /\\  ~(B = D) /\\  ~Collinear A B C /\\  ~Collinear B C D /\\  ~Collinear C D A /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "a d",
          "Line a /\\  A IN a /\\  B IN a  /\\ \n    Line d /\\  D IN d /\\  A IN d    ",
          "ad_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "l m",
          "Line l /\\  A IN l /\\  C IN l  /\\ \n    Line m /\\  B IN m /\\  D IN m    ",
          "lm_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    C NOTIN a /\\  C NOTIN d /\\  B NOTIN l /\\  D NOTIN l /\\  A NOTIN m /\\  C NOTIN m /\\  ~Collinear A B D /\\  ~Collinear B D A",
          "tetra'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("ad_line"),
              @readable.Label("lm_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,D same_side l)",
          "Bsim_lD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CintDAB"),
              @readable.Label("lm_line"),
              @readable.Thm("InteriorOpposite", () => interioropposite()),
              @readable.Prev,
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.assuming(
          "A,C same_side m",
          "same",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("lm_line"),
              @readable.Label("H1"),
              @readable.Label("Bsim_lD"),
              @readable.Thm(
                "DoubleNotSimImpliesDiagonalsIntersect",
                () => doublenotsimimpliesdiagonalsintersect(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C,A same_side m",
          "Csim_mA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("lm_line"),
              @readable.Prev,
              @readable.Label("tetra'"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,B same_side d  /\\   C,D same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ad_line"),
              @readable.Label("CintDAB"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN int_angle A B D  /\\   C IN int_angle B D A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tetra'"),
              @readable.Label("ad_line"),
              @readable.Label("lm_line"),
              @readable.Label("Csim_mA"),
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("CintDAB"),
            @readable.Prev,
            @readable.Thm("IN_InteriorTriangle", () => in_interiortriangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let fourchoicestetralateralhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourChoicesTetralateralHelp")

///|
/// `FourChoicesTetralateralHelp`
pub fn fourchoicestetralateralhelp() -> @kernel.Thm {
  fourchoicestetralateralhelp_c.get()
}

///|
/// InteriorTriangleSymmetry
fn step_238() -> Unit raise {
  interiortrianglesymmetry_c.set(@readable.prove(
    "\n  forall A B C P. P IN int_triangle A B C  ==> P IN int_triangle B C A",
    @readable.by(
      @readable.fol,
      [@readable.Thm("IN_InteriorTriangle", () => in_interiortriangle())],
    ),
  ))
}

///|
let interiortrianglesymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorTriangleSymmetry")

///|
/// `InteriorTriangleSymmetry`
pub fn interiortrianglesymmetry() -> @kernel.Thm {
  interiortrianglesymmetry_c.get()
}

///|
/// FourChoicesTetralateral
fn step_239() -> Unit raise {
  fourchoicestetralateral_c.set(@readable.prove(
    "\n  forall A B C D a. Tetralateral A B C D  ==>\n    Line a /\\  A IN a /\\  B IN a  ==>  C,D same_side a\n    ==>  ConvexQuadrilateral A B C D  \\/  ConvexQuadrilateral A B D C  \\/\n       D IN int_triangle A B C  \\/  C IN int_triangle D A B",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C D a, H1, a_line, Csim_aD"),
        @readable.have(
          "\n     ~(A = B) /\\  ~Collinear A B C /\\  ~Collinear C D A /\\  ~Collinear D A B /\\  Tetralateral A B D C",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
              @readable.Thm("TetralateralSymmetry", () => tetralateralsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C A D /\\  C NOTIN a /\\  D NOTIN a",
          "notCDa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("a_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN int_angle D A B  \\/  D IN int_angle C A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("a_line"),
              @readable.Prev,
              @readable.Label("Csim_aD"),
              @readable.Thm("AngleOrdering", () => angleordering()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "CintDAB | DintCAB    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["C IN int_angle D A B", "D IN int_angle C A B"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      ConvexQuadrilateral A B C D  \\/  C IN int_triangle D A B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Prev,
                      @readable.Thm(
                        "FourChoicesTetralateralHelp",
                        () => fourchoicestetralateralhelp(),
                      ),
                    ],
                  ),
                ),
                @readable.by(@readable.fol, [@readable.Prev]),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      ConvexQuadrilateral A B D C  \\/  D IN int_triangle C A B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("TetraABCD"),
                      @readable.Prev,
                      @readable.Thm(
                        "FourChoicesTetralateralHelp",
                        () => fourchoicestetralateralhelp(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm(
                      "InteriorTriangleSymmetry",
                      () => interiortrianglesymmetry(),
                    ),
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
let fourchoicestetralateral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FourChoicesTetralateral")

///|
/// `FourChoicesTetralateral`
pub fn fourchoicestetralateral() -> @kernel.Thm {
  fourchoicestetralateral_c.get()
}

///|
/// QuadrilateralSymmetry
fn step_242() -> Unit raise {
  quadrilateralsymmetry_c.set(@readable.prove(
    "\n  forall A B C D. Quadrilateral A B C D  ==>\n    Quadrilateral B C D A  /\\   Quadrilateral C D A B  /\\   Quadrilateral D A B C",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
        @readable.Thm("TetralateralSymmetry", () => tetralateralsymmetry()),
        @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
      ],
    ),
  ))
}

///|
let quadrilateralsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QuadrilateralSymmetry")

///|
/// `QuadrilateralSymmetry`
pub fn quadrilateralsymmetry() -> @kernel.Thm {
  quadrilateralsymmetry_c.get()
}

///|
/// FiveChoicesQuadrilateral
fn step_244() -> Unit raise {
  fivechoicesquadrilateral_c.set(@readable.prove(
    "\n  forall A B C D l m.  Quadrilateral A B C D  ==>\n    Line l /\\  A IN l /\\  C IN l  /\\   Line m /\\  B IN m /\\  D IN m\n    ==>  (ConvexQuadrilateral A B C D  \\/  A IN int_triangle B C D  \\/\n       B IN int_triangle C D A  \\/  C IN int_triangle D A B  \\/\n       D IN int_triangle A B C)  /\\ \n       (~(B,D same_side l) \\/ ~(A,C same_side m))",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D l m, H1, lm_line"),
        @readable.have(
          "\n    Tetralateral A B C D",
          "H1Tetra",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(C = D)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1Tetra"),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "a c",
          "Line a /\\  A IN a /\\  B IN a  /\\ \n    Line c /\\  C IN c /\\  D IN c    ",
          "ac_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    Quadrilateral C D A B  /\\   Tetralateral C D A B",
          "tetraCDAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("QuadrilateralSymmetry", () => quadrilateralsymmetry()),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~ConvexQuadrilateral A B D C  /\\   ~ConvexQuadrilateral C D B A",
          "notconvquad",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm(
                "ConvexQuadImpliesDiagonalsIntersect",
                () => convexquadimpliesdiagonalsintersect(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ConvexQuadrilateral A B C D  \\/  A IN int_triangle B C D  \\/\n    B IN int_triangle C D A  \\/  C IN int_triangle D A B  \\/\n    D IN int_triangle A B C",
          "5choices",
          @readable.steps(
            [
              @readable.have(
                "\n      A,B same_side c  \\/  C,D same_side a",
                "2pos",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("ac_line"),
                    @readable.Thm(
                      "SegmentSameSideOppositeLine",
                      () => segmentsamesideoppositeline(),
                    ),
                  ],
                ),
              ),
              @readable.assuming(
                "A,B same_side c",
                "Asym_cB",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("2pos"),
                    @readable.Label("H1Tetra"),
                    @readable.Label("ac_line"),
                    @readable.Label("notconvquad"),
                    @readable.Thm(
                      "FourChoicesTetralateral",
                      () => fourchoicestetralateral(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      ConvexQuadrilateral C D A B  \\/  B IN int_triangle C D A  \\/\n      A IN int_triangle B C D",
                "X1",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("tetraCDAB"),
                    @readable.Label("ac_line"),
                    @readable.Prev,
                    @readable.Label("notconvquad"),
                    @readable.Thm(
                      "FourChoicesTetralateral",
                      () => fourchoicestetralateral(),
                    ),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Thm("QuadrilateralSymmetry", () => quadrilateralsymmetry()),
                  @readable.Thm("ConvexQuad_DEF", () => convexquad_def()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,D same_side l) \\/ ~(A,C same_side m)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("lm_line"),
              @readable.Thm(
                "ConvexQuadImpliesDiagonalsIntersect",
                () => convexquadimpliesdiagonalsintersect(),
              ),
              @readable.Thm("IN_InteriorTriangle", () => in_interiortriangle()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("InteriorOpposite", () => interioropposite()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("5choices"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let fivechoicesquadrilateral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FiveChoicesQuadrilateral")

///|
/// `FiveChoicesQuadrilateral`
pub fn fivechoicesquadrilateral() -> @kernel.Thm {
  fivechoicesquadrilateral_c.get()
}

///|
/// IntervalSymmetry
fn step_249() -> Unit raise {
  intervalsymmetry_c.set(@readable.prove(
    "\n  forall A B. Open (A, B) = Open (B, A)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("B1'", () => b1_p()),
        @readable.Thm("EXTENSION", () => @sets.extension()),
      ],
    ),
  ))
}

///|
let intervalsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IntervalSymmetry")

///|
/// `IntervalSymmetry`
pub fn intervalsymmetry() -> @kernel.Thm {
  intervalsymmetry_c.get()
}

///|
/// SegmentSymmetry
fn step_250() -> Unit raise {
  segmentsymmetry_c.set(@readable.prove(
    "\n  forall A B. seg A B = seg B A",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Segment_DEF", () => segment_def()),
        @readable.Thm("INSERT_COMM", () => @sets.insert_comm()),
        @readable.Thm("IntervalSymmetry", () => intervalsymmetry()),
      ],
    ),
  ))
}

///|
let segmentsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentSymmetry")

///|
/// `SegmentSymmetry`
pub fn segmentsymmetry() -> @kernel.Thm {
  segmentsymmetry_c.get()
}

///|
/// C1OppositeRay
fn step_254() -> Unit raise {
  c1oppositeray_c.set(@readable.prove(
    "\n  forall O P s.  Segment s /\\  ~(O = P)  ==>  ?Q. P IN Open (O, Q)  /\\   seg P Q === s",
    @readable.steps(
      [
        @readable.intro_tac("forall O P s, H1"),
        @readable.consider(
          "Z",
          "P IN Open (O, Z)  /\\   ~(P = Z)    ",
          "OPZ",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("B2'", () => b2_p()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.consider(
          "Q",
          "Q IN ray P Z DIFF {P} /\\  seg P Q === s    ",
          "PQeq",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Prev, @readable.Thm("C1", () => c1())],
          ),
        ),
        @readable.have(
          "\n    P IN Open (Q, O)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OPZ"),
              @readable.Prev,
              @readable.Thm(
                "OppositeRaysIntersect1pointHelp",
                () => oppositeraysintersect1pointhelp(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("B1'", () => b1_p()), @readable.Label("PQeq")],
        ),
      ],
    ),
  ))
}

///|
let c1oppositeray_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C1OppositeRay")

///|
/// `C1OppositeRay`
pub fn c1oppositeray() -> @kernel.Thm {
  c1oppositeray_c.get()
}

///|
/// OrderedCongruentSegments
fn step_256() -> Unit raise {
  orderedcongruentsegments_c.set(@readable.prove(
    "\n  forall A B C D G.  ~(A = C) /\\  ~(D = G)  ==>  seg A C === seg D G  ==>  B IN Open (A, C)\n    ==>  ?E. E IN Open (D, G)  /\\   seg A B === seg D E",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D G, H1, H2, H3"),
        @readable.have(
          "\n    Segment (seg A B) /\\  Segment (seg A C) /\\  Segment (seg B C) /\\  Segment (seg D G)",
          "segs",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("H1"),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg D G === seg A C",
          "DGeqAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN ray D G DIFF {D} /\\  seg D E === seg A B    ",
          "DEeqAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("segs"),
              @readable.Label("H1"),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(E = D) /\\  Collinear D E G /\\  D NOTIN Open (G, E)",
          "ErDG",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "G'",
          "E IN Open (D, G') /\\  seg E G' === seg B C    ",
          "DEG'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("segs"),
              @readable.Prev,
              @readable.Thm("C1OppositeRay", () => c1oppositeray()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg D G' === seg A C",
          "DG'eqAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DEG'"),
              @readable.Label("H3"),
              @readable.Label("DEeqAB"),
              @readable.Thm("C3", () => c3()),
            ],
          ),
        ),
        @readable.have(
          "\n    Segment (seg D G') /\\  Segment (seg D E)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DEG'"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A C === seg D G' /\\  seg A B === seg D E",
          "ABeqDE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("segs"),
              @readable.Prev,
              @readable.Label("DG'eqAC"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Label("DEeqAB"),
            ],
          ),
        ),
        @readable.have(
          "\n    G' IN ray D E DIFF {D}  /\\   G IN ray D E DIFF {D}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DEG'"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
              @readable.Label("ErDG"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("H1"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    G' = G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ErDG"),
              @readable.Label("segs"),
              @readable.Prev,
              @readable.Label("DG'eqAC"),
              @readable.Label("DGeqAC"),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Label("DEG'"), @readable.Label("ABeqDE")],
        ),
      ],
    ),
  ))
}

///|
let orderedcongruentsegments_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OrderedCongruentSegments")

///|
/// `OrderedCongruentSegments`
pub fn orderedcongruentsegments() -> @kernel.Thm {
  orderedcongruentsegments_c.get()
}

///|
/// SegmentSubtraction
fn step_261() -> Unit raise {
  segmentsubtraction_c.set(@readable.prove(
    "\n  forall A B C A' B' C'. B IN Open (A, C)  /\\   B' IN Open (A', C')  ==>\n    seg A B === seg A' B'  ==>  seg A C === seg A' C'\n    ==>  seg B C === seg B' C'",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2, H3"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  Collinear A B C /\\  Segment (seg A' C') /\\  Segment (seg B' C')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "Q",
          "B IN Open (A, Q)  /\\   seg B Q === seg B' C'    ",
          "defQ",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("C1OppositeRay", () => c1oppositeray())],
          ),
        ),
        @readable.have(
          "\n    seg A Q === seg A' C'",
          "AQ_A'C'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("C3", () => c3()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = Q)  /\\   Collinear A B Q  /\\   A NOTIN Open (C, B)  /\\   A NOTIN Open (Q, B)",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("defQ"),
                  @readable.Thm("B1'", () => b1_p()),
                  @readable.Thm("NOTIN", () => notin()),
                ],
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("defQ"),
                  @readable.Thm("B1'", () => b1_p()),
                  @readable.Label("H1"),
                  @readable.Thm("B3'", () => b3_p()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN ray A B DIFF {A}  /\\   Q IN ray A B DIFF {A}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("defQ"),
            @readable.Label("Distinct"),
            @readable.Prev,
            @readable.Label("AQ_A'C'"),
            @readable.Label("H3"),
            @readable.Thm("C1", () => c1()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmentsubtraction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentSubtraction")

///|
/// `SegmentSubtraction`
pub fn segmentsubtraction() -> @kernel.Thm {
  segmentsubtraction_c.get()
}

///|
/// SegmentOrderingUse
fn step_262() -> Unit raise {
  segmentorderinguse_c.set(@readable.prove(
    "\n  forall A B s.  Segment s  /\\   ~(A = B)  ==>  s <__ seg A B\n    ==>  ?G. G IN Open (A, B)  /\\   s === seg A G",
    @readable.steps(
      [
        @readable.intro_tac("forall A B s, H1, H2"),
        @readable.consider(
          "A' B' G'",
          "seg A B = seg A' B'  /\\   G' IN Open (A', B')  /\\   s === seg A' G'    ",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A' = G') /\\  ~(A' = B')  /\\   seg A' B' === seg A B",
          "A'notB'G'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("H1"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN Open (A, B)  /\\   seg A' G' === seg A G    ",
          "AGB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("A'notB'G'"),
              @readable.Label("H1"),
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm(
                "OrderedCongruentSegments",
                () => orderedcongruentsegments(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    s === seg A G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("A'notB'G'"),
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("H2'"),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("AGB"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let segmentorderinguse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentOrderingUse")

///|
/// `SegmentOrderingUse`
pub fn segmentorderinguse() -> @kernel.Thm {
  segmentorderinguse_c.get()
}

///|
/// SegmentTrichotomy1
fn step_267() -> Unit raise {
  segmenttrichotomy1_c.set(@readable.prove(
    "\n  forall s t.  s <__ t  ==>  ~(s === t)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t, H1"),
        @readable.consider(
          "A B G",
          "Segment s /\\  t = seg A B /\\  G IN Open (A, B) /\\  s === seg A G    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = G) /\\  ~(A = B) /\\  ~(G = B)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1'"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    seg A B === seg A B",
          "ABrefl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN ray A B DIFF {A}  /\\   B IN ray A B DIFF {A}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("IntervalRay", () => intervalray()),
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Label("Distinct"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(seg A G === seg A B)  /\\  seg A G === s",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Prev,
              @readable.Label("ABrefl"),
              @readable.Thm("C1", () => c1()),
              @readable.Label("H1'"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Distinct"),
            @readable.Label("H1'"),
            @readable.Thm("SEGMENT", () => segment()),
            @readable.Prev,
            @readable.Thm("C2Transitive", () => c2transitive()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmenttrichotomy1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentTrichotomy1")

///|
/// `SegmentTrichotomy1`
pub fn segmenttrichotomy1() -> @kernel.Thm {
  segmenttrichotomy1_c.get()
}

///|
/// SegmentTrichotomy2
fn step_270() -> Unit raise {
  segmenttrichotomy2_c.set(@readable.prove(
    "\n  forall s t u.  s <__ t  /\\   Segment u  /\\   t === u  ==>  s <__ u",
    @readable.steps(
      [
        @readable.intro_tac("forall s t u, H1 H2"),
        @readable.consider(
          "A B P",
          "Segment s  /\\   t = seg A B  /\\   P IN Open (A, B)  /\\   s === seg A P    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = P)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.consider(
          "X Y",
          "u = seg X Y /\\  ~(X = Y)    ",
          "uXY",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("SEGMENT", () => segment())],
          ),
        ),
        @readable.consider(
          "Q",
          "Q IN Open (X, Y)  /\\   seg A P === seg X Q    ",
          "XQY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Label("H1'"),
              @readable.Label("H2"),
              @readable.Thm(
                "OrderedCongruentSegments",
                () => orderedcongruentsegments(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(X = Q)  /\\   s === seg X Q",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("H1'"),
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("XQY"),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1'"),
            @readable.Label("uXY"),
            @readable.Label("XQY"),
            @readable.Prev,
            @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmenttrichotomy2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentTrichotomy2")

///|
/// `SegmentTrichotomy2`
pub fn segmenttrichotomy2() -> @kernel.Thm {
  segmenttrichotomy2_c.get()
}

///|
/// SegmentOrderTransitivity
fn step_271() -> Unit raise {
  segmentordertransitivity_c.set(@readable.prove(
    "\n  forall s t u.  s <__ t  /\\   t <__ u  ==>  s <__ u",
    @readable.steps(
      [
        @readable.intro_tac("forall s t u, H1"),
        @readable.consider(
          "A B G",
          "u = seg A B  /\\   G IN Open (A, B)  /\\   t === seg A G    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = G) /\\  Segment s",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("H1"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    s <__ seg A G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("SegmentTrichotomy2", () => segmenttrichotomy2()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "F IN Open (A, G) /\\  s === seg A F    ",
          "AFG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("SegmentOrderingUse", () => segmentorderinguse()),
            ],
          ),
        ),
        @readable.have(
          "\n    F IN Open (A, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("IntervalsAreConvex", () => intervalsareconvex()),
              @readable.Prev,
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Distinct"),
            @readable.Label("H1'"),
            @readable.Prev,
            @readable.Label("AFG"),
            @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmentordertransitivity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentOrderTransitivity")

///|
/// `SegmentOrderTransitivity`
pub fn segmentordertransitivity() -> @kernel.Thm {
  segmentordertransitivity_c.get()
}

///|
/// SegmentTrichotomy
fn step_274() -> Unit raise {
  segmenttrichotomy_c.set(@readable.prove(
    "\n  forall s t.  Segment s /\\  Segment t\n    ==>  (s === t  \\/  s <__ t  \\/  t <__ s)  /\\   ~(s === t /\\  s <__ t)  /\\ \n       ~(s === t /\\  t <__ s)  /\\   ~(s <__ t /\\  t <__ s)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t, H1"),
        @readable.have(
          "\n    ~(s === t  /\\   s <__ t)",
          "Not12",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SegmentTrichotomy1", () => segmenttrichotomy1()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(s === t  /\\   t <__ s)",
          "Not13",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("SegmentTrichotomy1", () => segmenttrichotomy1()),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(s <__ t  /\\   t <__ s)",
          "Not23",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm(
                "SegmentOrderTransitivity",
                () => segmentordertransitivity(),
              ),
              @readable.Thm("SegmentTrichotomy1", () => segmenttrichotomy1()),
              @readable.Label("H1"),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.consider(
          "O P",
          "s = seg O P  /\\   ~(O = P)    ",
          "sOP",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("SEGMENT", () => segment())],
          ),
        ),
        @readable.consider(
          "Q",
          "Q IN ray O P DIFF {O}  /\\   seg O Q === t    ",
          "QrOP",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Prev, @readable.Thm("C1", () => c1())],
          ),
        ),
        @readable.have(
          "\n    O NOTIN Open (Q, P)  /\\   Collinear O P Q   /\\   ~(O = Q)",
          "notQOP",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    s === seg O P  /\\   t === seg O Q  /\\   seg O Q === t  /\\   seg O P === s",
          "stOPQ",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("sOP"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("QrOP"),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.assuming(
          "~(Q = P)",
          "notQP",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stOPQ"),
              @readable.Label("sOP"),
              @readable.Label("QrOP"),
              @readable.Label("Not12"),
              @readable.Label("Not13"),
              @readable.Label("Not23"),
            ],
          ),
        ),
        @readable.have(
          "\n    P IN Open (O, Q)  \\/  Q IN Open (O, P)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sOP"),
              @readable.Prev,
              @readable.Label("notQOP"),
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    s <__ seg O Q  \\/  t <__ seg O P",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("stOPQ"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    s <__ t  \\/  t <__ s",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("stOPQ"),
              @readable.Thm("SegmentTrichotomy2", () => segmenttrichotomy2()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Not12"),
            @readable.Label("Not13"),
            @readable.Label("Not23"),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmenttrichotomy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentTrichotomy")

///|
/// `SegmentTrichotomy`
pub fn segmenttrichotomy() -> @kernel.Thm {
  segmenttrichotomy_c.get()
}

///|
/// C4Uniqueness
fn step_277() -> Unit raise {
  c4uniqueness_c.set(@readable.prove(
    "\n  forall O A B P l.  Line l /\\  O IN l /\\  A IN l /\\  ~(O = A)  ==>\n    B NOTIN l /\\  P NOTIN l /\\  P,B same_side l  ==>  angle A O P === angle A O B\n    ==>  ray O B = ray O P",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B P l, H1, H2, H3"),
        @readable.have(
          "\n    ~(O = B) /\\  ~(O = P) /\\  Ray (ray O B) /\\  Ray (ray O P)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("H1"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("RAY", () => ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O B  /\\   B,B same_side l",
          "Bsim_lB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("SameSideReflexive", () => samesidereflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A O B)  /\\   angle A O B === angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Label("Distinct"),
            @readable.Label("Bsim_lB"),
            @readable.Label("H3"),
            @readable.Thm("C4", () => c4()),
          ],
        ),
      ],
    ),
  ))
}

///|
let c4uniqueness_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C4Uniqueness")

///|
/// `C4Uniqueness`
pub fn c4uniqueness() -> @kernel.Thm {
  c4uniqueness_c.get()
}

///|
/// AngleSymmetry
fn step_282() -> Unit raise {
  anglesymmetry_c.set(@readable.prove(
    "\n  forall A O B. angle A O B = angle B O A",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Angle_DEF", () => angle_def()),
        @readable.Thm("UNION_COMM", () => @sets.union_comm()),
      ],
    ),
  ))
}

///|
let anglesymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleSymmetry")

///|
/// `AngleSymmetry`
pub fn anglesymmetry() -> @kernel.Thm {
  anglesymmetry_c.get()
}

///|
/// TriangleCongSymmetry
fn step_285() -> Unit raise {
  trianglecongsymmetry_c.set(@readable.prove(
    "\n  forall A B C A' B' C'. A,B,C cong A',B',C'\n   ==>  A,C,B cong A',C',B' /\\  B,A,C cong B',A',C' /\\ \n       B,C,A cong B',C',A' /\\  C,A,B cong C',A',B' /\\  C,B,A cong C',B',A'",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1"),
        @readable.have(
          "\n    ~Collinear A B C /\\  ~Collinear A' B' C' /\\ \n    seg A B === seg A' B' /\\  seg A C === seg A' C' /\\  seg B C === seg B' C' /\\ \n    angle A B C === angle A' B' C' /\\  angle B C A === angle B' C' A' /\\  angle C A B === angle C' A' B'",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg B A === seg B' A' /\\  seg C A === seg C' A' /\\  seg C B === seg C' B'",
          "segments",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B A === angle C' B' A' /\\  angle A C B === angle A' C' B' /\\  angle B A C === angle B' A' C'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            @readable.Label("H1'"),
            @readable.Label("segments"),
            @readable.Prev,
            @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let trianglecongsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TriangleCongSymmetry")

///|
/// `TriangleCongSymmetry`
pub fn trianglecongsymmetry() -> @kernel.Thm {
  trianglecongsymmetry_c.get()
}

///|
/// SAS
fn step_289() -> Unit raise {
  sas_c.set(@readable.prove(
    "\n  forall A B C A' B' C'. ~Collinear A B C /\\  ~Collinear A' B' C'  ==>\n    seg B A === seg B' A'  /\\   seg B C === seg B' C'  ==> angle A B C === angle A' B' C'\n    ==>  A,B,C cong A',B',C'",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2, H3"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(A' = C')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "c",
          "Line c /\\  A IN c /\\  B IN c    ",
          "c_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    C NOTIN c",
          "notCc",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("c_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C A === angle B' C' A'",
          "BCAeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("C6", () => c6()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A C === angle B' A' C'",
          "BACeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("C6", () => c6()),
            ],
          ),
        ),
        @readable.consider(
          "Y",
          "Y IN ray A C DIFF {A}  /\\   seg A Y === seg A' C'    ",
          "YrAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    Y NOTIN c  /\\   Y,C same_side c",
          "Ysim_cC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Label("notCc"),
              @readable.Prev,
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear Y A B",
          "YABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("c_line"),
              @readable.Prev,
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A Y = ray A C  /\\   angle Y A B = angle C A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("YrAC"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle Y A B === angle C' A' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BACeq"),
              @readable.Prev,
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B Y === angle A' B' C'",
          "ABYeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("YABncol"),
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("YrAC"),
              @readable.Prev,
              @readable.Thm("C6", () => c6()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A B C) /\\  Angle (angle A' B' C') /\\  Angle (angle A B Y)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("YABncol"),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B Y === angle A B C",
          "ABYeqABC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("ABYeq"),
              @readable.Prev,
              @readable.Label("H3"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray B C = ray B Y  /\\   ~(Y = B)  /\\   Y IN ray B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Label("Distinct"),
              @readable.Label("notCc"),
              @readable.Label("Ysim_cC"),
              @readable.Label("ABYeqABC"),
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Prev,
              @readable.Thm("EndpointInRay", () => endpointinray()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear B C Y  /\\   Collinear A C Y",
          "ABCYcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("YrAC"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    C = Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("ABCYcol"),
              @readable.Thm(
                "TwoSidesTriangle1Intersection",
                () => twosidestriangle1intersection(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A C === seg A' C'",
          "",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Label("YrAC")]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            @readable.Prev,
            @readable.Label("H3"),
            @readable.Label("BCAeq"),
            @readable.Label("BACeq"),
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let sas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SAS")

///|
/// `SAS`
pub fn sas() -> @kernel.Thm {
  sas_c.get()
}

///|
/// ASA
fn step_295() -> Unit raise {
  asa_c.set(@readable.prove(
    "\n  forall A B C A' B' C'. ~Collinear A B C /\\  ~Collinear A' B' C'  ==>\n    seg A C === seg A' C'  ==>  angle C A B === angle C' A' B'  /\\   angle B C A === angle B' C' A'\n    ==>  A,B,C cong A',B',C'",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2, H3"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  ~(A' = B') /\\  ~(A' = C') /\\  ~(B' = C') /\\ \n    Segment (seg C' B')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "D",
          "D IN ray C B DIFF {C}  /\\   seg C D === seg C' B'  /\\   ~(D = C)    ",
          "DrCB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("C1", () => c1()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear C B D",
          "CBDcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D C A /\\  Angle (angle C A D) /\\  Angle (angle C' A' B') /\\  Angle (angle C A B)",
          "DCAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Label("DrCB"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Label("H1"),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.consider(
          "b",
          "Line b /\\  A IN b /\\  C IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN b /\\  ~(D = A)",
          "notBb",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("DCAncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    D NOTIN b  /\\   D,B same_side b",
          "Dsim_bB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("b_line"),
              @readable.Prev,
              @readable.Label("DrCB"),
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray C D = ray C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("DrCB"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle D C A === angle B' C' A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    D,C,A cong B',C',A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DCAncol"),
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("DrCB"),
              @readable.Label("H2"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Prev,
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C A D === angle C' A' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C A D === angle C A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DCAncol"),
              @readable.Prev,
              @readable.Label("H3"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A B = ray A D  /\\   D IN ray A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("b_line"),
              @readable.Label("Distinct"),
              @readable.Label("notBb"),
              @readable.Label("Dsim_bB"),
              @readable.Prev,
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
              @readable.Label("notBb"),
              @readable.Thm("EndpointInRay", () => endpointinray()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear A B D",
          "ABDcol",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("IN_Ray", () => in_ray())],
          ),
        ),
        @readable.have(
          "\n    D = B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("CBDcol"),
              @readable.Label("ABDcol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "TwoSidesTriangle1Intersection",
                () => twosidestriangle1intersection(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg C B === seg C' B'",
          "",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Label("DrCB")]),
        ),
        @readable.have(
          "\n    B,C,A cong B',C',A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("H3"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("TriangleCongSymmetry", () => trianglecongsymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let asa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASA")

///|
/// `ASA`
pub fn asa() -> @kernel.Thm {
  asa_c.get()
}

///|
/// AngleSubtraction
fn step_298() -> Unit raise {
  anglesubtraction_c.set(@readable.prove(
    "\n  forall A O B A' O' B' G G'. G IN int_angle A O B  /\\   G' IN int_angle A' O' B'  ==>\n    angle A O B === angle A' O' B'  /\\   angle A O G === angle A' O' G'\n    ==>  angle G O B === angle G' O' B'",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A' O' B' G G', H1, H2"),
        @readable.have(
          "\n    ~Collinear A O B /\\  ~Collinear A' O' B'",
          "A'O'B'ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B) /\\  ~(G = O) /\\  ~(G' = O') /\\  Segment (seg O' A') /\\  Segment (seg O' B')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Label("H1"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "X Y",
          "X IN ray O A DIFF {O}  /\\   seg O X === seg O' A'  /\\   Y IN ray O B DIFF {O}  /\\   seg O Y === seg O' B'    ",
          "XYexists",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("C1", () => c1())]),
        ),
        @readable.have(
          "\n    G IN int_angle X O Y",
          "GintXOY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("XYexists"),
              @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "H H'",
          "H IN Open (X, Y)  /\\   H IN ray O G DIFF {O}  /\\ \n    H' IN Open (A', B')  /\\   H' IN ray O' G' DIFF {O'}    ",
          "Hexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    H IN int_angle X O Y  /\\   H' IN int_angle A' O' B'",
          "HintXOY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintXOY"),
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O X = ray O A  /\\   ray O Y = ray O B  /\\   ray O H = ray O G  /\\   ray O' H' = ray O' G'",
          "Orays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("XYexists"),
              @readable.Label("Hexists"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle X O Y === angle A' O' B'  /\\   angle X O H === angle A' O' H'",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear X O Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintXOY"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    X,O,Y cong A',O',B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("A'O'B'ncol"),
              @readable.Label("H2'"),
              @readable.Label("XYexists"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg X Y === seg A' B'  /\\   angle O Y X === angle O' B' A'  /\\   angle Y X O === angle B' A' O'",
          "XOYcong",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear O H X /\\  ~Collinear O' H' A' /\\  ~Collinear O Y H /\\  ~Collinear O' B' H'",
          "OHXncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("HintXOY"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray X H = ray X Y  /\\   ray A' H' = ray A' B'  /\\   ray Y H = ray Y X  /\\   ray B' H' = ray B' A'",
          "Hrays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Hexists"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle H X O === angle H' A' O'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XOYcong"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    O,H,X cong O',H',A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OHXncol"),
              @readable.Label("XYexists"),
              @readable.Prev,
              @readable.Label("H2'"),
              @readable.Thm("ASA", () => asa()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg X H === seg A' H'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg H Y === seg H' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Hexists"),
              @readable.Label("XOYcong"),
              @readable.Prev,
              @readable.Thm("SegmentSubtraction", () => segmentsubtraction()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg Y O  === seg B' O'  /\\   seg Y H === seg B' H'",
          "YHeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XYexists"),
              @readable.Prev,
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O Y H === angle O' B' H'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XOYcong"),
              @readable.Label("Hrays"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    O,Y,H cong O',B',H'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OHXncol"),
              @readable.Label("YHeq"),
              @readable.Prev,
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n  angle H O Y === angle H' O' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Orays"),
            @readable.Thm("Angle_DEF", () => angle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let anglesubtraction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleSubtraction")

///|
/// `AngleSubtraction`
pub fn anglesubtraction() -> @kernel.Thm {
  anglesubtraction_c.get()
}

///|
/// OrderedCongruentAngles
fn step_301() -> Unit raise {
  orderedcongruentangles_c.set(@readable.prove(
    "\n  forall A O B A' O' B' G. ~Collinear A' O' B'  /\\   angle A O B === angle A' O' B'  /\\  G IN int_angle A O B\n    ==>  ?G'. G' IN int_angle A' O' B'  /\\   angle A O G === angle A' O' G'",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A' O' B' G, H1 H2 H3"),
        @readable.have(
          "\n    ~Collinear A O B",
          "AOBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B) /\\  ~(A' = B') /\\  ~(O = G) /\\  Segment (seg O' A') /\\  Segment (seg O' B')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBncol"),
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Label("H3"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "X Y",
          "X IN ray O A DIFF {O}  /\\   seg O X === seg O' A'  /\\   Y IN ray O B DIFF {O}  /\\   seg O Y === seg O' B'    ",
          "defXY",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("C1", () => c1())]),
        ),
        @readable.have(
          "\n    G IN int_angle X O Y",
          "GintXOY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Prev,
              @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear X O Y /\\  ~(X = Y)",
          "XOYncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "H",
          "H IN Open (X, Y)  /\\   H IN ray O G DIFF {O}    ",
          "defH",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintXOY"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O X = ray O A  /\\   ray O Y = ray O B  /\\   ray O H = ray O G",
          "Orays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("defXY"),
              @readable.Prev,
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle X O Y === angle A' O' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    X,O,Y cong A',O',B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XOYncol"),
              @readable.Label("H1"),
              @readable.Label("defXY"),
              @readable.Prev,
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg X Y === seg A' B'  /\\   angle O X Y === angle O' A' B'",
          "YXOcong",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "G'",
          "G' IN Open (A', B')  /\\   seg X H === seg A' G'    ",
          "A'G'B'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("XOYncol"),
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Label("defH"),
              @readable.Thm(
                "OrderedCongruentSegments",
                () => orderedcongruentsegments(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    G' IN int_angle A' O' B'",
          "G'intA'O'B'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray X H = ray X Y  /\\   ray A' G' = ray A' B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("defH"),
              @readable.Label("A'G'B'"),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O X H === angle O' A' G'",
          "HXOeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
              @readable.Label("YXOcong"),
            ],
          ),
        ),
        @readable.have(
          "\n    H IN int_angle X O Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintXOY"),
              @readable.Label("defH"),
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear O X H /\\  ~Collinear O' A' G'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("G'intA'O'B'"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    O,X,H cong O',A',G'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("A'G'B'"),
              @readable.Label("defXY"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("HXOeq"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle X O H === angle A' O' G'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("G'intA'O'B'"),
            @readable.Prev,
            @readable.Label("Orays"),
            @readable.Thm("Angle_DEF", () => angle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let orderedcongruentangles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OrderedCongruentAngles")

///|
/// `OrderedCongruentAngles`
pub fn orderedcongruentangles() -> @kernel.Thm {
  orderedcongruentangles_c.get()
}

///|
/// AngleAddition
fn step_302() -> Unit raise {
  angleaddition_c.set(@readable.prove(
    "\n  forall A O B A' O' B' G G'.  G IN int_angle A O B  /\\   G' IN int_angle A' O' B'  ==>\n    angle A O G === angle A' O' G'  /\\   angle G O B === angle G' O' B'\n   ==>  angle A O B === angle A' O' B'",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A' O' B' G G', H1, H2"),
        @readable.have(
          "\n    ~Collinear A O B /\\  ~Collinear A' O' B'",
          "AOBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(A = B) /\\  ~(O = B) /\\  ~(A' = O') /\\  ~(A' = B') /\\  ~(O' = B') /\\  ~(G = O)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Label("H1"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.consider(
          "a b",
          "Line a /\\  O IN a /\\  A IN a  /\\ \n    Line b /\\  O IN b /\\  B IN b    ",
          "a_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "g",
          "Line g /\\  O IN g /\\  G IN g    ",
          "g_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    G NOTIN a /\\  G,B same_side a",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("H1"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O G /\\  ~Collinear A' O' G'",
          "AOGncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A O B) /\\  Angle (angle A' O' B') /\\  Angle (angle A O G) /\\  Angle (angle A' O' G')",
          "angles",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBncol"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ?! r. Ray r /\\  ?X. ~(O = X) /\\  r = ray O X /\\  X NOTIN a /\\  X,G same_side a /\\  angle A O X === angle A' O' B'",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4", () => c4()),
              @readable.Prev,
              @readable.Label("angles"),
              @readable.Label("Distinct"),
              @readable.Label("a_line"),
              @readable.Label("H1'"),
            ],
          ),
        ),
        @readable.consider(
          "X",
          "X NOTIN a /\\  X,G same_side a /\\  angle A O X === angle A' O' B'    ",
          "Xexists",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.have(
          "\n    ~Collinear A O X",
          "AOXncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("a_line"),
              @readable.Label("Xexists"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A' O' B' === angle A O X",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("AOBncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("Xexists"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "Y",
          "Y IN int_angle A O X  /\\   angle A' O' G' === angle A O Y    ",
          "YintAOX",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOXncol"),
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("OrderedCongruentAngles", () => orderedcongruentangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O Y",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("InteriorEZHelp", () => interiorezhelp())],
          ),
        ),
        @readable.have(
          "\n    angle A O Y  === angle A O G",
          "AOGeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("angles"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("YintAOX"),
              @readable.Label("H2"),
              @readable.Thm("C5Transitive", () => c5transitive()),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "x",
          "Line x /\\  O IN x /\\  X IN x    ",
          "x_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    Y NOTIN a /\\  Y,X same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Prev,
              @readable.Label("YintAOX"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    Y NOTIN a /\\  Y,G same_side a",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Prev,
              @readable.Label("Xexists"),
              @readable.Label("H1'"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O G = ray O Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Distinct"),
              @readable.Label("H1'"),
              @readable.Prev,
              @readable.Label("AOGeq"),
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN ray O Y DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN int_angle A O X",
          "GintAOX",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("YintAOX"),
              @readable.Prev,
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle G O X === angle G' O' B'",
          "GOXeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Label("Xexists"),
              @readable.Label("H2"),
              @readable.Thm("AngleSubtraction", () => anglesubtraction()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear G O X /\\  ~Collinear G O B /\\  ~Collinear G' O' B'",
          "GOXncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintAOX"),
              @readable.Label("H1"),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle G O X) /\\  Angle (angle G O B) /\\  Angle (angle G' O' B')",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("ANGLE", () => angle())],
          ),
        ),
        @readable.have(
          "\n    angle G O X === angle G O B",
          "G'O'Xeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angles"),
              @readable.Prev,
              @readable.Label("GOXeq"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Label("H2"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,X same_side g) /\\  ~(A,B same_side g)",
          "Ansim_aXB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("g_line"),
              @readable.Label("GintAOX"),
              @readable.Label("H1"),
              @readable.Thm("InteriorOpposite", () => interioropposite()),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN g /\\  B NOTIN g /\\  X NOTIN g",
          "notABXg",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("g_line"),
              @readable.Label("AOGncol"),
              @readable.Label("GOXncol"),
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    X,B same_side g",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("g_line"),
              @readable.Prev,
              @readable.Label("Ansim_aXB"),
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O X = ray O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("g_line"),
              @readable.Label("Distinct"),
              @readable.Label("notABXg"),
              @readable.Prev,
              @readable.Label("G'O'Xeq"),
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Xexists"),
            @readable.Thm("Angle_DEF", () => angle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angleaddition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleAddition")

///|
/// `AngleAddition`
pub fn angleaddition() -> @kernel.Thm {
  angleaddition_c.get()
}

///|
/// AngleOrderingUse
fn step_305() -> Unit raise {
  angleorderinguse_c.set(@readable.prove(
    "\n  forall A O B alpha.  Angle alpha  /\\   ~Collinear A O B  ==>  alpha <_ang angle A O B\n    ==>  ?G. G IN int_angle A O B /\\  alpha === angle A O G",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B alpha, H1, H3"),
        @readable.consider(
          "A' O' B' G'",
          "~Collinear A' O' B'  /\\   angle A O B = angle A' O' B'  /\\   G' IN int_angle A' O' B'  /\\   alpha === angle A' O' G'    ",
          "H3'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A O B) /\\  Angle (angle A' O' B') /\\  Angle (angle A' O' G')",
          "angles",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A' O' B' === angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H3'"),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN int_angle A O B  /\\   angle A' O' G' === angle A O G    ",
          "GintAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H3'"),
              @readable.Prev,
              @readable.Thm("OrderedCongruentAngles", () => orderedcongruentangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha === angle A O G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("angles"),
              @readable.Prev,
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H3'"),
              @readable.Label("GintAOB"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("GintAOB")]),
      ],
    ),
  ))
}

///|
let angleorderinguse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleOrderingUse")

///|
/// `AngleOrderingUse`
pub fn angleorderinguse() -> @kernel.Thm {
  angleorderinguse_c.get()
}

///|
/// AngleTrichotomy1
fn step_307() -> Unit raise {
  angletrichotomy1_c.set(@readable.prove(
    "\n  forall alpha beta. alpha <_ang beta  ==>  ~(alpha === beta)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta, H1"),
        @readable.assuming("alpha === beta", "Con", @readable.by(@readable.fol, [])),
        @readable.consider(
          "A O B G",
          "Angle alpha /\\  ~Collinear A O B /\\  beta = angle A O B /\\  G IN int_angle A O B /\\  alpha === angle A O G    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B) /\\  ~Collinear A O G",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  O IN a /\\  A IN a    ",
          "a_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "b",
          "Line b /\\  O IN b /\\  B IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN a",
          "notBa",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("H1'"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN a /\\  G NOTIN b /\\  G,B same_side a",
          "GintAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("b_line"),
              @readable.Label("H1'"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O G === alpha",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Label("Distinct"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O G === angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Label("Distinct"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Prev,
              @readable.Label("Con"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O B = ray O G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Distinct"),
              @readable.Label("notBa"),
              @readable.Label("GintAOB"),
              @readable.Prev,
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN b",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Label("b_line"),
              @readable.Thm("RayLine", () => rayline()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("GintAOB"),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angletrichotomy1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleTrichotomy1")

///|
/// `AngleTrichotomy1`
pub fn angletrichotomy1() -> @kernel.Thm {
  angletrichotomy1_c.get()
}

///|
/// AngleTrichotomy2
fn step_308() -> Unit raise {
  angletrichotomy2_c.set(@readable.prove(
    "\n  forall alpha beta gamma.  alpha <_ang beta  /\\   Angle gamma  /\\   beta === gamma  ==>  alpha <_ang gamma",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta gamma, H1 H2 H3"),
        @readable.consider(
          "A O B G",
          "Angle alpha /\\  ~Collinear A O B /\\  beta = angle A O B /\\  G IN int_angle A O B /\\  alpha === angle A O G    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.consider(
          "A' O' B'",
          "gamma = angle A' O' B' /\\  ~Collinear A' O' B'    ",
          "gammaA'O'B'",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("ANGLE", () => angle())],
          ),
        ),
        @readable.consider(
          "G'",
          "G' IN int_angle A' O' B' /\\  angle A O G === angle A' O' G'    ",
          "G'intA'O'B'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("gammaA'O'B'"),
              @readable.Label("H1'"),
              @readable.Label("H3"),
              @readable.Thm("OrderedCongruentAngles", () => orderedcongruentangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O G /\\  ~Collinear A' O' G'",
          "ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Prev,
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha === angle A' O' G'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Prev,
              @readable.Label("G'intA'O'B'"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1'"),
            @readable.Prev,
            @readable.Label("ncol"),
            @readable.Label("gammaA'O'B'"),
            @readable.Label("G'intA'O'B'"),
            @readable.Prev,
            @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angletrichotomy2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleTrichotomy2")

///|
/// `AngleTrichotomy2`
pub fn angletrichotomy2() -> @kernel.Thm {
  angletrichotomy2_c.get()
}

///|
/// AngleOrderTransitivity
fn step_309() -> Unit raise {
  angleordertransitivity_c.set(@readable.prove(
    "\n  forall alpha beta gamma. alpha <_ang beta  /\\   beta <_ang gamma  ==>  alpha <_ang gamma",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta gamma, H1 H2"),
        @readable.consider(
          "A O B G",
          "Angle beta /\\  ~Collinear A O B /\\  gamma = angle A O B /\\  G IN int_angle A O B /\\  beta === angle A O G    ",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O G",
          "AOGncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2'"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle alpha /\\  Angle (angle A O G)  /\\  Angle gamma",
          "angles",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha <_ang angle A O G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "F IN int_angle A O G /\\  alpha === angle A O F    ",
          "FintAOG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angles"),
              @readable.Label("AOGncol"),
              @readable.Prev,
              @readable.Thm("AngleOrderingUse", () => angleorderinguse()),
            ],
          ),
        ),
        @readable.have(
          "\n    F IN int_angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm("InteriorTransitivity", () => interiortransitivity()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("angles"),
            @readable.Label("H2'"),
            @readable.Prev,
            @readable.Label("FintAOG"),
            @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angleordertransitivity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleOrderTransitivity")

///|
/// `AngleOrderTransitivity`
pub fn angleordertransitivity() -> @kernel.Thm {
  angleordertransitivity_c.get()
}

///|
/// AngleTrichotomy
fn step_313() -> Unit raise {
  angletrichotomy_c.set(@readable.prove(
    "\n  forall alpha beta.  Angle alpha /\\  Angle beta\n   ==>  (alpha === beta  \\/  alpha <_ang beta  \\/  beta <_ang alpha)  /\\ \n       ~(alpha === beta  /\\   alpha <_ang beta)  /\\ \n       ~(alpha === beta  /\\   beta <_ang alpha)  /\\ \n       ~(alpha <_ang beta  /\\   beta <_ang alpha)",
    @readable.steps_then(
      [
        @readable.intro_tac("forall alpha beta, H1"),
        @readable.have(
          "\n    ~(alpha === beta  /\\   alpha <_ang beta)",
          "Not12",
          @readable.by(
            @readable.fol,
            [@readable.Thm("AngleTrichotomy1", () => angletrichotomy1())],
          ),
        ),
        @readable.have(
          "\n    ~(alpha === beta  /\\   beta <_ang alpha)",
          "Not13",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(alpha <_ang beta  /\\   beta <_ang alpha)",
          "Not23",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
              @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.consider(
          "P O A",
          "alpha = angle P O A /\\  ~Collinear P O A    ",
          "POA",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("ANGLE", () => angle())],
          ),
        ),
        @readable.have(
          "\n    ~(P = O) /\\  ~(O = A)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  O IN a /\\  A IN a    ",
          "a_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.have(
          "\n    P NOTIN a",
          "notPa",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Label("POA"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ?! r. Ray r /\\  ?Q. ~(O = Q) /\\  r = ray O Q /\\  Q NOTIN a /\\  Q,P same_side a /\\  angle A O Q === beta",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("H1"),
              @readable.Label("Distinct"),
              @readable.Label("a_line"),
              @readable.Thm("C4", () => c4()),
              @readable.Prev,
            ],
          ),
        ),
        @readable.consider(
          "Q",
          "~(O = Q) /\\  Q NOTIN a /\\  Q,P same_side a /\\  angle A O Q === beta    ",
          "Qexists",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.have(
          "\n    O NOTIN Open (Q, P)",
          "notQOP",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Qexists"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O P",
          "AOPncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("POA"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O Q",
          "AOQncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("Qexists"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A O P) /\\  Angle (angle A O Q)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOPncol"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha === angle A O P  /\\   beta === angle A O Q  /\\   angle A O P === alpha",
          "flip",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("POA"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
              @readable.Label("Qexists"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "QOPcol | QOPcolncol    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["Collinear Q O P", "~Collinear Q O P"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      Collinear O P Q",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      Q IN ray O P DIFF {O}",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Label("notQOP"),
                      @readable.Thm("IN_Ray", () => in_ray()),
                      @readable.Label("Qexists"),
                      @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                      @readable.Thm("IN_SING", () => @sets.in_sing()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ray O Q = ray O P",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Thm("RayWellDefined", () => raywelldefined()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle P O A = angle A O Q",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("Angle_DEF", () => angle_def()),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("POA"),
                    @readable.Label("Qexists"),
                    @readable.Label("Not12"),
                    @readable.Label("Not13"),
                    @readable.Label("Not23"),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      P IN int_angle Q O A \\/ Q IN int_angle P O A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Label("a_line"),
                      @readable.Label("Qexists"),
                      @readable.Label("notPa"),
                      @readable.Prev,
                      @readable.Thm("AngleOrdering", () => angleordering()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      P IN int_angle A O Q \\/ Q IN int_angle A O P",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      alpha <_ang angle A O Q  \\/  beta <_ang angle A O P",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Label("AOQncol"),
                      @readable.Label("AOPncol"),
                      @readable.Prev,
                      @readable.Label("flip"),
                      @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      alpha <_ang beta  \\/  beta <_ang alpha",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Prev,
                      @readable.Label("Qexists"),
                      @readable.Label("flip"),
                      @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Not12"),
                    @readable.Label("Not13"),
                    @readable.Label("Not23"),
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
let angletrichotomy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleTrichotomy")

///|
/// `AngleTrichotomy`
pub fn angletrichotomy() -> @kernel.Thm {
  angletrichotomy_c.get()
}

///|
/// SupplementExists
fn step_316() -> Unit raise {
  supplementexists_c.set(@readable.prove(
    "\n  forall alpha. Angle alpha  ==>  ?alpha'. alpha suppl alpha'",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha, H1"),
        @readable.consider(
          "A O B",
          "alpha = angle A O B /\\  ~Collinear A O B /\\  ~(A = O)    ",
          "def_alpha",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "A'",
          "O IN Open (A, A')    ",
          "AOA'",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    angle A O B  suppl  angle A' O B",
          "AOBsup",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Prev,
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("def_alpha")]),
      ],
    ),
  ))
}

///|
let supplementexists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementExists")

///|
/// `SupplementExists`
pub fn supplementexists() -> @kernel.Thm {
  supplementexists_c.get()
}

///|
/// SupplementImpliesAngle
fn step_318() -> Unit raise {
  supplementimpliesangle_c.set(@readable.prove(
    "\n  forall alpha beta.  alpha suppl beta  ==>  Angle alpha /\\  Angle beta",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta, H1"),
        @readable.consider(
          "A O B A'",
          "~Collinear A O B  /\\   O IN Open (A, A')  /\\   alpha = angle A O B  /\\   beta = angle B O A'    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(O = A') /\\  Collinear A O A'",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1'"),
            @readable.Prev,
            @readable.Thm("ANGLE", () => angle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let supplementimpliesangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementImpliesAngle")

///|
/// `SupplementImpliesAngle`
pub fn supplementimpliesangle() -> @kernel.Thm {
  supplementimpliesangle_c.get()
}

///|
/// RightImpliesAngle
fn step_319() -> Unit raise {
  rightimpliesangle_c.set(@readable.prove(
    "\n  forall alpha. Right alpha  ==>  Angle alpha",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("RightAngle_DEF", () => rightangle_def()),
        @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
      ],
    ),
  ))
}

///|
let rightimpliesangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RightImpliesAngle")

///|
/// `RightImpliesAngle`
pub fn rightimpliesangle() -> @kernel.Thm {
  rightimpliesangle_c.get()
}

///|
/// SupplementSymmetry
fn step_322() -> Unit raise {
  supplementsymmetry_c.set(@readable.prove(
    "\n  forall alpha beta. alpha suppl beta  ==>  beta suppl alpha",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta, H1"),
        @readable.consider(
          "A O B A'",
          "~Collinear A O B  /\\   O IN Open (A, A')  /\\   alpha = angle A O B  /\\   beta = angle B O A'    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n  ~(O = A') /\\  Collinear A O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n  ~Collinear A' O B",
          "A'OBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n  O IN Open (A', A)  /\\   beta = angle A' O B  /\\   alpha = angle B O A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("A'OBncol"),
            @readable.Prev,
            @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let supplementsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementSymmetry")

///|
/// `SupplementSymmetry`
pub fn supplementsymmetry() -> @kernel.Thm {
  supplementsymmetry_c.get()
}

///|
/// SupplementsCongAnglesCong
fn step_323() -> Unit raise {
  supplementsconganglescong_c.set(@readable.prove(
    "\n  forall alpha beta alpha' beta'.  alpha suppl alpha'  /\\   beta suppl beta'  ==>  alpha === beta\n    ==>  alpha' === beta'",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta alpha' beta', H1, H2"),
        @readable.consider(
          "A O B A'",
          "~Collinear A O B  /\\   O IN Open (A, A')  /\\   alpha = angle A O B  /\\   alpha' = angle B O A'    ",
          "def_alpha",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B) /\\  ~(A = A') /\\  ~(O = A') /\\  Collinear A O A'",
          "Distinctalpha",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B A A' /\\  ~Collinear O A' B",
          "BAA'ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    Segment (seg O A) /\\  Segment (seg O B) /\\  Segment (seg O A')",
          "Osegments",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinctalpha"),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "C P D C'",
          "~Collinear C P D  /\\   P IN Open (C, C')  /\\   beta = angle C P D  /\\   beta' = angle D P C'    ",
          "def_beta",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(C = P) /\\  ~(P = D) /\\  ~(P = C')",
          "Distinctbeta",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_beta"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.consider(
          "X",
          "X IN ray P C DIFF {P}  /\\   seg P X === seg O A    ",
          "defX",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Osegments"),
              @readable.Label("Distinctbeta"),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.consider(
          "Y",
          "Y IN ray P D DIFF {P}  /\\   seg P Y === seg O B  /\\   ~(Y = P)    ",
          "defY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Osegments"),
              @readable.Label("Distinctbeta"),
              @readable.Thm("C1", () => c1()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.consider(
          "X'",
          "X' IN ray P C' DIFF {P}  /\\   seg P X' === seg O A'    ",
          "defX'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Osegments"),
              @readable.Label("Distinctbeta"),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    P IN Open (X', C)  /\\   P IN Open (X, X')",
          "XPX'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_beta"),
              @readable.Prev,
              @readable.Thm(
                "OppositeRaysIntersect1pointHelp",
                () => oppositeraysintersect1pointhelp(),
              ),
              @readable.Label("defX"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(X = P) /\\  ~(X' = P) /\\  Collinear X P X' /\\  ~(X = X') /\\  ray A' O = ray A' A /\\  ray X' P = ray X' X",
          "XPX'line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("defX"),
              @readable.Label("defX'"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("def_alpha"),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n     Collinear P D Y /\\  Collinear P C X",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("defY"),
              @readable.Label("defX"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C P Y /\\  ~Collinear X P Y",
          "XPYncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_beta"),
              @readable.Prev,
              @readable.Label("defY"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("XPX'line"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear Y X X' /\\  ~Collinear P X' Y",
          "YXX'ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("XPX'"),
              @readable.Label("XPX'line"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ray P X = ray P C  /\\   ray P Y = ray P D  /\\   ray P X' = ray P C'",
          "equalPrays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinctbeta"),
              @readable.Label("defX"),
              @readable.Label("defY"),
              @readable.Label("defX'"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    beta = angle X P Y  /\\   beta' = angle Y P X'  /\\   angle A O B === angle X P Y",
          "AOBeqXPY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_beta"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
              @readable.Label("H2"),
              @readable.Label("def_alpha"),
            ],
          ),
        ),
        @readable.have(
          "\n   seg O A === seg P X  /\\   seg O B === seg P Y  /\\   seg A' O === seg X' P",
          "OAeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Osegments"),
              @readable.Label("XPX'line"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("defX"),
              @readable.Label("defY"),
              @readable.Label("defX'"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A A' === seg X X'",
          "AA'eq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Label("XPX'line"),
              @readable.Label("XPX'"),
              @readable.Prev,
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Thm("C3", () => c3()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,O,B cong X,P,Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Label("XPYncol"),
              @readable.Label("OAeq"),
              @readable.Label("AOBeqXPY"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A B === seg X Y  /\\   angle B A O === angle Y X P",
          "AOBcong",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A O = ray A A'  /\\   ray X P = ray X  X'  /\\   angle B A A' === angle Y X X'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Label("XPX'"),
              @readable.Thm("IntervalRay", () => intervalray()),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    B,A,A' cong Y,X,X'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BAA'ncol"),
              @readable.Label("YXX'ncol"),
              @readable.Label("AOBcong"),
              @readable.Prev,
              @readable.Label("AA'eq"),
              @readable.Prev,
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A' B === seg X' Y  /\\   angle A A' B === angle X X' Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    O,A',B cong P,X',Y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BAA'ncol"),
              @readable.Label("YXX'ncol"),
              @readable.Label("OAeq"),
              @readable.Prev,
              @readable.Label("XPX'line"),
              @readable.Thm("Angle_DEF", () => angle_def()),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B O A' === angle Y P X'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("equalPrays"),
            @readable.Label("def_beta"),
            @readable.Thm("Angle_DEF", () => angle_def()),
            @readable.Label("def_alpha"),
          ],
        ),
      ],
    ),
  ))
}

///|
let supplementsconganglescong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementsCongAnglesCong")

///|
/// `SupplementsCongAnglesCong`
pub fn supplementsconganglescong() -> @kernel.Thm {
  supplementsconganglescong_c.get()
}

///|
/// SupplementUnique
fn step_324() -> Unit raise {
  supplementunique_c.set(@readable.prove(
    "\n  forall alpha beta beta'.  alpha suppl beta  /\\    alpha suppl beta'  ==>  beta === beta'",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
        @readable.Thm("ANGLE", () => angle()),
        @readable.Thm("C5Reflexive", () => c5reflexive()),
        @readable.Thm("SupplementsCongAnglesCong", () => supplementsconganglescong()),
      ],
    ),
  ))
}

///|
let supplementunique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SupplementUnique")

///|
/// `SupplementUnique`
pub fn supplementunique() -> @kernel.Thm {
  supplementunique_c.get()
}

///|
/// CongRightImpliesRight
fn step_326() -> Unit raise {
  congrightimpliesright_c.set(@readable.prove(
    "\n  forall alpha beta. Angle alpha  /\\   Right beta  ==>  alpha === beta  ==>  Right alpha",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta, H1, H2"),
        @readable.consider(
          "alpha' beta'",
          "alpha suppl alpha'  /\\   beta suppl beta'  /\\   beta === beta'    ",
          "suppl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SupplementExists", () => supplementexists()),
              @readable.Label("H1"),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha' === beta'",
          "alpha'eqbeta'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("suppl"),
              @readable.Label("H2"),
              @readable.Thm(
                "SupplementsCongAnglesCong",
                () => supplementsconganglescong(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle beta /\\  Angle alpha' /\\  Angle beta'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("suppl"),
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha === alpha'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Label("suppl"),
              @readable.Label("alpha'eqbeta'"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("suppl"),
            @readable.Prev,
            @readable.Thm("RightAngle_DEF", () => rightangle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let congrightimpliesright_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CongRightImpliesRight")

///|
/// `CongRightImpliesRight`
pub fn congrightimpliesright() -> @kernel.Thm {
  congrightimpliesright_c.get()
}

///|
/// RightAnglesCongruentHelp
fn step_328() -> Unit raise {
  rightanglescongruenthelp_c.set(@readable.prove(
    "\n  forall A O B A' P a.  ~Collinear A O B  /\\   O IN Open (A, A')  ==>\n    Right (angle A O B)  /\\   Right (angle A O P)\n    ==>  P NOTIN int_angle A O B",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A' P a, H1, H2"),
        @readable.assuming(
          "~(P NOTIN int_angle A O B)",
          "Con",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    P IN int_angle A O B",
          "PintAOB",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.have(
          "\n    B IN int_angle P O A'  /\\   B IN int_angle A' O P",
          "BintA'OP",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm(
                "InteriorReflectionInterior",
                () => interiorreflectioninterior(),
              ),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O P /\\  ~Collinear P O A'",
          "AOPncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("PintAOB"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O B suppl angle B O A'  /\\   angle A O P suppl angle P O A'",
          "AOBsup",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.consider(
          "alpha' beta'",
          "angle A O B suppl alpha'  /\\   angle A O B === alpha'  /\\   angle A O P suppl beta'  /\\   angle A O P === beta'    ",
          "supplalpha'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    alpha' === angle B O A'  /\\   beta' === angle P O A'",
          "alpha'eqA'OB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("AOBsup"),
              @readable.Thm("SupplementUnique", () => supplementunique()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A O B) /\\  Angle alpha' /\\  Angle (angle B O A') /\\  Angle (angle A O P) /\\  Angle beta' /\\  Angle (angle P O A')",
          "angles",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBsup"),
              @readable.Label("supplalpha'"),
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O B === angle B O A'  /\\   angle A O P === angle P O A'",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("supplalpha'"),
              @readable.Label("alpha'eqA'OB"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O P === angle A O P  /\\   angle B O A' === angle B O A'",
          "refl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angles"),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O P <_ang angle A O B  /\\   angle B O A' <_ang angle P O A'",
          "BOA'lessPOA'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angles"),
              @readable.Label("H1"),
              @readable.Label("PintAOB"),
              @readable.Prev,
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
              @readable.Label("AOPncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("BintA'OP"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O P <_ang angle B O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("angles"),
              @readable.Label("H2'"),
              @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O P <_ang angle P O A'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BOA'lessPOA'"),
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H2'"),
            @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
          ],
        ),
      ],
    ),
  ))
}

///|
let rightanglescongruenthelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RightAnglesCongruentHelp")

///|
/// `RightAnglesCongruentHelp`
pub fn rightanglescongruenthelp() -> @kernel.Thm {
  rightanglescongruenthelp_c.get()
}

///|
/// RightAnglesCongruent
fn step_330() -> Unit raise {
  rightanglescongruent_c.set(@readable.prove(
    "\n  forall alpha beta. Right alpha /\\  Right beta  ==>  alpha === beta",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta, H1"),
        @readable.consider(
          "alpha'",
          "alpha suppl alpha'  /\\   alpha === alpha'    ",
          "alpharight",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.consider(
          "A O B A'",
          "~Collinear A O B  /\\   O IN Open (A, A')  /\\   alpha = angle A O B  /\\   alpha' = angle B O A'    ",
          "def_alpha",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = B)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  O IN a /\\  A IN a    ",
          "a_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN a",
          "notBa",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("def_alpha"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle beta",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("RightImpliesAngle", () => rightimpliesangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ?! r. Ray r /\\  ?P. ~(O = P) /\\  r = ray O P /\\  P NOTIN a /\\  P,B same_side a /\\  angle A O P === beta",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4", () => c4()),
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Label("a_line"),
              @readable.Label("notBa"),
            ],
          ),
        ),
        @readable.consider(
          "P",
          "~(O = P) /\\  P NOTIN a /\\  P,B same_side a /\\  angle A O P === beta    ",
          "defP",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.have(
          "\n    O NOTIN Open (P, B)",
          "notPOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O P",
          "AOPncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Distinct"),
              @readable.Label("defP"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    Right (angle A O P)",
          "AOPright",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H1"),
              @readable.Label("defP"),
              @readable.Thm("CongRightImpliesRight", () => congrightimpliesright()),
            ],
          ),
        ),
        @readable.have(
          "\n    P NOTIN int_angle A O B  /\\   B NOTIN int_angle A O P",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("def_alpha"),
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("AOPncol"),
              @readable.Label("AOPright"),
              @readable.Thm(
                "RightAnglesCongruentHelp",
                () => rightanglescongruenthelp(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear P O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("a_line"),
              @readable.Label("defP"),
              @readable.Label("notBa"),
              @readable.Prev,
              @readable.Thm("AngleOrdering", () => angleordering()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    P IN ray O B DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("notPOB"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("defP"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O P = ray O B  /\\   angle A O P = angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("RayWellDefined", () => raywelldefined()),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Label("defP"), @readable.Label("def_alpha")],
        ),
      ],
    ),
  ))
}

///|
let rightanglescongruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RightAnglesCongruent")

///|
/// `RightAnglesCongruent`
pub fn rightanglescongruent() -> @kernel.Thm {
  rightanglescongruent_c.get()
}

///|
/// OppositeRightAnglesLinear
fn step_334() -> Unit raise {
  oppositerightangleslinear_c.set(@readable.prove(
    "\n  forall A B O H h.  ~Collinear A O H /\\  ~Collinear H O B  ==>\n    Right (angle A O H) /\\  Right (angle H O B)  ==>\n    Line h /\\  O IN h /\\  H IN h  /\\   ~(A,B same_side h)\n    ==>  O IN Open (A, B)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B O H h, H0, H1, H2"),
        @readable.have(
          "\n    ~(A = O) /\\  ~(O = H) /\\  ~(O = B)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H0"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN h /\\  B NOTIN h",
          "notABh",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H0"),
              @readable.Label("H2"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "O IN Open (A, E) /\\  ~(E = O)    ",
          "AOE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("B2'", () => b2_p()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O H  suppl  angle H O E",
          "AOHsupplHOE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H0"),
              @readable.Prev,
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    E NOTIN h",
          "notEh",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("AOE"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Label("notABh"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,E same_side  h)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("AOE"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    B,E same_side  h",
          "Bsim_hE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("notABh"),
              @readable.Label("notEh"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.consider(
          "alpha'",
          "angle A O H  suppl  alpha'  /\\   angle A O H === alpha'    ",
          "AOHsupplalpha'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle H O B) /\\  Angle (angle A O H) /\\  Angle alpha' /\\  Angle (angle H O E)",
          "angalpha'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("RightImpliesAngle", () => rightimpliesangle()),
              @readable.Prev,
              @readable.Label("AOHsupplHOE"),
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle H O B === angle A O H  /\\   alpha' === angle H O E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("RightAnglesCongruent", () => rightanglescongruent()),
              @readable.Label("AOHsupplalpha'"),
              @readable.Label("AOHsupplHOE"),
              @readable.Thm("SupplementUnique", () => supplementunique()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle H O B === angle H O E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angalpha'"),
              @readable.Prev,
              @readable.Label("AOHsupplalpha'"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O B = ray O E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Label("Distinct"),
              @readable.Label("notABh"),
              @readable.Label("notEh"),
              @readable.Label("Bsim_hE"),
              @readable.Prev,
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN ray O E DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Prev,
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("AOE"),
            @readable.Prev,
            @readable.Thm(
              "OppositeRaysIntersect1pointHelp",
              () => oppositeraysintersect1pointhelp(),
            ),
            @readable.Thm("B1'", () => b1_p()),
          ],
        ),
      ],
    ),
  ))
}

///|
let oppositerightangleslinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeRightAnglesLinear")

///|
/// `OppositeRightAnglesLinear`
pub fn oppositerightangleslinear() -> @kernel.Thm {
  oppositerightangleslinear_c.get()
}

///|
/// RightImpliesSupplRight
fn step_336() -> Unit raise {
  rightimpliessupplright_c.set(@readable.prove(
    "\n  forall A O B A'.  ~Collinear A O B  /\\   O IN Open (A, A')  /\\   Right (angle A O B)\n    ==>  Right (angle B O A')",
    @readable.steps(
      [
        @readable.intro_tac("forall A O B A', H1 H2 H3"),
        @readable.have(
          "\n    angle A O B suppl angle B O A'  /\\   Angle (angle A O B)  /\\   Angle (angle B O A')",
          "AOBsuppl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
            ],
          ),
        ),
        @readable.consider(
          "beta",
          "angle A O B suppl beta /\\  angle A O B === beta    ",
          "betasuppl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle beta  /\\   beta === angle A O B",
          "angbeta",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B O A' === beta",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBsuppl"),
              @readable.Label("betasuppl"),
              @readable.Thm("SupplementUnique", () => supplementunique()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B O A' === angle A O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AOBsuppl"),
              @readable.Label("angbeta"),
              @readable.Prev,
              @readable.Label("betasuppl"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("AOBsuppl"),
            @readable.Label("H3"),
            @readable.Prev,
            @readable.Thm("CongRightImpliesRight", () => congrightimpliesright()),
          ],
        ),
      ],
    ),
  ))
}

///|
let rightimpliessupplright_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RightImpliesSupplRight")

///|
/// `RightImpliesSupplRight`
pub fn rightimpliessupplright() -> @kernel.Thm {
  rightimpliessupplright_c.get()
}

///|
/// IsoscelesCongBaseAngles
fn step_337() -> Unit raise {
  isoscelescongbaseangles_c.set(@readable.prove(
    "\n  forall A B C.  ~Collinear A B C  /\\   seg B A === seg B C  ==>   angle C A B  === angle A C B",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1 H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(B = C) /\\  ~Collinear C B A",
          "CBAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg B C === seg B A  /\\   angle A B C === angle C B A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("H2"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Label("H1"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("CBAncol"),
            @readable.Label("H2"),
            @readable.Prev,
            @readable.Thm("SAS", () => sas()),
            @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let isoscelescongbaseangles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IsoscelesCongBaseAngles")

///|
/// `IsoscelesCongBaseAngles`
pub fn isoscelescongbaseangles() -> @kernel.Thm {
  isoscelescongbaseangles_c.get()
}

///|
/// C4withC1
fn step_338() -> Unit raise {
  c4withc1_c.set(@readable.prove(
    "\n  forall alpha l O A Y P Q.  Angle alpha /\\  ~(O = A) /\\  ~(P = Q)  ==>\n    Line l /\\  O IN l /\\  A IN l /\\  Y NOTIN l  ==>\n    ?N. ~(O = N) /\\  N NOTIN l /\\  N,Y same_side l /\\  seg O N === seg P Q /\\  angle A O N === alpha",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha l O A Y P Q, H1, l_line"),
        @readable.have(
          "\n    ?! r. Ray r /\\  ?B. ~(O = B) /\\  r = ray O B /\\  B NOTIN l /\\  B,Y same_side l /\\  angle A O B === alpha",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4", () => c4()),
              @readable.Label("H1"),
              @readable.Label("l_line"),
            ],
          ),
        ),
        @readable.consider(
          "B",
          "~(O = B) /\\  B NOTIN l /\\  B,Y same_side l /\\  angle A O B === alpha    ",
          "Bexists",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.consider(
          "N",
          "N IN ray O B DIFF {O}  /\\   seg O N === seg P Q    ",
          "Nexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    N NOTIN l /\\  N,B same_side l",
          "notNl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Bexists"),
              @readable.Label("Nexists"),
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    N,Y same_side l",
          "Nsim_lY",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Prev,
              @readable.Label("Bexists"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O N = ray O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Bexists"),
              @readable.Label("Nexists"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A O N === alpha",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Bexists"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Nexists"),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            @readable.Thm("IN_SING", () => @sets.in_sing()),
            @readable.Label("notNl"),
            @readable.Label("Nsim_lY"),
            @readable.Label("Nexists"),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let c4withc1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C4withC1")

///|
/// `C4withC1`
pub fn c4withc1() -> @kernel.Thm {
  c4withc1_c.get()
}

///|
/// C4OppositeSide
fn step_339() -> Unit raise {
  c4oppositeside_c.set(@readable.prove(
    "\n  forall alpha l O A Z P Q.  Angle alpha /\\  ~(O = A) /\\  ~(P = Q)  ==>\n    Line l /\\  O IN l /\\  A IN l /\\  Z NOTIN l\n    ==>  ?N. ~(O = N) /\\  N NOTIN l /\\  ~(Z,N same_side l) /\\ \n    seg O N === seg P Q /\\  angle A O N === alpha",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha l O A Z P Q, H1, l_line"),
        @readable.have(
          "\n    ~(Z = O)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Label("l_line"), @readable.Thm("NOTIN", () => notin())],
          ),
        ),
        @readable.consider(
          "Y",
          "O IN Open (Z, Y)    ",
          "ZOY",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    ~(O = Y) /\\  Collinear O Z Y",
          "notOY",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    Y NOTIN l",
          "notYl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notOY"),
              @readable.Label("l_line"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "N",
          "~(O = N) /\\  N NOTIN l  /\\   N,Y same_side l  /\\  seg O N === seg P Q  /\\   angle A O N === alpha    ",
          "Nexists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4withC1", () => c4withc1()),
              @readable.Label("H1"),
              @readable.Label("l_line"),
              @readable.Prev,
            ],
          ),
        ),
        @readable.have(
          "\n    ~(Z,Y same_side l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("ZOY"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(Z,N same_side l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Nexists"),
              @readable.Label("notYl"),
              @readable.Prev,
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Nexists")]),
      ],
    ),
  ))
}

///|
let c4oppositeside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C4OppositeSide")

///|
/// `C4OppositeSide`
pub fn c4oppositeside() -> @kernel.Thm {
  c4oppositeside_c.get()
}

///|
/// SSS
fn step_341() -> Unit raise {
  sss_c.set(@readable.prove(
    "\n  forall A B C A' B' C'.  ~Collinear A B C /\\  ~Collinear A' B' C'  ==>\n    seg A B === seg A' B'  /\\   seg A C === seg A' C'  /\\   seg B C === seg B' C'\n    ==>  A,B,C cong A',B',C'",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  ~(A' = B') /\\  ~(B' = C')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "h",
          "Line h /\\  A IN h /\\  C IN h    ",
          "h_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN h",
          "notBh",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("h_line"),
              @readable.Label("H1"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    Segment (seg A B) /\\  Segment (seg C B) /\\  Segment (seg A' B') /\\  Segment (seg C' B')",
          "segments",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle C' A' B')",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.consider(
          "N",
          "~(A = N) /\\  N NOTIN h /\\  ~(B,N same_side h) /\\  seg A N === seg A' B'  /\\   angle C A N === angle C' A' B'    ",
          "Nexists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4OppositeSide", () => c4oppositeside()),
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Label("h_line"),
              @readable.Label("notBh"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(C = N)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("h_line"),
              @readable.Label("Nexists"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Segment (seg A N) /\\  Segment (seg C N)",
          "segN",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Nexists"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A N C",
          "ANCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("h_line"),
              @readable.Label("Nexists"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle A B C) /\\  Angle (angle A' B' C') /\\  Angle (angle A N C)",
          "angles",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A B === seg A N",
          "ABeqAN",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("segments"),
              @readable.Label("segN"),
              @readable.Label("Nexists"),
              @readable.Label("H2"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,A,N cong C',A',B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ANCncol"),
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Label("Nexists"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A N C === angle A' B' C'  /\\   seg C N === seg C' B'",
          "ANCeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg C B === seg C N",
          "CBeqCN",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("segments"),
              @readable.Label("segN"),
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN h /\\  G IN Open (B, N)    ",
          "BGN",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Nexists"),
              @readable.Label("h_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B = N)",
          "notBN",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    ray B G = ray B N  /\\   ray N G = ray N B",
          "Grays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BGN"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.consider(
          "v",
          "Line v /\\  B IN v /\\  N IN v    ",
          "v_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("notBN"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    G IN v /\\  ~(h = v)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("v_line"),
              @readable.Label("BGN"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Label("notBh"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    h INTER v = {G}",
          "hvG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("h_line"),
              @readable.Label("v_line"),
              @readable.Prev,
              @readable.Label("BGN"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G = A)  ==>  angle A B G === angle A N G",
          "ABGeqANG",
          @readable.steps(
            [
              @readable.intro_tac("notGA"),
              @readable.have(
                "\n      A NOTIN v",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("hvG"),
                    @readable.Label("h_line"),
                    @readable.Prev,
                    @readable.Thm(
                      "EquivIntersectionHelp",
                      () => equivintersectionhelp(),
                    ),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear B A N",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("v_line"),
                    @readable.Label("notBN"),
                    @readable.Thm("I1", () => i1()),
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                    @readable.Prev,
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle N B A === angle B N A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("ABeqAN"),
                    @readable.Thm(
                      "IsoscelesCongBaseAngles",
                      () => isoscelescongbaseangles(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G B A === angle G N A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("Grays"),
                    @readable.Thm("Angle_DEF", () => angle_def()),
                    @readable.Label("notGA"),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [@readable.Prev, @readable.Thm("AngleSymmetry", () => anglesymmetry())],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G = C)  ==>  angle G B C === angle G N C",
          "GBCeqGNC",
          @readable.steps(
            [
              @readable.intro_tac("notGC"),
              @readable.have(
                "\n      C NOTIN v",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("hvG"),
                    @readable.Label("h_line"),
                    @readable.Prev,
                    @readable.Thm(
                      "EquivIntersectionHelp",
                      () => equivintersectionhelp(),
                    ),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear B C N",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("v_line"),
                    @readable.Label("notBN"),
                    @readable.Thm("I1", () => i1()),
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                    @readable.Prev,
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle N B C === angle B N C",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("CBeqCN"),
                    @readable.Thm(
                      "IsoscelesCongBaseAngles",
                      () => isoscelescongbaseangles(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("Grays"),
                  @readable.Thm("Angle_DEF", () => angle_def()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B C === angle A N C",
          "",
          @readable.steps_then(
            [
              @readable.assuming(
                "~(G = A) /\\  ~(G = C)",
                "AGCdistinct",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Label("GBCeqGNC"),
                    @readable.Label("ABGeqANG"),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle A B G === angle A N G  /\\   angle G B C === angle G N C",
                "Gequivs",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("ABGeqANG"),
                    @readable.Label("GBCeqGNC"),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear G B C /\\  ~Collinear G N C /\\  ~Collinear G B A /\\  ~Collinear G N A",
                "Gncols",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("AGCdistinct"),
                    @readable.Label("h_line"),
                    @readable.Label("BGN"),
                    @readable.Label("notBh"),
                    @readable.Label("Nexists"),
                    @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Collinear A G C",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("h_line"),
                    @readable.Label("BGN"),
                    @readable.Thm("Collinear_DEF", () => collinear_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      G IN Open (A, C) \\/ C IN Open (G, A) \\/ A IN Open (C, G)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Label("AGCdistinct"),
                    @readable.Prev,
                    @readable.Thm("B3'", () => b3_p()),
                  ],
                ),
              ),
            ],
            @readable.case_split(
              "AGC | GAC | CAG    ",
              @readable.by(@readable.fol, [@readable.Prev]),
              @list.List(["G IN Open (A, C)", "C IN Open (G, A)", "A IN Open (C, G)"]),
              @list.List(
                [
                  @readable.steps(
                    [
                      @readable.have(
                        "\n        G IN int_angle A B C  /\\   G IN int_angle A N C",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Label("H1"),
                            @readable.Label("ANCncol"),
                            @readable.Prev,
                            @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
                          ],
                        ),
                      ),
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Prev,
                          @readable.Label("Gequivs"),
                          @readable.Thm("AngleAddition", () => angleaddition()),
                        ],
                      ),
                    ],
                  ),
                  @readable.steps(
                    [
                      @readable.have(
                        "\n        C IN int_angle G B A  /\\   C IN int_angle G N A",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Label("Gncols"),
                            @readable.Prev,
                            @readable.Thm("B1'", () => b1_p()),
                            @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
                          ],
                        ),
                      ),
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Prev,
                          @readable.Label("Gequivs"),
                          @readable.Thm("AngleSubtraction", () => anglesubtraction()),
                          @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                        ],
                      ),
                    ],
                  ),
                  @readable.steps(
                    [
                      @readable.have(
                        "\n        A IN int_angle G B C  /\\   A IN int_angle G N C",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Label("Gncols"),
                            @readable.Prev,
                            @readable.Thm("B1'", () => b1_p()),
                            @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
                          ],
                        ),
                      ),
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Prev,
                          @readable.Label("Gequivs"),
                          @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                          @readable.Thm("AngleSubtraction", () => anglesubtraction()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        @readable.have(
          "\n    angle A B C === angle A' B' C'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angles"),
              @readable.Prev,
              @readable.Label("ANCeq"),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            @readable.Prev,
            @readable.Thm("SAS", () => sas()),
          ],
        ),
      ],
    ),
  ))
}

///|
let sss_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SSS")

///|
/// `SSS`
pub fn sss() -> @kernel.Thm {
  sss_c.get()
}

///|
/// AngleBisector
fn step_345() -> Unit raise {
  anglebisector_c.set(@readable.prove(
    "\n  forall A B C. ~Collinear B A C  ==>  ?M. M IN int_angle B A C  /\\   angle B A M === angle M A C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "D",
          "B IN Open (A, D)    ",
          "ABD",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    ~(A = D) /\\  Collinear A B D /\\  Segment (seg A D)",
          "ABD'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN ray A C DIFF {A}  /\\   seg A E === seg A D  /\\   ~(A = E)    ",
          "ErAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Thm("C1", () => c1()),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear A C E  /\\   D IN ray A B DIFF {A}",
          "notAE",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("ABD"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A D = ray A B  /\\   ray A E =  ray A C",
          "equalrays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("notAE"),
              @readable.Label("ErAC"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D A E /\\  ~Collinear E A D /\\  ~Collinear A E D",
          "EADncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("ABD'"),
              @readable.Label("notAE"),
              @readable.Label("ErAC"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle D E A === angle E D A",
          "DEAeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EADncol"),
              @readable.Label("ErAC"),
              @readable.Thm("IsoscelesCongBaseAngles", () => isoscelescongbaseangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E D A /\\  Angle (angle E D A) /\\  ~Collinear A D E /\\  ~Collinear D E A",
          "angEDA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EADncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(D = E)",
          "notDE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EADncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "h",
          "Line h /\\  D IN h /\\  E IN h    ",
          "h_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.have(
          "\n    A NOTIN h",
          "notAh",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("EADncol"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.consider(
          "M",
          "~(D = M)  /\\   M NOTIN h  /\\   ~(A,M same_side h)  /\\   seg D M === seg D A  /\\   angle E D M === angle E D A    ",
          "Mexists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4OppositeSide", () => c4oppositeside()),
              @readable.Label("angEDA"),
              @readable.Label("notDE"),
              @readable.Label("ABD'"),
              @readable.Label("h_line"),
              @readable.Prev,
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = M)",
          "notAM",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("h_line"),
              @readable.Prev,
              @readable.Thm("SameSideReflexive", () => samesidereflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E D M /\\  ~Collinear D E M /\\  ~Collinear M E D",
          "EDMncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notDE"),
              @readable.Label("h_line"),
              @readable.Label("Mexists"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg D E === seg D E  /\\   seg M A === seg M A",
          "MArefl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notDE"),
              @readable.Label("notAM"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    E,D,M cong E,D,A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EDMncol"),
              @readable.Label("angEDA"),
              @readable.Prev,
              @readable.Label("Mexists"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg M E === seg A E /\\  angle M E D === angle A E D /\\  angle D E M === angle D E A",
          "MEDcong",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle E D A === angle D E A  /\\   angle E D A === angle E D M  /\\   angle D E A === angle D E M",
          "EDAeqEDM",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EDMncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("angEDA"),
              @readable.Label("Mexists"),
              @readable.Label("MEDcong"),
              @readable.Label("DEAeq"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN h /\\  G IN Open (A, M)    ",
          "AGM",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Mexists"),
              @readable.Label("h_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN ray A G DIFF {A}",
          "MrAG",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("IntervalRayEZ", () => intervalrayez())],
          ),
        ),
        @readable.consider(
          "v",
          "Line v /\\  A IN v /\\  M IN v /\\  G IN v    ",
          "v_line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notAM"),
              @readable.Thm("I1", () => i1()),
              @readable.Label("AGM"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(v = h)  /\\   v INTER h = {G}",
          "vhG",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("notAh"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("h_line"),
              @readable.Label("AGM"),
              @readable.Thm("I1Uniqueness", () => i1uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    D NOTIN v",
          "notDv",
          @readable.steps(
            [
              @readable.assuming("~(D NOTIN v)", "Con", @readable.by(@readable.fol, [])),
              @readable.have(
                "\n      D IN v  /\\   D = G",
                "DG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("h_line"),
                    @readable.Prev,
                    @readable.Thm("NOTIN", () => notin()),
                    @readable.Label("vhG"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.have(
                "\n      D IN Open (A, M)",
                "",
                @readable.by(
                  @readable.fol,
                  [@readable.Label("DG"), @readable.Label("AGM")],
                ),
              ),
              @readable.have(
                "\n      angle E D A suppl angle E D M",
                "EDAsuppl",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("angEDA"),
                    @readable.Prev,
                    @readable.Thm(
                      "SupplementaryAngles_DEF",
                      () => supplementaryangles_def(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle E D A)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("EDAsuppl"),
                    @readable.Label("EDAeqEDM"),
                    @readable.Thm("RightAngle_DEF", () => rightangle_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle A E D)",
                "RightAED",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("angEDA"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Prev,
                    @readable.Label("DEAeq"),
                    @readable.Thm(
                      "CongRightImpliesRight",
                      () => congrightimpliesright(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle D E M)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("EDMncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Prev,
                    @readable.Label("MEDcong"),
                    @readable.Thm(
                      "CongRightImpliesRight",
                      () => congrightimpliesright(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      E IN Open (A, M)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("EADncol"),
                    @readable.Label("EDMncol"),
                    @readable.Label("RightAED"),
                    @readable.Prev,
                    @readable.Label("h_line"),
                    @readable.Label("Mexists"),
                    @readable.Thm(
                      "OppositeRightAnglesLinear",
                      () => oppositerightangleslinear(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      E IN v  /\\   E = G",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("v_line"),
                    @readable.Prev,
                    @readable.Thm("BetweenLinear", () => betweenlinear()),
                    @readable.Label("h_line"),
                    @readable.Label("vhG"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [@readable.Prev, @readable.Label("DG"), @readable.Label("notDE")],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    E NOTIN v",
          "notEv",
          @readable.steps(
            [
              @readable.assuming("~(E NOTIN v)", "Con", @readable.by(@readable.fol, [])),
              @readable.have(
                "\n      E IN v  /\\   E = G",
                "EG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("h_line"),
                    @readable.Prev,
                    @readable.Thm("NOTIN", () => notin()),
                    @readable.Label("vhG"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.have(
                "\n      E IN Open (A, M)",
                "",
                @readable.by(@readable.fol, [@readable.Prev, @readable.Label("AGM")]),
              ),
              @readable.have(
                "\n      angle D E A suppl angle D E M",
                "DEAsuppl",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("EADncol"),
                    @readable.Prev,
                    @readable.Thm(
                      "SupplementaryAngles_DEF",
                      () => supplementaryangles_def(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle D E A)",
                "RightDEA",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("DEAsuppl"),
                    @readable.Label("EDAeqEDM"),
                    @readable.Thm("RightAngle_DEF", () => rightangle_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle E D A)",
                "RightEDA",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("angEDA"),
                    @readable.Label("RightDEA"),
                    @readable.Label("EDAeqEDM"),
                    @readable.Thm(
                      "CongRightImpliesRight",
                      () => congrightimpliesright(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      Right (angle E D M)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("EDMncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Label("RightEDA"),
                    @readable.Label("Mexists"),
                    @readable.Thm(
                      "CongRightImpliesRight",
                      () => congrightimpliesright(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      D IN Open (A, M)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("angEDA"),
                    @readable.Label("EDMncol"),
                    @readable.Label("RightEDA"),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    @readable.Prev,
                    @readable.Label("h_line"),
                    @readable.Label("Mexists"),
                    @readable.Thm(
                      "OppositeRightAnglesLinear",
                      () => oppositerightangleslinear(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      D IN v /\\  D = G",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("v_line"),
                    @readable.Prev,
                    @readable.Thm("BetweenLinear", () => betweenlinear()),
                    @readable.Label("h_line"),
                    @readable.Label("vhG"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [@readable.Prev, @readable.Label("EG"), @readable.Label("notDE")],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear M A E /\\  ~Collinear M A D  /\\   ~(M = E)",
          "MAEncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notAM"),
              @readable.Label("v_line"),
              @readable.Label("notEv"),
              @readable.Label("notDv"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg M E === seg A D",
          "MEeqAD",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("ErAC"),
              @readable.Label("ABD'"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("MEDcong"),
              @readable.Label("ErAC"),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A D === seg M D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("ABD'"),
              @readable.Label("Mexists"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg M E === seg M D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MAEncol"),
              @readable.Label("ABD'"),
              @readable.Label("Mexists"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("MEeqAD"),
              @readable.Prev,
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    M,A,E cong M,A,D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MAEncol"),
              @readable.Label("MArefl"),
              @readable.Prev,
              @readable.Label("ErAC"),
              @readable.Thm("SSS", () => sss()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle M A E === angle M A D",
          "MAEeq",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle D A M === angle M A E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MAEncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("MAEeq"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A M === angle M A C",
          "BAMeqMAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("equalrays"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(E,D same_side v)",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "E,D same_side v",
                "Con",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      ray A D = ray A E",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("v_line"),
                    @readable.Label("notAM"),
                    @readable.Label("notDv"),
                    @readable.Label("notEv"),
                    @readable.Prev,
                    @readable.Label("MAEeq"),
                    @readable.Thm("C4Uniqueness", () => c4uniqueness()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("ABD'"),
                  @readable.Thm("EndpointInRay", () => endpointinray()),
                  @readable.Prev,
                  @readable.Thm("IN_Ray", () => in_ray()),
                  @readable.Label("EADncol"),
                ],
              ),
            ],
          ),
        ),
        @readable.consider(
          "H",
          "H IN v /\\  H IN Open (E, D)    ",
          "EHD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("v_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    H = G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("h_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Label("vhG"),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN int_angle E A D",
          "GintEAD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EADncol"),
              @readable.Prev,
              @readable.Label("EHD"),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN int_angle E A D",
          "MintEAD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("GintEAD"),
              @readable.Label("MrAG"),
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN ray A D DIFF {A}   /\\    C IN ray A E DIFF {A}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("equalrays"),
              @readable.Label("Distinct"),
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN int_angle B A C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("MintEAD"),
              @readable.Prev,
              @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("BAMeqMAC")]),
      ],
    ),
  ))
}

///|
let anglebisector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleBisector")

///|
/// `AngleBisector`
pub fn anglebisector() -> @kernel.Thm {
  anglebisector_c.get()
}

///|
/// EuclidPropositionI_6
fn step_348() -> Unit raise {
  euclidpropositioni_6_c.set(@readable.prove(
    "\n  forall A B C. ~Collinear A B C  /\\   angle B A C === angle B C A  ==>  seg B A === seg B C",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1 H2"),
        @readable.have(
          "\n    ~(A = C)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg C A === seg A C",
          "CAeqAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B C A /\\  ~Collinear C B A /\\  ~Collinear B A C",
          "BCAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A C B === angle C A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H2"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,B,A cong A,B,C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("BCAncol"),
              @readable.Label("CAeqAC"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("ASA", () => asa()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("TriangleCong_DEF", () => trianglecong_def())],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_6")

///|
/// `EuclidPropositionI_6`
pub fn euclidpropositioni_6() -> @kernel.Thm {
  euclidpropositioni_6_c.get()
}

///|
/// IsoscelesExists
fn step_349() -> Unit raise {
  isoscelesexists_c.set(@readable.prove(
    "\n  forall A B. ~(A = B)  ==>  ?D. ~Collinear A D B  /\\   seg D A === seg D B",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B, H1"),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  B IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("H1"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "C",
          "C NOTIN l    ",
          "notCl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ExistsPointOffLine", () => existspointoffline()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C A B /\\  ~Collinear C B A /\\  ~Collinear A B C /\\  ~Collinear A C B /\\  ~Collinear B A C",
          "CABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("H1"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C A B === angle C B A  \\/  angle C A B <_ang angle C B A  \\/  angle C B A <_ang angle C A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("AngleTrichotomy", () => angletrichotomy()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "cong | less | greater    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(
          [
            "angle C A B === angle C B A",
            "angle C A B <_ang angle C B A",
            "angle C B A <_ang angle C A B",
          ],
        ),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("CABncol"),
                    @readable.Thm("EuclidPropositionI_6", () => euclidpropositioni_6()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      angle C A B <_ang angle A B C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.consider(
                  "E",
                  "E IN int_angle A B C  /\\   angle C A B === angle A B E    ",
                  "Eexists",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CABncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Prev,
                      @readable.Thm("AngleOrderingUse", () => angleorderinguse()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(B = E)",
                  "notBE",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
                    ],
                  ),
                ),
                @readable.consider(
                  "D",
                  "D IN Open (A, C)  /\\   D IN ray B E DIFF {B}    ",
                  "Dexists",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Thm("Crossbar_THM", () => crossbar_thm()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      D IN int_angle A B C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Prev,
                      @readable.Thm("WholeRayInterior", () => wholerayinterior()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear A D B",
                  "ADBncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ray B D = ray B E  /\\   ray A D = ray A C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("notBE"),
                      @readable.Label("Dexists"),
                      @readable.Thm("RayWellDefined", () => raywelldefined()),
                      @readable.Thm("IntervalRay", () => intervalray()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle D A B === angle A B D",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Prev,
                      @readable.Thm("Angle_DEF", () => angle_def()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ADBncol"),
                    @readable.Prev,
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    @readable.Thm("EuclidPropositionI_6", () => euclidpropositioni_6()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      angle C B A <_ang angle B A C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.consider(
                  "E",
                  "E IN int_angle B A C  /\\   angle C B A === angle B A E    ",
                  "Eexists",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CABncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Prev,
                      @readable.Thm("AngleOrderingUse", () => angleorderinguse()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(A = E)",
                  "notAE",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
                    ],
                  ),
                ),
                @readable.consider(
                  "D",
                  "D IN Open (B, C) /\\  D IN ray A E DIFF {A}    ",
                  "Dexists",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Thm("Crossbar_THM", () => crossbar_thm()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      D IN int_angle B A C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Prev,
                      @readable.Thm("WholeRayInterior", () => wholerayinterior()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear A D B /\\  ~Collinear D A B /\\  ~Collinear D B A",
                  "ADBncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ray A D = ray A E  /\\   ray B D = ray B C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("notAE"),
                      @readable.Label("Dexists"),
                      @readable.Thm("RayWellDefined", () => raywelldefined()),
                      @readable.Thm("IntervalRay", () => intervalray()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle D B A === angle B A D",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Eexists"),
                      @readable.Prev,
                      @readable.Thm("Angle_DEF", () => angle_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle D A B === angle D B A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      @readable.Label("ADBncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Prev,
                      @readable.Thm("C5Symmetric", () => c5symmetric()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ADBncol"),
                    @readable.Prev,
                    @readable.Thm("EuclidPropositionI_6", () => euclidpropositioni_6()),
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
let isoscelesexists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IsoscelesExists")

///|
/// `IsoscelesExists`
pub fn isoscelesexists() -> @kernel.Thm {
  isoscelesexists_c.get()
}

///|
/// MidpointExists
fn step_352() -> Unit raise {
  midpointexists_c.set(@readable.prove(
    "\n  forall A B. ~(A = B)  ==>  ?M. M IN Open (A, B)  /\\   seg A M === seg M B",
    @readable.steps(
      [
        @readable.intro_tac("forall A B, H1"),
        @readable.consider(
          "D",
          "~Collinear A D B  /\\   seg D A === seg D B    ",
          "Dexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("IsoscelesExists", () => isoscelesexists()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "F IN int_angle A D B  /\\   angle A D F === angle F D B    ",
          "Fexists",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("AngleBisector", () => anglebisector())],
          ),
        ),
        @readable.have(
          "\n    ~(D = F)",
          "notDF",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("InteriorEZHelp", () => interiorezhelp())],
          ),
        ),
        @readable.consider(
          "M",
          "M IN Open (A, B) /\\   M IN ray D F DIFF {D}    ",
          "Mexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Fexists"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray D M = ray D F",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notDF"),
              @readable.Prev,
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A D M === angle M D B",
          "ADMeqMDB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Fexists"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    M IN int_angle A D B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Fexists"),
              @readable.Label("Mexists"),
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(D = M) /\\  ~Collinear A D M /\\  ~Collinear B D M",
          "ADMncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg D M === seg D M",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,D,M cong B,D,M",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ADMncol"),
              @readable.Label("Dexists"),
              @readable.Prev,
              @readable.Label("ADMeqMDB"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Mexists"),
            @readable.Prev,
            @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let midpointexists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MidpointExists")

///|
/// `MidpointExists`
pub fn midpointexists() -> @kernel.Thm {
  midpointexists_c.get()
}

///|
/// EuclidPropositionI_7short
fn step_355() -> Unit raise {
  euclidpropositioni_7short_c.set(@readable.prove(
    "\n  forall A B C D a.  ~(A = B) /\\  Line a /\\  A IN a /\\  B IN a  ==>\n    ~(C = D) /\\  C NOTIN a /\\  D NOTIN a /\\  C,D same_side a  ==>  seg A C === seg A D\n    ==>  ~(seg B C === seg B D)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D a, a_line, Csim_aD, ACeqAD"),
        @readable.have(
          "\n    ~(A = C) /\\  ~(A = D)",
          "AnotCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Csim_aD"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.assuming(
          "seg B C === seg B D",
          "Con",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    seg C B === seg D B  /\\   seg A B === seg A B  /\\   seg A D === seg A D",
          "segeqs",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("a_line"),
              @readable.Label("AnotCD"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A C B  /\\  ~Collinear A D B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Thm("I1", () => i1()),
              @readable.Label("Csim_aD"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,C,B cong A,D,B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("ACeqAD"),
              @readable.Label("segeqs"),
              @readable.Thm("SSS", () => sss()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A C === angle B A D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A D = ray A C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Csim_aD"),
              @readable.Prev,
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN ray A D DIFF {A}  /\\   D IN ray A D DIFF {A}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AnotCD"),
              @readable.Prev,
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    C = D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AnotCD"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Prev,
              @readable.Label("ACeqAD"),
              @readable.Label("segeqs"),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev, @readable.Label("Csim_aD")]),
      ],
    ),
  ))
}

///|
let euclidpropositioni_7short_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_7short")

///|
/// `EuclidPropositionI_7short`
pub fn euclidpropositioni_7short() -> @kernel.Thm {
  euclidpropositioni_7short_c.get()
}

///|
/// EuclidPropositionI_7Help
fn step_356() -> Unit raise {
  euclidpropositioni_7help_c.set(@readable.prove(
    "\n  forall A B C D a.  ~(A = B)  ==>  Line a /\\  A IN a /\\  B IN a  ==>\n    ~(C = D) /\\  C NOTIN a /\\  D NOTIN a /\\  C,D same_side a  ==>  seg A C === seg A D  ==>\n    C IN int_triangle D A B  \\/  ConvexQuadrilateral A B C D\n    ==>  ~(seg B C === seg B D)",
    @readable.steps_then(
      [
        @readable.intro_tac(
          "forall A B C D a, notAB, a_line, Csim_aD, ACeqAD, Int_ConvQuad",
        ),
        @readable.have(
          "\n    ~(A = C) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(B = D)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Csim_aD"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "convex | CintDAB    ",
        @readable.by(@readable.fol, [@readable.Label("Int_ConvQuad")]),
        @list.List(["ConvexQuadrilateral A B C D", "C IN int_triangle D A B"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      A IN int_angle B C D  /\\   B IN int_angle C D A  /\\   Tetralateral A B C D",
                  "ABint",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("ConvexQuad_DEF", () => convexquad_def()),
                      @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear B C D /\\  ~Collinear D C B /\\  ~Collinear C B D /\\  ~Collinear C D A /\\  ~Collinear D A C /\\  Angle (angle D C A) /\\  Angle (angle C D B)",
                  "angCDB",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm("ANGLE", () => angle()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D A === angle D C A",
                  "CDAeqDCA",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("angCDB"),
                      @readable.Label("Distinct"),
                      @readable.Thm("SEGMENT", () => segment()),
                      @readable.Label("ACeqAD"),
                      @readable.Thm("C2Symmetric", () => c2symmetric()),
                      @readable.Thm(
                        "IsoscelesCongBaseAngles",
                        () => isoscelescongbaseangles(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      A IN int_angle D C B  /\\   angle D C A === angle D C A  /\\   angle C D B === angle C D B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ABint"),
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                      @readable.Label("angCDB"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Thm("C5Reflexive", () => c5reflexive()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle D C A <_ang angle D C B  /\\   angle C D B <_ang angle C D A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("angCDB"),
                      @readable.Label("ABint"),
                      @readable.Prev,
                      @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D B <_ang angle D C B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("angCDB"),
                      @readable.Label("CDAeqDCA"),
                      @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                      @readable.Thm(
                        "AngleOrderTransitivity",
                        () => angleordertransitivity(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(angle D C B === angle C D B)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                      @readable.Label("angCDB"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Thm("C5Symmetric", () => c5symmetric()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("angCDB"),
                    @readable.Prev,
                    @readable.Thm(
                      "IsoscelesCongBaseAngles",
                      () => isoscelescongbaseangles(),
                    ),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      C IN int_angle A D B  /\\   C IN int_angle D A B",
                  "CintADB",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("IN_InteriorTriangle", () => in_interiortriangle()),
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear A D C /\\  ~Collinear B D C",
                  "ADCncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CintADB"),
                      @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear D A C /\\  ~Collinear C D A /\\  ~Collinear A C D /\\  ~Collinear A D C",
                  "DACncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear B C D /\\  Angle (angle D C A) /\\  Angle (angle C D B) /\\  ~Collinear D C B",
                  "angCDB",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ADCncol"),
                      @readable.Prev,
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm("ANGLE", () => angle()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D A === angle D C A",
                  "CDAeqDCA",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("DACncol"),
                      @readable.Label("Distinct"),
                      @readable.Label("ADCncol"),
                      @readable.Thm("SEGMENT", () => segment()),
                      @readable.Label("ACeqAD"),
                      @readable.Thm("C2Symmetric", () => c2symmetric()),
                      @readable.Thm(
                        "IsoscelesCongBaseAngles",
                        () => isoscelescongbaseangles(),
                      ),
                    ],
                  ),
                ),
                @readable.consider(
                  "E",
                  "D IN Open (A, E) /\\  ~(D = E) /\\  Collinear A D E    ",
                  "ADE",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Thm("B2'", () => b2_p()),
                      @readable.Thm("B1'", () => b1_p()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      B IN int_angle C D E /\\  Collinear D A E",
                  "BintCDE",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CintADB"),
                      @readable.Prev,
                      @readable.Thm(
                        "InteriorReflectionInterior",
                        () => interiorreflectioninterior(),
                      ),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear C D E",
                  "CDEncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("DACncol"),
                      @readable.Prev,
                      @readable.Label("ADE"),
                      @readable.Thm(
                        "NoncollinearityExtendsToLine",
                        () => noncollinearityextendstoline(),
                      ),
                    ],
                  ),
                ),
                @readable.consider(
                  "F",
                  "F IN Open (B, D)  /\\   F IN ray A C DIFF {A}    ",
                  "Fexists",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CintADB"),
                      @readable.Thm("Crossbar_THM", () => crossbar_thm()),
                      @readable.Thm("B1'", () => b1_p()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      F IN int_angle B C D",
                  "FintBCD",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ADCncol"),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Prev,
                      @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear D C F",
                  "DCFncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Label("ADCncol"),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Label("Fexists"),
                      @readable.Thm("B1'", () => b1_p()),
                      @readable.Thm(
                        "NoncollinearityExtendsToLine",
                        () => noncollinearityextendstoline(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      Collinear A C F  /\\   F IN ray D B DIFF {D}  /\\   C IN int_angle A D F",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Fexists"),
                      @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                      @readable.Thm("IN_SING", () => @sets.in_sing()),
                      @readable.Thm("IN_Ray", () => in_ray()),
                      @readable.Thm("B1'", () => b1_p()),
                      @readable.Thm("IntervalRayEZ", () => intervalrayez()),
                      @readable.Label("CintADB"),
                      @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      C IN Open (A, F)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm(
                        "AlternateConverseCrossbar",
                        () => alternateconversecrossbar(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle A D C suppl angle C D E  /\\   angle A C D suppl angle D C F",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ADE"),
                      @readable.Label("DACncol"),
                      @readable.Prev,
                      @readable.Thm(
                        "SupplementaryAngles_DEF",
                        () => supplementaryangles_def(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D E === angle D C F",
                  "CDEeqDCF",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("CDAeqDCA"),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      @readable.Thm(
                        "SupplementsCongAnglesCong",
                        () => supplementsconganglescong(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D B <_ang angle C D E",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("angCDB"),
                      @readable.Label("CDEncol"),
                      @readable.Label("BintCDE"),
                      @readable.Thm("C5Reflexive", () => c5reflexive()),
                      @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D B <_ang angle D C F",
                  "CDBlessDCF",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("DCFncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Label("CDEeqDCF"),
                      @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle D C F <_ang angle D C B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("DCFncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Label("angCDB"),
                      @readable.Label("FintBCD"),
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                      @readable.Thm("C5Reflexive", () => c5reflexive()),
                      @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle C D B <_ang angle D C B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("CDBlessDCF"),
                      @readable.Prev,
                      @readable.Thm(
                        "AngleOrderTransitivity",
                        () => angleordertransitivity(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(angle D C B === angle C D B)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                      @readable.Label("angCDB"),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Thm("C5Symmetric", () => c5symmetric()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Label("ADCncol"),
                    @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    @readable.Prev,
                    @readable.Thm(
                      "IsoscelesCongBaseAngles",
                      () => isoscelescongbaseangles(),
                    ),
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
let euclidpropositioni_7help_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_7Help")

///|
/// `EuclidPropositionI_7Help`
pub fn euclidpropositioni_7help() -> @kernel.Thm {
  euclidpropositioni_7help_c.get()
}

///|
/// EuclidPropositionI_7
fn step_358() -> Unit raise {
  euclidpropositioni_7_c.set(@readable.prove(
    "\n  forall A B C D a.  ~(A = B)  ==>  Line a /\\  A IN a /\\  B IN a  ==>\n    ~(C = D) /\\  C NOTIN a /\\  D NOTIN a /\\  C,D same_side a  ==>\n    seg A C === seg A D\n   ==>  ~(seg B C === seg B D)",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C D a, notAB, a_line, Csim_aD, ACeqAD"),
        @readable.have(
          "\n    ~Collinear A B C /\\  ~Collinear D A B",
          "ABCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("notAB"),
              @readable.Label("Csim_aD"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = C) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(B = D) /\\  A NOTIN Open (C, D)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Csim_aD"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A D C",
          "ADCncol",
          @readable.steps(
            [
              @readable.assuming(
                "Collinear A D C",
                "Con",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      C IN ray A D DIFF {A}  /\\   D IN ray A D DIFF {A}  /\\   seg A D === seg A D",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Prev,
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Thm("EndpointInRay", () => endpointinray()),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Thm("C2Reflexive", () => c2reflexive()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("Distinct"),
                  @readable.Thm("SEGMENT", () => segment()),
                  @readable.Prev,
                  @readable.Label("ACeqAD"),
                  @readable.Thm("C1", () => c1()),
                  @readable.Label("Csim_aD"),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    D,C same_side a",
          "Dsim_aC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Label("Csim_aD"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A D === seg A C  /\\   seg B D === seg B D",
          "ADeqAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("ACeqAD"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D A C /\\  ~Collinear C D A /\\  ~Collinear A C D /\\  ~Collinear A D C",
          "DACncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ADCncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(seg B D === seg B C)  ==>  ~(seg B C === seg B D)",
          "BswitchDC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "BDCcol | BDCncol    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["Collinear B D C", "~Collinear B D C"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      B NOTIN Open (C, D)  /\\   C IN ray B D DIFF {B}  /\\   D IN ray B D DIFF {B}",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("a_line"),
                      @readable.Label("Csim_aD"),
                      @readable.Thm("SameSide_DEF", () => sameside_def()),
                      @readable.Thm("NOTIN", () => notin()),
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Thm("IN_Ray", () => in_ray()),
                      @readable.Label("Distinct"),
                      @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                      @readable.Thm("IN_SING", () => @sets.in_sing()),
                      @readable.Thm("EndpointInRay", () => endpointinray()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Prev,
                    @readable.Label("ACeqAD"),
                    @readable.Label("ADeqAC"),
                    @readable.Thm("C1", () => c1()),
                    @readable.Label("Csim_aD"),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      Tetralateral A B C D",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("notAB"),
                      @readable.Label("Distinct"),
                      @readable.Label("Csim_aD"),
                      @readable.Label("ABCncol"),
                      @readable.Prev,
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Label("DACncol"),
                      @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ConvexQuadrilateral A B C D  \\/  C IN int_triangle D A B  \\/\n      ConvexQuadrilateral A B D C  \\/  D IN int_triangle C A B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("a_line"),
                      @readable.Label("Csim_aD"),
                      @readable.Thm(
                        "FourChoicesTetralateral",
                        () => fourchoicestetralateral(),
                      ),
                      @readable.Thm(
                        "InteriorTriangleSymmetry",
                        () => interiortrianglesymmetry(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("notAB"),
                    @readable.Label("a_line"),
                    @readable.Label("Csim_aD"),
                    @readable.Label("Dsim_aC"),
                    @readable.Label("ACeqAD"),
                    @readable.Label("ADeqAC"),
                    @readable.Prev,
                    @readable.Thm(
                      "EuclidPropositionI_7Help",
                      () => euclidpropositioni_7help(),
                    ),
                    @readable.Label("BswitchDC"),
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
let euclidpropositioni_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_7")

///|
/// `EuclidPropositionI_7`
pub fn euclidpropositioni_7() -> @kernel.Thm {
  euclidpropositioni_7_c.get()
}

///|
/// EuclidPropositionI_11
fn step_360() -> Unit raise {
  euclidpropositioni_11_c.set(@readable.prove(
    "\n  forall A B. ~(A = B)  ==>  ?F. Right (angle A B F)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B, notAB"),
        @readable.consider(
          "C",
          "B IN Open (A, C)  /\\   seg B C === seg B A    ",
          "ABC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notAB"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C1OppositeRay", () => c1oppositeray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  Collinear A B C",
          "Distinct",
          @readable.by(
            @readable.fol,
            [@readable.Label("ABC"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    seg B A === seg B C",
          "BAeqBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("ABC"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "~Collinear A F C  /\\   seg F A  === seg F C    ",
          "Fexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("IsoscelesExists", () => isoscelesexists()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B F A /\\  ~Collinear B F C",
          "BFAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("Distinct"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B F /\\  Angle (angle A B F)",
          "angABF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BFAncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B F suppl angle F B C",
          "ABFsuppl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("ABC"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B = F)  /\\   seg B F === seg B F",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BFAncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    B,F,A cong B,F,C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BFAncol"),
              @readable.Prev,
              @readable.Label("BAeqBC"),
              @readable.Label("Fexists"),
              @readable.Thm("SSS", () => sss()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B F === angle F B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("angABF"),
            @readable.Label("ABFsuppl"),
            @readable.Prev,
            @readable.Thm("RightAngle_DEF", () => rightangle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_11")

///|
/// `EuclidPropositionI_11`
pub fn euclidpropositioni_11() -> @kernel.Thm {
  euclidpropositioni_11_c.get()
}

///|
/// DropPerpendicularToLine
fn step_361() -> Unit raise {
  dropperpendiculartoline_c.set(@readable.prove(
    "\n  forall P l.  Line l  /\\   P NOTIN l  ==>  ?E Q. E IN l /\\  Q IN l /\\  Right (angle P Q E)",
    @readable.steps(
      [
        @readable.intro_tac("forall P l, l_line"),
        @readable.consider(
          "A B",
          "A IN l /\\  B IN l /\\  ~(A = B)    ",
          "ABl",
          @readable.by(
            @readable.fol,
            [@readable.Label("l_line"), @readable.Thm("I2", () => i2())],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B A P /\\  ~Collinear P A B /\\  ~(A = P)",
          "BAPncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABl"),
              @readable.Label("l_line"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle B A P) /\\  Angle (angle P A B)",
          "angBAP",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "P'",
          "~(A = P') /\\  P' NOTIN l /\\  ~(P,P' same_side l) /\\  seg A P' === seg A P  /\\   angle B A P' === angle B A P    ",
          "P'exists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4OppositeSide", () => c4oppositeside()),
              @readable.Prev,
              @readable.Label("ABl"),
              @readable.Label("BAPncol"),
              @readable.Label("l_line"),
            ],
          ),
        ),
        @readable.consider(
          "Q",
          "Q IN l /\\  Q IN Open (P, P') /\\  Collinear A B Q    ",
          "Qexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Label("ABl"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B A P'",
          "BAP'ncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("ABl"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("P'exists"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A P === angle B A P'",
          "BAPeqBAP'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("angBAP"),
              @readable.Label("P'exists"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    ?E. E IN l  /\\   ~Collinear P Q E  /\\   angle P Q E === angle E Q P'",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "~(A = Q)",
                "notAQ",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ABl"),
                    @readable.Label("BAPncol"),
                    @readable.Label("BAPeqBAP'"),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      seg A Q  === seg A Q  /\\   seg A P === seg A P'",
                "APeqAP'",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Thm("C2Reflexive", () => c2reflexive()),
                    @readable.Label("BAPncol"),
                    @readable.Label("P'exists"),
                    @readable.Thm("C2Symmetric", () => c2symmetric()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~Collinear Q A P' /\\  ~Collinear Q A P",
                "QAP'ncol",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("notAQ"),
                    @readable.Label("l_line"),
                    @readable.Label("ABl"),
                    @readable.Label("Qexists"),
                    @readable.Label("P'exists"),
                    @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
                    @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle Q A P === angle Q A P'",
                "",
                @readable.case_split(
                  "QAB | notQAB    ",
                  @readable.by(
                    @readable.fol,
                    [@readable.Prev, @readable.Thm("NOTIN", () => notin())],
                  ),
                  @list.List(["A IN Open (Q, B)", "A NOTIN Open (Q, B)"]),
                  @list.List(
                    [
                      @readable.steps(
                        [
                          @readable.have(
                            "\n          angle B A P suppl angle P A Q   /\\   angle B A P' suppl angle P' A Q",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("BAPncol"),
                                @readable.Label("BAP'ncol"),
                                @readable.Prev,
                                @readable.Thm("B1'", () => b1_p()),
                                @readable.Thm(
                                  "SupplementaryAngles_DEF",
                                  () => supplementaryangles_def(),
                                ),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Prev,
                              @readable.Label("BAPeqBAP'"),
                              @readable.Thm(
                                "SupplementsCongAnglesCong",
                                () => supplementsconganglescong(),
                              ),
                              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                            ],
                          ),
                        ],
                      ),
                      @readable.steps(
                        [
                          @readable.have(
                            "\n          Q IN ray A B DIFF {A}",
                            "QrayAB_A",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Label("ABl"),
                                @readable.Label("Qexists"),
                                @readable.Label("notQAB"),
                                @readable.Thm("IN_Ray", () => in_ray()),
                                @readable.Label("notAQ"),
                                @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                                @readable.Thm("IN_SING", () => @sets.in_sing()),
                              ],
                            ),
                          ),
                          @readable.have(
                            "\n          ray A Q = ray A B",
                            "",
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("ABl"),
                                @readable.Thm("RayWellDefined", () => raywelldefined()),
                              ],
                            ),
                          ),
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("notAQ"),
                              @readable.Label("QrayAB_A"),
                              @readable.Prev,
                              @readable.Label("BAPeqBAP'"),
                              @readable.Thm("Angle_DEF", () => angle_def()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              @readable.have(
                "\n      Q,A,P cong Q,A,P'",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("QAP'ncol"),
                    @readable.Label("APeqAP'"),
                    @readable.Prev,
                    @readable.Thm("SAS", () => sas()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
                  @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  @readable.Label("ABl"),
                  @readable.Label("QAP'ncol"),
                  @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                ],
              ),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN l /\\  ~Collinear P Q E /\\  angle P Q E === angle E Q P'    ",
          "Eexists",
          @readable.by(@readable.fol, [@readable.Prev]),
        ),
        @readable.have(
          "\n    angle P Q E suppl angle E Q P'  /\\   Right (angle P Q E)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Qexists"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
              @readable.Thm("RightAngle_DEF", () => rightangle_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("Eexists"), @readable.Label("Qexists"), @readable.Prev],
        ),
      ],
    ),
  ))
}

///|
let dropperpendiculartoline_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DropPerpendicularToLine")

///|
/// `DropPerpendicularToLine`
pub fn dropperpendiculartoline() -> @kernel.Thm {
  dropperpendiculartoline_c.get()
}

///|
/// EuclidPropositionI_14
fn step_362() -> Unit raise {
  euclidpropositioni_14_c.set(@readable.prove(
    "\n  forall A B C D l.  Line l /\\  A IN l /\\  B IN l /\\  ~(A = B)  ==>\n    C NOTIN l /\\  D NOTIN l /\\  ~(C,D same_side l)  ==> angle C B A suppl angle A B D\n    ==>  B IN Open (C, D)",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D l, l_line, Cnsim_lD, CBAsupplABD"),
        @readable.have(
          "\n    ~(B = C) /\\  ~(B = D) /\\  ~Collinear C B A",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Cnsim_lD"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "B IN Open (C, E)    ",
          "CBE",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    E NOTIN l /\\  ~(C,E same_side l)",
          "Csim_lE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Prev,
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Label("Cnsim_lD"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    D,E same_side l",
          "Dsim_lE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Cnsim_lD"),
              @readable.Prev,
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B A suppl angle A B E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("CBE"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B D === angle A B E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CBAsupplABD"),
              @readable.Prev,
              @readable.Thm("SupplementUnique", () => supplementunique()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray B E = ray B D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Csim_lE"),
              @readable.Label("Cnsim_lD"),
              @readable.Label("Dsim_lE"),
              @readable.Prev,
              @readable.Thm("C4Uniqueness", () => c4uniqueness()),
            ],
          ),
        ),
        @readable.have(
          "\n    D IN ray B E DIFF {B}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("EndpointInRay", () => endpointinray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("CBE"),
            @readable.Prev,
            @readable.Thm(
              "OppositeRaysIntersect1pointHelp",
              () => oppositeraysintersect1pointhelp(),
            ),
            @readable.Thm("B1'", () => b1_p()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_14")

///|
/// `EuclidPropositionI_14`
pub fn euclidpropositioni_14() -> @kernel.Thm {
  euclidpropositioni_14_c.get()
}

///|
/// VerticalAnglesCong
fn step_363() -> Unit raise {
  verticalanglescong_c.set(@readable.prove(
    "\n  forall A B O A' B'.  ~Collinear A O B  ==> O IN Open (A, A')  /\\   O IN Open (B, B')\n    ==>  angle B O A' === angle B' O A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B O A' B', H1, H2"),
        @readable.have(
          "\n    angle A O B suppl angle B O A'",
          "AOBsupplBOA'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B O A suppl angle A O B'",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("AOBsupplBOA'"),
            @readable.Prev,
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Thm("SupplementUnique", () => supplementunique()),
          ],
        ),
      ],
    ),
  ))
}

///|
let verticalanglescong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VerticalAnglesCong")

///|
/// `VerticalAnglesCong`
pub fn verticalanglescong() -> @kernel.Thm {
  verticalanglescong_c.get()
}

///|
/// EuclidPropositionI_16
fn step_364() -> Unit raise {
  euclidpropositioni_16_c.set(@readable.prove(
    "\n  forall A B C D. ~Collinear A B C  /\\   C IN Open (B, D)\n    ==>  angle B A C <_ang angle D C A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1 H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  C IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  B IN m /\\  C IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    D IN m",
          "Dm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("H2"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN Open (A, C) /\\  seg A E === seg E C    ",
          "AEC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("MidpointExists", () => midpointexists()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = E) /\\  ~(E = C) /\\  Collinear A E C /\\  ~(B = E)",
          "AECcol",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B1'", () => b1_p()), @readable.Label("H1")],
          ),
        ),
        @readable.have(
          "\n    E IN l",
          "El",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("AEC"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "E IN Open (B, F) /\\  seg E F === seg E B    ",
          "BEF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AECcol"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C1OppositeRay", () => c1oppositeray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B = E) /\\  ~(B = F) /\\  ~(E = F) /\\  Collinear B E F",
          "BEF'",
          @readable.by(
            @readable.fol,
            [@readable.Label("BEF"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN l",
          "notBl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Distinct"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("H1"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A E B /\\  ~Collinear C E B",
          "AEBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AECcol"),
              @readable.Label("l_line"),
              @readable.Label("El"),
              @readable.Label("notBl"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle B A E)",
          "angBAE",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C E F",
          "CEFncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEBncol"),
              @readable.Label("BEF'"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B E A === angle F E C",
          "BEAeqFEC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEBncol"),
              @readable.Label("AEC"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("BEF"),
              @readable.Thm("VerticalAnglesCong", () => verticalanglescong()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg E A === seg E C  /\\   seg E B === seg E F",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEC"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("AECcol"),
              @readable.Label("BEF'"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("BEF"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,E,B cong C,E,F",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEBncol"),
              @readable.Label("CEFncol"),
              @readable.Prev,
              @readable.Label("BEAeqFEC"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A E === angle F C E",
          "BAEeqFCE",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E C D",
          "ECDncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEBncol"),
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    F NOTIN l /\\  D NOTIN l",
          "notFl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("El"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("CEFncol"),
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    F IN ray B E DIFF {B}  /\\   E NOTIN m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BEF"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
              @readable.Label("m_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("AEBncol"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    F NOTIN m  /\\   F,E same_side m",
          "Fsim_mE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Thm("RaySameSide", () => raysameside()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,F same_side l)  /\\   ~(B,D same_side l)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("El"),
              @readable.Label("l_line"),
              @readable.Label("BEF"),
              @readable.Label("H2"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    F,D same_side l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("notBl"),
              @readable.Label("notFl"),
              @readable.Prev,
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.have(
          "\n    F IN int_angle E C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ECDncol"),
              @readable.Label("l_line"),
              @readable.Label("El"),
              @readable.Label("m_line"),
              @readable.Label("Dm"),
              @readable.Label("notFl"),
              @readable.Label("Fsim_mE"),
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A E <_ang angle E C D",
          "BAElessECD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angBAE"),
              @readable.Label("ECDncol"),
              @readable.Prev,
              @readable.Label("BAEeqFCE"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A E = ray A C  /\\   ray C E = ray C A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AEC"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B A C <_ang angle A C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BAElessECD"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("AngleSymmetry", () => anglesymmetry())],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_16")

///|
/// `EuclidPropositionI_16`
pub fn euclidpropositioni_16() -> @kernel.Thm {
  euclidpropositioni_16_c.get()
}

///|
/// ExteriorAngle
fn step_367() -> Unit raise {
  exteriorangle_c.set(@readable.prove(
    "\n  forall A B C D.  ~Collinear A B C  /\\   C IN Open (B, D)\n    ==>  angle A B C <_ang angle A C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1 H2"),
        @readable.have(
          "\n    ~(C = D) /\\  C IN Open (D, B) /\\  Collinear B C D",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B A C /\\  ~(A = C)",
          "BACncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "C IN Open (A, E)    ",
          "ACE",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    ~(C = E) /\\  C IN Open (E, A) /\\  Collinear A C E",
          "ACE'",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A C D /\\  ~Collinear D C E",
          "DCEncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2'"),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B C <_ang angle E C B",
          "ABClessECB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BACncol"),
              @readable.Label("ACE"),
              @readable.Thm("EuclidPropositionI_16", () => euclidpropositioni_16()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle E C B === angle A C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DCEncol"),
              @readable.Label("ACE'"),
              @readable.Label("H2'"),
              @readable.Thm("VerticalAnglesCong", () => verticalanglescong()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("ABClessECB"),
            @readable.Label("DCEncol"),
            @readable.Thm("ANGLE", () => angle()),
            @readable.Prev,
            @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
          ],
        ),
      ],
    ),
  ))
}

///|
let exteriorangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ExteriorAngle")

///|
/// `ExteriorAngle`
pub fn exteriorangle() -> @kernel.Thm {
  exteriorangle_c.get()
}

///|
/// EuclidPropositionI_17
fn step_369() -> Unit raise {
  euclidpropositioni_17_c.set(@readable.prove(
    "\n  forall A B C alpha beta gamma.  ~Collinear A B C  /\\   alpha = angle A B C  /\\   beta = angle B C A  ==>\n    beta suppl gamma\n    ==>  alpha <_ang gamma",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C alpha beta gamma, H1, H2"),
        @readable.have(
          "\n    Angle gamma",
          "anggamma",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("SupplementImpliesAngle", () => supplementimpliesangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B A C /\\  ~Collinear A C B",
          "BACncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "D",
          "C IN Open (A, D)    ",
          "ACD",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    angle A B C <_ang angle D C B",
          "ABClessDCB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BACncol"),
              @readable.Label("ACD"),
              @readable.Thm("EuclidPropositionI_16", () => euclidpropositioni_16()),
            ],
          ),
        ),
        @readable.have(
          "\n    beta suppl angle B C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Label("BACncol"),
              @readable.Label("ACD"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C D === gamma",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("SupplementUnique", () => supplementunique()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("ABClessDCB"),
            @readable.Label("H1"),
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Label("anggamma"),
            @readable.Prev,
            @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_17_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_17")

///|
/// `EuclidPropositionI_17`
pub fn euclidpropositioni_17() -> @kernel.Thm {
  euclidpropositioni_17_c.get()
}

///|
/// EuclidPropositionI_18
fn step_370() -> Unit raise {
  euclidpropositioni_18_c.set(@readable.prove(
    "\n  forall A B C.  ~Collinear A B C  /\\   seg A C <__ seg A B\n    ==>  angle A B C <_ang angle B C A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, H1 H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "D",
          "D IN Open (A, B) /\\  seg A C === seg A D    ",
          "ADB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("H2"),
              @readable.Thm("SegmentOrderingUse", () => segmentorderinguse()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(D = A) /\\  ~(D = B) /\\  D IN Open (B, A) /\\  Collinear A D B /\\  ray B D = ray B A",
          "ADB'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    D IN int_angle A C B  /\\  ~Collinear A C B",
          "DintACB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("ADB"),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D A C /\\  ~Collinear C B D /\\  ~Collinear C D A",
          "DACncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("ADB'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A D === seg A C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ADB'"),
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("ADB"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D A === angle A C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DACncol"),
              @readable.Prev,
              @readable.Thm("IsoscelesCongBaseAngles", () => isoscelescongbaseangles()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D A <_ang angle A C B",
          "CDAlessACB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DACncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H1"),
              @readable.Label("DintACB"),
              @readable.Prev,
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B D C suppl angle C D A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DACncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("ADB'"),
              @readable.Thm("SupplementaryAngles_DEF", () => supplementaryangles_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B D <_ang angle C D A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DACncol"),
              @readable.Prev,
              @readable.Thm("EuclidPropositionI_17", () => euclidpropositioni_17()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B D <_ang angle A C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("CDAlessACB"),
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("ADB'"),
            @readable.Thm("Angle_DEF", () => angle_def()),
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_18")

///|
/// `EuclidPropositionI_18`
pub fn euclidpropositioni_18() -> @kernel.Thm {
  euclidpropositioni_18_c.get()
}

///|
/// EuclidPropositionI_19
fn step_372() -> Unit raise {
  euclidpropositioni_19_c.set(@readable.prove(
    "\n  forall A B C. ~Collinear A B C  /\\   angle A B C <_ang angle B C A\n    ==>  seg A C  <__ seg A B",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C, H1 H2"),
        @readable.have(
          "\n    ~Collinear B A C /\\  ~Collinear B C A /\\  ~Collinear A C B",
          "BACncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.assuming(
          "~(seg A C  <__ seg A B)",
          "Con",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    seg A B === seg A C   \\/  seg A B  <__ seg A C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Prev,
              @readable.Thm("SegmentTrichotomy", () => segmenttrichotomy()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "cong | less    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["seg A B === seg A C", "seg A B  <__ seg A C"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      angle C B A === angle B C A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("BACncol"),
                      @readable.Prev,
                      @readable.Thm(
                        "IsoscelesCongBaseAngles",
                        () => isoscelescongbaseangles(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    @readable.Label("H2"),
                    @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      angle A C B <_ang angle C B A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("BACncol"),
                      @readable.Prev,
                      @readable.Thm(
                        "EuclidPropositionI_18",
                        () => euclidpropositioni_18(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("BACncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Prev,
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    @readable.Label("H2"),
                    @readable.Thm("AngleTrichotomy", () => angletrichotomy()),
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
let euclidpropositioni_19_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_19")

///|
/// `EuclidPropositionI_19`
pub fn euclidpropositioni_19() -> @kernel.Thm {
  euclidpropositioni_19_c.get()
}

///|
/// EuclidPropositionI_20
fn step_375() -> Unit raise {
  euclidpropositioni_20_c.set(@readable.prove(
    "\n  forall A B C D. ~Collinear A B C  ==>  A IN Open (B, D)  /\\   seg A D === seg A C\n    ==>  seg B C <__ seg B D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1, H2"),
        @readable.have(
          "\n    ~(B = D) /\\  ~(A = D) /\\  A IN Open (D, B) /\\  Collinear B A D /\\  ray D A = ray D B",
          "BAD'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C A D",
          "CADncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("BAD'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear D C B /\\  ~Collinear B D C",
          "DCBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("BAD'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle C D A)",
          "angCDA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CADncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D A === angle D C A",
          "CDAeqDCA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CADncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Thm("IsoscelesCongBaseAngles", () => isoscelescongbaseangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle D C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DCBncol"),
              @readable.Label("BAD'"),
              @readable.Thm("ConverseCrossbar", () => conversecrossbar()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D A <_ang angle D C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("angCDA"),
              @readable.Label("DCBncol"),
              @readable.Prev,
              @readable.Label("CDAeqDCA"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B D C <_ang angle D C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BAD'"),
              @readable.Thm("Angle_DEF", () => angle_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("DCBncol"),
            @readable.Prev,
            @readable.Thm("EuclidPropositionI_19", () => euclidpropositioni_19()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_20_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_20")

///|
/// `EuclidPropositionI_20`
pub fn euclidpropositioni_20() -> @kernel.Thm {
  euclidpropositioni_20_c.get()
}

///|
/// EuclidPropositionI_21
fn step_377() -> Unit raise {
  euclidpropositioni_21_c.set(@readable.prove(
    "\n  forall A B C D. ~Collinear A B C  /\\   D IN int_triangle A B C\n    ==>  angle A B C <_ang angle C D A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1 H2"),
        @readable.have(
          "\n    ~(B = A) /\\  ~(B = C) /\\  ~(A = C)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    D IN int_angle B A C  /\\   D IN int_angle C B A",
          "DintTri",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IN_InteriorTriangle", () => in_interiortriangle()),
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "E IN Open (B, C) /\\  E IN ray A D DIFF {A}    ",
          "BEC",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("Crossbar_THM", () => crossbar_thm())],
          ),
        ),
        @readable.have(
          "\n    ~(B = E) /\\  ~(E = C) /\\  Collinear B E C  /\\   Collinear A D E",
          "BEC'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray B E = ray B C  /\\   E IN ray B C DIFF {B}",
          "rBErBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BEC"),
              @readable.Thm("IntervalRay", () => intervalray()),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.have(
          "\n    D IN int_angle A B E",
          "DintABE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintTri"),
              @readable.Prev,
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("InteriorWellDefined", () => interiorwelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    D IN Open (A, E)",
          "ADE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BEC'"),
              @readable.Prev,
              @readable.Thm(
                "AlternateConverseCrossbar",
                () => alternateconversecrossbar(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ray E D = ray E A",
          "rEDrEA",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IntervalRay", () => intervalray()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B E /\\  ~Collinear B E A  /\\  ~Collinear C B D /\\  ~(A = D)",
          "ABEncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("DintABE"),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("DintTri"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E D C /\\  ~Collinear C E D",
          "EDCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("BEC'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B E <_ang angle A E C  /\\   angle C E D = angle D E C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABEncol"),
              @readable.Label("BEC"),
              @readable.Thm("ExteriorAngle", () => exteriorangle()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B C <_ang angle C E D",
          "ABClessAEC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("rBErBC"),
              @readable.Label("rEDrEA"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C E D  <_ang  angle C D A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EDCncol"),
              @readable.Label("ADE"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("ExteriorAngle", () => exteriorangle()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("ABClessAEC"),
            @readable.Prev,
            @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_21_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_21")

///|
/// `EuclidPropositionI_21`
pub fn euclidpropositioni_21() -> @kernel.Thm {
  euclidpropositioni_21_c.get()
}

///|
/// AngleTrichotomy3
fn step_379() -> Unit raise {
  angletrichotomy3_c.set(@readable.prove(
    "\n  forall alpha beta gamma.  alpha <_ang beta  /\\   Angle gamma  /\\   gamma === alpha  ==>  gamma <_ang beta",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta gamma, H1"),
        @readable.consider(
          "A O B G",
          "Angle alpha /\\  ~Collinear A O B /\\  beta = angle A O B /\\  G IN int_angle A O B /\\  alpha === angle A O G    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A O G",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("InteriorEZHelp", () => interiorezhelp())],
          ),
        ),
        @readable.have(
          "\n    gamma === angle A O G",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H1'"),
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H1'"),
            @readable.Prev,
            @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let angletrichotomy3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AngleTrichotomy3")

///|
/// `AngleTrichotomy3`
pub fn angletrichotomy3() -> @kernel.Thm {
  angletrichotomy3_c.get()
}

///|
/// InteriorCircleConvexHelp
fn step_380() -> Unit raise {
  interiorcircleconvexhelp_c.set(@readable.prove(
    "\n  forall O A B C. ~Collinear A O C  ==>  B IN Open (A, C)  ==>\n    seg O A <__ seg O C  \\/  seg O A === seg O C\n    ==>  seg O B <__ seg O C",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B C, H1, H2, H3"),
        @readable.have(
          "\n    ~Collinear O C A /\\  ~Collinear C O A /\\  ~(O = A) /\\  ~(O = C)",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A B = ray A C  /\\   ray C B = ray C A",
          "equal_rays",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("IntervalRay", () => intervalray()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O C A <_ang angle C A O  \\/  angle O C A === angle C A O",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "seg O A === seg O C",
                "seg_eq",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H3"),
                    @readable.Label("H1'"),
                    @readable.Thm(
                      "EuclidPropositionI_18",
                      () => euclidpropositioni_18(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      seg O C === seg O A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1'"),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Prev,
                    @readable.Thm("C2Symmetric", () => c2symmetric()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("H1'"),
                  @readable.Prev,
                  @readable.Thm(
                    "IsoscelesCongBaseAngles",
                    () => isoscelescongbaseangles(),
                  ),
                  @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O C B <_ang angle B A O  \\/  angle O C B === angle B A O",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("equal_rays"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C O <_ang angle O A B  \\/  angle B C O === angle O A B",
          "BCOlessOAB",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("AngleSymmetry", () => anglesymmetry())],
          ),
        ),
        @readable.have(
          "\n    ~Collinear O A B /\\  ~Collinear B C O /\\  ~Collinear O C B",
          "OABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O A B <_ang angle O B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H2"),
              @readable.Thm("ExteriorAngle", () => exteriorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C O <_ang angle O B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCOlessOAB"),
              @readable.Prev,
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
              @readable.Label("OABncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Prev,
              @readable.Thm("AngleTrichotomy3", () => angletrichotomy3()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("OABncol"),
            @readable.Prev,
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Thm("EuclidPropositionI_19", () => euclidpropositioni_19()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorcircleconvexhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorCircleConvexHelp")

///|
/// `InteriorCircleConvexHelp`
pub fn interiorcircleconvexhelp() -> @kernel.Thm {
  interiorcircleconvexhelp_c.get()
}

///|
/// InteriorCircleConvex
fn step_382() -> Unit raise {
  interiorcircleconvex_c.set(@readable.prove(
    "\n  forall O R A B C.  ~(O = R)  ==>  B IN Open (A, C)  ==>\n    A IN int_circle O R  /\\   C IN int_circle O R\n    ==>  B IN int_circle O R",
    @readable.steps_then(
      [
        @readable.intro_tac("forall O R A B C, H1, H2, H3"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  B IN Open (C, A)",
          "H2'",
          @readable.by(
            @readable.fol,
            [@readable.Label("H2"), @readable.Thm("B1'", () => b1_p())],
          ),
        ),
        @readable.have(
          "\n    (A = O  \\/  seg O A <__ seg O R)  /\\   (C = O  \\/  seg O C <__ seg O R)",
          "ACintOR",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Label("H1"),
              @readable.Thm("IN_InteriorCircle", () => in_interiorcircle()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "OAC | OnotAC    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["O = A \\/ O = C", "~(O = A) /\\  ~(O = C)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      B IN Open (O, C)  \\/  B IN Open (O, A)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("H2"),
                      @readable.Thm("B1'", () => b1_p()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      seg O B <__ seg O A /\\  ~(O = A)  \\/  seg O B <__ seg O C /\\  ~(O = C)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("B1'", () => b1_p()),
                      @readable.Thm("SEGMENT", () => segment()),
                      @readable.Thm("C2Reflexive", () => c2reflexive()),
                      @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      seg O B <__ seg O R",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("ACintOR"),
                      @readable.Thm(
                        "SegmentOrderTransitivity",
                        () => segmentordertransitivity(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H1"),
                    @readable.Thm("IN_InteriorCircle", () => in_interiorcircle()),
                  ],
                ),
              ],
            ),
            @readable.case_split(
              "AOCncol | AOCcol    ",
              @readable.by(@readable.fol, [@readable.Prev]),
              @list.List(["~Collinear A O C", "Collinear A O C"]),
              @list.List(
                [
                  @readable.steps(
                    [
                      @readable.have(
                        "\n        seg O A <__ seg O C  \\/  seg O A === seg O C  \\/  seg O C <__ seg O A",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Label("OnotAC"),
                            @readable.Thm("SEGMENT", () => segment()),
                            @readable.Thm(
                              "SegmentTrichotomy",
                              () => segmenttrichotomy(),
                            ),
                          ],
                        ),
                      ),
                      @readable.have(
                        "\n        seg O B <__ seg O C  \\/  seg O B <__ seg O A",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Label("AOCncol"),
                            @readable.Label("H2"),
                            @readable.Prev,
                            @readable.Thm(
                              "InteriorCircleConvexHelp",
                              () => interiorcircleconvexhelp(),
                            ),
                            @readable.Thm(
                              "CollinearSymmetry",
                              () => collinearsymmetry(),
                            ),
                            @readable.Thm("B1'", () => b1_p()),
                          ],
                        ),
                      ),
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Label("OnotAC"),
                          @readable.Label("ACintOR"),
                          @readable.Prev,
                          @readable.Thm(
                            "SegmentOrderTransitivity",
                            () => segmentordertransitivity(),
                          ),
                          @readable.Label("H1"),
                          @readable.Thm("IN_InteriorCircle", () => in_interiorcircle()),
                        ],
                      ),
                    ],
                  ),
                  @readable.steps(
                    [
                      @readable.consider(
                        "l",
                        "Line l /\\  A IN l /\\  C IN l    ",
                        "l_line",
                        @readable.by(
                          @readable.fol,
                          [@readable.Label("H2'"), @readable.Thm("I1", () => i1())],
                        ),
                      ),
                      @readable.have(
                        "\n        Collinear B A O /\\  Collinear B C O",
                        "OABCcol",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Prev,
                            @readable.Label("H2"),
                            @readable.Thm("BetweenLinear", () => betweenlinear()),
                            @readable.Label("H2'"),
                            @readable.Label("AOCcol"),
                            @readable.Thm("CollinearLinear", () => collinearlinear()),
                            @readable.Thm("Collinear_DEF", () => collinear_def()),
                          ],
                        ),
                      ),
                      @readable.have(
                        "\n        B NOTIN Open (O, A) /\\  B NOTIN Open (O, C)  ==>  B = O",
                        "",
                        @readable.steps(
                          [
                            @readable.intro_tac("Assumption"),
                            @readable.have(
                              "\n          O IN ray B A INTER ray B C",
                              "",
                              @readable.by(
                                @readable.fol,
                                [
                                  @readable.Label("H2'"),
                                  @readable.Label("OABCcol"),
                                  @readable.Prev,
                                  @readable.Thm("IN_Ray", () => in_ray()),
                                  @readable.Thm("IN_INTER", () => @sets.in_inter()),
                                ],
                              ),
                            ),
                            @readable.by(
                              @readable.fol,
                              [
                                @readable.Prev,
                                @readable.Label("H2"),
                                @readable.Thm(
                                  "OppositeRaysIntersect1point",
                                  () => oppositeraysintersect1point(),
                                ),
                                @readable.Thm("IN_SING", () => @sets.in_sing()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      @readable.have(
                        "\n        B IN Open (O, A)  \\/  B IN Open (O, C)  \\/  B = O",
                        "",
                        @readable.by(
                          @readable.fol,
                          [@readable.Prev, @readable.Thm("NOTIN", () => notin())],
                        ),
                      ),
                      @readable.have(
                        "\n        seg O B <__ seg O A  \\/  seg O B <__ seg O C  \\/  B = O",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Prev,
                            @readable.Thm("B1'", () => b1_p()),
                            @readable.Thm("SEGMENT", () => segment()),
                            @readable.Thm("C2Reflexive", () => c2reflexive()),
                            @readable.Thm(
                              "SegmentOrdering_DEF",
                              () => segmentordering_def(),
                            ),
                          ],
                        ),
                      ),
                      @readable.have(
                        "\n        seg O B <__ seg O R  \\/  B = O",
                        "",
                        @readable.by(
                          @readable.fol,
                          [
                            @readable.Prev,
                            @readable.Label("ACintOR"),
                            @readable.Label("OnotAC"),
                            @readable.Thm(
                              "SegmentOrderTransitivity",
                              () => segmentordertransitivity(),
                            ),
                          ],
                        ),
                      ),
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Prev,
                          @readable.Label("H1"),
                          @readable.Thm("IN_InteriorCircle", () => in_interiorcircle()),
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
  ))
}

///|
let interiorcircleconvex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorCircleConvex")

///|
/// `InteriorCircleConvex`
pub fn interiorcircleconvex() -> @kernel.Thm {
  interiorcircleconvex_c.get()
}

///|
/// SegmentTrichotomy3
fn step_386() -> Unit raise {
  segmenttrichotomy3_c.set(@readable.prove(
    "\n  forall s t u.  s <__ t  /\\   Segment u  /\\   u === s  ==>  u <__ t",
    @readable.steps(
      [
        @readable.intro_tac("forall s t u, H1"),
        @readable.consider(
          "C D X",
          "Segment s /\\  t = seg C D /\\  X IN Open (C, D) /\\  s === seg C X /\\  ~(C = X)    ",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    u === seg C X",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H1'"),
            @readable.Prev,
            @readable.Thm("SegmentOrdering_DEF", () => segmentordering_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let segmenttrichotomy3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SegmentTrichotomy3")

///|
/// `SegmentTrichotomy3`
pub fn segmenttrichotomy3() -> @kernel.Thm {
  segmenttrichotomy3_c.get()
}

///|
/// EuclidPropositionI_24Help
fn step_387() -> Unit raise {
  euclidpropositioni_24help_c.set(@readable.prove(
    "\n  forall O A C O' D M.  ~Collinear A O C /\\  ~Collinear D O' M  ==>\n    seg O' D === seg O A  /\\   seg O' M === seg O C  ==>  angle D O' M <_ang angle A O C  ==>\n    seg O A <__ seg O C  \\/  seg O A === seg O C\n    ==>  seg D M <__ seg A C",
    @readable.steps(
      [
        @readable.intro_tac("forall O A C O' D M, H1, H2, H3, H4"),
        @readable.consider(
          "K",
          "K IN int_angle A O C /\\  angle D O' M === angle A O K    ",
          "KintAOC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H3"),
              @readable.Thm("AngleOrderingUse", () => angleorderinguse()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(O = C) /\\  ~(D = M) /\\  ~(O' = M) /\\  ~(O = K)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Prev,
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
            ],
          ),
        ),
        @readable.consider(
          "B",
          "B IN ray O K DIFF {O}  /\\   seg O B === seg O C    ",
          "BrOK",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Prev,
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray O B = ray O K",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle D O' M === angle A O B",
          "DO'MeqAOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("KintAOC"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN int_angle A O C",
          "BintAOC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("KintAOC"),
              @readable.Label("BrOK"),
              @readable.Thm("WholeRayInterior", () => wholerayinterior()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B = O) /\\  ~Collinear A O B",
          "AOBncol",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("InteriorEZHelp", () => interiorezhelp())],
          ),
        ),
        @readable.have(
          "\n    seg O C === seg O B",
          "OCeqOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("BrOK"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg O' M === seg O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("AOBncol"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("C2Transitive", () => c2transitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    D,O',M cong A,O,B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("AOBncol"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Label("DO'MeqAOB"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg D M === seg A B",
          "DMeqAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN Open (A, C)  /\\   G IN ray O B DIFF {O}  /\\   ~(G = O)    ",
          "AGC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BintAOC"),
              @readable.Thm("Crossbar_THM", () => crossbar_thm()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    Segment (seg O G) /\\  ~(O = B)",
          "notOB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("BrOK"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg O G <__ seg O C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("AGC"),
              @readable.Label("H4"),
              @readable.Thm(
                "InteriorCircleConvexHelp",
                () => interiorcircleconvexhelp(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    seg O G <__ seg O B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("OCeqOB"),
              @readable.Label("BrOK"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("SegmentTrichotomy2", () => segmenttrichotomy2()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.consider(
          "G'",
          "G' IN Open (O, B)  /\\   seg O G === seg O G'    ",
          "OG'B",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notOB"),
              @readable.Prev,
              @readable.Thm("SegmentOrderingUse", () => segmentorderinguse()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G' = O)  /\\   seg O G' === seg O G'  /\\   Segment (seg O G')",
          "notG'O",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
              @readable.Thm("SEGMENT", () => segment()),
            ],
          ),
        ),
        @readable.have(
          "\n    G' IN ray O B DIFF {O}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OG'B"),
              @readable.Thm("IntervalRayEZ", () => intervalrayez()),
            ],
          ),
        ),
        @readable.have(
          "\n    G' = G  /\\   G IN Open (B, O)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notG'O"),
              @readable.Label("notOB"),
              @readable.Prev,
              @readable.Label("AGC"),
              @readable.Label("OG'B"),
              @readable.Thm("C1", () => c1()),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ConvexQuadrilateral B A O C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Label("AGC"),
              @readable.Thm(
                "DiagonalsIntersectImpliesConvexQuad",
                () => diagonalsintersectimpliesconvexquad(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle O C B  /\\   O IN int_angle C B A  /\\   Quadrilateral B A O C",
          "OintCBA",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("ConvexQuad_DEF", () => convexquad_def())],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle B C O",
          "AintBCO",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    Tetralateral B A O C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OintCBA"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C B A  /\\  ~Collinear B C O /\\  ~Collinear C O B /\\  ~Collinear C B O",
          "BCOncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C O === angle C B O",
          "BCOeqCBO",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("OCeqOB"),
              @readable.Thm("IsoscelesCongBaseAngles", () => isoscelescongbaseangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B C A /\\  ~Collinear A C B",
          "ACBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AintBCO"),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C A === angle B C A  /\\   Angle (angle B C A)  /\\   angle C B O === angle C B O",
          "CBOref",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("BCOncol"),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C A <_ang angle B C O",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BCOncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("AintBCO"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C A <_ang angle C B O",
          "BCAlessCBO",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("BCOncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("BCOeqCBO"),
              @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B O <_ang angle C B A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCOncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("OintCBA"),
              @readable.Label("CBOref"),
              @readable.Thm("AngleOrdering_DEF", () => angleordering_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A C B <_ang angle C B A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("BCAlessCBO"),
              @readable.Prev,
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A B <__ seg A C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ACBncol"),
              @readable.Prev,
              @readable.Thm("EuclidPropositionI_19", () => euclidpropositioni_19()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Distinct"),
            @readable.Thm("SEGMENT", () => segment()),
            @readable.Label("DMeqAB"),
            @readable.Thm("SegmentTrichotomy3", () => segmenttrichotomy3()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_24help_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_24Help")

///|
/// `EuclidPropositionI_24Help`
pub fn euclidpropositioni_24help() -> @kernel.Thm {
  euclidpropositioni_24help_c.get()
}

///|
/// EuclidPropositionI_24
fn step_389() -> Unit raise {
  euclidpropositioni_24_c.set(@readable.prove(
    "\n  forall O A C O' D M. ~Collinear A O C /\\  ~Collinear D O' M  ==>\n    seg O' D === seg O A /\\  seg O' M === seg O C  ==>  angle D O' M <_ang angle A O C\n    ==>  seg D M <__ seg A C",
    @readable.steps(
      [
        @readable.intro_tac("forall O A C O' D M, H1, H2, H3"),
        @readable.have(
          "\n    ~(O = A) /\\  ~(O = C) /\\  ~Collinear C O A /\\  ~Collinear M O' D",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg O A === seg O C  \\/  seg O A <__ seg O C  \\/  seg O C <__ seg O A",
          "3pos",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("SegmentTrichotomy", () => segmenttrichotomy()),
            ],
          ),
        ),
        @readable.assuming(
          "seg O C <__ seg O A",
          "H4",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("3pos"),
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("H3"),
              @readable.Thm(
                "EuclidPropositionI_24Help",
                () => euclidpropositioni_24help(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle M O' D <_ang angle C O A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H3"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Distinct"),
            @readable.Label("H3"),
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Label("H2"),
            @readable.Label("H4"),
            @readable.Thm(
              "EuclidPropositionI_24Help",
              () => euclidpropositioni_24help(),
            ),
            @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_24_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_24")

///|
/// `EuclidPropositionI_24`
pub fn euclidpropositioni_24() -> @kernel.Thm {
  euclidpropositioni_24_c.get()
}

///|
/// EuclidPropositionI_25
fn step_391() -> Unit raise {
  euclidpropositioni_25_c.set(@readable.prove(
    "\n  forall O A C O' D M.  ~Collinear A O C /\\  ~Collinear D O' M  ==>\n    seg O' D === seg O A /\\  seg O' M === seg O C  ==>  seg D M <__ seg A C\n    ==>  angle D O' M <_ang angle A O C",
    @readable.steps_then(
      [
        @readable.intro_tac("forall O A C O' D M, H1, H2, H3"),
        @readable.have(
          "\n    ~(O = A) /\\  ~(O = C) /\\  ~(A = C) /\\  ~(D = M) /\\  ~(O' = D) /\\  ~(O' = M)",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.assuming(
          "~(angle D O' M <_ang angle A O C)",
          "Contradiction",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "\n    angle D O' M === angle A O C  \\/  angle A O C <_ang angle D O' M",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Prev,
              @readable.Thm("AngleTrichotomy", () => angletrichotomy()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "Cong | Con    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["angle D O' M === angle A O C", "angle A O C <_ang angle D O' M"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      D,O',M cong A,O,C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Label("H2"),
                      @readable.Prev,
                      @readable.Thm("SAS", () => sas()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      seg D M === seg A C",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Prev,
                    @readable.Label("H3"),
                    @readable.Thm("SegmentTrichotomy", () => segmenttrichotomy()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      seg O A === seg O' D  /\\   seg O C  === seg O' M",
                  "H2'",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Thm("SEGMENT", () => segment()),
                      @readable.Label("H2"),
                      @readable.Thm("C2Symmetric", () => c2symmetric()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      seg A C <__ seg D M",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Prev,
                      @readable.Label("Con"),
                      @readable.Thm(
                        "EuclidPropositionI_24",
                        () => euclidpropositioni_24(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Prev,
                    @readable.Label("H3"),
                    @readable.Thm("SegmentTrichotomy", () => segmenttrichotomy()),
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
let euclidpropositioni_25_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_25")

///|
/// `EuclidPropositionI_25`
pub fn euclidpropositioni_25() -> @kernel.Thm {
  euclidpropositioni_25_c.get()
}

///|
/// AAS
fn step_393() -> Unit raise {
  aas_c.set(@readable.prove(
    "\n  forall A B C A' B' C'. ~Collinear A B C /\\  ~Collinear A' B' C'  ==>\n    angle A B C === angle A' B' C'  /\\   angle B C A === angle B' C' A'  ==>  seg A B === seg A' B'\n    ==>  A,B,C cong A',B',C'",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C A' B' C', H1, H2, H3"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(B = C) /\\  ~(B' = C')",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN ray B C DIFF {B} /\\  seg B G === seg B' C'    ",
          "Gexists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C1", () => c1()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G = B)  /\\   B NOTIN Open (G, C)  /\\  Collinear G B C",
          "notGBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B G /\\  ~Collinear B G A",
          "ABGncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("notGBC"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ray B G = ray B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("Gexists"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A B G = angle A B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,B,G cong A',B',C'",
          "ABGcongA'B'C'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("ABGncol"),
              @readable.Label("H3"),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Label("Gexists"),
              @readable.Thm("SAS", () => sas()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B G A === angle B' C' A'",
          "BGAeqB'C'A'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B C A  /\\  ~Collinear B' C' A'",
          "BCAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B' C' A' === angle B C A  /\\   angle B C A === angle B C A",
          "BCArefl",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H2"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
              @readable.Thm("C5Reflexive", () => c5reflexive()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B G A === angle B C A",
          "BGAeqBCA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABGncol"),
              @readable.Label("BCAncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("BGAeqB'C'A'"),
              @readable.Prev,
              @readable.Thm("C5Transitive", () => c5transitive()),
            ],
          ),
        ),
        @readable.assuming(
          "~(G = C)",
          "notGC",
          @readable.by(
            @readable.fol,
            [@readable.Label("BGAeqBCA"), @readable.Label("ABGcongA'B'C'")],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A C G /\\  ~Collinear A G C",
          "ACGncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("notGBC"),
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN Open (B, G) \\/ G IN Open (C, B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("notGBC"),
              @readable.Label("notGC"),
              @readable.Label("Distinct"),
              @readable.Thm("B3'", () => b3_p()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "BCG |  CGB",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["C IN Open (B, G) ", "G IN Open (C, B)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      C IN Open (G, B)  /\\  ray G C = ray G B",
                  "rGCrBG",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("B1'", () => b1_p()),
                      @readable.Thm("IntervalRay", () => intervalray()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle A G C <_ang angle A C B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ACGncol"),
                      @readable.Prev,
                      @readable.Thm("ExteriorAngle", () => exteriorangle()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle B G A <_ang angle B C A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("rGCrBG"),
                      @readable.Thm("Angle_DEF", () => angle_def()),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("ABGncol"),
                    @readable.Label("BCAncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Prev,
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    @readable.Label("BGAeqBCA"),
                    @readable.Thm("AngleTrichotomy", () => angletrichotomy()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      ray C G = ray C B  /\\   angle A C G <_ang angle A G B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("IntervalRay", () => intervalray()),
                      @readable.Label("ACGncol"),
                      @readable.Thm("ExteriorAngle", () => exteriorangle()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle A C B <_ang angle B G A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("Angle_DEF", () => angle_def()),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      angle B C A <_ang angle B C A",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("BCAncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Label("BGAeqBCA"),
                      @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("BCArefl"),
                    @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
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
let aas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AAS")

///|
/// `AAS`
pub fn aas() -> @kernel.Thm {
  aas_c.get()
}

///|
/// ParallelSymmetry
fn step_394() -> Unit raise {
  parallelsymmetry_c.set(@readable.prove(
    "\n  forall l k. l parallel k  ==>  k parallel l",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("PARALLEL", () => parallel()),
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
      ],
    ),
  ))
}

///|
let parallelsymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ParallelSymmetry")

///|
/// `ParallelSymmetry`
pub fn parallelsymmetry() -> @kernel.Thm {
  parallelsymmetry_c.get()
}

///|
/// AlternateInteriorAngles
fn step_396() -> Unit raise {
  alternateinteriorangles_c.set(@readable.prove(
    "\n  forall A B C E l m t.  Line l /\\  A IN l /\\  E IN l  ==>\n    Line m /\\  B IN m /\\  C IN m  ==>  Line t /\\  A IN t /\\  B IN t  ==>\n    ~(A = E) /\\  ~(B = C) /\\  ~(A = B) /\\  E NOTIN t /\\  C NOTIN t  ==>\n    ~(C,E same_side t)  ==>  angle E A B === angle C B A\n    ==>  l parallel m",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall A B C E l m t, l_line, m_line, t_line, Distinct, Cnsim_tE, AltIntAngCong",
        ),
        @readable.have(
          "\n    ~Collinear E A B /\\  ~Collinear C B A",
          "EABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Label("Distinct"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN l /\\  A NOTIN m",
          "notAmBl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Prev,
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.assuming("~(l parallel m)", "Con", @readable.by(@readable.fol, [])),
        @readable.have(
          "\n    ~(l INTER m = {})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Thm("PARALLEL", () => parallel()),
            ],
          ),
        ),
        @readable.consider(
          "G",
          "G IN l /\\  G IN m    ",
          "Glm",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G = A) /\\  ~(G = B) /\\  Collinear B G C /\\  Collinear B C G /\\  Collinear A E G /\\  Collinear A G E",
          "GnotAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("notAmBl"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A G B /\\  ~Collinear B G A /\\  G NOTIN t",
          "AGBncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EABncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Label("t_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(E,C same_side t)",
          "Ensim_tC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Label("Cnsim_tE"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    E IN l DIFF {A}  /\\   G IN l DIFF {A}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("Glm"),
              @readable.Label("Distinct"),
              @readable.Label("GnotAB"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G,E same_side t)",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "G,E same_side t",
                "Gsim_tE",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      A NOTIN Open (G, E)",
                "notGAE",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("t_line"),
                    @readable.Prev,
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      G IN ray A E DIFF {A}",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Label("GnotAB"),
                    @readable.Label("notGAE"),
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Label("GnotAB"),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ray A G = ray A E",
                "rAGrAE",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Distinct"),
                    @readable.Prev,
                    @readable.Thm("RayWellDefined", () => raywelldefined()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~(C,G same_side t)",
                "Cnsim_tG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("t_line"),
                    @readable.Label("AGBncol"),
                    @readable.Label("Distinct"),
                    @readable.Label("Gsim_tE"),
                    @readable.Label("Cnsim_tE"),
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.have(
                "\n      C NOTIN ray B G",
                "notCrBG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Label("Distinct"),
                    @readable.Label("t_line"),
                    @readable.Label("AGBncol"),
                    @readable.Thm("RaySameSide", () => raysameside()),
                    @readable.Label("Cnsim_tG"),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      B IN Open (C, G)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("GnotAB"),
                    @readable.Thm("NOTIN", () => notin()),
                    @readable.Thm("IN_Ray", () => in_ray()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G A B <_ang angle C B A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("AGBncol"),
                    @readable.Label("notCrBG"),
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm(
                      "EuclidPropositionI_16",
                      () => euclidpropositioni_16(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle E A B <_ang angle C B A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("rAGrAE"),
                    @readable.Thm("Angle_DEF", () => angle_def()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("EABncol"),
                  @readable.Thm("ANGLE", () => angle()),
                  @readable.Label("AltIntAngCong"),
                  @readable.Prev,
                  @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    G,C same_side t",
          "Gsim_tC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Label("AGBncol"),
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Label("Cnsim_tE"),
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN Open (G, C)",
          "notGBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Prev,
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G IN ray B C DIFF {B}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("GnotAB"),
              @readable.Label("notGBC"),
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("GnotAB"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray B G = ray B C",
          "rBGrBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("RayWellDefined", () => raywelldefined()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B A === angle E A B",
          "flipAltIntAngCong",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EABncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("AltIntAngCong"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(E,G same_side t)",
          "Ensim_tG",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Label("AGBncol"),
              @readable.Label("Distinct"),
              @readable.Label("Gsim_tC"),
              @readable.Label("Ensim_tC"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    E NOTIN ray A G",
          "notErAG",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("Distinct"),
              @readable.Label("t_line"),
              @readable.Label("AGBncol"),
              @readable.Thm("RaySameSide", () => raysameside()),
              @readable.Label("Ensim_tG"),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN Open (E, G)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("GnotAB"),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("IN_Ray", () => in_ray()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle G B A <_ang angle E A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("AGBncol"),
              @readable.Label("notErAG"),
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("EuclidPropositionI_16", () => euclidpropositioni_16()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C B A <_ang angle E A B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("rBGrBC"),
              @readable.Thm("Angle_DEF", () => angle_def()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("EABncol"),
            @readable.Thm("ANGLE", () => angle()),
            @readable.Label("flipAltIntAngCong"),
            @readable.Prev,
            @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
          ],
        ),
      ],
    ),
  ))
}

///|
let alternateinteriorangles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AlternateInteriorAngles")

///|
/// `AlternateInteriorAngles`
pub fn alternateinteriorangles() -> @kernel.Thm {
  alternateinteriorangles_c.get()
}

///|
/// EuclidPropositionI_28
fn step_397() -> Unit raise {
  euclidpropositioni_28_c.set(@readable.prove(
    "\n  forall A B C D E F G H l m t.  Line l /\\  A IN l /\\  B IN l /\\  G IN l  ==>\n    Line m /\\  C IN m /\\  D IN m /\\  H IN m  ==>\n    Line t /\\  G IN t /\\  H IN t  ==>\n    G NOTIN m /\\  H NOTIN l  ==>\n    G IN Open (A, B)  /\\  H IN Open (C, D)  ==>\n    G IN Open (E, H)  /\\   H IN Open (F, G)  ==>\n    ~(D,A same_side t)  ==>\n    angle E G B === angle G H D  \\/  angle B G H suppl angle G H D\n    ==>  l parallel m",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall A B C D E F G H l m t, l_line, m_line, t_line, notGmHl, H1, H2, H3, H4",
        ),
        @readable.have(
          "\n    ~(A = G) /\\  ~(G = B) /\\  ~(H = D) /\\  ~(E = G) /\\  ~(G = H) /\\  Collinear A G B /\\  Collinear E G H",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear H G A /\\  ~Collinear G H D /\\  A NOTIN t /\\  D NOTIN t",
          "HGAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Label("notGmHl"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("t_line"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B G H /\\  ~Collinear A G E /\\  ~Collinear E G B",
          "BGHncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle A G H === angle D H G",
          "",
          @readable.case_split(
            "EGBeqGHD | BGHeqGHD    ",
            @readable.by(@readable.fol, [@readable.Label("H4")]),
            @list.List(["angle E G B === angle G H D", "angle B G H suppl angle G H D"]),
            @list.List(
              [
                @readable.steps(
                  [
                    @readable.have(
                      "\n        angle E G B === angle H G A  /\\ \n        Angle (angle E G B)  /\\   Angle (angle H G A)  /\\   Angle (angle G H D)",
                      "boo",
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Label("BGHncol"),
                          @readable.Label("H1"),
                          @readable.Label("H2"),
                          @readable.Thm(
                            "VerticalAnglesCong",
                            () => verticalanglescong(),
                          ),
                          @readable.Label("HGAncol"),
                          @readable.Thm("ANGLE", () => angle()),
                        ],
                      ),
                    ),
                    @readable.have(
                      "\n        angle H G A === angle E G B",
                      "",
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Prev,
                          @readable.Thm("C5Symmetric", () => c5symmetric()),
                        ],
                      ),
                    ),
                    @readable.have(
                      "\n        angle H G A === angle G H D",
                      "",
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Label("boo"),
                          @readable.Prev,
                          @readable.Label("EGBeqGHD"),
                          @readable.Thm("C5Transitive", () => c5transitive()),
                        ],
                      ),
                    ),
                    @readable.by(
                      @readable.fol,
                      [
                        @readable.Prev,
                        @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      ],
                    ),
                  ],
                ),
                @readable.steps(
                  [
                    @readable.have(
                      "\n        angle B G H suppl angle H G A",
                      "",
                      @readable.by(
                        @readable.fol,
                        [
                          @readable.Label("BGHncol"),
                          @readable.Label("H1"),
                          @readable.Thm("B1'", () => b1_p()),
                          @readable.Thm(
                            "SupplementaryAngles_DEF",
                            () => supplementaryangles_def(),
                          ),
                        ],
                      ),
                    ),
                    @readable.by(
                      @readable.fol,
                      [
                        @readable.Prev,
                        @readable.Label("BGHeqGHD"),
                        @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                        @readable.Thm("SupplementUnique", () => supplementunique()),
                        @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("l_line"),
            @readable.Label("m_line"),
            @readable.Label("t_line"),
            @readable.Label("Distinct"),
            @readable.Label("HGAncol"),
            @readable.Label("H3"),
            @readable.Prev,
            @readable.Thm("AlternateInteriorAngles", () => alternateinteriorangles()),
          ],
        ),
      ],
    ),
  ))
}

///|
let euclidpropositioni_28_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_28")

///|
/// `EuclidPropositionI_28`
pub fn euclidpropositioni_28() -> @kernel.Thm {
  euclidpropositioni_28_c.get()
}

///|
/// OppositeSidesCongImpliesParallelogram
fn step_399() -> Unit raise {
  oppositesidescongimpliesparallelogram_c.set(@readable.prove(
    "\n  forall A B C D.  Quadrilateral A B C D  ==>\n    seg A B === seg C D  /\\   seg B C === seg D A\n    ==>  Parallelogram A B C D",
    @readable.steps_then(
      [
        @readable.intro_tac("forall A B C D, H1, H2"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(B = D) /\\  ~(C = D) /\\ \n    ~Collinear A B C /\\  ~Collinear B C D /\\  ~Collinear C D A /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.consider(
          "a c",
          "Line a /\\  A IN a /\\  B IN a   /\\ \n    Line c /\\  C IN c /\\  D IN c    ",
          "ac_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "b d",
          "Line b /\\  B IN b /\\  C IN b   /\\ \n    Line d /\\  D IN d /\\  A IN d    ",
          "bd_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  C IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  B IN m /\\  D IN m    ",
          "m_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    B NOTIN l /\\  D NOTIN l /\\  A NOTIN m  /\\  C NOTIN m",
          "notBDlACm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Label("TetraABCD"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg A C === seg C A  /\\   seg B D === seg D B",
          "seg_refl",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Thm("C2Reflexive", () => c2reflexive()),
              @readable.Thm("SegmentSymmetry", () => segmentsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,B,C cong C,D,A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Thm("SSS", () => sss()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C A === angle D A C  /\\   angle C A B === angle A C D",
          "BCAeqDAC",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    seg C D === seg A B",
          "CDeqAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Thm("SEGMENT", () => segment()),
              @readable.Label("H2"),
              @readable.Thm("C2Symmetric", () => c2symmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    B,C,D cong D,A,B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Label("H2"),
              @readable.Prev,
              @readable.Label("seg_refl"),
              @readable.Thm("SSS", () => sss()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D B === angle A B D  /\\   angle D B C === angle B D A  /\\   angle C B D === angle A D B",
          "CDBeqABD",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("TriangleCong_DEF", () => trianglecong_def()),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(B,D same_side l)  \\/  ~(A,C same_side m)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("l_line"),
              @readable.Label("m_line"),
              @readable.Thm(
                "FiveChoicesQuadrilateral",
                () => fivechoicesquadrilateral(),
              ),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "Case1 | Ansim_mC    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["~(B,D same_side l)", "~(A,C same_side m)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      ~(D,B same_side l)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("l_line"),
                      @readable.Label("notBDlACm"),
                      @readable.Prev,
                      @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      a parallel c  /\\   b parallel d",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ac_line"),
                      @readable.Label("l_line"),
                      @readable.Label("TetraABCD"),
                      @readable.Label("notBDlACm"),
                      @readable.Prev,
                      @readable.Label("BCAeqDAC"),
                      @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                      @readable.Thm(
                        "AlternateInteriorAngles",
                        () => alternateinteriorangles(),
                      ),
                      @readable.Label("bd_line"),
                      @readable.Label("BCAeqDAC"),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("ac_line"),
                    @readable.Label("bd_line"),
                    @readable.Prev,
                    @readable.Thm("Parallelogram_DEF", () => parallelogram_def()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "\n      b parallel d",
                  "bparalleld",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("bd_line"),
                      @readable.Label("m_line"),
                      @readable.Label("TetraABCD"),
                      @readable.Label("notBDlACm"),
                      @readable.Prev,
                      @readable.Label("CDBeqABD"),
                      @readable.Thm(
                        "AlternateInteriorAngles",
                        () => alternateinteriorangles(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      c parallel a",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("ac_line"),
                      @readable.Label("m_line"),
                      @readable.Label("TetraABCD"),
                      @readable.Label("notBDlACm"),
                      @readable.Label("Ansim_mC"),
                      @readable.Label("CDBeqABD"),
                      @readable.Thm(
                        "AlternateInteriorAngles",
                        () => alternateinteriorangles(),
                      ),
                    ],
                  ),
                ),
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1"),
                    @readable.Label("ac_line"),
                    @readable.Label("bd_line"),
                    @readable.Label("bparalleld"),
                    @readable.Prev,
                    @readable.Thm("ParallelSymmetry", () => parallelsymmetry()),
                    @readable.Thm("Parallelogram_DEF", () => parallelogram_def()),
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
let oppositesidescongimpliesparallelogram_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeSidesCongImpliesParallelogram")

///|
/// `OppositeSidesCongImpliesParallelogram`
pub fn oppositesidescongimpliesparallelogram() -> @kernel.Thm {
  oppositesidescongimpliesparallelogram_c.get()
}

///|
/// OppositeAnglesCongImpliesParallelogramHelp
fn step_403() -> Unit raise {
  oppositeanglescongimpliesparallelogramhelp_c.set(@readable.prove(
    "\n  forall A B C D a c.  Quadrilateral A B C D  ==>\n    angle A B C === angle C D A  /\\   angle D A B === angle B C D  ==>\n    Line a /\\  A IN a /\\  B IN a  ==>  Line c  /\\  C IN c /\\  D IN c\n    ==>  a parallel c",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D a c, H1, H2, a_line, c_line"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(A = D) /\\  ~(B = C) /\\  ~(B = D) /\\  ~(C = D) /\\ \n    ~Collinear A B C /\\  ~Collinear B C D /\\  ~Collinear C D A /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle C D A === angle A B C  /\\   angle B C D === angle D A B",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H2"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "l m",
          "Line l /\\  A IN l /\\  C IN l  /\\ \n    Line m /\\  B IN m /\\  D IN m    ",
          "lm_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "b d",
          "Line b /\\  B IN b /\\  C IN b   /\\   Line d /\\  D IN d /\\  A IN d    ",
          "bd_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    A NOTIN c /\\  B NOTIN c /\\  A NOTIN b /\\  D NOTIN b /\\  B NOTIN d /\\  C NOTIN d",
          "point_off_line",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Label("bd_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("TetraABCD"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A IN int_triangle B C D  \\/  B IN int_triangle C D A  \\/\n    C IN int_triangle D A B  \\/  D IN int_triangle A B C)",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "A IN int_triangle B C D  \\/  B IN int_triangle C D A  \\/\n      C IN int_triangle D A B  \\/  D IN int_triangle A B C",
                "Con",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      angle B C D <_ang angle D A B  \\/  angle C D A <_ang angle A B C  \\/\n      angle D A B <_ang angle B C D  \\/  angle A B C <_ang angle C D A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("TetraABCD"),
                    @readable.Prev,
                    @readable.Thm(
                      "EuclidPropositionI_21",
                      () => euclidpropositioni_21(),
                    ),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("H2'"),
                  @readable.Label("H2"),
                  @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    ConvexQuadrilateral A B C D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("lm_line"),
              @readable.Prev,
              @readable.Thm(
                "FiveChoicesQuadrilateral",
                () => fivechoicesquadrilateral(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle B C D  /\\   B IN int_angle C D A  /\\ \n    C IN int_angle D A B  /\\   D IN int_angle A B C",
          "AintBCD",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("ConvexQuad_DEF", () => convexquad_def())],
          ),
        ),
        @readable.have(
          "\n    B,A same_side c  /\\   B,C same_side d",
          "Bsim_cA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Label("bd_line"),
              @readable.Prev,
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    A,D same_side b",
          "Asim_bD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("bd_line"),
              @readable.Label("c_line"),
              @readable.Label("AintBCD"),
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.assuming("~(a parallel c)", "Con", @readable.by(@readable.fol, [])),
        @readable.consider(
          "G",
          "G IN a /\\  G IN c    ",
          "Gac",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("a_line"),
              @readable.Label("c_line"),
              @readable.Thm("PARALLEL", () => parallel()),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.have(
          "\n    Collinear A B G /\\  Collinear D G C /\\  Collinear C G D",
          "ABGcol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("a_line"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("c_line"),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(G = A) /\\  ~(G = B) /\\  ~(G = C) /\\  ~(G = D)",
          "GnotABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Gac"),
              @readable.Label("ABGcol"),
              @readable.Label("TetraABCD"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B G C /\\  ~Collinear A D G",
          "BGCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("c_line"),
              @readable.Label("Gac"),
              @readable.Label("GnotABCD"),
              @readable.Label("point_off_line"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear B C G /\\  ~Collinear G B C /\\  ~Collinear G A D /\\  ~Collinear A G D",
          "BCGncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN b /\\  G NOTIN d",
          "notGb",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("bd_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("BGCncol"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    G NOTIN Open (B, A)",
          "notBGA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Bsim_cA"),
              @readable.Label("Gac"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    B NOTIN Open (A, G)",
          "notABG",
          @readable.steps(
            [
              @readable.assuming(
                "~(B NOTIN Open (A, G))",
                "Con",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      B IN Open (A, G)",
                "ABG",
                @readable.by(
                  @readable.fol,
                  [@readable.Prev, @readable.Thm("NOTIN", () => notin())],
                ),
              ),
              @readable.have(
                "\n      ray A B = ray A G",
                "rABrAG",
                @readable.by(
                  @readable.fol,
                  [@readable.Prev, @readable.Thm("IntervalRay", () => intervalray())],
                ),
              ),
              @readable.have(
                "\n      ~(A,G same_side b)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("ABG"),
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~(D,G same_side b)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("point_off_line"),
                    @readable.Label("notGb"),
                    @readable.Label("Asim_bD"),
                    @readable.Prev,
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.have(
                "\n      D NOTIN ray C G",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("notGb"),
                    @readable.Prev,
                    @readable.Thm("RaySameSide", () => raysameside()),
                    @readable.Label("TetraABCD"),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      C IN Open (D, G)",
                "DCG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("GnotABCD"),
                    @readable.Label("ABGcol"),
                    @readable.Prev,
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.consider(
                "M",
                "D IN Open (C, M)    ",
                "CDM",
                @readable.by(
                  @readable.fol,
                  [@readable.Label("TetraABCD"), @readable.Thm("B2'", () => b2_p())],
                ),
              ),
              @readable.have(
                "\n      D IN Open (G, M)",
                "GDM",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Label("DCG"),
                    @readable.Thm(
                      "TransitivityBetweennessHelp",
                      () => transitivitybetweennesshelp(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle C D A suppl angle A D M  /\\   angle A B C suppl angle C B G",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("TetraABCD"),
                    @readable.Label("CDM"),
                    @readable.Label("ABG"),
                    @readable.Thm(
                      "SupplementaryAngles_DEF",
                      () => supplementaryangles_def(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle M D A === angle G B C",
                "MDAeqGBC",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H2'"),
                    @readable.Thm(
                      "SupplementsCongAnglesCong",
                      () => supplementsconganglescong(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G A D <_ang angle M D A  /\\   angle G B C <_ang angle D C B",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("BCGncol"),
                    @readable.Label("BGCncol"),
                    @readable.Label("GDM"),
                    @readable.Label("DCG"),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm(
                      "EuclidPropositionI_16",
                      () => euclidpropositioni_16(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G A D <_ang angle D C B",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("BCGncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Label("MDAeqGBC"),
                    @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                    @readable.Thm(
                      "AngleOrderTransitivity",
                      () => angleordertransitivity(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle D A B <_ang angle B C D",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("rABrAG"),
                    @readable.Thm("Angle_DEF", () => angle_def()),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("H2"),
                  @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN Open (G, B)",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "~(A NOTIN Open (G, B))",
                "Con",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "\n      A IN Open (B, G)",
                "BAG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ray B A = ray B G",
                "rBArBG",
                @readable.by(
                  @readable.fol,
                  [@readable.Prev, @readable.Thm("IntervalRay", () => intervalray())],
                ),
              ),
              @readable.have(
                "\n      ~(B,G same_side d)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("BAG"),
                    @readable.Thm("SameSide_DEF", () => sameside_def()),
                  ],
                ),
              ),
              @readable.have(
                "\n      ~(C,G same_side d)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("point_off_line"),
                    @readable.Label("notGb"),
                    @readable.Label("Bsim_cA"),
                    @readable.Prev,
                    @readable.Thm("SameSideTransitive", () => samesidetransitive()),
                  ],
                ),
              ),
              @readable.have(
                "\n      C NOTIN ray D G",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("bd_line"),
                    @readable.Label("notGb"),
                    @readable.Prev,
                    @readable.Thm("RaySameSide", () => raysameside()),
                    @readable.Label("TetraABCD"),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("IN_SING", () => @sets.in_sing()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "\n      D IN Open (C, G)",
                "CDG",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("GnotABCD"),
                    @readable.Label("ABGcol"),
                    @readable.Prev,
                    @readable.Thm("IN_Ray", () => in_ray()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.consider(
                "M",
                "C IN Open (D, M)    ",
                "DCM",
                @readable.by(
                  @readable.fol,
                  [@readable.Thm("B2'", () => b2_p()), @readable.Label("TetraABCD")],
                ),
              ),
              @readable.have(
                "\n      C IN Open (G, M)",
                "GCM",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Label("CDG"),
                    @readable.Thm(
                      "TransitivityBetweennessHelp",
                      () => transitivitybetweennesshelp(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle B C D suppl angle M C B  /\\   angle D A B suppl angle G A D",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("TetraABCD"),
                    @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    @readable.Label("DCM"),
                    @readable.Label("BAG"),
                    @readable.Thm(
                      "SupplementaryAngles_DEF",
                      () => supplementaryangles_def(),
                    ),
                    @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle M C B === angle G A D",
                "GADeqMCB",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("H2'"),
                    @readable.Thm(
                      "SupplementsCongAnglesCong",
                      () => supplementsconganglescong(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G B C <_ang angle M C B  /\\   angle G A D <_ang angle C D A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("BGCncol"),
                    @readable.Label("GCM"),
                    @readable.Label("BCGncol"),
                    @readable.Label("CDG"),
                    @readable.Thm("B1'", () => b1_p()),
                    @readable.Thm(
                      "EuclidPropositionI_16",
                      () => euclidpropositioni_16(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle G B C <_ang angle C D A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("BCGncol"),
                    @readable.Thm("ANGLE", () => angle()),
                    @readable.Label("GADeqMCB"),
                    @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
                    @readable.Thm(
                      "AngleOrderTransitivity",
                      () => angleordertransitivity(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      angle A B C <_ang angle C D A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("rBArBG"),
                    @readable.Thm("Angle_DEF", () => angle_def()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Prev,
                  @readable.Label("H2"),
                  @readable.Thm("AngleTrichotomy1", () => angletrichotomy1()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("TetraABCD"),
            @readable.Label("GnotABCD"),
            @readable.Label("ABGcol"),
            @readable.Label("notABG"),
            @readable.Label("notBGA"),
            @readable.Prev,
            @readable.Thm("B3'", () => b3_p()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let oppositeanglescongimpliesparallelogramhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeAnglesCongImpliesParallelogramHelp")

///|
/// `OppositeAnglesCongImpliesParallelogramHelp`
pub fn oppositeanglescongimpliesparallelogramhelp() -> @kernel.Thm {
  oppositeanglescongimpliesparallelogramhelp_c.get()
}

///|
/// OppositeAnglesCongImpliesParallelogram
fn step_405() -> Unit raise {
  oppositeanglescongimpliesparallelogram_c.set(@readable.prove(
    "\n  forall A B C D. Quadrilateral A B C D  ==>\n    angle A B C === angle C D A  /\\   angle D A B === angle B C D\n    ==>  Parallelogram A B C D",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C D, H1, H2"),
        @readable.have(
          "\n    Quadrilateral B C D A",
          "QuadBCDA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("QuadrilateralSymmetry", () => quadrilateralsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A = B) /\\  ~(B = C) /\\  ~(C = D) /\\  ~(D = A) /\\  ~Collinear B C D /\\  ~Collinear D A B",
          "TetraABCD",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("Quadrilateral_DEF", () => quadrilateral_def()),
              @readable.Thm("Tetralateral_DEF", () => tetralateral_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle B C D === angle D A B",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("TetraABCD"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("H2"),
              @readable.Thm("C5Symmetric", () => c5symmetric()),
            ],
          ),
        ),
        @readable.consider(
          "a",
          "Line a /\\  A IN a /\\  B IN a    ",
          "a_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "b",
          "Line b /\\  B IN b /\\  C IN b    ",
          "b_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "c",
          "Line c  /\\  C IN c /\\  D IN c    ",
          "c_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "d",
          "Line d /\\  D IN d /\\  A IN d    ",
          "d_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("TetraABCD"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("QuadBCDA"),
            @readable.Label("H2"),
            @readable.Label("H2'"),
            @readable.Label("a_line"),
            @readable.Label("b_line"),
            @readable.Label("c_line"),
            @readable.Label("d_line"),
            @readable.Thm(
              "OppositeAnglesCongImpliesParallelogramHelp",
              () => oppositeanglescongimpliesparallelogramhelp(),
            ),
            @readable.Thm("Parallelogram_DEF", () => parallelogram_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let oppositeanglescongimpliesparallelogram_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OppositeAnglesCongImpliesParallelogram")

///|
/// `OppositeAnglesCongImpliesParallelogram`
pub fn oppositeanglescongimpliesparallelogram() -> @kernel.Thm {
  oppositeanglescongimpliesparallelogram_c.get()
}

///|
/// P
fn step_407() -> Unit raise {
  p_c.set(@readable.newaxiom(@readable.parse_qproof(";∀P l. Line l ∧ P ∉ l  ⇒ ∃! m. Line m ∧ P ∈ m ∧ m ∥ l")))
}

///|
let p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P")

///|
/// `P`
pub fn p() -> @kernel.Thm {
  p_c.get()
}

///|
/// RichterHilbertAxiomGeometry/HilbertAxiom_read.ml:3206
fn step_408() -> Unit raise {
  @readable.newconstant("μ", @term_syntax.parse_type("((Point) -> Bool) -> Real"))
}

///|
/// AMa
fn step_409() -> Unit raise {
  ama_c.set(@readable.newaxiom(@readable.parse_qproof(";∀α. Angle α  ⇒  &0 < μ α ∧ μ α < &180")))
}

///|
let ama_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AMa")

///|
/// `AMa`
pub fn ama() -> @kernel.Thm {
  ama_c.get()
}

///|
/// AMb
fn step_410() -> Unit raise {
  amb_c.set(@readable.newaxiom(@readable.parse_qproof(";∀α. Right α  ⇒  μ α  = &90")))
}

///|
let amb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AMb")

///|
/// `AMb`
pub fn amb() -> @kernel.Thm {
  amb_c.get()
}

///|
/// AMc
fn step_411() -> Unit raise {
  amc_c.set(@readable.newaxiom(@readable.parse_qproof(";∀α β. Angle α ∧ Angle β ∧ α ≡ β  ⇒  μ α = μ β")))
}

///|
let amc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AMc")

///|
/// `AMc`
pub fn amc() -> @kernel.Thm {
  amc_c.get()
}

///|
/// AMd
fn step_412() -> Unit raise {
  amd_c.set(@readable.newaxiom(@readable.parse_qproof(";∀A O B P. P ∈ int_angle A O B  ⇒  μ (∡ A O B) = μ (∡ A O P) + μ (∡ P O B)")))
}

///|
let amd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AMd")

///|
/// `AMd`
pub fn amd() -> @kernel.Thm {
  amd_c.get()
}

///|
/// ConverseAlternateInteriorAngles
fn step_413() -> Unit raise {
  conversealternateinteriorangles_c.set(@readable.prove(
    "\n  forall A B C E l m.  Line l /\\  A IN l /\\  E IN l  ==>\n    Line m /\\  B IN m /\\  C IN m  ==> Line t /\\  A IN t /\\  B IN t  ==>\n    ~(A = E) /\\  ~(B = C) /\\  ~(A = B) /\\  E NOTIN t /\\  C NOTIN t  ==>\n    ~(C,E same_side t)  ==>  l parallel m\n    ==>  angle E A B === angle C B A",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall A B C E l m, l_line, m_line, t_line, Distinct, Cnsim_tE, para_lm",
        ),
        @readable.have(
          "\n    ~Collinear C B A",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Label("t_line"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN m /\\  Angle (angle C B A)",
          "notAm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.consider(
          "D",
          "~(A = D) /\\  D NOTIN t /\\  ~(C,D same_side t) /\\  seg A D === seg A E  /\\   angle B A D === angle C B A    ",
          "Dexists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4OppositeSide", () => c4oppositeside()),
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Label("t_line"),
            ],
          ),
        ),
        @readable.consider(
          "k",
          "Line k /\\  A IN k /\\  D IN k    ",
          "k_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    k parallel m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("m_line"),
              @readable.Label("t_line"),
              @readable.Label("Dexists"),
              @readable.Label("Distinct"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
              @readable.Thm("AlternateInteriorAngles", () => alternateinteriorangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    k = l",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("notAm"),
              @readable.Label("l_line"),
              @readable.Label("k_line"),
              @readable.Prev,
              @readable.Label("para_lm"),
              @readable.Thm("P", () => p()),
            ],
          ),
        ),
        @readable.have(
          "\n    D,E same_side t  /\\   A NOTIN Open (D, E)  /\\   Collinear A E D",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_line"),
              @readable.Label("Distinct"),
              @readable.Label("Dexists"),
              @readable.Label("Cnsim_tE"),
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
              @readable.Thm("NOTIN", () => notin()),
              @readable.Prev,
              @readable.Label("k_line"),
              @readable.Label("l_line"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    ray A D = ray A E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Distinct"),
              @readable.Prev,
              @readable.Thm("IN_Ray", () => in_ray()),
              @readable.Label("Dexists"),
              @readable.Thm("RayWellDefined", () => raywelldefined()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("IN_SING", () => @sets.in_sing()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("Dexists"),
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Thm("Angle_DEF", () => angle_def()),
          ],
        ),
      ],
    ),
  ))
}

///|
let conversealternateinteriorangles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConverseAlternateInteriorAngles")

///|
/// `ConverseAlternateInteriorAngles`
pub fn conversealternateinteriorangles() -> @kernel.Thm {
  conversealternateinteriorangles_c.get()
}

///|
/// HilbertTriangleSum
fn step_415() -> Unit raise {
  hilberttrianglesum_c.set(@readable.prove(
    "\n  forall A B C.  ~Collinear A B C\n    ==>  ?E F. B IN Open (E, F)  /\\   C IN int_angle A B F  /\\ \n           angle E B A === angle C A B  /\\   angle C B F === angle B C A",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, ABCncol"),
        @readable.have(
          "\n    ~(A = B) /\\  ~(A = C) /\\  ~(B = C) /\\  ~Collinear C A B",
          "Distinct",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABCncol"),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "l",
          "Line l /\\  A IN l /\\  C IN l    ",
          "l_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "x",
          "Line x /\\  A IN x /\\  B IN x    ",
          "x_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.consider(
          "y",
          "Line y /\\  B IN y /\\  C IN y    ",
          "y_line",
          @readable.by(
            @readable.fol,
            [@readable.Label("Distinct"), @readable.Thm("I1", () => i1())],
          ),
        ),
        @readable.have(
          "\n    C NOTIN x",
          "notCx",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("x_line"),
              @readable.Label("ABCncol"),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    Angle (angle C A B)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABCncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("ANGLE", () => angle()),
            ],
          ),
        ),
        @readable.consider(
          "E",
          "~(B = E) /\\  E NOTIN x /\\  ~(C,E same_side x) /\\  seg B E === seg A B /\\  angle A B E === angle C A B    ",
          "Eexists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("C4OppositeSide", () => c4oppositeside()),
              @readable.Prev,
              @readable.Label("Distinct"),
              @readable.Label("x_line"),
              @readable.Label("notCx"),
            ],
          ),
        ),
        @readable.consider(
          "m",
          "Line m /\\  B IN m /\\  E IN m    ",
          "m_line",
          @readable.by(@readable.fol, [@readable.Prev, @readable.Thm("I1", () => i1())]),
        ),
        @readable.have(
          "\n    angle E B A === angle C A B",
          "EBAeqCAB",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Eexists"),
              @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    m parallel l",
          "para_lm",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Label("x_line"),
              @readable.Label("Eexists"),
              @readable.Label("Distinct"),
              @readable.Label("notCx"),
              @readable.Prev,
              @readable.Thm("AlternateInteriorAngles", () => alternateinteriorangles()),
            ],
          ),
        ),
        @readable.have(
          "\n    m INTER l = {}",
          "ml0",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("PARALLEL", () => parallel())],
          ),
        ),
        @readable.have(
          "\n    C NOTIN m /\\  A NOTIN m",
          "notACm",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("l_line"),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
              @readable.Thm("DisjointOneNotOther", () => disjointonenotother()),
            ],
          ),
        ),
        @readable.consider(
          "F",
          "B IN Open (E, F)    ",
          "EBF",
          @readable.by(
            @readable.fol,
            [@readable.Label("Eexists"), @readable.Thm("B2'", () => b2_p())],
          ),
        ),
        @readable.have(
          "\n    ~(B = F) /\\  F IN m",
          "EBF'",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("B1'", () => b1_p()),
              @readable.Label("m_line"),
              @readable.Thm("BetweenLinear", () => betweenlinear()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear A B F /\\  F NOTIN x",
          "ABFncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EBF'"),
              @readable.Label("m_line"),
              @readable.Label("notACm"),
              @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("x_line"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(E,F same_side x) /\\  ~(E,F same_side y)",
          "Ensim_yF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EBF"),
              @readable.Label("x_line"),
              @readable.Label("y_line"),
              @readable.Thm("SameSide_DEF", () => sameside_def()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,F same_side x",
          "Csim_xF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("x_line"),
              @readable.Label("notCx"),
              @readable.Label("Eexists"),
              @readable.Label("ABFncol"),
              @readable.Label("Eexists"),
              @readable.Prev,
              @readable.Thm("AtMost2Sides", () => atmost2sides()),
            ],
          ),
        ),
        @readable.have(
          "\n    C,A same_side m",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("l_line"),
              @readable.Label("ml0"),
              @readable.Thm(
                "DisjointLinesImplySameSide",
                () => disjointlinesimplysameside(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    C IN int_angle A B F",
          "CintABF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABFncol"),
              @readable.Label("x_line"),
              @readable.Label("m_line"),
              @readable.Label("EBF'"),
              @readable.Label("notCx"),
              @readable.Label("notACm"),
              @readable.Label("Csim_xF"),
              @readable.Prev,
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    A IN int_angle C B E",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EBF"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Prev,
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm(
                "InteriorReflectionInterior",
                () => interiorreflectioninterior(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    A NOTIN y  /\\   A,E same_side y",
          "Asim_yE",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("y_line"),
              @readable.Label("m_line"),
              @readable.Prev,
              @readable.Thm("InteriorUse", () => interioruse()),
            ],
          ),
        ),
        @readable.have(
          "\n    E NOTIN y /\\  F NOTIN y",
          "notEFy",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("y_line"),
              @readable.Label("m_line"),
              @readable.Label("EBF'"),
              @readable.Label("Eexists"),
              @readable.Label("EBF'"),
              @readable.Thm("I1", () => i1()),
              @readable.Thm("Collinear_DEF", () => collinear_def()),
              @readable.Label("notACm"),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.have(
          "\n    E,A same_side y",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("y_line"),
              @readable.Prev,
              @readable.Label("Asim_yE"),
              @readable.Thm("SameSideSymmetric", () => samesidesymmetric()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~(A,F same_side y)",
          "Ansim_yF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("y_line"),
              @readable.Label("notEFy"),
              @readable.Label("Asim_yE"),
              @readable.Prev,
              @readable.Label("Ensim_yF"),
              @readable.Thm("SameSideTransitive", () => samesidetransitive()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle F B C === angle A C B",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("m_line"),
              @readable.Label("EBF'"),
              @readable.Label("l_line"),
              @readable.Label("y_line"),
              @readable.Label("EBF'"),
              @readable.Label("Distinct"),
              @readable.Label("notEFy"),
              @readable.Label("Asim_yE"),
              @readable.Label("Ansim_yF"),
              @readable.Label("para_lm"),
              @readable.Thm(
                "ConverseAlternateInteriorAngles",
                () => conversealternateinteriorangles(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("EBF"),
            @readable.Label("CintABF"),
            @readable.Label("EBAeqCAB"),
            @readable.Prev,
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
          ],
        ),
      ],
    ),
  ))
}

///|
let hilberttrianglesum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HilbertTriangleSum")

///|
/// `HilbertTriangleSum`
pub fn hilberttrianglesum() -> @kernel.Thm {
  hilberttrianglesum_c.get()
}

///|
/// EuclidPropositionI_13
fn step_417() -> Unit raise {
  euclidpropositioni_13_c.set(@readable.prove(
    "\n  forall A O B A'.  ~Collinear A O B  /\\   O IN Open (A, A')\n    ==>  mu (angle A O B) + mu (angle B O A') = &180",
    @readable.steps_then(
      [@readable.intro_tac("forall A O B A', H1 H2")],
      @readable.case_split(
        "RightAOB | notRightAOB    ",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["Right (angle A O B)", "~Right (angle A O B)"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.have(
                  "\n      Right (angle B O A')  /\\   mu (angle A O B) = &90  /\\   mu (angle B O A') = &90",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Label("H2"),
                      @readable.Prev,
                      @readable.Thm(
                        "RightImpliesSupplRight",
                        () => rightimpliessupplright(),
                      ),
                      @readable.Thm("AMb", () => amb()),
                    ],
                  ),
                ),
                @readable.by(@readable.real_arithmetic, [@readable.Prev]),
              ],
            ),
            @readable.steps_then(
              [
                @readable.have(
                  "\n      ~(A = O) /\\  ~(O = B)",
                  "Distinct",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Thm(
                        "NonCollinearImpliesDistinct",
                        () => noncollinearimpliesdistinct(),
                      ),
                    ],
                  ),
                ),
                @readable.consider(
                  "l",
                  "Line l /\\  O IN l /\\  A IN l /\\  A' IN l    ",
                  "l_line",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("I1", () => i1()),
                      @readable.Label("H2"),
                      @readable.Thm("BetweenLinear", () => betweenlinear()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      B NOTIN l",
                  "notBl",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("Distinct"),
                      @readable.Thm("I1", () => i1()),
                      @readable.Thm("Collinear_DEF", () => collinear_def()),
                      @readable.Label("H1"),
                      @readable.Thm("NOTIN", () => notin()),
                    ],
                  ),
                ),
                @readable.consider(
                  "F",
                  "Right (angle O A F)  /\\   Angle (angle O A F)    ",
                  "RightOAF",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Thm(
                        "EuclidPropositionI_11",
                        () => euclidpropositioni_11(),
                      ),
                      @readable.Thm("RightImpliesAngle", () => rightimpliesangle()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ?! r. Ray r /\\  ?E. ~(O = E) /\\  r = ray O E /\\  E NOTIN l /\\  E,B same_side l /\\  angle A O E === angle O A F",
                  "",
                  @readable.by(
                    @readable.simplify,
                    [
                      @readable.Thm("C4", () => c4()),
                      @readable.Prev,
                      @readable.Label("Distinct"),
                      @readable.Label("l_line"),
                      @readable.Label("notBl"),
                    ],
                  ),
                ),
                @readable.consider(
                  "E",
                  "~(O = E)  /\\   E NOTIN l  /\\   E,B same_side l  /\\   angle A O E === angle O A F    ",
                  "Eexists",
                  @readable.by(@readable.fol, [@readable.Prev]),
                ),
                @readable.have(
                  "\n      ~Collinear A O E",
                  "AOEncol",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Label("l_line"),
                      @readable.Prev,
                      @readable.Thm("NonCollinearRaa", () => noncollinearraa()),
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      Right (angle A O E)",
                  "RightAOE",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Label("RightOAF"),
                      @readable.Label("Eexists"),
                      @readable.Thm(
                        "CongRightImpliesRight",
                        () => congrightimpliesright(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      Right (angle E O A')  /\\   mu (angle A O E) = &90  /\\   mu (angle E O A') = &90",
                  "RightEOA'",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("AOEncol"),
                      @readable.Label("H2"),
                      @readable.Prev,
                      @readable.Thm(
                        "RightImpliesSupplRight",
                        () => rightimpliessupplright(),
                      ),
                      @readable.Thm("AMb", () => amb()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(angle A O B === angle A O E)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("notRightAOB"),
                      @readable.Label("H1"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Label("RightAOE"),
                      @readable.Thm(
                        "CongRightImpliesRight",
                        () => congrightimpliesright(),
                      ),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(angle A O B = angle A O E)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("H1"),
                      @readable.Label("AOEncol"),
                      @readable.Thm("ANGLE", () => angle()),
                      @readable.Prev,
                      @readable.Thm("C5Reflexive", () => c5reflexive()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~(ray O B = ray O E)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [@readable.Prev, @readable.Thm("Angle_DEF", () => angle_def())],
                  ),
                ),
                @readable.have(
                  "\n      B NOTIN ray O E  /\\   O NOTIN Open (B, E)",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Prev,
                      @readable.Label("Eexists"),
                      @readable.Thm("RayWellDefined", () => raywelldefined()),
                      @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                      @readable.Thm("IN_SING", () => @sets.in_sing()),
                      @readable.Thm("NOTIN", () => notin()),
                      @readable.Label("l_line"),
                      @readable.Thm("B1'", () => b1_p()),
                      @readable.Thm("SameSide_DEF", () => sameside_def()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      ~Collinear O E B",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Prev,
                      @readable.Label("Eexists"),
                      @readable.Thm("IN_Ray", () => in_ray()),
                      @readable.Thm("NOTIN", () => notin()),
                    ],
                  ),
                ),
                @readable.have(
                  "\n      E IN int_angle A O B  \\/  B IN int_angle A O E",
                  "",
                  @readable.by(
                    @readable.fol,
                    [
                      @readable.Label("Distinct"),
                      @readable.Label("l_line"),
                      @readable.Label("Eexists"),
                      @readable.Label("notBl"),
                      @readable.Thm("AngleOrdering", () => angleordering()),
                      @readable.Prev,
                      @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
                      @readable.Thm(
                        "InteriorAngleSymmetry",
                        () => interioranglesymmetry(),
                      ),
                    ],
                  ),
                ),
              ],
              @readable.case_split(
                "EintAOB | BintAOE    ",
                @readable.by(@readable.fol, [@readable.Prev]),
                @list.List(["E IN int_angle A O B", "B IN int_angle A O E"]),
                @list.List(
                  [
                    @readable.steps(
                      [
                        @readable.have(
                          "\n        B IN int_angle E O A'",
                          "",
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("H2"),
                              @readable.Prev,
                              @readable.Thm(
                                "InteriorReflectionInterior",
                                () => interiorreflectioninterior(),
                              ),
                            ],
                          ),
                        ),
                        @readable.have(
                          "\n        mu (angle A O B) = mu (angle A O E) + mu (angle E O B)  /\\ \n        mu (angle E O A') = mu (angle E O B) + mu (angle B O A')",
                          "",
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("EintAOB"),
                              @readable.Prev,
                              @readable.Thm("AMd", () => amd()),
                            ],
                          ),
                        ),
                        @readable.by(
                          @readable.real_arithmetic,
                          [@readable.Prev, @readable.Label("RightEOA'")],
                        ),
                      ],
                    ),
                    @readable.steps(
                      [
                        @readable.have(
                          "\n        E IN int_angle B O A'",
                          "",
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("H2"),
                              @readable.Prev,
                              @readable.Thm(
                                "InteriorReflectionInterior",
                                () => interiorreflectioninterior(),
                              ),
                            ],
                          ),
                        ),
                        @readable.have(
                          "\n        mu (angle A O E) = mu (angle A O B) + mu (angle B O E)  /\\ \n        mu (angle B O A') = mu (angle B O E) + mu (angle E O A')",
                          "",
                          @readable.by(
                            @readable.fol,
                            [
                              @readable.Label("BintAOE"),
                              @readable.Prev,
                              @readable.Thm("AMd", () => amd()),
                            ],
                          ),
                        ),
                        @readable.by(
                          @readable.real_arithmetic,
                          [@readable.Prev, @readable.Label("RightEOA'")],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let euclidpropositioni_13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EuclidPropositionI_13")

///|
/// `EuclidPropositionI_13`
pub fn euclidpropositioni_13() -> @kernel.Thm {
  euclidpropositioni_13_c.get()
}

///|
/// TriangleSum
fn step_423() -> Unit raise {
  trianglesum_c.set(@readable.prove(
    "\n  forall A B C. ~Collinear A B C\n    ==>  mu (angle A B C) + mu (angle B C A) + mu (angle C A B) = &180",
    @readable.steps(
      [
        @readable.intro_tac("forall A B C, ABCncol"),
        @readable.have(
          "\n    ~Collinear C A B  /\\   ~Collinear B C A",
          "CABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABCncol"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.consider(
          "E F",
          "B IN Open (E, F)  /\\   C IN int_angle A B F  /\\   angle E B A === angle C A B  /\\   angle C B F === angle B C A    ",
          "EBF",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ABCncol"),
              @readable.Thm("HilbertTriangleSum", () => hilberttrianglesum()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear C B F  /\\   ~Collinear A B F  /\\   Collinear E B F  /\\   ~(B = E)",
          "CBFncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("InteriorAngleSymmetry", () => interioranglesymmetry()),
              @readable.Thm("InteriorEZHelp", () => interiorezhelp()),
              @readable.Thm("IN_InteriorAngle", () => in_interiorangle()),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear E B A",
          "EBAncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    mu (angle A B F) = mu (angle A B C) + mu (angle C B F)",
          "muCintABF",
          @readable.by(
            @readable.fol,
            [@readable.Label("EBF"), @readable.Thm("AMd", () => amd())],
          ),
        ),
        @readable.have(
          "\n    mu (angle E B A) + mu (angle A B F) = &180",
          "suppl180",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("EBAncol"),
              @readable.Label("EBF"),
              @readable.Thm("EuclidPropositionI_13", () => euclidpropositioni_13()),
            ],
          ),
        ),
        @readable.have(
          "\n    mu (angle C A B) = mu (angle E B A)  /\\   mu (angle B C A) = mu (angle C B F)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CABncol"),
              @readable.Label("EBAncol"),
              @readable.Label("CBFncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Label("EBF"),
              @readable.Thm("AMc", () => amc()),
            ],
          ),
        ),
        @readable.by(
          @readable.real_arithmetic,
          [@readable.Label("suppl180"), @readable.Label("muCintABF"), @readable.Prev],
        ),
      ],
    ),
  ))
}

///|
let trianglesum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TriangleSum")

///|
/// `TriangleSum`
pub fn trianglesum() -> @kernel.Thm {
  trianglesum_c.get()
}

///|
/// CircleConvex2_THM
fn step_427() -> Unit raise {
  circleconvex2_thm_c.set(@readable.prove(
    "\n  forall O A B C. ~Collinear A O B  ==>  B IN Open (A, C)  ==>\n    seg O A <__ seg O B  \\/  seg O A === seg O B\n    ==>  seg O B <__ seg O C",
    @readable.steps(
      [
        @readable.intro_tac("forall O A B C, H1, H2, H3"),
        @readable.have(
          "\n    ~Collinear O B A /\\  ~Collinear B O A /\\  ~Collinear O A B /\\  ~(O = A) /\\  ~(O = B)",
          "H1'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
              @readable.Thm(
                "NonCollinearImpliesDistinct",
                () => noncollinearimpliesdistinct(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    B IN Open (C, A) /\\  ~(C = A) /\\  ~(C = B) /\\  Collinear A B C /\\  Collinear B A C",
          "H2'",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("B1'", () => b1_p()),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear O B C /\\  ~Collinear O C B",
          "OBCncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Prev,
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
              @readable.Thm("CollinearSymmetry", () => collinearsymmetry()),
            ],
          ),
        ),
        @readable.have(
          "\n    ~Collinear O A C",
          "OABncol",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Label("H2'"),
              @readable.Thm(
                "NoncollinearityExtendsToLine",
                () => noncollinearityextendstoline(),
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O C B <_ang angle O B A",
          "OCBlessOBA",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OBCncol"),
              @readable.Label("H2'"),
              @readable.Thm("ExteriorAngle", () => exteriorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O A B <_ang angle O B C",
          "OABlessOBC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1'"),
              @readable.Label("H2"),
              @readable.Thm("ExteriorAngle", () => exteriorangle()),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O B A <_ang angle B A O  \\/  angle O B A === angle B A O",
          "",
          @readable.steps(
            [
              @readable.assuming(
                "seg O A === seg O B",
                "Cong",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H3"),
                    @readable.Label("H1'"),
                    @readable.Thm(
                      "EuclidPropositionI_18",
                      () => euclidpropositioni_18(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "\n      seg O B === seg O A",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H1'"),
                    @readable.Thm("SEGMENT", () => segment()),
                    @readable.Prev,
                    @readable.Thm("C2Symmetric", () => c2symmetric()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("H1'"),
                  @readable.Prev,
                  @readable.Thm(
                    "IsoscelesCongBaseAngles",
                    () => isoscelescongbaseangles(),
                  ),
                  @readable.Thm("AngleSymmetry", () => anglesymmetry()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "\n    angle O B A <_ang angle O A B  \\/  angle O B A === angle O A B",
          "OBAlessOAB",
          @readable.by(
            @readable.fol,
            [@readable.Prev, @readable.Thm("AngleSymmetry", () => anglesymmetry())],
          ),
        ),
        @readable.have(
          "\n    angle O C B <_ang angle O B C",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("OCBlessOBA"),
              @readable.Prev,
              @readable.Label("OABlessOBC"),
              @readable.Label("OBCncol"),
              @readable.Label("H1'"),
              @readable.Label("OABncol"),
              @readable.Label("OBCncol"),
              @readable.Thm("ANGLE", () => angle()),
              @readable.Prev,
              @readable.Thm("AngleOrderTransitivity", () => angleordertransitivity()),
              @readable.Thm("AngleTrichotomy2", () => angletrichotomy2()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("OBCncol"),
            @readable.Prev,
            @readable.Thm("AngleSymmetry", () => anglesymmetry()),
            @readable.Thm("EuclidPropositionI_19", () => euclidpropositioni_19()),
          ],
        ),
      ],
    ),
  ))
}

///|
let circleconvex2_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CircleConvex2_THM")

///|
/// `CircleConvex2_THM`
pub fn circleconvex2_thm() -> @kernel.Thm {
  circleconvex2_thm_c.get()
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
  step_62()
  step_64()
  step_66()
  step_68()
  step_70()
  step_72()
  step_76()
  step_78()
  step_80()
  step_82()
  step_85()
  step_89()
  step_92()
  step_94()
  step_96()
  step_98()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_107()
  step_108()
  step_110()
  step_116()
  step_119()
  step_121()
  step_126()
  step_129()
  step_131()
  step_132()
  step_133()
  step_141()
  step_143()
  step_144()
  step_146()
  step_147()
  step_150()
  step_151()
  step_154()
  step_157()
  step_160()
  step_164()
  step_165()
  step_167()
  step_169()
  step_172()
  step_175()
  step_176()
  step_180()
  step_182()
  step_184()
  step_185()
  step_187()
  step_188()
  step_190()
  step_193()
  step_195()
  step_197()
  step_201()
  step_203()
  step_205()
  step_207()
  step_210()
  step_214()
  step_218()
  step_220()
  step_221()
  step_224()
  step_226()
  step_227()
  step_230()
  step_232()
  step_235()
  step_237()
  step_238()
  step_239()
  step_242()
  step_244()
  step_249()
  step_250()
  step_254()
  step_256()
  step_261()
  step_262()
  step_267()
  step_270()
  step_271()
  step_274()
  step_277()
  step_282()
  step_285()
  step_289()
  step_295()
  step_298()
  step_301()
  step_302()
  step_305()
  step_307()
  step_308()
  step_309()
  step_313()
  step_316()
  step_318()
  step_319()
  step_322()
  step_323()
  step_324()
  step_326()
  step_328()
  step_330()
  step_334()
  step_336()
  step_337()
  step_338()
  step_339()
  step_341()
  step_345()
  step_348()
  step_349()
  step_352()
  step_355()
  step_356()
  step_358()
  step_360()
  step_361()
  step_362()
  step_363()
  step_364()
  step_367()
  step_369()
  step_370()
  step_372()
  step_375()
  step_377()
  step_379()
  step_380()
  step_382()
  step_386()
  step_387()
  step_389()
  step_391()
  step_393()
  step_394()
  step_396()
  step_397()
  step_399()
  step_403()
  step_405()
  step_407()
  step_408()
  step_409()
  step_410()
  step_411()
  step_412()
  step_413()
  step_415()
  step_417()
  step_423()
  step_427()
}
