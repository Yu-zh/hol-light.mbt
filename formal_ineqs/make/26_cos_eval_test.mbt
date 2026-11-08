// Formal_ineqs/trig/cos_eval.hl in its directory's load order: the test block of
// formal_ineqs/trig/cos_eval/cos_eval_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_cos_eval_ref.expected).

///|
test "Formal_ineqs/trig/cos_eval matches Formal_ineqs/trig/cos_eval.ml" {
  @testkit.release_output()
  @cos_eval.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/cos_eval"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/cos_eval")
  log.capture_stdout()
  // BEGIN generated theorem list
  // END generated theorem list
  let tm = @term_syntax.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
      #|Formal_ineqs/trig/cos_eval quotations (133):
      #|  (real_of_num(0) <= (lo : Real)) == true \226\134\146 -pi <= lo
      #|  (e : Num)
      #|  (n : Num)
      #|  interval_arith((x : Real), (float_num(false, (n : Num), (e : Num)), (f : Real))) \226\134\146 x <= f && real_of_num(0) <= float_num(false, n, e)
      #|  (a : Real) - (b : Real) + real_of_num(2) * b == a + b
      #|  (x : Real) - pi
      #|  \226\136\128 x : Real, cos(x - pi) == -cos(x)
      #|  (a : Real) - (b : Real) == -(b - a)
      #|  \226\136\128 x : Real, cos(pi - x) == -cos(x)
      #|  real_of_num(1)
      #|  cos(real_of_num(2) * pi - (x : Real)) == cos(x)
      #|  \226\136\128 x : Real, interval_arith(cos(x), (-real_of_num(1), real_of_num(1)))
      #|  -(k : Real)
      #|  cos((x : Real)) == cos(x + real_of_num(2) * pi * (k : Real))
      #|  cos((a1 : Real))
      #|  cos((b1 : Real))
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (real_of_num(0), pi)) && b1 <= pi && cos(a1) <= (high : Real) && (low : Real) <= cos(b1) \226\134\146 interval_arith(cos(x), (low, high))
      #|  (x : Real) + real_of_num(2) * pi * (k : Real) <= pi
      #|  -(k : Real)
      #|  cos((x : Real)) == cos(x + real_of_num(2) * pi * (k : Real))
      #|  max(cos((a1 : Real)), cos((b1 : Real)))
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (real_of_num(0), pi)) && b1 <= real_of_num(2) * pi && cos(a1) <= (high1 : Real) && cos(b1) <= (high2 : Real) && max(high1, high2) == (high : Real) \226\134\146 interval_arith(cos(x), (-real_of_num(1), high))
      #|  (a1 : Real) - pi == -(pi - a1)
      #|  cos((a1 : Real) - pi) == cos(pi - a1)
      #|  (b1 : Real) <= pi
      #|  cos((a1 : Real))
      #|  (k : Real)
      #|  (high : Real)
      #|  (high : Real)
      #|  (b1 : Real)
      #|  (a1 : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (real_of_num(0), pi)) && a1 + b1 <= real_of_num(2) * pi && cos(a1) <= (high : Real) \226\134\146 interval_arith(cos(x), (-real_of_num(1), high))
      #|  (a1 : Real) - pi == -(pi - a1)
      #|  cos((a1 : Real) - pi) == cos(pi - a1)
      #|  cos((b1 : Real))
      #|  (k : Real)
      #|  (high : Real)
      #|  (high : Real)
      #|  (b1 : Real)
      #|  (a1 : Real)
      #|  (b : Real)
      #|  (a : Real)
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (real_of_num(0), pi)) && b1 <= real_of_num(2) * pi && real_of_num(2) * pi <= a1 + b1 && cos(b1) <= (high : Real) \226\134\146 interval_arith(cos(x), (-real_of_num(1), high))
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (k : Real)
      #|  (b1 : Real) + pi
      #|  (a1 : Real) + pi
      #|  (b : Real) + pi
      #|  (a : Real) + pi
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (-pi, real_of_num(0))) && (b1 <= real_of_num(0)) == true && (low : Real) <= cos(a1) && cos(b1) <= (high : Real) \226\134\146 interval_arith(cos(x), (low, high))
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (k : Real)
      #|  -(low2 : Real)
      #|  -(low1 : Real)
      #|  (b1 : Real) + pi
      #|  (a1 : Real) + pi
      #|  (b : Real) + pi
      #|  (a : Real) + pi
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (-pi, real_of_num(0))) && b1 <= pi && (low1 : Real) <= cos(a1) && (low2 : Real) <= cos(b1) && min(low1, low2) == (low : Real) \226\134\146 interval_arith(cos(x), (low, real_of_num(1)))
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (k : Real)
      #|  (a1 : Real) + pi
      #|  (b1 : Real) + pi
      #|  (b : Real) + pi
      #|  (a : Real) + pi
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (-pi, real_of_num(0))) && (b2 : Real) == -b1 && (a1 <= b2) == true && (low : Real) <= cos(a1) \226\134\146 interval_arith(cos(x), (low, real_of_num(1)))
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (a : Real) + pi + (b : Real) == a + b + pi
      #|  (k : Real)
      #|  (b1 : Real) + pi
      #|  (a1 : Real) + pi
      #|  (b : Real) + pi
      #|  (a : Real) + pi
      #|  interval_arith((x : Real), ((a : Real), (b : Real))) && (\226\136\131 k : Real, integer(k) && (a1 : Real) <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= (b1 : Real)) && interval_arith(a1, (-pi, real_of_num(0))) && b1 <= pi && (b2 : Real) == -b1 && (a1 <= b2) == false && (low : Real) <= cos(b1) \226\134\146 interval_arith(cos(x), (low, real_of_num(1)))
      #|  cos((x : Real)) <= real_of_num(1)
      #|  -real_of_num(1) <= cos((x : Real))
      #|  interval_arith((x : Real), (-pi, real_of_num(0))) && (y : Real) == -x \226\134\146 interval_arith(y, (real_of_num(0), pi))
      #|  (y : Real) == -(x : Real) && cos(y) <= (high : Real) \226\134\146 cos(x) <= high
      #|  (y : Real) == -(x : Real) && (low : Real) <= cos(y) \226\134\146 low <= cos(x)
      #|  -cos((t : Real))
      #|  interval_arith((x : Real), (real_of_num(0), pi)) && interval_arith(pi, ((lo : Real), (hi : Real))) && hi - x <= (t : Real) && t <= pi && (r : Real) <= cos(t) && (high : Real) == -r \226\134\146 cos(x) <= high
      #|  -cos((t : Real))
      #|  interval_arith((x : Real), (real_of_num(0), pi)) && interval_arith(pi, ((lo : Real), (hi : Real))) && (t : Real) <= lo - x && (real_of_num(0) <= t) == true && cos(t) <= (r : Real) && (low : Real) == -r \226\134\146 low <= cos(x)
      #|  cos((x : Real)) == cos(real_of_num(2) * pi - x)
      #|  cos((t : Real))
      #|  interval_arith((x : Real), (pi, real_of_num(2) * pi)) && interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && (t : Real) <= lo - x && (real_of_num(0) <= t) == true && cos(t) <= (r : Real) \226\134\146 cos(x) <= r
      #|  cos((x : Real)) == cos(real_of_num(2) * pi - x)
      #|  cos((t : Real))
      #|  interval_arith((x : Real), (pi, real_of_num(2) * pi)) && interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && hi - x <= (t : Real) && t <= pi && (r : Real) <= cos(t) \226\134\146 r <= cos(x)
      #|  cos((t : Real))
      #|  cos((x : Real)) == -cos(x - pi)
      #|  interval_arith((x : Real), (pi, real_of_num(2) * pi)) && interval_arith(pi, ((lo : Real), (hi : Real))) && x - lo <= (t : Real) && t <= pi && (r : Real) <= cos(t) && (high : Real) == -r \226\134\146 cos(x) <= high
      #|  cos((t : Real))
      #|  cos((x : Real)) == -cos(x - pi)
      #|  interval_arith((x : Real), (pi, real_of_num(2) * pi)) && interval_arith(pi, ((lo : Real), (hi : Real))) && (t : Real) <= x - hi && (real_of_num(0) <= t) == true && cos(t) <= (r : Real) && (low : Real) == -r \226\134\146 low <= cos(x)
      #|  real_of_num(0)
      #|  \226\136\131 k : Real, integer(k) && (a : Real) <= a + real_of_num(2) * pi * k && (b : Real) + real_of_num(2) * pi * k <= b
      #|  real_of_num(2) * pi * (z : Real) == z * (real_of_num(2) * pi)
      #|  (z : Real) * (lo : Real)
      #|  (b : Real) - (n : Real)
      #|  real_of_num(2) * pi * (z : Real) == z * (real_of_num(2) * pi)
      #|  (z : Real) * (hi : Real)
      #|  (a : Real) - (m : Real)
      #|  -real_of_num((i : Num))
      #|  real_of_num((i : Num)) == (z : Real) && interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && real_of_num(0) <= lo && z * hi <= (m : Real) && (a1 : Real) <= (a : Real) - m && (n : Real) <= z * lo && (b : Real) - n <= (b1 : Real) \226\134\146 (\226\136\131 k : Real, integer(k) && a1 <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= b1)
      #|  real_of_num(2) * pi * (z : Real) == z * (real_of_num(2) * pi)
      #|  (z : Real) * (hi : Real)
      #|  (b : Real) + (n : Real)
      #|  real_of_num(2) * pi * (z : Real) == z * (real_of_num(2) * pi)
      #|  (z : Real) * (lo : Real)
      #|  (a : Real) + (m : Real)
      #|  real_of_num((i : Num))
      #|  real_of_num((i : Num)) == (z : Real) && interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && real_of_num(0) <= lo && (m : Real) <= z * lo && (a1 : Real) <= (a : Real) + m && z * hi <= (n : Real) && (b : Real) + n <= (b1 : Real) \226\134\146 (\226\136\131 k : Real, integer(k) && a1 <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= b1)
      #|  (k : Real) + real_of_num(1)
      #|  interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && (a2 : Real) <= (a1 : Real) + lo && (b1 : Real) + hi <= (b2 : Real) && (\226\136\131 k : Real, integer(k) && a1 <= (a : Real) + real_of_num(2) * pi * k && (b : Real) + real_of_num(2) * pi * k <= b1) \226\134\146 (\226\136\131 k : Real, integer(k) && a2 <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= b2)
      #|  interval_arith(pi, ((lo : Real), (hi : Real))) && ((a1 : Real) <= lo) == false \226\134\146 lo <= a1 && lo <= pi
      #|  interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && (m : Real) <= (a1 : Real) + (b1 : Real) && (lo <= m) == true && hi - lo <= (t : Real) && b1 + t <= (b2 : Real) \226\134\146 b1 <= b2 && real_of_num(2) * pi <= a1 + b2
      #|  interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && (a1 : Real) + (b1 : Real) <= (n : Real) && (n <= lo) == true \226\134\146 a1 + b1 <= real_of_num(2) * pi
      #|  interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && hi - lo <= (t : Real) && (m : Real) <= (a1 : Real) + (b1 : Real) && a1 + b1 <= (n : Real) && n - m <= (r : Real) && (n <= lo) == false && r + t <= (z : Real) && b1 + z <= (b2 : Real) \226\134\146 b1 <= b2 && real_of_num(2) * pi <= a1 + b2
      #|  interval_arith(real_of_num(2) * pi, ((lo : Real), (hi : Real))) && (m : Real) <= (a1 : Real) + (b1 : Real) && (hi <= m) == true \226\134\146 real_of_num(2) * pi <= a1 + b1
      #|  (k : Real)
      #|  (a2 : Real) <= (a1 : Real) && (b1 : Real) <= (b2 : Real) && (\226\136\131 k : Real, integer(k) && a1 <= (a : Real) + real_of_num(2) * pi * k && (b : Real) + real_of_num(2) * pi * k <= b1) \226\134\146 (\226\136\131 k : Real, integer(k) && a2 <= a + real_of_num(2) * pi * k && b + real_of_num(2) * pi * k <= b2)
      #|  (real_of_num(0) <= (a1 : Real)) == true && a1 <= pi \226\134\146 interval_arith(a1, (real_of_num(0), pi))
      #|  (real_of_num(0) <= (a1 : Real)) == false && -pi <= a1 \226\134\146 interval_arith(a1, (-pi, real_of_num(0)))
      #|  (real_of_num(0) <= (b1 : Real)) == true && b1 <= pi \226\134\146 interval_arith(b1, (real_of_num(0), pi))
      #|  (b1 : Real) <= pi && (real_of_num(0) <= (a1 : Real)) == false && (b2 : Real) == -b1 && (a1 <= b2) == false \226\134\146 interval_arith(b1, (real_of_num(0), pi))
      #|  real_of_num(2) * pi <= (a1 : Real) + (b1 : Real) && a1 <= pi && b1 <= real_of_num(2) * pi \226\134\146 interval_arith(b1, (pi, real_of_num(2) * pi))
      #|  ((b1 : Real) <= real_of_num(0)) == true && ((a1 : Real) <= b1) == true && -pi <= a1 \226\134\146 interval_arith(b1, (-pi, real_of_num(0)))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1061
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _3717854:bool
      #|
    ),
  )
}
