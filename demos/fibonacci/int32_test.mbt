///|
// These executable examples use nonnegative Int32 inputs. The theorem below
// proves their HOL models; the concrete checks are not a compiler-correctness
// proof connecting arbitrary MoonBit execution to HOL.
fn fib_int32_recursive(n : Int32) -> Int32 {
  guard n >= 0 else { abort("Fibonacci needs a nonnegative input") }
  if n < 2 {
    n
  } else {
    fib_int32_recursive(n - 2) + fib_int32_recursive(n - 1)
  }
}

///|
fn fib_int32_iterative(n : Int32) -> Int32 {
  guard n >= 0 else { abort("Fibonacci needs a nonnegative input") }
  let mut a : Int32 = 0
  let mut b : Int32 = 1
  for _ in 0..<n {
    let next = a + b
    a = b
    b = next
  }
  a
}

///|
test "Int32 Fibonacci equivalence includes wrapping overflow" {
  @words.load()
  // Natural-number input; 32-bit results. word_add wraps modulo 2^32.
  let recursive = @define.define_(
    @parser.parse_term(
      (
        #|(fib32_rec 0 = (word 0:32 word)) /\
        #|(fib32_rec (SUC 0) = word 1) /\
        #|(forall n. fib32_rec (SUC (SUC n)) = word_add (fib32_rec n) (fib32_rec (SUC n)))
      ),
    ),
  )
  // n loop iterations, with state (a, b) and simultaneous update (b, a + b).
  let loop_def = @recursion.new_recursive_definition(@nums.num_recursion())(
    @parser.parse_term(
      (
        #|(forall a b:32 word. fib32_loop 0 a b = a) /\
        #|(forall n a b. fib32_loop (SUC n) a b = fib32_loop n b (word_add a b))
      ),
    ),
  )
  let iterative = @drule.new_definition(
    @parser.parse_term("fib32_iter n = fib32_loop n (word 0) (word 1)"),
  )
  // Generalize the starting index: n more steps from (fib(k), fib(k+1)).
  let recurrence = @bool.conjunct2(@bool.conjunct2(recursive))
  let invariant = @tactics.prove(
    @parser.parse_term(
      "forall n k. fib32_loop n (fib32_rec k) (fib32_rec (SUC k)) = fib32_rec (n + k)",
    ),
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(
        @list.List([loop_def, @equal.gsym(recurrence), @arith.add_clauses()]),
      ),
    ),
  )
  let n = @parser.parse_term("n:num")
  let at_zero = @simp.rewrite_rule(
    @list.List([recursive, @arith.add_clauses()]),
  )(
    @bool.gen(
      n,
      @bool.specl(@list.List([n, @parser.parse_term("0")]), invariant),
    ),
  )
  let equivalence = @tactics.prove(
    @parser.parse_term("forall n. fib32_iter n = fib32_rec n"),
    @simp.rewrite_tac(@list.List([iterative, at_zero])),
  )
  assert_true(@kernel.hyp(invariant).is_empty())
  assert_true(@kernel.hyp(equivalence).is_empty())
  assert_eq(
    @kernel.concl(equivalence),
    @parser.parse_term("forall n. fib32_iter n = fib32_rec n"),
  )
  // ival interprets the very same bits as a signed two's-complement integer.
  let signed_equivalence = @tactics.prove(
    @parser.parse_term("forall n. ival (fib32_iter n) = ival (fib32_rec n)"),
    @simp.rewrite_tac(@list.List([equivalence])),
  )
  assert_true(@kernel.hyp(signed_equivalence).is_empty())
  // Construct concrete-value theorems by kernel-checked rewriting, reusing
  // the previous two theorems rather than expanding an exponential proof tree.
  let values = [
    @bool.conjunct1(recursive),
    @equal.conv_rule(
      @calc_num.num_reduce_conv,
      @bool.conjunct1(@bool.conjunct2(recursive)),
    ),
  ]
  for i in 2..<101 {
    let step = @bool.spec(@parser.parse_term((i - 2).to_string()), recurrence)
    let indices = @equal.conv_rule(@calc_num.num_reduce_conv, step)
    let unfolded = @simp.rewrite_rule(
      @list.List([values[i - 2], values[i - 1]]),
    )(indices)
    values.push(@equal.conv_rule(@words.word_reduce_conv, unfolded))
  }
  for i in 0..<101 {
    let result = fib_int32_iterative(i)
    let signed_literal = if result < 0 {
      "-- &" + (-result.to_int64()).to_string()
    } else {
      "&" + result.to_string()
    }
    let concrete = @tactics.prove(
      @parser.parse_term(
        "ival (fib32_iter " + i.to_string() + ") = " + signed_literal,
      ),
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([equivalence, values[i]])),
        @tactics.conv_tac(@words.word_reduce_conv),
      ),
    )
    assert_true(@kernel.hyp(concrete).is_empty())
    if i <= 20 {
      assert_eq(fib_int32_recursive(i), result)
    }
    if i == 46 || i == 47 || i == 48 {
      println(@printer.string_of_thm(concrete))
    }
  }
  assert_eq(fib_int32_iterative(46), 1836311903)
  assert_eq(fib_int32_iterative(47), -1323752223)
  assert_eq(fib_int32_iterative(48), 512559680)
  @testkit.check_axioms()
  println(@printer.string_of_thm(invariant))
  println(@printer.string_of_thm(equivalence))
  println(@printer.string_of_thm(signed_equivalence))
}
