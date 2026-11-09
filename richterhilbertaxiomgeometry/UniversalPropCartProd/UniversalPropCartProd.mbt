// Translated from upstream RichterHilbertAxiomGeometry/UniversalPropCartProd.ml; edit this file directly.

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:11
fn step_1() -> Unit raise {
  @readable.parseasinfix("∉", (11L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:12
fn step_2() -> Unit raise {
  @readable.parseasinfix("∏", (20L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:13
fn step_3() -> Unit raise {
  @readable.parseasinfix("∘", (20L, "right"))
}

///|
/// RichterHilbertAxiomGeometry/UniversalPropCartProd.ml:14
fn step_4() -> Unit raise {
  @readable.parseasinfix("→", (13L, "right"))
}

///|
/// NOTIN
fn step_5() -> Unit raise {
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
/// CartesianProduct
fn step_6() -> Unit raise {
  cartesianproduct_c.set(@readable.newdefinition("∀ X : (_) -> Bool, ∀ Y : (_) -> Bool, (prod : ((_) -> Bool, (_) -> Bool, (_, _)) -> Bool)(X, Y) == {((x : _), (y : _)) | IN(x, X) && IN(y, Y)}"))
}

///|
let cartesianproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CartesianProduct")

///|
/// `CartesianProduct`
pub fn cartesianproduct() -> @kernel.Thm {
  cartesianproduct_c.get()
}

///|
/// FUNCTION
fn step_7() -> Unit raise {
  function_c.set(@readable.newdefinition("(FUNCTION : (((_) -> Bool, (_) -> _, (_) -> Bool)) -> Bool)((alpha : ((_) -> Bool, (_) -> _, (_) -> Bool))) == (∃ f : (_) -> _, ∃ s : (_) -> Bool, ∃ t : (_) -> Bool, alpha == (t, f, s) && (∀ x : _, IN(x, s) → IN(f(x), t)) && (∀ x : _, NOTIN(x, s) → f(x) == select((y : _) => true)))"))
}

///|
let function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNCTION")

///|
/// `FUNCTION`
pub fn function() -> @kernel.Thm {
  function_c.get()
}

///|
/// SOURCE
fn step_8() -> Unit raise {
  source_c.set(@readable.newdefinition("(SOURCE : ((_, _, _)) -> _)((alpha : (_, _, _))) == SND(SND(alpha))"))
}

///|
let source_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOURCE")

///|
/// `SOURCE`
pub fn source() -> @kernel.Thm {
  source_c.get()
}

///|
/// FUN
fn step_9() -> Unit raise {
  fun_c.set(@readable.newdefinition("(FUN : ((_, _, _)) -> _)((alpha : (_, _, _))) == FST(SND(alpha))"))
}

///|
let fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN")

///|
/// `FUN`
pub fn fun() -> @kernel.Thm {
  fun_c.get()
}

///|
/// TARGET
fn step_10() -> Unit raise {
  target_c.set(@readable.newdefinition("(TARGET : ((_, _)) -> _)((alpha : (_, _))) == FST(alpha)"))
}

///|
let target_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARGET")

///|
/// `TARGET`
pub fn target() -> @kernel.Thm {
  target_c.get()
}

///|
/// FunctionSpace
fn step_11() -> Unit raise {
  functionspace_c.set(@readable.newdefinition("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, (op_minus_minus_minus_gt : ((_) -> Bool, (_) -> Bool, ((_) -> Bool, (_) -> _, (_) -> Bool)) -> Bool)(s, t) == {(alpha : ((_) -> Bool, (_) -> _, (_) -> Bool)) | FUNCTION(alpha) && s == SOURCE(alpha) && t == TARGET(alpha)}"))
}

///|
let functionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpace")

///|
/// `FunctionSpace`
pub fn functionspace() -> @kernel.Thm {
  functionspace_c.get()
}

///|
/// makeFunction
fn step_12() -> Unit raise {
  makefunction_c.set(@readable.newdefinition("∀ t : _, ∀ f : (_) -> _, ∀ s : (_) -> Bool, (makeFunction : (_, (_) -> _, (_) -> Bool) -> (_, (_) -> _, (_) -> Bool))(t, f, s) == (t, (x : _) => if IN(x, s) { f(x) } else { select((y : _) => true) }, s)"))
}

///|
let makefunction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunction")

///|
/// `makeFunction`
pub fn makefunction() -> @kernel.Thm {
  makefunction_c.get()
}

///|
/// Projection1Function
fn step_13() -> Unit raise {
  projection1function_c.set(@readable.newdefinition("(Pi1 : ((_) -> Bool, (_) -> Bool) -> ((_) -> Bool, ((_, _)) -> _, ((_, _)) -> Bool))((X : (_) -> Bool), (Y : (_) -> Bool)) == makeFunction(X, FST, prod(X, Y))"))
}

///|
let projection1function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Projection1Function")

///|
/// `Projection1Function`
pub fn projection1function() -> @kernel.Thm {
  projection1function_c.get()
}

///|
/// Projection2Function
fn step_14() -> Unit raise {
  projection2function_c.set(@readable.newdefinition("(Pi2 : ((_) -> Bool, (_) -> Bool) -> ((_) -> Bool, ((_, _)) -> _, ((_, _)) -> Bool))((X : (_) -> Bool), (Y : (_) -> Bool)) == makeFunction(Y, SND, prod(X, Y))"))
}

///|
let projection2function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Projection2Function")

///|
/// `Projection2Function`
pub fn projection2function() -> @kernel.Thm {
  projection2function_c.get()
}

///|
/// FunctionComposition
fn step_15() -> Unit raise {
  functioncomposition_c.set(@readable.newdefinition("∀ alpha : (_, (_) -> _, _), ∀ beta : (_, (_) -> _, (_) -> Bool), (_o_ : ((_, (_) -> _, _), (_, (_) -> _, (_) -> Bool)) -> (_, (_) -> _, (_) -> Bool))(alpha, beta) == makeFunction(TARGET(alpha), o(FUN(alpha), FUN(beta)), SOURCE(beta))"))
}

///|
let functioncomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionComposition")

///|
/// `FunctionComposition`
pub fn functioncomposition() -> @kernel.Thm {
  functioncomposition_c.get()
}

///|
/// IN_CartesianProduct
fn step_16() -> Unit raise {
  in_cartesianproduct_v1_c.set(@readable.prove(
    "∀ X : (_) -> Bool, ∀ Y : (_) -> Bool, ∀ x : _, ∀ y : _, IN((x, y), prod(X, Y)) == (IN(x, X) && IN(y, Y))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Thm("CartesianProduct", () => cartesianproduct()),
          ],
        ),
        @readable.by(@readable.fol, [@readable.Thm("PAIR_EQ", () => @pair.pair_eq())]),
      ],
    ),
  ))
}

///|
let in_cartesianproduct_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CartesianProduct")

///|
/// `IN_CartesianProduct`
pub fn in_cartesianproduct_v1() -> @kernel.Thm {
  in_cartesianproduct_v1_c.get()
}

///|
/// IN_CartesianProduct
fn step_22() -> Unit raise {
  in_cartesianproduct_c.set(@readable.prove(
    "∀ X : (_) -> Bool, ∀ Y : (_) -> Bool, ∀ x : _, ∀ y : _, IN((x, y), prod(X, Y)) == (IN(x, X) && IN(y, Y))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
            @readable.Thm("CartesianProduct", () => cartesianproduct()),
          ],
        ),
        @readable.by(@readable.fol, [@readable.Thm("PAIR_EQ", () => @pair.pair_eq())]),
      ],
    ),
  ))
}

///|
let in_cartesianproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CartesianProduct")

///|
/// `IN_CartesianProduct`
pub fn in_cartesianproduct() -> @kernel.Thm {
  in_cartesianproduct_c.get()
}

///|
/// CartesianFstSnd
fn step_23() -> Unit raise {
  cartesianfstsnd_c.set(@readable.prove(
    "∀ pair : (_, _), IN(pair, prod((X : (_) -> Bool), (Y : (_) -> Bool))) → IN(FST(pair), X) && IN(SND(pair), Y)",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
        @readable.Thm("IN_CartesianProduct", () => in_cartesianproduct()),
      ],
    ),
  ))
}

///|
let cartesianfstsnd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CartesianFstSnd")

///|
/// `CartesianFstSnd`
pub fn cartesianfstsnd() -> @kernel.Thm {
  cartesianfstsnd_c.get()
}

///|
/// FUNCTION_EQ
fn step_26() -> Unit raise {
  function_eq_c.set(@readable.prove(
    "∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ beta : ((_) -> Bool, (_) -> _, (_) -> Bool), FUNCTION(alpha) && FUNCTION(beta) && SOURCE(alpha) == SOURCE(beta) && FUN(alpha) == FUN(beta) && TARGET(alpha) == TARGET(beta) → alpha == beta",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("FUNCTION", () => function()),
        @readable.Thm("SOURCE", () => source()),
        @readable.Thm("TARGET", () => target()),
        @readable.Thm("FUN", () => fun()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let function_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNCTION_EQ")

///|
/// `FUNCTION_EQ`
pub fn function_eq() -> @kernel.Thm {
  function_eq_c.get()
}

///|
/// IN_FunctionSpace
fn step_32() -> Unit raise {
  in_functionspace_c.set(@readable.prove(
    "∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), IN(alpha, op_minus_minus_minus_gt(s, t)) == (FUNCTION(alpha) && s == SOURCE(alpha) && t == TARGET(alpha))",
    @readable.by(
      @readable.rewrite,
      [
        @readable.Thm("IN_ELIM_THM", () => @sets.in_elim_thm()),
        @readable.Thm("FunctionSpace", () => functionspace()),
      ],
    ),
  ))
}

///|
let in_functionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_FunctionSpace")

///|
/// `IN_FunctionSpace`
pub fn in_functionspace() -> @kernel.Thm {
  in_functionspace_c.get()
}

///|
/// makeFunction_EQ
fn step_34() -> Unit raise {
  makefunction_eq_c.set(@readable.prove(
    "∀ f : (_) -> _, ∀ g : (_) -> _, ∀ s : (_) -> Bool, ∀ t : _, (∀ x : _, IN(x, s) → f(x) == g(x)) → makeFunction(t, f, s) == makeFunction(t, g, s)",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("NOTIN", () => notin()),
        @readable.Thm("FUN_EQ_THM", () => @class.fun_eq_thm()),
      ],
    ),
  ))
}

///|
let makefunction_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunction_EQ")

///|
/// `makeFunction_EQ`
pub fn makefunction_eq() -> @kernel.Thm {
  makefunction_eq_c.get()
}

///|
/// makeFunctionyieldsFUN
fn step_38() -> Unit raise {
  makefunctionyieldsfun_c.set(@readable.prove(
    "∀ alpha : (_, (_) -> _, (_) -> Bool), ∀ g : (_) -> _, ∀ t : _, ∀ f : (_) -> _, ∀ s : (_) -> Bool, alpha == makeFunction(t, f, s) && g == FUN(alpha) → (∀ x : _, IN(x, s) → f(x) == g(x))",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("FUN", () => fun()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let makefunctionyieldsfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunctionyieldsFUN")

///|
/// `makeFunctionyieldsFUN`
pub fn makefunctionyieldsfun() -> @kernel.Thm {
  makefunctionyieldsfun_c.get()
}

///|
/// makeFunctionEq
fn step_39() -> Unit raise {
  makefunctioneq_c.set(@readable.prove(
    "∀ alpha : (_, (_) -> _, (_) -> Bool), ∀ beta : (_, (_) -> _, (_) -> Bool), ∀ f : (_) -> _, ∀ g : (_) -> _, ∀ s : (_) -> Bool, ∀ t : _, alpha == makeFunction(t, f, s) && beta == makeFunction(t, g, s) && (∀ x : _, IN(x, s) → f(x) == g(x)) → alpha == beta",
    @readable.by(
      @readable.simplify,
      [
        @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
        @readable.Thm("makeFunction", () => makefunction()),
        @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
      ],
    ),
  ))
}

///|
let makefunctioneq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("makeFunctionEq")

///|
/// `makeFunctionEq`
pub fn makefunctioneq() -> @kernel.Thm {
  makefunctioneq_c.get()
}

///|
/// FunctionSpaceOnSource
fn step_40() -> Unit raise {
  functionspaceonsource_c.set(@readable.prove(
    "∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ f : (_) -> _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(alpha, op_minus_minus_minus_gt(s, t)) && f == FUN(alpha) → (∀ x : _, IN(x, s) → IN(f(x), t))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("FUN", () => fun()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let functionspaceonsource_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpaceOnSource")

///|
/// `FunctionSpaceOnSource`
pub fn functionspaceonsource() -> @kernel.Thm {
  functionspaceonsource_c.get()
}

///|
/// FunctionSpaceOnOffSource
fn step_42() -> Unit raise {
  functionspaceonoffsource_c.set(@readable.prove(
    "∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ f : (_) -> _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(alpha, op_minus_minus_minus_gt(s, t)) && f == FUN(alpha) → (∀ x : _, IN(x, s) → IN(f(x), t)) && (∀ x : _, NOTIN(x, s) → f(x) == select((y : _) => true))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
            @readable.Thm("FUN", () => fun()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let functionspaceonoffsource_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunctionSpaceOnOffSource")

///|
/// `FunctionSpaceOnOffSource`
pub fn functionspaceonoffsource() -> @kernel.Thm {
  functionspaceonoffsource_c.get()
}

///|
/// ImpliesTruncatedFunctionSpace
fn step_43() -> Unit raise {
  impliestruncatedfunctionspace_c.set(@readable.prove(
    "∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ f : (_) -> _, alpha == makeFunction(t, f, s) && (∀ x : _, IN(x, s) → IN(f(x), t)) → IN(alpha, op_minus_minus_minus_gt(s, t))",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.by(@readable.fol, []),
      ],
    ),
  ))
}

///|
let impliestruncatedfunctionspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ImpliesTruncatedFunctionSpace")

///|
/// `ImpliesTruncatedFunctionSpace`
pub fn impliestruncatedfunctionspace() -> @kernel.Thm {
  impliestruncatedfunctionspace_c.get()
}

///|
/// FunFunctionSpaceImplyFunction
fn step_44() -> Unit raise {
  funfunctionspaceimplyfunction_c.set(@readable.prove(
    "∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, ∀ f : (_) -> _, IN(alpha, op_minus_minus_minus_gt(s, t)) && f == FUN(alpha) → alpha == makeFunction(t, f, s)",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("FUN", () => fun()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.by(
          @readable.fol,
          [@readable.Thm("FUN_EQ_THM", () => @class.fun_eq_thm())],
        ),
      ],
    ),
  ))
}

///|
let funfunctionspaceimplyfunction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FunFunctionSpaceImplyFunction")

///|
/// `FunFunctionSpaceImplyFunction`
pub fn funfunctionspaceimplyfunction() -> @kernel.Thm {
  funfunctionspaceimplyfunction_c.get()
}

///|
/// UseFunctionComposition
fn step_45() -> Unit raise {
  usefunctioncomposition_c.set(@readable.prove(
    "∀ alpha : (_, (_) -> _, (_) -> Bool), ∀ beta : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ u : _, ∀ f : (_) -> _, ∀ t : (_) -> Bool, ∀ g : (_) -> _, ∀ s : (_) -> Bool, alpha == makeFunction(u, f, t) && beta == makeFunction(t, g, s) && IN(beta, op_minus_minus_minus_gt(s, t)) → _o_(alpha, beta) == makeFunction(u, o(f, g), s)",
    @readable.steps(
      [
        @readable.by(
          @readable.rewrite,
          [
            @readable.Thm("FORALL_PAIR_THM", () => @pair.forall_pair_thm()),
            @readable.Thm("makeFunction", () => makefunction()),
            @readable.Thm("FunctionComposition", () => functioncomposition()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("FUN", () => fun()),
            @readable.Thm("BETA_THM", () => @theorems.beta_thm()),
            @readable.Thm("o_THM", () => @trivia.o_thm()),
            @readable.Thm("IN_FunctionSpace", () => in_functionspace()),
            @readable.Thm("FUNCTION", () => function()),
            @readable.Thm("SOURCE", () => source()),
            @readable.Thm("TARGET", () => target()),
            @readable.Thm("NOTIN", () => notin()),
            @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
          ],
        ),
        @readable.intro_tac(
          "forall [u'] [f'] [t'] [t1] [g1] [s1] [u] [f] [t] [g] [s],\n    Halpha Hbeta Hbeta_st Hs Ht",
        ),
        @readable.have(
          "∀ x : _, IN(x, s) → IN(g(x), t)",
          "g_st",
          @readable.by(
            @readable.fol,
            [@readable.Label("Hbeta_st"), @readable.Label("Hbeta")],
          ),
        ),
        @readable.by(
          @readable.simplify,
          [
            @readable.Label("Halpha"),
            @readable.Rule(@equal.gsym, @readable.Label("Hs")),
            @readable.Label("Hbeta"),
            @readable.Label("g_st"),
          ],
        ),
      ],
    ),
  ))
}

///|
let usefunctioncomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UseFunctionComposition")

///|
/// `UseFunctionComposition`
pub fn usefunctioncomposition() -> @kernel.Thm {
  usefunctioncomposition_c.get()
}

///|
/// PairProjectionFunctions
fn step_50() -> Unit raise {
  pairprojectionfunctions_c.set(@readable.prove(
    "∀ X : (_) -> Bool, ∀ Y : (_) -> Bool, IN(Pi1(X, Y), op_minus_minus_minus_gt(prod(X, Y), X)) && IN(Pi2(X, Y), op_minus_minus_minus_gt(prod(X, Y), Y))",
    @readable.steps(
      [
        @readable.intro_tac("forall X Y"),
        @readable.have(
          "∀ pair : (_, _), IN(pair, prod(X, Y)) → IN(FST(pair), X) && IN(SND(pair), Y)",
          "",
          @readable.by(
            @readable.fol,
            [@readable.Thm("CartesianFstSnd", () => cartesianfstsnd())],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Thm("Projection1Function", () => projection1function()),
            @readable.Thm("Projection2Function", () => projection2function()),
            @readable.Prev,
            @readable.Thm(
              "ImpliesTruncatedFunctionSpace",
              () => impliestruncatedfunctionspace(),
            ),
          ],
        ),
      ],
    ),
  ))
}

///|
let pairprojectionfunctions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PairProjectionFunctions")

///|
/// `PairProjectionFunctions`
pub fn pairprojectionfunctions() -> @kernel.Thm {
  pairprojectionfunctions_c.get()
}

///|
/// UniversalPropertyProduct
fn step_55() -> Unit raise {
  universalpropertyproduct_c.set(@readable.prove(
    "∀ M : (_) -> Bool, ∀ A : (_) -> Bool, ∀ B : (_) -> Bool, ∀ alpha : ((_) -> Bool, (_) -> _, (_) -> Bool), ∀ beta : ((_) -> Bool, (_) -> _, (_) -> Bool), IN(alpha, op_minus_minus_minus_gt(M, A)) && IN(beta, op_minus_minus_minus_gt(M, B)) → existsunique((gamma : (((_, _)) -> Bool, (_) -> (_, _), (_) -> Bool)) => IN(gamma, op_minus_minus_minus_gt(M, prod(A, B))) && _o_(Pi1(A, B), gamma) == alpha && _o_(Pi2(A, B), gamma) == beta)",
    @readable.steps(
      [
        @readable.intro_tac("forall M A B alpha beta, H1"),
        @readable.consider(
          "f g",
          "∃ f : (_) -> _, ∃ g : (_) -> _, f == FUN(alpha) && g == FUN(beta)",
          "fgExist",
          @readable.by(@readable.fol, []),
        ),
        @readable.consider(
          "h",
          "∃ h : (_) -> (_, _), h == ((x : _) => (f(x), g(x)))",
          "hExists",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "∀ x : _, IN(x, M) → IN(h(x), prod(A, B))",
          "hProd",
          @readable.by(
            @readable.fol,
            [
              @readable.Label("hExists"),
              @readable.Thm("IN_CartesianProduct", () => in_cartesianproduct()),
              @readable.Label("H1"),
              @readable.Label("fgExist"),
              @readable.Thm("FunctionSpaceOnSource", () => functionspaceonsource()),
            ],
          ),
        ),
        @readable.consider(
          "gamma",
          "∃ gamma : (((_, _)) -> Bool, (_) -> (_, _), (_) -> Bool), gamma == makeFunction(prod(A, B), h, M)",
          "gammaExists",
          @readable.by(@readable.fol, []),
        ),
        @readable.have(
          "IN(gamma, op_minus_minus_minus_gt(M, prod(A, B)))",
          "gammaFunSpace",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("hProd"),
              @readable.Thm(
                "ImpliesTruncatedFunctionSpace",
                () => impliestruncatedfunctionspace(),
              ),
            ],
          ),
        ),
        @readable.have(
          "∀ x : _, IN(x, M) → o(FST, h, x) == f(x) && o(SND, h, x) == g(x)",
          "h_fg",
          @readable.by(
            @readable.simplify,
            [
              @readable.Label("hExists"),
              @readable.Thm("PAIR", () => @pair.pair()),
              @readable.Thm("o_THM", () => @trivia.o_thm()),
            ],
          ),
        ),
        @readable.have(
          "_o_(Pi1(A, B), gamma) == makeFunction(A, o(FST, h), M) && _o_(Pi2(A, B), gamma) == makeFunction(B, o(SND, h), M)",
          "",
          @readable.by(
            @readable.fol,
            [
              @readable.Thm("Projection1Function", () => projection1function()),
              @readable.Thm("Projection2Function", () => projection2function()),
              @readable.Label("gammaExists"),
              @readable.Label("gammaFunSpace"),
              @readable.Thm("UseFunctionComposition", () => usefunctioncomposition()),
            ],
          ),
        ),
        @readable.have(
          "_o_(Pi1(A, B), gamma) == alpha && _o_(Pi2(A, B), gamma) == beta",
          "gammaWorks",
          @readable.by(
            @readable.fol,
            [
              @readable.Prev,
              @readable.Label("h_fg"),
              @readable.Thm("makeFunction_EQ", () => makefunction_eq()),
              @readable.Label("H1"),
              @readable.Label("fgExist"),
              @readable.Thm(
                "FunFunctionSpaceImplyFunction",
                () => funfunctionspaceimplyfunction(),
              ),
            ],
          ),
        ),
        @readable.have(
          "∀ theta : (((_, _)) -> Bool, (_) -> (_, _), (_) -> Bool), IN(theta, op_minus_minus_minus_gt(M, prod(A, B))) && _o_(Pi1(A, B), theta) == alpha && _o_(Pi2(A, B), theta) == beta → theta == gamma",
          "",
          @readable.steps(
            [
              @readable.intro_tac("forall theta, thetaWorks"),
              @readable.consider(
                "k",
                "∃ k : (_) -> (_, _), k == FUN(theta)",
                "kExists",
                @readable.by(@readable.fol, []),
              ),
              @readable.have(
                "theta == makeFunction(prod(A, B), k, M)",
                "thetaFUNk",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Label("thetaWorks"),
                    @readable.Prev,
                    @readable.Thm(
                      "FunFunctionSpaceImplyFunction",
                      () => funfunctionspaceimplyfunction(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "alpha == makeFunction(A, o(FST, k), M) && beta == makeFunction(B, o(SND, k), M)",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Thm("Projection1Function", () => projection1function()),
                    @readable.Thm("Projection2Function", () => projection2function()),
                    @readable.Label("thetaFUNk"),
                    @readable.Label("thetaWorks"),
                    @readable.Thm(
                      "UseFunctionComposition",
                      () => usefunctioncomposition(),
                    ),
                  ],
                ),
              ),
              @readable.have(
                "∀ x : _, IN(x, M) → f(x) == o(FST, k, x) && g(x) == o(SND, k, x)",
                "fg_k",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.TermsRule(
                      tms => th => @bool.ispecl(tms, th),
                      ["alpha", "f", "A", "o(FST, k)", "M"],
                      @readable.Thm(
                        "makeFunctionyieldsFUN",
                        () => makefunctionyieldsfun(),
                      ),
                    ),
                    @readable.TermsRule(
                      tms => th => @bool.ispecl(tms, th),
                      ["beta", "g", "B", "o(SND, k)", "M"],
                      @readable.Thm(
                        "makeFunctionyieldsFUN",
                        () => makefunctionyieldsfun(),
                      ),
                    ),
                    @readable.Prev,
                    @readable.Label("fgExist"),
                  ],
                ),
              ),
              @readable.have(
                "∀ x : _, IN(x, M) → k(x) == (o(FST, k, x), o(SND, k, x))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Thm("PAIR", () => @pair.pair()),
                    @readable.Thm("o_THM", () => @trivia.o_thm()),
                  ],
                ),
              ),
              @readable.have(
                "∀ x : _, IN(x, M) → k(x) == (f(x), g(x))",
                "",
                @readable.by(
                  @readable.fol,
                  [
                    @readable.Prev,
                    @readable.Label("fg_k"),
                    @readable.Thm("PAIR_EQ", () => @pair.pair_eq()),
                  ],
                ),
              ),
              @readable.by(
                @readable.fol,
                [
                  @readable.Label("hExists"),
                  @readable.Label("thetaFUNk"),
                  @readable.Label("gammaExists"),
                  @readable.Prev,
                  @readable.Thm("makeFunctionEq", () => makefunctioneq()),
                ],
              ),
            ],
          ),
        ),
        @readable.by(
          @readable.fol,
          [
            @readable.Label("gammaFunSpace"),
            @readable.Label("gammaWorks"),
            @readable.Prev,
            @readable.Thm("EXISTS_UNIQUE_THM", () => @theorems.exists_unique_thm()),
          ],
        ),
      ],
    ),
  ))
}

///|
let universalpropertyproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UniversalPropertyProduct")

///|
/// `UniversalPropertyProduct`
pub fn universalpropertyproduct() -> @kernel.Thm {
  universalpropertyproduct_c.get()
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
  step_22()
  step_23()
  step_26()
  step_32()
  step_34()
  step_38()
  step_39()
  step_40()
  step_42()
  step_43()
  step_44()
  step_45()
  step_50()
  step_55()
}
