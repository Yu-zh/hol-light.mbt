///|
test "check_axioms rejects an axiom that is not upstream's" {
  // nothing asserted yet
  @testkit.check_axioms()
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let _ = @kernel.new_axiom(p)
  try @testkit.check_axioms() catch {
    e =>
      inspect(
        e,
        content=(
          #|Failure(check_axioms: unexpected axiom |- p:bool)
        ),
      )
  } noraise {
    _ => fail("an unknown axiom was accepted")
  }
}

///|
test "probe_counters prints what the probes that advance the counters print" {
  let peeked = @testkit.Log::new()
  peeked.capture_reports()
  peeked.probe_counters()
  let real = @testkit.Log::new()
  real.capture_reports()
  real.attempt("counter_tyvar", () => {
    @testkit.stm(@term_syntax.parse_term("(zz_counter : _)"))
  })
  real.attempt("counter_genvar", () => {
    @testkit.stm(@basics.genvar(@kernel.bool_ty))
  })
  @testkit.release_output()
  assert_eq(peeked.contents(), real.contents())
  inspect(
    real.contents(),
    content=(
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _0:bool
      #|
    ),
  )
}

///|
test "normalize_counters leaves quotation traces as they are" {
  let log = "x:?57 y:?12\nArithmetic/t quotations (2):\n  ??1 (V 1 === Z)\n  y:?12\nz:?12 w:?99"
  inspect(
    @testkit.normalize_counters(log),
    content=(
      #|x:?1 y:?2
      #|Arithmetic/t quotations (2):
      #|  ??1 (V 1 === Z)
      #|  y:?12
      #|z:?2 w:?3
    ),
  )
}

///|
test "normalize_counters reads a trace header by its last ` quotations (`" {
  inspect(
    @testkit.normalize_counters("x quotations (1) quotations (1):\n  ?50\n?51"),
    content=(
      #|x quotations (1) quotations (1):
      #|  ?50
      #|?1
    ),
  )
}
