// Load-fidelity and behaviour test for quot.ml: replays
// tools/ocaml_ref/quot_ref.ml (keep in sync).

///|
using @testkit {stm, sthm}

///|
test "quot matches quot.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
      "metis", "thecops", "quot",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("quot")
  let tm = @term_syntax.parse_term
  let rw = (ths : Array[@kernel.Thm]) => @simp.rewrite_tac(@list.List(ths))
  let meson = @meson.meson_tac(@list.List([])) catch { e => fail("\{e}") }
  try {
    let beq = @drule.new_definition(tm("(BEQ : (Bool, Bool) -> Bool)((x : Bool), (y : Bool)) == (x == y)"))
    let refl_th = @tactics.prove(tm("∀ x : Bool, BEQ(x, x)"), rw([beq]))
    let sym_th = @tactics.prove(
      tm("∀ x : Bool, ∀ y : Bool, BEQ(x, y) == BEQ(y, x)"),
      @tactics.then_tac(rw([beq]), meson),
    )
    let trans_th = @tactics.prove(
      tm("∀ x : Bool, ∀ y : Bool, ∀ z : Bool, BEQ(x, y) && BEQ(y, z) → BEQ(x, z)"),
      @tactics.then_tac(rw([beq]), meson),
    )
    let q = @quot.define_quotient_type(
      "qbool",
      ("mk_qbool", "dest_qbool"),
      tm("BEQ"),
    )
    log.attempt("define", () => sthm(q.0) + " ;; " + sthm(q.1))
    let wth = @tactics.prove(
      tm("∀ x : Bool, ∀ y : Bool, BEQ(x, y) → BEQ(!x, !y)"),
      @tactics.then_tac(rw([beq]), meson),
    )
    let lf = @quot.lift_function(q.1)((refl_th, trans_th))("qnot")(wth)
    log.attempt("lift_function", () => sthm(lf.0) + " ;; " + sthm(lf.1))
    let th = @tactics.prove(tm("∀ x : Bool, BEQ(!!x, x)"), rw([beq]))
    log.attempt("lift_theorem", () => {
      sthm(
        @quot.lift_theorem(q)((refl_th, sym_th, trans_th))(
          @list.singleton(lf.1),
        )(th),
      )
    })
  } catch {
    e => fail("setup: \{e}")
  }
  log.attempt("define_again", () => {
    let q2 = @quot.define_quotient_type(
      "qbool",
      ("mk_qbool", "dest_qbool"),
      tm("BEQ"),
    )
    sthm(q2.0)
  })
  log.attempt("types", () => @kernel.types().map(p => p.0).to_array().join(" "))
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("counter_tyvar", () => stm(tm("(zz_counter : _)")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  inspect(
    log.contents(),
    content=(
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 5
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 4
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 3
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 0
      #|Searching with limit 1
      #|Searching with limit 2
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|0..0..1..3..7..15..26..54..86..136..solved at 208
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|0..0..1..4..solved at 10
      #|0..0..1..4..9..solved at 21
      #|0..0..solved at 2
      #|0..0..1..solved at 4
      #|0..0..1..2..6..11..22..38..70..solved at 116
      #|0..0..solved at 2
      #|0..0..solved at 2
      #|0..0..1..2..6..11..22..41..76..solved at 108
      #|0..0..1..solved at 4
      #|0..0..solved at 2
      #|quot quotations (6):
      #|  \226\136\128 x : A, select((y : A) => x == y) == x
      #|  (dest : (Absty, Repty) -> Bool)((mk : ((Repty) -> Bool) -> Absty)((R : (Repty, Repty) -> Bool)((x : Repty)))) == R(x)
      #|  (x : Repty)
      #|  ((a : Bool) && (b : Bool) && (c : Bool)) && (b \226\134\146 a \226\134\146 (d : Bool)) \226\134\146 a && b && c && d
      #|  \226\136\128 x : Repty, \226\136\128 y : Repty, ((mk : ((Repty) -> Bool) -> Absty)((R : (Repty, Repty) -> Bool)(x)) == mk(R(y))) == (R(x) == R(y))
      #|  (\226\136\128 x : Repty, (R : (Repty, Repty) -> Bool)(x, x)) && (\226\136\128 x : Repty, \226\136\128 y : Repty, R(x, y) == R(y, x)) && (\226\136\128 x : Repty, \226\136\128 y : Repty, \226\136\128 z : Repty, R(x, y) && R(y, z) \226\134\146 R(x, z)) && (\226\136\128 a : Absty, (mk : ((Repty) -> Bool) -> Absty)((dest : (Absty, Repty) -> Bool)(a)) == a) && (\226\136\128 r : (Repty) -> Bool, (\226\136\131 x : Repty, r == R(x)) == (dest(mk(r)) == r)) \226\134\146 (\226\136\128 x : Repty, \226\136\128 y : Repty, R(x, y) == (mk(R(x)) == mk(R(y)))) && (\226\136\128 P : (Absty) -> Bool, (\226\136\128 x : Repty, P(mk(R(x)))) == (\226\136\128 x : Absty, P(x))) && (\226\136\128 P : (Absty) -> Bool, (\226\136\131 x : Repty, P(mk(R(x)))) == (\226\136\131 x : Absty, P(x))) && (\226\136\128 x : Absty, mk(R(select(dest(x)))) == x)
      #|define =  |- ((#=:fun(qbool,fun(qbool,bool)) (#mk_qbool:fun(fun(bool,bool),qbool) (#dest_qbool:fun(qbool,fun(bool,bool)) a:qbool))) a:qbool) ;;  |- ((#=:fun(bool,fun(bool,bool)) (#?:fun(fun(bool,bool),bool) (\x:bool. ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) r:fun(bool,bool)) (#BEQ:fun(bool,fun(bool,bool)) x:bool))))) ((#=:fun(fun(bool,bool),fun(fun(bool,bool),bool)) (#dest_qbool:fun(qbool,fun(bool,bool)) (#mk_qbool:fun(fun(bool,bool),qbool) r:fun(bool,bool)))) r:fun(bool,bool)))
      #|lift_function =  |- ((#=:fun(qbool,fun(qbool,bool)) (#qnot:fun(qbool,qbool) x:qbool)) (#mk_qbool:fun(fun(bool,bool),qbool) (\u:bool. (#?:fun(fun(bool,bool),bool) (\x:bool. ((#/\:fun(bool,fun(bool,bool)) ((#BEQ:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) x:bool)) u:bool)) ((#dest_qbool:fun(qbool,fun(bool,bool)) x:qbool) x:bool))))))) ;;  |- ((#=:fun(qbool,fun(qbool,bool)) (#mk_qbool:fun(fun(bool,bool),qbool) (#BEQ:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) x:bool)))) (#qnot:fun(qbool,qbool) (#mk_qbool:fun(fun(bool,bool),qbool) (#BEQ:fun(bool,fun(bool,bool)) x:bool))))
      #|lift_theorem =  |- (#forall:fun(fun(qbool,bool),bool) (\x:qbool. ((#=:fun(qbool,fun(qbool,bool)) (#qnot:fun(qbool,qbool) (#qnot:fun(qbool,qbool) x:qbool))) x:qbool)))
      #|define_again ! new_basic_type_definition: Constant(s) already in use
      #|types = qbool 1 bool fun
      #|constants = qnot dest_qbool mk_qbool BEQ hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _1077:bool
      #|
    ),
  )
}
