// Formal_ineqs/list/more_list.hl in its directory's load order: the test block of
// formal_ineqs/list/more_list/more_list_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_list_more_list_ref.expected).

///|
test "Formal_ineqs/list/more_list matches Formal_ineqs/list/more_list.ml" {
  @testkit.release_output()
  @more_list.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/list/more_list"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/list/more_list")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("More_list.REVERSE_TABLE", () => sthm(@more_list.reverse_table()))
  log.attempt("More_list.TABLE", () => sthm(@more_list.table()))
  log.attempt("More_list.l_seq", () => sthm(@more_list.l_seq()))
  log.attempt("More_list.LENGTH_REVERSE_TABLE", () => {
    sthm(@more_list.length_reverse_table())
  })
  log.attempt("More_list.LENGTH_REVERSE", () => {
    sthm(@more_list.length_reverse())
  })
  log.attempt("More_list.LENGTH_TABLE", () => sthm(@more_list.length_table()))
  log.attempt("More_list.EL_TABLE", () => sthm(@more_list.el_table()))
  log.attempt("More_list.TABLE_0", () => sthm(@more_list.table_0()))
  log.attempt("More_list.TABLE_SUC", () => sthm(@more_list.table_suc()))
  log.attempt("More_list.LIST_EL_EQ", () => sthm(@more_list.list_el_eq()))
  log.attempt("More_list.LENGTH_L_SEQ", () => sthm(@more_list.length_l_seq()))
  log.attempt("More_list.EL_L_SEQ", () => sthm(@more_list.el_l_seq()))
  log.attempt("More_list.L_SEQ_NIL", () => sthm(@more_list.l_seq_nil()))
  log.attempt("More_list.L_SEQ_NN", () => sthm(@more_list.l_seq_nn()))
  log.attempt("More_list.L_SEQ_CONS", () => sthm(@more_list.l_seq_cons()))
  log.attempt("More_list.LENGTH_BUTLAST", () => {
    sthm(@more_list.length_butlast())
  })
  log.attempt("More_list.EL_BUTLAST", () => sthm(@more_list.el_butlast()))
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
      #|Warning: inventing type variables
      #|Formal_ineqs/list/more_list quotations (43):
      #|  (REVERSE_TABLE : ((Num) -> A, Num) -> List[A])((f : (Num) -> A), 0) == NIL && REVERSE_TABLE(f, SUC((i : Num))) == CONS(f(i), REVERSE_TABLE(f, i))
      #|  :P
      #|  :P
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  (n : Num) => n + 1
      #|  \226\136\128 f : (Num) -> A, \226\136\128 k : Num, (TABLE : ((Num) -> A, Num) -> List[A])(f, k) == REVERSE(REVERSE_TABLE(f, k))
      #|  (l_seq : (Num, Num) -> List[Num])((n : Num), (m : Num)) == TABLE((i : Num) => n + i, m + 1 - n)
      #|  \226\136\128 f : (Num) -> A, \226\136\128 n : Num, LENGTH(REVERSE_TABLE(f, n)) == n
      #|  \226\136\128 l : List[A], LENGTH(REVERSE(l)) == LENGTH(l)
      #|  \226\136\128 f : (Num) -> A, \226\136\128 n : Num, LENGTH(TABLE(f, n)) == n
      #|  (n : Num) - n == 0
      #|  (i : Num) == (n : Num)
      #|  (n : Num)
      #|  (n : Num)
      #|  \226\136\128 f : (Num) -> A, \226\136\128 n : Num, \226\136\128 i : Num, i < n \226\134\146 EL(i, TABLE(f, n)) == f(i)
      #|  \226\136\128 f : (Num) -> A, TABLE(f, 0) == NIL
      #|  \226\136\128 f : (Num) -> A, \226\136\128 n : Num, TABLE(f, SUC(n)) == APPEND(TABLE(f, n), [f(n)])
      #|  0 < SUC((a : Num))
      #|  0
      #|  (SUC((a : Num)) < SUC((b : Num))) == (a < b)
      #|  SUC((j : Num))
      #|  (t' : List[A])
      #|  (SUC((a : Num)) == SUC((b : Num))) == (a == b)
      #|  !(0 == SUC((a : Num)))
      #|  (ul : List[A])
      #|  (ul : List[A])
      #|  (vl : List[A])
      #|  (vl : List[A])
      #|  \226\136\128 ul : List[A], \226\136\128 vl : List[A], (ul == vl) == (LENGTH(ul) == LENGTH(vl) && (\226\136\128 j : Num, j < LENGTH(ul) \226\134\146 EL(j, ul) == EL(j, vl)))
      #|  LENGTH(l_seq((n : Num), (m : Num))) == m + 1 - n
      #|  \226\136\128 i : Num, \226\136\128 m : Num, \226\136\128 n : Num, i < m + 1 - n \226\134\146 EL(i, l_seq(n, m)) == n + i
      #|  \226\136\128 n : Num, \226\136\128 m : Num, (l_seq(n, m) == NIL) == (m < n)
      #|  (n : Num) + 1 - n == 1
      #|  \226\136\128 n : Num, l_seq(n, n) == [n]
      #|  (n : Num) + 1
      #|  (m : Num)
      #|  (j : Num)
      #|  \226\136\128 n : Num, \226\136\128 m : Num, n <= m \226\134\146 l_seq(n, m) == CONS(n, l_seq(n + 1, m))
      #|  \226\136\128 l : List[_], LENGTH(BUTLAST(l)) == LENGTH(l) - 1
      #|  (i : Num) - 1
      #|  (i : Num) < SUC(LENGTH((a1 : List[A]))) - 1
      #|  \226\136\128 l : List[A], \226\136\128 i : Num, i < LENGTH(l) - 1 \226\134\146 EL(i, BUTLAST(l)) == EL(i, l)
      #|More_list.REVERSE_TABLE =  |- ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(list('A),fun(list('A),bool)) ((#REVERSE_TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) (#NUMERAL:fun(num,num) #_0:num))) #NIL:list('A))) ((#=:fun(list('A),fun(list('A),bool)) ((#REVERSE_TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) (#SUC:fun(num,num) i:num))) ((#CONS:fun('A,fun(list('A),list('A))) (f:fun(num,'A) i:num)) ((#REVERSE_TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) i:num))))
      #|More_list.TABLE =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\k:num. ((#=:fun(list('A),fun(list('A),bool)) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) k:num)) (#REVERSE:fun(list('A),list('A)) ((#REVERSE_TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) k:num)))))))
      #|More_list.l_seq =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(num),fun(list(num),bool)) ((#l_seq:fun(num,fun(num,list(num))) n:num) m:num)) ((#TABLE:fun(fun(num,num),fun(num,list(num))) (\i:num. ((#+:fun(num,fun(num,num)) n:num) i:num))) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)))))))
      #|More_list.LENGTH_REVERSE_TABLE =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) ((#REVERSE_TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) n:num))) n:num)))))
      #|More_list.LENGTH_REVERSE =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) (#REVERSE:fun(list('A),list('A)) l:list('A)))) (#LENGTH:fun(list('A),num) l:list('A)))))
      #|More_list.LENGTH_TABLE =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) n:num))) n:num)))))
      #|More_list.EL_TABLE =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) n:num)) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) n:num))) (f:fun(num,'A) i:num)))))))))
      #|More_list.TABLE_0 =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). ((#=:fun(list('A),fun(list('A),bool)) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) (#NUMERAL:fun(num,num) #_0:num))) #NIL:list('A))))
      #|More_list.TABLE_SUC =  |- (#forall:fun(fun(fun(num,'A),bool),bool) (\f:fun(num,'A). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list('A),fun(list('A),bool)) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) (#SUC:fun(num,num) n:num))) ((#APPEND:fun(list('A),fun(list('A),list('A))) ((#TABLE:fun(fun(num,'A),fun(num,list('A))) f:fun(num,'A)) n:num)) ((#CONS:fun('A,fun(list('A),list('A))) (f:fun(num,'A) n:num)) #NIL:list('A))))))))
      #|More_list.LIST_EL_EQ =  |- (#forall:fun(fun(list('A),bool),bool) (\ul:list('A). (#forall:fun(fun(list('A),bool),bool) (\vl:list('A). ((#=:fun(bool,fun(bool,bool)) ((#=:fun(list('A),fun(list('A),bool)) ul:list('A)) vl:list('A))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('A),num) ul:list('A))) (#LENGTH:fun(list('A),num) vl:list('A)))) (#forall:fun(fun(num,bool),bool) (\j:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) j:num) (#LENGTH:fun(list('A),num) ul:list('A)))) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) j:num) ul:list('A))) ((#EL:fun(num,fun(list('A),'A)) j:num) vl:list('A))))))))))))
      #|More_list.LENGTH_L_SEQ =  |- ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list(num),num) ((#l_seq:fun(num,fun(num,list(num))) n:num) m:num))) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))
      #|More_list.EL_L_SEQ =  |- (#forall:fun(fun(num,bool),bool) (\i:num. (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) ((#-:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num))) ((#=:fun(num,fun(num,bool)) ((#EL:fun(num,fun(list(num),num)) i:num) ((#l_seq:fun(num,fun(num,list(num))) n:num) m:num))) ((#+:fun(num,fun(num,num)) n:num) i:num)))))))))
      #|More_list.L_SEQ_NIL =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#=:fun(list(num),fun(list(num),bool)) ((#l_seq:fun(num,fun(num,list(num))) n:num) m:num)) #NIL:list(num))) ((#<:fun(num,fun(num,bool)) m:num) n:num))))))
      #|More_list.L_SEQ_NN =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(list(num),fun(list(num),bool)) ((#l_seq:fun(num,fun(num,list(num))) n:num) n:num)) ((#CONS:fun(num,fun(list(num),list(num))) n:num) #NIL:list(num)))))
      #|More_list.L_SEQ_CONS =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)) ((#=:fun(list(num),fun(list(num),bool)) ((#l_seq:fun(num,fun(num,list(num))) n:num) m:num)) ((#CONS:fun(num,fun(list(num),list(num))) n:num) ((#l_seq:fun(num,fun(num,list(num))) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num))))))))
      #|More_list.LENGTH_BUTLAST =  |- (#forall:fun(fun(list('?1),bool),bool) (\l:list('?1). ((#=:fun(num,fun(num,bool)) (#LENGTH:fun(list('?1),num) (#BUTLAST:fun(list('?1),list('?1)) l:list('?1)))) ((#-:fun(num,fun(num,num)) (#LENGTH:fun(list('?1),num) l:list('?1))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|More_list.EL_BUTLAST =  |- (#forall:fun(fun(list('A),bool),bool) (\l:list('A). (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) i:num) ((#-:fun(num,fun(num,num)) (#LENGTH:fun(list('A),num) l:list('A))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun('A,fun('A,bool)) ((#EL:fun(num,fun(list('A),'A)) i:num) (#BUTLAST:fun(list('A),list('A)) l:list('A)))) ((#EL:fun(num,fun(list('A),'A)) i:num) l:list('A))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1055
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?2
      #|counter_genvar = _3717561:bool
      #|
    ),
  )
}
