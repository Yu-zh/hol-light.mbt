// Translated from upstream RichterHilbertAxiomGeometry/Topology.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/Topology.ml:23
fn step_1() -> Unit raise {
  @readable.parseasinfix("∉", (11L, "right"))
}

///|
/// NOTIN
fn step_2() -> Unit raise {
  notin_c.set(@readable.newdefinition("∀ a : _, ∀ l : (_) -> Bool, (NOTIN : (_, (_) -> Bool) -> Bool)(a, l) == !IN(a, l)"))
}

///|
let notin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOTIN")

///|
/// `NOTIN`
pub fn notin() -> @kernel.Thm {
  notin_c.get()
}

///|
/// DIFF_UNION
fn step_3() -> Unit raise {
  diff_union_c.set(@readable.prove(
    "∀ u : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, DIFF(u, UNION(s, t)) == INTER(DIFF(u, s), DIFF(u, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let diff_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_UNION")

///|
/// `DIFF_UNION`
pub fn diff_union() -> @kernel.Thm {
  diff_union_c.get()
}

///|
/// DIFF_INTER
fn step_5() -> Unit raise {
  diff_inter_c.set(@readable.prove(
    "∀ u : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, DIFF(u, INTER(s, t)) == UNION(DIFF(u, s), DIFF(u, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let diff_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_INTER")

///|
/// `DIFF_INTER`
pub fn diff_inter() -> @kernel.Thm {
  diff_inter_c.get()
}

///|
/// DIFF_REFL
fn step_6() -> Unit raise {
  diff_refl_c.set(@readable.prove(
    "∀ u : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, u) → DIFF(u, DIFF(u, t)) == t",
    @readable.by(@readable.set, []),
  ))
}

///|
let diff_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_REFL")

///|
/// `DIFF_REFL`
pub fn diff_refl() -> @kernel.Thm {
  diff_refl_c.get()
}

///|
/// DIFF_SUBSET
fn step_7() -> Unit raise {
  diff_subset_c.set(@readable.prove(
    "∀ u : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) → SUBSET(DIFF(s, u), DIFF(t, u))",
    @readable.by(@readable.set, []),
  ))
}

///|
let diff_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_SUBSET")

///|
/// `DIFF_SUBSET`
pub fn diff_subset() -> @kernel.Thm {
  diff_subset_c.get()
}

///|
/// DOUBLE_DIFF_UNION
fn step_8() -> Unit raise {
  double_diff_union_c.set(@readable.prove(
    "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, DIFF(DIFF(A, s), t) == DIFF(A, UNION(s, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let double_diff_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOUBLE_DIFF_UNION")

///|
/// `DOUBLE_DIFF_UNION`
pub fn double_diff_union() -> @kernel.Thm {
  double_diff_union_c.get()
}

///|
/// SUBSET_COMPLEMENT
fn step_9() -> Unit raise {
  subset_complement_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ A : (_) -> Bool, SUBSET(s, A) → SUBSET(s, DIFF(A, t)) == (INTER(s, t) == {})",
    @readable.by(@readable.set, []),
  ))
}

///|
let subset_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_COMPLEMENT")

///|
/// `SUBSET_COMPLEMENT`
pub fn subset_complement() -> @kernel.Thm {
  subset_complement_c.get()
}

///|
/// COMPLEMENT_DISJOINT
fn step_10() -> Unit raise {
  complement_disjoint_c.set(@readable.prove(
    "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) → SUBSET(s, t) == (INTER(s, DIFF(A, t)) == {})",
    @readable.by(@readable.set, []),
  ))
}

///|
let complement_disjoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEMENT_DISJOINT")

///|
/// `COMPLEMENT_DISJOINT`
pub fn complement_disjoint() -> @kernel.Thm {
  complement_disjoint_c.get()
}

///|
/// COMPLEMENT_DUALITY
fn step_11() -> Unit raise {
  complement_duality_c.set(@readable.prove(
    "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) && SUBSET(t, A) → (s == t) == (DIFF(A, s) == DIFF(A, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let complement_duality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEMENT_DUALITY")

///|
/// `COMPLEMENT_DUALITY`
pub fn complement_duality() -> @kernel.Thm {
  complement_duality_c.get()
}

///|
/// COMPLEMENT_DUALITY_UNION
fn step_12() -> Unit raise {
  complement_duality_union_c.set(@readable.prove(
    "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) && SUBSET(t, A) && SUBSET((u : (_) -> Bool), A) → (s == UNION(t, u)) == (DIFF(A, s) == INTER(DIFF(A, t), DIFF(A, u)))",
    @readable.by(@readable.set, []),
  ))
}

///|
let complement_duality_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEMENT_DUALITY_UNION")

///|
/// `COMPLEMENT_DUALITY_UNION`
pub fn complement_duality_union() -> @kernel.Thm {
  complement_duality_union_c.get()
}

///|
/// SUBSET_DUALITY
fn step_13() -> Unit raise {
  subset_duality_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, u) → SUBSET(DIFF(s, u), DIFF(s, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let subset_duality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_DUALITY")

///|
/// `SUBSET_DUALITY`
pub fn subset_duality() -> @kernel.Thm {
  subset_duality_c.get()
}

///|
/// COMPLEMENT_INTER_DIFF
fn step_14() -> Unit raise {
  complement_inter_diff_c.set(@readable.prove(
    "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) → DIFF(s, t) == INTER(s, DIFF(A, t))",
    @readable.by(@readable.set, []),
  ))
}

///|
let complement_inter_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEMENT_INTER_DIFF")

///|
/// `COMPLEMENT_INTER_DIFF`
pub fn complement_inter_diff() -> @kernel.Thm {
  complement_inter_diff_c.get()
}

///|
/// INTERS_SUBSET
fn step_15() -> Unit raise {
  inters_subset_c.set(@readable.prove(
    "∀ f : ((_) -> Bool) -> Bool, ∀ t : (_) -> Bool, !(f == {}) && (∀ s : (_) -> Bool, IN(s, f) → SUBSET(s, t)) → SUBSET(INTERS(f), t)",
    @readable.by(@readable.set, []),
  ))
}

///|
let inters_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERS_SUBSET")

///|
/// `INTERS_SUBSET`
pub fn inters_subset() -> @kernel.Thm {
  inters_subset_c.get()
}

///|
/// IN_SET_FUNCTION_PREDICATE
fn step_16() -> Unit raise {
  in_set_function_predicate_c.set(@readable.prove(
    "∀ x : _, ∀ f : (_) -> _, ∀ P : (_) -> Bool, IN(x, {f((y : _)) | P(y)}) == (∃ y : _, x == f(y) && P(y))",
    @readable.by(@readable.set, []),
  ))
}

///|
let in_set_function_predicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SET_FUNCTION_PREDICATE")

///|
/// `IN_SET_FUNCTION_PREDICATE`
pub fn in_set_function_predicate() -> @kernel.Thm {
  in_set_function_predicate_c.get()
}

///|
/// INTER_TENSOR
fn step_17() -> Unit raise {
  inter_tensor_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ s' : (_) -> Bool, ∀ t : (_) -> Bool, ∀ t' : (_) -> Bool, SUBSET(s, s') && SUBSET(t, t') → SUBSET(INTER(s, t), INTER(s', t'))",
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
/// UNION_TENSOR
fn step_18() -> Unit raise {
  union_tensor_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ s' : (_) -> Bool, ∀ t : (_) -> Bool, ∀ t' : (_) -> Bool, SUBSET(s, s') && SUBSET(t, t') → SUBSET(UNION(s, t), UNION(s', t'))",
    @readable.by(@readable.set, []),
  ))
}

///|
let union_tensor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_TENSOR")

///|
/// `UNION_TENSOR`
pub fn union_tensor() -> @kernel.Thm {
  union_tensor_c.get()
}

///|
/// ExistsTensorInter
fn step_19() -> Unit raise {
  existstensorinter_c.set(@readable.prove(
    "∀ F : ((_) -> Bool) -> Bool, ∀ G : ((_) -> Bool) -> Bool, ∀ H : ((_) -> Bool) -> Bool, (∀ x : (_) -> Bool, ∀ y : (_) -> Bool, F(x) && G(y) → H(INTER(x, y))) → (∃ x : (_) -> Bool, F(x)) && (∃ y : (_) -> Bool, G(y)) → (∃ z : (_) -> Bool, H(z))",
    @readable.by(@readable.fol, []),
  ))
}

///|
let existstensorinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ExistsTensorInter")

///|
/// `ExistsTensorInter`
pub fn existstensorinter() -> @kernel.Thm {
  existstensorinter_c.get()
}

///|
/// istopology
fn step_21() -> Unit raise {
  istopology_c.set(@readable.newdefinition("(istopology : (((_) -> Bool, ((_) -> Bool) -> Bool)) -> Bool)(((X : (_) -> Bool), (L : ((_) -> Bool) -> Bool))) == ((∀ U : (_) -> Bool, IN(U, L) → SUBSET(U, X)) && IN({}, L) && IN(X, L) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(s, L) && IN(t, L) → IN(INTER(s, t), L)) && (∀ k : ((_) -> Bool) -> Bool, SUBSET(k, L) → IN(UNIONS(k), L)))"))
}

///|
let istopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("istopology")

///|
/// `istopology`
pub fn istopology() -> @kernel.Thm {
  istopology_c.get()
}

///|
/// UnderlyingSpace
fn step_22() -> Unit raise {
  underlyingspace_c.set(@readable.newdefinition("(UnderlyingSpace : ((_, _)) -> _)((alpha : (_, _))) == FST(alpha)"))
}

///|
let underlyingspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnderlyingSpace")

///|
/// `UnderlyingSpace`
pub fn underlyingspace() -> @kernel.Thm {
  underlyingspace_c.get()
}

///|
/// OpenSets
fn step_23() -> Unit raise {
  opensets_c.set(@readable.newdefinition("(OpenSets : ((_, _)) -> _)((alpha : (_, _))) == SND(alpha)"))
}

///|
let opensets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenSets")

///|
/// `OpenSets`
pub fn opensets() -> @kernel.Thm {
  opensets_c.get()
}

///|
/// ExistsTopology
fn step_24() -> Unit raise {
  existstopology_c.set(@readable.prove(
    "∀ X : (_) -> Bool, ∃ alpha : ((_) -> Bool, ((_) -> Bool) -> Bool), istopology(alpha) && UnderlyingSpace(alpha) == X",
    @readable.steps(
      [
        @readable.intro_tac("forall X"),
        @readable.consider(
          "L",
          "∃ L : ((_) -> Bool) -> Bool, L == {(U : (_) -> Bool) | SUBSET(U, X)}",
          "Lexists",
          @readable.by(@readable.fol, []),
        ),
        @readable.exists("(X, L)"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("istopology", () => istopology()),
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Label("Lexists"),
            @readable.Thm("UnderlyingSpace", () => underlyingspace()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let existstopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ExistsTopology")

///|
/// `ExistsTopology`
pub fn existstopology() -> @kernel.Thm {
  existstopology_c.get()
}

///|
/// topology_tybij_th
fn step_29() -> Unit raise {
  topology_tybij_th_c.set(@readable.prove(
    "∃ t : ((_) -> Bool, ((_) -> Bool) -> Bool), istopology(t)",
    @readable.by(
      @readable.fol,
      [@readable.Thm("ExistsTopology", () => existstopology())],
    ),
  ))
}

///|
let topology_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("topology_tybij_th")

///|
/// `topology_tybij_th`
pub fn topology_tybij_th() -> @kernel.Thm {
  topology_tybij_th_c.get()
}

///|
/// topology_tybij
fn step_31() -> Unit raise {
  topology_tybij_c.set(@class.new_type_definition("topology", ("mk_topology", "dest_topology"), topology_tybij_th()))
}

///|
let topology_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("topology_tybij")

///|
/// `topology_tybij`
pub fn topology_tybij() -> @kernel.Thm {
  topology_tybij_c.get()
}

///|
/// ISTOPOLOGYdest_topology
fn step_32() -> Unit raise {
  istopologydest_topology_c.set(@readable.prove(
    "∀ alpha : Topology[_], istopology(dest_topology(alpha))",
    @readable.by(
      @readable.fol,
      [@readable.Thm("topology_tybij", () => topology_tybij())],
    ),
  ))
}

///|
let istopologydest_topology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISTOPOLOGYdest_topology")

///|
/// `ISTOPOLOGYdest_topology`
pub fn istopologydest_topology() -> @kernel.Thm {
  istopologydest_topology_c.get()
}

///|
/// OpenIn
fn step_34() -> Unit raise {
  openin_c.set(@readable.newdefinition("∀ alpha : Topology[_], (open_in : (Topology[_], (_) -> Bool) -> Bool)(alpha) == OpenSets(dest_topology(alpha))"))
}

///|
let openin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenIn")

///|
/// `OpenIn`
pub fn openin() -> @kernel.Thm {
  openin_c.get()
}

///|
/// topspace
fn step_35() -> Unit raise {
  topspace_c.set(@readable.newdefinition("∀ alpha : Topology[_], (topspace : (Topology[_], _) -> Bool)(alpha) == UnderlyingSpace(dest_topology(alpha))"))
}

///|
let topspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("topspace")

///|
/// `topspace`
pub fn topspace() -> @kernel.Thm {
  topspace_c.get()
}

///|
/// TopologyPAIR
fn step_36() -> Unit raise {
  topologypair_c.set(@readable.prove(
    "∀ alpha : Topology[_], dest_topology(alpha) == (topspace(alpha), open_in(alpha))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
        @readable.Thm("OpenIn", () => openin()),
        @readable.Thm("topspace", () => topspace()),
        @readable.Thm("UnderlyingSpace", () => underlyingspace()),
        @readable.Thm("OpenSets", () => opensets()),
      ],
    ),
  ))
}

///|
let topologypair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TopologyPAIR")

///|
/// `TopologyPAIR`
pub fn topologypair() -> @kernel.Thm {
  topologypair_c.get()
}

///|
/// Topology_Eq
fn step_41() -> Unit raise {
  topology_eq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ beta : Topology[_], (topspace(alpha) == topspace(beta) && (∀ U : (_) -> Bool, open_in(alpha, U) == open_in(beta, U))) == (alpha == beta)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha beta"),
        @readable.eq_tac("Right", @readable.by(@readable.fol, [])),
        @readable.intro_tac("H1 H2"),
        @readable.have(
          "dest_topology(alpha) == dest_topology(beta)",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("TopologyPAIR", () => topologypair()),
              @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("FUN_EQ_THM", () => @class.fun_eq_thm()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("topology_tybij", () => topology_tybij())],
        ),
      ],
    ),
  ))
}

///|
let topology_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Topology_Eq")

///|
/// `Topology_Eq`
pub fn topology_eq() -> @kernel.Thm {
  topology_eq_c.get()
}

///|
/// OpenInCLAUSES
fn step_45() -> Unit raise {
  openinclauses_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ X : (_) -> Bool, topspace(alpha) == X → (∀ U : (_) -> Bool, open_in(alpha, U) → SUBSET(U, X)) && open_in(alpha, {}) && open_in(alpha, X) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && open_in(alpha, t) → open_in(alpha, INTER(s, t))) && (∀ k : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, k) → open_in(alpha, s)) → open_in(alpha, UNIONS(k)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha X, H1"),
        @readable.consider(
          "L",
          "∃ L : ((_) -> Bool) -> Bool, L == open_in(alpha)",
          "Ldef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "istopology((X, L))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("Ldef"),
              @readable.Thm("TopologyPAIR", () => topologypair()),
              @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
              @readable.Thm("ISTOPOLOGYdest_topology", () => istopologydest_topology()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Ldef"),
            @readable.Prev,
            @readable.Thm("istopology", () => istopology()),
            @readable.Thm("IN", () => @sets.in_()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinclauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInCLAUSES")

///|
/// `OpenInCLAUSES`
pub fn openinclauses() -> @kernel.Thm {
  openinclauses_c.get()
}

///|
/// OPEN_IN_SUBSET
fn step_49() -> Unit raise {
  open_in_subset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) → SUBSET(s, topspace(alpha))",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let open_in_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBSET")

///|
/// `OPEN_IN_SUBSET`
pub fn open_in_subset() -> @kernel.Thm {
  open_in_subset_c.get()
}

///|
/// OPEN_IN_EMPTY
fn step_51() -> Unit raise {
  open_in_empty_c.set(@readable.prove(
    "∀ alpha : Topology[_], open_in(alpha, {})",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let open_in_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_EMPTY")

///|
/// `OPEN_IN_EMPTY`
pub fn open_in_empty() -> @kernel.Thm {
  open_in_empty_c.get()
}

///|
/// OPEN_IN_INTER
fn step_52() -> Unit raise {
  open_in_inter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && open_in(alpha, t) → open_in(alpha, INTER(s, t))",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let open_in_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_INTER")

///|
/// `OPEN_IN_INTER`
pub fn open_in_inter() -> @kernel.Thm {
  open_in_inter_c.get()
}

///|
/// OPEN_IN_UNIONS
fn step_53() -> Unit raise {
  open_in_unions_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ k : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, k) → open_in(alpha, s)) → open_in(alpha, UNIONS(k))",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let open_in_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_UNIONS")

///|
/// `OPEN_IN_UNIONS`
pub fn open_in_unions() -> @kernel.Thm {
  open_in_unions_c.get()
}

///|
/// OpenInTopspace
fn step_54() -> Unit raise {
  openintopspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], open_in(alpha, topspace(alpha))",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let openintopspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInTopspace")

///|
/// `OpenInTopspace`
pub fn openintopspace() -> @kernel.Thm {
  openintopspace_c.get()
}

///|
/// OPEN_IN_UNION
fn step_55() -> Unit raise {
  open_in_union_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && open_in(alpha, t) → open_in(alpha, UNION(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H"),
        @readable.have(
          "∀ x : (_) -> Bool, IN(x, {s, t}) == (x == s || x == t)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("IN_INSERT", () => @sets.in_insert()),
              @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("UNIONS_2", () => @sets.unions_2()),
            @readable.Label("H"),
            @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_UNION")

///|
/// `OPEN_IN_UNION`
pub fn open_in_union() -> @kernel.Thm {
  open_in_union_c.get()
}

///|
/// OPEN_IN_TOPSPACE
fn step_60() -> Unit raise {
  open_in_topspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], open_in(alpha, topspace(alpha))",
    @readable.by(@readable.fol, [@readable.Thm("OpenInCLAUSES", () => openinclauses())]),
  ))
}

///|
let open_in_topspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_TOPSPACE")

///|
/// `OPEN_IN_TOPSPACE`
pub fn open_in_topspace() -> @kernel.Thm {
  open_in_topspace_c.get()
}

///|
/// OPEN_IN_INTERS
fn step_61() -> Unit raise {
  open_in_inters_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : ((_) -> Bool) -> Bool, FINITE(s) && !(s == {}) && (∀ t : (_) -> Bool, IN(t, s) → open_in(alpha, t)) → open_in(alpha, INTERS(s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("IMP_CONJ", () => @theorems.imp_conj())],
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("FINITE_INDUCT", () => @sets.finite_induct()),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("INTERS_INSERT", () => @sets.inters_insert()),
            @readable.Thm("NOT_INSERT_EMPTY", () => @sets.not_insert_empty()),
            @readable.Thm("FORALL_IN_INSERT", () => @sets.forall_in_insert()),
          ],
        ),
        @readable.intro_tac("forall x s, H1, xWorks sWorks"),
        @readable.assuming(
          "!(s == {})",
          "Nonempty",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("INTERS_0", () => @sets.inters_0()),
              @readable.Thm("INTER_UNIV", () => @sets.inter_univ()),
              @readable.Label("xWorks"),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("xWorks"),
            @readable.Label("Nonempty"),
            @readable.Label("H1"),
            @readable.Label("sWorks"),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_INTERS")

///|
/// `OPEN_IN_INTERS`
pub fn open_in_inters() -> @kernel.Thm {
  open_in_inters_c.get()
}

///|
/// OPEN_IN_SUBOPEN
fn step_71() -> Unit raise {
  open_in_subopen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) == (∀ x : _, IN(x, s) → (∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(t, s)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s"),
        @readable.eq_tac("Left", @readable.by(@readable.set, [])),
        @readable.intro_tac("ALLtExist"),
        @readable.consider(
          "f",
          "∃ f : (_, _) -> Bool, ∀ x : _, IN(x, s) → open_in(alpha, f(x)) && IN(x, f(x)) && SUBSET(f(x), s)",
          "fExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ALLtExist"),
              @readable.Thm("SKOLEM_THM_GEN", () => @readable.skolem_thm_gen()),
            ],
          ),
        ),
        @readable.have(
          "s == UNIONS(IMAGE(f, s))",
          "",
          @readable.by(@readable.set, [@readable.Prev]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("fExists"),
            @readable.Thm("FORALL_IN_IMAGE", () => @sets.forall_in_image()),
            @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_subopen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBOPEN")

///|
/// `OPEN_IN_SUBOPEN`
pub fn open_in_subopen() -> @kernel.Thm {
  open_in_subopen_c.get()
}

///|
/// closed_in
fn step_74() -> Unit raise {
  closed_in_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ s : (_) -> Bool, (closed_in : (Topology[_], (_) -> Bool) -> Bool)(alpha, s) == (SUBSET(s, topspace(alpha)) && open_in(alpha, DIFF(topspace(alpha), s)))"))
}

///|
let closed_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("closed_in")

///|
/// `closed_in`
pub fn closed_in() -> @kernel.Thm {
  closed_in_c.get()
}

///|
/// CLOSED_IN_SUBSET
fn step_75() -> Unit raise {
  closed_in_subset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, closed_in(alpha, s) → SUBSET(s, topspace(alpha))",
    @readable.by(@readable.fol, [@readable.Thm("closed_in", () => closed_in())]),
  ))
}

///|
let closed_in_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBSET")

///|
/// `CLOSED_IN_SUBSET`
pub fn closed_in_subset() -> @kernel.Thm {
  closed_in_subset_c.get()
}

///|
/// CLOSED_IN_EMPTY
fn step_77() -> Unit raise {
  closed_in_empty_c.set(@readable.prove(
    "∀ alpha : Topology[_], closed_in(alpha, {})",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
        @readable.Thm("DIFF_EMPTY", () => @sets.diff_empty()),
        @readable.Thm("OPEN_IN_TOPSPACE", () => open_in_topspace()),
      ],
    ),
  ))
}

///|
let closed_in_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_EMPTY")

///|
/// `CLOSED_IN_EMPTY`
pub fn closed_in_empty() -> @kernel.Thm {
  closed_in_empty_c.get()
}

///|
/// CLOSED_IN_TOPSPACE
fn step_81() -> Unit raise {
  closed_in_topspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], closed_in(alpha, topspace(alpha))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
        @readable.Thm("DIFF_EQ_EMPTY", () => @sets.diff_eq_empty()),
        @readable.Thm("OPEN_IN_EMPTY", () => open_in_empty()),
      ],
    ),
  ))
}

///|
let closed_in_topspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_TOPSPACE")

///|
/// `CLOSED_IN_TOPSPACE`
pub fn closed_in_topspace() -> @kernel.Thm {
  closed_in_topspace_c.get()
}

///|
/// CLOSED_IN_UNION
fn step_85() -> Unit raise {
  closed_in_union_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, closed_in(alpha, s) && closed_in(alpha, t) → closed_in(alpha, UNION(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, Hst"),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Hst"),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("DIFF_UNION", () => diff_union()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_UNION")

///|
/// `CLOSED_IN_UNION`
pub fn closed_in_union() -> @kernel.Thm {
  closed_in_union_c.get()
}

///|
/// CLOSED_IN_INTERS
fn step_88() -> Unit raise {
  closed_in_inters_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ k : ((_) -> Bool) -> Bool, !(k == {}) && (∀ s : (_) -> Bool, IN(s, k) → closed_in(alpha, s)) → closed_in(alpha, INTERS(k))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha k, H1 H2"),
        @readable.consider(
          "X",
          "∃ X : (_) -> Bool, X == topspace(alpha)",
          "Xdef",
          @readable.by(@readable.fol, []),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Rule(@equal.gsym, @readable.Label("Xdef")),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("DIFF_INTERS", () => @sets.diff_inters()),
            @readable.Thm("SIMPLE_IMAGE", () => @sets.simple_image()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Label("Xdef"),
            @readable.Thm("INTERS_SUBSET", () => inters_subset()),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("FORALL_IN_IMAGE", () => @sets.forall_in_image()),
            @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_INTERS")

///|
/// `CLOSED_IN_INTERS`
pub fn closed_in_inters() -> @kernel.Thm {
  closed_in_inters_c.get()
}

///|
/// CLOSED_IN_FORALL_IN
fn step_93() -> Unit raise {
  closed_in_forall_in_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : (_) -> Bool, ∀ Q : (_, _) -> Bool, !(P == {}) && (∀ a : _, P(a) → closed_in(alpha, {(x : _) | Q(a, x)})) → closed_in(alpha, {(x : _) | ∀ a : _, P(a) → Q(a, x)})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha P Q, Pnonempty H1"),
        @readable.consider(
          "f",
          "∃ f : ((_) -> Bool) -> Bool, f == {{(x : _) | Q((a : _), x)} | P(a)}",
          "fDef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "!(f == {})",
          "fNonempty",
          @readable.by(
            @readable.set,
            [@readable.Label("fDef"), @readable.Label("Pnonempty")],
          ),
        ),
        @readable.have(
          "(∀ a : _, P(a) → closed_in(alpha, {(x : _) | Q(a, x)})) == (∀ s : (_) -> Bool, IN(s, f) → closed_in(alpha, s))",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("fDef"),
              @readable.Thm("FORALL_IN_GSPEC", () => @sets.forall_in_gspec()),
            ],
          ),
        ),
        @readable.have(
          "closed_in(alpha, INTERS(f))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("fNonempty"),
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("CLOSED_IN_INTERS", () => closed_in_inters()),
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.have(
          "{(x : _) | ∀ a : _, P(a) → IN(x, {(x : _) | Q(a, x)})} == {(x : _) | ∀ a : _, P(a) → Q(a, x)}",
          "",
          @readable.by(@readable.set, []),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("fDef"),
            @readable.Thm("INTERS_GSPEC", () => @sets.inters_gspec()),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_forall_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_FORALL_IN")

///|
/// `CLOSED_IN_FORALL_IN`
pub fn closed_in_forall_in() -> @kernel.Thm {
  closed_in_forall_in_c.get()
}

///|
/// CLOSED_IN_INTER
fn step_98() -> Unit raise {
  closed_in_inter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, closed_in(alpha, s) && closed_in(alpha, t) → closed_in(alpha, INTER(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, Hs Ht"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("INTERS_2", () => @sets.inters_2()),
            ),
          ],
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("CLOSED_IN_INTERS", () => closed_in_inters()),
        ),
        @readable.by(@readable.set, [@readable.Label("Hs"), @readable.Label("Ht")]),
      ],
    ),
  ))
}

///|
let closed_in_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_INTER")

///|
/// `CLOSED_IN_INTER`
pub fn closed_in_inter() -> @kernel.Thm {
  closed_in_inter_c.get()
}

///|
/// OPEN_IN_CLOSED_IN_EQ
fn step_100() -> Unit raise {
  open_in_closed_in_eq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) == (SUBSET(s, topspace(alpha)) && closed_in(alpha, DIFF(topspace(alpha), s)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.TermRule(
              @sets.set_rule,
              "DIFF((X : (_) -> Bool), DIFF(X, s)) == INTER(X, s) && (SUBSET(s, X) → INTER(X, s) == s)",
            ),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_closed_in_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CLOSED_IN_EQ")

///|
/// `OPEN_IN_CLOSED_IN_EQ`
pub fn open_in_closed_in_eq() -> @kernel.Thm {
  open_in_closed_in_eq_c.get()
}

///|
/// OPEN_IN_CLOSED_IN
fn step_104() -> Unit raise {
  open_in_closed_in_c.set(@readable.prove(
    "∀ s : (_) -> Bool, SUBSET(s, topspace((alpha : Topology[_]))) → open_in(alpha, s) == closed_in(alpha, DIFF(topspace(alpha), s))",
    @readable.by(
      @readable.fol,
      [@readable.Thm("OPEN_IN_CLOSED_IN_EQ", () => open_in_closed_in_eq())],
    ),
  ))
}

///|
let open_in_closed_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CLOSED_IN")

///|
/// `OPEN_IN_CLOSED_IN`
pub fn open_in_closed_in() -> @kernel.Thm {
  open_in_closed_in_c.get()
}

///|
/// OPEN_IN_DIFF
fn step_106() -> Unit raise {
  open_in_diff_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && closed_in(alpha, t) → open_in(alpha, DIFF(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2"),
        @readable.consider(
          "X",
          "∃ X : (_) -> Bool, X == topspace(alpha)",
          "Xdef",
          @readable.by(@readable.fol, []),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_DIFF")

///|
/// `OPEN_IN_DIFF`
pub fn open_in_diff() -> @kernel.Thm {
  open_in_diff_c.get()
}

///|
/// CLOSED_IN_DIFF
fn step_108() -> Unit raise {
  closed_in_diff_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, closed_in(alpha, s) && open_in(alpha, t) → closed_in(alpha, DIFF(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2"),
        @readable.consider(
          "X",
          "∃ X : (_) -> Bool, X == topspace(alpha)",
          "Xdef",
          @readable.by(@readable.fol, []),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("DIFF_REFL", () => diff_refl()),
            @readable.Label("H2"),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_DIFF")

///|
/// `CLOSED_IN_DIFF`
pub fn closed_in_diff() -> @kernel.Thm {
  closed_in_diff_c.get()
}

///|
/// CLOSED_IN_UNIONS
fn step_111() -> Unit raise {
  closed_in_unions_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : ((_) -> Bool) -> Bool, FINITE(s) && (∀ t : (_) -> Bool, IN(t, s) → closed_in(alpha, t)) → closed_in(alpha, UNIONS(s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("IMP_CONJ", () => @theorems.imp_conj())],
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("FINITE_INDUCT", () => @sets.finite_induct()),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("UNIONS_INSERT", () => @sets.unions_insert()),
            @readable.Thm("UNIONS_0", () => @sets.unions_0()),
            @readable.Thm("CLOSED_IN_EMPTY", () => closed_in_empty()),
            @readable.Thm("IN_INSERT", () => @sets.in_insert()),
            @readable.Thm("CLOSED_IN_UNION", () => closed_in_union()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_UNIONS")

///|
/// `CLOSED_IN_UNIONS`
pub fn closed_in_unions() -> @kernel.Thm {
  closed_in_unions_c.get()
}

///|
/// subtopology
fn step_116() -> Unit raise {
  subtopology_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ u : (_) -> Bool, (subtopology : (Topology[_], (_) -> Bool) -> Topology[_])(alpha, u) == mk_topology((u, {INTER((s : (_) -> Bool), u) | open_in(alpha, s)}))"))
}

///|
let subtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subtopology")

///|
/// `subtopology`
pub fn subtopology() -> @kernel.Thm {
  subtopology_c.get()
}

///|
/// IstopologySubtopology
fn step_117() -> Unit raise {
  istopologysubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[A], ∀ u : (A) -> Bool, SUBSET(u, topspace(alpha)) → istopology((u, {INTER((s : (A) -> Bool), u) | open_in(alpha, s)}))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha u, H1"),
        @readable.have(
          "{} == INTER({}, u) && open_in(alpha, {})",
          "emptysetOpen",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("INTER_EMPTY", () => @sets.inter_empty()),
              @readable.Thm("OPEN_IN_EMPTY", () => open_in_empty()),
            ],
          ),
        ),
        @readable.have(
          "u == INTER(topspace(alpha), u) && open_in(alpha, topspace(alpha))",
          "uOpen",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("OPEN_IN_TOPSPACE", () => open_in_topspace()),
              @readable.Label("H1"),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
              @readable.Thm(
                "SUBSET_INTER_ABSORPTION",
                () => @sets.subset_inter_absorption(),
              ),
            ],
          ),
        ),
        @readable.have(
          "∀ s' : (A) -> Bool, ∀ s : (A) -> Bool, open_in(alpha, s') && open_in(alpha, s) → open_in(alpha, INTER(s', s)) && INTER(INTER(s', u), INTER(s, u)) == INTER(INTER(s', s), u)",
          "interOpen",
          @readable.steps(
            [
              @readable.intro_tac("forall s' s, H1 H2"),
              @readable.by(
                @readable.set,
                [
                  @readable.ThmsTermRule(
                    ths => tm => @meson.meson(ths, tm),
                    [
                      @readable.Label("H1"),
                      @readable.Label("H2"),
                      @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
                    ],
                    "open_in(alpha, INTER(s', s))",
                  ),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "∀ k : ((A) -> Bool) -> Bool, SUBSET(k, {(s : (A) -> Bool) | open_in(alpha, s)}) → open_in(alpha, UNIONS(k)) && UNIONS(IMAGE((s : (A) -> Bool) => INTER(s, u), k)) == INTER(UNIONS(k), u)",
          "unionsOpen",
          @readable.steps(
            [
              @readable.intro_tac("forall k, kProp"),
              @readable.have(
                "open_in(alpha, UNIONS(k))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("kProp"),
                    @readable.Thm("SUBSET", () => @sets.subset()),
                    @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
                    @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
                  ],
                ),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Prev,
                  @readable.Thm("UNIONS_IMAGE", () => @sets.unions_image()),
                  @readable.Thm("UNIONS_GSPEC", () => @sets.unions_gspec()),
                  @readable.Thm("INTER_UNIONS", () => @sets.inter_unions()),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "{INTER((s : (A) -> Bool), u) | open_in(alpha, s)} == IMAGE((s : (A) -> Bool) => INTER(s, u), {(s : (A) -> Bool) | open_in(alpha, s)})",
          "",
          @readable.by(@readable.set, []),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("istopology", () => istopology()),
            @readable.Thm(
              "IN_SET_FUNCTION_PREDICATE",
              () => in_set_function_predicate(),
            ),
            @readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm()),
            @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            @readable.Prev,
            @readable.Thm("FORALL_SUBSET_IMAGE", () => @sets.forall_subset_image()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("emptysetOpen"),
            @readable.Label("uOpen"),
            @readable.Label("interOpen"),
            @readable.Label("unionsOpen"),
          ],
        ),
      ],
    ),
  ))
}

///|
let istopologysubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IstopologySubtopology")

///|
/// `IstopologySubtopology`
pub fn istopologysubtopology() -> @kernel.Thm {
  istopologysubtopology_c.get()
}

///|
/// OpenInSubtopology
fn step_129() -> Unit raise {
  openinsubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, u), s) == (∃ t : (_) -> Bool, open_in(alpha, t) && s == INTER(t, u))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha u s, H1"),
        @readable.have(
          "open_in(subtopology(alpha, u)) == OpenSets((u, {INTER((s : (_) -> Bool), u) | open_in(alpha, s)}))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("subtopology", () => subtopology()),
              @readable.Label("H1"),
              @readable.Thm("IstopologySubtopology", () => istopologysubtopology()),
              @readable.Thm("topology_tybij", () => topology_tybij()),
              @readable.Thm("OpenIn", () => openin()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Prev,
            @readable.Thm("OpenSets", () => opensets()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("SND", () => @pair.snd()),
            @readable.Thm("EXTENSION", () => @sets.extension()),
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinsubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubtopology")

///|
/// `OpenInSubtopology`
pub fn openinsubtopology() -> @kernel.Thm {
  openinsubtopology_c.get()
}

///|
/// TopspaceSubtopology
fn step_134() -> Unit raise {
  topspacesubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) → topspace(subtopology(alpha, u)) == u",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha u , H1"),
        @readable.have(
          "topspace(subtopology(alpha, u)) == UnderlyingSpace((u, {INTER((s : (_) -> Bool), u) | open_in(alpha, s)}))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("subtopology", () => subtopology()),
              @readable.Label("H1"),
              @readable.Thm("IstopologySubtopology", () => istopologysubtopology()),
              @readable.Thm("topology_tybij", () => topology_tybij()),
              @readable.Thm("topspace", () => topspace()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Prev,
            @readable.Thm("UnderlyingSpace", () => underlyingspace()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("FST", () => @pair.fst()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
            @readable.Label("H1"),
            @readable.Thm(
              "SUBSET_INTER_ABSORPTION",
              () => @sets.subset_inter_absorption(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let topspacesubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TopspaceSubtopology")

///|
/// `TopspaceSubtopology`
pub fn topspacesubtopology() -> @kernel.Thm {
  topspacesubtopology_c.get()
}

///|
/// OpenInRefl
fn step_136() -> Unit raise {
  openinrefl_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → open_in(subtopology(alpha, s), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("OPEN_IN_TOPSPACE", () => open_in_topspace()),
      ],
    ),
  ))
}

///|
let openinrefl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInRefl")

///|
/// `OpenInRefl`
pub fn openinrefl() -> @kernel.Thm {
  openinrefl_c.get()
}

///|
/// ClosedInRefl
fn step_138() -> Unit raise {
  closedinrefl_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(subtopology(alpha, s), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("CLOSED_IN_TOPSPACE", () => closed_in_topspace()),
      ],
    ),
  ))
}

///|
let closedinrefl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInRefl")

///|
/// `ClosedInRefl`
pub fn closedinrefl() -> @kernel.Thm {
  closedinrefl_c.get()
}

///|
/// ClosedInSubtopology
fn step_140() -> Unit raise {
  closedinsubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ C : (_) -> Bool, SUBSET(u, topspace(alpha)) → closed_in(subtopology(alpha, u), C) == (∃ D : (_) -> Bool, closed_in(alpha, D) && C == INTER(D, u))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha u C, H1"),
        @readable.consider(
          "X",
          "∃ X : (_) -> Bool, X == topspace(alpha) && SUBSET(u, X)",
          "Xdef",
          @readable.by(@readable.fol, [@readable.Label("H1")]),
        ),
        @readable.have(
          "closed_in(subtopology(alpha, u), C) == (∃ t : (_) -> Bool, SUBSET(C, u) && SUBSET(t, X) && open_in(alpha, t) && DIFF(u, C) == INTER(t, u))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("closed_in", () => closed_in()),
              @readable.Label("H1"),
              @readable.Label("Xdef"),
              @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
              @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
            ],
          ),
        ),
        @readable.have(
          "closed_in(subtopology(alpha, u), C) == (∃ D : (_) -> Bool, SUBSET(C, u) && SUBSET(D, X) && open_in(alpha, DIFF(X, D)) && DIFF(u, C) == INTER(DIFF(X, D), u))",
          "",
          @readable.steps(
            [
              @readable.by(@readable.rewrite, [@readable.Prev]),
              @readable.eq_tac(
                "Left",
                @readable.steps(
                  [
                    @tactics.strip_tac,
                    @readable.exists("DIFF(X, t)"),
                    @readable.by(
                      @simp.asm_simp_tac,
                      [
                        @readable.Label("H1"),
                        @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
                        @readable.Thm("DIFF_REFL", () => diff_refl()),
                        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                      ],
                    ),
                  ],
                ),
              ),
              @tactics.strip_tac,
              @readable.exists("DIFF(X, D)"),
              @readable.by(
                @simp.asm_simp_tac,
                [@readable.Thm("SUBSET_DIFF", () => @sets.subset_diff())],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Prev,
            @readable.Rule(@equal.gsym, @readable.Label("Xdef")),
            @readable.Label("H1"),
            @readable.Thm("closed_in", () => closed_in()),
          ],
        ),
        @readable.have(
          "∀ D : (_) -> Bool, ∀ C : (_) -> Bool, (SUBSET(C, u) && DIFF(u, C) == INTER(DIFF(X, D), u)) == (C == INTER(D, u))",
          "",
          @readable.by(
            @readable.set,
            [
              @readable.Label("Xdef"),
              @readable.Thm("DIFF_REFL", () => diff_refl()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Prev]),
      ],
    ),
  ))
}

///|
let closedinsubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInSubtopology")

///|
/// `ClosedInSubtopology`
pub fn closedinsubtopology() -> @kernel.Thm {
  closedinsubtopology_c.get()
}

///|
/// OPEN_IN_SUBTOPOLOGY_EMPTY
fn step_144() -> Unit raise {
  open_in_subtopology_empty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(subtopology(alpha, {}), s) == (s == {})",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            @readable.Thm("INTER_EMPTY", () => @sets.inter_empty()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("OPEN_IN_EMPTY", () => open_in_empty())],
        ),
      ],
    ),
  ))
}

///|
let open_in_subtopology_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBTOPOLOGY_EMPTY")

///|
/// `OPEN_IN_SUBTOPOLOGY_EMPTY`
pub fn open_in_subtopology_empty() -> @kernel.Thm {
  open_in_subtopology_empty_c.get()
}

///|
/// CLOSED_IN_SUBTOPOLOGY_EMPTY
fn step_145() -> Unit raise {
  closed_in_subtopology_empty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, closed_in(subtopology(alpha, {}), s) == (s == {})",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
            @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
            @readable.Thm("INTER_EMPTY", () => @sets.inter_empty()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("CLOSED_IN_EMPTY", () => closed_in_empty())],
        ),
      ],
    ),
  ))
}

///|
let closed_in_subtopology_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBTOPOLOGY_EMPTY")

///|
/// `CLOSED_IN_SUBTOPOLOGY_EMPTY`
pub fn closed_in_subtopology_empty() -> @kernel.Thm {
  closed_in_subtopology_empty_c.get()
}

///|
/// SUBTOPOLOGY_TOPSPACE
fn step_147() -> Unit raise {
  subtopology_topspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], subtopology(alpha, topspace(alpha)) == alpha",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.have(
          "topspace(subtopology(alpha, topspace(alpha))) == topspace(alpha)",
          "topXsub",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("topXsub"),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("Topology_Eq", () => topology_eq()),
            ),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [@readable.Thm("SUBSET_REFL", () => @sets.subset_refl())],
              "SUBSET(topspace(alpha), topspace(alpha))",
            ),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm(
              "SUBSET_INTER_ABSORPTION",
              () => @sets.subset_inter_absorption(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let subtopology_topspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTOPOLOGY_TOPSPACE")

///|
/// `SUBTOPOLOGY_TOPSPACE`
pub fn subtopology_topspace() -> @kernel.Thm {
  subtopology_topspace_c.get()
}

///|
/// OpenInImpSubset
fn step_149() -> Unit raise {
  openinimpsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → open_in(subtopology(alpha, s), t) → SUBSET(t, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
        @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
      ],
    ),
  ))
}

///|
let openinimpsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInImpSubset")

///|
/// `OpenInImpSubset`
pub fn openinimpsubset() -> @kernel.Thm {
  openinimpsubset_c.get()
}

///|
/// ClosedInImpSubset
fn step_150() -> Unit raise {
  closedinimpsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(subtopology(alpha, s), t) → SUBSET(t, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
        @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
      ],
    ),
  ))
}

///|
let closedinimpsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInImpSubset")

///|
/// `ClosedInImpSubset`
pub fn closedinimpsubset() -> @kernel.Thm {
  closedinimpsubset_c.get()
}

///|
/// OpenInSubtopologyUnion
fn step_151() -> Unit raise {
  openinsubtopologyunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, t), s) && open_in(subtopology(alpha, u), s) → open_in(subtopology(alpha, UNION(t, u)), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, Ht Hu"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("Ht"),
            @readable.Label("Hu"),
            @readable.Label("Ht"),
            @readable.Label("Hu"),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
          ],
        ),
        @readable.intro_tac("sOpenSub_t sOpenSub_u"),
        @readable.consider(
          "a b",
          "∃ a : (_) -> Bool, ∃ b : (_) -> Bool, open_in(alpha, a) && s == INTER(a, t) && open_in(alpha, b) && s == INTER(b, u)",
          "abExist",
          @readable.by(
            @readable.fol,
            [@readable.Label("sOpenSub_t"), @readable.Label("sOpenSub_u")],
          ),
        ),
        @readable.exists("INTER(a, b)"),
        @readable.by(
          @readable.set,
          [
            @readable.ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [
                @readable.Label("abExist"),
                @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
              ],
              "open_in(alpha, INTER(a, b))",
            ),
            @readable.Label("abExist"),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinsubtopologyunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubtopologyUnion")

///|
/// `OpenInSubtopologyUnion`
pub fn openinsubtopologyunion() -> @kernel.Thm {
  openinsubtopologyunion_c.get()
}

///|
/// ClosedInSubtopologyUnion
fn step_152() -> Unit raise {
  closedinsubtopologyunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(u, topspace(alpha)) → closed_in(subtopology(alpha, t), s) && closed_in(subtopology(alpha, u), s) → closed_in(subtopology(alpha, UNION(t, u)), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, Ht Hu"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("Ht"),
            @readable.Label("Hu"),
            @readable.Label("Ht"),
            @readable.Label("Hu"),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
          ],
        ),
        @readable.intro_tac("sClosedSub_t sClosedSub_u"),
        @readable.consider(
          "a b",
          "∃ a : (_) -> Bool, ∃ b : (_) -> Bool, closed_in(alpha, a) && s == INTER(a, t) && closed_in(alpha, b) && s == INTER(b, u)",
          "abExist",
          @readable.by(
            @readable.fol,
            [@readable.Label("sClosedSub_t"), @readable.Label("sClosedSub_u")],
          ),
        ),
        @readable.exists("INTER(a, b)"),
        @readable.by(
          @readable.set,
          [
            @readable.ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [
                @readable.Label("abExist"),
                @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
              ],
              "closed_in(alpha, INTER(a, b))",
            ),
            @readable.Label("abExist"),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedinsubtopologyunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInSubtopologyUnion")

///|
/// `ClosedInSubtopologyUnion`
pub fn closedinsubtopologyunion() -> @kernel.Thm {
  closedinsubtopologyunion_c.get()
}

///|
/// OpenInSubtopologyInterOpen
fn step_153() -> Unit raise {
  openinsubtopologyinteropen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, u), s) && open_in(alpha, t) → open_in(subtopology(alpha, u), INTER(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, H1, sOpenSub_t tOpen"),
        @readable.consider(
          "a b",
          "∃ a : (_) -> Bool, ∃ b : (_) -> Bool, open_in(alpha, a) && s == INTER(a, u) && b == INTER(a, t)",
          "aExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sOpenSub_t"),
              @readable.Label("H1"),
              @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("tOpen"),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
            @readable.Thm("INTER_ACI", () => @sets.inter_aci()),
            @readable.Label("H1"),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinsubtopologyinteropen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubtopologyInterOpen")

///|
/// `OpenInSubtopologyInterOpen`
pub fn openinsubtopologyinteropen() -> @kernel.Thm {
  openinsubtopologyinteropen_c.get()
}

///|
/// OpenInOpenInter
fn step_155() -> Unit raise {
  openinopeninter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(alpha, s) → open_in(subtopology(alpha, u), INTER(u, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
      ],
    ),
  ))
}

///|
let openinopeninter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInOpenInter")

///|
/// `OpenInOpenInter`
pub fn openinopeninter() -> @kernel.Thm {
  openinopeninter_c.get()
}

///|
/// OpenOpenInTrans
fn step_156() -> Unit raise {
  openopenintrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && open_in(alpha, t) && SUBSET(t, s) → open_in(subtopology(alpha, s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
        @readable.Thm("SUBSET_INTER_ABSORPTION", () => @sets.subset_inter_absorption()),
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
      ],
    ),
  ))
}

///|
let openopenintrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenOpenInTrans")

///|
/// `OpenOpenInTrans`
pub fn openopenintrans() -> @kernel.Thm {
  openopenintrans_c.get()
}

///|
/// ClosedClosedInTrans
fn step_157() -> Unit raise {
  closedclosedintrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, closed_in(alpha, s) && closed_in(alpha, t) && SUBSET(t, s) → closed_in(subtopology(alpha, s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN_SUBSET", () => closed_in_subset()),
        @readable.Thm("SUBSET_INTER_ABSORPTION", () => @sets.subset_inter_absorption()),
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
      ],
    ),
  ))
}

///|
let closedclosedintrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedClosedInTrans")

///|
/// `ClosedClosedInTrans`
pub fn closedclosedintrans() -> @kernel.Thm {
  closedclosedintrans_c.get()
}

///|
/// OpenSubset
fn step_159() -> Unit raise {
  opensubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → SUBSET(s, t) && open_in(alpha, s) → open_in(subtopology(alpha, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
        @readable.Thm("SUBSET_INTER_ABSORPTION", () => @sets.subset_inter_absorption()),
      ],
    ),
  ))
}

///|
let opensubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenSubset")

///|
/// `OpenSubset`
pub fn opensubset() -> @kernel.Thm {
  opensubset_c.get()
}

///|
/// ClosedSubsetEq
fn step_160() -> Unit raise {
  closedsubseteq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → closed_in(alpha, s) → closed_in(subtopology(alpha, u), s) == SUBSET(s, u)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
        @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
        @readable.Thm("SUBSET_INTER_ABSORPTION", () => @sets.subset_inter_absorption()),
      ],
    ),
  ))
}

///|
let closedsubseteq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedSubsetEq")

///|
/// `ClosedSubsetEq`
pub fn closedsubseteq() -> @kernel.Thm {
  closedsubseteq_c.get()
}

///|
/// ClosedInInterClosed
fn step_161() -> Unit raise {
  closedininterclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) → closed_in(subtopology(alpha, u), s) && closed_in(alpha, t) → closed_in(subtopology(alpha, u), INTER(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, H1, sClosedSub_t tClosed"),
        @readable.consider(
          "a b",
          "∃ a : (_) -> Bool, ∃ b : (_) -> Bool, closed_in(alpha, a) && s == INTER(a, u) && b == INTER(a, t)",
          "aExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sClosedSub_t"),
              @readable.Label("H1"),
              @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("tClosed"),
            @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
            @readable.Thm("INTER_ACI", () => @sets.inter_aci()),
            @readable.Label("H1"),
            @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedininterclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInInterClosed")

///|
/// `ClosedInInterClosed`
pub fn closedininterclosed() -> @kernel.Thm {
  closedininterclosed_c.get()
}

///|
/// ClosedInClosedInter
fn step_162() -> Unit raise {
  closedinclosedinter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → closed_in(alpha, s) → closed_in(subtopology(alpha, u), INTER(u, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
      ],
    ),
  ))
}

///|
let closedinclosedinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInClosedInter")

///|
/// `ClosedInClosedInter`
pub fn closedinclosedinter() -> @kernel.Thm {
  closedinclosedinter_c.get()
}

///|
/// ClosedSubset
fn step_163() -> Unit raise {
  closedsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → SUBSET(s, t) && closed_in(alpha, s) → closed_in(subtopology(alpha, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
        @readable.Thm("SUBSET_INTER_ABSORPTION", () => @sets.subset_inter_absorption()),
      ],
    ),
  ))
}

///|
let closedsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedSubset")

///|
/// `ClosedSubset`
pub fn closedsubset() -> @kernel.Thm {
  closedsubset_c.get()
}

///|
/// OpenInSubsetTrans
fn step_164() -> Unit raise {
  openinsubsettrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) && SUBSET(t, topspace(alpha)) → open_in(subtopology(alpha, u), s) && SUBSET(s, t) && SUBSET(t, u) → open_in(subtopology(alpha, t), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, uSubset tSubset"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("uSubset"),
            @readable.Label("tSubset"),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
          ],
        ),
        @readable.intro_tac("sOpen_u s_t t_u"),
        @readable.consider(
          "a",
          "∃ a : (_) -> Bool, open_in(alpha, a) && s == INTER(a, u)",
          "aExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("uSubset"),
              @readable.Label("sOpen_u"),
              @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            ],
          ),
        ),
        @readable.by(
          @readable.set,
          [@readable.Label("aExists"), @readable.Label("s_t"), @readable.Label("t_u")],
        ),
      ],
    ),
  ))
}

///|
let openinsubsettrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubsetTrans")

///|
/// `OpenInSubsetTrans`
pub fn openinsubsettrans() -> @kernel.Thm {
  openinsubsettrans_c.get()
}

///|
/// ClosedInSubsetTrans
fn step_165() -> Unit raise {
  closedinsubsettrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) && SUBSET(t, topspace(alpha)) → closed_in(subtopology(alpha, u), s) && SUBSET(s, t) && SUBSET(t, u) → closed_in(subtopology(alpha, t), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, uSubset tSubset"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("uSubset"),
            @readable.Label("tSubset"),
            @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
          ],
        ),
        @readable.intro_tac("sClosed_u s_t t_u"),
        @readable.consider(
          "a",
          "∃ a : (_) -> Bool, closed_in(alpha, a) && s == INTER(a, u)",
          "aExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("uSubset"),
              @readable.Label("sClosed_u"),
              @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
            ],
          ),
        ),
        @readable.by(
          @readable.set,
          [@readable.Label("aExists"), @readable.Label("s_t"), @readable.Label("t_u")],
        ),
      ],
    ),
  ))
}

///|
let closedinsubsettrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInSubsetTrans")

///|
/// `ClosedInSubsetTrans`
pub fn closedinsubsettrans() -> @kernel.Thm {
  closedinsubsettrans_c.get()
}

///|
/// OpenInTrans
fn step_166() -> Unit raise {
  openintrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, t), s) && open_in(subtopology(alpha, u), t) → open_in(subtopology(alpha, u), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t u, H1 H2"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
            @readable.Thm("INTER_ASSOC", () => @sets.inter_assoc()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openintrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInTrans")

///|
/// `OpenInTrans`
pub fn openintrans() -> @kernel.Thm {
  openintrans_c.get()
}

///|
/// OpenInTransEq
fn step_168() -> Unit raise {
  openintranseq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(s, topspace(alpha)) → (∀ u : (_) -> Bool, open_in(subtopology(alpha, t), u) → open_in(subtopology(alpha, s), t)) == open_in(subtopology(alpha, s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInTrans", () => openintrans()),
        @readable.Thm("OpenInRefl", () => openinrefl()),
      ],
    ),
  ))
}

///|
let openintranseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInTransEq")

///|
/// `OpenInTransEq`
pub fn openintranseq() -> @kernel.Thm {
  openintranseq_c.get()
}

///|
/// OpenInOpenTrans
fn step_171() -> Unit raise {
  openinopentrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, u), s) && open_in(alpha, u) → open_in(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
        @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
      ],
    ),
  ))
}

///|
let openinopentrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInOpenTrans")

///|
/// `OpenInOpenTrans`
pub fn openinopentrans() -> @kernel.Thm {
  openinopentrans_c.get()
}

///|
/// OpenInSubtopologyTrans
fn step_172() -> Unit raise {
  openinsubtopologytrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, t), s) && open_in(subtopology(alpha, u), t) → open_in(subtopology(alpha, u), s)",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [@readable.Thm("OpenInSubtopology", () => openinsubtopology())],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
            @readable.Thm("INTER_ASSOC", () => @sets.inter_assoc()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinsubtopologytrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubtopologyTrans")

///|
/// `OpenInSubtopologyTrans`
pub fn openinsubtopologytrans() -> @kernel.Thm {
  openinsubtopologytrans_c.get()
}

///|
/// SubtopologyOpenInSubopen
fn step_173() -> Unit raise {
  subtopologyopeninsubopen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(subtopology(alpha, u), s) == (SUBSET(s, u) && (∀ x : _, IN(x, s) → (∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(INTER(t, u), s))))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha u s, H1"),
        @readable.by(
          @readable.rewritel,
          [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
          ],
        ),
        @readable.eq_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.intro_tac("H2"),
        @readable.conj_tac(
          "Left",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [@readable.Thm("SUBSET", () => @sets.subset())],
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("H2"),
                  @readable.Thm("IN_INTER", () => @sets.in_inter()),
                ],
              ),
            ],
          ),
        ),
        @readable.intro_tac("forall x, xs"),
        @readable.consider(
          "t",
          "∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, INTER(t, u)) && SUBSET(INTER(t, u), s)",
          "tExists",
          @readable.by(@readable.fol, [@readable.Label("H2"), @readable.Label("xs")]),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Prev, @readable.Thm("IN_INTER", () => @sets.in_inter())],
        ),
      ],
    ),
  ))
}

///|
let subtopologyopeninsubopen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SubtopologyOpenInSubopen")

///|
/// `SubtopologyOpenInSubopen`
pub fn subtopologyopeninsubopen() -> @kernel.Thm {
  subtopologyopeninsubopen_c.get()
}

///|
/// ClosedInSubtopologyTrans
fn step_177() -> Unit raise {
  closedinsubtopologytrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(u, topspace(alpha)) → closed_in(subtopology(alpha, t), s) && closed_in(subtopology(alpha, u), t) → closed_in(subtopology(alpha, u), s)",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [@readable.Thm("ClosedInSubtopology", () => closedinsubtopology())],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
            @readable.Thm("INTER_ASSOC", () => @sets.inter_assoc()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedinsubtopologytrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInSubtopologyTrans")

///|
/// `ClosedInSubtopologyTrans`
pub fn closedinsubtopologytrans() -> @kernel.Thm {
  closedinsubtopologytrans_c.get()
}

///|
/// ClosedInSubtopologyTransEq
fn step_178() -> Unit raise {
  closedinsubtopologytranseq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) && SUBSET(s, topspace(alpha)) → (∀ u : (_) -> Bool, closed_in(subtopology(alpha, t), u) → closed_in(subtopology(alpha, s), t)) == closed_in(subtopology(alpha, s), t)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2"),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("ClosedInSubtopologyTrans", () => closedinsubtopologytrans()),
            @readable.Thm("CLOSED_IN_TOPSPACE", () => closed_in_topspace()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedinsubtopologytranseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInSubtopologyTransEq")

///|
/// `ClosedInSubtopologyTransEq`
pub fn closedinsubtopologytranseq() -> @kernel.Thm {
  closedinsubtopologytranseq_c.get()
}

///|
/// ClosedInClosedTrans
fn step_180() -> Unit raise {
  closedinclosedtrans_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : _, SUBSET((u : (_) -> Bool), topspace(alpha)) → closed_in(subtopology(alpha, u), s) && closed_in(alpha, u) → closed_in(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
        @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
      ],
    ),
  ))
}

///|
let closedinclosedtrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInClosedTrans")

///|
/// `ClosedInClosedTrans`
pub fn closedinclosedtrans() -> @kernel.Thm {
  closedinclosedtrans_c.get()
}

///|
/// OpenInSubtopologyInterSubset
fn step_181() -> Unit raise {
  openinsubtopologyintersubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ u : (_) -> Bool, ∀ v : (_) -> Bool, SUBSET(u, topspace(alpha)) && SUBSET(v, topspace(alpha)) → open_in(subtopology(alpha, u), INTER(u, s)) && SUBSET(v, u) → open_in(subtopology(alpha, v), INTER(v, s))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [@readable.Thm("OpenInSubtopology", () => openinsubtopology())],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let openinsubtopologyintersubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInSubtopologyInterSubset")

///|
/// `OpenInSubtopologyInterSubset`
pub fn openinsubtopologyintersubset() -> @kernel.Thm {
  openinsubtopologyintersubset_c.get()
}

///|
/// OpenInOpenEq
fn step_182() -> Unit raise {
  openinopeneq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → open_in(alpha, s) → open_in(subtopology(alpha, s), t) == (open_in(alpha, t) && SUBSET(t, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenOpenInTrans", () => openopenintrans()),
        @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("OpenInOpenTrans", () => openinopentrans()),
      ],
    ),
  ))
}

///|
let openinopeneq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInOpenEq")

///|
/// `OpenInOpenEq`
pub fn openinopeneq() -> @kernel.Thm {
  openinopeneq_c.get()
}

///|
/// ClosedInClosedEq
fn step_185() -> Unit raise {
  closedinclosedeq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, s) → closed_in(subtopology(alpha, s), t) == (closed_in(alpha, t) && SUBSET(t, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedClosedInTrans", () => closedclosedintrans()),
        @readable.Thm("CLOSED_IN_SUBSET", () => closed_in_subset()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("ClosedInClosedTrans", () => closedinclosedtrans()),
      ],
    ),
  ))
}

///|
let closedinclosedeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInClosedEq")

///|
/// `ClosedInClosedEq`
pub fn closedinclosedeq() -> @kernel.Thm {
  closedinclosedeq_c.get()
}

///|
/// OpenImpliesSubtopologyInterOpen
fn step_188() -> Unit raise {
  openimpliessubtopologyinteropen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ u : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(u, topspace(alpha)) → open_in(alpha, s) → open_in(subtopology(alpha, u), INTER(u, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
      ],
    ),
  ))
}

///|
let openimpliessubtopologyinteropen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenImpliesSubtopologyInterOpen")

///|
/// `OpenImpliesSubtopologyInterOpen`
pub fn openimpliessubtopologyinteropen() -> @kernel.Thm {
  openimpliessubtopologyinteropen_c.get()
}

///|
/// OPEN_IN_EXISTS_IN
fn step_189() -> Unit raise {
  open_in_exists_in_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : (_) -> Bool, ∀ Q : (_, _) -> Bool, (∀ a : _, P(a) → open_in(alpha, {(x : _) | Q(a, x)})) → open_in(alpha, {(x : _) | ∃ a : _, P(a) && Q(a, x)})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha P Q, H1"),
        @readable.consider(
          "f",
          "∃ f : ((_) -> Bool) -> Bool, f == {{(x : _) | Q((a : _), x)} | P(a)}",
          "fDef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "(∀ a : _, P(a) → open_in(alpha, {(x : _) | Q(a, x)})) == (∀ s : (_) -> Bool, IN(s, f) → open_in(alpha, s))",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("fDef"),
              @readable.Thm("FORALL_IN_GSPEC", () => @sets.forall_in_gspec()),
            ],
          ),
        ),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.ThmsTermRule(
            ths => tm => @meson.meson(ths, tm),
            [
              @readable.Label("H1"),
              @readable.Prev,
              @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
            ],
            "open_in(alpha, UNIONS(f))",
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("fDef"),
            @readable.Thm("UNIONS_GSPEC", () => @sets.unions_gspec()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let open_in_exists_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_EXISTS_IN")

///|
/// `OPEN_IN_EXISTS_IN`
pub fn open_in_exists_in() -> @kernel.Thm {
  open_in_exists_in_c.get()
}

///|
/// Connected_DEF
fn step_190() -> Unit raise {
  connected_def_c.set(@readable.newdefinition("∀ alpha : Topology[_], (Connected : (Topology[_]) -> Bool)(alpha) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, open_in(alpha, e1) && open_in(alpha, e2) && topspace(alpha) == UNION(e1, e2) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))"))
}

///|
let connected_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Connected_DEF")

///|
/// `Connected_DEF`
pub fn connected_def() -> @kernel.Thm {
  connected_def_c.get()
}

///|
/// ConnectedClosedHelp
fn step_191() -> Unit raise {
  connectedclosedhelp_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ e1 : (_) -> Bool, ∀ e2 : (_) -> Bool, topspace(alpha) == UNION(e1, e2) && INTER(e1, e2) == {} → (closed_in(alpha, e1) && closed_in(alpha, e2)) == (open_in(alpha, e1) && open_in(alpha, e2))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha e1 e2, H1 H2"),
        @readable.have(
          "e1 == DIFF(topspace(alpha), e2) && e2 == DIFF(topspace(alpha), e1)",
          "e12Complements",
          @readable.by(@readable.set, [@readable.Label("H1"), @readable.Label("H2")]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
            @readable.Label("e12Complements"),
            @readable.Thm("OPEN_IN_CLOSED_IN_EQ", () => open_in_closed_in_eq()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedclosedhelp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosedHelp")

///|
/// `ConnectedClosedHelp`
pub fn connectedclosedhelp() -> @kernel.Thm {
  connectedclosedhelp_c.get()
}

///|
/// ConnectedClosed
fn step_193() -> Unit raise {
  connectedclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], Connected(alpha) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, closed_in(alpha, e1) && closed_in(alpha, e2) && topspace(alpha) == UNION(e1, e2) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("Connected_DEF", () => connected_def())],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("ConnectedClosedHelp", () => connectedclosedhelp())],
        ),
      ],
    ),
  ))
}

///|
let connectedclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosed")

///|
/// `ConnectedClosed`
pub fn connectedclosed() -> @kernel.Thm {
  connectedclosed_c.get()
}

///|
/// ConnectedOpenIn
fn step_196() -> Unit raise {
  connectedopenin_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, open_in(subtopology(alpha, s), e1) && open_in(subtopology(alpha, s), e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("Connected_DEF", () => connected_def()),
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
            @readable.Thm("OpenInImpSubset", () => openinimpsubset()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedopenin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedOpenIn")

///|
/// `ConnectedOpenIn`
pub fn connectedopenin() -> @kernel.Thm {
  connectedopenin_c.get()
}

///|
/// ConnectedClosedIn
fn step_199() -> Unit raise {
  connectedclosedin_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, closed_in(subtopology(alpha, s), e1) && closed_in(subtopology(alpha, s), e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("ConnectedClosed", () => connectedclosed()),
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
            @readable.Thm("ClosedInImpSubset", () => closedinimpsubset()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedclosedin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosedIn")

///|
/// `ConnectedClosedIn`
pub fn connectedclosedin() -> @kernel.Thm {
  connectedclosedin_c.get()
}

///|
/// ConnectedSubtopology
fn step_202() -> Unit raise {
  connectedsubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, open_in(alpha, e1) && open_in(alpha, e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} && !(INTER(e1, s) == {}) && !(INTER(e2, s) == {}))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("Connected_DEF", () => connected_def()),
            @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
          ],
        ),
        @tactics.ap_term_tac,
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.intro_tac("H2"),
              @readable.consider(
                "t1 t2",
                "∃ t1 : (_) -> Bool, ∃ t2 : (_) -> Bool, open_in(alpha, t1) && open_in(alpha, t2) && s == UNION(INTER(t1, s), INTER(t2, s)) && INTER(INTER(t1, s), INTER(t2, s)) == {} && !(INTER(t1, s) == {}) && !(INTER(t2, s) == {})",
                "t12Exist",
                @readable.by(@readable.fol, [@readable.Label("H2")]),
              ),
              @readable.have(
                "SUBSET(s, UNION(t1, t2)) && INTER(t1, INTER(t2, s)) == {}",
                "",
                @readable.by(@readable.set, [@readable.Label("t12Exist")]),
              ),
              @readable.by(@readable.fol, [@readable.Label("t12Exist"), @readable.Prev]),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall e1 e2, e12Exist"),
        @readable.exists("INTER(e1, s)"),
        @readable.exists("INTER(e2, s)"),
        @readable.by(@readable.set, [@readable.Label("e12Exist")]),
      ],
    ),
  ))
}

///|
let connectedsubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedSubtopology")

///|
/// `ConnectedSubtopology`
pub fn connectedsubtopology() -> @kernel.Thm {
  connectedsubtopology_c.get()
}

///|
/// ConnectedSubtopology_ALT
fn step_204() -> Unit raise {
  connectedsubtopology_alt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == (∀ e1 : (_) -> Bool, ∀ e2 : (_) -> Bool, open_in(alpha, e1) && open_in(alpha, e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} → INTER(e1, s) == {} || INTER(e2, s) == {})",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [@readable.Thm("ConnectedSubtopology", () => connectedsubtopology())],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let connectedsubtopology_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedSubtopology_ALT")

///|
/// `ConnectedSubtopology_ALT`
pub fn connectedsubtopology_alt() -> @kernel.Thm {
  connectedsubtopology_alt_c.get()
}

///|
/// ConnectedClosedSubtopology
fn step_206() -> Unit raise {
  connectedclosedsubtopology_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, closed_in(alpha, e1) && closed_in(alpha, e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} && !(INTER(e1, s) == {}) && !(INTER(e2, s) == {}))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
          ],
        ),
        @tactics.ap_term_tac,
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall e1 e2, e12Exist"),
              @readable.exists("DIFF(topspace(alpha), e2)"),
              @readable.exists("DIFF(topspace(alpha), e1)"),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
                  @readable.Label("H1"),
                  @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                  @readable.Thm("DIFF_REFL", () => diff_refl()),
                  @readable.Thm("closed_in", () => closed_in()),
                  @readable.Label("e12Exist"),
                ],
              ),
              @readable.by(
                @readable.set,
                [@readable.Label("H1"), @readable.Label("e12Exist")],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall e1 e2, e12Exist"),
        @readable.exists("DIFF(topspace(alpha), e2)"),
        @readable.exists("DIFF(topspace(alpha), e1)"),
        @readable.have(
          "SUBSET(e1, topspace(alpha)) && SUBSET(e2, topspace(alpha))",
          "e12Top",
          @readable.by(
            @readable.fol,
            [@readable.Thm("closed_in", () => closed_in()), @readable.Label("e12Exist")],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("DIFF_REFL", () => diff_refl()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Label("e12Top"),
            @readable.Thm("OPEN_IN_CLOSED_IN", () => open_in_closed_in()),
          ],
        ),
        @readable.by(
          @readable.set,
          [@readable.Label("H1"), @readable.Label("e12Exist")],
        ),
      ],
    ),
  ))
}

///|
let connectedclosedsubtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosedSubtopology")

///|
/// `ConnectedClosedSubtopology`
pub fn connectedclosedsubtopology() -> @kernel.Thm {
  connectedclosedsubtopology_c.get()
}

///|
/// ConnectedClosedSubtopology_ALT
fn step_208() -> Unit raise {
  connectedclosedsubtopology_alt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) == (∀ e1 : (_) -> Bool, ∀ e2 : (_) -> Bool, closed_in(alpha, e1) && closed_in(alpha, e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} → INTER(e1, s) == {} || INTER(e2, s) == {})",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm(
              "ConnectedClosedSubtopology",
              () => connectedclosedsubtopology(),
            ),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let connectedclosedsubtopology_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosedSubtopology_ALT")

///|
/// `ConnectedClosedSubtopology_ALT`
pub fn connectedclosedsubtopology_alt() -> @kernel.Thm {
  connectedclosedsubtopology_alt_c.get()
}

///|
/// ConnectedClopen
fn step_210() -> Unit raise {
  connectedclopen_c.set(@readable.prove(
    "∀ alpha : Topology[_], Connected(alpha) == (∀ t : (_) -> Bool, open_in(alpha, t) && closed_in(alpha, t) → t == {} || t == topspace(alpha))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("Connected_DEF", () => connected_def()),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.TermRule(@class.taut, "(!(a : Bool) == (b : Bool)) == (a == !b)"),
            @readable.Thm("NOT_FORALL_THM", () => @class.not_forall_thm()),
            @readable.Thm("NOT_IMP", () => @class.not_imp()),
            @readable.Thm("DE_MORGAN_THM", () => @class.de_morgan_thm()),
          ],
        ),
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall e1 e2, H1 H2 H3 H4 H5 H6"),
              @readable.exists("e1"),
              @readable.have(
                "SUBSET(e1, topspace(alpha)) && e2 == DIFF(topspace(alpha), e1) && !(e1 == topspace(alpha))",
                "",
                @readable.by(
                  @readable.set,
                  [@readable.Label("H3"), @readable.Label("H4"), @readable.Label("H6")],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("H1"),
                  @readable.Prev,
                  @readable.Label("H2"),
                  @readable.Label("H5"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall t, H1"),
        @readable.exists("t"),
        @readable.exists("DIFF(topspace(alpha), t)"),
        @readable.by(@readable.set, [@readable.Label("H1")]),
      ],
    ),
  ))
}

///|
let connectedclopen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClopen")

///|
/// `ConnectedClopen`
pub fn connectedclopen() -> @kernel.Thm {
  connectedclopen_c.get()
}

///|
/// ConnectedClosedSet
fn step_215() -> Unit raise {
  connectedclosedset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, s) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, closed_in(alpha, e1) && closed_in(alpha, e2) && !(e1 == {}) && !(e2 == {}) && UNION(e1, e2) == s && INTER(e1, e2) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1, H2"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm(
              "ConnectedClosedSubtopology",
              () => connectedclosedsubtopology(),
            ),
          ],
        ),
        @tactics.ap_term_tac,
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall e1 e2, H3 H4 H5 H6 H7 H8"),
              @readable.exists("INTER(e1, s)"),
              @readable.exists("INTER(e2, s)"),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("H2"),
                  @readable.Label("H3"),
                  @readable.Label("H4"),
                  @readable.Label("H7"),
                  @readable.Label("H8"),
                  @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
                ],
              ),
              @readable.by(
                @readable.set,
                [@readable.Label("H5"), @readable.Label("H6")],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall e1 e2, H3 H4 H5 H6 H7 H8"),
        @readable.exists("e1"),
        @readable.exists("e2"),
        @readable.by(
          @readable.set,
          [
            @readable.Label("H3"),
            @readable.Label("H4"),
            @readable.Label("H7"),
            @readable.Label("H8"),
            @readable.Label("H5"),
            @readable.Label("H6"),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedclosedset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosedSet")

///|
/// `ConnectedClosedSet`
pub fn connectedclosedset() -> @kernel.Thm {
  connectedclosedset_c.get()
}

///|
/// ConnectedOpenSet
fn step_216() -> Unit raise {
  connectedopenset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) → Connected(subtopology(alpha, s)) == !(∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, open_in(alpha, e1) && open_in(alpha, e2) && !(e1 == {}) && !(e2 == {}) && UNION(e1, e2) == s && INTER(e1, e2) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
          ],
        ),
        @tactics.ap_term_tac,
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall e1 e2, H3 H4 H5 H6 H7 H8"),
              @readable.exists("INTER(e1, s)"),
              @readable.exists("INTER(e2, s)"),
              @readable.have(
                "SUBSET(e1, topspace(alpha)) && SUBSET(e2, topspace(alpha))",
                "e12Subsets",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("H3"),
                    @readable.Label("H4"),
                    @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
                  ],
                ),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("H1"),
                  @readable.Label("H3"),
                  @readable.Label("H4"),
                  @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
                  @readable.Label("H7"),
                  @readable.Label("H8"),
                ],
              ),
              @readable.by(
                @readable.set,
                [
                  @readable.Label("e12Subsets"),
                  @readable.Label("H5"),
                  @readable.Label("H6"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall e1 e2, H3 H4 H5 H6 H7 H8"),
        @readable.exists("e1"),
        @readable.exists("e2"),
        @readable.by(
          @readable.set,
          [
            @readable.Label("H3"),
            @readable.Label("H4"),
            @readable.Label("H7"),
            @readable.Label("H8"),
            @readable.Label("H5"),
            @readable.Label("H6"),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedopenset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedOpenSet")

///|
/// `ConnectedOpenSet`
pub fn connectedopenset() -> @kernel.Thm {
  connectedopenset_c.get()
}

///|
/// ConnectedEmpty
fn step_217() -> Unit raise {
  connectedempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], Connected(subtopology(alpha, {}))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("Connected_DEF", () => connected_def()),
            @readable.Thm("INTER_EMPTY", () => @sets.inter_empty()),
            @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedEmpty")

///|
/// `ConnectedEmpty`
pub fn connectedempty() -> @kernel.Thm {
  connectedempty_c.get()
}

///|
/// ConnectedSing
fn step_219() -> Unit raise {
  connectedsing_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ a : _, IN(a, topspace(alpha)) → Connected(subtopology(alpha, {a}))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("Connected_DEF", () => connected_def()),
            @readable.Thm("SING_SUBSET", () => @sets.sing_subset()),
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let connectedsing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedSing")

///|
/// `ConnectedSing`
pub fn connectedsing() -> @kernel.Thm {
  connectedsing_c.get()
}

///|
/// ConnectedUnions
fn step_221() -> Unit raise {
  connectedunions_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, P) → SUBSET(s, topspace(alpha))) → (∀ s : (_) -> Bool, IN(s, P) → Connected(subtopology(alpha, s))) && !(INTERS(P) == {}) → Connected(subtopology(alpha, UNIONS(P)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha P, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
            @readable.Thm("UNIONS_SUBSET", () => @sets.unions_subset()),
            @readable.Thm("NOT_EXISTS_THM", () => @class.not_exists_thm()),
          ],
        ),
        @readable.intro_tac("allConnected PnotDisjoint, forall [d/e1] [e/e2]"),
        @readable.consider(
          "a",
          "∃ a : _, ∀ t : (_) -> Bool, IN(t, P) → IN(a, t)",
          "aInterP",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("PnotDisjoint"),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTERS", () => @sets.in_inters()),
            ],
          ),
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [@readable.TermRule(@class.taut, "∀ p : Bool, !p == (p → false)")],
        ),
        @readable.intro_tac("dOpen eOpen Pde deDisjoint dNonempty eNonempty"),
        @readable.have(
          "IN(a, d) || IN(a, e)",
          "adORae",
          @readable.by(
            @readable.set,
            [
              @readable.Label("aInterP"),
              @readable.Label("Pde"),
              @readable.Label("dNonempty"),
            ],
          ),
        ),
        @readable.consider(
          "s x t y",
          "∃ s : (_) -> Bool, ∃ x : _, ∃ t : (_) -> Bool, ∃ y : _, IN(s, P) && IN(x, INTER(d, s)) && IN(t, P) && IN(y, INTER(e, t))",
          "xdsANDyet",
          @readable.by(
            @readable.set,
            [@readable.Label("dNonempty"), @readable.Label("eNonempty")],
          ),
        ),
        @readable.have(
          "INTER(d, INTER(e, s)) == {} && INTER(d, INTER(e, t)) == {}",
          "",
          @readable.by(@readable.set, [@readable.Prev, @readable.Label("deDisjoint")]),
        ),
        @readable.have(
          "(INTER(d, s) == {} || INTER(e, s) == {}) && (INTER(d, t) == {} || INTER(e, t) == {})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("xdsANDyet"),
              @readable.Label("allConnected"),
              @readable.Label("dOpen"),
              @readable.Label("eOpen"),
              @readable.Label("Pde"),
              @readable.Prev,
            ],
          ),
        ),
        @readable.by(
          @readable.set,
          [
            @readable.Label("adORae"),
            @readable.Label("xdsANDyet"),
            @readable.Label("aInterP"),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedunions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedUnions")

///|
/// `ConnectedUnions`
pub fn connectedunions() -> @kernel.Thm {
  connectedunions_c.get()
}

///|
/// ConnectedUnion
fn step_227() -> Unit raise {
  connectedunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && !(INTER(s, t) == {}) && Connected(subtopology(alpha, s)) && Connected(subtopology(alpha, t)) → Connected(subtopology(alpha, UNION(s, t)))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("UNIONS_2", () => @sets.unions_2()),
            ),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("INTERS_2", () => @sets.inters_2()),
            ),
          ],
        ),
        @readable.intro_tac("forall alpha s t, H1 H2 H3 H4 H5"),
        @readable.have(
          "∀ u : (_) -> Bool, IN(u, {s, t}) → SUBSET(u, topspace(alpha))",
          "stEuclidean",
          @readable.by(@readable.set, [@readable.Label("H1"), @readable.Label("H2")]),
        ),
        @readable.have(
          "∀ u : (_) -> Bool, IN(u, {s, t}) → Connected(subtopology(alpha, u))",
          "",
          @readable.by(@readable.set, [@readable.Label("H4"), @readable.Label("H5")]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("stEuclidean"),
            @readable.Prev,
            @readable.Label("H3"),
            @readable.Thm("ConnectedUnions", () => connectedunions()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedUnion")

///|
/// `ConnectedUnion`
pub fn connectedunion() -> @kernel.Thm {
  connectedunion_c.get()
}

///|
/// ConnectedDiffOpenFromClosed
fn step_229() -> Unit raise {
  connecteddiffopenfromclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(u, topspace(alpha)) → SUBSET(s, t) && SUBSET(t, u) && open_in(alpha, s) && closed_in(alpha, t) && Connected(subtopology(alpha, u)) && Connected(subtopology(alpha, DIFF(t, s))) → Connected(subtopology(alpha, DIFF(u, s)))",
    @readable.steps_then(
      [
        @readable.by(
          @simp.once_rewrite_tac,
          [
            @readable.TermRule(
              @class.taut,
              "∀ a : Bool, ∀ b : Bool, ∀ c : Bool, ∀ d : Bool, ∀ e : Bool, ∀ f : Bool, ∀ g : Bool, (a && b && c && d && e && f → g) == (a && b && c && d → !g → f → !e)",
            ),
          ],
        ),
        @readable.intro_tac("forall alpha s t u, uSubset, st tu sOpen tClosed"),
        @readable.have(
          "SUBSET(DIFF(t, s), topspace(alpha)) && SUBSET(DIFF(u, s), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("uSubset"),
              @readable.Label("sOpen"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
              @readable.Label("tClosed"),
              @readable.Thm("closed_in", () => closed_in()),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("uSubset"),
            @readable.Prev,
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
          ],
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall [v/e1] [w/e2]"),
        @readable.intro_tac(
          "vOpen wOpen u_sDisconnected vwDisjoint vNonempty wNonempty",
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("NOT_EXISTS_THM", () => @class.not_exists_thm())],
        ),
        @readable.intro_tac("t_sConnected"),
        @readable.have(
          "SUBSET(DIFF(t, s), UNION(v, w)) && INTER(v, INTER(w, DIFF(t, s))) == {}",
          "",
          @readable.by(
            @readable.set,
            [
              @readable.Label("tu"),
              @readable.Label("u_sDisconnected"),
              @readable.Label("vwDisjoint"),
            ],
          ),
        ),
        @readable.have(
          "INTER(v, DIFF(t, s)) == {} || INTER(w, DIFF(t, s)) == {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("t_sConnected"),
              @readable.Label("vOpen"),
              @readable.Label("wOpen"),
              @readable.Prev,
            ],
          ),
        ),
      ],
      @readable.case_split(
        "vEmpty | wEmpty",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["INTER(v, DIFF(t, s)) == {}", "INTER(w, DIFF(t, s)) == {}"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.exists("UNION(w, s)"),
                @readable.exists("DIFF(v, t)"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("vOpen"),
                    @readable.Label("wOpen"),
                    @readable.Label("sOpen"),
                    @readable.Label("tClosed"),
                    @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
                    @readable.Thm("OPEN_IN_DIFF", () => open_in_diff()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("st"),
                    @readable.Label("tu"),
                    @readable.Label("u_sDisconnected"),
                    @readable.Label("vEmpty"),
                    @readable.Label("vwDisjoint"),
                    @readable.Label("wNonempty"),
                    @readable.Label("vNonempty"),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.exists("UNION(v, s)"),
                @readable.exists("DIFF(w, t)"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("vOpen"),
                    @readable.Label("wOpen"),
                    @readable.Label("sOpen"),
                    @readable.Label("tClosed"),
                    @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
                    @readable.Thm("OPEN_IN_DIFF", () => open_in_diff()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("st"),
                    @readable.Label("tu"),
                    @readable.Label("u_sDisconnected"),
                    @readable.Label("wEmpty"),
                    @readable.Label("vwDisjoint"),
                    @readable.Label("wNonempty"),
                    @readable.Label("vNonempty"),
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
let connecteddiffopenfromclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedDiffOpenFromClosed")

///|
/// `ConnectedDiffOpenFromClosed`
pub fn connecteddiffopenfromclosed() -> @kernel.Thm {
  connecteddiffopenfromclosed_c.get()
}

///|
/// ConnectedDisjointUnionsOpenUniquePart1
fn step_233() -> Unit raise {
  connecteddisjointunionsopenuniquepart1_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ f : ((_) -> Bool) -> Bool, ∀ f' : ((_) -> Bool) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ a : _, pairwise(DISJOINT, f) && pairwise(DISJOINT, f') && (∀ s : (_) -> Bool, IN(s, f) → open_in(alpha, s) && Connected(subtopology(alpha, s)) && !(s == {})) && (∀ s : (_) -> Bool, IN(s, f') → open_in(alpha, s) && Connected(subtopology(alpha, s)) && !(s == {})) && UNIONS(f) == UNIONS(f') && IN(s, f) && IN(t, f') && IN(a, s) && IN(a, t) → SUBSET(s, t)",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall alpha f f' s t a, pDISJf pDISJf' fConn f'Conn Uf_Uf' sf tf' a_s a_t",
        ),
        @readable.have(
          "∀ s : (_) -> Bool, IN(s, f) → SUBSET(s, topspace(alpha))",
          "fTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("fConn"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            ],
          ),
        ),
        @readable.have(
          "∀ s : (_) -> Bool, IN(s, f') → SUBSET(s, topspace(alpha))",
          "f'Top",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("f'Conn"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            ],
          ),
        ),
        @readable.by(@readable.rewrite, [@readable.Thm("SUBSET", () => @sets.subset())]),
        @readable.intro_tac("forall [b], bs"),
        @readable.assuming(
          "!IN(b, t)",
          "Contradiction",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "∃ e1 : (_) -> Bool, ∃ e2 : (_) -> Bool, open_in(alpha, e1) && open_in(alpha, e2) && INTER(e1, INTER(e2, s)) == {} && SUBSET(s, UNION(e1, e2)) && !(INTER(e1, s) == {}) && !(INTER(e2, s) == {})",
          "",
          @readable.steps(
            [
              @readable.exists("t"),
              @readable.exists("UNIONS(DELETE(f', t))"),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("tf'"),
                  @readable.Label("f'Conn"),
                  @readable.Thm("IN_DELETE", () => @sets.in_delete()),
                  @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
                ],
              ),
              @readable.conj_tac(
                "Right",
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("sf"),
                    @readable.Label("Uf_Uf'"),
                    @readable.Label("a_s"),
                    @readable.Label("a_t"),
                    @readable.Label("sf"),
                    @readable.Label("bs"),
                    @readable.Label("Contradiction"),
                  ],
                ),
              ),
              @readable.by_thm(
                @tactics.match_mp_tac,
                @readable.TermRule(
                  @sets.set_rule,
                  "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, INTER(t, u) == {} → INTER(t, INTER(u, s)) == {}",
                ),
              ),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("INTER_UNIONS", () => @sets.inter_unions()),
                  @readable.Thm("EMPTY_UNIONS", () => @sets.empty_unions()),
                  @readable.Thm("FORALL_IN_GSPEC", () => @sets.forall_in_gspec()),
                ],
              ),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("IN_DELETE", () => @sets.in_delete()),
                  @readable.Rule(
                    @equal.gsym,
                    @readable.Thm("DISJOINT", () => @sets.disjoint()),
                  ),
                ],
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("pDISJf'"),
                  @readable.Label("tf'"),
                  @readable.Thm("pairwise", () => @sets.pairwise()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("sf"),
            @readable.Label("fTop"),
            @readable.Label("fConn"),
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connecteddisjointunionsopenuniquepart1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedDisjointUnionsOpenUniquePart1")

///|
/// `ConnectedDisjointUnionsOpenUniquePart1`
pub fn connecteddisjointunionsopenuniquepart1() -> @kernel.Thm {
  connecteddisjointunionsopenuniquepart1_c.get()
}

///|
/// ConnectedDisjointUnionsOpenUnique
fn step_238() -> Unit raise {
  connecteddisjointunionsopenunique_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ f : ((_) -> Bool) -> Bool, ∀ f' : ((_) -> Bool) -> Bool, pairwise(DISJOINT, f) && pairwise(DISJOINT, f') && (∀ s : (_) -> Bool, IN(s, f) → open_in(alpha, s) && Connected(subtopology(alpha, s)) && !(s == {})) && (∀ s : (_) -> Bool, IN(s, f') → open_in(alpha, s) && Connected(subtopology(alpha, s)) && !(s == {})) && UNIONS(f) == UNIONS(f') → f == f'",
    @readable.steps(
      [
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.ThmsTermRule(
            ths => tm => @meson.meson(ths, tm),
            [@readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym())],
            "(∀ alpha : _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, (P : (_, (_) -> Bool, (_) -> Bool) -> Bool)(alpha, s, t) → P(alpha, t, s)) && (∀ alpha : _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, P(alpha, s, t) → SUBSET(s, t)) → (∀ alpha : _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, P(alpha, s, t) → s == t)",
          ),
        ),
        @readable.conj_tac("Left", @readable.by(@readable.fol, [])),
        @readable.intro_tac("forall alpha f f', pDISJf pDISJf' fConn f'Conn Uf_Uf'"),
        @readable.by(@readable.rewrite, [@readable.Thm("SUBSET", () => @sets.subset())]),
        @readable.intro_tac("forall [s], sf"),
        @readable.consider(
          "t a",
          "∃ t : (_) -> Bool, ∃ a : _, IN(t, f') && IN(a, s) && IN(a, t)",
          "taExist",
          @readable.by(
            @readable.set,
            [@readable.Label("sf"), @readable.Label("fConn"), @readable.Label("Uf_Uf'")],
          ),
        ),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.TermsRule(
            tms => th => @bool.ispecl(tms, th),
            ["alpha", "f", "f'", "s", "t"],
            @readable.Thm(
              "ConnectedDisjointUnionsOpenUniquePart1",
              () => connecteddisjointunionsopenuniquepart1(),
            ),
          ),
        ),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.TermsRule(
            tms => th => @bool.ispecl(tms, th),
            ["alpha", "f'", "f", "t", "s"],
            @readable.Thm(
              "ConnectedDisjointUnionsOpenUniquePart1",
              () => connecteddisjointunionsopenuniquepart1(),
            ),
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("pDISJf"),
            @readable.Label("pDISJf'"),
            @readable.Label("fConn"),
            @readable.Label("f'Conn"),
            @readable.Label("Uf_Uf'"),
            @readable.Label("sf"),
            @readable.Label("taExist"),
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
            @readable.Label("taExist"),
          ],
        ),
      ],
    ),
  ))
}

///|
let connecteddisjointunionsopenunique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedDisjointUnionsOpenUnique")

///|
/// `ConnectedDisjointUnionsOpenUnique`
pub fn connecteddisjointunionsopenunique() -> @kernel.Thm {
  connecteddisjointunionsopenunique_c.get()
}

///|
/// ConnectedFromClosedUnionAndInter
fn step_241() -> Unit raise {
  connectedfromclosedunionandinter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) && closed_in(alpha, s) && closed_in(alpha, t) && Connected(subtopology(alpha, UNION(s, t))) && Connected(subtopology(alpha, INTER(s, t))) → Connected(subtopology(alpha, s)) && Connected(subtopology(alpha, t))",
    @readable.steps_then(
      [
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.ThmsTermRule(
            ths => tm => @meson.meson(ths, tm),
            [],
            "(∀ alpha : _, ∀ s : _, ∀ t : _, (P : (_, _, _) -> Bool)(alpha, s, t) → P(alpha, t, s)) && (∀ alpha : _, ∀ s : _, ∀ t : _, P(alpha, s, t) → (Q : (_, _) -> Bool)(alpha, s)) → (∀ alpha : _, ∀ s : _, ∀ t : _, P(alpha, s, t) → Q(alpha, s) && Q(alpha, t))",
          ),
        ),
        @readable.conj_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("UNION_COMM", () => @sets.union_comm()),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
            ],
          ),
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [
            @readable.TermRule(
              @class.taut,
              "∀ a : Bool, ∀ b : Bool, ∀ c : Bool, ∀ d : Bool, ∀ e : Bool, ∀ f : Bool, (a && b && c && d && e → f) == (a && b && c && e && !f → !d)",
            ),
          ],
        ),
        @readable.intro_tac(
          "forall alpha s t, stUnionTop sClosed tClosed stInterConn  NOTsConn",
        ),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stUnionTop"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("stUnionTop"),
            @readable.Thm(
              "ConnectedClosedSubtopology",
              () => connectedclosedsubtopology(),
            ),
          ],
        ),
        @readable.consider(
          "u v",
          "∃ u : (_) -> Bool, ∃ v : (_) -> Bool, closed_in(alpha, u) && closed_in(alpha, v) && !(u == {}) && !(v == {}) && UNION(u, v) == s && INTER(u, v) == {}",
          "sDisConn",
          @readable.steps(
            [
              @readable.by_thm(
                th => @tactics.mp_tac(th),
                @readable.TermsRule(
                  tms => th => @bool.ispecl(tms, th),
                  ["alpha", "s"],
                  @readable.Thm("ConnectedClosedSet", () => connectedclosedset()),
                ),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("stTop"),
                  @readable.Label("sClosed"),
                  @readable.Label("NOTsConn"),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(s, t), UNION(u, v)) && INTER(u, INTER(v, INTER(s, t))) == {}",
          "stuvProps",
          @readable.by(@readable.set, [@readable.Label("sDisConn")]),
        ),
        @readable.have(
          "INTER(u, INTER(s, t)) == {} || INTER(v, INTER(s, t)) == {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Label("stInterConn"),
              @readable.Label("sDisConn"),
              @readable.Prev,
              @readable.Thm(
                "ConnectedClosedSubtopology_ALT",
                () => connectedclosedsubtopology_alt(),
              ),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "vstEmpty | ustEmpty",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["INTER(v, INTER(s, t)) == {}", "INTER(u, INTER(s, t)) == {}"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.exists("UNION(t, u)"),
                @readable.exists("v"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("tClosed"),
                    @readable.Label("sDisConn"),
                    @readable.Thm("CLOSED_IN_UNION", () => closed_in_union()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("stuvProps"),
                    @readable.Label("sDisConn"),
                    @readable.Label("vstEmpty"),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.exists("UNION(t, v)"),
                @readable.exists("u"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("tClosed"),
                    @readable.Label("sDisConn"),
                    @readable.Thm("CLOSED_IN_UNION", () => closed_in_union()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("stuvProps"),
                    @readable.Label("sDisConn"),
                    @readable.Label("ustEmpty"),
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
let connectedfromclosedunionandinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedFromClosedUnionAndInter")

///|
/// `ConnectedFromClosedUnionAndInter`
pub fn connectedfromclosedunionandinter() -> @kernel.Thm {
  connectedfromclosedunionandinter_c.get()
}

///|
/// ConnectedFromOpenUnionAndInter
fn step_245() -> Unit raise {
  connectedfromopenunionandinter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) && open_in(alpha, s) && open_in(alpha, t) && Connected(subtopology(alpha, UNION(s, t))) && Connected(subtopology(alpha, INTER(s, t))) → Connected(subtopology(alpha, s)) && Connected(subtopology(alpha, t))",
    @readable.steps_then(
      [
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.ThmsTermRule(
            ths => tm => @meson.meson(ths, tm),
            [],
            "(∀ alpha : _, ∀ s : _, ∀ t : _, (P : (_, _, _) -> Bool)(alpha, s, t) → P(alpha, t, s)) && (∀ alpha : _, ∀ s : _, ∀ t : _, P(alpha, s, t) → (Q : (_, _) -> Bool)(alpha, s)) → (∀ alpha : _, ∀ s : _, ∀ t : _, P(alpha, s, t) → Q(alpha, s) && Q(alpha, t))",
          ),
        ),
        @readable.conj_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("UNION_COMM", () => @sets.union_comm()),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
            ],
          ),
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [
            @readable.TermRule(
              @class.taut,
              "∀ a : Bool, ∀ b : Bool, ∀ c : Bool, ∀ d : Bool, ∀ e : Bool, ∀ f : Bool, (a && b && c && d && e → f) == (a && b && c && e && !f → !d)",
            ),
          ],
        ),
        @readable.intro_tac(
          "forall alpha s t, stUnionTop sOpen tOpen stInterConn  NOTsConn",
        ),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stUnionTop"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("stUnionTop"),
            @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
          ],
        ),
        @readable.consider(
          "u v",
          "∃ u : (_) -> Bool, ∃ v : (_) -> Bool, open_in(alpha, u) && open_in(alpha, v) && !(u == {}) && !(v == {}) && UNION(u, v) == s && INTER(u, v) == {}",
          "sDisConn",
          @readable.steps(
            [
              @readable.by_thm(
                th => @tactics.mp_tac(th),
                @readable.TermsRule(
                  tms => th => @bool.ispecl(tms, th),
                  ["alpha", "s"],
                  @readable.Thm("ConnectedOpenSet", () => connectedopenset()),
                ),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("stTop"),
                  @readable.Label("sOpen"),
                  @readable.Label("NOTsConn"),
                ],
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(s, t), UNION(u, v)) && INTER(u, INTER(v, INTER(s, t))) == {}",
          "stuvProps",
          @readable.by(@readable.set, [@readable.Label("sDisConn")]),
        ),
        @readable.have(
          "INTER(u, INTER(s, t)) == {} || INTER(v, INTER(s, t)) == {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Label("stInterConn"),
              @readable.Label("sDisConn"),
              @readable.Prev,
              @readable.Thm(
                "ConnectedSubtopology_ALT",
                () => connectedsubtopology_alt(),
              ),
            ],
          ),
        ),
      ],
      @readable.case_split(
        "vstEmpty | ustEmpty",
        @readable.by(@readable.fol, [@readable.Prev]),
        @list.List(["INTER(v, INTER(s, t)) == {}", "INTER(u, INTER(s, t)) == {}"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.exists("UNION(t, u)"),
                @readable.exists("v"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("tOpen"),
                    @readable.Label("sDisConn"),
                    @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("stuvProps"),
                    @readable.Label("sDisConn"),
                    @readable.Label("vstEmpty"),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.exists("UNION(t, v)"),
                @readable.exists("u"),
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Label("tOpen"),
                    @readable.Label("sDisConn"),
                    @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
                  ],
                ),
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("stuvProps"),
                    @readable.Label("sDisConn"),
                    @readable.Label("ustEmpty"),
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
let connectedfromopenunionandinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedFromOpenUnionAndInter")

///|
/// `ConnectedFromOpenUnionAndInter`
pub fn connectedfromopenunionandinter() -> @kernel.Thm {
  connectedfromopenunionandinter_c.get()
}

///|
/// ConnectedInduction
fn step_248() -> Unit raise {
  connectedinduction_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : (_) -> Bool, ∀ Q : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) && (∀ t : (_) -> Bool, ∀ a : _, open_in(subtopology(alpha, s), t) && IN(a, t) → (∃ z : _, IN(z, t) && P(z))) && (∀ a : _, IN(a, s) → (∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(a, t) && (∀ x : _, ∀ y : _, IN(x, t) && IN(y, t) && P(x) && P(y) && Q(x) → Q(y)))) → (∀ a : _, ∀ b : _, IN(a, s) && IN(b, s) && P(a) && P(b) && Q(a) → Q(b))",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall alpha P Q s, sTop, sConn atOpenImplies_ztPz asImplies_atOpen_xytPxPyQxasImpliesQy, forall a b, aINs bINs Pa Pb Qa",
        ),
        @readable.assuming("!Q(b)", "NotQb", @readable.by(@readable.fol, [])),
        @readable.have(
          "!Connected(subtopology(alpha, s))",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("sTop"),
                  @readable.Thm("ConnectedOpenIn", () => connectedopenin()),
                ],
              ),
              @readable.exists(
                "{(b : _) | ∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(b, t) && (∀ x : _, IN(x, t) && P(x) → Q(x))}",
              ),
              @readable.exists(
                "{(b : _) | ∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(b, t) && (∀ x : _, IN(x, t) && P(x) → !Q(x))}",
              ),
              @readable.conj_tac(
                "Left",
                @readable.steps(
                  [
                    @readable.by(
                      @simp.once_rewrite_tac,
                      [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
                    ),
                    @readable.intro_tac("forall [c]"),
                    @readable.by(
                      @readable.rewrite,
                      [@readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm())],
                    ),
                    @readable.by_thm(
                      @tactics.match_mp_tac,
                      @readable.Thm("MONO_EXISTS", () => @theorems.mono_exists()),
                    ),
                    @readable.by(@readable.set, [@readable.Label("atOpenImplies_ztPz")]),
                  ],
                ),
              ),
              @readable.conj_tac(
                "Left",
                @readable.steps(
                  [
                    @readable.by(
                      @simp.once_rewrite_tac,
                      [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
                    ),
                    @readable.intro_tac("forall [c]"),
                    @readable.by(
                      @readable.rewrite,
                      [@readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm())],
                    ),
                    @readable.by_thm(
                      @tactics.match_mp_tac,
                      @readable.Thm("MONO_EXISTS", () => @theorems.mono_exists()),
                    ),
                    @readable.by(@readable.set, [@readable.Label("atOpenImplies_ztPz")]),
                  ],
                ),
              ),
              @readable.conj_tac(
                "Left",
                @readable.steps(
                  [
                    @readable.by(
                      @readable.rewrite,
                      [
                        @readable.Thm("SUBSET", () => @sets.subset()),
                        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
                        @readable.Thm("IN_UNION", () => @sets.in_union()),
                      ],
                    ),
                    @readable.intro_tac("forall [c], cs"),
                    @readable.by_thm(
                      th => @tactics.mp_tac(th),
                      @readable.TermsRule(
                        tms => th => @bool.specl(tms, th),
                        ["c"],
                        @readable.Label("asImplies_atOpen_xytPxPyQxasImpliesQy"),
                      ),
                    ),
                    @readable.by(@readable.set, [@readable.Label("cs")]),
                  ],
                ),
              ),
              @readable.conj_tac(
                "Right",
                @readable.by(
                  @readable.set,
                  [
                    @readable.Label("aINs"),
                    @readable.Label("bINs"),
                    @readable.Label("Qa"),
                    @readable.Label("NotQb"),
                    @readable.Label("asImplies_atOpen_xytPxPyQxasImpliesQy"),
                    @readable.Label("Pa"),
                    @readable.Label("Pb"),
                  ],
                ),
              ),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Thm("EXTENSION", () => @sets.extension()),
                  @readable.Thm("IN_INTER", () => @sets.in_inter()),
                  @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
                  @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
                ],
              ),
              @readable.intro_tac("forall [c]"),
              @readable.by(
                @simp.once_rewrite_tac,
                [@readable.TermRule(@class.taut, "∀ p : Bool, !p == (p → false)")],
              ),
              @readable.intro_tac("Qx NotQx"),
              @readable.consider(
                "t",
                "∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(c, t) && (∀ x : _, IN(x, t) && P(x) → Q(x))",
                "tExists",
                @readable.by(@readable.fol, [@readable.Label("Qx")]),
              ),
              @readable.consider(
                "u",
                "∃ u : (_) -> Bool, open_in(subtopology(alpha, s), u) && IN(c, u) && (∀ x : _, IN(x, u) && P(x) → !Q(x))",
                "uExists",
                @readable.by(@readable.fol, [@readable.Label("NotQx")]),
              ),
              @readable.by_thm(
                th => @tactics.mp_tac(th),
                @readable.TermsRule(
                  tms => th => @bool.specl(tms, th),
                  ["INTER(t, u)", "c"],
                  @readable.Label("atOpenImplies_ztPz"),
                ),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("tExists"),
                  @readable.Label("uExists"),
                  @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
                ],
              ),
              @readable.by(
                @readable.set,
                [@readable.Label("tExists"), @readable.Label("uExists")],
              ),
            ],
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("sConn"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let connectedinduction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedInduction")

///|
/// `ConnectedInduction`
pub fn connectedinduction() -> @kernel.Thm {
  connectedinduction_c.get()
}

///|
/// ConnectedEquivalenceRelationGen
fn step_253() -> Unit raise {
  connectedequivalencerelationgen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : (_) -> Bool, ∀ R : (_, _) -> Bool, ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) && (∀ x : _, ∀ y : _, ∀ z : _, R(x, y) && R(y, z) → R(x, z)) && (∀ t : (_) -> Bool, ∀ a : _, open_in(subtopology(alpha, s), t) && IN(a, t) → (∃ z : _, IN(z, t) && P(z))) && (∀ a : _, IN(a, s) → (∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(a, t) && (∀ x : _, ∀ y : _, IN(x, t) && IN(y, t) && P(x) && P(y) → R(x, y)))) → (∀ a : _, ∀ b : _, IN(a, s) && IN(b, s) && P(a) && P(b) → R(a, b))",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall alpha P R s, sTop, sConn Rtrans atOpenImplies_ztPz asImplies_atOpen_xytPxPyImpliesRxy, forall a b, aINs bINs Pa Pb",
        ),
        @readable.have(
          "∀ a : _, IN(a, s) && P(a) → (∀ b : _, ∀ c : _, IN(b, s) && IN(c, s) && P(b) && P(c) && R(a, b) → R(a, c))",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall [p/a], pINs Pp"),
              @readable.by_thm(
                th => @tactics.mp_tac(th),
                @readable.TermsRule(
                  tms => th => @bool.ispecl(tms, th),
                  ["alpha", "P", "(x : _) => R(p, x)", "s"],
                  @readable.Thm("ConnectedInduction", () => connectedinduction()),
                ),
              ),
              @readable.by(
                @readable.rewrite,
                [
                  @readable.Label("sTop"),
                  @readable.Label("sConn"),
                  @readable.Label("atOpenImplies_ztPz"),
                ],
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("asImplies_atOpen_xytPxPyImpliesRxy"),
                  @readable.Label("Rtrans"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("aINs"),
            @readable.Label("Pa"),
            @readable.Label("bINs"),
            @readable.Label("Pb"),
            @readable.Label("asImplies_atOpen_xytPxPyImpliesRxy"),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedequivalencerelationgen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedEquivalenceRelationGen")

///|
/// `ConnectedEquivalenceRelationGen`
pub fn connectedequivalencerelationgen() -> @kernel.Thm {
  connectedequivalencerelationgen_c.get()
}

///|
/// ConnectedInductionSimple
fn step_255() -> Unit raise {
  connectedinductionsimple_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ P : (_) -> Bool, ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) && (∀ a : _, IN(a, s) → (∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(a, t) && (∀ x : _, ∀ y : _, IN(x, t) && IN(y, t) && P(x) → P(y)))) → (∀ a : _, ∀ b : _, IN(a, s) && IN(b, s) && P(a) → P(b))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha P s, sTop"),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.TermsRule(
            tms => th => @bool.ispecl(tms, th),
            ["alpha", "(x : _) => true || IN(x, s)", "P", "s"],
            @readable.Thm("ConnectedInduction", () => connectedinduction()),
          ),
        ),
        @readable.by(@readable.fol, [@readable.Label("sTop")]),
      ],
    ),
  ))
}

///|
let connectedinductionsimple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedInductionSimple")

///|
/// `ConnectedInductionSimple`
pub fn connectedinductionsimple() -> @kernel.Thm {
  connectedinductionsimple_c.get()
}

///|
/// ConnectedEquivalenceRelation
fn step_256() -> Unit raise {
  connectedequivalencerelation_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ R : (_, _) -> Bool, ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) && (∀ x : _, ∀ y : _, R(x, y) → R(y, x)) && (∀ x : _, ∀ y : _, ∀ z : _, R(x, y) && R(y, z) → R(x, z)) && (∀ a : _, IN(a, s) → (∃ t : (_) -> Bool, open_in(subtopology(alpha, s), t) && IN(a, t) && (∀ x : _, IN(x, t) → R(a, x)))) → (∀ a : _, ∀ b : _, IN(a, s) && IN(b, s) → R(a, b))",
    @readable.steps(
      [
        @readable.intro_tac(
          "forall alpha R s, sTop, sConn Rcomm Rtrans asImplies_atOpen_xtImpliesRax",
        ),
        @readable.have(
          "∀ a : _, IN(a, s) → (∀ b : _, ∀ c : _, IN(b, s) && IN(c, s) && R(a, b) → R(a, c))",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall [p/a], pINs"),
              @readable.by_thm(
                th => @tactics.mp_tac(th),
                @readable.TermsRule(
                  tms => th => @bool.ispecl(tms, th),
                  ["alpha", "(x : _) => R(p, x)", "s"],
                  @readable.Thm(
                    "ConnectedInductionSimple",
                    () => connectedinductionsimple(),
                  ),
                ),
              ),
              @readable.by(
                @readable.rewrite,
                [@readable.Label("sTop"), @readable.Label("sConn")],
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("asImplies_atOpen_xtImpliesRax"),
                  @readable.Label("Rcomm"),
                  @readable.Label("Rtrans"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("asImplies_atOpen_xtImpliesRax"), @readable.Prev],
        ),
      ],
    ),
  ))
}

///|
let connectedequivalencerelation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedEquivalenceRelation")

///|
/// `ConnectedEquivalenceRelation`
pub fn connectedequivalencerelation() -> @kernel.Thm {
  connectedequivalencerelation_c.get()
}

///|
/// LimitPointOf
fn step_258() -> Unit raise {
  limitpointof_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ s : (_) -> Bool, (LimitPointOf : (Topology[_], (_) -> Bool, _) -> Bool)(alpha, s) == {(x : _) | SUBSET(s, topspace(alpha)) && IN(x, topspace(alpha)) && (∀ t : (_) -> Bool, IN(x, t) && open_in(alpha, t) → (∃ y : _, !(y == x) && IN(y, s) && IN(y, t)))}"))
}

///|
let limitpointof_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LimitPointOf")

///|
/// `LimitPointOf`
pub fn limitpointof() -> @kernel.Thm {
  limitpointof_c.get()
}

///|
/// IN_LimitPointOf
fn step_259() -> Unit raise {
  in_limitpointof_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ x : _, SUBSET(s, topspace(alpha)) → IN(x, LimitPointOf(alpha, s)) == (IN(x, topspace(alpha)) && (∀ t : (_) -> Bool, IN(x, t) && open_in(alpha, t) → (∃ y : _, !(y == x) && IN(y, s) && IN(y, t))))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
        @readable.Thm("LimitPointOf", () => limitpointof()),
      ],
    ),
  ))
}

///|
let in_limitpointof_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_LimitPointOf")

///|
/// `IN_LimitPointOf`
pub fn in_limitpointof() -> @kernel.Thm {
  in_limitpointof_c.get()
}

///|
/// NotLimitPointOf
fn step_261() -> Unit raise {
  notlimitpointof_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ x : _, SUBSET(s, topspace(alpha)) && IN(x, topspace(alpha)) → NOTIN(x, LimitPointOf(alpha, s)) == (∃ t : (_) -> Bool, IN(x, t) && open_in(alpha, t) && INTER(s, DIFF(t, {x})) == {})",
    @readable.steps(
      [
        @readable.by(
          @simp.once_rewrite_tac,
          [@readable.TermRule(@class.taut, "∀ a : Bool, ∀ b : Bool, (a == b) == (!a == !b)")],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("NOT_EXISTS_THM", () => @class.not_exists_thm()),
            @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
            @readable.TermRule(
              @class.taut,
              "∀ a : Bool, ∀ b : Bool, !(a && b && (c : Bool)) == (a && b → !c)",
            ),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            @readable.Thm("IN_SING", () => @sets.in_sing()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let notlimitpointof_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NotLimitPointOf")

///|
/// `NotLimitPointOf`
pub fn notlimitpointof() -> @kernel.Thm {
  notlimitpointof_c.get()
}

///|
/// LimptSubset
fn step_266() -> Unit raise {
  limptsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → SUBSET(s, t) → SUBSET(LimitPointOf(alpha, s), LimitPointOf(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, tTop, st"),
        @readable.have(
          "SUBSET(s, topspace(alpha))",
          "sTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tTop"),
              @readable.Label("st"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("tTop"),
            @readable.Label("sTop"),
            @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("st"), @readable.Thm("SUBSET", () => @sets.subset())],
        ),
      ],
    ),
  ))
}

///|
let limptsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LimptSubset")

///|
/// `LimptSubset`
pub fn limptsubset() -> @kernel.Thm {
  limptsubset_c.get()
}

///|
/// ClosedLimpt
fn step_267() -> Unit raise {
  closedlimpt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, s) == SUBSET(LimitPointOf(alpha, s), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [@readable.Label("H1"), @readable.Thm("closed_in", () => closed_in())],
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
          ],
        ),
        @tactics.ap_term_tac,
        @tactics.abs_tac,
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedlimpt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedLimpt")

///|
/// `ClosedLimpt`
pub fn closedlimpt() -> @kernel.Thm {
  closedlimpt_c.get()
}

///|
/// LimptEmpty
fn step_269() -> Unit raise {
  limptempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ x : _, IN(x, topspace(alpha)) → NOTIN(x, LimitPointOf(alpha, {}))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
        @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
        @readable.Thm("OPEN_IN_TOPSPACE", () => open_in_topspace()),
        @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
        @readable.Thm("NOTIN", () => notin()),
      ],
    ),
  ))
}

///|
let limptempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LimptEmpty")

///|
/// `LimptEmpty`
pub fn limptempty() -> @kernel.Thm {
  limptempty_c.get()
}

///|
/// NoLimitPointImpClosed
fn step_270() -> Unit raise {
  nolimitpointimpclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (∀ x : _, NOTIN(x, LimitPointOf(alpha, s))) → closed_in(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedLimpt", () => closedlimpt()),
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("NOTIN", () => notin()),
      ],
    ),
  ))
}

///|
let nolimitpointimpclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NoLimitPointImpClosed")

///|
/// `NoLimitPointImpClosed`
pub fn nolimitpointimpclosed() -> @kernel.Thm {
  nolimitpointimpclosed_c.get()
}

///|
/// LimitPointUnion
fn step_272() -> Unit raise {
  limitpointunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → LimitPointOf(alpha, UNION(s, t)) == UNION(LimitPointOf(alpha, s), LimitPointOf(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("EXTENSION", () => @sets.extension()),
            @readable.Thm("IN_UNION", () => @sets.in_union()),
          ],
        ),
        @readable.intro_tac("forall x"),
        @readable.assuming(
          "IN(x, topspace(alpha))",
          "xTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("stTop"),
              @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
            ],
          ),
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [@readable.TermRule(@class.taut, "∀ a : Bool, ∀ b : Bool, (a == b) == (!a == !b)")],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Rule(@equal.gsym, @readable.Thm("NOTIN", () => notin())),
            @readable.Thm("DE_MORGAN_THM", () => @class.de_morgan_thm()),
            @readable.Label("H1"),
            @readable.Label("stTop"),
            @readable.Thm("NotLimitPointOf", () => notlimitpointof()),
            @readable.Label("xTop"),
          ],
        ),
        @readable.eq_tac("Left", @readable.by(@readable.set, [])),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("ExistsTensorInter", () => existstensorinter()),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let limitpointunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LimitPointUnion")

///|
/// `LimitPointUnion`
pub fn limitpointunion() -> @kernel.Thm {
  limitpointunion_c.get()
}

///|
/// Interior_DEF
fn step_275() -> Unit raise {
  interior_def_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ s : (_) -> Bool, (Interior : (Topology[_], (_) -> Bool, _) -> Bool)(alpha, s) == {(x : _) | SUBSET(s, topspace(alpha)) && (∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(t, s))}"))
}

///|
let interior_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Interior_DEF")

///|
/// `Interior_DEF`
pub fn interior_def() -> @kernel.Thm {
  interior_def_c.get()
}

///|
/// Interior_THM
fn step_276() -> Unit raise {
  interior_thm_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, s) == {(x : _) | SUBSET(s, topspace(alpha)) && (∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(t, s))}",
    @readable.by(@readable.fol, [@readable.Thm("Interior_DEF", () => interior_def())]),
  ))
}

///|
let interior_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Interior_THM")

///|
/// `Interior_THM`
pub fn interior_thm() -> @kernel.Thm {
  interior_thm_c.get()
}

///|
/// IN_Interior
fn step_278() -> Unit raise {
  in_interior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ x : _, SUBSET(s, topspace(alpha)) → IN(x, Interior(alpha, s)) == (∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(t, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("Interior_THM", () => interior_thm()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_Interior")

///|
/// `IN_Interior`
pub fn in_interior() -> @kernel.Thm {
  in_interior_c.get()
}

///|
/// InteriorEq
fn step_280() -> Unit raise {
  interioreq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → open_in(alpha, s) == (s == Interior(alpha, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.rewritel,
          [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("EXTENSION", () => @sets.extension()),
            @readable.Label("H1"),
            @readable.Thm("IN_Interior", () => in_interior()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let interioreq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorEq")

///|
/// `InteriorEq`
pub fn interioreq() -> @kernel.Thm {
  interioreq_c.get()
}

///|
/// InteriorOpen
fn step_282() -> Unit raise {
  interioropen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) → Interior(alpha, s) == s",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
        @readable.Thm("InteriorEq", () => interioreq()),
      ],
    ),
  ))
}

///|
let interioropen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorOpen")

///|
/// `InteriorOpen`
pub fn interioropen() -> @kernel.Thm {
  interioropen_c.get()
}

///|
/// InteriorEmpty
fn step_284() -> Unit raise {
  interiorempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], Interior(alpha, {}) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN_EMPTY", () => open_in_empty()),
        @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
        @readable.Thm("InteriorOpen", () => interioropen()),
      ],
    ),
  ))
}

///|
let interiorempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorEmpty")

///|
/// `InteriorEmpty`
pub fn interiorempty() -> @kernel.Thm {
  interiorempty_c.get()
}

///|
/// InteriorUniv
fn step_286() -> Unit raise {
  interioruniv_c.set(@readable.prove(
    "∀ alpha : Topology[_], Interior(alpha, topspace(alpha)) == topspace(alpha)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("OpenInTopspace", () => openintopspace()),
        @readable.Thm("InteriorOpen", () => interioropen()),
      ],
    ),
  ))
}

///|
let interioruniv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorUniv")

///|
/// `InteriorUniv`
pub fn interioruniv() -> @kernel.Thm {
  interioruniv_c.get()
}

///|
/// OpenInterior
fn step_288() -> Unit raise {
  openinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → open_in(alpha, Interior(alpha, s))",
    @readable.steps(
      [
        @readable.by(
          @simp.once_rewrite_tac,
          [@readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen())],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("IN_Interior", () => in_interior()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInterior")

///|
/// `OpenInterior`
pub fn openinterior() -> @kernel.Thm {
  openinterior_c.get()
}

///|
/// InteriorInterior
fn step_289() -> Unit raise {
  interiorinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, Interior(alpha, s)) == Interior(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OpenInterior", () => openinterior()),
        @readable.Thm("InteriorOpen", () => interioropen()),
      ],
    ),
  ))
}

///|
let interiorinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorInterior")

///|
/// `InteriorInterior`
pub fn interiorinterior() -> @kernel.Thm {
  interiorinterior_c.get()
}

///|
/// InteriorSubset
fn step_291() -> Unit raise {
  interiorsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Interior(alpha, s), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("Interior_DEF", () => interior_def()),
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("H1"), @readable.Thm("SUBSET", () => @sets.subset())],
        ),
      ],
    ),
  ))
}

///|
let interiorsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorSubset")

///|
/// `InteriorSubset`
pub fn interiorsubset() -> @kernel.Thm {
  interiorsubset_c.get()
}

///|
/// InteriorTopspace
fn step_292() -> Unit raise {
  interiortopspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Interior(alpha, s), topspace(alpha))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
      ],
    ),
  ))
}

///|
let interiortopspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorTopspace")

///|
/// `InteriorTopspace`
pub fn interiortopspace() -> @kernel.Thm {
  interiortopspace_c.get()
}

///|
/// SubsetInterior
fn step_294() -> Unit raise {
  subsetinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → SUBSET(s, t) → SUBSET(Interior(alpha, s), Interior(alpha, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_Interior", () => in_interior()),
        @readable.Thm("SUBSET", () => @sets.subset()),
      ],
    ),
  ))
}

///|
let subsetinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SubsetInterior")

///|
/// `SubsetInterior`
pub fn subsetinterior() -> @kernel.Thm {
  subsetinterior_c.get()
}

///|
/// InteriorMaximal
fn step_295() -> Unit raise {
  interiormaximal_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(t, s) && open_in(alpha, t) → SUBSET(t, Interior(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_Interior", () => in_interior()),
        @readable.Thm("SUBSET", () => @sets.subset()),
      ],
    ),
  ))
}

///|
let interiormaximal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorMaximal")

///|
/// `InteriorMaximal`
pub fn interiormaximal() -> @kernel.Thm {
  interiormaximal_c.get()
}

///|
/// InteriorMaximalEq
fn step_296() -> Unit raise {
  interiormaximaleq_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace((alpha : Topology[_]))) → open_in(alpha, s) → SUBSET(s, Interior(alpha, t)) == SUBSET(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorMaximal", () => interiormaximal()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
      ],
    ),
  ))
}

///|
let interiormaximaleq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorMaximalEq")

///|
/// `InteriorMaximalEq`
pub fn interiormaximaleq() -> @kernel.Thm {
  interiormaximaleq_c.get()
}

///|
/// InteriorUnique
fn step_298() -> Unit raise {
  interiorunique_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(t, s) && open_in(alpha, t) && (∀ t' : (_) -> Bool, SUBSET(t', s) && open_in(alpha, t') → SUBSET(t', t)) → Interior(alpha, s) == t",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
        @readable.Thm("OpenInterior", () => openinterior()),
        @readable.Thm("InteriorMaximal", () => interiormaximal()),
      ],
    ),
  ))
}

///|
let interiorunique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorUnique")

///|
/// `InteriorUnique`
pub fn interiorunique() -> @kernel.Thm {
  interiorunique_c.get()
}

///|
/// OpenSubsetInterior
fn step_299() -> Unit raise {
  opensubsetinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → open_in(alpha, s) → SUBSET(s, Interior(alpha, t)) == SUBSET(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorMaximal", () => interiormaximal()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
      ],
    ),
  ))
}

///|
let opensubsetinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenSubsetInterior")

///|
/// `OpenSubsetInterior`
pub fn opensubsetinterior() -> @kernel.Thm {
  opensubsetinterior_c.get()
}

///|
/// InteriorInter
fn step_300() -> Unit raise {
  interiorinter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → Interior(alpha, INTER(s, t)) == INTER(Interior(alpha, s), Interior(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop tTop"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("SUBSET_ANTISYM_EQ", () => @sets.subset_antisym_eq()),
            ),
            @readable.Thm("SUBSET_INTER", () => @sets.subset_inter()),
          ],
        ),
        @readable.conj_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("tTop"),
              @readable.Thm("SubsetInterior", () => subsetinterior()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(s, t), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("sTop"),
            @readable.Label("tTop"),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
            @readable.Thm("InteriorSubset", () => interiorsubset()),
            @readable.Thm("InteriorMaximal", () => interiormaximal()),
            @readable.Thm("INTER_TENSOR", () => inter_tensor()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorInter")

///|
/// `InteriorInter`
pub fn interiorinter() -> @kernel.Thm {
  interiorinter_c.get()
}

///|
/// InteriorFiniteInters
fn step_305() -> Unit raise {
  interiorfiniteinters_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : ((_) -> Bool) -> Bool, FINITE(s) → !(s == {}) → (∀ t : (_) -> Bool, IN(t, s) → SUBSET(t, topspace(alpha))) → Interior(alpha, INTERS(s)) == INTERS(IMAGE(Interior(alpha), s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("FINITE_INDUCT", () => @sets.finite_induct()),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("INTERS_INSERT", () => @sets.inters_insert()),
            @readable.Thm("IMAGE_CLAUSES", () => @sets.image_clauses()),
            @readable.Thm("IN_INSERT", () => @sets.in_insert()),
          ],
        ),
        @readable.intro_tac("forall x s, sCase, xsNonempty, sSetOfSubsets"),
        @readable.assuming(
          "!(s == {})",
          "sNonempty",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("INTERS_0", () => @sets.inters_0()),
              @readable.Thm("INTER_UNIV", () => @sets.inter_univ()),
              @readable.Thm("IMAGE_CLAUSES", () => @sets.image_clauses()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("INTERS_SUBSET", () => inters_subset()),
            @readable.Label("sSetOfSubsets"),
            @readable.Thm("InteriorInter", () => interiorinter()),
            @readable.Label("sNonempty"),
            @readable.Label("sSetOfSubsets"),
            @readable.Label("sCase"),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorfiniteinters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorFiniteInters")

///|
/// `InteriorFiniteInters`
pub fn interiorfiniteinters() -> @kernel.Thm {
  interiorfiniteinters_c.get()
}

///|
/// InteriorIntersSubset
fn step_308() -> Unit raise {
  interiorinterssubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ f : ((_) -> Bool) -> Bool, !(f == {}) && (∀ t : (_) -> Bool, IN(t, f) → SUBSET(t, topspace(alpha))) → SUBSET(Interior(alpha, INTERS(f)), INTERS(IMAGE(Interior(alpha), f)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha f, H1 H2"),
        @readable.have(
          "SUBSET(INTERS(f), topspace(alpha))",
          "",
          @readable.by(@readable.set, [@readable.Label("H1"), @readable.Label("H2")]),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTERS", () => @sets.in_inters()),
            @readable.Thm("FORALL_IN_IMAGE", () => @sets.forall_in_image()),
            @readable.Prev,
            @readable.Label("H2"),
            @readable.Thm("IN_Interior", () => in_interior()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let interiorinterssubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorIntersSubset")

///|
/// `InteriorIntersSubset`
pub fn interiorinterssubset() -> @kernel.Thm {
  interiorinterssubset_c.get()
}

///|
/// UnionInteriorSubset
fn step_309() -> Unit raise {
  unioninteriorsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → SUBSET(UNION(Interior(alpha, s), Interior(alpha, t)), Interior(alpha, UNION(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop tTop"),
        @readable.have(
          "SUBSET(UNION(s, t), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("tTop"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("sTop"),
            @readable.Label("tTop"),
            @readable.Prev,
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
            @readable.Thm("InteriorMaximal", () => interiormaximal()),
            @readable.Thm("UNION_TENSOR", () => union_tensor()),
            @readable.Thm("InteriorSubset", () => interiorsubset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let unioninteriorsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnionInteriorSubset")

///|
/// `UnionInteriorSubset`
pub fn unioninteriorsubset() -> @kernel.Thm {
  unioninteriorsubset_c.get()
}

///|
/// InteriorEqEmpty
fn step_311() -> Unit raise {
  interioreqempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (Interior(alpha, s) == {}) == (∀ t : (_) -> Bool, open_in(alpha, t) && SUBSET(t, s) → t == {})",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorMaximal", () => interiormaximal()),
        @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
        @readable.Thm("OpenInterior", () => openinterior()),
        @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
      ],
    ),
  ))
}

///|
let interioreqempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorEqEmpty")

///|
/// `InteriorEqEmpty`
pub fn interioreqempty() -> @kernel.Thm {
  interioreqempty_c.get()
}

///|
/// InteriorEqEmptyAlt
fn step_312() -> Unit raise {
  interioreqemptyalt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (Interior(alpha, s) == {}) == (∀ t : (_) -> Bool, open_in(alpha, t) && !(t == {}) → !(DIFF(t, s) == {}))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [@readable.Thm("InteriorEqEmpty", () => interioreqempty())],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let interioreqemptyalt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorEqEmptyAlt")

///|
/// `InteriorEqEmptyAlt`
pub fn interioreqemptyalt() -> @kernel.Thm {
  interioreqemptyalt_c.get()
}

///|
/// InteriorUnionsOpenSubsets
fn step_314() -> Unit raise {
  interiorunionsopensubsets_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → UNIONS({(t : (_) -> Bool) | open_in(alpha, t) && SUBSET(t, s)}) == Interior(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.consider(
          "t",
          "∃ t : (_) -> Bool, t == UNIONS({(f : (_) -> Bool) | open_in(alpha, f) && SUBSET(f, s)})",
          "tDef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "SUBSET(t, s) && (∀ f : (_) -> Bool, SUBSET(f, s) && open_in(alpha, f) → SUBSET(f, t))",
          "",
          @readable.by(@readable.set, [@readable.Label("tDef")]),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Label("tDef"),
            @readable.Prev,
            @readable.Thm("OPEN_IN_UNIONS", () => open_in_unions()),
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Thm("InteriorUnique", () => interiorunique()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorunionsopensubsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorUnionsOpenSubsets")

///|
/// `InteriorUnionsOpenSubsets`
pub fn interiorunionsopensubsets() -> @kernel.Thm {
  interiorunionsopensubsets_c.get()
}

///|
/// InteriorClosedUnionEmptyInterior
fn step_316() -> Unit raise {
  interiorclosedunionemptyinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → closed_in(alpha, s) && Interior(alpha, t) == {} → Interior(alpha, UNION(s, t)) == Interior(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2, H3 H4"),
        @readable.have(
          "SUBSET(UNION(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(Interior(alpha, UNION(s, t)), s)",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Thm("SUBSET", () => @sets.subset()),
                  @readable.Label("stTop"),
                  @readable.Thm("IN_Interior", () => in_interior()),
                  @readable.Thm(
                    "LEFT_IMP_EXISTS_THM",
                    () => @theorems.left_imp_exists_thm(),
                  ),
                ],
              ),
              @readable.intro_tac("forall [y] [O], openO yO Os_t"),
              @readable.consider(
                "O'",
                "∃ O' : (_) -> Bool, O' == INTER(DIFF(topspace(alpha), s), O)",
                "O'def",
                @readable.by(@readable.fol, [@readable.Prev]),
              ),
              @readable.have(
                "SUBSET(O', t)",
                "O't",
                @readable.by(
                  @readable.set,
                  [@readable.Label("O'def"), @readable.Label("Os_t")],
                ),
              ),
              @readable.assuming(
                "NOTIN(y, s)",
                "yNOTs",
                @readable.by(@readable.fol, [@readable.Thm("NOTIN", () => notin())]),
              ),
              @readable.have(
                "IN(y, DIFF(topspace(alpha), s))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("openO"),
                    @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
                    @readable.Label("yO"),
                    @readable.Thm("SUBSET", () => @sets.subset()),
                    @readable.Label("yNOTs"),
                    @readable.Thm("IN_DIFF", () => @sets.in_diff()),
                    @readable.Thm("NOTIN", () => notin()),
                  ],
                ),
              ),
              @readable.have(
                "IN(y, O') && open_in(alpha, O')",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("O'def"),
                    @readable.Prev,
                    @readable.Label("yO"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Label("H3"),
                    @readable.Thm("closed_in", () => closed_in()),
                    @readable.Label("openO"),
                    @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("O'def"),
                  @readable.Prev,
                  @readable.Label("O't"),
                  @readable.Label("H2"),
                  @readable.Thm("IN_Interior", () => in_interior()),
                  @readable.Thm("SUBSET", () => @sets.subset()),
                  @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
                  @readable.Label("H4"),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
            @readable.Label("H1"),
            @readable.Label("stTop"),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Prev,
            @readable.Thm("InteriorMaximal", () => interiormaximal()),
            @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
            @readable.Thm("SubsetInterior", () => subsetinterior()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosedunionemptyinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosedUnionEmptyInterior")

///|
/// `InteriorClosedUnionEmptyInterior`
pub fn interiorclosedunionemptyinterior() -> @kernel.Thm {
  interiorclosedunionemptyinterior_c.get()
}

///|
/// InteriorUnionEqEmpty
fn step_317() -> Unit raise {
  interiorunioneqempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → closed_in(alpha, s) || closed_in(alpha, t) → (Interior(alpha, UNION(s, t)) == {}) == (Interior(alpha, s) == {} && Interior(alpha, t) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1, H2"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.eq_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("SubsetInterior", () => subsetinterior()),
              @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("UNION_COMM", () => @sets.union_comm()),
            @readable.Prev,
            @readable.Label("H2"),
            @readable.Thm(
              "InteriorClosedUnionEmptyInterior",
              () => interiorclosedunionemptyinterior(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorunioneqempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorUnionEqEmpty")

///|
/// `InteriorUnionEqEmpty`
pub fn interiorunioneqempty() -> @kernel.Thm {
  interiorunioneqempty_c.get()
}

///|
/// Closure_DEF
fn step_319() -> Unit raise {
  closure_def_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ s : (_) -> Bool, (Closure : (Topology[_], (_) -> Bool, _) -> Bool)(alpha, s) == UNION(s, LimitPointOf(alpha, s))"))
}

///|
let closure_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Closure_DEF")

///|
/// `Closure_DEF`
pub fn closure_def() -> @kernel.Thm {
  closure_def_c.get()
}

///|
/// Closure_THM
fn step_320() -> Unit raise {
  closure_thm_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, s) == UNION(s, LimitPointOf(alpha, s))",
    @readable.by(@readable.fol, [@readable.Thm("Closure_DEF", () => closure_def())]),
  ))
}

///|
let closure_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Closure_THM")

///|
/// `Closure_THM`
pub fn closure_thm() -> @kernel.Thm {
  closure_thm_c.get()
}

///|
/// IN_Closure
fn step_322() -> Unit raise {
  in_closure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ x : _, SUBSET(s, topspace(alpha)) → IN(x, Closure(alpha, s)) == (IN(x, topspace(alpha)) && (∀ t : (_) -> Bool, IN(x, t) && open_in(alpha, t) → (∃ y : _, IN(y, s) && IN(y, t))))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s x, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Thm("IN_UNION", () => @sets.in_union()),
            @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Label("H1"), @readable.Thm("SUBSET", () => @sets.subset())],
        ),
      ],
    ),
  ))
}

///|
let in_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_Closure")

///|
/// `IN_Closure`
pub fn in_closure() -> @kernel.Thm {
  in_closure_c.get()
}

///|
/// ClosureSubset
fn step_324() -> Unit raise {
  closuresubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(s, Closure(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_Closure", () => in_closure()),
      ],
    ),
  ))
}

///|
let closuresubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureSubset")

///|
/// `ClosureSubset`
pub fn closuresubset() -> @kernel.Thm {
  closuresubset_c.get()
}

///|
/// ClosureTopspace
fn step_326() -> Unit raise {
  closuretopspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Closure(alpha, s), topspace(alpha))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_Closure", () => in_closure()),
      ],
    ),
  ))
}

///|
let closuretopspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureTopspace")

///|
/// `ClosureTopspace`
pub fn closuretopspace() -> @kernel.Thm {
  closuretopspace_c.get()
}

///|
/// ClosureInterior
fn step_327() -> Unit raise {
  closureinterior_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, s) == DIFF(topspace(alpha), Interior(alpha, DIFF(topspace(alpha), s)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("EXTENSION", () => @sets.extension()),
            @readable.Thm("IN_Closure", () => in_closure()),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
            @readable.Thm("IN_Interior", () => in_interior()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closureinterior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureInterior")

///|
/// `ClosureInterior`
pub fn closureinterior() -> @kernel.Thm {
  closureinterior_c.get()
}

///|
/// InteriorClosure
fn step_328() -> Unit raise {
  interiorclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, s) == DIFF(topspace(alpha), Closure(alpha, DIFF(topspace(alpha), s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("DIFF_REFL", () => diff_refl()),
        @readable.Thm("ClosureInterior", () => closureinterior()),
      ],
    ),
  ))
}

///|
let interiorclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosure")

///|
/// `InteriorClosure`
pub fn interiorclosure() -> @kernel.Thm {
  interiorclosure_c.get()
}

///|
/// ClosedClosure
fn step_331() -> Unit raise {
  closedclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, Closure(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("ClosureInterior", () => closureinterior()),
        @readable.Thm("DIFF_REFL", () => diff_refl()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("OpenInterior", () => openinterior()),
      ],
    ),
  ))
}

///|
let closedclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedClosure")

///|
/// `ClosedClosure`
pub fn closedclosure() -> @kernel.Thm {
  closedclosure_c.get()
}

///|
/// SubsetClosure
fn step_332() -> Unit raise {
  subsetclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → SUBSET(s, t) → SUBSET(Closure(alpha, s), Closure(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, tSubset, st"),
        @readable.have(
          "SUBSET(s, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tSubset"),
              @readable.Label("st"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("tSubset"),
            @readable.Prev,
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Label("st"),
            @readable.Thm("LimptSubset", () => limptsubset()),
            @readable.Thm("UNION_TENSOR", () => union_tensor()),
          ],
        ),
      ],
    ),
  ))
}

///|
let subsetclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SubsetClosure")

///|
/// `SubsetClosure`
pub fn subsetclosure() -> @kernel.Thm {
  subsetclosure_c.get()
}

///|
/// ClosureHull
fn step_334() -> Unit raise {
  closurehull_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, s) == hull(closed_in(alpha), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Rule(
            @equal.gsym,
            @readable.Thm("HULL_UNIQUE", () => @misc.hull_unique()),
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("ClosureSubset", () => closuresubset()),
            @readable.Thm("ClosedClosure", () => closedclosure()),
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("LimptSubset", () => limptsubset()),
            @readable.Thm("CLOSED_IN_SUBSET", () => closed_in_subset()),
            @readable.Thm("ClosedLimpt", () => closedlimpt()),
            @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closurehull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureHull")

///|
/// `ClosureHull`
pub fn closurehull() -> @kernel.Thm {
  closurehull_c.get()
}

///|
/// ClosureEq
fn step_338() -> Unit raise {
  closureeq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (Closure(alpha, s) == s) == closed_in(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosedClosure", () => closedclosure()),
        @readable.Thm("ClosedLimpt", () => closedlimpt()),
        @readable.Thm("Closure_THM", () => closure_thm()),
        @readable.Thm("SUBSET_UNION_ABSORPTION", () => @sets.subset_union_absorption()),
        @readable.Thm("UNION_COMM", () => @sets.union_comm()),
      ],
    ),
  ))
}

///|
let closureeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureEq")

///|
/// `ClosureEq`
pub fn closureeq() -> @kernel.Thm {
  closureeq_c.get()
}

///|
/// ClosureClosed
fn step_340() -> Unit raise {
  closureclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, closed_in(alpha, s) → Closure(alpha, s) == s",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("ClosureEq", () => closureeq()),
      ],
    ),
  ))
}

///|
let closureclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureClosed")

///|
/// `ClosureClosed`
pub fn closureclosed() -> @kernel.Thm {
  closureclosed_c.get()
}

///|
/// ClosureClosure
fn step_342() -> Unit raise {
  closureclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, Closure(alpha, s)) == Closure(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("ClosureHull", () => closurehull()),
        @readable.Thm("HULL_HULL", () => @misc.hull_hull()),
      ],
    ),
  ))
}

///|
let closureclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureClosure")

///|
/// `ClosureClosure`
pub fn closureclosure() -> @kernel.Thm {
  closureclosure_c.get()
}

///|
/// ClosureUnion
fn step_346() -> Unit raise {
  closureunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → Closure(alpha, UNION(s, t)) == UNION(Closure(alpha, s), Closure(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Label("stTop"),
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Thm("LimitPointUnion", () => limitpointunion()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let closureunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureUnion")

///|
/// `ClosureUnion`
pub fn closureunion() -> @kernel.Thm {
  closureunion_c.get()
}

///|
/// ClosureInterSubset
fn step_348() -> Unit raise {
  closureintersubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → SUBSET(Closure(alpha, INTER(s, t)), INTER(Closure(alpha, s), Closure(alpha, t)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_INTER", () => @sets.subset_inter()),
        @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
        @readable.Thm("SubsetClosure", () => subsetclosure()),
      ],
    ),
  ))
}

///|
let closureintersubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureInterSubset")

///|
/// `ClosureInterSubset`
pub fn closureintersubset() -> @kernel.Thm {
  closureintersubset_c.get()
}

///|
/// ClosureIntersSubset
fn step_350() -> Unit raise {
  closureinterssubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ f : ((_) -> Bool) -> Bool, (∀ s : (_) -> Bool, IN(s, f) → SUBSET(s, topspace(alpha))) → SUBSET(Closure(alpha, INTERS(f)), INTERS(IMAGE(Closure(alpha), f)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha f, H1"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.TermRule(
              @sets.set_rule,
              "SUBSET((s : (_) -> Bool), INTERS(f)) == (∀ t : (_) -> Bool, IN(t, f) → SUBSET(s, t))",
            ),
            @readable.Thm("FORALL_IN_IMAGE", () => @sets.forall_in_image()),
          ],
        ),
        @readable.intro_tac("forall [s], sf"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(INTERS(f), s) && SUBSET(INTERS(f), topspace(alpha))",
          "",
          @readable.by(@readable.set, [@readable.Label("H1"), @readable.Label("sf")]),
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("SubsetClosure", () => subsetclosure()), @readable.Prev],
        ),
      ],
    ),
  ))
}

///|
let closureinterssubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureIntersSubset")

///|
/// `ClosureIntersSubset`
pub fn closureinterssubset() -> @kernel.Thm {
  closureinterssubset_c.get()
}

///|
/// ClosureMinimal
fn step_351() -> Unit raise {
  closureminimal_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) && closed_in(alpha, t) → SUBSET(Closure(alpha, s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("SubsetClosure", () => subsetclosure()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
      ],
    ),
  ))
}

///|
let closureminimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureMinimal")

///|
/// `ClosureMinimal`
pub fn closureminimal() -> @kernel.Thm {
  closureminimal_c.get()
}

///|
/// ClosureMinimalEq
fn step_353() -> Unit raise {
  closureminimaleq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, t) → SUBSET(Closure(alpha, s), t) == SUBSET(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("ClosureMinimal", () => closureminimal()),
      ],
    ),
  ))
}

///|
let closureminimaleq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureMinimalEq")

///|
/// `ClosureMinimalEq`
pub fn closureminimaleq() -> @kernel.Thm {
  closureminimaleq_c.get()
}

///|
/// ClosureUnique
fn step_355() -> Unit raise {
  closureunique_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, t) && closed_in(alpha, t) && (∀ u : (_) -> Bool, SUBSET(s, u) && closed_in(alpha, u) → SUBSET(t, u)) → Closure(alpha, s) == t",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("SUBSET_ANTISYM_EQ", () => @sets.subset_antisym_eq()),
        @readable.Thm("ClosureMinimal", () => closureminimal()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("ClosedClosure", () => closedclosure()),
      ],
    ),
  ))
}

///|
let closureunique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureUnique")

///|
/// `ClosureUnique`
pub fn closureunique() -> @kernel.Thm {
  closureunique_c.get()
}

///|
/// ClosureUniv
fn step_356() -> Unit raise {
  closureuniv_c.set(@readable.prove(
    "∀ alpha : Topology[_], Closure(alpha, topspace(alpha)) == topspace(alpha)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
        @readable.Thm("CLOSED_IN_TOPSPACE", () => closed_in_topspace()),
        @readable.Thm("ClosureEq", () => closureeq()),
      ],
    ),
  ))
}

///|
let closureuniv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureUniv")

///|
/// `ClosureUniv`
pub fn closureuniv() -> @kernel.Thm {
  closureuniv_c.get()
}

///|
/// ClosureEmpty
fn step_357() -> Unit raise {
  closureempty_c.set(@readable.prove(
    "Closure((alpha : Topology[_]), {}) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
        @readable.Thm("CLOSED_IN_EMPTY", () => closed_in_empty()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
      ],
    ),
  ))
}

///|
let closureempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureEmpty")

///|
/// `ClosureEmpty`
pub fn closureempty() -> @kernel.Thm {
  closureempty_c.get()
}

///|
/// ClosureUnions
fn step_358() -> Unit raise {
  closureunions_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ f : ((_) -> Bool) -> Bool, FINITE(f) → (∀ t : (_) -> Bool, IN(t, f) → SUBSET(t, topspace(alpha))) → Closure(alpha, UNIONS(f)) == UNIONS({Closure(alpha, (t : (_) -> Bool)) | IN(t, f)})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha"),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("FINITE_INDUCT", () => @sets.finite_induct()),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("UNIONS_0", () => @sets.unions_0()),
            @readable.TermRule(@sets.set_rule, "{(f : (_) -> _)((x : _)) | IN(x, {})} == {}"),
            @readable.Thm("ClosureEmpty", () => closureempty()),
            @readable.Thm("UNIONS_INSERT", () => @sets.unions_insert()),
            @readable.TermRule(
              @sets.set_rule,
              "{(f : (_) -> _)((x : _)) | IN(x, INSERT((a : _), (t : (_) -> Bool)))} == INSERT(f(a), {f((x : _)) | IN(x, t)})",
            ),
            @readable.Thm("IN_INSERT", () => @sets.in_insert()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("UNIONS_SUBSET", () => @sets.unions_subset()),
            @readable.Thm("IN_UNIONS", () => @sets.in_unions()),
            @readable.Thm("ClosureUnion", () => closureunion()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closureunions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureUnions")

///|
/// `ClosureUnions`
pub fn closureunions() -> @kernel.Thm {
  closureunions_c.get()
}

///|
/// ClosureEqEmpty
fn step_362() -> Unit raise {
  closureeqempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (Closure(alpha, s) == {}) == (s == {})",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureEmpty", () => closureempty()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
      ],
    ),
  ))
}

///|
let closureeqempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureEqEmpty")

///|
/// `ClosureEqEmpty`
pub fn closureeqempty() -> @kernel.Thm {
  closureeqempty_c.get()
}

///|
/// ClosureSubsetEq
fn step_363() -> Unit raise {
  closuresubseteq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Closure(alpha, s), s) == closed_in(alpha, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureEq", () => closureeq()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
      ],
    ),
  ))
}

///|
let closuresubseteq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureSubsetEq")

///|
/// `ClosureSubsetEq`
pub fn closuresubseteq() -> @kernel.Thm {
  closuresubseteq_c.get()
}

///|
/// OpenInterClosureEqEmpty
fn step_364() -> Unit raise {
  openinterclosureeqempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → open_in(alpha, s) → (INTER(s, Closure(alpha, t)) == {}) == (INTER(s, t) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2, H3"),
        @readable.eq_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("ClosureSubset", () => closuresubset()),
              @readable.Thm("INTER_TENSOR", () => inter_tensor()),
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
            ],
          ),
        ),
        @readable.intro_tac("stDisjoint"),
        @readable.have(
          "SUBSET(s, Interior(alpha, DIFF(topspace(alpha), t)))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H2"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Label("H3"),
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Label("stDisjoint"),
              @readable.Thm("SUBSET_COMPLEMENT", () => subset_complement()),
              @readable.Thm("OpenSubsetInterior", () => opensubsetinterior()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("H2"),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.Prev,
            @readable.Thm("COMPLEMENT_DISJOINT", () => complement_disjoint()),
            @readable.Label("H2"),
            @readable.Thm("ClosureInterior", () => closureinterior()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinterclosureeqempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInterClosureEqEmpty")

///|
/// `OpenInterClosureEqEmpty`
pub fn openinterclosureeqempty() -> @kernel.Thm {
  openinterclosureeqempty_c.get()
}

///|
/// OpenInterClosureSubset
fn step_368() -> Unit raise {
  openinterclosuresubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(t, topspace(alpha)) → open_in(alpha, s) → SUBSET(INTER(s, Closure(alpha, t)), Closure(alpha, INTER(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, tTop, sOpen"),
        @readable.have(
          "SUBSET(s, topspace(alpha))",
          "sTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
              @readable.Label("sOpen"),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("sTop"),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("tTop"),
            @readable.Prev,
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Thm("UNION_OVER_INTER", () => @sets.union_over_inter()),
            @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
            @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
          ],
        ),
        @readable.have(
          "SUBSET(INTER(s, LimitPointOf(alpha, t)), LimitPointOf(alpha, INTER(s, t)))",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Thm("SUBSET", () => @sets.subset()),
                  @readable.Thm("IN_INTER", () => @sets.in_inter()),
                  @readable.Label("tTop"),
                  @readable.Label("stTop"),
                  @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
                ],
              ),
              @readable.intro_tac("forall [x], xs xTop xLIMt, forall [O], xO Oopen"),
              @readable.have(
                "IN(x, INTER(O, s)) && open_in(alpha, INTER(O, s))",
                "xOsOpen",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("xs"),
                    @readable.Label("xO"),
                    @readable.Thm("IN_INTER", () => @sets.in_inter()),
                    @readable.Label("Oopen"),
                    @readable.Label("sOpen"),
                    @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("xOsOpen"),
                  @readable.Label("xLIMt"),
                  @readable.Thm("IN_INTER", () => @sets.in_inter()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Prev,
            @readable.Thm("UNION_TENSOR", () => union_tensor()),
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
          ],
        ),
      ],
    ),
  ))
}

///|
let openinterclosuresubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OpenInterClosureSubset")

///|
/// `OpenInterClosureSubset`
pub fn openinterclosuresubset() -> @kernel.Thm {
  openinterclosuresubset_c.get()
}

///|
/// ClosureOpenInterSuperset
fn step_370() -> Unit raise {
  closureopenintersuperset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → open_in(alpha, s) && SUBSET(s, Closure(alpha, t)) → Closure(alpha, INTER(s, t)) == Closure(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop tTop, sOpen sSUBtC"),
        @readable.have(
          "SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Label("sTop"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
        ),
        @readable.conj_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SubsetClosure", () => subsetclosure()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(s, Closure(alpha, INTER(s, t)))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tTop"),
              @readable.Label("sOpen"),
              @readable.Thm("OpenInterClosureSubset", () => openinterclosuresubset()),
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Label("sSUBtC"),
              @readable.Thm("SUBSET_INTER", () => @sets.subset_inter()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("stTop"),
            @readable.Prev,
            @readable.Thm("ClosedClosure", () => closedclosure()),
            @readable.Thm("ClosureMinimal", () => closureminimal()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closureopenintersuperset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureOpenInterSuperset")

///|
/// `ClosureOpenInterSuperset`
pub fn closureopenintersuperset() -> @kernel.Thm {
  closureopenintersuperset_c.get()
}

///|
/// ClosureComplement
fn step_372() -> Unit raise {
  closurecomplement_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, DIFF(topspace(alpha), s)) == DIFF(topspace(alpha), Interior(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorClosure", () => interiorclosure()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("DIFF_REFL", () => diff_refl()),
      ],
    ),
  ))
}

///|
let closurecomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureComplement")

///|
/// `ClosureComplement`
pub fn closurecomplement() -> @kernel.Thm {
  closurecomplement_c.get()
}

///|
/// InteriorComplement
fn step_374() -> Unit raise {
  interiorcomplement_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, DIFF(topspace(alpha), s)) == DIFF(topspace(alpha), Closure(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("DIFF_REFL", () => diff_refl()),
        @readable.Thm("ClosureInterior", () => closureinterior()),
        @readable.Thm("DIFF_REFL", () => diff_refl()),
      ],
    ),
  ))
}

///|
let interiorcomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorComplement")

///|
/// `InteriorComplement`
pub fn interiorcomplement() -> @kernel.Thm {
  interiorcomplement_c.get()
}

///|
/// ClosureInteriorComplement
fn step_375() -> Unit raise {
  closureinteriorcomplement_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → DIFF(topspace(alpha), Closure(alpha, Interior(alpha, s))) == Interior(alpha, Closure(alpha, DIFF(topspace(alpha), s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("InteriorComplement", () => interiorcomplement()),
        @readable.Thm("ClosureComplement", () => closurecomplement()),
      ],
    ),
  ))
}

///|
let closureinteriorcomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureInteriorComplement")

///|
/// `ClosureInteriorComplement`
pub fn closureinteriorcomplement() -> @kernel.Thm {
  closureinteriorcomplement_c.get()
}

///|
/// InteriorClosureComplement
fn step_378() -> Unit raise {
  interiorclosurecomplement_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → DIFF(topspace(alpha), Interior(alpha, Closure(alpha, s))) == Closure(alpha, Interior(alpha, DIFF(topspace(alpha), s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
        @readable.Thm("InteriorComplement", () => interiorcomplement()),
        @readable.Thm("ClosureComplement", () => closurecomplement()),
      ],
    ),
  ))
}

///|
let interiorclosurecomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosureComplement")

///|
/// `InteriorClosureComplement`
pub fn interiorclosurecomplement() -> @kernel.Thm {
  interiorclosurecomplement_c.get()
}

///|
/// ConnectedIntermediateClosure
fn step_379() -> Unit raise {
  connectedintermediateclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) && SUBSET(s, t) && SUBSET(t, Closure(alpha, s)) → Connected(subtopology(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop, sCon st tCs"),
        @readable.have(
          "SUBSET(t, topspace(alpha))",
          "tTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tCs"),
              @readable.Label("sTop"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("tTop"),
            @readable.Thm("ConnectedSubtopology_ALT", () => connectedsubtopology_alt()),
          ],
        ),
        @readable.intro_tac("forall [u] [v], uOpen vOpen t_uv uvtEmpty"),
        @readable.have(
          "SUBSET(u, topspace(alpha)) && SUBSET(v, topspace(alpha))",
          "uvTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("uOpen"),
              @readable.Label("vOpen"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            ],
          ),
        ),
        @readable.have(
          "INTER(u, s) == {} || INTER(v, s) == {}",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("uvTop"),
              @readable.Label("uOpen"),
              @readable.Label("vOpen"),
              @readable.Label("st"),
              @readable.Label("t_uv"),
              @readable.Label("uvtEmpty"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
              @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
              @readable.Thm("INTER_TENSOR", () => inter_tensor()),
              @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
              @readable.Label("sCon"),
              @readable.Thm(
                "ConnectedSubtopology_ALT",
                () => connectedsubtopology_alt(),
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(s, DIFF(topspace(alpha), u)) || SUBSET(s, DIFF(topspace(alpha), v))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("sTop"),
              @readable.Label("uvTop"),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
              @readable.Thm("SUBSET_COMPLEMENT", () => subset_complement()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(t, DIFF(topspace(alpha), u)) || SUBSET(t, DIFF(topspace(alpha), v))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Prev,
              @readable.Label("uvTop"),
              @readable.Label("uOpen"),
              @readable.Label("vOpen"),
              @readable.Thm("OPEN_IN_CLOSED_IN", () => open_in_closed_in()),
              @readable.Thm("ClosureMinimal", () => closureminimal()),
              @readable.Label("tCs"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("tTop"),
            @readable.Label("uvTop"),
            @readable.Prev,
            @readable.Thm("SUBSET_COMPLEMENT", () => subset_complement()),
            @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedintermediateclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedIntermediateClosure")

///|
/// `ConnectedIntermediateClosure`
pub fn connectedintermediateclosure() -> @kernel.Thm {
  connectedintermediateclosure_c.get()
}

///|
/// ConnectedClosure
fn step_380() -> Unit raise {
  connectedclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Connected(subtopology(alpha, s)) → Connected(subtopology(alpha, Closure(alpha, s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
        @readable.Thm(
          "ConnectedIntermediateClosure",
          () => connectedintermediateclosure(),
        ),
      ],
    ),
  ))
}

///|
let connectedclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedClosure")

///|
/// `ConnectedClosure`
pub fn connectedclosure() -> @kernel.Thm {
  connectedclosure_c.get()
}

///|
/// ConnectedUnionStrong
fn step_382() -> Unit raise {
  connectedunionstrong_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → Connected(subtopology(alpha, s)) && Connected(subtopology(alpha, t)) && !(INTER(Closure(alpha, s), t) == {}) → Connected(subtopology(alpha, UNION(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop tTop, H2 H3 H4"),
        @readable.consider(
          "p s'",
          "∃ p : _, ∃ s' : (_) -> Bool, IN(p, Closure(alpha, s)) && IN(p, t) && s' == INSERT(p, s)",
          "pCst",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H4"),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(s, s') && SUBSET(s', Closure(alpha, s))",
          "s_ps_Cs",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("IN_INSERT", () => @sets.in_insert()),
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Label("pCst"),
              @readable.Label("sTop"),
              @readable.Thm("ClosureSubset", () => closuresubset()),
              @readable.Thm("INSERT_SUBSET", () => @sets.insert_subset()),
            ],
          ),
        ),
        @readable.have(
          "Connected(subtopology(alpha, s'))",
          "s'Con",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("H2"),
              @readable.Label("s_ps_Cs"),
              @readable.Thm(
                "ConnectedIntermediateClosure",
                () => connectedintermediateclosure(),
              ),
            ],
          ),
        ),
        @readable.have(
          "UNION(s, t) == UNION(s', t) && !(INTER(s', t) == {})",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("pCst"),
              @readable.Thm("INSERT_UNION", () => @sets.insert_union()),
              @readable.Thm("IN_INSERT", () => @sets.in_insert()),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("s_ps_Cs"),
            @readable.Label("sTop"),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            @readable.Label("tTop"),
            @readable.Prev,
            @readable.Label("s'Con"),
            @readable.Label("H3"),
            @readable.Thm("ConnectedUnion", () => connectedunion()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedunionstrong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedUnionStrong")

///|
/// `ConnectedUnionStrong`
pub fn connectedunionstrong() -> @kernel.Thm {
  connectedunionstrong_c.get()
}

///|
/// InteriorDiff
fn step_386() -> Unit raise {
  interiordiff_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → Interior(alpha, DIFF(s, t)) == DIFF(Interior(alpha, s), Closure(alpha, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
        @readable.Thm("InteriorComplement", () => interiorcomplement()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("InteriorInter", () => interiorinter()),
      ],
    ),
  ))
}

///|
let interiordiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorDiff")

///|
/// `InteriorDiff`
pub fn interiordiff() -> @kernel.Thm {
  interiordiff_c.get()
}

///|
/// ClosedInLimpt
fn step_387() -> Unit raise {
  closedinlimpt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → closed_in(subtopology(alpha, t), s) == (SUBSET(s, t) && SUBSET(INTER(LimitPointOf(alpha, s), t), s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1 H2"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H2"),
            @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
          ],
        ),
        @readable.eq_tac(
          "Right",
          @readable.steps(
            [
              @readable.intro_tac("sSUBt LIMstSUBs"),
              @readable.exists("Closure(alpha, s)"),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("H1"),
                  @readable.Thm("ClosedClosure", () => closedclosure()),
                  @readable.Thm("Closure_THM", () => closure_thm()),
                  @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
                  @readable.Thm("UNION_OVER_INTER", () => @sets.union_over_inter()),
                ],
              ),
              @readable.by(
                @readable.set,
                [@readable.Label("sSUBt"), @readable.Label("LIMstSUBs")],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [@readable.Thm("LEFT_IMP_EXISTS_THM", () => @theorems.left_imp_exists_thm())],
        ),
        @readable.intro_tac("forall [D], Dexists"),
        @readable.have(
          "SUBSET(LimitPointOf(alpha, INTER(D, t)), D)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("Dexists"),
              @readable.Thm("CLOSED_IN_SUBSET", () => closed_in_subset()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("LimptSubset", () => limptsubset()),
              @readable.Thm("ClosedLimpt", () => closedlimpt()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("Dexists"),
            @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            @readable.Prev,
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
            @readable.Thm("INTER_TENSOR", () => inter_tensor()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closedinlimpt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInLimpt")

///|
/// `ClosedInLimpt`
pub fn closedinlimpt() -> @kernel.Thm {
  closedinlimpt_c.get()
}

///|
/// ClosedInLimpt_ALT
fn step_388() -> Unit raise {
  closedinlimpt_alt_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → closed_in(subtopology(alpha, t), s) == (SUBSET(s, t) && (∀ x : _, IN(x, LimitPointOf(alpha, s)) && IN(x, t) → IN(x, s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_INTER", () => @sets.in_inter()),
        @readable.Thm("ClosedInLimpt", () => closedinlimpt()),
      ],
    ),
  ))
}

///|
let closedinlimpt_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInLimpt_ALT")

///|
/// `ClosedInLimpt_ALT`
pub fn closedinlimpt_alt() -> @kernel.Thm {
  closedinlimpt_alt_c.get()
}

///|
/// ClosedInInterClosure
fn step_390() -> Unit raise {
  closedininterclosure_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → closed_in(subtopology(alpha, s), t) == (INTER(s, Closure(alpha, t)) == t)",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("Closure_THM", () => closure_thm()),
            @readable.Thm("ClosedInLimpt", () => closedinlimpt()),
          ],
        ),
        @readable.by(@readable.set, []),
      ],
    ),
  ))
}

///|
let closedininterclosure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosedInInterClosure")

///|
/// `ClosedInInterClosure`
pub fn closedininterclosure() -> @kernel.Thm {
  closedininterclosure_c.get()
}

///|
/// InteriorClosureIdemp
fn step_391() -> Unit raise {
  interiorclosureidemp_v1_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, Closure(alpha, Interior(alpha, Closure(alpha, s)))) == Interior(alpha, Closure(alpha, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.consider(
          "IC CIC",
          "∃ IC : (_) -> Bool, ∃ CIC : (_) -> Bool, IC == Interior(alpha, Closure(alpha, s)) && CIC == Closure(alpha, IC)",
          "CICdef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "SUBSET(Closure(alpha, s), topspace(alpha))",
          "Ctop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(IC, topspace(alpha))",
          "ICtop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CICdef"),
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("InteriorTopspace", () => interiortopspace()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(CIC, topspace(alpha))",
          "CICtop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CICdef"),
              @readable.Prev,
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(IC, CIC)",
          "ICsubCIC",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CICdef"),
              @readable.Label("ICtop"),
              @readable.Thm("ClosureSubset", () => closuresubset()),
            ],
          ),
        ),
        @readable.have(
          "∀ u : (_) -> Bool, SUBSET(u, CIC) && open_in(alpha, u) → SUBSET(u, IC)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CICdef"),
              @readable.Label("Ctop"),
              @readable.Thm("InteriorSubset", () => interiorsubset()),
              @readable.Thm("SubsetClosure", () => subsetclosure()),
              @readable.Label("H1"),
              @readable.Thm("ClosureClosure", () => closureclosure()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
              @readable.Thm("OpenSubsetInterior", () => opensubsetinterior()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("CICdef"),
            @readable.Label("CICtop"),
            @readable.Label("ICsubCIC"),
            @readable.Label("Ctop"),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Prev,
            @readable.Thm("InteriorUnique", () => interiorunique()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosureidemp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosureIdemp")

///|
/// `InteriorClosureIdemp`
pub fn interiorclosureidemp_v1() -> @kernel.Thm {
  interiorclosureidemp_v1_c.get()
}

///|
/// InteriorClosureIdemp
fn step_393() -> Unit raise {
  interiorclosureidemp_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, Closure(alpha, Interior(alpha, Closure(alpha, s)))) == Interior(alpha, Closure(alpha, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.have(
          "SUBSET(Closure(alpha, s), topspace(alpha))",
          "Ctop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
            ],
          ),
        ),
        @readable.consider(
          "IC CIC",
          "∃ IC : (_) -> Bool, ∃ CIC : (_) -> Bool, IC == Interior(alpha, Closure(alpha, s)) && CIC == Closure(alpha, IC)",
          "ICdefs",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "SUBSET(IC, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Ctop"),
              @readable.Label("H1"),
              @readable.Thm("InteriorTopspace", () => interiortopspace()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(CIC, topspace(alpha)) && SUBSET(IC, CIC) && (∀ u : (_) -> Bool, SUBSET(u, CIC) && open_in(alpha, u) → SUBSET(u, IC))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("ICdefs"),
              @readable.Label("Ctop"),
              @readable.Prev,
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("ClosureSubset", () => closuresubset()),
              @readable.Thm("InteriorSubset", () => interiorsubset()),
              @readable.Thm("SubsetClosure", () => subsetclosure()),
              @readable.Label("H1"),
              @readable.Thm("ClosureClosure", () => closureclosure()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
              @readable.Thm("OpenSubsetInterior", () => opensubsetinterior()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("ICdefs"),
            @readable.Prev,
            @readable.Label("Ctop"),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Thm("InteriorUnique", () => interiorunique()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosureidemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosureIdemp")

///|
/// `InteriorClosureIdemp`
pub fn interiorclosureidemp() -> @kernel.Thm {
  interiorclosureidemp_c.get()
}

///|
/// ClosureInteriorIdemp
fn step_394() -> Unit raise {
  closureinterioridemp_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, Interior(alpha, Closure(alpha, Interior(alpha, s)))) == Closure(alpha, Interior(alpha, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.consider(
          "t",
          "∃ t : (_) -> Bool, t == DIFF(topspace(alpha), s)",
          "tDef",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "SUBSET(t, topspace(alpha)) && s == DIFF(topspace(alpha), t)",
          "tProps",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("H1"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("DIFF_REFL", () => diff_refl()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(Interior(alpha, Closure(alpha, t)), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("InteriorTopspace", () => interiortopspace()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("tProps"),
            @readable.Prev,
            @readable.Rule(
              @equal.gsym,
              @readable.Thm(
                "InteriorClosureComplement",
                () => interiorclosurecomplement(),
              ),
            ),
            @readable.Thm("InteriorClosureIdemp", () => interiorclosureidemp()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closureinterioridemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureInteriorIdemp")

///|
/// `ClosureInteriorIdemp`
pub fn closureinterioridemp() -> @kernel.Thm {
  closureinterioridemp_c.get()
}

///|
/// InteriorClosureDiffSpaceEmpty
fn step_397() -> Unit raise {
  interiorclosurediffspaceempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, DIFF(Closure(alpha, s), s)) == {}",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.have(
          "SUBSET(DIFF(Closure(alpha, s), s), topspace(alpha))",
          "Cs_sTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.assuming(
          "!(Interior(alpha, DIFF(Closure(alpha, s), s)) == {})",
          "Contradiction",
          @readable.by(@readable.fol, []),
        ),
        @readable.consider(
          "x",
          "∃ x : _, IN(x, Interior(alpha, DIFF(Closure(alpha, s), s)))",
          "xExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("MEMBER_NOT_EMPTY", () => @sets.member_not_empty()),
            ],
          ),
        ),
        @readable.consider(
          "t",
          "∃ t : (_) -> Bool, open_in(alpha, t) && IN(x, t) && SUBSET(t, DIFF(UNION(s, LimitPointOf(alpha, s)), s))",
          "tProps",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("Cs_sTop"),
              @readable.Thm("IN_Interior", () => in_interior()),
              @readable.Thm("Closure_DEF", () => closure_def()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(t, LimitPointOf(alpha, s)) && INTER(s, DIFF(t, {x})) == {}",
          "tSubLIMs",
          @readable.by(@readable.set, [@readable.Prev]),
        ),
        @readable.have(
          "IN(x, LimitPointOf(alpha, s)) && NOTIN(x, s)",
          "xLims",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tProps"),
              @readable.Prev,
              @readable.Thm("SUBSET", () => @sets.subset()),
              @readable.Thm("IN_DIFF", () => @sets.in_diff()),
              @readable.Thm("NOTIN", () => notin()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Label("xLims"),
            @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
            @readable.Label("tProps"),
            @readable.Label("tSubLIMs"),
            @readable.Thm("NotLimitPointOf", () => notlimitpointof()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosurediffspaceempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosureDiffSpaceEmpty")

///|
/// `InteriorClosureDiffSpaceEmpty`
pub fn interiorclosurediffspaceempty() -> @kernel.Thm {
  interiorclosurediffspaceempty_c.get()
}

///|
/// NowhereDenseUnion
fn step_398() -> Unit raise {
  nowheredenseunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → (Interior(alpha, Closure(alpha, UNION(s, t))) == {}) == (Interior(alpha, Closure(alpha, s)) == {} && Interior(alpha, Closure(alpha, t)) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Thm("ClosureUnion", () => closureunion()),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("ClosedClosure", () => closedclosure()),
            @readable.Thm("InteriorUnionEqEmpty", () => interiorunioneqempty()),
          ],
        ),
      ],
    ),
  ))
}

///|
let nowheredenseunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NowhereDenseUnion")

///|
/// `NowhereDenseUnion`
pub fn nowheredenseunion() -> @kernel.Thm {
  nowheredenseunion_c.get()
}

///|
/// NowhereDense
fn step_400() -> Unit raise {
  nowheredense_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (Interior(alpha, Closure(alpha, s)) == {}) == (∀ t : (_) -> Bool, open_in(alpha, t) && !(t == {}) → (∃ u : (_) -> Bool, open_in(alpha, u) && !(u == {}) && SUBSET(u, t) && INTER(u, s) == {}))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, H1"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("InteriorEqEmptyAlt", () => interioreqemptyalt()),
          ],
        ),
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.intro_tac("H2, forall [t], tOpen tNonempty"),
              @readable.exists("DIFF(t, Closure(alpha, s))"),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("tOpen"),
                  @readable.Label("H1"),
                  @readable.Thm("ClosedClosure", () => closedclosure()),
                  @readable.Thm("OPEN_IN_DIFF", () => open_in_diff()),
                  @readable.Label("tOpen"),
                  @readable.Label("tNonempty"),
                  @readable.Label("H2"),
                  @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                  @readable.Label("H1"),
                  @readable.Thm("ClosureSubset", () => closuresubset()),
                  @readable.TermRule(
                    @sets.set_rule,
                    "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ A : (_) -> Bool, SUBSET(s, t) → INTER(DIFF(A, t), s) == {}",
                  ),
                ],
              ),
            ],
          ),
        ),
        @readable.intro_tac("H2, forall [t], tOpen tNonempty"),
        @readable.consider(
          "u",
          "∃ u : (_) -> Bool, open_in(alpha, u) && !(u == {}) && SUBSET(u, t) && INTER(u, s) == {}",
          "uExists",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("tOpen"),
              @readable.Label("tNonempty"),
              @readable.Label("H2"),
            ],
          ),
        ),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.TermsRule(
            tms => th => @bool.ispecl(tms, th),
            ["alpha", "u", "s"],
            @readable.Thm("OpenInterClosureEqEmpty", () => openinterclosureeqempty()),
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("uExists"),
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Label("H1"),
          ],
        ),
        @readable.by(@readable.set, [@readable.Label("uExists")]),
      ],
    ),
  ))
}

///|
let nowheredense_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NowhereDense")

///|
/// `NowhereDense`
pub fn nowheredense() -> @kernel.Thm {
  nowheredense_c.get()
}

///|
/// InteriorClosureInterOpen
fn step_403() -> Unit raise {
  interiorclosureinteropen_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, open_in(alpha, s) && open_in(alpha, t) → Interior(alpha, Closure(alpha, INTER(s, t))) == INTER(Interior(alpha, Closure(alpha, s)), Interior(alpha, Closure(alpha, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sOpen tOpen"),
        @readable.have(
          "SUBSET(s, topspace(alpha))",
          "sTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sOpen"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(t, topspace(alpha))",
          "tTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tOpen"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.TermRule(
              @sets.set_rule,
              "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, (u == INTER(s, t)) == (SUBSET(INTER(s, t), u) && SUBSET(u, s) && SUBSET(u, t))",
            ),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sTop"),
            @readable.Label("tTop"),
            @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            @readable.Thm("SubsetClosure", () => subsetclosure()),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("SubsetInterior", () => subsetinterior()),
          ],
        ),
        @readable.have(
          "SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Label("sTop"),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(Closure(alpha, s), topspace(alpha)) && SUBSET(Closure(alpha, t), topspace(alpha))",
          "CsCtTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Label("tTop"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(Closure(alpha, s), Closure(alpha, t)), topspace(alpha))",
          "CsIntCtTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(UNION(DIFF(Closure(alpha, s), s), DIFF(Closure(alpha, t), t)), topspace(alpha))",
          "Cs_sUNIONCt_tTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("CsCtTop"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("CsCtTop"),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("InteriorInter", () => interiorinter()),
            ),
          ],
        ),
        @readable.have(
          "SUBSET(Interior(alpha, INTER(Closure(alpha, s), Closure(alpha, t))), Closure(alpha, INTER(s, t)))",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("CsIntCtTop"),
                  @readable.Thm("InteriorTopspace", () => interiortopspace()),
                  @readable.TermsRule(
                    tms => th => @bool.ispecl(tms, th),
                    ["topspace(alpha)"],
                    @readable.Thm("COMPLEMENT_DISJOINT", () => complement_disjoint()),
                  ),
                  @readable.Label("stTop"),
                  @readable.Thm("ClosureTopspace", () => closuretopspace()),
                  @readable.Rule(
                    @equal.gsym,
                    @readable.Thm("ClosureComplement", () => closurecomplement()),
                  ),
                  @readable.Rule(
                    @equal.gsym,
                    @readable.Thm("InteriorComplement", () => interiorcomplement()),
                  ),
                  @readable.Label("CsIntCtTop"),
                  @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                  @readable.Rule(
                    @equal.gsym,
                    @readable.Thm("InteriorInter", () => interiorinter()),
                  ),
                ],
              ),
              @readable.have(
                "closed_in(alpha, DIFF(Closure(alpha, s), s)) && closed_in(alpha, DIFF(Closure(alpha, t), t))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("sTop"),
                    @readable.Label("tTop"),
                    @readable.Thm("ClosedClosure", () => closedclosure()),
                    @readable.Label("sOpen"),
                    @readable.Label("tOpen"),
                    @readable.Thm("CLOSED_IN_DIFF", () => closed_in_diff()),
                  ],
                ),
              ),
              @readable.have(
                "Interior(alpha, UNION(DIFF(Closure(alpha, s), s), DIFF(Closure(alpha, t), t))) == {}",
                "IntEmpty",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("Cs_sUNIONCt_tTop"),
                    @readable.Prev,
                    @readable.Label("sTop"),
                    @readable.Label("tTop"),
                    @readable.Thm(
                      "InteriorClosureDiffSpaceEmpty",
                      () => interiorclosurediffspaceempty(),
                    ),
                    @readable.Thm("InteriorUnionEqEmpty", () => interiorunioneqempty()),
                  ],
                ),
              ),
              @readable.have(
                "SUBSET(INTER(Closure(alpha, s), INTER(Closure(alpha, t), DIFF(topspace(alpha), INTER(s, t)))), UNION(DIFF(Closure(alpha, s), s), DIFF(Closure(alpha, t), t)))",
                "",
                @readable.by(@readable.set, []),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("Cs_sUNIONCt_tTop"),
                  @readable.Prev,
                  @readable.Thm("SubsetInterior", () => subsetinterior()),
                  @readable.Label("IntEmpty"),
                  @readable.Thm("INTER_ACI", () => @sets.inter_aci()),
                  @readable.Thm("SUBSET_EMPTY", () => @sets.subset_empty()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("stTop"),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Prev,
            @readable.Label("CsIntCtTop"),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Thm("InteriorMaximal", () => interiormaximal()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosureinteropen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosureInterOpen")

///|
/// `InteriorClosureInterOpen`
pub fn interiorclosureinteropen() -> @kernel.Thm {
  interiorclosureinteropen_c.get()
}

///|
/// ClosureInteriorUnionClosed
fn step_406() -> Unit raise {
  closureinteriorunionclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, closed_in(alpha, s) && closed_in(alpha, t) → Closure(alpha, Interior(alpha, UNION(s, t))) == UNION(Closure(alpha, Interior(alpha, s)), Closure(alpha, Interior(alpha, t)))",
    @readable.steps(
      [
        @readable.by(@readable.rewrite, [@readable.Thm("closed_in", () => closed_in())]),
        @readable.intro_tac("forall alpha s t, sClosed tClosed"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sClosed"),
            @readable.Label("tClosed"),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.TermsRule(
              tms => th => @bool.ispecl(tms, th),
              ["topspace(alpha)"],
              @readable.Thm(
                "COMPLEMENT_DUALITY_UNION",
                () => complement_duality_union(),
              ),
            ),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sClosed"),
            @readable.Label("tClosed"),
            @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.Thm(
              "ClosureInteriorComplement",
              () => closureinteriorcomplement(),
            ),
            @readable.Thm("DIFF_UNION", () => diff_union()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("InteriorClosureInterOpen", () => interiorclosureinteropen()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closureinteriorunionclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureInteriorUnionClosed")

///|
/// `ClosureInteriorUnionClosed`
pub fn closureinteriorunionclosed() -> @kernel.Thm {
  closureinteriorunionclosed_c.get()
}

///|
/// RegularOpenInter
fn step_410() -> Unit raise {
  regularopeninter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → Interior(alpha, Closure(alpha, s)) == s && Interior(alpha, Closure(alpha, t)) == t → Interior(alpha, Closure(alpha, INTER(s, t))) == INTER(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("OpenInterior", () => openinterior()),
        @readable.Thm("InteriorClosureInterOpen", () => interiorclosureinteropen()),
      ],
    ),
  ))
}

///|
let regularopeninter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RegularOpenInter")

///|
/// `RegularOpenInter`
pub fn regularopeninter() -> @kernel.Thm {
  regularopeninter_c.get()
}

///|
/// RegularClosedUnion
fn step_411() -> Unit raise {
  regularclosedunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → Closure(alpha, Interior(alpha, s)) == s && Closure(alpha, Interior(alpha, t)) == t → Closure(alpha, Interior(alpha, UNION(s, t))) == UNION(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("ClosureInteriorUnionClosed", () => closureinteriorunionclosed()),
        @readable.Thm("ClosedClosure", () => closedclosure()),
      ],
    ),
  ))
}

///|
let regularclosedunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RegularClosedUnion")

///|
/// `RegularClosedUnion`
pub fn regularclosedunion() -> @kernel.Thm {
  regularclosedunion_c.get()
}

///|
/// DiffClosureSubset
fn step_413() -> Unit raise {
  diffclosuresubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) → SUBSET(DIFF(Closure(alpha, s), Closure(alpha, t)), Closure(alpha, DIFF(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, sTop tTop"),
        @readable.have(
          "SUBSET(DIFF(Closure(alpha, s), Closure(alpha, t)), Closure(alpha, DIFF(s, Closure(alpha, t))))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Label("tTop"),
              @readable.Thm("ClosedClosure", () => closedclosure()),
              @readable.Label("tTop"),
              @readable.Thm("closed_in", () => closed_in()),
              @readable.Thm("OpenInterClosureSubset", () => openinterclosuresubset()),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
              @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("tTop"),
            @readable.Thm("ClosureSubset", () => closuresubset()),
            @readable.Thm("SUBSET_DUALITY", () => subset_duality()),
            @readable.Label("sTop"),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            @readable.Thm("SubsetClosure", () => subsetclosure()),
          ],
        ),
      ],
    ),
  ))
}

///|
let diffclosuresubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DiffClosureSubset")

///|
/// `DiffClosureSubset`
pub fn diffclosuresubset() -> @kernel.Thm {
  diffclosuresubset_c.get()
}

///|
/// Frontier_DEF
fn step_415() -> Unit raise {
  frontier_def_c.set(@readable.newdefinition("∀ alpha : Topology[_], ∀ s : (_) -> Bool, (Frontier : (Topology[_], (_) -> Bool, _) -> Bool)(alpha, s) == DIFF(Closure(alpha, s), Interior(alpha, s))"))
}

///|
let frontier_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Frontier_DEF")

///|
/// `Frontier_DEF`
pub fn frontier_def() -> @kernel.Thm {
  frontier_def_c.get()
}

///|
/// Frontier_THM
fn step_416() -> Unit raise {
  frontier_thm_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Frontier(alpha, s) == DIFF(Closure(alpha, s), Interior(alpha, s))",
    @readable.by(@readable.fol, [@readable.Thm("Frontier_DEF", () => frontier_def())]),
  ))
}

///|
let frontier_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Frontier_THM")

///|
/// `Frontier_THM`
pub fn frontier_thm() -> @kernel.Thm {
  frontier_thm_c.get()
}

///|
/// FrontierTopspace
fn step_418() -> Unit raise {
  frontiertopspace_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Frontier(alpha, s), topspace(alpha))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
      ],
    ),
  ))
}

///|
let frontiertopspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierTopspace")

///|
/// `FrontierTopspace`
pub fn frontiertopspace() -> @kernel.Thm {
  frontiertopspace_c.get()
}

///|
/// FrontierClosed
fn step_420() -> Unit raise {
  frontierclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → closed_in(alpha, Frontier(alpha, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("ClosedClosure", () => closedclosure()),
        @readable.Thm("OpenInterior", () => openinterior()),
        @readable.Thm("CLOSED_IN_DIFF", () => closed_in_diff()),
      ],
    ),
  ))
}

///|
let frontierclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierClosed")

///|
/// `FrontierClosed`
pub fn frontierclosed() -> @kernel.Thm {
  frontierclosed_c.get()
}

///|
/// FrontierClosures
fn step_421() -> Unit raise {
  frontierclosures_c.set(@readable.prove(
    "∀ s : (_) -> Bool, SUBSET(s, topspace((alpha : Topology[_]))) → Frontier(alpha, s) == INTER(Closure(alpha, s), Closure(alpha, DIFF(topspace(alpha), s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.TermRule(
          @sets.set_rule,
          "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) && SUBSET(t, A) → DIFF(s, DIFF(A, t)) == INTER(s, t)",
        ),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("InteriorClosure", () => interiorclosure()),
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
      ],
    ),
  ))
}

///|
let frontierclosures_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierClosures")

///|
/// `FrontierClosures`
pub fn frontierclosures() -> @kernel.Thm {
  frontierclosures_c.get()
}

///|
/// FrontierStraddle
fn step_422() -> Unit raise {
  frontierstraddle_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ a : _, ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → IN(a, Frontier(alpha, s)) == (IN(a, topspace(alpha)) && (∀ t : (_) -> Bool, open_in(alpha, t) && IN(a, t) → (∃ x : _, IN(x, s) && IN(x, t)) && (∃ x : _, !IN(x, s) && IN(x, t))))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("FrontierClosures", () => frontierclosures()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("IN_Closure", () => in_closure()),
            @readable.Thm("IN_DIFF", () => @sets.in_diff()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierstraddle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierStraddle")

///|
/// `FrontierStraddle`
pub fn frontierstraddle() -> @kernel.Thm {
  frontierstraddle_c.get()
}

///|
/// FrontierSubsetClosed
fn step_424() -> Unit raise {
  frontiersubsetclosed_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, closed_in(alpha, s) → SUBSET(Frontier(alpha, s), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
      ],
    ),
  ))
}

///|
let frontiersubsetclosed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierSubsetClosed")

///|
/// `FrontierSubsetClosed`
pub fn frontiersubsetclosed() -> @kernel.Thm {
  frontiersubsetclosed_c.get()
}

///|
/// FrontierEmpty
fn step_425() -> Unit raise {
  frontierempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], Frontier(alpha, {}) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("EMPTY_SUBSET", () => @sets.empty_subset()),
        @readable.Thm("ClosureEmpty", () => closureempty()),
        @readable.Thm("EMPTY_DIFF", () => @sets.empty_diff()),
      ],
    ),
  ))
}

///|
let frontierempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierEmpty")

///|
/// `FrontierEmpty`
pub fn frontierempty() -> @kernel.Thm {
  frontierempty_c.get()
}

///|
/// FrontierUniv
fn step_427() -> Unit raise {
  frontieruniv_c.set(@readable.prove(
    "∀ alpha : Topology[_], Frontier(alpha, topspace(alpha)) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("Frontier_DEF", () => frontier_def()),
        @readable.Thm("ClosureUniv", () => closureuniv()),
        @readable.Thm("InteriorUniv", () => interioruniv()),
        @readable.Thm("DIFF_EQ_EMPTY", () => @sets.diff_eq_empty()),
      ],
    ),
  ))
}

///|
let frontieruniv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierUniv")

///|
/// `FrontierUniv`
pub fn frontieruniv() -> @kernel.Thm {
  frontieruniv_c.get()
}

///|
/// FrontierSubsetEq
fn step_430() -> Unit raise {
  frontiersubseteq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Frontier(alpha, s), s) == closed_in(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.eq_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [@readable.Thm("FrontierSubsetClosed", () => frontiersubsetclosed())],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [@readable.Label("sTop"), @readable.Thm("Frontier_THM", () => frontier_thm())],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("sTop"),
            @readable.Thm("InteriorSubset", () => interiorsubset()),
            @readable.TermRule(
              @sets.set_rule,
              "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(DIFF(s, t), u) && SUBSET(t, u) → SUBSET(s, u)",
            ),
            @readable.Thm("ClosureSubsetEq", () => closuresubseteq()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontiersubseteq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierSubsetEq")

///|
/// `FrontierSubsetEq`
pub fn frontiersubseteq() -> @kernel.Thm {
  frontiersubseteq_c.get()
}

///|
/// FrontierComplement
fn step_433() -> Unit raise {
  frontiercomplement_v1_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Frontier(alpha, DIFF(topspace(alpha), s)) == Frontier(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sTop"),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Thm("ClosureComplement", () => closurecomplement()),
            @readable.Thm("InteriorComplement", () => interiorcomplement()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("sTop"),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.TermRule(
              @sets.set_rule,
              "∀ Top : (_) -> Bool, ∀ Int : (_) -> Bool, ∀ Clo : (_) -> Bool, SUBSET(Int, Top) && SUBSET(Clo, Top) → DIFF(DIFF(Top, Int), DIFF(Top, Clo)) == DIFF(Clo, Int)",
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontiercomplement_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierComplement")

///|
/// `FrontierComplement`
pub fn frontiercomplement_v1() -> @kernel.Thm {
  frontiercomplement_v1_c.get()
}

///|
/// FrontierComplement
fn step_434() -> Unit raise {
  frontiercomplement_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Frontier(alpha, DIFF(topspace(alpha), s)) == Frontier(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sTop"),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Thm("ClosureComplement", () => closurecomplement()),
            @readable.Thm("InteriorComplement", () => interiorcomplement()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("sTop"),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.TermRule(
              @sets.set_rule,
              "∀ Top : (_) -> Bool, ∀ Int : (_) -> Bool, ∀ Clo : (_) -> Bool, SUBSET(Int, Top) && SUBSET(Clo, Top) → DIFF(DIFF(Top, Int), DIFF(Top, Clo)) == DIFF(Clo, Int)",
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontiercomplement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierComplement")

///|
/// `FrontierComplement`
pub fn frontiercomplement() -> @kernel.Thm {
  frontiercomplement_c.get()
}

///|
/// FrontierDisjointEq
fn step_435() -> Unit raise {
  frontierdisjointeq_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (INTER(Frontier(alpha, s), s) == {}) == open_in(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.have(
          "SUBSET(DIFF(topspace(alpha), s), topspace(alpha))",
          "COMPsTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("sTop"),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("FrontierComplement", () => frontiercomplement()),
            ),
            @readable.Thm("OPEN_IN_CLOSED_IN", () => open_in_closed_in()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("COMPsTop"),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("FrontierSubsetEq", () => frontiersubseteq()),
            ),
            @readable.Thm("FrontierTopspace", () => frontiertopspace()),
            @readable.Thm("SUBSET_COMPLEMENT", () => subset_complement()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierdisjointeq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierDisjointEq")

///|
/// `FrontierDisjointEq`
pub fn frontierdisjointeq() -> @kernel.Thm {
  frontierdisjointeq_c.get()
}

///|
/// FrontierInterSubset
fn step_439() -> Unit raise {
  frontierintersubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → SUBSET(Frontier(alpha, INTER(s, t)), UNION(Frontier(alpha, s), Frontier(alpha, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Prev,
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Thm("InteriorInter", () => interiorinter()),
            @readable.Thm("DIFF_INTER", () => diff_inter()),
            @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            @readable.Thm("SubsetClosure", () => subsetclosure()),
            @readable.Thm("DIFF_SUBSET", () => diff_subset()),
            @readable.Thm("UNION_TENSOR", () => union_tensor()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierintersubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierInterSubset")

///|
/// `FrontierInterSubset`
pub fn frontierintersubset() -> @kernel.Thm {
  frontierintersubset_c.get()
}

///|
/// FrontierUnionSubset
fn step_442() -> Unit raise {
  frontierunionsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → SUBSET(Frontier(alpha, UNION(s, t)), UNION(Frontier(alpha, s), Frontier(alpha, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Prev,
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("FrontierComplement", () => frontiercomplement()),
            ),
            @readable.Thm("DIFF_UNION", () => diff_union()),
          ],
        ),
        @readable.have(
          "SUBSET(UNION(DIFF(topspace(alpha), s), DIFF(topspace(alpha), t)), topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("FrontierInterSubset", () => frontierintersubset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierunionsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierUnionSubset")

///|
/// `FrontierUnionSubset`
pub fn frontierunionsubset() -> @kernel.Thm {
  frontierunionsubset_c.get()
}

///|
/// FrontierInteriors
fn step_444() -> Unit raise {
  frontierinteriors_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Frontier(alpha, s) == DIFF(DIFF(topspace(alpha), Interior(alpha, s)), Interior(alpha, DIFF(topspace(alpha), s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("ClosureInterior", () => closureinterior()),
        @readable.Thm("DOUBLE_DIFF_UNION", () => double_diff_union()),
        @readable.Thm("UNION_COMM", () => @sets.union_comm()),
      ],
    ),
  ))
}

///|
let frontierinteriors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierInteriors")

///|
/// `FrontierInteriors`
pub fn frontierinteriors() -> @kernel.Thm {
  frontierinteriors_c.get()
}

///|
/// FrontierFrontierSubset
fn step_446() -> Unit raise {
  frontierfrontiersubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Frontier(alpha, Frontier(alpha, s)), Frontier(alpha, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("FrontierTopspace", () => frontiertopspace()),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("FrontierClosed", () => frontierclosed()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
        @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
      ],
    ),
  ))
}

///|
let frontierfrontiersubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierFrontierSubset")

///|
/// `FrontierFrontierSubset`
pub fn frontierfrontiersubset() -> @kernel.Thm {
  frontierfrontiersubset_c.get()
}

///|
/// InteriorFrontier
fn step_448() -> Unit raise {
  interiorfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Interior(alpha, Frontier(alpha, s)) == DIFF(Interior(alpha, Closure(alpha, s)), Closure(alpha, Interior(alpha, s)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.have(
          "Frontier(alpha, s) == INTER(Closure(alpha, s), DIFF(topspace(alpha), Interior(alpha, s)))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("Frontier_THM", () => frontier_thm()),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
            ],
          ),
        ),
        @readable.have(
          "Interior(alpha, Frontier(alpha, s)) == INTER(Interior(alpha, Closure(alpha, s)), DIFF(topspace(alpha), Closure(alpha, Interior(alpha, s))))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("sTop"),
              @readable.Thm("ClosureTopspace", () => closuretopspace()),
              @readable.Thm("InteriorTopspace", () => interiortopspace()),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("InteriorInter", () => interiorinter()),
              @readable.Thm("InteriorComplement", () => interiorcomplement()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("sTop"),
            @readable.Thm("ClosureTopspace", () => closuretopspace()),
            @readable.Thm("InteriorTopspace", () => interiortopspace()),
            @readable.Thm("COMPLEMENT_INTER_DIFF", () => complement_inter_diff()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorFrontier")

///|
/// `InteriorFrontier`
pub fn interiorfrontier() -> @kernel.Thm {
  interiorfrontier_c.get()
}

///|
/// InteriorFrontierEmpty
fn step_449() -> Unit raise {
  interiorfrontierempty_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) || closed_in(alpha, s) → Interior(alpha, Frontier(alpha, s)) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("InteriorFrontier", () => interiorfrontier()),
        @readable.TermRule(@sets.set_rule, "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, (DIFF(s, t) == {}) == SUBSET(s, t)"),
        @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("InteriorOpen", () => interioropen()),
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
      ],
    ),
  ))
}

///|
let interiorfrontierempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorFrontierEmpty")

///|
/// `InteriorFrontierEmpty`
pub fn interiorfrontierempty() -> @kernel.Thm {
  interiorfrontierempty_c.get()
}

///|
/// FrontierFrontier
fn step_451() -> Unit raise {
  frontierfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, open_in(alpha, s) || closed_in(alpha, s) → Frontier(alpha, Frontier(alpha, s)) == Frontier(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, openORclosed"),
        @readable.have(
          "SUBSET(s, topspace(alpha))",
          "sTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("openORclosed"),
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
              @readable.Thm("closed_in", () => closed_in()),
            ],
          ),
        ),
        @readable.have(
          "Frontier(alpha, Frontier(alpha, s)) == Closure(alpha, Frontier(alpha, s))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("FrontierTopspace", () => frontiertopspace()),
              @readable.Thm("Frontier_THM", () => frontier_thm()),
              @readable.Label("openORclosed"),
              @readable.Thm("InteriorFrontierEmpty", () => interiorfrontierempty()),
              @readable.Thm("DIFF_EMPTY", () => @sets.diff_empty()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("sTop"),
            @readable.Thm("FrontierClosed", () => frontierclosed()),
            @readable.Thm("ClosureClosed", () => closureclosed()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierFrontier")

///|
/// `FrontierFrontier`
pub fn frontierfrontier() -> @kernel.Thm {
  frontierfrontier_c.get()
}

///|
/// UnionFrontierPart1
fn step_453() -> Unit raise {
  unionfrontierpart1_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → SUBSET(INTER(Frontier(alpha, s), Interior(alpha, t)), Frontier(alpha, INTER(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
          ],
        ),
        @readable.intro_tac("forall [a], aFs aIt"),
        @readable.consider(
          "O",
          "∃ O : (_) -> Bool, open_in(alpha, O) && IN(a, O) && SUBSET(O, t)",
          "aOs",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("aIt"),
              @readable.Label("stTop"),
              @readable.Thm("IN_Interior", () => in_interior()),
            ],
          ),
        ),
        @readable.have(
          "IN(a, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Label("aFs"),
              @readable.Thm("FrontierTopspace", () => frontiertopspace()),
              @readable.Thm("SUBSET", () => @sets.subset()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("stTop"),
            @readable.Thm("FrontierStraddle", () => frontierstraddle()),
            @readable.Prev,
          ],
        ),
        @readable.intro_tac("forall [P], Popen aP"),
        @readable.have(
          "IN(a, INTER(O, P)) && open_in(alpha, INTER(O, P))",
          "aOPopen",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("aOs"),
              @readable.Label("aP"),
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
              @readable.Label("Popen"),
              @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
            ],
          ),
        ),
        @readable.consider(
          "x y",
          "∃ x : _, ∃ y : _, IN(x, s) && IN(x, INTER(O, P)) && !IN(y, s) && IN(y, INTER(O, P))",
          "xExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("aOs"),
              @readable.Label("Popen"),
              @readable.Thm("OPEN_IN_INTER", () => open_in_inter()),
              @readable.Label("aOPopen"),
              @readable.Label("stTop"),
              @readable.Label("aFs"),
              @readable.Thm("FrontierStraddle", () => frontierstraddle()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("xExists"),
            @readable.Label("aOs"),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let unionfrontierpart1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnionFrontierPart1")

///|
/// `UnionFrontierPart1`
pub fn unionfrontierpart1() -> @kernel.Thm {
  unionfrontierpart1_c.get()
}

///|
/// UnionFrontierPart2
fn step_455() -> Unit raise {
  unionfrontierpart2_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → SUBSET(DIFF(Frontier(alpha, s), Frontier(alpha, t)), UNION(Frontier(alpha, INTER(s, t)), Frontier(alpha, UNION(s, t))))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, stTop"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.have(
          "DIFF(Frontier(alpha, s), Frontier(alpha, t)) == UNION(INTER(Frontier(alpha, s), Interior(alpha, t)), INTER(Frontier(alpha, DIFF(topspace(alpha), s)), Interior(alpha, DIFF(topspace(alpha), t))))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("FrontierTopspace", () => frontiertopspace()),
              @readable.Thm("FrontierInteriors", () => frontierinteriors()),
              @readable.Thm("FrontierComplement", () => frontiercomplement()),
              @readable.TermRule(
                @sets.set_rule,
                "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ u : (_) -> Bool, SUBSET(s, A) → DIFF(s, DIFF(DIFF(A, t), u)) == UNION(INTER(s, t), INTER(s, u))",
              ),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(DIFF(Frontier(alpha, s), Frontier(alpha, t)), UNION(Frontier(alpha, INTER(s, t)), Frontier(alpha, DIFF(topspace(alpha), UNION(s, t)))))",
          "",
          @readable.by(
            @readable.simplify,
            [
              @readable.Prev,
              @readable.Label("stTop"),
              @readable.Thm("UnionFrontierPart1", () => unionfrontierpart1()),
              @readable.Thm("UNION_TENSOR", () => union_tensor()),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("DIFF_UNION", () => diff_union()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("stTop"),
            @readable.Thm("FrontierComplement", () => frontiercomplement()),
          ],
        ),
      ],
    ),
  ))
}

///|
let unionfrontierpart2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnionFrontierPart2")

///|
/// `UnionFrontierPart2`
pub fn unionfrontierpart2() -> @kernel.Thm {
  unionfrontierpart2_c.get()
}

///|
/// UnionFrontierPart3
fn step_458() -> Unit raise {
  unionfrontierpart3_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ a : _, SUBSET(UNION(s, t), topspace(alpha)) → IN(a, Frontier(alpha, s)) && NOTIN(a, Frontier(alpha, t)) → IN(a, Frontier(alpha, INTER(s, t))) || IN(a, Frontier(alpha, UNION(s, t)))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t a, H1"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("NOTIN", () => notin()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("IN_INTER", () => @sets.in_inter()),
            ),
            @readable.Rule(@equal.gsym, @readable.Thm("IN_DIFF", () => @sets.in_diff())),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("IN_UNION", () => @sets.in_union()),
            ),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Thm("UnionFrontierPart2", () => unionfrontierpart2()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
      ],
    ),
  ))
}

///|
let unionfrontierpart3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnionFrontierPart3")

///|
/// `UnionFrontierPart3`
pub fn unionfrontierpart3() -> @kernel.Thm {
  unionfrontierpart3_c.get()
}

///|
/// UnionFrontier
fn step_460() -> Unit raise {
  unionfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → UNION(Frontier(alpha, s), Frontier(alpha, t)) == UNION(Frontier(alpha, UNION(s, t)), UNION(Frontier(alpha, INTER(s, t)), INTER(Frontier(alpha, s), Frontier(alpha, t))))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("SUBSET_ANTISYM_EQ", () => @sets.subset_antisym_eq()),
            ),
          ],
        ),
        @readable.conj_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [
              @readable.TermRule(
                @sets.set_rule,
                "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(INTER(s, t), UNION(s, t))",
              ),
              @readable.Label("stTop"),
              @readable.Thm("FrontierUnionSubset", () => frontierunionsubset()),
              @readable.Thm("UNION_SUBSET", () => @sets.union_subset()),
              @readable.Thm("FrontierInterSubset", () => frontierintersubset()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
            @readable.Thm("IN_UNION", () => @sets.in_union()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("H1"),
            @readable.Thm("UnionFrontierPart3", () => unionfrontierpart3()),
            @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
            @readable.Thm("UNION_COMM", () => @sets.union_comm()),
            @readable.Thm("NOTIN", () => notin()),
          ],
        ),
      ],
    ),
  ))
}

///|
let unionfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UnionFrontier")

///|
/// `UnionFrontier`
pub fn unionfrontier() -> @kernel.Thm {
  unionfrontier_c.get()
}

///|
/// ConnectedInterFrontier
fn step_463() -> Unit raise {
  connectedinterfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → Connected(subtopology(alpha, s)) && !(INTER(s, t) == {}) && !(DIFF(s, t) == {}) → !(INTER(s, Frontier(alpha, t)) == {})",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @simp.once_rewrite_tac,
          [
            @readable.TermRule(
              @class.taut,
              "∀ a : Bool, ∀ b : Bool, ∀ c : Bool, ∀ d : Bool, (a && b && c → !d) == (b && c && d → !a)",
            ),
          ],
        ),
        @readable.intro_tac("sINTERtNonempty sDIFFtNonempty sInterFtEmpty"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("stTop"),
            @readable.Thm("ConnectedOpenIn", () => connectedopenin()),
          ],
        ),
        @readable.exists("INTER(s, Interior(alpha, t))"),
        @readable.exists("INTER(s, Interior(alpha, DIFF(topspace(alpha), t)))"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("stTop"),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Thm("OpenInterior", () => openinterior()),
            @readable.Thm("OpenInOpenInter", () => openinopeninter()),
          ],
        ),
        @readable.have(
          "SUBSET(Interior(alpha, t), t) && SUBSET(Interior(alpha, DIFF(topspace(alpha), t)), DIFF(topspace(alpha), t))",
          "IntSubs",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Thm("InteriorSubset", () => interiorsubset()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(s, UNION(Interior(alpha, t), Interior(alpha, DIFF(topspace(alpha), t))))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Label("sInterFtEmpty"),
              @readable.Thm("FrontierInteriors", () => frontierinteriors()),
              @readable.Thm("DOUBLE_DIFF_UNION", () => double_diff_union()),
              @readable.Thm("COMPLEMENT_DISJOINT", () => complement_disjoint()),
            ],
          ),
        ),
        @readable.by(
          @readable.set,
          [
            @readable.Label("sDIFFtNonempty"),
            @readable.Label("sINTERtNonempty"),
            @readable.Label("IntSubs"),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let connectedinterfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ConnectedInterFrontier")

///|
/// `ConnectedInterFrontier`
pub fn connectedinterfrontier() -> @kernel.Thm {
  connectedinterfrontier_c.get()
}

///|
/// InteriorClosedEqEmptyAsFrontier
fn step_465() -> Unit raise {
  interiorclosedeqemptyasfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → (closed_in(alpha, s) && Interior(alpha, s) == {}) == (∃ t : (_) -> Bool, open_in(alpha, t) && s == Frontier(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.eq_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("OPEN_IN_SUBSET", () => open_in_subset()),
              @readable.Thm("FrontierClosed", () => frontierclosed()),
              @readable.Thm("InteriorFrontierEmpty", () => interiorfrontierempty()),
            ],
          ),
        ),
        @readable.intro_tac("sClosed sEmptyInt"),
        @readable.exists("DIFF(topspace(alpha), s)"),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("sClosed"),
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Label("sTop"),
            @readable.Thm("FrontierComplement", () => frontiercomplement()),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Label("sEmptyInt"),
            @readable.Thm("DIFF_EMPTY", () => @sets.diff_empty()),
            @readable.Thm("ClosureClosed", () => closureclosed()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interiorclosedeqemptyasfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("InteriorClosedEqEmptyAsFrontier")

///|
/// `InteriorClosedEqEmptyAsFrontier`
pub fn interiorclosedeqemptyasfrontier() -> @kernel.Thm {
  interiorclosedeqemptyasfrontier_c.get()
}

///|
/// ClosureUnionFrontier
fn step_466() -> Unit raise {
  closureunionfrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → Closure(alpha, s) == UNION(s, Frontier(alpha, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.by(
          @readable.simplify,
          [@readable.Label("sTop"), @readable.Thm("Frontier_THM", () => frontier_thm())],
        ),
        @readable.have(
          "SUBSET(s, Closure(alpha, s)) && SUBSET(Interior(alpha, s), s)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("ClosureSubset", () => closuresubset()),
              @readable.Thm("InteriorSubset", () => interiorsubset()),
            ],
          ),
        ),
        @readable.by(@readable.set, [@readable.Prev]),
      ],
    ),
  ))
}

///|
let closureunionfrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ClosureUnionFrontier")

///|
/// `ClosureUnionFrontier`
pub fn closureunionfrontier() -> @kernel.Thm {
  closureunionfrontier_c.get()
}

///|
/// FrontierInteriorSubset
fn step_467() -> Unit raise {
  frontierinteriorsubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Frontier(alpha, Interior(alpha, s)), Frontier(alpha, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("InteriorTopspace", () => interiortopspace()),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("InteriorInterior", () => interiorinterior()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
        @readable.Thm("SubsetClosure", () => subsetclosure()),
        @readable.Thm("DIFF_SUBSET", () => diff_subset()),
      ],
    ),
  ))
}

///|
let frontierinteriorsubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierInteriorSubset")

///|
/// `FrontierInteriorSubset`
pub fn frontierinteriorsubset() -> @kernel.Thm {
  frontierinteriorsubset_c.get()
}

///|
/// FrontierClosureSubset
fn step_469() -> Unit raise {
  frontierclosuresubset_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → SUBSET(Frontier(alpha, Closure(alpha, s)), Frontier(alpha, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
        @readable.Thm("ClosureClosure", () => closureclosure()),
        @readable.Thm("ClosureTopspace", () => closuretopspace()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
        @readable.Thm("SubsetInterior", () => subsetinterior()),
        @readable.Thm("SUBSET_DUALITY", () => subset_duality()),
      ],
    ),
  ))
}

///|
let frontierclosuresubset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierClosureSubset")

///|
/// `FrontierClosureSubset`
pub fn frontierclosuresubset() -> @kernel.Thm {
  frontierclosuresubset_c.get()
}

///|
/// SetDiffFrontier
fn step_470() -> Unit raise {
  setdifffrontier_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, SUBSET(s, topspace(alpha)) → DIFF(s, Frontier(alpha, s)) == Interior(alpha, s)",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s, sTop"),
        @readable.by(
          @readable.simplify,
          [@readable.Label("sTop"), @readable.Thm("Frontier_THM", () => frontier_thm())],
        ),
        @readable.have(
          "SUBSET(s, Closure(alpha, s)) && SUBSET(Interior(alpha, s), s)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sTop"),
              @readable.Thm("ClosureSubset", () => closuresubset()),
              @readable.Thm("InteriorSubset", () => interiorsubset()),
            ],
          ),
        ),
        @readable.by(@readable.set, [@readable.Prev]),
      ],
    ),
  ))
}

///|
let setdifffrontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SetDiffFrontier")

///|
/// `SetDiffFrontier`
pub fn setdifffrontier() -> @kernel.Thm {
  setdifffrontier_c.get()
}

///|
/// FrontierInterSubsetInter
fn step_471() -> Unit raise {
  frontierintersubsetinter_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → SUBSET(Frontier(alpha, INTER(s, t)), UNION(INTER(Closure(alpha, s), Frontier(alpha, t)), INTER(Frontier(alpha, s), Closure(alpha, t))))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Label("stTop"),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Thm("InteriorInter", () => interiorinter()),
          ],
        ),
        @readable.have(
          "SUBSET(Closure(alpha, INTER(s, t)), INTER(Closure(alpha, s), Closure(alpha, t)))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Thm("ClosureInterSubset", () => closureintersubset()),
            ],
          ),
        ),
        @readable.by(@readable.set, [@readable.Prev]),
      ],
    ),
  ))
}

///|
let frontierintersubsetinter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierInterSubsetInter")

///|
/// `FrontierInterSubsetInter`
pub fn frontierintersubsetinter() -> @kernel.Thm {
  frontierintersubsetinter_c.get()
}

///|
/// FrontierUnionPart1
fn step_473() -> Unit raise {
  frontierunionpart1_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → INTER(Closure(alpha, s), Closure(alpha, t)) == {} → INTER(Frontier(alpha, s), Interior(alpha, UNION(s, t))) == {}",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1, CsCtDisjoint"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(Frontier(alpha, s), Interior(alpha, UNION(s, t))), topspace(alpha))",
          "FIstTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Thm("FrontierTopspace", () => frontiertopspace()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.have(
          "INTER(Frontier(alpha, s), INTER(Interior(alpha, UNION(s, t)), DIFF(topspace(alpha), Closure(alpha, t)))) == {}",
          "",
          @readable.steps(
            [
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("stTop"),
                  @readable.Rule(
                    @equal.gsym,
                    @readable.Thm("InteriorComplement", () => interiorcomplement()),
                  ),
                  @readable.Label("H1"),
                  @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                  @readable.Thm("InteriorInter", () => interiorinter()),
                  @readable.Thm("Frontier_THM", () => frontier_thm()),
                ],
              ),
              @readable.have(
                "SUBSET(INTER(Interior(alpha, UNION(s, t)), Interior(alpha, DIFF(topspace(alpha), t))), Interior(alpha, s))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.TermRule(
                      @sets.set_rule,
                      "∀ A : (_) -> Bool, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(s, A) → INTER(UNION(s, t), DIFF(A, t)) == DIFF(s, t)",
                    ),
                    @readable.Label("H1"),
                    @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
                    @readable.Thm("InteriorInter", () => interiorinter()),
                    @readable.Label("stTop"),
                    @readable.Thm("SubsetInterior", () => subsetinterior()),
                  ],
                ),
              ),
              @readable.by(@readable.set, [@readable.Prev]),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(INTER(Frontier(alpha, s), Interior(alpha, UNION(s, t))), Closure(alpha, t))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("CsCtDisjoint"),
              @readable.Prev,
              @readable.Label("FIstTop"),
              @readable.Thm("COMPLEMENT_DISJOINT", () => complement_disjoint()),
              @readable.Thm("INTER_ACI", () => @sets.inter_aci()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.TermRule(
              @sets.set_rule,
              "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ F : (_) -> Bool, ∀ I : (_) -> Bool, INTER(s, t) == {} && SUBSET(F, s) && SUBSET(INTER(F, I), t) → INTER(F, I) == {}",
            ),
            @readable.Label("CsCtDisjoint"),
            @readable.Label("stTop"),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
            @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
            @readable.Prev,
          ],
        ),
      ],
    ),
  ))
}

///|
let frontierunionpart1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierUnionPart1")

///|
/// `FrontierUnionPart1`
pub fn frontierunionpart1() -> @kernel.Thm {
  frontierunionpart1_c.get()
}

///|
/// FrontierUnion
fn step_474() -> Unit raise {
  frontierunion_c.set(@readable.prove(
    "∀ alpha : Topology[_], ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, SUBSET(UNION(s, t), topspace(alpha)) → INTER(Closure(alpha, s), Closure(alpha, t)) == {} → Frontier(alpha, UNION(s, t)) == UNION(Frontier(alpha, s), Frontier(alpha, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall alpha s t, H1, CsCtDisjoint"),
        @readable.have(
          "SUBSET(s, topspace(alpha)) && SUBSET(t, topspace(alpha)) && SUBSET(INTER(s, t), topspace(alpha))",
          "stTop",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by_thm(
          @tactics.match_mp_tac,
          @readable.Thm("SUBSET_ANTISYM", () => @sets.subset_antisym()),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("H1"),
            @readable.Thm("FrontierUnionSubset", () => frontierunionsubset()),
            @readable.Thm("Frontier_THM", () => frontier_thm()),
          ],
        ),
        @readable.have(
          "INTER(Frontier(alpha, s), Interior(alpha, UNION(s, t))) == {} && INTER(Frontier(alpha, t), Interior(alpha, UNION(s, t))) == {}",
          "usePart1",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("CsCtDisjoint"),
              @readable.Thm("FrontierUnionPart1", () => frontierunionpart1()),
              @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
              @readable.Thm("UNION_COMM", () => @sets.union_comm()),
            ],
          ),
        ),
        @readable.have(
          "SUBSET(Frontier(alpha, s), Closure(alpha, UNION(s, t))) && SUBSET(Frontier(alpha, t), Closure(alpha, UNION(s, t)))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("stTop"),
              @readable.Thm("Frontier_THM", () => frontier_thm()),
              @readable.Thm("SUBSET_DIFF", () => @sets.subset_diff()),
              @readable.Label("H1"),
              @readable.Thm("SUBSET_UNION", () => @sets.subset_union()),
              @readable.Thm("SubsetClosure", () => subsetclosure()),
              @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            ],
          ),
        ),
        @readable.by(@readable.set, [@readable.Label("usePart1"), @readable.Prev]),
      ],
    ),
  ))
}

///|
let frontierunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FrontierUnion")

///|
/// `FrontierUnion`
pub fn frontierunion() -> @kernel.Thm {
  frontierunion_c.get()
}

///|
/// open_def
fn step_476() -> Unit raise {
  open_def_c.set(@readable.newdefinition("(open : ((Cart[Real, _]) -> Bool) -> Bool)((s : (Cart[Real, _]) -> Bool)) == (∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && (∀ x' : Cart[Real, _], distance((x', x)) < e → IN(x', s))))"))
}

///|
let open_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("open_def")

///|
/// `open_def`
pub fn open_def() -> @kernel.Thm {
  open_def_c.get()
}

///|
/// closed
fn step_477() -> Unit raise {
  closed_c.set(@readable.newdefinition("(closed : ((Cart[Real, _]) -> Bool) -> Bool)((s : (Cart[Real, _]) -> Bool)) == open(DIFF(UNIV, s))"))
}

///|
let closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("closed")

///|
/// `closed`
pub fn closed() -> @kernel.Thm {
  closed_c.get()
}

///|
/// euclidean
fn step_478() -> Unit raise {
  euclidean_c.set(@pair.new_definition(@term_syntax.parse_term("(euclidean : Topology[Cart[Real, _]]) == mk_topology((UNIV, open))")))
}

///|
let euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclidean")

///|
/// `euclidean`
pub fn euclidean() -> @kernel.Thm {
  euclidean_c.get()
}

///|
/// OPEN_EMPTY
fn step_479() -> Unit raise {
  open_empty_c.set(@readable.prove(
    "(open : ((Cart[Real, _]) -> Bool) -> Bool)(({} : (Cart[Real, _]) -> Bool))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("open_def", () => open_def()),
        @readable.Thm("NOT_IN_EMPTY", () => @sets.not_in_empty()),
      ],
    ),
  ))
}

///|
let open_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_EMPTY")

///|
/// `OPEN_EMPTY`
pub fn open_empty() -> @kernel.Thm {
  open_empty_c.get()
}

///|
/// OPEN_UNIV
fn step_481() -> Unit raise {
  open_univ_c.set(@readable.prove(
    "(open : ((Cart[Real, _]) -> Bool) -> Bool)((UNIV : (Cart[Real, _]) -> Bool))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("open_def", () => open_def()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("REAL_LT_01", () => @real.real_lt_01()),
      ],
    ),
  ))
}

///|
let open_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_UNIV")

///|
/// `OPEN_UNIV`
pub fn open_univ() -> @kernel.Thm {
  open_univ_c.get()
}

///|
/// OPEN_INTER
fn step_484() -> Unit raise {
  open_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && open(t) → open(INTER(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall s t, sOpen tOpen"),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("open_def", () => open_def()),
            @readable.Thm("IN_INTER", () => @sets.in_inter()),
          ],
        ),
        @readable.intro_tac("forall x, xs xt"),
        @readable.consider(
          "d1",
          "∃ d1 : Real, real_of_num(0) < d1 && (∀ x' : Cart[Real, _], distance((x', x)) < d1 → IN(x', s))",
          "d1Exists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("sOpen"),
              @readable.Label("xs"),
              @readable.Thm("open_def", () => open_def()),
            ],
          ),
        ),
        @readable.consider(
          "d2",
          "∃ d2 : Real, real_of_num(0) < d2 && (∀ x' : Cart[Real, _], distance((x', x)) < d2 → IN(x', t))",
          "d2Exists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("tOpen"),
              @readable.Label("xt"),
              @readable.Thm("open_def", () => open_def()),
            ],
          ),
        ),
        @readable.consider(
          "e",
          "∃ e : Real, real_of_num(0) < e && e < d1 && e < d2",
          "eExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("d1Exists"),
              @readable.Label("d2Exists"),
              @readable.Thm("REAL_DOWN2", () => @real.real_down2()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("d1Exists"),
            @readable.Label("d2Exists"),
            @readable.Thm("REAL_LT_TRANS", () => @realarith.real_lt_trans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_INTER")

///|
/// `OPEN_INTER`
pub fn open_inter() -> @kernel.Thm {
  open_inter_c.get()
}

///|
/// OPEN_UNIONS
fn step_487() -> Unit raise {
  open_unions_c.set(@readable.prove(
    "(∀ s : (Cart[Real, _]) -> Bool, IN(s, (f : ((Cart[Real, _]) -> Bool) -> Bool)) → open(s)) → open(UNIONS(f))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("open_def", () => open_def()),
        @readable.Thm("IN_UNIONS", () => @sets.in_unions()),
      ],
    ),
  ))
}

///|
let open_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_UNIONS")

///|
/// `OPEN_UNIONS`
pub fn open_unions() -> @kernel.Thm {
  open_unions_c.get()
}

///|
/// IstopologyEuclidean
fn step_488() -> Unit raise {
  istopologyeuclidean_c.set(@readable.prove(
    "(istopology : (((Cart[Real, _]) -> Bool, ((Cart[Real, _]) -> Bool) -> Bool)) -> Bool)(((UNIV : (Cart[Real, _]) -> Bool), (open : ((Cart[Real, _]) -> Bool) -> Bool)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("istopology", () => istopology()),
        @readable.Thm("IN", () => @sets.in_()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("OPEN_EMPTY", () => open_empty()),
        @readable.Thm("OPEN_UNIV", () => open_univ()),
        @readable.Thm("OPEN_INTER", () => open_inter()),
        @readable.Thm("OPEN_UNIONS", () => open_unions()),
      ],
    ),
  ))
}

///|
let istopologyeuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IstopologyEuclidean")

///|
/// `IstopologyEuclidean`
pub fn istopologyeuclidean() -> @kernel.Thm {
  istopologyeuclidean_c.get()
}

///|
/// OPEN_IN
fn step_493() -> Unit raise {
  open_in_c.set(@readable.prove(
    "(open : ((Cart[Real, _]) -> Bool) -> Bool) == (open_in : (Topology[Cart[Real, _]], (Cart[Real, _]) -> Bool) -> Bool)((euclidean : Topology[Cart[Real, _]]))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("euclidean", () => euclidean()),
        @readable.Thm("topology_tybij", () => topology_tybij()),
        @readable.Thm("IstopologyEuclidean", () => istopologyeuclidean()),
        @readable.Thm("TopologyPAIR", () => topologypair()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let open_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN")

///|
/// `OPEN_IN`
pub fn open_in() -> @kernel.Thm {
  open_in_c.get()
}

///|
/// TOPSPACE_EUCLIDEAN
fn step_496() -> Unit raise {
  topspace_euclidean_c.set(@readable.prove(
    "(topspace : (Topology[Cart[Real, _]], Cart[Real, _]) -> Bool)((euclidean : Topology[Cart[Real, _]])) == (UNIV : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("euclidean", () => euclidean()),
        @readable.Thm("IstopologyEuclidean", () => istopologyeuclidean()),
        @readable.Thm("topology_tybij", () => topology_tybij()),
        @readable.Thm("TopologyPAIR", () => topologypair()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let topspace_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOPSPACE_EUCLIDEAN")

///|
/// `TOPSPACE_EUCLIDEAN`
pub fn topspace_euclidean() -> @kernel.Thm {
  topspace_euclidean_c.get()
}

///|
/// OPEN_EXISTS_IN
fn step_497() -> Unit raise {
  open_exists_in_c.set(@readable.prove(
    "∀ P : (_) -> Bool, ∀ Q : (_, Cart[Real, _]) -> Bool, (∀ a : _, P(a) → open({(x : Cart[Real, _]) | Q(a, x)})) → open({(x : Cart[Real, _]) | ∃ a : _, P(a) && Q(a, x)})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OPEN_IN_EXISTS_IN", () => open_in_exists_in()),
      ],
    ),
  ))
}

///|
let open_exists_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_EXISTS_IN")

///|
/// `OPEN_EXISTS_IN`
pub fn open_exists_in() -> @kernel.Thm {
  open_exists_in_c.get()
}

///|
/// OPEN_EXISTS
fn step_502() -> Unit raise {
  open_exists_c.set(@readable.prove(
    "∀ Q : (_, Cart[Real, _]) -> Bool, (∀ a : _, open({(x : Cart[Real, _]) | Q(a, x)})) → open({(x : Cart[Real, _]) | ∃ a : _, Q(a, x)})",
    @readable.steps(
      [
        @readable.intro_tac("forall Q"),
        @readable.have(
          "(∀ a : _, true → open({(x : Cart[Real, _]) | Q(a, x)})) → open({(x : Cart[Real, _]) | ∃ a : _, true && Q(a, x)})",
          "",
          @readable.by(
            @readable.simplify,
            [@readable.Thm("OPEN_EXISTS_IN", () => open_exists_in())],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let open_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_EXISTS")

///|
/// `OPEN_EXISTS`
pub fn open_exists() -> @kernel.Thm {
  open_exists_c.get()
}

///|
/// TOPSPACE_EUCLIDEAN_SUBTOPOLOGY
fn step_504() -> Unit raise {
  topspace_euclidean_subtopology_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, topspace(subtopology(euclidean, s)) == s",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
      ],
    ),
  ))
}

///|
let topspace_euclidean_subtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOPSPACE_EUCLIDEAN_SUBTOPOLOGY")

///|
/// `TOPSPACE_EUCLIDEAN_SUBTOPOLOGY`
pub fn topspace_euclidean_subtopology() -> @kernel.Thm {
  topspace_euclidean_subtopology_c.get()
}

///|
/// OPEN_IN_REFL
fn step_505() -> Unit raise {
  open_in_refl_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInRefl", () => openinrefl()),
      ],
    ),
  ))
}

///|
let open_in_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_REFL")

///|
/// `OPEN_IN_REFL`
pub fn open_in_refl() -> @kernel.Thm {
  open_in_refl_c.get()
}

///|
/// CLOSED_IN_REFL
fn step_506() -> Unit raise {
  closed_in_refl_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, s), s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("ClosedInRefl", () => closedinrefl()),
      ],
    ),
  ))
}

///|
let closed_in_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_REFL")

///|
/// `CLOSED_IN_REFL`
pub fn closed_in_refl() -> @kernel.Thm {
  closed_in_refl_c.get()
}

///|
/// CLOSED_IN
fn step_508() -> Unit raise {
  closed_in_v1_c.set(@readable.prove(
    "∀ s : _, (closed : ((Cart[Real, _]) -> Bool) -> Bool) == (closed_in : (Topology[Cart[Real, _]], (Cart[Real, _]) -> Bool) -> Bool)((euclidean : Topology[Cart[Real, _]]))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closed", () => closed()),
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("EXTENSION", () => @sets.extension()),
        @readable.Thm("IN", () => @sets.in_()),
      ],
    ),
  ))
}

///|
let closed_in_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN")

///|
/// `CLOSED_IN`
pub fn closed_in_v1() -> @kernel.Thm {
  closed_in_v1_c.get()
}

///|
/// OPEN_UNION
fn step_510() -> Unit raise {
  open_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && open(t) → open(UNION(s, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OPEN_IN_UNION", () => open_in_union()),
      ],
    ),
  ))
}

///|
let open_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_UNION")

///|
/// `OPEN_UNION`
pub fn open_union() -> @kernel.Thm {
  open_union_c.get()
}

///|
/// OPEN_SUBOPEN
fn step_511() -> Unit raise {
  open_subopen_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) == (∀ x : Cart[Real, _], IN(x, s) → (∃ t : (Cart[Real, _]) -> Bool, open(t) && IN(x, t) && SUBSET(t, s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OPEN_IN_SUBOPEN", () => open_in_subopen()),
      ],
    ),
  ))
}

///|
let open_subopen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_SUBOPEN")

///|
/// `OPEN_SUBOPEN`
pub fn open_subopen() -> @kernel.Thm {
  open_subopen_c.get()
}

///|
/// CLOSED_EMPTY
fn step_512() -> Unit raise {
  closed_empty_c.set(@readable.prove(
    "(closed : ((Cart[Real, _]) -> Bool) -> Bool)(({} : (Cart[Real, _]) -> Bool))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_EMPTY", () => closed_in_empty()),
      ],
    ),
  ))
}

///|
let closed_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_EMPTY")

///|
/// `CLOSED_EMPTY`
pub fn closed_empty() -> @kernel.Thm {
  closed_empty_c.get()
}

///|
/// CLOSED_UNIV
fn step_514() -> Unit raise {
  closed_univ_c.set(@readable.prove(
    "(closed : ((Cart[Real, _]) -> Bool) -> Bool)((UNIV : (Cart[Real, _]) -> Bool))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN_TOPSPACE", () => closed_in_topspace()),
      ],
    ),
  ))
}

///|
let closed_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_UNIV")

///|
/// `CLOSED_UNIV`
pub fn closed_univ() -> @kernel.Thm {
  closed_univ_c.get()
}

///|
/// CLOSED_UNION
fn step_515() -> Unit raise {
  closed_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && closed(t) → closed(UNION(s, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_UNION", () => closed_in_union()),
      ],
    ),
  ))
}

///|
let closed_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_UNION")

///|
/// `CLOSED_UNION`
pub fn closed_union() -> @kernel.Thm {
  closed_union_c.get()
}

///|
/// CLOSED_INTER
fn step_516() -> Unit raise {
  closed_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && closed(t) → closed(INTER(s, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_INTER", () => closed_in_inter()),
      ],
    ),
  ))
}

///|
let closed_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_INTER")

///|
/// `CLOSED_INTER`
pub fn closed_inter() -> @kernel.Thm {
  closed_inter_c.get()
}

///|
/// CLOSED_INTERS
fn step_517() -> Unit raise {
  closed_inters_c.set(@readable.prove(
    "∀ f : ((Cart[Real, _]) -> Bool) -> Bool, (∀ s : (Cart[Real, _]) -> Bool, IN(s, f) → closed(s)) → closed(INTERS(f))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_INTERS", () => closed_in_inters()),
        @readable.Thm("INTERS_0", () => @sets.inters_0()),
        @readable.Thm("CLOSED_UNIV", () => closed_univ()),
      ],
    ),
  ))
}

///|
let closed_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_INTERS")

///|
/// `CLOSED_INTERS`
pub fn closed_inters() -> @kernel.Thm {
  closed_inters_c.get()
}

///|
/// CLOSED_FORALL_IN
fn step_519() -> Unit raise {
  closed_forall_in_c.set(@readable.prove(
    "∀ P : (_) -> Bool, ∀ Q : (_, Cart[Real, _]) -> Bool, (∀ a : _, P(a) → closed({(x : Cart[Real, _]) | Q(a, x)})) → closed({(x : Cart[Real, _]) | ∀ a : _, P(a) → Q(a, x)})",
    @readable.steps_then(
      [@readable.intro_tac("forall P Q")],
      @readable.case_split(
        "Pnonempty | Pempty",
        @readable.by(@readable.fol, []),
        @list.List(["!(P == {})", "P == {}"]),
        @list.List(
          [
            @readable.steps(
              [
                @readable.by(
                  @readable.simplify,
                  [
                    @readable.Thm("CLOSED_IN", () => closed_in_v1()),
                    @readable.Label("Pnonempty"),
                    @readable.Thm("CLOSED_IN_FORALL_IN", () => closed_in_forall_in()),
                  ],
                ),
              ],
            ),
            @readable.steps(
              [
                @readable.have(
                  "{(x : Cart[Real, _]) | ∀ a : _, P(a) → Q(a, x)} == UNIV",
                  "",
                  @readable.by(@readable.set, [@readable.Label("Pempty")]),
                ),
                @readable.by(
                  @readable.simplify,
                  [@readable.Prev, @readable.Thm("CLOSED_UNIV", () => closed_univ())],
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
let closed_forall_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_FORALL_IN")

///|
/// `CLOSED_FORALL_IN`
pub fn closed_forall_in() -> @kernel.Thm {
  closed_forall_in_c.get()
}

///|
/// CLOSED_FORALL
fn step_521() -> Unit raise {
  closed_forall_c.set(@readable.prove(
    "∀ Q : (_, Cart[Real, _]) -> Bool, (∀ a : _, closed({(x : Cart[Real, _]) | Q(a, x)})) → closed({(x : Cart[Real, _]) | ∀ a : _, Q(a, x)})",
    @readable.steps(
      [
        @readable.intro_tac("forall Q"),
        @readable.have(
          "(∀ a : _, true → closed({(x : Cart[Real, _]) | Q(a, x)})) → closed({(x : Cart[Real, _]) | ∀ a : _, true → Q(a, x)})",
          "",
          @readable.by(
            @readable.simplify,
            [@readable.Thm("CLOSED_FORALL_IN", () => closed_forall_in())],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let closed_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_FORALL")

///|
/// `CLOSED_FORALL`
pub fn closed_forall() -> @kernel.Thm {
  closed_forall_c.get()
}

///|
/// OPEN_CLOSED
fn step_523() -> Unit raise {
  open_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) == closed(DIFF(UNIV, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("OPEN_IN_CLOSED_IN", () => open_in_closed_in()),
      ],
    ),
  ))
}

///|
let open_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_CLOSED")

///|
/// `OPEN_CLOSED`
pub fn open_closed() -> @kernel.Thm {
  open_closed_c.get()
}

///|
/// OPEN_DIFF
fn step_524() -> Unit raise {
  open_diff_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && closed(t) → open(DIFF(s, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("OPEN_IN_DIFF", () => open_in_diff()),
      ],
    ),
  ))
}

///|
let open_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_DIFF")

///|
/// `OPEN_DIFF`
pub fn open_diff() -> @kernel.Thm {
  open_diff_c.get()
}

///|
/// CLOSED_DIFF
fn step_525() -> Unit raise {
  closed_diff_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && open(t) → closed(DIFF(s, t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_DIFF", () => closed_in_diff()),
      ],
    ),
  ))
}

///|
let closed_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_DIFF")

///|
/// `CLOSED_DIFF`
pub fn closed_diff() -> @kernel.Thm {
  closed_diff_c.get()
}

///|
/// OPEN_INTERS
fn step_526() -> Unit raise {
  open_inters_c.set(@readable.prove(
    "∀ s : ((Cart[Real, _]) -> Bool) -> Bool, FINITE(s) && (∀ t : (Cart[Real, _]) -> Bool, IN(t, s) → open(t)) → open(INTERS(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OPEN_IN_INTERS", () => open_in_inters()),
        @readable.Thm("INTERS_0", () => @sets.inters_0()),
        @readable.Thm("OPEN_UNIV", () => open_univ()),
      ],
    ),
  ))
}

///|
let open_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_INTERS")

///|
/// `OPEN_INTERS`
pub fn open_inters() -> @kernel.Thm {
  open_inters_c.get()
}

///|
/// CLOSED_UNIONS
fn step_528() -> Unit raise {
  closed_unions_c.set(@readable.prove(
    "∀ s : ((Cart[Real, _]) -> Bool) -> Bool, FINITE(s) && (∀ t : (Cart[Real, _]) -> Bool, IN(t, s) → closed(t)) → closed(UNIONS(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("CLOSED_IN_UNIONS", () => closed_in_unions()),
      ],
    ),
  ))
}

///|
let closed_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_UNIONS")

///|
/// `CLOSED_UNIONS`
pub fn closed_unions() -> @kernel.Thm {
  closed_unions_c.get()
}

///|
/// ball
fn step_530() -> Unit raise {
  ball_c.set(@pair.new_definition(@term_syntax.parse_term("(ball : ((Cart[Real, _], Real), Cart[Real, _]) -> Bool)(((x : Cart[Real, _]), (e : Real))) == {(y : Cart[Real, _]) | distance((x, y)) < e}")))
}

///|
let ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ball")

///|
/// `ball`
pub fn ball() -> @kernel.Thm {
  ball_c.get()
}

///|
/// cball
fn step_531() -> Unit raise {
  cball_c.set(@pair.new_definition(@term_syntax.parse_term("(cball : ((Cart[Real, _], Real), Cart[Real, _]) -> Bool)(((x : Cart[Real, _]), (e : Real))) == {(y : Cart[Real, _]) | distance((x, y)) <= e}")))
}

///|
let cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cball")

///|
/// `cball`
pub fn cball() -> @kernel.Thm {
  cball_c.get()
}

///|
/// IN_BALL
fn step_532() -> Unit raise {
  in_ball_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ e : Real, IN(y, ball((x, e))) == (distance((x, y)) < e)",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("ball", () => ball()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_BALL")

///|
/// `IN_BALL`
pub fn in_ball() -> @kernel.Thm {
  in_ball_c.get()
}

///|
/// IN_CBALL
fn step_534() -> Unit raise {
  in_cball_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ e : Real, IN(y, cball((x, e))) == (distance((x, y)) <= e)",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("cball", () => cball()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
      ],
    ),
  ))
}

///|
let in_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CBALL")

///|
/// `IN_CBALL`
pub fn in_cball() -> @kernel.Thm {
  in_cball_c.get()
}

///|
/// BALL_SUBSET_CBALL
fn step_536() -> Unit raise {
  ball_subset_cball_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ e : Real, SUBSET(ball((x, e)), cball((x, e)))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("IN_BALL", () => in_ball()),
            @readable.Thm("IN_CBALL", () => in_cball()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
        @readable.by(@readable.real_arithmetic, []),
      ],
    ),
  ))
}

///|
let ball_subset_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BALL_SUBSET_CBALL")

///|
/// `BALL_SUBSET_CBALL`
pub fn ball_subset_cball() -> @kernel.Thm {
  ball_subset_cball_c.get()
}

///|
/// OPEN_BALL
fn step_540() -> Unit raise {
  open_ball_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ e : Real, open(ball((x, e)))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("open_def", () => open_def()),
            @readable.Thm("ball", () => ball()),
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("DIST_SYM", () => @vectors.dist_sym()),
            @readable.Thm("REAL_SUB_LT", () => @realarith.real_sub_lt()),
            @readable.Thm("REAL_LT_SUB_LADD", () => @real.real_lt_sub_ladd()),
            @readable.Thm("REAL_ADD_SYM", () => @realax.real_add_sym()),
            @readable.Thm("REAL_LET_TRANS", () => @realarith.real_let_trans()),
            @readable.Thm("DIST_TRIANGLE", () => @vectors.dist_triangle()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_BALL")

///|
/// `OPEN_BALL`
pub fn open_ball() -> @kernel.Thm {
  open_ball_c.get()
}

///|
/// CENTRE_IN_BALL
fn step_547() -> Unit raise {
  centre_in_ball_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ e : Real, IN(x, ball((x, e))) == (real_of_num(0) < e)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("IN_BALL", () => in_ball()),
        @readable.Thm("DIST_REFL", () => @vectors.dist_refl()),
      ],
    ),
  ))
}

///|
let centre_in_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CENTRE_IN_BALL")

///|
/// `CENTRE_IN_BALL`
pub fn centre_in_ball() -> @kernel.Thm {
  centre_in_ball_c.get()
}

///|
/// OPEN_CONTAINS_BALL
fn step_549() -> Unit raise {
  open_contains_ball_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) == (∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && SUBSET(ball((x, e)), s)))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("open_def", () => open_def()),
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_BALL", () => in_ball()),
        @readable.Thm("DIST_SYM", () => @vectors.dist_sym()),
      ],
    ),
  ))
}

///|
let open_contains_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_CONTAINS_BALL")

///|
/// `OPEN_CONTAINS_BALL`
pub fn open_contains_ball() -> @kernel.Thm {
  open_contains_ball_c.get()
}

///|
/// HALF_CBALL_IN_BALL
fn step_550() -> Unit raise {
  half_cball_in_ball_c.set(@readable.prove(
    "∀ e : Real, real_of_num(0) < e → real_of_num(0) < e / real_of_num(2) && e / real_of_num(2) < e && SUBSET(cball(((x : Cart[Real, _]), e / real_of_num(2))), ball((x, e)))",
    @readable.steps(
      [
        @readable.intro_tac("forall e, H1"),
        @readable.have(
          "real_of_num(0) < e / real_of_num(2) && e / real_of_num(2) < e",
          "",
          @readable.by(@readable.real_arithmetic, [@readable.Label("H1")]),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("IN_CBALL", () => in_cball()),
            @readable.Thm("IN_BALL", () => in_ball()),
            @readable.Thm("REAL_LET_TRANS", () => @realarith.real_let_trans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let half_cball_in_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HALF_CBALL_IN_BALL")

///|
/// `HALF_CBALL_IN_BALL`
pub fn half_cball_in_ball() -> @kernel.Thm {
  half_cball_in_ball_c.get()
}

///|
/// OPEN_IN_CONTAINS_CBALL_LEMMA
fn step_551() -> Unit raise {
  open_in_contains_cball_lemma_c.set(@readable.prove(
    "∀ t : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && SUBSET(INTER(ball((x, e)), t), s)) == (∃ e : Real, real_of_num(0) < e && SUBSET(INTER(cball((x, e)), t), s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("BALL_SUBSET_CBALL", () => ball_subset_cball()),
        @readable.Thm("HALF_CBALL_IN_BALL", () => half_cball_in_ball()),
        @readable.Thm("INTER_TENSOR", () => inter_tensor()),
        @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
        @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
      ],
    ),
  ))
}

///|
let open_in_contains_cball_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CONTAINS_CBALL_LEMMA")

///|
/// `OPEN_IN_CONTAINS_CBALL_LEMMA`
pub fn open_in_contains_cball_lemma() -> @kernel.Thm {
  open_in_contains_cball_lemma_c.get()
}

///|
/// OPEN_IN_OPEN
fn step_554() -> Unit raise {
  open_in_open_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) == (∃ t : (Cart[Real, _]) -> Bool, open(t) && s == INTER(u, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
      ],
    ),
  ))
}

///|
let open_in_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_OPEN")

///|
/// `OPEN_IN_OPEN`
pub fn open_in_open() -> @kernel.Thm {
  open_in_open_c.get()
}

///|
/// OPEN_IN_INTER_OPEN
fn step_555() -> Unit raise {
  open_in_inter_open_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) && open(t) → open_in(subtopology(euclidean, u), INTER(s, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenInSubtopologyInterOpen", () => openinsubtopologyinteropen()),
      ],
    ),
  ))
}

///|
let open_in_inter_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_INTER_OPEN")

///|
/// `OPEN_IN_INTER_OPEN`
pub fn open_in_inter_open() -> @kernel.Thm {
  open_in_inter_open_c.get()
}

///|
/// OPEN_IN_OPEN_INTER
fn step_557() -> Unit raise {
  open_in_open_inter_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, open(s) → open_in(subtopology(euclidean, u), INTER(u, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenInOpenInter", () => openinopeninter()),
      ],
    ),
  ))
}

///|
let open_in_open_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_OPEN_INTER")

///|
/// `OPEN_IN_OPEN_INTER`
pub fn open_in_open_inter() -> @kernel.Thm {
  open_in_open_inter_c.get()
}

///|
/// OPEN_OPEN_IN_TRANS
fn step_558() -> Unit raise {
  open_open_in_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && open(t) && SUBSET(t, s) → open_in(subtopology(euclidean, s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenOpenInTrans", () => openopenintrans()),
      ],
    ),
  ))
}

///|
let open_open_in_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_OPEN_IN_TRANS")

///|
/// `OPEN_OPEN_IN_TRANS`
pub fn open_open_in_trans() -> @kernel.Thm {
  open_open_in_trans_c.get()
}

///|
/// OPEN_SUBSET
fn step_559() -> Unit raise {
  open_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) && open(s) → open_in(subtopology(euclidean, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenSubset", () => opensubset()),
      ],
    ),
  ))
}

///|
let open_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_SUBSET")

///|
/// `OPEN_SUBSET`
pub fn open_subset() -> @kernel.Thm {
  open_subset_c.get()
}

///|
/// CLOSED_IN_CLOSED
fn step_561() -> Unit raise {
  closed_in_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), s) == (∃ t : (Cart[Real, _]) -> Bool, closed(t) && s == INTER(u, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
        @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
      ],
    ),
  ))
}

///|
let closed_in_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_CLOSED")

///|
/// `CLOSED_IN_CLOSED`
pub fn closed_in_closed() -> @kernel.Thm {
  closed_in_closed_c.get()
}

///|
/// CLOSED_SUBSET_EQ
fn step_562() -> Unit raise {
  closed_subset_eq_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, closed(s) → closed_in(subtopology(euclidean, u), s) == SUBSET(s, u)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedSubsetEq", () => closedsubseteq()),
      ],
    ),
  ))
}

///|
let closed_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_SUBSET_EQ")

///|
/// `CLOSED_SUBSET_EQ`
pub fn closed_subset_eq() -> @kernel.Thm {
  closed_subset_eq_c.get()
}

///|
/// CLOSED_IN_INTER_CLOSED
fn step_564() -> Unit raise {
  closed_in_inter_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), s) && closed(t) → closed_in(subtopology(euclidean, u), INTER(s, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedInInterClosed", () => closedininterclosed()),
      ],
    ),
  ))
}

///|
let closed_in_inter_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_INTER_CLOSED")

///|
/// `CLOSED_IN_INTER_CLOSED`
pub fn closed_in_inter_closed() -> @kernel.Thm {
  closed_in_inter_closed_c.get()
}

///|
/// CLOSED_IN_CLOSED_INTER
fn step_566() -> Unit raise {
  closed_in_closed_inter_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, closed(s) → closed_in(subtopology(euclidean, u), INTER(u, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedInClosedInter", () => closedinclosedinter()),
      ],
    ),
  ))
}

///|
let closed_in_closed_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_CLOSED_INTER")

///|
/// `CLOSED_IN_CLOSED_INTER`
pub fn closed_in_closed_inter() -> @kernel.Thm {
  closed_in_closed_inter_c.get()
}

///|
/// CLOSED_SUBSET
fn step_568() -> Unit raise {
  closed_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) && closed(s) → closed_in(subtopology(euclidean, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedSubset", () => closedsubset()),
      ],
    ),
  ))
}

///|
let closed_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_SUBSET")

///|
/// `CLOSED_SUBSET`
pub fn closed_subset() -> @kernel.Thm {
  closed_subset_c.get()
}

///|
/// OPEN_IN_SUBSET_TRANS
fn step_570() -> Unit raise {
  open_in_subset_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) && SUBSET(s, t) && SUBSET(t, u) → open_in(subtopology(euclidean, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("OpenInSubsetTrans", () => openinsubsettrans()),
      ],
    ),
  ))
}

///|
let open_in_subset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBSET_TRANS")

///|
/// `OPEN_IN_SUBSET_TRANS`
pub fn open_in_subset_trans() -> @kernel.Thm {
  open_in_subset_trans_c.get()
}

///|
/// CLOSED_IN_SUBSET_TRANS
fn step_572() -> Unit raise {
  closed_in_subset_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), s) && SUBSET(s, t) && SUBSET(t, u) → closed_in(subtopology(euclidean, t), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedInSubsetTrans", () => closedinsubsettrans()),
      ],
    ),
  ))
}

///|
let closed_in_subset_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBSET_TRANS")

///|
/// `CLOSED_IN_SUBSET_TRANS`
pub fn closed_in_subset_trans() -> @kernel.Thm {
  closed_in_subset_trans_c.get()
}

///|
/// OPEN_IN_CONTAINS_BALL_LEMMA
fn step_574() -> Unit raise {
  open_in_contains_ball_lemma_c.set(@readable.prove(
    "∀ t : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ x : Cart[Real, _], IN(x, s) → (∃ E : (Cart[Real, _]) -> Bool, open(E) && IN(x, E) && SUBSET(INTER(E, t), s)) == (∃ e : Real, real_of_num(0) < e && SUBSET(INTER(ball((x, e)), t), s))",
    @readable.steps(
      [
        @readable.intro_tac("forall  t s x, xs"),
        @readable.eq_tac(
          "Right",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("CENTRE_IN_BALL", () => centre_in_ball()),
              @readable.Thm("OPEN_BALL", () => open_ball()),
            ],
          ),
        ),
        @readable.intro_tac("H2"),
        @readable.consider(
          "a",
          "∃ a : (Cart[Real, _]) -> Bool, open(a) && IN(x, a) && SUBSET(INTER(a, t), s)",
          "aExists",
          @readable.by(@readable.fol, [@readable.Label("H2")]),
        ),
        @readable.consider(
          "e",
          "∃ e : Real, real_of_num(0) < e && SUBSET(ball((x, e)), a)",
          "eExists",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Thm("OPEN_CONTAINS_BALL", () => open_contains_ball()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("aExists"),
            @readable.Prev,
            @readable.Thm("INTER_SUBSET", () => @sets.inter_subset()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("SUBSET_INTER", () => @sets.subset_inter()),
            ),
            @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_contains_ball_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CONTAINS_BALL_LEMMA")

///|
/// `OPEN_IN_CONTAINS_BALL_LEMMA`
pub fn open_in_contains_ball_lemma() -> @kernel.Thm {
  open_in_contains_ball_lemma_c.get()
}

///|
/// OPEN_IN_CONTAINS_BALL
fn step_578() -> Unit raise {
  open_in_contains_ball_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, t), s) == (SUBSET(s, t) && (∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && SUBSET(INTER(ball((x, e)), t), s))))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("SubtopologyOpenInSubopen", () => subtopologyopeninsubopen()),
        @readable.Rule(@equal.gsym, @readable.Thm("OPEN_IN", () => open_in())),
        @readable.Rule(
          @equal.gsym,
          @readable.Thm(
            "OPEN_IN_CONTAINS_BALL_LEMMA",
            () => open_in_contains_ball_lemma(),
          ),
        ),
      ],
    ),
  ))
}

///|
let open_in_contains_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CONTAINS_BALL")

///|
/// `OPEN_IN_CONTAINS_BALL`
pub fn open_in_contains_ball() -> @kernel.Thm {
  open_in_contains_ball_c.get()
}

///|
/// OPEN_IN_CONTAINS_CBALL
fn step_581() -> Unit raise {
  open_in_contains_cball_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, t), s) == (SUBSET(s, t) && (∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && SUBSET(INTER(cball((x, e)), t), s))))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN_CONTAINS_BALL", () => open_in_contains_ball()),
        @readable.Thm(
          "OPEN_IN_CONTAINS_CBALL_LEMMA",
          () => open_in_contains_cball_lemma(),
        ),
      ],
    ),
  ))
}

///|
let open_in_contains_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_CONTAINS_CBALL")

///|
/// `OPEN_IN_CONTAINS_CBALL`
pub fn open_in_contains_cball() -> @kernel.Thm {
  open_in_contains_cball_c.get()
}

///|
/// open_in
fn step_584() -> Unit raise {
  open_in_v1_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) == (SUBSET(s, u) && (∀ x : Cart[Real, _], IN(x, s) → (∃ e : Real, real_of_num(0) < e && (∀ x' : Cart[Real, _], IN(x', u) && distance((x', x)) < e → IN(x', s)))))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("OPEN_IN_CONTAINS_BALL", () => open_in_contains_ball()),
        @readable.Thm("IN_INTER", () => @sets.in_inter()),
        @readable.Thm("SUBSET", () => @sets.subset()),
        @readable.Thm("IN_BALL", () => in_ball()),
        @readable.Thm("CONJ_SYM", () => @theorems.conj_sym()),
        @readable.Thm("DIST_SYM", () => @vectors.dist_sym()),
      ],
    ),
  ))
}

///|
let open_in_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("open_in")

///|
/// `open_in`
pub fn open_in_v1() -> @kernel.Thm {
  open_in_v1_c.get()
}

///|
/// OPEN_IN_TRANS
fn step_586() -> Unit raise {
  open_in_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, t), s) && open_in(subtopology(euclidean, u), t) → open_in(subtopology(euclidean, u), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t u"),
        @readable.have(
          "SUBSET(t, topspace(euclidean)) && SUBSET(u, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("OPEN_IN", () => open_in()),
            @readable.Thm("OpenInTrans", () => openintrans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_TRANS")

///|
/// `OPEN_IN_TRANS`
pub fn open_in_trans() -> @kernel.Thm {
  open_in_trans_c.get()
}

///|
/// OPEN_IN_TRANS_EQ
fn step_587() -> Unit raise {
  open_in_trans_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, (∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, t), u) → open_in(subtopology(euclidean, s), t)) == open_in(subtopology(euclidean, s), t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInTransEq", () => openintranseq()),
      ],
    ),
  ))
}

///|
let open_in_trans_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_TRANS_EQ")

///|
/// `OPEN_IN_TRANS_EQ`
pub fn open_in_trans_eq() -> @kernel.Thm {
  open_in_trans_eq_c.get()
}

///|
/// OPEN_IN_OPEN_TRANS
fn step_589() -> Unit raise {
  open_in_open_trans_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) && open(u) → open(s)",
    @readable.steps(
      [
        @readable.intro_tac("forall u s, H1"),
        @readable.have(
          "SUBSET(u, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Label("H1"),
            @readable.Thm("OPEN_IN", () => open_in()),
            @readable.Thm("OpenInOpenTrans", () => openinopentrans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_open_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_OPEN_TRANS")

///|
/// `OPEN_IN_OPEN_TRANS`
pub fn open_in_open_trans() -> @kernel.Thm {
  open_in_open_trans_c.get()
}

///|
/// CLOSED_IN_TRANS
fn step_590() -> Unit raise {
  closed_in_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, t), s) && closed_in(subtopology(euclidean, u), t) → closed_in(subtopology(euclidean, u), s)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t u"),
        @readable.have(
          "SUBSET(t, topspace(euclidean)) && SUBSET(u, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("ClosedInSubtopologyTrans", () => closedinsubtopologytrans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_TRANS")

///|
/// `CLOSED_IN_TRANS`
pub fn closed_in_trans() -> @kernel.Thm {
  closed_in_trans_c.get()
}

///|
/// CLOSED_IN_TRANS_EQ
fn step_591() -> Unit raise {
  closed_in_trans_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, (∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, t), u) → closed_in(subtopology(euclidean, s), t)) == closed_in(subtopology(euclidean, s), t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("ClosedInSubtopologyTransEq", () => closedinsubtopologytranseq()),
      ],
    ),
  ))
}

///|
let closed_in_trans_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_TRANS_EQ")

///|
/// `CLOSED_IN_TRANS_EQ`
pub fn closed_in_trans_eq() -> @kernel.Thm {
  closed_in_trans_eq_c.get()
}

///|
/// CLOSED_IN_CLOSED_TRANS
fn step_593() -> Unit raise {
  closed_in_closed_trans_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), s) && closed(u) → closed(s)",
    @readable.steps(
      [
        @readable.intro_tac("forall u s"),
        @readable.have(
          "SUBSET(u, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("CLOSED_IN", () => closed_in_v1()),
            @readable.Thm("ClosedInClosedTrans", () => closedinclosedtrans()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closed_in_closed_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_CLOSED_TRANS")

///|
/// `CLOSED_IN_CLOSED_TRANS`
pub fn closed_in_closed_trans() -> @kernel.Thm {
  closed_in_closed_trans_c.get()
}

///|
/// OPEN_IN_SUBTOPOLOGY_INTER_SUBSET
fn step_594() -> Unit raise {
  open_in_subtopology_inter_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, ∀ v : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), INTER(u, s)) && SUBSET(v, u) → open_in(subtopology(euclidean, v), INTER(v, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm(
          "OpenInSubtopologyInterSubset",
          () => openinsubtopologyintersubset(),
        ),
      ],
    ),
  ))
}

///|
let open_in_subtopology_inter_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBTOPOLOGY_INTER_SUBSET")

///|
/// `OPEN_IN_SUBTOPOLOGY_INTER_SUBSET`
pub fn open_in_subtopology_inter_subset() -> @kernel.Thm {
  open_in_subtopology_inter_subset_c.get()
}

///|
/// OPEN_IN_OPEN_EQ
fn step_596() -> Unit raise {
  open_in_open_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) → open_in(subtopology(euclidean, s), t) == (open(t) && SUBSET(t, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInOpenEq", () => openinopeneq()),
      ],
    ),
  ))
}

///|
let open_in_open_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_OPEN_EQ")

///|
/// `OPEN_IN_OPEN_EQ`
pub fn open_in_open_eq() -> @kernel.Thm {
  open_in_open_eq_c.get()
}

///|
/// CLOSED_IN_CLOSED_EQ
fn step_598() -> Unit raise {
  closed_in_closed_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) → closed_in(subtopology(euclidean, s), t) == (closed(t) && SUBSET(t, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("ClosedInClosedEq", () => closedinclosedeq()),
      ],
    ),
  ))
}

///|
let closed_in_closed_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_CLOSED_EQ")

///|
/// `CLOSED_IN_CLOSED_EQ`
pub fn closed_in_closed_eq() -> @kernel.Thm {
  closed_in_closed_eq_c.get()
}

///|
/// OPEN_IN_INJECTIVE_LINEAR_IMAGE
fn step_600() -> Unit raise {
  open_in_injective_linear_image_c.set(@readable.prove(
    "∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, linear(f) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], f(x) == f(y) → x == y) → open_in(subtopology(euclidean, IMAGE(f, t)), IMAGE(f, s)) == open_in(subtopology(euclidean, t), s)",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("open_in", () => open_in_v1()),
            @readable.Thm("FORALL_IN_IMAGE", () => @sets.forall_in_image()),
            @readable.Thm("IMP_CONJ", () => @theorems.imp_conj()),
            @readable.Thm("SUBSET", () => @sets.subset()),
          ],
        ),
        @readable.intro_tac("forall f s t, H1, H2"),
        @readable.have(
          "∀ x : Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, IN(f(x), IMAGE(f, s)) == IN(x, s)",
          "fInjMap",
          @readable.by(@readable.set, [@readable.Label("H2")]),
        ),
        @readable.by(@readable.rewrite, [@readable.Prev]),
        @readable.have(
          "∀ x : Cart[Real, _], ∀ y : Cart[Real, _], f(x) - f(y) == f(x - y)",
          "fSubLinear",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("LINEAR_SUB", () => @vectors.linear_sub()),
            ],
          ),
        ),
        @readable.consider(
          "B1",
          "∃ B1 : Real, real_of_num(0) < B1 && (∀ x : Cart[Real, _], norm(f(x)) <= B1 * norm(x))",
          "B1exists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Thm("LINEAR_BOUNDED_POS", () => @vectors.linear_bounded_pos()),
            ],
          ),
        ),
        @readable.consider(
          "B2",
          "∃ B2 : Real, real_of_num(0) < B2 && (∀ x : Cart[Real, _], norm(x) * B2 <= norm(f(x)))",
          "B2exists",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("H1"),
              @readable.Label("H2"),
              @readable.Thm(
                "LINEAR_INJECTIVE_BOUNDED_BELOW_POS",
                () => @vectors.linear_injective_bounded_below_pos(),
              ),
            ],
          ),
        ),
        @tactics.ap_term_tac,
        @readable.eq_tac(
          "Left",
          @readable.steps(
            [
              @readable.intro_tac("H3, forall x, xs"),
              @readable.consider(
                "e",
                "∃ e : Real, real_of_num(0) < e && (∀ x' : Cart[Real, _], IN(x', t) → distance((f(x'), f(x))) < e → IN(x', s))",
                "eExists",
                @readable.by(
                  @readable.fol,
                  [@readable.Label("H3"), @readable.Label("xs")],
                ),
              ),
              @readable.exists("e / B1"),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Thm("REAL_LT_DIV", () => @real.real_lt_div()),
                  @readable.Label("eExists"),
                  @readable.Label("B1exists"),
                ],
              ),
              @readable.intro_tac("forall x', x't"),
              @readable.have(
                "∀ x : Cart[Real, _], norm(f(x)) <= B1 * norm(x) && norm(x) * B1 < e → norm(f(x)) < e",
                "normB1",
                @readable.by(@readable.real_arithmetic, []),
              ),
              @readable.by(
                @readable.simplify,
                [
                  @readable.Label("fSubLinear"),
                  @readable.Label("B1exists"),
                  @readable.Label("H3"),
                  @readable.Label("eExists"),
                  @readable.Label("x't"),
                  @readable.Label("normB1"),
                  @readable.Thm("dist", () => @vectors.dist()),
                  @readable.Thm("REAL_LT_RDIV_EQ", () => @real.real_lt_rdiv_eq()),
                ],
              ),
            ],
          ),
        ),
        @readable.intro_tac("H3, forall x, xs"),
        @readable.consider(
          "e",
          "∃ e : Real, real_of_num(0) < e && (∀ x' : Cart[Real, _], IN(x', t) → distance((x', x)) < e → IN(x', s))",
          "eExists",
          @readable.by(@readable.fol, [@readable.Label("H3"), @readable.Label("xs")]),
        ),
        @readable.exists("e * B2"),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("REAL_LT_MUL", () => @real.real_lt_mul()),
            @readable.Label("eExists"),
            @readable.Label("B2exists"),
          ],
        ),
        @readable.intro_tac("forall x', x't"),
        @readable.have(
          "∀ x : Cart[Real, _], norm(x) <= norm(f(x)) / B2 && norm(f(x)) / B2 < e → norm(x) < e",
          "normB2",
          @readable.by(@readable.real_arithmetic, []),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("fSubLinear"),
            @readable.Label("B2exists"),
            @readable.Label("H3"),
            @readable.Label("eExists"),
            @readable.Label("x't"),
            @readable.Label("normB2"),
            @readable.Thm("dist", () => @vectors.dist()),
            @readable.Thm("REAL_LE_RDIV_EQ", () => @real.real_le_rdiv_eq()),
            @readable.Thm("REAL_LT_LDIV_EQ", () => @real.real_lt_ldiv_eq()),
          ],
        ),
      ],
    ),
  ))
}

///|
let open_in_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_INJECTIVE_LINEAR_IMAGE")

///|
/// `OPEN_IN_INJECTIVE_LINEAR_IMAGE`
pub fn open_in_injective_linear_image() -> @kernel.Thm {
  open_in_injective_linear_image_c.get()
}

///|
/// RichterHilbertAxiomGeometry/Topology.ml:2740
fn step_611() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([open_in_injective_linear_image()]))
}

///|
/// CLOSED_IN_INJECTIVE_LINEAR_IMAGE
fn step_612() -> Unit raise {
  closed_in_injective_linear_image_c.set(@readable.prove(
    "∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, linear(f) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], f(x) == f(y) → x == y) → closed_in(subtopology(euclidean, IMAGE(f, t)), IMAGE(f, s)) == closed_in(subtopology(euclidean, t), s)",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("closed_in", () => closed_in()),
            @readable.Thm(
              "TOPSPACE_EUCLIDEAN_SUBTOPOLOGY",
              () => topspace_euclidean_subtopology(),
            ),
          ],
        ),
        @determinants.geom_transform_tac(@list.List([])),
      ],
    ),
  ))
}

///|
let closed_in_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_INJECTIVE_LINEAR_IMAGE")

///|
/// `CLOSED_IN_INJECTIVE_LINEAR_IMAGE`
pub fn closed_in_injective_linear_image() -> @kernel.Thm {
  closed_in_injective_linear_image_c.get()
}

///|
/// RichterHilbertAxiomGeometry/Topology.ml:2753
fn step_615() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([closed_in_injective_linear_image()]))
}

///|
/// OPEN_IN_SUBTOPOLOGY
fn step_616() -> Unit raise {
  open_in_subtopology_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), s) == (∃ t : (Cart[Real, _]) -> Bool, open_in(euclidean, t) && s == INTER(t, u))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInSubtopology", () => openinsubtopology()),
      ],
    ),
  ))
}

///|
let open_in_subtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBTOPOLOGY")

///|
/// `OPEN_IN_SUBTOPOLOGY`
pub fn open_in_subtopology() -> @kernel.Thm {
  open_in_subtopology_c.get()
}

///|
/// TOPSPACE_SUBTOPOLOGY
fn step_617() -> Unit raise {
  topspace_subtopology_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, topspace(subtopology(euclidean, u)) == INTER(topspace(euclidean), u)",
    @readable.steps(
      [
        @readable.intro_tac("forall u"),
        @readable.have(
          "SUBSET(u, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
            @readable.Thm("INTER_COMM", () => @sets.inter_comm()),
            @readable.Thm(
              "SUBSET_INTER_ABSORPTION",
              () => @sets.subset_inter_absorption(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let topspace_subtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TOPSPACE_SUBTOPOLOGY")

///|
/// `TOPSPACE_SUBTOPOLOGY`
pub fn topspace_subtopology() -> @kernel.Thm {
  topspace_subtopology_c.get()
}

///|
/// CLOSED_IN_SUBTOPOLOGY
fn step_618() -> Unit raise {
  closed_in_subtopology_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), s) == (∃ t : (Cart[Real, _]) -> Bool, closed_in(euclidean, t) && s == INTER(t, u))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("ClosedInSubtopology", () => closedinsubtopology()),
      ],
    ),
  ))
}

///|
let closed_in_subtopology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBTOPOLOGY")

///|
/// `CLOSED_IN_SUBTOPOLOGY`
pub fn closed_in_subtopology() -> @kernel.Thm {
  closed_in_subtopology_c.get()
}

///|
/// OPEN_IN_SUBTOPOLOGY_REFL
fn step_619() -> Unit raise {
  open_in_subtopology_refl_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, u), u) == SUBSET(u, topspace(euclidean))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OPEN_IN_REFL", () => open_in_refl()),
      ],
    ),
  ))
}

///|
let open_in_subtopology_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBTOPOLOGY_REFL")

///|
/// `OPEN_IN_SUBTOPOLOGY_REFL`
pub fn open_in_subtopology_refl() -> @kernel.Thm {
  open_in_subtopology_refl_c.get()
}

///|
/// CLOSED_IN_SUBTOPOLOGY_REFL
fn step_621() -> Unit raise {
  closed_in_subtopology_refl_c.set(@readable.prove(
    "∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, u), u) == SUBSET(u, topspace(euclidean))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN_REFL", () => closed_in_refl()),
      ],
    ),
  ))
}

///|
let closed_in_subtopology_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBTOPOLOGY_REFL")

///|
/// `CLOSED_IN_SUBTOPOLOGY_REFL`
pub fn closed_in_subtopology_refl() -> @kernel.Thm {
  closed_in_subtopology_refl_c.get()
}

///|
/// SUBTOPOLOGY_UNIV
fn step_623() -> Unit raise {
  subtopology_univ_c.set(@readable.prove(
    "(subtopology : (Topology[Cart[Real, _]], (Cart[Real, _]) -> Bool) -> Topology[Cart[Real, _]])((euclidean : Topology[Cart[Real, _]]), (UNIV : (Cart[Real, _]) -> Bool)) == (euclidean : Topology[Cart[Real, _]])",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("Topology_Eq", () => topology_eq()),
            ),
          ],
        ),
        @readable.conj_tac(
          "Left",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
              @readable.Thm(
                "TOPSPACE_EUCLIDEAN_SUBTOPOLOGY",
                () => topspace_euclidean_subtopology(),
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Rule(@equal.gsym, @readable.Thm("OPEN_IN", () => open_in())),
            @readable.Thm("OPEN_IN_OPEN", () => open_in_open()),
            @readable.Thm("INTER_UNIV", () => @sets.inter_univ()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let subtopology_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTOPOLOGY_UNIV")

///|
/// `SUBTOPOLOGY_UNIV`
pub fn subtopology_univ() -> @kernel.Thm {
  subtopology_univ_c.get()
}

///|
/// SUBTOPOLOGY_SUPERSET
fn step_625() -> Unit raise {
  subtopology_superset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(topspace(euclidean), s) → subtopology(euclidean, s) == euclidean",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("UNIV_SUBSET", () => @sets.univ_subset()),
        @readable.Thm("SUBTOPOLOGY_UNIV", () => subtopology_univ()),
      ],
    ),
  ))
}

///|
let subtopology_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTOPOLOGY_SUPERSET")

///|
/// `SUBTOPOLOGY_SUPERSET`
pub fn subtopology_superset() -> @kernel.Thm {
  subtopology_superset_c.get()
}

///|
/// OPEN_IN_IMP_SUBSET
fn step_628() -> Unit raise {
  open_in_imp_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) → SUBSET(t, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInImpSubset", () => openinimpsubset()),
      ],
    ),
  ))
}

///|
let open_in_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_IMP_SUBSET")

///|
/// `OPEN_IN_IMP_SUBSET`
pub fn open_in_imp_subset() -> @kernel.Thm {
  open_in_imp_subset_c.get()
}

///|
/// CLOSED_IN_IMP_SUBSET
fn step_629() -> Unit raise {
  closed_in_imp_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, s), t) → SUBSET(t, s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("ClosedInImpSubset", () => closedinimpsubset()),
      ],
    ),
  ))
}

///|
let closed_in_imp_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_IMP_SUBSET")

///|
/// `CLOSED_IN_IMP_SUBSET`
pub fn closed_in_imp_subset() -> @kernel.Thm {
  closed_in_imp_subset_c.get()
}

///|
/// OPEN_IN_SUBTOPOLOGY_UNION
fn step_630() -> Unit raise {
  open_in_subtopology_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, t), s) && open_in(subtopology(euclidean, u), s) → open_in(subtopology(euclidean, UNION(t, u)), s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInSubtopologyUnion", () => openinsubtopologyunion()),
      ],
    ),
  ))
}

///|
let open_in_subtopology_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_IN_SUBTOPOLOGY_UNION")

///|
/// `OPEN_IN_SUBTOPOLOGY_UNION`
pub fn open_in_subtopology_union() -> @kernel.Thm {
  open_in_subtopology_union_c.get()
}

///|
/// CLOSED_IN_SUBTOPOLOGY_UNION
fn step_632() -> Unit raise {
  closed_in_subtopology_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, t), s) && closed_in(subtopology(euclidean, u), s) → closed_in(subtopology(euclidean, UNION(t, u)), s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("ClosedInSubtopologyUnion", () => closedinsubtopologyunion()),
      ],
    ),
  ))
}

///|
let closed_in_subtopology_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_SUBTOPOLOGY_UNION")

///|
/// `CLOSED_IN_SUBTOPOLOGY_UNION`
pub fn closed_in_subtopology_union() -> @kernel.Thm {
  closed_in_subtopology_union_c.get()
}

///|
/// connected_DEF
fn step_634() -> Unit raise {
  connected_def_v1_c.set(@readable.newdefinition("(connected : ((Cart[Real, _]) -> Bool) -> Bool)((s : (Cart[Real, _]) -> Bool)) == Connected(subtopology(euclidean, s))"))
}

///|
let connected_def_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("connected_DEF")

///|
/// `connected_DEF`
pub fn connected_def_v1() -> @kernel.Thm {
  connected_def_v1_c.get()
}

///|
/// connected
fn step_635() -> Unit raise {
  connected_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, open(e1) && open(e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} && !(INTER(e1, s) == {}) && !(INTER(e2, s) == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("ConnectedSubtopology", () => connectedsubtopology()),
      ],
    ),
  ))
}

///|
let connected_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("connected")

///|
/// `connected`
pub fn connected() -> @kernel.Thm {
  connected_c.get()
}

///|
/// CONNECTED_CLOSED
fn step_637() -> Unit raise {
  connected_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, closed(e1) && closed(e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, INTER(e2, s)) == {} && !(INTER(e1, s) == {}) && !(INTER(e2, s) == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ConnectedClosedSubtopology", () => connectedclosedsubtopology()),
      ],
    ),
  ))
}

///|
let connected_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOSED")

///|
/// `CONNECTED_CLOSED`
pub fn connected_closed() -> @kernel.Thm {
  connected_closed_c.get()
}

///|
/// CONNECTED_OPEN_IN
fn step_638() -> Unit raise {
  connected_open_in_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), e1) && open_in(subtopology(euclidean, s), e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("ConnectedOpenIn", () => connectedopenin()),
      ],
    ),
  ))
}

///|
let connected_open_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_OPEN_IN")

///|
/// `CONNECTED_OPEN_IN`
pub fn connected_open_in() -> @kernel.Thm {
  connected_open_in_c.get()
}

///|
/// CONNECTED_OPEN_IN_EQ
fn step_639() -> Unit raise {
  connected_open_in_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), e1) && open_in(subtopology(euclidean, s), e2) && UNION(e1, e2) == s && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("Connected_DEF", () => connected_def()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("EQ_SYM_EQ", () => @theorems.eq_sym_eq()),
      ],
    ),
  ))
}

///|
let connected_open_in_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_OPEN_IN_EQ")

///|
/// `CONNECTED_OPEN_IN_EQ`
pub fn connected_open_in_eq() -> @kernel.Thm {
  connected_open_in_eq_c.get()
}

///|
/// CONNECTED_CLOSED_IN
fn step_641() -> Unit raise {
  connected_closed_in_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, s), e1) && closed_in(subtopology(euclidean, s), e2) && SUBSET(s, UNION(e1, e2)) && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ConnectedClosedIn", () => connectedclosedin()),
      ],
    ),
  ))
}

///|
let connected_closed_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOSED_IN")

///|
/// `CONNECTED_CLOSED_IN`
pub fn connected_closed_in() -> @kernel.Thm {
  connected_closed_in_c.get()
}

///|
/// CONNECTED_CLOSED_IN_EQ
fn step_643() -> Unit raise {
  connected_closed_in_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, s), e1) && closed_in(subtopology(euclidean, s), e2) && UNION(e1, e2) == s && INTER(e1, e2) == {} && !(e1 == {}) && !(e2 == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("ConnectedClosed", () => connectedclosed()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
        @readable.Thm("EQ_SYM_EQ", () => @theorems.eq_sym_eq()),
      ],
    ),
  ))
}

///|
let connected_closed_in_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOSED_IN_EQ")

///|
/// `CONNECTED_CLOSED_IN_EQ`
pub fn connected_closed_in_eq() -> @kernel.Thm {
  connected_closed_in_eq_c.get()
}

///|
/// CONNECTED_CLOPEN
fn step_644() -> Unit raise {
  connected_clopen_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) == (∀ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && closed_in(subtopology(euclidean, s), t) → t == {} || t == s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("ConnectedClopen", () => connectedclopen()),
        @readable.Thm("TopspaceSubtopology", () => topspacesubtopology()),
      ],
    ),
  ))
}

///|
let connected_clopen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOPEN")

///|
/// `CONNECTED_CLOPEN`
pub fn connected_clopen() -> @kernel.Thm {
  connected_clopen_c.get()
}

///|
/// CONNECTED_CLOSED_SET
fn step_646() -> Unit raise {
  connected_closed_set_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(s) → connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, closed(e1) && closed(e2) && !(e1 == {}) && !(e2 == {}) && UNION(e1, e2) == s && INTER(e1, e2) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closed_in", () => closed_in()),
        @readable.Thm("ConnectedClosedSet", () => connectedclosedset()),
      ],
    ),
  ))
}

///|
let connected_closed_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOSED_SET")

///|
/// `CONNECTED_CLOSED_SET`
pub fn connected_closed_set() -> @kernel.Thm {
  connected_closed_set_c.get()
}

///|
/// CONNECTED_OPEN_SET
fn step_647() -> Unit raise {
  connected_open_set_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) → connected(s) == !(∃ e1 : (Cart[Real, _]) -> Bool, ∃ e2 : (Cart[Real, _]) -> Bool, open(e1) && open(e2) && !(e1 == {}) && !(e2 == {}) && UNION(e1, e2) == s && INTER(e1, e2) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("ConnectedOpenSet", () => connectedopenset()),
      ],
    ),
  ))
}

///|
let connected_open_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_OPEN_SET")

///|
/// `CONNECTED_OPEN_SET`
pub fn connected_open_set() -> @kernel.Thm {
  connected_open_set_c.get()
}

///|
/// CONNECTED_EMPTY
fn step_648() -> Unit raise {
  connected_empty_c.set(@readable.prove(
    "(connected : ((Cart[Real, _]) -> Bool) -> Bool)(({} : (Cart[Real, _]) -> Bool))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("ConnectedEmpty", () => connectedempty()),
      ],
    ),
  ))
}

///|
let connected_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_EMPTY")

///|
/// `CONNECTED_EMPTY`
pub fn connected_empty() -> @kernel.Thm {
  connected_empty_c.get()
}

///|
/// CONNECTED_SING
fn step_650() -> Unit raise {
  connected_sing_c.set(@readable.prove(
    "∀ a : Cart[Real, _], connected({a})",
    @readable.steps(
      [
        @readable.intro_tac("forall a"),
        @readable.have(
          "IN(a, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("IN_UNIV", () => @sets.in_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("ConnectedSing", () => connectedsing()),
            @readable.Thm("connected_DEF", () => connected_def_v1()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_SING")

///|
/// `CONNECTED_SING`
pub fn connected_sing() -> @kernel.Thm {
  connected_sing_c.get()
}

///|
/// CONNECTED_UNIONS
fn step_652() -> Unit raise {
  connected_unions_c.set(@readable.prove(
    "∀ P : ((Cart[Real, _]) -> Bool) -> Bool, (∀ s : (Cart[Real, _]) -> Bool, IN(s, P) → connected(s)) && !(INTERS(P) == {}) → connected(UNIONS(P))",
    @readable.steps(
      [
        @readable.intro_tac("forall P"),
        @readable.have(
          "∀ s : (Cart[Real, _]) -> Bool, IN(s, P) → SUBSET(s, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("ConnectedUnions", () => connectedunions()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_UNIONS")

///|
/// `CONNECTED_UNIONS`
pub fn connected_unions() -> @kernel.Thm {
  connected_unions_c.get()
}

///|
/// CONNECTED_UNION
fn step_653() -> Unit raise {
  connected_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, connected(s) && connected(t) && !(INTER(s, t) == {}) → connected(UNION(s, t))",
    @readable.steps(
      [
        @readable.intro_tac("forall s t"),
        @readable.have(
          "SUBSET(s, topspace(euclidean)) && SUBSET(t, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("ConnectedUnion", () => connectedunion()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_UNION")

///|
/// `CONNECTED_UNION`
pub fn connected_union() -> @kernel.Thm {
  connected_union_c.get()
}

///|
/// CONNECTED_DIFF_OPEN_FROM_CLOSED
fn step_654() -> Unit raise {
  connected_diff_open_from_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ u : (Cart[Real, _]) -> Bool, SUBSET(s, t) && SUBSET(t, u) && open(s) && closed(t) && connected(u) && connected(DIFF(t, s)) → connected(DIFF(u, s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm(
          "ConnectedDiffOpenFromClosed",
          () => connecteddiffopenfromclosed(),
        ),
      ],
    ),
  ))
}

///|
let connected_diff_open_from_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_DIFF_OPEN_FROM_CLOSED")

///|
/// `CONNECTED_DIFF_OPEN_FROM_CLOSED`
pub fn connected_diff_open_from_closed() -> @kernel.Thm {
  connected_diff_open_from_closed_c.get()
}

///|
/// CONNECTED_DISJOINT_UNIONS_OPEN_UNIQUE
fn step_656() -> Unit raise {
  connected_disjoint_unions_open_unique_c.set(@readable.prove(
    "∀ f : ((Cart[Real, _]) -> Bool) -> Bool, ∀ f' : ((Cart[Real, _]) -> Bool) -> Bool, pairwise(DISJOINT, f) && pairwise(DISJOINT, f') && (∀ s : (Cart[Real, _]) -> Bool, IN(s, f) → open(s) && connected(s) && !(s == {})) && (∀ s : (Cart[Real, _]) -> Bool, IN(s, f') → open(s) && connected(s) && !(s == {})) && UNIONS(f) == UNIONS(f') → f == f'",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm(
          "ConnectedDisjointUnionsOpenUnique",
          () => connecteddisjointunionsopenunique(),
        ),
      ],
    ),
  ))
}

///|
let connected_disjoint_unions_open_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_DISJOINT_UNIONS_OPEN_UNIQUE")

///|
/// `CONNECTED_DISJOINT_UNIONS_OPEN_UNIQUE`
pub fn connected_disjoint_unions_open_unique() -> @kernel.Thm {
  connected_disjoint_unions_open_unique_c.get()
}

///|
/// CONNECTED_FROM_CLOSED_UNION_AND_INTER
fn step_658() -> Unit raise {
  connected_from_closed_union_and_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && closed(t) && connected(UNION(s, t)) && connected(INTER(s, t)) → connected(s) && connected(t)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t"),
        @readable.have(
          "SUBSET(UNION(s, t), topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("CLOSED_IN", () => closed_in_v1()),
            @readable.Thm(
              "ConnectedFromClosedUnionAndInter",
              () => connectedfromclosedunionandinter(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_from_closed_union_and_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_FROM_CLOSED_UNION_AND_INTER")

///|
/// `CONNECTED_FROM_CLOSED_UNION_AND_INTER`
pub fn connected_from_closed_union_and_inter() -> @kernel.Thm {
  connected_from_closed_union_and_inter_c.get()
}

///|
/// CONNECTED_FROM_OPEN_UNION_AND_INTER
fn step_660() -> Unit raise {
  connected_from_open_union_and_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && open(t) && connected(UNION(s, t)) && connected(INTER(s, t)) → connected(s) && connected(t)",
    @readable.steps(
      [
        @readable.intro_tac("forall s t"),
        @readable.have(
          "SUBSET(UNION(s, t), topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Prev,
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("OPEN_IN", () => open_in()),
            @readable.Thm(
              "ConnectedFromOpenUnionAndInter",
              () => connectedfromopenunionandinter(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_from_open_union_and_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_FROM_OPEN_UNION_AND_INTER")

///|
/// `CONNECTED_FROM_OPEN_UNION_AND_INTER`
pub fn connected_from_open_union_and_inter() -> @kernel.Thm {
  connected_from_open_union_and_inter_c.get()
}

///|
/// CONNECTED_INDUCTION
fn step_662() -> Unit raise {
  connected_induction_c.set(@readable.prove(
    "∀ P : (Cart[Real, _]) -> Bool, ∀ Q : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, connected(s) && (∀ t : (Cart[Real, _]) -> Bool, ∀ a : Cart[Real, _], open_in(subtopology(euclidean, s), t) && IN(a, t) → (∃ z : Cart[Real, _], IN(z, t) && P(z))) && (∀ a : Cart[Real, _], IN(a, s) → (∃ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && IN(a, t) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], IN(x, t) && IN(y, t) && P(x) && P(y) && Q(x) → Q(y)))) → (∀ a : Cart[Real, _], ∀ b : Cart[Real, _], IN(a, s) && IN(b, s) && P(a) && P(b) && Q(a) → Q(b))",
    @readable.steps(
      [
        @readable.intro_tac("forall P Q s"),
        @readable.have(
          "SUBSET(s, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("ConnectedInduction", () => connectedinduction()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_INDUCTION")

///|
/// `CONNECTED_INDUCTION`
pub fn connected_induction() -> @kernel.Thm {
  connected_induction_c.get()
}

///|
/// CONNECTED_EQUIVALENCE_RELATION_GEN_LEMMA
fn step_663() -> Unit raise {
  connected_equivalence_relation_gen_lemma_c.set(@readable.prove(
    "∀ P : (Cart[Real, _]) -> Bool, ∀ R : (Cart[Real, _], Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, connected(s) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ z : Cart[Real, _], R(x, y) && R(y, z) → R(x, z)) && (∀ t : (Cart[Real, _]) -> Bool, ∀ a : Cart[Real, _], open_in(subtopology(euclidean, s), t) && IN(a, t) → (∃ z : Cart[Real, _], IN(z, t) && P(z))) && (∀ a : Cart[Real, _], IN(a, s) → (∃ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && IN(a, t) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], IN(x, t) && IN(y, t) && P(x) && P(y) → R(x, y)))) → (∀ a : Cart[Real, _], ∀ b : Cart[Real, _], IN(a, s) && IN(b, s) && P(a) && P(b) → R(a, b))",
    @readable.steps(
      [
        @readable.intro_tac("forall P R s"),
        @readable.have(
          "SUBSET(s, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm(
              "ConnectedEquivalenceRelationGen",
              () => connectedequivalencerelationgen(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_equivalence_relation_gen_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_EQUIVALENCE_RELATION_GEN_LEMMA")

///|
/// `CONNECTED_EQUIVALENCE_RELATION_GEN_LEMMA`
pub fn connected_equivalence_relation_gen_lemma() -> @kernel.Thm {
  connected_equivalence_relation_gen_lemma_c.get()
}

///|
/// CONNECTED_EQUIVALENCE_RELATION_GEN
fn step_665() -> Unit raise {
  connected_equivalence_relation_gen_c.set(@readable.prove(
    "∀ P : (Cart[Real, _]) -> Bool, ∀ R : (Cart[Real, _], Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, connected(s) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], R(x, y) → R(y, x)) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ z : Cart[Real, _], R(x, y) && R(y, z) → R(x, z)) && (∀ t : (Cart[Real, _]) -> Bool, ∀ a : Cart[Real, _], open_in(subtopology(euclidean, s), t) && IN(a, t) → (∃ z : Cart[Real, _], IN(z, t) && P(z))) && (∀ a : Cart[Real, _], IN(a, s) → (∃ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && IN(a, t) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], IN(x, t) && IN(y, t) && P(x) && P(y) → R(x, y)))) → (∀ a : Cart[Real, _], ∀ b : Cart[Real, _], IN(a, s) && IN(b, s) && P(a) && P(b) → R(a, b))",
    @readable.steps(
      [
        @readable.intro_tac("forall P R s"),
        @readable.by_thm(
          th => @tactics.mp_tac(th),
          @readable.TermsRule(
            tms => th => @bool.ispecl(tms, th),
            ["P", "R", "s"],
            @readable.Thm(
              "CONNECTED_EQUIVALENCE_RELATION_GEN_LEMMA",
              () => connected_equivalence_relation_gen_lemma(),
            ),
          ),
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let connected_equivalence_relation_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_EQUIVALENCE_RELATION_GEN")

///|
/// `CONNECTED_EQUIVALENCE_RELATION_GEN`
pub fn connected_equivalence_relation_gen() -> @kernel.Thm {
  connected_equivalence_relation_gen_c.get()
}

///|
/// CONNECTED_INDUCTION_SIMPLE
fn step_667() -> Unit raise {
  connected_induction_simple_c.set(@readable.prove(
    "∀ P : (Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, connected(s) && (∀ a : Cart[Real, _], IN(a, s) → (∃ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && IN(a, t) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], IN(x, t) && IN(y, t) && P(x) → P(y)))) → (∀ a : Cart[Real, _], ∀ b : Cart[Real, _], IN(a, s) && IN(b, s) && P(a) → P(b))",
    @readable.steps(
      [
        @readable.intro_tac("forall P s"),
        @readable.have(
          "SUBSET(s, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm("ConnectedInductionSimple", () => connectedinductionsimple()),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_induction_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_INDUCTION_SIMPLE")

///|
/// `CONNECTED_INDUCTION_SIMPLE`
pub fn connected_induction_simple() -> @kernel.Thm {
  connected_induction_simple_c.get()
}

///|
/// CONNECTED_EQUIVALENCE_RELATION
fn step_668() -> Unit raise {
  connected_equivalence_relation_c.set(@readable.prove(
    "∀ R : (Cart[Real, _], Cart[Real, _]) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, connected(s) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], R(x, y) → R(y, x)) && (∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ z : Cart[Real, _], R(x, y) && R(y, z) → R(x, z)) && (∀ a : Cart[Real, _], IN(a, s) → (∃ t : (Cart[Real, _]) -> Bool, open_in(subtopology(euclidean, s), t) && IN(a, t) && (∀ x : Cart[Real, _], IN(x, t) → R(a, x)))) → (∀ a : Cart[Real, _], ∀ b : Cart[Real, _], IN(a, s) && IN(b, s) → R(a, b))",
    @readable.steps(
      [
        @readable.intro_tac("forall R s"),
        @readable.have(
          "SUBSET(s, topspace(euclidean))",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ],
          ),
        ),
        @readable.by_thm(th => @tactics.mp_tac(th), @readable.Prev),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("connected_DEF", () => connected_def_v1()),
            @readable.Thm(
              "ConnectedEquivalenceRelation",
              () => connectedequivalencerelation(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let connected_equivalence_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_EQUIVALENCE_RELATION")

///|
/// `CONNECTED_EQUIVALENCE_RELATION`
pub fn connected_equivalence_relation() -> @kernel.Thm {
  connected_equivalence_relation_c.get()
}

///|
/// RichterHilbertAxiomGeometry/Topology.ml:3055
fn step_670() -> Unit raise {
  @printer.parse_as_infix("limit_point_of", (12L, "right"))
}

///|
/// limit_point_of_DEF
fn step_671() -> Unit raise {
  limit_point_of_def_c.set(@readable.newdefinition("(limit_point_of : (Cart[Real, _], (Cart[Real, _]) -> Bool) -> Bool)((x : Cart[Real, _]), (s : (Cart[Real, _]) -> Bool)) == IN(x, LimitPointOf(euclidean, s))"))
}

///|
let limit_point_of_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("limit_point_of_DEF")

///|
/// `limit_point_of_DEF`
pub fn limit_point_of_def() -> @kernel.Thm {
  limit_point_of_def_c.get()
}

///|
/// limit_point_of
fn step_672() -> Unit raise {
  limit_point_of_c.set(@readable.prove(
    "limit_point_of((x : Cart[Real, _]), (s : (Cart[Real, _]) -> Bool)) == (∀ t : (Cart[Real, _]) -> Bool, IN(x, t) && open(t) → (∃ y : Cart[Real, _], !(y == x) && IN(y, s) && IN(y, t)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("IN_LimitPointOf", () => in_limitpointof()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("OPEN_IN", () => open_in()),
      ],
    ),
  ))
}

///|
let limit_point_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("limit_point_of")

///|
/// `limit_point_of`
pub fn limit_point_of() -> @kernel.Thm {
  limit_point_of_c.get()
}

///|
/// LIMPT_SUBSET
fn step_674() -> Unit raise {
  limpt_subset_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, limit_point_of(x, s) && SUBSET(s, t) → limit_point_of(x, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("LimptSubset", () => limptsubset()),
        @readable.Thm("SUBSET", () => @sets.subset()),
      ],
    ),
  ))
}

///|
let limpt_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIMPT_SUBSET")

///|
/// `LIMPT_SUBSET`
pub fn limpt_subset() -> @kernel.Thm {
  limpt_subset_c.get()
}

///|
/// CLOSED_LIMPT
fn step_675() -> Unit raise {
  closed_limpt_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(s) == (∀ x : Cart[Real, _], limit_point_of(x, s) → IN(x, s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosedLimpt", () => closedlimpt()),
        @readable.Thm("SUBSET", () => @sets.subset()),
      ],
    ),
  ))
}

///|
let closed_limpt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_LIMPT")

///|
/// `CLOSED_LIMPT`
pub fn closed_limpt() -> @kernel.Thm {
  closed_limpt_c.get()
}

///|
/// LIMPT_EMPTY
fn step_676() -> Unit raise {
  limpt_empty_c.set(@readable.prove(
    "∀ x : Cart[Real, _], !limit_point_of(x, {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Rule(@equal.gsym, @readable.Thm("NOTIN", () => notin())),
        @readable.Thm("LimptEmpty", () => limptempty()),
      ],
    ),
  ))
}

///|
let limpt_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIMPT_EMPTY")

///|
/// `LIMPT_EMPTY`
pub fn limpt_empty() -> @kernel.Thm {
  limpt_empty_c.get()
}

///|
/// NO_LIMIT_POINT_IMP_CLOSED
fn step_678() -> Unit raise {
  no_limit_point_imp_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, !(∃ x : Cart[Real, _], limit_point_of(x, s)) → closed(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("NoLimitPointImpClosed", () => nolimitpointimpclosed()),
        @readable.Thm("NOT_EXISTS_THM", () => @class.not_exists_thm()),
        @readable.Thm("NOTIN", () => notin()),
      ],
    ),
  ))
}

///|
let no_limit_point_imp_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NO_LIMIT_POINT_IMP_CLOSED")

///|
/// `NO_LIMIT_POINT_IMP_CLOSED`
pub fn no_limit_point_imp_closed() -> @kernel.Thm {
  no_limit_point_imp_closed_c.get()
}

///|
/// LIMIT_POINT_UNION
fn step_680() -> Unit raise {
  limit_point_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, ∀ x : Cart[Real, _], limit_point_of(x, UNION(s, t)) == (limit_point_of(x, s) || limit_point_of(x, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("LimitPointUnion", () => limitpointunion()),
        @readable.Thm("EXTENSION", () => @sets.extension()),
        @readable.Thm("IN_UNION", () => @sets.in_union()),
      ],
    ),
  ))
}

///|
let limit_point_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIMIT_POINT_UNION")

///|
/// `LIMIT_POINT_UNION`
pub fn limit_point_union() -> @kernel.Thm {
  limit_point_union_c.get()
}

///|
/// LimitPointOf_euclidean
fn step_681() -> Unit raise {
  limitpointof_euclidean_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, LimitPointOf(euclidean, s) == {(x : Cart[Real, _]) | limit_point_of(x, s)}",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("IN_UNIV", () => @sets.in_univ()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("LimitPointOf", () => limitpointof()),
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
        @readable.Thm("EXTENSION", () => @sets.extension()),
      ],
    ),
  ))
}

///|
let limitpointof_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LimitPointOf_euclidean")

///|
/// `LimitPointOf_euclidean`
pub fn limitpointof_euclidean() -> @kernel.Thm {
  limitpointof_euclidean_c.get()
}

///|
/// interior_DEF
fn step_682() -> Unit raise {
  interior_def_v1_c.set(@readable.newdefinition("(interior : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == Interior(euclidean)"))
}

///|
let interior_def_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interior_DEF")

///|
/// `interior_DEF`
pub fn interior_def_v1() -> @kernel.Thm {
  interior_def_v1_c.get()
}

///|
/// interior
fn step_683() -> Unit raise {
  interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(s) == {(x : Cart[Real, _]) | ∃ t : (Cart[Real, _]) -> Bool, open(t) && IN(x, t) && SUBSET(t, s)}",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("Interior_DEF", () => interior_def()),
        @readable.Thm("OPEN_IN", () => open_in()),
      ],
    ),
  ))
}

///|
let interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interior")

///|
/// `interior`
pub fn interior() -> @kernel.Thm {
  interior_c.get()
}

///|
/// INTERIOR_EQ
fn step_685() -> Unit raise {
  interior_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (interior(s) == s) == open(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorEq", () => interioreq()),
        @readable.Thm("EQ_SYM_EQ", () => @theorems.eq_sym_eq()),
      ],
    ),
  ))
}

///|
let interior_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_EQ")

///|
/// `INTERIOR_EQ`
pub fn interior_eq() -> @kernel.Thm {
  interior_eq_c.get()
}

///|
/// INTERIOR_OPEN
fn step_686() -> Unit raise {
  interior_open_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) → interior(s) == s",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorOpen", () => interioropen()),
      ],
    ),
  ))
}

///|
let interior_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_OPEN")

///|
/// `INTERIOR_OPEN`
pub fn interior_open() -> @kernel.Thm {
  interior_open_c.get()
}

///|
/// INTERIOR_EMPTY
fn step_687() -> Unit raise {
  interior_empty_c.set(@readable.prove(
    "(interior : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)(({} : (Cart[Real, _]) -> Bool)) == ({} : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorEmpty", () => interiorempty()),
      ],
    ),
  ))
}

///|
let interior_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_EMPTY")

///|
/// `INTERIOR_EMPTY`
pub fn interior_empty() -> @kernel.Thm {
  interior_empty_c.get()
}

///|
/// INTERIOR_UNIV
fn step_689() -> Unit raise {
  interior_univ_c.set(@readable.prove(
    "(interior : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)((UNIV : (Cart[Real, _]) -> Bool)) == (UNIV : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("InteriorUniv", () => interioruniv()),
      ],
    ),
  ))
}

///|
let interior_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_UNIV")

///|
/// `INTERIOR_UNIV`
pub fn interior_univ() -> @kernel.Thm {
  interior_univ_c.get()
}

///|
/// OPEN_INTERIOR
fn step_690() -> Unit raise {
  open_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(interior(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenInterior", () => openinterior()),
      ],
    ),
  ))
}

///|
let open_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_INTERIOR")

///|
/// `OPEN_INTERIOR`
pub fn open_interior() -> @kernel.Thm {
  open_interior_c.get()
}

///|
/// INTERIOR_INTERIOR
fn step_691() -> Unit raise {
  interior_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(interior(s)) == interior(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorInterior", () => interiorinterior()),
      ],
    ),
  ))
}

///|
let interior_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_INTERIOR")

///|
/// `INTERIOR_INTERIOR`
pub fn interior_interior() -> @kernel.Thm {
  interior_interior_c.get()
}

///|
/// INTERIOR_SUBSET
fn step_692() -> Unit raise {
  interior_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(interior(s), s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorSubset", () => interiorsubset()),
      ],
    ),
  ))
}

///|
let interior_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_SUBSET")

///|
/// `INTERIOR_SUBSET`
pub fn interior_subset() -> @kernel.Thm {
  interior_subset_c.get()
}

///|
/// SUBSET_INTERIOR
fn step_693() -> Unit raise {
  subset_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) → SUBSET(interior(s), interior(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("SubsetInterior", () => subsetinterior()),
      ],
    ),
  ))
}

///|
let subset_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_INTERIOR")

///|
/// `SUBSET_INTERIOR`
pub fn subset_interior() -> @kernel.Thm {
  subset_interior_c.get()
}

///|
/// INTERIOR_MAXIMAL
fn step_694() -> Unit raise {
  interior_maximal_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(t, s) && open(t) → SUBSET(t, interior(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorMaximal", () => interiormaximal()),
      ],
    ),
  ))
}

///|
let interior_maximal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_MAXIMAL")

///|
/// `INTERIOR_MAXIMAL`
pub fn interior_maximal() -> @kernel.Thm {
  interior_maximal_c.get()
}

///|
/// INTERIOR_MAXIMAL_EQ
fn step_695() -> Unit raise {
  interior_maximal_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) → SUBSET(s, interior(t)) == SUBSET(s, t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorMaximalEq", () => interiormaximaleq()),
      ],
    ),
  ))
}

///|
let interior_maximal_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_MAXIMAL_EQ")

///|
/// `INTERIOR_MAXIMAL_EQ`
pub fn interior_maximal_eq() -> @kernel.Thm {
  interior_maximal_eq_c.get()
}

///|
/// INTERIOR_UNIQUE
fn step_697() -> Unit raise {
  interior_unique_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(t, s) && open(t) && (∀ t' : (Cart[Real, _]) -> Bool, SUBSET(t', s) && open(t') → SUBSET(t', t)) → interior(s) == t",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorUnique", () => interiorunique()),
      ],
    ),
  ))
}

///|
let interior_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_UNIQUE")

///|
/// `INTERIOR_UNIQUE`
pub fn interior_unique() -> @kernel.Thm {
  interior_unique_c.get()
}

///|
/// IN_INTERIOR
fn step_698() -> Unit raise {
  in_interior_v1_c.set(@readable.prove(
    "∀ x : Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, IN(x, interior(s)) == (∃ e : Real, real_of_num(0) < e && SUBSET(ball((x, e)), s))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
            @readable.Thm("IN_Interior", () => in_interior()),
            @readable.Rule(@equal.gsym, @readable.Thm("OPEN_IN", () => open_in())),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("OPEN_CONTAINS_BALL", () => open_contains_ball()),
            @readable.Thm("SUBSET_TRANS", () => @sets.subset_trans()),
            @readable.Thm("CENTRE_IN_BALL", () => centre_in_ball()),
            @readable.Thm("OPEN_BALL", () => open_ball()),
          ],
        ),
      ],
    ),
  ))
}

///|
let in_interior_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_INTERIOR")

///|
/// `IN_INTERIOR`
pub fn in_interior_v1() -> @kernel.Thm {
  in_interior_v1_c.get()
}

///|
/// OPEN_SUBSET_INTERIOR
fn step_699() -> Unit raise {
  open_subset_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) → SUBSET(s, interior(t)) == SUBSET(s, t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("OpenSubsetInterior", () => opensubsetinterior()),
      ],
    ),
  ))
}

///|
let open_subset_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_SUBSET_INTERIOR")

///|
/// `OPEN_SUBSET_INTERIOR`
pub fn open_subset_interior() -> @kernel.Thm {
  open_subset_interior_c.get()
}

///|
/// INTERIOR_INTER
fn step_700() -> Unit raise {
  interior_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, interior(INTER(s, t)) == INTER(interior(s), interior(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("InteriorInter", () => interiorinter()),
      ],
    ),
  ))
}

///|
let interior_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_INTER")

///|
/// `INTERIOR_INTER`
pub fn interior_inter() -> @kernel.Thm {
  interior_inter_c.get()
}

///|
/// INTERIOR_FINITE_INTERS
fn step_701() -> Unit raise {
  interior_finite_inters_v1_c.set(@readable.prove(
    "∀ s : ((Cart[Real, _]) -> Bool) -> Bool, FINITE(s) → interior(INTERS(s)) == INTERS(IMAGE(interior, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall s, H1"),
        @readable.assuming(
          "!(s == {})",
          "sNonempty",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("INTERS_0", () => @sets.inters_0()),
              @readable.Thm("IMAGE_CLAUSES", () => @sets.image_clauses()),
              @readable.Thm("INTERIOR_UNIV", () => interior_univ()),
            ],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Label("H1"),
            @readable.Label("sNonempty"),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
            @readable.Thm("InteriorFiniteInters", () => interiorfiniteinters()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interior_finite_inters_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_FINITE_INTERS")

///|
/// `INTERIOR_FINITE_INTERS`
pub fn interior_finite_inters_v1() -> @kernel.Thm {
  interior_finite_inters_v1_c.get()
}

///|
/// INTERIOR_FINITE_INTERS
fn step_704() -> Unit raise {
  interior_finite_inters_c.set(@readable.prove(
    "∀ s : ((Cart[Real, _]) -> Bool) -> Bool, FINITE(s) → interior(INTERS(s)) == INTERS(IMAGE(interior, s))",
    @readable.steps(
      [
        @readable.intro_tac("forall s, H1"),
        @readable.assuming(
          "s == {}",
          "sEmpty",
          @readable.by(
            @readable.simplify,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
              @readable.Label("H1"),
              @readable.Thm("interior_DEF", () => interior_def_v1()),
              @readable.Thm("InteriorFiniteInters", () => interiorfiniteinters()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("INTERS_0", () => @sets.inters_0()),
            @readable.Thm("IMAGE_CLAUSES", () => @sets.image_clauses()),
            @readable.Label("sEmpty"),
            @readable.Thm("INTERIOR_UNIV", () => interior_univ()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interior_finite_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_FINITE_INTERS")

///|
/// `INTERIOR_FINITE_INTERS`
pub fn interior_finite_inters() -> @kernel.Thm {
  interior_finite_inters_c.get()
}

///|
/// INTERIOR_INTERS_SUBSET
fn step_705() -> Unit raise {
  interior_inters_subset_c.set(@readable.prove(
    "∀ f : ((Cart[Real, _]) -> Bool) -> Bool, SUBSET(interior(INTERS(f)), INTERS(IMAGE(interior, f)))",
    @readable.steps(
      [
        @readable.intro_tac("forall f"),
        @readable.assuming(
          "f == {}",
          "fEmpty",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
              @readable.Thm("interior_DEF", () => interior_def_v1()),
              @readable.Thm("InteriorIntersSubset", () => interiorinterssubset()),
            ],
          ),
        ),
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("INTERS_0", () => @sets.inters_0()),
            @readable.Thm("IMAGE_CLAUSES", () => @sets.image_clauses()),
            @readable.Prev,
            @readable.Thm("INTERIOR_UNIV", () => interior_univ()),
            @readable.Thm("SUBSET_REFL", () => @sets.subset_refl()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interior_inters_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_INTERS_SUBSET")

///|
/// `INTERIOR_INTERS_SUBSET`
pub fn interior_inters_subset() -> @kernel.Thm {
  interior_inters_subset_c.get()
}

///|
/// UNION_INTERIOR_SUBSET
fn step_707() -> Unit raise {
  union_interior_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(UNION(interior(s), interior(t)), interior(UNION(s, t)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("UnionInteriorSubset", () => unioninteriorsubset()),
      ],
    ),
  ))
}

///|
let union_interior_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_INTERIOR_SUBSET")

///|
/// `UNION_INTERIOR_SUBSET`
pub fn union_interior_subset() -> @kernel.Thm {
  union_interior_subset_c.get()
}

///|
/// INTERIOR_EQ_EMPTY
fn step_709() -> Unit raise {
  interior_eq_empty_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (interior(s) == {}) == (∀ t : (Cart[Real, _]) -> Bool, open(t) && SUBSET(t, s) → t == {})",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorEqEmpty", () => interioreqempty()),
      ],
    ),
  ))
}

///|
let interior_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_EQ_EMPTY")

///|
/// `INTERIOR_EQ_EMPTY`
pub fn interior_eq_empty() -> @kernel.Thm {
  interior_eq_empty_c.get()
}

///|
/// INTERIOR_EQ_EMPTY_ALT
fn step_710() -> Unit raise {
  interior_eq_empty_alt_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (interior(s) == {}) == (∀ t : (Cart[Real, _]) -> Bool, open(t) && !(t == {}) → !(DIFF(t, s) == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorEqEmptyAlt", () => interioreqemptyalt()),
      ],
    ),
  ))
}

///|
let interior_eq_empty_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_EQ_EMPTY_ALT")

///|
/// `INTERIOR_EQ_EMPTY_ALT`
pub fn interior_eq_empty_alt() -> @kernel.Thm {
  interior_eq_empty_alt_c.get()
}

///|
/// INTERIOR_UNIONS_OPEN_SUBSETS
fn step_711() -> Unit raise {
  interior_unions_open_subsets_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, UNIONS({(t : (Cart[Real, _]) -> Bool) | open(t) && SUBSET(t, s)}) == interior(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorUnionsOpenSubsets", () => interiorunionsopensubsets()),
      ],
    ),
  ))
}

///|
let interior_unions_open_subsets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_UNIONS_OPEN_SUBSETS")

///|
/// `INTERIOR_UNIONS_OPEN_SUBSETS`
pub fn interior_unions_open_subsets() -> @kernel.Thm {
  interior_unions_open_subsets_c.get()
}

///|
/// closure_DEF
fn step_713() -> Unit raise {
  closure_def_v1_c.set(@readable.newdefinition("(closure : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == Closure(euclidean)"))
}

///|
let closure_def_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("closure_DEF")

///|
/// `closure_DEF`
pub fn closure_def_v1() -> @kernel.Thm {
  closure_def_v1_c.get()
}

///|
/// closure
fn step_714() -> Unit raise {
  closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(s) == UNION(s, {(x : Cart[Real, _]) | limit_point_of(x, s)})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("LimitPointOf_euclidean", () => limitpointof_euclidean()),
        @readable.Thm("Closure_THM", () => closure_thm()),
      ],
    ),
  ))
}

///|
let closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("closure")

///|
/// `closure`
pub fn closure() -> @kernel.Thm {
  closure_c.get()
}

///|
/// CLOSURE_INTERIOR
fn step_717() -> Unit raise {
  closure_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(s) == DIFF(UNIV, interior(DIFF(UNIV, s)))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("closure_DEF", () => closure_def_v1()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("ClosureInterior", () => closureinterior()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closure_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_INTERIOR")

///|
/// `CLOSURE_INTERIOR`
pub fn closure_interior() -> @kernel.Thm {
  closure_interior_c.get()
}

///|
/// INTERIOR_CLOSURE
fn step_718() -> Unit raise {
  interior_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(s) == DIFF(UNIV, closure(DIFF(UNIV, s)))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("closure_DEF", () => closure_def_v1()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("InteriorClosure", () => interiorclosure()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interior_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CLOSURE")

///|
/// `INTERIOR_CLOSURE`
pub fn interior_closure() -> @kernel.Thm {
  interior_closure_c.get()
}

///|
/// CLOSED_CLOSURE
fn step_719() -> Unit raise {
  closed_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(closure(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosedClosure", () => closedclosure()),
      ],
    ),
  ))
}

///|
let closed_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_CLOSURE")

///|
/// `CLOSED_CLOSURE`
pub fn closed_closure() -> @kernel.Thm {
  closed_closure_c.get()
}

///|
/// CLOSURE_SUBSET
fn step_720() -> Unit raise {
  closure_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(s, closure(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureSubset", () => closuresubset()),
      ],
    ),
  ))
}

///|
let closure_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_SUBSET")

///|
/// `CLOSURE_SUBSET`
pub fn closure_subset() -> @kernel.Thm {
  closure_subset_c.get()
}

///|
/// SUBSET_CLOSURE
fn step_721() -> Unit raise {
  subset_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) → SUBSET(closure(s), closure(t))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("SubsetClosure", () => subsetclosure()),
      ],
    ),
  ))
}

///|
let subset_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_CLOSURE")

///|
/// `SUBSET_CLOSURE`
pub fn subset_closure() -> @kernel.Thm {
  subset_closure_c.get()
}

///|
/// CLOSURE_HULL
fn step_722() -> Unit raise {
  closure_hull_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(s) == hull(closed, s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureHull", () => closurehull()),
      ],
    ),
  ))
}

///|
let closure_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_HULL")

///|
/// `CLOSURE_HULL`
pub fn closure_hull() -> @kernel.Thm {
  closure_hull_c.get()
}

///|
/// CLOSURE_EQ
fn step_723() -> Unit raise {
  closure_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (closure(s) == s) == closed(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureEq", () => closureeq()),
      ],
    ),
  ))
}

///|
let closure_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_EQ")

///|
/// `CLOSURE_EQ`
pub fn closure_eq() -> @kernel.Thm {
  closure_eq_c.get()
}

///|
/// CLOSURE_CLOSED
fn step_724() -> Unit raise {
  closure_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(s) → closure(s) == s",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureClosed", () => closureclosed()),
      ],
    ),
  ))
}

///|
let closure_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_CLOSED")

///|
/// `CLOSURE_CLOSED`
pub fn closure_closed() -> @kernel.Thm {
  closure_closed_c.get()
}

///|
/// CLOSURE_CLOSURE
fn step_725() -> Unit raise {
  closure_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(closure(s)) == closure(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureClosure", () => closureclosure()),
      ],
    ),
  ))
}

///|
let closure_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_CLOSURE")

///|
/// `CLOSURE_CLOSURE`
pub fn closure_closure() -> @kernel.Thm {
  closure_closure_c.get()
}

///|
/// CLOSURE_UNION
fn step_726() -> Unit raise {
  closure_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closure(UNION(s, t)) == UNION(closure(s), closure(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureUnion", () => closureunion()),
      ],
    ),
  ))
}

///|
let closure_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_UNION")

///|
/// `CLOSURE_UNION`
pub fn closure_union() -> @kernel.Thm {
  closure_union_c.get()
}

///|
/// CLOSURE_INTER_SUBSET
fn step_727() -> Unit raise {
  closure_inter_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(closure(INTER(s, t)), INTER(closure(s), closure(t)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureInterSubset", () => closureintersubset()),
      ],
    ),
  ))
}

///|
let closure_inter_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_INTER_SUBSET")

///|
/// `CLOSURE_INTER_SUBSET`
pub fn closure_inter_subset() -> @kernel.Thm {
  closure_inter_subset_c.get()
}

///|
/// CLOSURE_INTERS_SUBSET
fn step_728() -> Unit raise {
  closure_inters_subset_c.set(@readable.prove(
    "∀ f : ((Cart[Real, _]) -> Bool) -> Bool, SUBSET(closure(INTERS(f)), INTERS(IMAGE(closure, f)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureIntersSubset", () => closureinterssubset()),
      ],
    ),
  ))
}

///|
let closure_inters_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_INTERS_SUBSET")

///|
/// `CLOSURE_INTERS_SUBSET`
pub fn closure_inters_subset() -> @kernel.Thm {
  closure_inters_subset_c.get()
}

///|
/// CLOSURE_MINIMAL
fn step_730() -> Unit raise {
  closure_minimal_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) && closed(t) → SUBSET(closure(s), t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureMinimal", () => closureminimal()),
      ],
    ),
  ))
}

///|
let closure_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_MINIMAL")

///|
/// `CLOSURE_MINIMAL`
pub fn closure_minimal() -> @kernel.Thm {
  closure_minimal_c.get()
}

///|
/// CLOSURE_MINIMAL_EQ
fn step_731() -> Unit raise {
  closure_minimal_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(t) → SUBSET(closure(s), t) == SUBSET(s, t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureMinimalEq", () => closureminimaleq()),
      ],
    ),
  ))
}

///|
let closure_minimal_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_MINIMAL_EQ")

///|
/// `CLOSURE_MINIMAL_EQ`
pub fn closure_minimal_eq() -> @kernel.Thm {
  closure_minimal_eq_c.get()
}

///|
/// CLOSURE_UNIQUE
fn step_733() -> Unit raise {
  closure_unique_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(s, t) && closed(t) && (∀ t' : (Cart[Real, _]) -> Bool, SUBSET(s, t') && closed(t') → SUBSET(t, t')) → closure(s) == t",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureUnique", () => closureunique()),
      ],
    ),
  ))
}

///|
let closure_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_UNIQUE")

///|
/// `CLOSURE_UNIQUE`
pub fn closure_unique() -> @kernel.Thm {
  closure_unique_c.get()
}

///|
/// CLOSURE_EMPTY
fn step_735() -> Unit raise {
  closure_empty_c.set(@readable.prove(
    "(closure : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)(({} : (Cart[Real, _]) -> Bool)) == ({} : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureEmpty", () => closureempty()),
      ],
    ),
  ))
}

///|
let closure_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_EMPTY")

///|
/// `CLOSURE_EMPTY`
pub fn closure_empty() -> @kernel.Thm {
  closure_empty_c.get()
}

///|
/// CLOSURE_UNIV
fn step_736() -> Unit raise {
  closure_univ_c.set(@readable.prove(
    "(closure : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)((UNIV : (Cart[Real, _]) -> Bool)) == (UNIV : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureUniv", () => closureuniv()),
      ],
    ),
  ))
}

///|
let closure_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_UNIV")

///|
/// `CLOSURE_UNIV`
pub fn closure_univ() -> @kernel.Thm {
  closure_univ_c.get()
}

///|
/// CLOSURE_UNIONS
fn step_737() -> Unit raise {
  closure_unions_c.set(@readable.prove(
    "∀ f : ((Cart[Real, _]) -> Bool) -> Bool, FINITE(f) → closure(UNIONS(f)) == UNIONS({closure((s : (Cart[Real, _]) -> Bool)) | IN(s, f)})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureUnions", () => closureunions()),
      ],
    ),
  ))
}

///|
let closure_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_UNIONS")

///|
/// `CLOSURE_UNIONS`
pub fn closure_unions() -> @kernel.Thm {
  closure_unions_c.get()
}

///|
/// CLOSURE_EQ_EMPTY
fn step_739() -> Unit raise {
  closure_eq_empty_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (closure(s) == {}) == (s == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("ClosureEqEmpty", () => closureeqempty()),
      ],
    ),
  ))
}

///|
let closure_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_EQ_EMPTY")

///|
/// `CLOSURE_EQ_EMPTY`
pub fn closure_eq_empty() -> @kernel.Thm {
  closure_eq_empty_c.get()
}

///|
/// CLOSURE_SUBSET_EQ
fn step_741() -> Unit raise {
  closure_subset_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(closure(s), s) == closed(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosureSubsetEq", () => closuresubseteq()),
      ],
    ),
  ))
}

///|
let closure_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_SUBSET_EQ")

///|
/// `CLOSURE_SUBSET_EQ`
pub fn closure_subset_eq() -> @kernel.Thm {
  closure_subset_eq_c.get()
}

///|
/// OPEN_INTER_CLOSURE_EQ_EMPTY
fn step_742() -> Unit raise {
  open_inter_closure_eq_empty_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) → (INTER(s, closure(t)) == {}) == (INTER(s, t) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenInterClosureEqEmpty", () => openinterclosureeqempty()),
      ],
    ),
  ))
}

///|
let open_inter_closure_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_INTER_CLOSURE_EQ_EMPTY")

///|
/// `OPEN_INTER_CLOSURE_EQ_EMPTY`
pub fn open_inter_closure_eq_empty() -> @kernel.Thm {
  open_inter_closure_eq_empty_c.get()
}

///|
/// OPEN_INTER_CLOSURE_SUBSET
fn step_743() -> Unit raise {
  open_inter_closure_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) → SUBSET(INTER(s, closure(t)), closure(INTER(s, t)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("OpenInterClosureSubset", () => openinterclosuresubset()),
      ],
    ),
  ))
}

///|
let open_inter_closure_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_INTER_CLOSURE_SUBSET")

///|
/// `OPEN_INTER_CLOSURE_SUBSET`
pub fn open_inter_closure_subset() -> @kernel.Thm {
  open_inter_closure_subset_c.get()
}

///|
/// CLOSURE_OPEN_INTER_SUPERSET
fn step_744() -> Unit raise {
  closure_open_inter_superset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && SUBSET(s, closure(t)) → closure(INTER(s, t)) == closure(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("ClosureOpenInterSuperset", () => closureopenintersuperset()),
      ],
    ),
  ))
}

///|
let closure_open_inter_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_OPEN_INTER_SUPERSET")

///|
/// `CLOSURE_OPEN_INTER_SUPERSET`
pub fn closure_open_inter_superset() -> @kernel.Thm {
  closure_open_inter_superset_c.get()
}

///|
/// CLOSURE_COMPLEMENT
fn step_746() -> Unit raise {
  closure_complement_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(DIFF(UNIV, s)) == DIFF(UNIV, interior(s))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("closure_DEF", () => closure_def_v1()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("ClosureComplement", () => closurecomplement()),
          ],
        ),
      ],
    ),
  ))
}

///|
let closure_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_COMPLEMENT")

///|
/// `CLOSURE_COMPLEMENT`
pub fn closure_complement() -> @kernel.Thm {
  closure_complement_c.get()
}

///|
/// INTERIOR_COMPLEMENT
fn step_747() -> Unit raise {
  interior_complement_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(DIFF(UNIV, s)) == DIFF(UNIV, closure(s))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("closure_DEF", () => closure_def_v1()),
            @readable.Rule(
              @equal.gsym,
              @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            ),
            @readable.Thm("interior_DEF", () => interior_def_v1()),
          ],
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("InteriorComplement", () => interiorcomplement()),
          ],
        ),
      ],
    ),
  ))
}

///|
let interior_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_COMPLEMENT")

///|
/// `INTERIOR_COMPLEMENT`
pub fn interior_complement() -> @kernel.Thm {
  interior_complement_c.get()
}

///|
/// CONNECTED_INTERMEDIATE_CLOSURE
fn step_748() -> Unit raise {
  connected_intermediate_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, connected(s) && SUBSET(s, t) && SUBSET(t, closure(s)) → connected(t)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm(
          "ConnectedIntermediateClosure",
          () => connectedintermediateclosure(),
        ),
      ],
    ),
  ))
}

///|
let connected_intermediate_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_INTERMEDIATE_CLOSURE")

///|
/// `CONNECTED_INTERMEDIATE_CLOSURE`
pub fn connected_intermediate_closure() -> @kernel.Thm {
  connected_intermediate_closure_c.get()
}

///|
/// CONNECTED_CLOSURE
fn step_749() -> Unit raise {
  connected_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, connected(s) → connected(closure(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("ConnectedClosure", () => connectedclosure()),
      ],
    ),
  ))
}

///|
let connected_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_CLOSURE")

///|
/// `CONNECTED_CLOSURE`
pub fn connected_closure() -> @kernel.Thm {
  connected_closure_c.get()
}

///|
/// CONNECTED_UNION_STRONG
fn step_751() -> Unit raise {
  connected_union_strong_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, connected(s) && connected(t) && !(INTER(closure(s), t) == {}) → connected(UNION(s, t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("ConnectedUnionStrong", () => connectedunionstrong()),
      ],
    ),
  ))
}

///|
let connected_union_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_UNION_STRONG")

///|
/// `CONNECTED_UNION_STRONG`
pub fn connected_union_strong() -> @kernel.Thm {
  connected_union_strong_c.get()
}

///|
/// INTERIOR_DIFF
fn step_753() -> Unit raise {
  interior_diff_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, interior(DIFF(s, t)) == DIFF(interior(s), closure(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("InteriorDiff", () => interiordiff()),
      ],
    ),
  ))
}

///|
let interior_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_DIFF")

///|
/// `INTERIOR_DIFF`
pub fn interior_diff() -> @kernel.Thm {
  interior_diff_c.get()
}

///|
/// CLOSED_IN_LIMPT
fn step_755() -> Unit raise {
  closed_in_limpt_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, t), s) == (SUBSET(s, t) && (∀ x : Cart[Real, _], limit_point_of(x, s) && IN(x, t) → IN(x, s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("ClosedInLimpt_ALT", () => closedinlimpt_alt()),
      ],
    ),
  ))
}

///|
let closed_in_limpt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_LIMPT")

///|
/// `CLOSED_IN_LIMPT`
pub fn closed_in_limpt() -> @kernel.Thm {
  closed_in_limpt_c.get()
}

///|
/// CLOSED_IN_INTER_CLOSURE
fn step_757() -> Unit raise {
  closed_in_inter_closure_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed_in(subtopology(euclidean, s), t) == (INTER(s, closure(t)) == t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("limit_point_of_DEF", () => limit_point_of_def()),
        @readable.Thm("ClosedInInterClosure", () => closedininterclosure()),
      ],
    ),
  ))
}

///|
let closed_in_inter_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_IN_INTER_CLOSURE")

///|
/// `CLOSED_IN_INTER_CLOSURE`
pub fn closed_in_inter_closure() -> @kernel.Thm {
  closed_in_inter_closure_c.get()
}

///|
/// INTERIOR_CLOSURE_IDEMP
fn step_759() -> Unit raise {
  interior_closure_idemp_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(closure(interior(closure(s)))) == interior(closure(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("InteriorClosureIdemp", () => interiorclosureidemp()),
      ],
    ),
  ))
}

///|
let interior_closure_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CLOSURE_IDEMP")

///|
/// `INTERIOR_CLOSURE_IDEMP`
pub fn interior_closure_idemp() -> @kernel.Thm {
  interior_closure_idemp_c.get()
}

///|
/// CLOSURE_INTERIOR_IDEMP
fn step_760() -> Unit raise {
  closure_interior_idemp_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(interior(closure(interior(s)))) == closure(interior(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("ClosureInteriorIdemp", () => closureinterioridemp()),
      ],
    ),
  ))
}

///|
let closure_interior_idemp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_INTERIOR_IDEMP")

///|
/// `CLOSURE_INTERIOR_IDEMP`
pub fn closure_interior_idemp() -> @kernel.Thm {
  closure_interior_idemp_c.get()
}

///|
/// INTERIOR_CLOSED_UNION_EMPTY_INTERIOR
fn step_762() -> Unit raise {
  interior_closed_union_empty_interior_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && interior(t) == {} → interior(UNION(s, t)) == interior(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm(
          "InteriorClosedUnionEmptyInterior",
          () => interiorclosedunionemptyinterior(),
        ),
      ],
    ),
  ))
}

///|
let interior_closed_union_empty_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CLOSED_UNION_EMPTY_INTERIOR")

///|
/// `INTERIOR_CLOSED_UNION_EMPTY_INTERIOR`
pub fn interior_closed_union_empty_interior() -> @kernel.Thm {
  interior_closed_union_empty_interior_c.get()
}

///|
/// INTERIOR_UNION_EQ_EMPTY
fn step_763() -> Unit raise {
  interior_union_eq_empty_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) || closed(t) → (interior(UNION(s, t)) == {}) == (interior(s) == {} && interior(t) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("InteriorUnionEqEmpty", () => interiorunioneqempty()),
      ],
    ),
  ))
}

///|
let interior_union_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_UNION_EQ_EMPTY")

///|
/// `INTERIOR_UNION_EQ_EMPTY`
pub fn interior_union_eq_empty() -> @kernel.Thm {
  interior_union_eq_empty_c.get()
}

///|
/// NOWHERE_DENSE_UNION
fn step_764() -> Unit raise {
  nowhere_dense_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, (interior(closure(UNION(s, t))) == {}) == (interior(closure(s)) == {} && interior(closure(t)) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("NowhereDenseUnion", () => nowheredenseunion()),
      ],
    ),
  ))
}

///|
let nowhere_dense_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOWHERE_DENSE_UNION")

///|
/// `NOWHERE_DENSE_UNION`
pub fn nowhere_dense_union() -> @kernel.Thm {
  nowhere_dense_union_c.get()
}

///|
/// NOWHERE_DENSE
fn step_766() -> Unit raise {
  nowhere_dense_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (interior(closure(s)) == {}) == (∀ t : (Cart[Real, _]) -> Bool, open(t) && !(t == {}) → (∃ u : (Cart[Real, _]) -> Bool, open(u) && !(u == {}) && SUBSET(u, t) && INTER(u, s) == {}))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("NowhereDense", () => nowheredense()),
      ],
    ),
  ))
}

///|
let nowhere_dense_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOWHERE_DENSE")

///|
/// `NOWHERE_DENSE`
pub fn nowhere_dense() -> @kernel.Thm {
  nowhere_dense_c.get()
}

///|
/// INTERIOR_CLOSURE_INTER_OPEN
fn step_768() -> Unit raise {
  interior_closure_inter_open_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, open(s) && open(t) → interior(closure(INTER(s, t))) == INTER(interior(closure(s)), interior(closure(t)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("InteriorClosureInterOpen", () => interiorclosureinteropen()),
      ],
    ),
  ))
}

///|
let interior_closure_inter_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CLOSURE_INTER_OPEN")

///|
/// `INTERIOR_CLOSURE_INTER_OPEN`
pub fn interior_closure_inter_open() -> @kernel.Thm {
  interior_closure_inter_open_c.get()
}

///|
/// CLOSURE_INTERIOR_UNION_CLOSED
fn step_769() -> Unit raise {
  closure_interior_union_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closed(s) && closed(t) → closure(interior(UNION(s, t))) == UNION(closure(interior(s)), closure(interior(t)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("ClosureInteriorUnionClosed", () => closureinteriorunionclosed()),
      ],
    ),
  ))
}

///|
let closure_interior_union_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_INTERIOR_UNION_CLOSED")

///|
/// `CLOSURE_INTERIOR_UNION_CLOSED`
pub fn closure_interior_union_closed() -> @kernel.Thm {
  closure_interior_union_closed_c.get()
}

///|
/// REGULAR_OPEN_INTER
fn step_770() -> Unit raise {
  regular_open_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, interior(closure(s)) == s && interior(closure(t)) == t → interior(closure(INTER(s, t))) == INTER(s, t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("RegularOpenInter", () => regularopeninter()),
      ],
    ),
  ))
}

///|
let regular_open_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REGULAR_OPEN_INTER")

///|
/// `REGULAR_OPEN_INTER`
pub fn regular_open_inter() -> @kernel.Thm {
  regular_open_inter_c.get()
}

///|
/// REGULAR_CLOSED_UNION
fn step_772() -> Unit raise {
  regular_closed_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, closure(interior(s)) == s && closure(interior(t)) == t → closure(interior(UNION(s, t))) == UNION(s, t)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("RegularClosedUnion", () => regularclosedunion()),
      ],
    ),
  ))
}

///|
let regular_closed_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REGULAR_CLOSED_UNION")

///|
/// `REGULAR_CLOSED_UNION`
pub fn regular_closed_union() -> @kernel.Thm {
  regular_closed_union_c.get()
}

///|
/// DIFF_CLOSURE_SUBSET
fn step_774() -> Unit raise {
  diff_closure_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(DIFF(closure(s), closure(t)), closure(DIFF(s, t)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("DiffClosureSubset", () => diffclosuresubset()),
      ],
    ),
  ))
}

///|
let diff_closure_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_CLOSURE_SUBSET")

///|
/// `DIFF_CLOSURE_SUBSET`
pub fn diff_closure_subset() -> @kernel.Thm {
  diff_closure_subset_c.get()
}

///|
/// frontier_DEF
fn step_776() -> Unit raise {
  frontier_def_v1_c.set(@readable.newdefinition("(frontier : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == Frontier(euclidean)"))
}

///|
let frontier_def_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frontier_DEF")

///|
/// `frontier_DEF`
pub fn frontier_def_v1() -> @kernel.Thm {
  frontier_def_v1_c.get()
}

///|
/// frontier
fn step_777() -> Unit raise {
  frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, frontier(s) == DIFF(closure(s), interior(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("Frontier_THM", () => frontier_thm()),
      ],
    ),
  ))
}

///|
let frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("frontier")

///|
/// `frontier`
pub fn frontier() -> @kernel.Thm {
  frontier_c.get()
}

///|
/// FRONTIER_CLOSED
fn step_779() -> Unit raise {
  frontier_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(frontier(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("FrontierClosed", () => frontierclosed()),
      ],
    ),
  ))
}

///|
let frontier_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_CLOSED")

///|
/// `FRONTIER_CLOSED`
pub fn frontier_closed() -> @kernel.Thm {
  frontier_closed_c.get()
}

///|
/// FRONTIER_CLOSURES
fn step_780() -> Unit raise {
  frontier_closures_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, frontier(s) == INTER(closure(s), closure(DIFF(UNIV, s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("FrontierClosures", () => frontierclosures()),
      ],
    ),
  ))
}

///|
let frontier_closures_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_CLOSURES")

///|
/// `FRONTIER_CLOSURES`
pub fn frontier_closures() -> @kernel.Thm {
  frontier_closures_c.get()
}

///|
/// FRONTIER_STRADDLE
fn step_781() -> Unit raise {
  frontier_straddle_c.set(@readable.prove(
    "∀ a : Cart[Real, _], ∀ s : (Cart[Real, _]) -> Bool, IN(a, frontier(s)) == (∀ e : Real, real_of_num(0) < e → (∃ x : Cart[Real, _], IN(x, s) && distance((a, x)) < e) && (∃ x : Cart[Real, _], !IN(x, s) && distance((a, x)) < e))",
    @readable.steps(
      [
        @readable.by(
          @readable.simplify,
          [
            @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
            @readable.Thm("IN_UNIV", () => @sets.in_univ()),
            @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
            @readable.Thm("frontier_DEF", () => frontier_def_v1()),
            @readable.Thm("closure_DEF", () => closure_def_v1()),
            @readable.Thm("FrontierStraddle", () => frontierstraddle()),
            @readable.Rule(@equal.gsym, @readable.Thm("OPEN_IN", () => open_in())),
          ],
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("IN_BALL", () => in_ball()),
            @readable.Thm("SUBSET", () => @sets.subset()),
            @readable.Thm("OPEN_CONTAINS_BALL", () => open_contains_ball()),
            @readable.Thm("CENTRE_IN_BALL", () => centre_in_ball()),
            @readable.Thm("OPEN_BALL", () => open_ball()),
          ],
        ),
      ],
    ),
  ))
}

///|
let frontier_straddle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_STRADDLE")

///|
/// `FRONTIER_STRADDLE`
pub fn frontier_straddle() -> @kernel.Thm {
  frontier_straddle_c.get()
}

///|
/// FRONTIER_SUBSET_CLOSED
fn step_782() -> Unit raise {
  frontier_subset_closed_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closed(s) → SUBSET(frontier(s), s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("FrontierSubsetClosed", () => frontiersubsetclosed()),
      ],
    ),
  ))
}

///|
let frontier_subset_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_SUBSET_CLOSED")

///|
/// `FRONTIER_SUBSET_CLOSED`
pub fn frontier_subset_closed() -> @kernel.Thm {
  frontier_subset_closed_c.get()
}

///|
/// FRONTIER_EMPTY
fn step_783() -> Unit raise {
  frontier_empty_c.set(@readable.prove(
    "(frontier : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)(({} : (Cart[Real, _]) -> Bool)) == ({} : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("FrontierEmpty", () => frontierempty()),
      ],
    ),
  ))
}

///|
let frontier_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_EMPTY")

///|
/// `FRONTIER_EMPTY`
pub fn frontier_empty() -> @kernel.Thm {
  frontier_empty_c.get()
}

///|
/// FRONTIER_UNIV
fn step_785() -> Unit raise {
  frontier_univ_c.set(@readable.prove(
    "(frontier : ((Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool)((UNIV : (Cart[Real, _]) -> Bool)) == ({} : (Cart[Real, _]) -> Bool)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("FrontierUniv", () => frontieruniv()),
      ],
    ),
  ))
}

///|
let frontier_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_UNIV")

///|
/// `FRONTIER_UNIV`
pub fn frontier_univ() -> @kernel.Thm {
  frontier_univ_c.get()
}

///|
/// FRONTIER_SUBSET_EQ
fn step_787() -> Unit raise {
  frontier_subset_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(frontier(s), s) == closed(s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("FrontierSubsetEq", () => frontiersubseteq()),
      ],
    ),
  ))
}

///|
let frontier_subset_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_SUBSET_EQ")

///|
/// `FRONTIER_SUBSET_EQ`
pub fn frontier_subset_eq() -> @kernel.Thm {
  frontier_subset_eq_c.get()
}

///|
/// FRONTIER_COMPLEMENT
fn step_788() -> Unit raise {
  frontier_complement_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, frontier(DIFF(UNIV, s)) == frontier(s)",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("FrontierComplement", () => frontiercomplement()),
      ],
    ),
  ))
}

///|
let frontier_complement_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_COMPLEMENT")

///|
/// `FRONTIER_COMPLEMENT`
pub fn frontier_complement() -> @kernel.Thm {
  frontier_complement_c.get()
}

///|
/// FRONTIER_DISJOINT_EQ
fn step_789() -> Unit raise {
  frontier_disjoint_eq_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (INTER(frontier(s), s) == {}) == open(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("FrontierDisjointEq", () => frontierdisjointeq()),
      ],
    ),
  ))
}

///|
let frontier_disjoint_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_DISJOINT_EQ")

///|
/// `FRONTIER_DISJOINT_EQ`
pub fn frontier_disjoint_eq() -> @kernel.Thm {
  frontier_disjoint_eq_c.get()
}

///|
/// FRONTIER_INTER_SUBSET
fn step_791() -> Unit raise {
  frontier_inter_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(frontier(INTER(s, t)), UNION(frontier(s), frontier(t)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("FrontierInterSubset", () => frontierintersubset()),
      ],
    ),
  ))
}

///|
let frontier_inter_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_INTER_SUBSET")

///|
/// `FRONTIER_INTER_SUBSET`
pub fn frontier_inter_subset() -> @kernel.Thm {
  frontier_inter_subset_c.get()
}

///|
/// FRONTIER_UNION_SUBSET
fn step_792() -> Unit raise {
  frontier_union_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(frontier(UNION(s, t)), UNION(frontier(s), frontier(t)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("FrontierUnionSubset", () => frontierunionsubset()),
      ],
    ),
  ))
}

///|
let frontier_union_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_UNION_SUBSET")

///|
/// `FRONTIER_UNION_SUBSET`
pub fn frontier_union_subset() -> @kernel.Thm {
  frontier_union_subset_c.get()
}

///|
/// FRONTIER_INTERIORS
fn step_793() -> Unit raise {
  frontier_interiors_c.set(@readable.prove(
    "frontier((s : (Cart[Real, _]) -> Bool)) == DIFF(DIFF(UNIV, interior(s)), interior(DIFF(UNIV, s)))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("FrontierInteriors", () => frontierinteriors()),
      ],
    ),
  ))
}

///|
let frontier_interiors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_INTERIORS")

///|
/// `FRONTIER_INTERIORS`
pub fn frontier_interiors() -> @kernel.Thm {
  frontier_interiors_c.get()
}

///|
/// FRONTIER_FRONTIER_SUBSET
fn step_794() -> Unit raise {
  frontier_frontier_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(frontier(frontier(s)), frontier(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("FrontierFrontierSubset", () => frontierfrontiersubset()),
      ],
    ),
  ))
}

///|
let frontier_frontier_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_FRONTIER_SUBSET")

///|
/// `FRONTIER_FRONTIER_SUBSET`
pub fn frontier_frontier_subset() -> @kernel.Thm {
  frontier_frontier_subset_c.get()
}

///|
/// INTERIOR_FRONTIER
fn step_796() -> Unit raise {
  interior_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, interior(frontier(s)) == DIFF(interior(closure(s)), closure(interior(s)))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("InteriorFrontier", () => interiorfrontier()),
      ],
    ),
  ))
}

///|
let interior_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_FRONTIER")

///|
/// `INTERIOR_FRONTIER`
pub fn interior_frontier() -> @kernel.Thm {
  interior_frontier_c.get()
}

///|
/// INTERIOR_FRONTIER_EMPTY
fn step_797() -> Unit raise {
  interior_frontier_empty_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, open(s) || closed(s) → interior(frontier(s)) == {}",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("InteriorFrontierEmpty", () => interiorfrontierempty()),
      ],
    ),
  ))
}

///|
let interior_frontier_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_FRONTIER_EMPTY")

///|
/// `INTERIOR_FRONTIER_EMPTY`
pub fn interior_frontier_empty() -> @kernel.Thm {
  interior_frontier_empty_c.get()
}

///|
/// UNION_FRONTIER
fn step_798() -> Unit raise {
  union_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, UNION(frontier(s), frontier(t)) == UNION(frontier(UNION(s, t)), UNION(frontier(INTER(s, t)), INTER(frontier(s), frontier(t))))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("UnionFrontier", () => unionfrontier()),
      ],
    ),
  ))
}

///|
let union_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_FRONTIER")

///|
/// `UNION_FRONTIER`
pub fn union_frontier() -> @kernel.Thm {
  union_frontier_c.get()
}

///|
/// CONNECTED_INTER_FRONTIER
fn step_800() -> Unit raise {
  connected_inter_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, connected(s) && !(INTER(s, t) == {}) && !(DIFF(s, t) == {}) → !(INTER(s, frontier(t)) == {})",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("connected_DEF", () => connected_def_v1()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("ConnectedInterFrontier", () => connectedinterfrontier()),
      ],
    ),
  ))
}

///|
let connected_inter_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_INTER_FRONTIER")

///|
/// `CONNECTED_INTER_FRONTIER`
pub fn connected_inter_frontier() -> @kernel.Thm {
  connected_inter_frontier_c.get()
}

///|
/// INTERIOR_CLOSED_EQ_EMPTY_AS_FRONTIER
fn step_802() -> Unit raise {
  interior_closed_eq_empty_as_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, (closed(s) && interior(s) == {}) == (∃ t : (Cart[Real, _]) -> Bool, open(t) && s == frontier(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("CLOSED_IN", () => closed_in_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("OPEN_IN", () => open_in()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm(
          "InteriorClosedEqEmptyAsFrontier",
          () => interiorclosedeqemptyasfrontier(),
        ),
      ],
    ),
  ))
}

///|
let interior_closed_eq_empty_as_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERIOR_CLOSED_EQ_EMPTY_AS_FRONTIER")

///|
/// `INTERIOR_CLOSED_EQ_EMPTY_AS_FRONTIER`
pub fn interior_closed_eq_empty_as_frontier() -> @kernel.Thm {
  interior_closed_eq_empty_as_frontier_c.get()
}

///|
/// FRONTIER_UNION
fn step_804() -> Unit raise {
  frontier_union_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, INTER(closure(s), closure(t)) == {} → frontier(UNION(s, t)) == UNION(frontier(s), frontier(t))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("FrontierUnion", () => frontierunion()),
      ],
    ),
  ))
}

///|
let frontier_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_UNION")

///|
/// `FRONTIER_UNION`
pub fn frontier_union() -> @kernel.Thm {
  frontier_union_c.get()
}

///|
/// CLOSURE_UNION_FRONTIER
fn step_806() -> Unit raise {
  closure_union_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, closure(s) == UNION(s, frontier(s))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("ClosureUnionFrontier", () => closureunionfrontier()),
      ],
    ),
  ))
}

///|
let closure_union_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSURE_UNION_FRONTIER")

///|
/// `CLOSURE_UNION_FRONTIER`
pub fn closure_union_frontier() -> @kernel.Thm {
  closure_union_frontier_c.get()
}

///|
/// FRONTIER_INTERIOR_SUBSET
fn step_808() -> Unit raise {
  frontier_interior_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(frontier(interior(s)), frontier(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("FrontierInteriorSubset", () => frontierinteriorsubset()),
      ],
    ),
  ))
}

///|
let frontier_interior_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_INTERIOR_SUBSET")

///|
/// `FRONTIER_INTERIOR_SUBSET`
pub fn frontier_interior_subset() -> @kernel.Thm {
  frontier_interior_subset_c.get()
}

///|
/// FRONTIER_CLOSURE_SUBSET
fn step_810() -> Unit raise {
  frontier_closure_subset_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, SUBSET(frontier(closure(s)), frontier(s))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("FrontierClosureSubset", () => frontierclosuresubset()),
      ],
    ),
  ))
}

///|
let frontier_closure_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_CLOSURE_SUBSET")

///|
/// `FRONTIER_CLOSURE_SUBSET`
pub fn frontier_closure_subset() -> @kernel.Thm {
  frontier_closure_subset_c.get()
}

///|
/// SET_DIFF_FRONTIER
fn step_812() -> Unit raise {
  set_diff_frontier_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, DIFF(s, frontier(s)) == interior(s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("interior_DEF", () => interior_def_v1()),
        @readable.Thm("SetDiffFrontier", () => setdifffrontier()),
      ],
    ),
  ))
}

///|
let set_diff_frontier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_DIFF_FRONTIER")

///|
/// `SET_DIFF_FRONTIER`
pub fn set_diff_frontier() -> @kernel.Thm {
  set_diff_frontier_c.get()
}

///|
/// FRONTIER_INTER_SUBSET_INTER
fn step_814() -> Unit raise {
  frontier_inter_subset_inter_c.set(@readable.prove(
    "∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, SUBSET(frontier(INTER(s, t)), UNION(INTER(closure(s), frontier(t)), INTER(frontier(s), closure(t))))",
    @readable.by(
      @readable.fol,
      [
        @readable.Thm("SUBSET_UNIV", () => @sets.subset_univ()),
        @readable.Thm("TOPSPACE_EUCLIDEAN", () => topspace_euclidean()),
        @readable.Thm("frontier_DEF", () => frontier_def_v1()),
        @readable.Thm("closure_DEF", () => closure_def_v1()),
        @readable.Thm("FrontierInterSubsetInter", () => frontierintersubsetinter()),
      ],
    ),
  ))
}

///|
let frontier_inter_subset_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRONTIER_INTER_SUBSET_INTER")

///|
/// `FRONTIER_INTER_SUBSET_INTER`
pub fn frontier_inter_subset_inter() -> @kernel.Thm {
  frontier_inter_subset_inter_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
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
  step_21()
  step_22()
  step_23()
  step_24()
  step_29()
  step_31()
  step_32()
  step_34()
  step_35()
  step_36()
  step_41()
  step_45()
  step_49()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_60()
  step_61()
  step_71()
  step_74()
  step_75()
  step_77()
  step_81()
  step_85()
  step_88()
  step_93()
  step_98()
  step_100()
  step_104()
  step_106()
  step_108()
  step_111()
  step_116()
  step_117()
  step_129()
  step_134()
  step_136()
  step_138()
  step_140()
  step_144()
  step_145()
  step_147()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_155()
  step_156()
  step_157()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_168()
  step_171()
  step_172()
  step_173()
  step_177()
  step_178()
  step_180()
  step_181()
  step_182()
  step_185()
  step_188()
  step_189()
  step_190()
  step_191()
  step_193()
  step_196()
  step_199()
  step_202()
  step_204()
  step_206()
  step_208()
  step_210()
  step_215()
  step_216()
  step_217()
  step_219()
  step_221()
  step_227()
  step_229()
  step_233()
  step_238()
  step_241()
  step_245()
  step_248()
  step_253()
  step_255()
  step_256()
  step_258()
  step_259()
  step_261()
  step_266()
  step_267()
  step_269()
  step_270()
  step_272()
  step_275()
  step_276()
  step_278()
  step_280()
  step_282()
  step_284()
  step_286()
  step_288()
  step_289()
  step_291()
  step_292()
  step_294()
  step_295()
  step_296()
  step_298()
  step_299()
  step_300()
  step_305()
  step_308()
  step_309()
  step_311()
  step_312()
  step_314()
  step_316()
  step_317()
  step_319()
  step_320()
  step_322()
  step_324()
  step_326()
  step_327()
  step_328()
  step_331()
  step_332()
  step_334()
  step_338()
  step_340()
  step_342()
  step_346()
  step_348()
  step_350()
  step_351()
  step_353()
  step_355()
  step_356()
  step_357()
  step_358()
  step_362()
  step_363()
  step_364()
  step_368()
  step_370()
  step_372()
  step_374()
  step_375()
  step_378()
  step_379()
  step_380()
  step_382()
  step_386()
  step_387()
  step_388()
  step_390()
  step_391()
  step_393()
  step_394()
  step_397()
  step_398()
  step_400()
  step_403()
  step_406()
  step_410()
  step_411()
  step_413()
  step_415()
  step_416()
  step_418()
  step_420()
  step_421()
  step_422()
  step_424()
  step_425()
  step_427()
  step_430()
  step_433()
  step_434()
  step_435()
  step_439()
  step_442()
  step_444()
  step_446()
  step_448()
  step_449()
  step_451()
  step_453()
  step_455()
  step_458()
  step_460()
  step_463()
  step_465()
  step_466()
  step_467()
  step_469()
  step_470()
  step_471()
  step_473()
  step_474()
  step_476()
  step_477()
  step_478()
  step_479()
  step_481()
  step_484()
  step_487()
  step_488()
  step_493()
  step_496()
  step_497()
  step_502()
  step_504()
  step_505()
  step_506()
  step_508()
  step_510()
  step_511()
  step_512()
  step_514()
  step_515()
  step_516()
  step_517()
  step_519()
  step_521()
  step_523()
  step_524()
  step_525()
  step_526()
  step_528()
  step_530()
  step_531()
  step_532()
  step_534()
  step_536()
  step_540()
  step_547()
  step_549()
  step_550()
  step_551()
  step_554()
  step_555()
  step_557()
  step_558()
  step_559()
  step_561()
  step_562()
  step_564()
  step_566()
  step_568()
  step_570()
  step_572()
  step_574()
  step_578()
  step_581()
  step_584()
  step_586()
  step_587()
  step_589()
  step_590()
  step_591()
  step_593()
  step_594()
  step_596()
  step_598()
  step_600()
  step_611()
  step_612()
  step_615()
  step_616()
  step_617()
  step_618()
  step_619()
  step_621()
  step_623()
  step_625()
  step_628()
  step_629()
  step_630()
  step_632()
  step_634()
  step_635()
  step_637()
  step_638()
  step_639()
  step_641()
  step_643()
  step_644()
  step_646()
  step_647()
  step_648()
  step_650()
  step_652()
  step_653()
  step_654()
  step_656()
  step_658()
  step_660()
  step_662()
  step_663()
  step_665()
  step_667()
  step_668()
  step_670()
  step_671()
  step_672()
  step_674()
  step_675()
  step_676()
  step_678()
  step_680()
  step_681()
  step_682()
  step_683()
  step_685()
  step_686()
  step_687()
  step_689()
  step_690()
  step_691()
  step_692()
  step_693()
  step_694()
  step_695()
  step_697()
  step_698()
  step_699()
  step_700()
  step_701()
  step_704()
  step_705()
  step_707()
  step_709()
  step_710()
  step_711()
  step_713()
  step_714()
  step_717()
  step_718()
  step_719()
  step_720()
  step_721()
  step_722()
  step_723()
  step_724()
  step_725()
  step_726()
  step_727()
  step_728()
  step_730()
  step_731()
  step_733()
  step_735()
  step_736()
  step_737()
  step_739()
  step_741()
  step_742()
  step_743()
  step_744()
  step_746()
  step_747()
  step_748()
  step_749()
  step_751()
  step_753()
  step_755()
  step_757()
  step_759()
  step_760()
  step_762()
  step_763()
  step_764()
  step_766()
  step_768()
  step_769()
  step_770()
  step_772()
  step_774()
  step_776()
  step_777()
  step_779()
  step_780()
  step_781()
  step_782()
  step_783()
  step_785()
  step_787()
  step_788()
  step_789()
  step_791()
  step_792()
  step_793()
  step_794()
  step_796()
  step_797()
  step_798()
  step_800()
  step_802()
  step_804()
  step_806()
  step_808()
  step_810()
  step_812()
  step_814()
}
