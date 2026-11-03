// Deep-term stress tests: the wasm stack overflows somewhere between 10K
// and 30K frames, so these record how deep the recursive kernel
// operations can go.

///|
/// `f (f (... (f x)))` with `depth` applications, plus a binder at the top.
fn deep_term(depth : Int32) -> @kernel.Term raise {
  let a = @kernel.mk_vartype("A")
  let fa = @kernel.mk_type("fun", @list.List([a, a]))
  let f = @kernel.mk_var("f", fa)
  let x = @kernel.mk_var("x", a)
  let mut t = x
  for _ in 0..<depth {
    t = @kernel.mk_comb(f, t)
  }
  @kernel.mk_abs(@kernel.mk_var("y", a), t)
}

///|
fn exercise(depth : Int32) -> Unit raise {
  let t = deep_term(depth)
  let a = @kernel.mk_vartype("A")
  let b = @kernel.mk_vartype("B")
  let x = @kernel.mk_var("x", a)
  let z = @kernel.mk_var("z", a)
  @test.assert_eq(@kernel.frees(t).length(), 2)
  let t2 = @kernel.vsubst(@list.List([(z, x)]), t)
  @test.assert_eq(@kernel.vfree_in(z, t2), true)
  let t3 = @kernel.inst(@list.List([(b, a)]), t)
  @test.assert_eq(@kernel.type_vars_in_term(t3).length(), 1)
  @test.assert_eq(@kernel.alphaorder(t, t2) != 0, true)
  @test.assert_eq(t.compare(t2) != 0, true)
  @test.assert_eq(t == t, true)
  let th = @kernel.refl(t)
  let th2 = @kernel.trans(th, th)
  @test.assert_eq(@kernel.concl(th2) == @kernel.concl(th), true)
  let th3 = @kernel.inst_type(@list.List([(b, a)]), th)
  @test.assert_eq(@kernel.hyp(th3).length(), 0)
}

///|
test "kernel handles terms of depth 1000" {
  exercise(1000)
}

///|
test "kernel handles terms of depth 2500" {
  exercise(2500)
}
