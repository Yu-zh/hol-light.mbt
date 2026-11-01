// Translated from upstream Examples/inverse_bug_puzzle_tac.ml; edit this file directly.

///|
/// Examples/inverse_bug_puzzle_tac.ml:29
fn step_1() -> Unit raise {
  @preterm.new_type_abbrev("triple", @parser.parse_type("real^2#real^2#real^2"))
}

///|
/// `so`
pub fn so(x1 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let tac = x1
  @tactics.then_tac(@tactics.first_assum(fn(x3 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4 = @tactics.mp_tac(x3)
    fn(x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4(x5)
    }
  }), tac)
}

///|
/// `BuildExist`
pub fn buildexist(x6 : @kernel.Term, x7 : @kernel.Term) -> @kernel.Term raise {
  let x = x6
  let t = x7
  let try_type : (@kernel.HolType) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x8 : @kernel.HolType) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let tp = x8
    fn(x9 : @kernel.Term) -> @kernel.Term raise {
      let tm = x9
      try {
        @kernel.inst(@basics.type_match(@kernel.type_of(tm), tp, @list.List([])), tm)
      } catch {
        Failure(_) => tm
        e => raise e
      }
    }
  }
  let vars_match : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x10 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let tm1 = x10
    fn(x11 : @kernel.Term) -> @kernel.Term raise {
      let tm2 = x11
      let inst = try {
        @drule.term_match(@list.List([]), tm1, tm2)
      } catch {
        Failure(_) => (@list.List([]), @list.List([(tm2, tm1)]), @list.List([]))
        e => raise e
      }
      match inst {
        (Empty, Empty, _) => tm2
        _ => raise Failure("vars_match: no match")
      }
    }
  }
  let tp_1 = try {
    let t12 = @kernel.frees(t)
    @kernel.type_of(@lib.tryfind(vars_match(x), t12))
  } catch {
    Failure(_) => {
      let t13 = ("` not be found in\n  `" + (@printer.string_of_term(t) + "`"))
      @lib.warn(true, ("BuildExist: `" + (@printer.string_of_term(x) + t13)))
      @kernel.type_of(x)
    }
    e => raise e
  }
  let x_p = try_type(tp_1)(x)
  @bool.mk_exists(x_p, t)
}

///|
/// `consider`
pub fn consider(x14 : String, x15 : @kernel.Term, x16 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise], x17 : String) -> @tactics.Tactic raise {
  let vars_suchthat = x14
  let t = x15
  let prfs = x16
  let lab = x17
  let ident : (ArrayView[@lexer.Lexcode]) -> (String, ArrayView[@lexer.Lexcode]) raise = fn(x19 : ArrayView[@lexer.Lexcode]) -> (String, ArrayView[@lexer.Lexcode]) raise {
    match x19 {
      [@lexer.Lexcode::Ident(s), ..rest] if @printer.isalnum(s) => (s, rest)
      _ => raise @parserutil.Noparse
    }
  }
  let parse_using : (ArrayView[@lexer.Lexcode]) -> (@list.List[String], ArrayView[@lexer.Lexcode]) raise = @parserutil.many(ident)
  fn findsuchthat(x20 : Int64) -> Int64 raise {
    let n = x20
    if (@lib.string_sub(vars_suchthat, @lib.int63_to_int(n), 9) == "such that") {
      n
    } else {
      findsuchthat(@lib.add63(n, 1L))
    }
  }
  let n_1 = findsuchthat(1L)
  let vars = @lib.string_sub(vars_suchthat, 0, @lib.int63_to_int(@lib.sub63(n_1, 1L)))
  let xl = @lib.map(@parser.parse_term, (fn(x23 : String) -> @list.List[String] raise {
    (fn(x22 : ArrayView[@lexer.Lexcode]) -> @list.List[String] raise {
      (fn(x21 : (@list.List[String], ArrayView[@lexer.Lexcode])) -> @list.List[String] raise {
        x21.0
      })(parse_using(x22))
    })(@lexer.lex(x23))
  })(vars))
  let tm = @lib.itlist(buildexist, xl, t)
  match prfs {
    More(p, tail=ps) => {
      @lib.warn(!@list.List::is_empty(ps), "consider: additional subproofs ignored")
      @tactics.thenl(@tactics.subgoal_then(tm, @theorems.destruct_tac(("@" + (vars + ("." + lab))))), @list.List([p, @tactics.all_tac]))
    }
    Empty => raise Failure("consider: no subproof given")
  }
}

///|
/// `cases`
pub fn cases(x25 : String, x26 : @kernel.Term, x27 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> @tactics.Tactic raise {
  let sdestruct = x25
  let disjthm = x26
  let tac = x27
  let t29 = @tactics.first_x_assum(@theorems.destruct_tac(sdestruct))
  @tactics.then_tac(@tactics.subgoal_tac("", disjthm, tac), t29)
}

///|
/// `raa`
pub fn raa(x30 : String, x31 : @kernel.Term, x32 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let lab = x30
  let t = x31
  let tac = x32
  let t38 = @list.List([@theorems.intro_tac(lab), tac])
  @tactics.thenl(@tactics.subgoal_then(@bool.mk_imp(t, @term_syntax.parse_term("false")), fn(x35 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s36 = ((x34 : @kernel.Thm) => @tactics.label_tac(lab, x34))(x35)
    fn(x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s36(x37)
    }
  }), t38)
}

///|
/// VEC2_TAC
fn step_2() -> Unit raise {
  let t39 = @tactics.conv_tac(@calc_rat.real_ring)
  vec2_tac_c.set(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @vectors.forall_2(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_2(), @vectors.vector_add(), @vectors.vec(), @vectors.dot(), @vectors.orthogonal(), @vectors.basis(), @vectors.vector_neg(), @vectors.vector_sub(), @vectors.vector_mul(), @calc_num.arith()])), t39))
}

///|
let vec2_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VEC2_TAC")

///|
/// `VEC2_TAC`
pub fn vec2_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vec2_tac_c.get())(x)
}

///|
/// COLLINEAR_3_2Dzero
fn step_3() -> Unit raise {
  let t40 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.collinear_3_2d()])), vec2_tac)
  collinear_3_2dzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Cart[Real, Tybit0[Unit]], ∀ z : Cart[Real, Tybit0[Unit]], collinear({vec(0), y, z}) == (op_dollar(z, 1) * op_dollar(y, 2) == op_dollar(y, 1) * op_dollar(z, 2))"), t40))
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
fn step_4() -> Unit raise {
  let t41 = @meson.meson_tac(@list.List([@vectors.collinear_between_cases(), @vectors.between_refl()]))
  noncollinear_3impliesdistinct_c.set(@tactics.prove(@term_syntax.parse_term("!collinear({(a : Cart[Real, _]), (b : Cart[Real, _]), (c : Cart[Real, _])}) → !(a == b) && !(a == c) && !(b == c)"), t41))
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
fn step_5() -> Unit raise {
  let t42 = @meson.meson_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET({(A : _), (C : _), (B : _)}, {A, B, C}) && SUBSET({B, A, C}, {A, B, C}) && SUBSET({B, C, A}, {A, B, C}) && SUBSET({C, A, B}, {A, B, C}) && SUBSET({C, B, A}, {A, B, C})")), @vectors.collinear_subset()]))
  collinearsymmetry_c.set(@tactics.prove(@term_syntax.parse_term("collinear({(A : Cart[Real, _]), (B : Cart[Real, _]), (C : Cart[Real, _])}) → collinear({A, C, B}) && collinear({B, A, C}) && collinear({B, C, A}) && collinear({C, A, B}) && collinear({C, B, A})"), t42))
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
fn step_6() -> Unit raise {
  let t58 = so(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @vectors.forall_2(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_2(), @vectors.vector_add(), @vectors.vector_mul(), @calc_num.arith()])))
  let t56 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "MatMult xDef")(@list.List([@realax.real_mul_sym()]))])
  let t57 = @tactics.subgoal_tac("", @term_syntax.parse_term("op_dollar((x : Cart[Real, Tybit0[Unit]]), 1) * op_dollar((v : Cart[Real, Tybit0[Unit]]), 1) + op_dollar(x, 2) * op_dollar((w : Cart[Real, Tybit0[Unit]]), 1) == op_dollar((u : Cart[Real, Tybit0[Unit]]), 1) && op_dollar(x, 1) * op_dollar(v, 2) + op_dollar(x, 2) * op_dollar(w, 2) == op_dollar(u, 2)"), t56)
  let t54 = @term_syntax.parse_term("op_dollar((x : Cart[Real, Tybit0[Unit]]), 2)")
  let t55 = @tactics.map_every(fn(x51 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s52 = @tactics.exists_tac(x51)
    fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s52(x53)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar((x : Cart[Real, Tybit0[Unit]]), 1)"), t54]))
  let t49 = @list.List([so(@meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((r : Num) < (n : Num)) && r <= MIN(n, n) → r == n")), @determinants.det_eq_0_rank(), @vectors.rank_bound(), @vectors.matrix_full_linear_equations()])))])
  let t50 = consider("x such that", @term_syntax.parse_term("matrix_vector_mul((M : Cart[Cart[Real, Tybit0[Unit]], Tybit0[Unit]]), (x : Cart[Real, Tybit0[Unit]])) == (u : Cart[Real, Tybit0[Unit]])"), t49, "xDef")
  let t47 = @list.List([@tactics.then_tac(@tactics.hyp_tac(@simp.simp_tac, "H1' Mexists")(@list.List([@vectors.matrix_vector_mul(), @cart.dimindex_2(), @vectors.sum_2(), @vectors.transp_component(), @vectors.vector_2(), @cart.lambda_beta(), @calc_num.arith(), @cart.cart_eq(), @vectors.forall_2(), @determinants.det_2()])), vec2_tac)])
  let t48 = @tactics.subgoal_tac("MatMult", @term_syntax.parse_term("!(det((M : Cart[Cart[Real, Tybit0[Unit]], Tybit0[Unit]])) == real_of_num(0)) && (∀ x : Cart[Real, Tybit0[Unit]], op_dollar(matrix_vector_mul(M, x), 1) == op_dollar((v : Cart[Real, Tybit0[Unit]]), 1) * op_dollar(x, 1) + op_dollar((w : Cart[Real, Tybit0[Unit]]), 1) * op_dollar(x, 2) && op_dollar(matrix_vector_mul(M, x), 2) == op_dollar(v, 2) * op_dollar(x, 1) + op_dollar(w, 2) * op_dollar(x, 2))"), t47)
  let t45 = @list.List([@meson.meson_tac(@list.List([]))])
  let t46 = consider("M such that", @term_syntax.parse_term("(M : Cart[Cart[Real, Tybit0[Unit]], Tybit0[Unit]]) == transp(vector([(v : Cart[Real, Tybit0[Unit]]), (w : Cart[Real, Tybit0[Unit]])]))"), t45, "Mexists")
  let t43 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([collinear_3_2dzero(), @realarith.real_sub_0()]))])
  let t44 = @tactics.subgoal_tac("H1'", @term_syntax.parse_term("!(op_dollar((v : Cart[Real, Tybit0[Unit]]), 1) * op_dollar((w : Cart[Real, Tybit0[Unit]]), 2) - op_dollar(w, 1) * op_dollar(v, 2) == real_of_num(0))"), t43)
  let t59 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall u v w; H1"), t44), t46), t48), t50), t55), t57), t58)
  noncollinear_2span_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, Tybit0[Unit]], ∀ v : Cart[Real, Tybit0[Unit]], ∀ w : Cart[Real, Tybit0[Unit]], !collinear({vec(0), v, w}) → (∃ s : Real, ∃ t : Real, op_pct(s, v) + op_pct(t, w) == u)"), t59))
}

///|
let noncollinear_2span_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Noncollinear_2Span")

///|
/// `Noncollinear_2Span`
pub fn noncollinear_2span() -> @kernel.Thm {
  noncollinear_2span_c.get()
}

///|
/// oriented_area
fn step_7() -> Unit raise {
  oriented_area_c.set(@pair.new_definition(@term_syntax.parse_term("(oriented_area : ((Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) -> Real)(((a : Cart[Real, Tybit0[Unit]]), (b : Cart[Real, Tybit0[Unit]]), (c : Cart[Real, Tybit0[Unit]]))) == ((op_dollar(b, 1) - op_dollar(a, 1)) * (op_dollar(c, 2) - op_dollar(a, 2)) - (op_dollar(c, 1) - op_dollar(a, 1)) * (op_dollar(b, 2) - op_dollar(a, 2))) / real_of_num(2)")))
}

///|
let oriented_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oriented_area")

///|
/// `oriented_area`
pub fn oriented_area() -> @kernel.Thm {
  oriented_area_c.get()
}

///|
/// oriented_areaSymmetry
fn step_8() -> Unit raise {
  let t60 = @tactics.then_tac(@simp.rewrite_tac(@list.List([oriented_area()])), vec2_tac)
  oriented_areasymmetry_c.set(@tactics.prove(@term_syntax.parse_term("oriented_area(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]]))) == oriented_area(((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]))) → oriented_area((B, C, A)) == oriented_area((B', C', A')) && oriented_area((C, A, B)) == oriented_area((C', A', B')) && oriented_area((A, C, B)) == oriented_area((A', C', B')) && oriented_area((B, A, C)) == oriented_area((B', A', C')) && oriented_area((C, B, A)) == oriented_area((C', B', A'))"), t60))
}

///|
let oriented_areasymmetry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oriented_areaSymmetry")

///|
/// `oriented_areaSymmetry`
pub fn oriented_areasymmetry() -> @kernel.Thm {
  oriented_areasymmetry_c.get()
}

///|
/// move
fn step_9() -> Unit raise {
  move__c.set(@pair.new_definition(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], (move_ : ((Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) -> Bool)((A, B, C), (A', B', C')) == (B == B' && C == C' && collinear({vec(0), C - B, A' - A}) || A == A' && C == C' && collinear({vec(0), C - A, B' - B}) || A == A' && B == B' && collinear({vec(0), B - A, C' - C}))")))
}

///|
let move__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("move")

///|
/// `move`
pub fn move_() -> @kernel.Thm {
  move__c.get()
}

///|
/// moveInvariant
fn step_10() -> Unit raise {
  let t61 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), move_(), oriented_area(), @vectors.collinear_lemma(), @vectors.vector_mul()])), vec2_tac)
  moveinvariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), move_(p, p') → oriented_area(p) == oriented_area(p')"), t61))
}

///|
let moveinvariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("moveInvariant")

///|
/// `moveInvariant`
pub fn moveinvariant() -> @kernel.Thm {
  moveinvariant_c.get()
}

///|
/// reachable
fn step_11() -> Unit raise {
  reachable_c.set(@pair.new_definition(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), (reachable : ((Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) -> Bool)(p, p') == (∃ n : Num, ∃ s : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), s(0) == p && s(n) == p' && (∀ m : Num, 0 <= m && m < n → move_(s(m), s(SUC(m)))))")))
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
fn step_12() -> Unit raise {
  reachablen_c.set(@pair.new_definition(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ n : Num, (reachableN : ((Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), Num) -> Bool)(p, p', n) == (∃ s : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), s(0) == p && s(n) == p' && (∀ m : Num, 0 <= m && m < n → move_(s(m), s(SUC(m)))))")))
}

///|
let reachablen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableN")

///|
/// `reachableN`
pub fn reachablen() -> @kernel.Thm {
  reachablen_c.get()
}

///|
/// ReachLemma
fn step_13() -> Unit raise {
  let t62 = @simp.rewrite_tac(@list.List([reachable(), reachablen()]))
  reachlemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachable(p, p') == (∃ n : Num, reachableN(p, p', n))"), t62))
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
fn step_14() -> Unit raise {
  let t83 = @tactics.hyp_tac(@meson.meson_tac, "0CLAUSE Imp1 Imp2")(@list.List([]))
  let t80 = @tactics.hyp_tac(@meson.meson_tac, "sDef move_qp'")(@list.List([@arith.lt_0(), @arith.lt_refl(), @arith.lt(), @arith.lt_suc()]))
  let t79 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => if m < SUC((n : Num)) { (s : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))(m) } else { (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) }"))
  let t78 = @simp.rewrite_tac(@list.List([reachablen(), @arith.lt(), @arith.le_0()]))
  let t76 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "nReach")(@list.List([reachablen(), @arith.lt(), @arith.le_0()]))])
  let t77 = consider("s such that", @term_syntax.parse_term("(s : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))(0) == (p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) && s((n : Num)) == (q : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) && (∀ m : Num, m < n → move_(s(m), s(SUC(m))))"), t76, "sDef")
  let t75 = @theorems.intro_tac("forall q; nReach; move_qp'")
  let t74 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.left_imp_exists_thm()]))
  let t81 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall n"), t74), t75), t77), t78), t79), t80)])
  let t82 = @tactics.subgoal_tac("Imp2", @term_syntax.parse_term("∀ n : Num, (∃ q : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachableN((p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), q, n) && move_(q, (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])))) → reachableN(p, p', SUC(n))"), t81)
  let t71 = @tactics.hyp_tac(@meson.meson_tac, "sDef qDef")(@list.List([@arith.le_0(), reachablen(), @arith.lt()]))
  let t69 = @list.List([@meson.meson_tac(@list.List([]))])
  let t70 = consider("q such that", @term_syntax.parse_term("(q : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == (s : (_) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))((n : _))"), t69, "qDef")
  let t67 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([@arith.le_0(), reachablen()]))])
  let t68 = consider("s such that", @term_syntax.parse_term("(s : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))(0) == (p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) && s(SUC((n : Num))) == (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) && (∀ m : Num, m < SUC(n) → move_(s(m), s(SUC(m))))"), t67, "sDef")
  let t72 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall n; H1"), t68), t70), t71)])
  let t73 = @tactics.subgoal_tac("Imp1", @term_syntax.parse_term("∀ n : Num, reachableN((p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), SUC(n)) → (∃ q : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachableN(p, q, n) && move_(q, p'))"), t72)
  let t65 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "s0exists")(@list.List([@arith.le_0(), reachablen(), @arith.lt()]))])
  let t66 = @tactics.subgoal_tac("0CLAUSE", @term_syntax.parse_term("reachableN((p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 0) == (p == p')"), t65)
  let t63 = @list.List([@meson.meson_tac(@list.List([]))])
  let t64 = consider("s0 such that", @term_syntax.parse_term("(s0 : (Num) -> (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == ((m : Num) => (p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])))"), t63, "s0exists")
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall p p'"), t64), t66), t73), t82), t83)
  reachablen_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachableN(p, p', 0) == (p == p') && (∀ n : Num, reachableN(p, p', SUC(n)) == (∃ q : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachableN(p, q, n) && move_(q, p')))"), t84))
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
fn step_15() -> Unit raise {
  let t85 = @meson.asm_meson_tac(@list.List([reachablen_clauses(), moveinvariant()]))
  let t86 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([reachlemma(), @theorems.left_imp_exists_thm(), @theorems.swap_forall_thm()])), @nums.induct_tac), t85)
  reachableinvariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∀ p' : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), reachable(p, p') → oriented_area(p) == oriented_area(p')"), t86))
}

///|
let reachableinvariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachableInvariant")

///|
/// `reachableInvariant`
pub fn reachableinvariant() -> @kernel.Thm {
  reachableinvariant_c.get()
}

///|
/// move2Cond
fn step_16() -> Unit raise {
  move2cond_c.set(@pair.new_definition(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], (move2Cond : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]) -> Bool)(A, B, A', B') == (!collinear({B, A, A'}) && !collinear({A', B, B'}) || !collinear({A, B, B'}) && !collinear({B', A, A'}))")))
}

///|
let move2cond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("move2Cond")

///|
/// `move2Cond`
pub fn move2cond() -> @kernel.Thm {
  move2cond_c.get()
}

///|
/// reachableN_One
fn step_17() -> Unit raise {
  let t87 = @meson.meson_tac(@list.List([@arith.one(), reachablen(), reachablen_clauses()]))
  reachablen_one_c.set(@tactics.prove(@term_syntax.parse_term("reachableN((P0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 1) == move_(P0, P1)"), t87))
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
fn step_18() -> Unit raise {
  let t88 = @meson.meson_tac(@list.List([@arith.two(), reachablen_one(), reachablen_clauses()]))
  reachablen_two_c.set(@tactics.prove(@term_syntax.parse_term("reachableN((P0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 2) == (∃ P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), move_(P0, P1) && move_(P1, P2))"), t88))
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
fn step_19() -> Unit raise {
  let t89 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 == SUC(2)")), reachablen_two(), reachablen_clauses()]))
  reachablen_three_c.set(@tactics.prove(@term_syntax.parse_term("reachableN((P0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (P3 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 3) == (∃ P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), move_(P0, P1) && move_(P1, P2) && move_(P2, P3))"), t89))
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
fn step_20() -> Unit raise {
  let t90 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 == SUC(3)")), reachablen_three(), reachablen_clauses()]))
  reachablen_four_c.set(@tactics.prove(@term_syntax.parse_term("reachableN((P0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (P4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 4) == (∃ P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P3 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), move_(P0, P1) && move_(P1, P2) && move_(P2, P3) && move_(P3, P4))"), t90))
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
fn step_21() -> Unit raise {
  let t91 = @meson.meson_tac(@list.List([reachablen_four()]))
  let t92 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("5 == SUC(4)")), reachablen_clauses()])), t91)
  reachablen_five_c.set(@tactics.prove(@term_syntax.parse_term("reachableN((P0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (P5 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 5) == (∃ P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P3 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ P4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), move_(P0, P1) && move_(P1, P2) && move_(P2, P3) && move_(P3, P4) && move_(P4, P5))"), t92))
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
fn step_22() -> Unit raise {
  let t95 = @meson.meson_tac(@list.List([]))
  let t94 = so(@simp.rewrite_tac(@list.List([move_()])))
  let t93 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_3_2dzero()])), vec2_tac)])
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_tac("", @term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], collinear({vec(0), C - B, A' - A}) → collinear({vec(0), B - C, A' - A})"), t93), t94), t95)
  movesymmetry_c.set(@tactics.prove(@term_syntax.parse_term("move_(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), ((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]))) → move_((B, C, A), (B', C', A')) && move_((C, A, B), (C', A', B')) && move_((A, C, B), (A', C', B')) && move_((B, A, C), (B', A', C')) && move_((C, B, A), (C', B', A'))"), t96))
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
fn step_23() -> Unit raise {
  let t114 = @tactics.hyp_tac(@simp.simp_tac, "nStep XYZexists")(@list.List([movesymmetry()]))
  let t109 = @term_syntax.parse_term("((Z : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]]))")
  let t110 = @term_syntax.parse_term("((Y : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]]), (Z : Cart[Real, Tybit0[Unit]]))")
  let t111 = @term_syntax.parse_term("((X : Cart[Real, Tybit0[Unit]]), (Z : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]))")
  let t112 = @term_syntax.parse_term("((Z : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]))")
  let t113 = @tactics.map_every(fn(x106 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s107 = @tactics.exists_tac(x106)
    fn(x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s107(x108)
    }
  }, @list.List([@term_syntax.parse_term("((Y : Cart[Real, Tybit0[Unit]]), (Z : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]]))"), t112, t111, t110, t109]))
  let t105 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm()]))
  let t104 = @theorems.intro_tac("XYZexists")
  let t101 = @term_syntax.parse_term("(Z : Cart[Real, Tybit0[Unit]])")
  let t102 = @term_syntax.parse_term("(Y : Cart[Real, Tybit0[Unit]])")
  let t103 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(X : Cart[Real, Tybit0[Unit]])"), t102, t101]))
  let t100 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @pair.forall_pair_thm()]))
  let t99 = @theorems.intro_tac("forall n;nStep; forall A B C A' B' C'")
  let t98 = @simp.simp_tac(@list.List([@pair.pair_eq()]))
  let t97 = @simp.rewrite_tac(@list.List([reachablen_clauses()]))
  let t115 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@nums.num_induction()), t97), t98), t99), t100), t103), t104), t105), t113), t114)
  reachablensymmetry_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], reachableN((A, B, C), (A', B', C'), n) → reachableN((B, C, A), (B', C', A'), n) && reachableN((C, A, B), (C', A', B'), n) && reachableN((A, C, B), (A', C', B'), n) && reachableN((B, A, C), (B', A', C'), n) && reachableN((C, B, A), (C', B', A'), n)"), t115))
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
fn step_24() -> Unit raise {
  let t116 = @tactics.conv_tac(@calc_rat.real_ring)
  let t117 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.collinear_3_2d(), oriented_area()])), t116)
  oriented_area_collinear_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : _, ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], oriented_area((A, B, C)) == oriented_area((A', B', (C' : Cart[Real, Tybit0[Unit]]))) → collinear({A, B, C}) == collinear({A', B', C'})"), t117))
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
fn step_25() -> Unit raise {
  let t133 = so(@meson.meson_tac(@list.List([move_()])))
  let t131 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "")(@list.List([@vectors.collinear_lemma()])))])
  let t132 = @tactics.subgoal_tac("", @term_syntax.parse_term("collinear({vec(0), (B : Cart[Real, Tybit0[Unit]]) - (A : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]]) - (C : Cart[Real, Tybit0[Unit]])}) && collinear({vec(0), X - B, (A' : Cart[Real, Tybit0[Unit]]) - A})"), t131)
  let t129 = @list.List([@tactics.then_tac(so(@tactics.hyp_tac(@simp.rewrite_tac, "Xexists")(@list.List([]))), vec2_tac)])
  let t130 = @tactics.subgoal_tac("", @term_syntax.parse_term("(A' : Cart[Real, Tybit0[Unit]]) - (A : Cart[Real, Tybit0[Unit]]) == op_pct((t : Real), (X : Cart[Real, Tybit0[Unit]]) - (B : Cart[Real, Tybit0[Unit]])) && X - (C : Cart[Real, Tybit0[Unit]]) == op_pct(-(s : Real), B - A)"), t129)
  let t127 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "rExists tNonzero")(@list.List([@real.real_div_lmul()])))])
  let t128 = @tactics.subgoal_tac("", @term_syntax.parse_term("(A' : Cart[Real, Tybit0[Unit]]) - (A : Cart[Real, Tybit0[Unit]]) == op_pct((t : Real) * (s : Real), A - (B : Cart[Real, Tybit0[Unit]])) + op_pct(t, (C : Cart[Real, Tybit0[Unit]]) - B)"), t127)
  let t125 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "rExists")(@list.List([]))])
  let t126 = consider("s X such that", @term_syntax.parse_term("(s : Real) == (r : Real) / (t : Real) && (X : Cart[Real, Tybit0[Unit]]) == (C : Cart[Real, Tybit0[Unit]]) + op_pct(s, (A : Cart[Real, Tybit0[Unit]]) - (B : Cart[Real, Tybit0[Unit]]))"), t125, "Xexists")
  let t123 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "add0vector_mul H2'")(@list.List([])))])
  let t124 = @tactics.subgoal_tac("tNonzero", @term_syntax.parse_term("!((t : Real) == real_of_num(0))"), t123)
  let t121 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([@vectors.collinear_3(), noncollinear_2span()]))])
  let t122 = consider("r t such that", @term_syntax.parse_term("(A' : Cart[Real, Tybit0[Unit]]) - (A : Cart[Real, Tybit0[Unit]]) == op_pct((r : Real), A - (B : Cart[Real, Tybit0[Unit]])) + op_pct((t : Real), (C : Cart[Real, Tybit0[Unit]]) - B)"), t121, "rExists")
  let t119 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([@vectors.collinear_3(), @vectors.collinear_lemma()])))])
  let t120 = @tactics.subgoal_tac("H2'", @term_syntax.parse_term("!(∃ r : Real, (A' : Cart[Real, Tybit0[Unit]]) - (A : Cart[Real, Tybit0[Unit]]) == op_pct(r, A - (B : Cart[Real, Tybit0[Unit]])))"), t119)
  let t118 = @tactics.subgoal_tac("add0vector_mul", @term_syntax.parse_term("∀ r : Real, op_pct(r, (A : Cart[Real, Tybit0[Unit]]) - (B : Cart[Real, Tybit0[Unit]])) == op_pct(-r, B - A) && op_pct(r, A - B) == op_pct(r, A - B) + op_pct(real_of_num(0), (C : Cart[Real, Tybit0[Unit]]) - B)"), @list.List([vec2_tac]))
  let t134 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A'; H1 H2"), t118), t120), t122), t124), t126), t128), t130), t132), t133)
  basic2move_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && !collinear({B, A, A'}) → (∃ X : Cart[Real, Tybit0[Unit]], move_((A, B, C), (A, B, X)) && move_((A, B, X), (A', B, X)))"), t134))
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
fn step_26() -> Unit raise {
  let t145 = so(@tactics.hyp_tac(@meson.meson_tac, "ABX")(@list.List([])))
  let t143 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "BA'Y")(@list.List([movesymmetry()]))])
  let t144 = @tactics.subgoal_tac("", @term_syntax.parse_term("move_(((A' : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]])), (A', B, (Y : Cart[Real, Tybit0[Unit]]))) && move_((A', B, Y), (A', (B' : Cart[Real, Tybit0[Unit]]), Y))"), t143)
  let t141 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([basic2move_thm()])))])
  let t142 = consider("Y such that", @term_syntax.parse_term("move_(((B : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]])), (B, A', (Y : Cart[Real, Tybit0[Unit]]))) && move_((B, A', Y), ((B' : Cart[Real, Tybit0[Unit]]), A', Y))"), t141, "BA'Y")
  let t139 = @list.List([so(@meson.meson_tac(@list.List([collinearsymmetry()])))])
  let t140 = @tactics.subgoal_tac("", @term_syntax.parse_term("!collinear({(B : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]])})"), t139)
  let t137 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([moveinvariant(), oriented_area_collinear_cong()])))])
  let t138 = @tactics.subgoal_tac("", @term_syntax.parse_term("!collinear({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (X : Cart[Real, Tybit0[Unit]])}) && !collinear({(A' : Cart[Real, Tybit0[Unit]]), B, X})"), t137)
  let t135 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1 H2")(@list.List([basic2move_thm()]))])
  let t136 = consider("X such that", @term_syntax.parse_term("move_(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), (A, B, (X : Cart[Real, Tybit0[Unit]]))) && move_((A, B, X), ((A' : Cart[Real, Tybit0[Unit]]), B, X))"), t135, "ABX")
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B'; H1; H2"), t136), t138), t140), t142), t144), t145)
  fourstepmoveab_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) → !collinear({B, A, A'}) && !collinear({A', B, B'}) → (∃ X : Cart[Real, Tybit0[Unit]], ∃ Y : Cart[Real, Tybit0[Unit]], move_((A, B, C), (A, B, X)) && move_((A, B, X), (A', B, X)) && move_((A', B, X), (A', B, Y)) && move_((A', B, Y), (A', B', Y)))"), t146))
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
fn step_27() -> Unit raise {
  let t156 = @tactics.hyp_tac(@meson.meson_tac, "BAX")(@list.List([movesymmetry(), reachablen_four()]))
  let t154 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "Case2")(@list.List([fourstepmoveab()])))])
  let t155 = consider("X Y such that", @term_syntax.parse_term("move_(((B : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), (B, A, (X : Cart[Real, Tybit0[Unit]]))) && move_((B, A, X), ((B' : Cart[Real, Tybit0[Unit]]), A, X)) && move_((B', A, X), (B', A, (Y : Cart[Real, Tybit0[Unit]]))) && move_((B', A, Y), (B', (A' : Cart[Real, Tybit0[Unit]]), Y))"), t154, "BAX")
  let t152 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([collinearsymmetry()]))])
  let t153 = @tactics.subgoal_tac("", @term_syntax.parse_term("!collinear({(B : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])})"), t152)
  let t149 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([collinearsymmetry()]))])
  let t150 = @tactics.subgoal_tac("", @term_syntax.parse_term("!collinear({(B : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])})"), t149)
  let t151 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([fourstepmoveab(), reachablen_four()]))), t150])
  let t147 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([move2cond()]))])
  let t148 = cases("Case1 | Case2", @term_syntax.parse_term("!collinear({(B : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]])}) && !collinear({A', B, (B' : Cart[Real, Tybit0[Unit]])}) || !collinear({A, B, B'}) && !collinear({B', A, A'})"), t147)
  let t157 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B'; H1 H2"), t148), t151), t153), t155), t156)
  fourstepmoveabbareach_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && move2Cond(A, B, A', B') → (∃ Y : Cart[Real, Tybit0[Unit]], reachableN((A, B, C), (A', B', Y), 4))"), t157))
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
fn step_28() -> Unit raise {
  let t164 = so(@tactics.hyp_tac(@meson.meson_tac, "Distinct H2 H2' set4symmetry")(@list.List([collinearsymmetry(), @vectors.collinear_4_3(), @vectors.collinear_subset()])))
  let t162 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H3")(@list.List([move2cond()]))])
  let t163 = cases("Case1 | Case2 | Case3 | Case4", @term_syntax.parse_term("collinear({(B : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]])}) && collinear({A, B, (B' : Cart[Real, Tybit0[Unit]])}) || collinear({B, A, A'}) && collinear({B', A, A'}) || collinear({A', B, B'}) && collinear({A, B, B'}) || collinear({A', B, B'}) && collinear({B', A, A'})"), t162)
  let t160 = @list.List([@sets.set_tac(@list.List([]))])
  let t161 = @tactics.subgoal_tac("set4symmetry", @term_syntax.parse_term("SUBSET({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]])}, {A, A', B, B'}) && SUBSET({A, B, A', B'}, {B, B', A', A}) && SUBSET({A, B, A', B'}, {A', B', B, A})"), t160)
  let t158 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1 H1'")(@list.List([noncollinear_3impliesdistinct()]))])
  let t159 = @tactics.subgoal_tac("Distinct", @term_syntax.parse_term("!((A : Cart[Real, Tybit0[Unit]]) == (B : Cart[Real, Tybit0[Unit]])) && !((A' : Cart[Real, Tybit0[Unit]]) == (B' : Cart[Real, Tybit0[Unit]]))"), t158)
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1 H1' H2 H2' H3"), t159), t161), t163), t164)
  notmove2impliescollinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && !collinear({A', B', C'}) && !(A == A') && !(B == B') && !move2Cond(A, B, A', B') → collinear({A, B, A', B'})"), t165))
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
fn step_29() -> Unit raise {
  let t174 = so(@tactics.hyp_tac(@meson.meson_tac, "H1 H1'")(@list.List([])))
  let t172 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "3subset4 H2a H2b H2c")(@list.List([@vectors.collinear_subset(), @vectors.collinear_3_trans()])))])
  let t173 = @tactics.subgoal_tac("", @term_syntax.parse_term("collinear({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])})"), t172)
  let t170 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1 H1' H2a H2b H2c")(@list.List([collinearsymmetry(), notmove2impliescollinear()])))])
  let t171 = @tactics.subgoal_tac("", @term_syntax.parse_term("collinear({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]])}) && collinear({B, (C : Cart[Real, Tybit0[Unit]]), B', (C' : Cart[Real, Tybit0[Unit]])})"), t170)
  let t168 = @tactics.hyp_tac(@meson.meson_tac, "Con")(@list.List([]))
  let t169 = raa("Con", @term_syntax.parse_term("!move2Cond((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]])) && !move2Cond(B, (C : Cart[Real, Tybit0[Unit]]), B', (C' : Cart[Real, Tybit0[Unit]]))"), t168)
  let t166 = @list.List([@sets.set_tac(@list.List([]))])
  let t167 = @tactics.subgoal_tac("3subset4", @term_syntax.parse_term("SUBSET({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]])}, {A, B, (A' : Cart[Real, Tybit0[Unit]]), B'}) && SUBSET({B, B', (C : Cart[Real, Tybit0[Unit]])}, {B, C, B', (C' : Cart[Real, Tybit0[Unit]])})"), t166)
  let t175 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1 H1' H2a H2b H2c"), t167), t169), t171), t173), t174)
  distinctimplies2moveable_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && !collinear({A', B', C'}) && !(A == A') && !(B == B') && !(C == C') → move2Cond(A, B, A', B') || move2Cond(B, C, B', C')"), t175))
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
fn step_30() -> Unit raise {
  let t183 = so(@tactics.hyp_tac(@meson.meson_tac, "H2 easy_set H1")(@list.List([@vectors.collinear_4_3(), @vectors.collinear_subset()])))
  let t182 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1 H2 easy_set")(@list.List([notmove2impliescollinear(), @vectors.collinear_subset(), collinearsymmetry()])))])
  let t184 = @tactics.then_tac(@tactics.subgoal_tac("", @term_syntax.parse_term("collinear({(B : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]])}) && collinear({B, B', (C : Cart[Real, Tybit0[Unit]])})"), t182), t183)
  let t185 = so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([fourstepmoveabbareach()])))
  let t181 = @tactics.hyp_tac(@meson.meson_tac, "BCX")(@list.List([reachablen_two(), reachablensymmetry()]))
  let t180 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "easy_set H1 H2")(@list.List([collinearsymmetry(), basic2move_thm()])))])
  let t186 = @list.List([@tactics.then_tac(consider("X such that", @term_syntax.parse_term("move_(((B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]])), (B, C, (X : Cart[Real, Tybit0[Unit]]))) && move_((B, C, X), ((B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]), X))"), t180, "BCX"), t181), t185, t184])
  let t178 = @list.List([@meson.meson_tac(@list.List([]))])
  let t179 = cases("Ncol | move | col_Nmove", @term_syntax.parse_term("!collinear({(C : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]])}) || move2Cond((A : Cart[Real, Tybit0[Unit]]), B, (A' : Cart[Real, Tybit0[Unit]]), B') || collinear({C, B, B'}) && !move2Cond(A, B, A', B')"), t178)
  let t176 = @list.List([@sets.set_tac(@list.List([]))])
  let t177 = @tactics.subgoal_tac("easy_set", @term_syntax.parse_term("SUBSET({(B : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]])}, {A, B, (A' : Cart[Real, Tybit0[Unit]]), B'}) && SUBSET({A, B, (C : Cart[Real, Tybit0[Unit]])}, {B, B', A, C})"), t176)
  let t187 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1; H2"), t177), t179), t186)
  samecdiffab_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && !collinear({A', B', C'}) → C == C' && !(A == A') && !(B == B') → (∃ Y : Cart[Real, Tybit0[Unit]], reachableN((A, B, C), (Y, B', C'), 2) || reachableN((A, B, C), (A', B', Y), 4))"), t187))
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
fn step_31() -> Unit raise {
  let t194 = so(@tactics.hyp_tac(@meson.meson_tac, "H1  H1'")(@list.List([distinctimplies2moveable(), fourstepmoveabbareach(), reachablensymmetry(), reachablen_four()])))
  let t193 = @tactics.hyp_tac(@simp.simp_tac, "easy_arith")(@list.List([]))
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("4")), t193), t194)
  let t196 = so(@tactics.hyp_tac(@meson.meson_tac, "H1 H1' easy_arith")(@list.List([samecdiffab(), reachablensymmetry()])))
  let t197 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "easy_arith")(@list.List([reachablen_clauses()]))), t196, t195])
  let t191 = @list.List([@meson.meson_tac(@list.List([]))])
  let t192 = cases("case01 | case2 | case3", @term_syntax.parse_term("((A : Cart[Real, Tybit0[Unit]]) == (A' : Cart[Real, Tybit0[Unit]]) && (B : Cart[Real, Tybit0[Unit]]) == (B' : Cart[Real, Tybit0[Unit]]) && (C : Cart[Real, Tybit0[Unit]]) == (C' : Cart[Real, Tybit0[Unit]]) || A == A' && B == B' && !(C == C') || A == A' && !(B == B') && C == C' || !(A == A') && B == B' && C == C') || (A == A' && !(B == B') && !(C == C') || !(A == A') && B == B' && !(C == C') || !(A == A') && !(B == B') && C == C') || !(A == A') && !(B == B') && !(C == C')"), t191)
  let t190 = @tactics.subgoal_tac("easy_arith", @term_syntax.parse_term("0 < 5 && 2 < 5 && 3 < 5 && 4 < 5"), @list.List([@int.arith_tac]))
  let t188 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([collinearsymmetry()]))])
  let t189 = @tactics.subgoal_tac("H1'", @term_syntax.parse_term("!collinear({(B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]]), (A : Cart[Real, Tybit0[Unit]])}) && !collinear({(B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]), (A' : Cart[Real, Tybit0[Unit]])}) && !collinear({C, A, B}) && !collinear({C', A', B'})"), t188)
  let t198 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1"), t189), t190), t192), t197)
  fourmovestocorrecttwo_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) && !collinear({A', B', C'}) → (∃ n : Num, n < 5 && (∃ Y : Cart[Real, Tybit0[Unit]], reachableN((A, B, C), (A', B', Y), n) || reachableN((A, B, C), (A', Y, C'), n) || reachableN((A, B, C), (Y, B', C'), n)))"), t198))
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
fn step_32() -> Unit raise {
  let t199 = @tactics.then_tac(@simp.rewrite_tac(@list.List([move_(), oriented_area(), collinear_3_2dzero()])), vec2_tac)
  correctfinalpoint_c.set(@tactics.prove(@term_syntax.parse_term("oriented_area(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]]))) == oriented_area((A, B, (C' : Cart[Real, Tybit0[Unit]]))) → move_((A, B, C), (A, B, C'))"), t199))
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
fn step_33() -> Unit raise {
  let t219 = so(@tactics.hyp_tac(@meson.meson_tac, "YB'C' 2Correct")(@list.List([reachablen_clauses(), @arith.le_suc_lt()])))
  let t217 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "Distinct")(@list.List([correctfinalpoint(), movesymmetry()])))])
  let t218 = @tactics.subgoal_tac("", @term_syntax.parse_term("move_(((Y : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]])), ((A' : Cart[Real, Tybit0[Unit]]), B', C'))"), t217)
  let t216 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([reachlemma(), reachableinvariant(), oriented_areasymmetry()])))])
  let t220 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_tac("", @term_syntax.parse_term("oriented_area(((B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]))) == oriented_area((B', C', (A' : Cart[Real, Tybit0[Unit]])))"), t216), t218), t219)
  let t215 = so(@tactics.hyp_tac(@meson.meson_tac, "A'YC' 2Correct")(@list.List([reachablen_clauses(), @arith.le_suc_lt()])))
  let t213 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "Distinct")(@list.List([correctfinalpoint(), movesymmetry()])))])
  let t214 = @tactics.subgoal_tac("", @term_syntax.parse_term("move_(((A' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]])), (A', (B' : Cart[Real, Tybit0[Unit]]), C'))"), t213)
  let t212 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([reachlemma(), reachableinvariant(), oriented_areasymmetry()])))])
  let t221 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_tac("", @term_syntax.parse_term("oriented_area(((A' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]))) == oriented_area((A', C', (B' : Cart[Real, Tybit0[Unit]])))"), t212), t214), t215)
  let t211 = so(@tactics.hyp_tac(@meson.meson_tac, "A'B'Y 2Correct")(@list.List([reachablen_clauses(), @arith.le_suc_lt()])))
  let t209 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "Distinct")(@list.List([correctfinalpoint()])))])
  let t210 = @tactics.subgoal_tac("", @term_syntax.parse_term("move_(((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]])), (A', B', (C' : Cart[Real, Tybit0[Unit]])))"), t209)
  let t208 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H2")(@list.List([reachlemma(), reachableinvariant()])))])
  let t222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_tac("", @term_syntax.parse_term("oriented_area(((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]]))) == oriented_area((A', B', (C' : Cart[Real, Tybit0[Unit]])))"), t208), t210), t211), t221, t220])
  let t206 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "2Correct")(@list.List([]))])
  let t207 = cases("A'B'Y | A'YC' | YB'C'", @term_syntax.parse_term("reachableN(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), ((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]])), (n : Num)) || reachableN((A, B, C), (A', Y, (C' : Cart[Real, Tybit0[Unit]])), n) || reachableN((A, B, C), (Y, B', C'), n)"), t206)
  let t204 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1 H1'")(@list.List([fourmovestocorrecttwo()]))])
  let t205 = consider("n Y such that", @term_syntax.parse_term("(n : Num) < 5 && (reachableN(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), ((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (Y : Cart[Real, Tybit0[Unit]])), n) || reachableN((A, B, C), (A', Y, (C' : Cart[Real, Tybit0[Unit]])), n) || reachableN((A, B, C), (Y, B', C'), n))"), t204, "2Correct")
  let t202 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([noncollinear_3impliesdistinct()])))])
  let t203 = @tactics.subgoal_tac("Distinct", @term_syntax.parse_term("!((A : Cart[Real, Tybit0[Unit]]) == (B : Cart[Real, Tybit0[Unit]])) && !(A == (C : Cart[Real, Tybit0[Unit]])) && !(B == C) && !((A' : Cart[Real, Tybit0[Unit]]) == (B' : Cart[Real, Tybit0[Unit]])) && !(A' == (C' : Cart[Real, Tybit0[Unit]])) && !(B' == C')"), t202)
  let t200 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "H1 H2")(@list.List([oriented_area_collinear_cong()]))])
  let t201 = @tactics.subgoal_tac("H1'", @term_syntax.parse_term("!collinear({(A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]])})"), t200)
  let t223 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1; H2"), t201), t203), t205), t207), t222)
  fivemovesorless_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], !collinear({A, B, C}) → oriented_area((A, B, C)) == oriented_area((A', B', C')) → (∃ n : Num, n <= 5 && reachableN((A, B, C), (A', B', C'), n))"), t223))
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
fn step_34() -> Unit raise {
  let t229 = so(@tactics.hyp_tac(@meson.meson_tac, "equal_areas")(@list.List([])))
  let t227 = @list.List([@tactics.then_tac(@tactics.hyp_tac(@simp.rewrite_tac, "p04Def")(@list.List([reachablen_four(), @class.not_exists_thm(), @pair.forall_pair_thm(), move_(), collinear_3_2dzero(), @vectors.forall_vector_2()])), vec2_tac)])
  let t228 = @tactics.subgoal_tac("", @term_syntax.parse_term("!reachableN((p0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), (p4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])), 4)"), t227)
  let t225 = @list.List([@tactics.then_tac(@tactics.hyp_tac(@simp.rewrite_tac, "p04Def")(@list.List([oriented_area()])), vec2_tac)])
  let t226 = @tactics.subgoal_tac("equal_areas", @term_syntax.parse_term("oriented_area((p0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))) == oriented_area((p4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])))"), t225)
  let t224 = @list.List([@meson.meson_tac(@list.List([]))])
  let t230 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(consider("p0 p4 such that", @term_syntax.parse_term("(p0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == (vector([real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1)]), vector([real_of_num(1), real_of_num(0)])) && (p4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == (vector([real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(2)]), vector([real_of_num(2), real_of_num(1)]))"), t224, "p04Def"), t226), t228), t229)
  notenough_4_c.set(@tactics.prove(@term_syntax.parse_term("∃ p0 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), ∃ p4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]), oriented_area(p0) == oriented_area(p4) && !reachableN(p0, p4, 4)"), t230))
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
fn step_35() -> Unit raise {
  let t240 = so(@meson.meson_tac(@list.List([reachablen_five(), @arith.le_refl()])))
  let t238 = @list.List([@tactics.hyp_tac(@meson.meson_tac, "ABCcol A'B'C'col EZcollinear P1234exist")(@list.List([collinearsymmetry(), movesymmetry()]))])
  let t239 = @tactics.subgoal_tac("", @term_syntax.parse_term("move_(((A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])), (P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))) && move_(P1, (P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))) && move_(P2, (P3 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))) && move_(P3, (P4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]))) && move_(P4, ((A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]])))"), t238)
  let t236 = @list.List([@meson.meson_tac(@list.List([]))])
  let t237 = consider("P1 P2 P3 P4 such that", @term_syntax.parse_term("(P1 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == ((A : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]]), C) && (P2 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == ((B' : Cart[Real, Tybit0[Unit]]), C, C) && (P3 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == (B', B', C) && (P4 : (Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) == (B', B', (C' : Cart[Real, Tybit0[Unit]]))"), t236, "P1234exist")
  let t235 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([oriented_area_collinear_cong()])))])
  let t241 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_tac("A'B'C'col", @term_syntax.parse_term("collinear({(A' : Cart[Real, Tybit0[Unit]]), (B' : Cart[Real, Tybit0[Unit]]), (C' : Cart[Real, Tybit0[Unit]])})"), t235), t237), t239), t240)
  let t242 = @list.List([so(@tactics.hyp_tac(@meson.meson_tac, "H1")(@list.List([fivemovesorless()]))), t241])
  let t233 = @list.List([@meson.meson_tac(@list.List([]))])
  let t234 = cases("ABCncol | ABCcol", @term_syntax.parse_term("!collinear({(A : Cart[Real, Tybit0[Unit]]), (B : Cart[Real, Tybit0[Unit]]), (C : Cart[Real, Tybit0[Unit]])}) || collinear({A, B, C})"), t233)
  let t231 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([move_(), @vectors.collinear_3_2d()])), vec2_tac)])
  let t232 = @tactics.subgoal_tac("EZcollinear", @term_syntax.parse_term("(∀ X : Cart[Real, Tybit0[Unit]], ∀ Y : Cart[Real, Tybit0[Unit]], collinear({X, Y, Y})) && (∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], move_((A, B, B), (A', B, B))) && (∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], collinear({A, B, C}) && collinear({A, B', C}) → move_((A, B, C), (A, B', C)))"), t231)
  let t243 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall A B C A' B' C'; H1"), t232), t234), t242)
  fivemovesorless_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, Tybit0[Unit]], ∀ B : Cart[Real, Tybit0[Unit]], ∀ C : Cart[Real, Tybit0[Unit]], ∀ A' : Cart[Real, Tybit0[Unit]], ∀ B' : Cart[Real, Tybit0[Unit]], ∀ C' : Cart[Real, Tybit0[Unit]], oriented_area((A, B, C)) == oriented_area((A', B', C')) → (∃ n : Num, n <= 5 && reachableN((A, B, C), (A', B', C'), n))"), t243))
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
}
