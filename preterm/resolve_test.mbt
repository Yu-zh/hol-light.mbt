// Overload resolution (`resolve_interface`, through `retypecheck`): the
// choices it backtracks over, and the stack it needs, which grows with the
// number of overloaded names, not with the size of the term.

///|
/// `(... = ...) = (... = ...)`, a balanced tree with 2^depth leaves
/// `x : bool`. Its types are fixed, so the type-variable chains unification
/// follows stay short; only the term is large.
fn balanced(depth : Int) -> @preterm.Preterm {
  if depth == 0 {
    Typing(Varp("x", @preterm.dpty), Ptycon("bool", @list.List([])))
  } else {
    let sub = balanced(depth - 1)
    Combp(Combp(Varp("=", @preterm.dpty), sub), sub)
  }
}

///|
/// The names of `ptm`'s leaves, left to right.
fn leaf_names(ptm : @preterm.Preterm) -> Array[String] {
  let names = []
  let todo = [ptm]
  while todo.pop() is Some(t) {
    match t {
      Varp(s, _) | Constp(s, _) => names.push(s)
      Combp(f, x) | Absp(f, x) => {
        todo.push(x)
        todo.push(f)
      }
      Typing(p, _) => todo.push(p)
    }
  }
  names
}

///|
test "overload resolution backtracks to an earlier choice" {
  let bool_ty = @kernel.bool_ty
  let bb = @basics.mk_fun_ty(bool_ty, bool_ty)
  let a = @kernel.mk_vartype("A")
  @preterm.make_overloadable("resolve_test_h", @basics.mk_fun_ty(a, bool_ty))
  @preterm.make_overloadable("resolve_test_g", a)
  let names = @preterm.with_interface_restored(() => {
    // h2 is tried first (the newest entry), and needs g : bool, which no
    // meaning of g has; so the search goes back to h1
    @preterm.overload_interface(
      "resolve_test_h",
      @kernel.mk_var("h1", @basics.mk_fun_ty(bb, bool_ty)),
    )
    @preterm.overload_interface("resolve_test_h", @kernel.mk_var("h2", bb))
    @preterm.overload_interface("resolve_test_g", @kernel.mk_var("g1", bb))
    let ptm : @preterm.Preterm = Combp(
      Varp("resolve_test_h", @preterm.dpty),
      Varp("resolve_test_g", @preterm.dpty),
    )
    leaf_names(@preterm.retypecheck(@list.List([]), ptm))
  })
  assert_eq(names, ["h1", "g1"])
}

///|
test "overload resolution fails when no choice fits" {
  let bool_ty = @kernel.bool_ty
  let a = @kernel.mk_vartype("A")
  @preterm.make_overloadable("resolve_test_k", a)
  let msg = @preterm.with_interface_restored(() => {
    // two meanings (with one, typify gives k its type at once), and k
    // applied to two arguments, which neither takes
    @preterm.overload_interface("resolve_test_k", @kernel.mk_var("k1", bool_ty))
    @preterm.overload_interface(
      "resolve_test_k",
      @kernel.mk_var("k2", @basics.mk_fun_ty(bool_ty, bool_ty)),
    )
    let ptm : @preterm.Preterm = Combp(
      Combp(Varp("resolve_test_k", @preterm.dpty), Varp("x", @preterm.dpty)),
      Varp("y", @preterm.dpty),
    )
    try {
      ignore(@preterm.retypecheck(@list.List([]), ptm))
      ""
    } catch {
      Failure(m) => m
      e => raise e
    }
  })
  assert_eq(msg, "typechecking error (overload resolution)")
}

///|
test "overload resolution of a term with 2^15 leaves" {
  // a shallow term, but a large one: resolving it used to take a stack
  // frame per node, and overflowed the wasm stack
  let ptm = @preterm.retypecheck(@list.List([]), balanced(15))
  let names = leaf_names(ptm)
  assert_eq(names.length(), 2 * 32768 - 1)
  assert_eq(names[0], "=")
}
