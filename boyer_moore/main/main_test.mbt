// A test of Boyer_Moore/main.ml's prover on a goal from upstream's
// Boyer_Moore/testset/arith.ml, after the arithmetic part of
// Boyer_Moore/make.ml's bm_reset. No theory runs the prover while it
// loads, upstream or here, so nothing else reaches its waterfall's
// clausal-form and generalization heuristics.

///|
fn tm(s : String) -> @kernel.Term raise {
  @term_syntax.parse_term(s)
}

///|
/// Run `f` with the prover's definitions, rewrite rules and generalization
/// lemmas put back as they were afterwards.
fn with_environment(f : () -> Unit raise) -> Unit raise {
  @main.load()
  let defs = @environment.system_defs().val
  let rewrites = @environment.system_rewrites().val
  let gen_lemmas = @environment.system_gen_lemmas().val
  defer {
    @environment.system_defs().val = defs
    @environment.system_rewrites().val = rewrites
    @environment.system_gen_lemmas().val = gen_lemmas
  }
  f()
}

///|
/// The arithmetic part of make.ml's bm_reset: new_stuff (new_def and
/// new_rewrite_rule) for the definitions, and its rewrite rules.
fn bm_reset() -> Unit raise {
  @main.load()
  @environment.system_defs().val = @list.List([])
  @environment.system_rewrites().val = @list.List([])
  let new_stuff = (th : @kernel.Thm) => {
    @environment.new_def(th)
    @environment.new_rewrite_rule(th)
  }
  new_stuff(@arith.add())
  new_stuff(@arith.mult())
  new_stuff(@arith.sub())
  new_stuff(@arith.le())
  new_stuff(@arith.lt())
  new_stuff(@arith.ge())
  new_stuff(@arith.gt())
  @environment.new_rewrite_rule(@int.arith_rule(tm("1 == SUC(0)")))
  new_stuff(@arith.exp())
  new_stuff(@arith.fact())
  new_stuff(@arith.odd())
  new_stuff(@arith.even())
  @environment.new_rewrite_rule(@nums.not_suc())
  @environment.new_rewrite_rule(@nums.suc_inj())
  @environment.new_rewrite_rule(@arith.pre())
  @environment.new_rewrite_rule(
    @tactics.prove(
      tm("∀ n : Num, !(SUC(n) == n)"),
      @tactics.then_tac(
        @nums.induct_tac,
        @simp.asm_rewrite_tac(@list.List([@nums.suc_inj(), @nums.not_suc()])),
      ),
    ),
  )
  @environment.new_rewrite_rule(
    @tactics.prove(
      tm("∀ a : Num, ∀ b : Num, a + SUC(b) == SUC(a + b)"),
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), g => {
        @main.bmf_tac(@list.List([]), g)
      }),
    ),
  )
}

///|
test "boyer_moore_final proves the commutativity of addition" {
  with_environment(() => {
    bm_reset()
    let goal = tm("(m : Num) + (n : Num) == n + m")
    let th = @main.boyer_moore_final(@list.List([]), goal)
    assert_eq(@kernel.hyp(th), @list.List([]))
    assert_eq(@kernel.concl(th), goal)
  })
}

///|
/// BOYER_MOORE_FINAL uses generalize_heuristic_ext, BOYER_MOORE_GEN
/// generalize_heuristic_aderhold and BOYER_MOORE generalize_heuristic
/// (upstream's first two, run on the same setup, prove it too).
test "the Boyer-Moore provers prove the commutativity of multiplication" {
  with_environment(() => {
    bm_reset()
    let goal = tm("(m : Num) * (n : Num) == n * m")
    for
      prove in [
        (t : @kernel.Term) => @main.boyer_moore_final(@list.List([]), t),
        t => @main.boyer_moore_gen(@list.List([]), t),
        @main.boyer_moore,
      ] {
      let th = prove(goal)
      assert_eq(@kernel.hyp(th), @list.List([]))
      assert_eq(@kernel.concl(th), goal)
    }
  })
}

///|
/// generalize_heuristic adds the generalization lemmas about a term it
/// generalizes to the clause (here ~(0 <= v) for m * n) and takes them out
/// again when the new clause is proved (its ELIM_LEMMA). Upstream's
/// generalize_heuristic_ext and _aderhold never use the lemmas.
test "generalize_heuristic uses generalization lemmas" {
  with_environment(() => {
    bm_reset()
    @environment.system_gen_lemmas().val = @list.List([])
    // a generalization lemma has free variables, matched against the term
    @environment.new_gen_lemma(
      @int.arith_rule(tm("0 <= (m : Num) * (n : Num)")),
    )
    let clause = tm("(m : Num) * (n : Num) + (p : Num) == p + m * n")
    let (clauses, proof) = @generalize.generalize_heuristic(clause, false)
    assert_eq(clauses.length(), 1)
    let (clause_1, _) = clauses.head().unwrap()
    let (lemma, rest) = @basics.dest_disj(clause_1)
    let (le_0, v) = @kernel.dest_comb(@basics.dest_neg(lemma))
    assert_eq(@kernel.rand(le_0), tm("0"))
    assert_true(@kernel.is_var(v))
    assert_eq(
      rest,
      @basics.subst(@list.List([(v, tm("(m : Num) * (n : Num)"))]), clause),
    )
    let th = proof(@list.List([@int.arith_rule(clause_1)]))
    assert_eq(@kernel.hyp(th), @list.List([]))
    assert_eq(@kernel.concl(th), clause)
  })
}
