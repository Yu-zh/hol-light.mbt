// Behaviour test for firstorder.ml: replays tools/ocaml_ref/firstorder_ref.ml
// (keep in sync).

///|
using @testkit {stm}

///|
fn sl(l : @list.List[Int32]) -> String {
  "[" + l.map(x => x.to_string()).to_array().join("; ") + "]"
}

///|
test "firstorder matches firstorder.ml" {
  let log = @testkit.Log::new()
  log.capture_reports()
  for
    th in [
      "simp", "theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder",
    ] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("firstorder")
  let tm = @parser.parse_term
  let l123 = @list.List([1, 2, 3])
  log.attempt("list_rest", () => {
    "[" +
    @firstorder.list_rest(l123)
    .map(p => p.0.to_string() + ":" + sl(p.1.0) + sl(p.1.1))
    .to_array()
    .join("; ") +
    "]"
  })
  log.attempt("nth_rest", () => {
    let (x, (a, b)) = @firstorder.nth_rest(1)(l123)
    x.to_string() + sl(a) + sl(b)
  })
  log.attempt("nth_rest_bad", () => {
    let (x, (a, b)) = @firstorder.nth_rest(5)(l123)
    x.to_string() + sl(a) + sl(b)
  })
  log.attempt("insert_at", () => sl(@firstorder.insert_at(1, 9, l123)))
  log.attempt("take_drop", () => {
    let (a, b) = @firstorder.take_drop(2)(l123)
    sl(a) + sl(b)
  })
  log.attempt("findi", () => {
    let (n, x) = @firstorder.findi(
      i => x => i + x > 4,
      @list.List([1, 2, 3, 4]),
    )
    n.to_string() + " " + x.to_string()
  })
  log.attempt("fold_map", () => {
    let (s, l) = @firstorder.fold_map(acc => x => (acc + x, acc * x), 1, l123)
    s.to_string() + sl(l)
  })
  log.attempt("filter_map", () => {
    sl(
      @firstorder.filter_map(x => if x > 1 { Some(x * x) } else { None }, l123),
    )
  })
  log.attempt("union1", () => {
    sl(@firstorder.union1(l123, @list.List([3, 4, 1])))
  })
  log.attempt("union2", () => {
    sl(@firstorder.union2(l123, @list.List([3, 4, 1])))
  })
  log.attempt("fold_right1", () => {
    @firstorder.fold_right1(a => b => a - b, @list.List([10, 3, 2])).to_string()
  })
  log.attempt("exists_unique", () => {
    @firstorder.exists_unique(x => x > 2, l123).to_string()
  })
  log.attempt("roundtrip", () => {
    @firstorder.reset_vars(())
    @firstorder.reset_consts(())
    let t = tm("forall x:A. P x (f x y) ==> ~Q (c:A)")
    let fm = @firstorder.fol_of_form(@list.List([]), @list.List([]), t)
    let a = @firstorder.fol_of_atom(
      @list.List([]),
      @list.List([]),
      tm("(R:A->A->bool) (g a) b"),
    )
    stm(@firstorder.hol_of_literal(a.0, a.1)) +
    " / " +
    (match fm {
      Forallq(v, _) => v.to_string()
      _ => "?"
    })
  })
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
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
      #|firstorder quotations (0):
      #|list_rest = [1:[][2; 3]; 2:[1][3]; 3:[2; 1][]]
      #|nth_rest = 2[1][3]
      #|nth_rest_bad ! nth_rest
      #|insert_at = [1; 9; 2; 3]
      #|take_drop = [1; 2][3]
      #|findi = 2 3
      #|fold_map = 7[1; 4; 12]
      #|filter_map = [4; 9]
      #|union1 = [2; 3; 4; 1]
      #|union2 = [2; 3; 4; 1]
      #|fold_right1 = 9
      #|exists_unique = true
      #|Warning: inventing type variables
      #|Warning: inventing type variables
      #|roundtrip = ((R:fun('A,fun('A,bool)) (g:fun('?1,'A) _638:'?1)) _639:'A) / 0
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?2
      #|counter_genvar = _640:bool
      #|
    ),
  )
}
