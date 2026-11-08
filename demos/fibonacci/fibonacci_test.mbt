///|
test "recursive Fibonacci equals iterative Fibonacci for every natural number" {
  // The ordinary two-call recursive definition, over unbounded HOL naturals.
  let recursive = @define.define_(
    @term_syntax.parse_term(
      "(fib_rec : (Num) -> Num)(0) == 0 && fib_rec(SUC(0)) == 1 && (∀ n : Num, fib_rec(SUC(SUC(n))) == fib_rec(n) + fib_rec(SUC(n)))",
    ),
  )
  // n loop iterations, with state (a, b) and simultaneous update (b, a + b).
  let loop_def = @recursion.new_recursive_definition(@nums.num_recursion())(
    @term_syntax.parse_term(
      "(∀ a : Num, ∀ b : Num, (fib_loop : (Num, Num, Num) -> Num)(0, a, b) == a) && (∀ n : Num, ∀ a : Num, ∀ b : Num, fib_loop(SUC(n), a, b) == fib_loop(n, b, a + b))",
    ),
  )
  let iterative = @drule.new_definition(
    @term_syntax.parse_term(
      "(fib_iter : (Num) -> Num)((n : Num)) == fib_loop(n, 0, 1)",
    ),
  )
  // Generalize the starting index: n more steps from (fib(k), fib(k+1)).
  let recurrence = @bool.conjunct2(@bool.conjunct2(recursive))
  let invariant = @tactics.prove(
    @term_syntax.parse_term(
      "∀ n : Num, ∀ k : Num, fib_loop(n, fib_rec(k), fib_rec(SUC(k))) == fib_rec(n + k)",
    ),
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(
        @list.List([loop_def, @equal.gsym(recurrence), @arith.add_clauses()]),
      ),
    ),
  )
  let n = @term_syntax.parse_term("(n : Num)")
  let at_zero = @simp.rewrite_rule(
    @list.List([recursive, @arith.add_clauses()]),
  )(
    @bool.gen(
      n,
      @bool.specl(@list.List([n, @term_syntax.parse_term("0")]), invariant),
    ),
  )
  let equivalence = @tactics.prove(
    @term_syntax.parse_term("∀ n : Num, fib_iter(n) == fib_rec(n)"),
    @simp.rewrite_tac(@list.List([iterative, at_zero])),
  )
  assert_true(@kernel.hyp(invariant).is_empty())
  assert_true(@kernel.hyp(equivalence).is_empty())
  assert_eq(
    @kernel.concl(equivalence),
    @term_syntax.parse_term("∀ n : Num, fib_iter(n) == fib_rec(n)"),
  )
  @testkit.check_axioms()
  println(@printer.string_of_thm(invariant))
  println(@printer.string_of_thm(equivalence))
}
