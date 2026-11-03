// Differential test against nets.ml: replays tools/ocaml_ref/nets_ref.ml
// (keep in sync). Elements carry a closure, as upstream conversions do.

///|
using @kernel {type Term}

///|
/// `(int, string, closure)`: OCaml's compare raises on the closure unless
/// it is physically the same value.
priv struct Elem {
  n : Int32
  s : String
  clo : (String) -> String
}

///|
impl @nets.NetCompare for Elem with fn net_compare(self, other) {
  let c = self.n.compare(other.n)
  if c != 0 {
    return Some(c)
  }
  let c = @kernel.compare_string(self.s, other.s)
  if c != 0 {
    return Some(c)
  }
  if physical_equal(self.clo, other.clo) {
    Some(0)
  } else {
    None
  }
}

///|
fn elem(n : Int32, s : String) -> Elem {
  { n, s, clo: t => t + s, }
}

///|
fn show(l : @list.List[Elem]) -> String {
  "[" + l.map(e => e.n.to_string() + e.s).to_array().join(";") + "]"
}

///|
fn stm(tm : Term) -> String {
  match tm {
    Var(s, Tyvar(t)) => s + ":'" + t
    _ => "?"
  }
}

///|
test "nets match nets.ml" {
  let log = { buf: StringBuilder(), }
  let out = (s : String) => log.buf.write_string(s + "\n")
  let a = @kernel.mk_vartype("A")
  let fn_ = @basics.mk_fun_ty
  @kernel.new_constant("c", a)
  @kernel.new_constant("h", fn_(a, fn_(a, a)))
  let c = @kernel.mk_const("c", @list.List([]))
  let h = @kernel.mk_const("h", @list.List([]))
  let x = @kernel.mk_var("x", a)
  let y = @kernel.mk_var("y", a)
  let f = @kernel.mk_var("f", fn_(a, fn_(a, a)))
  let g = @kernel.mk_var("g", fn_(a, a))
  let app2 = (k, u, v) => @kernel.mk_comb(@kernel.mk_comb(k, u), v)
  let shared : (String) -> String = s => s
  let pats : Array[(Term, Elem)] = [
    (app2(h, x, y), elem(1, "hxy")),
    (app2(h, c, y), elem(2, "hcy")),
    (app2(h, @kernel.mk_comb(g, x), y), elem(1, "hgxy")),
    (app2(f, x, y), elem(3, "fxy")),
    (@kernel.mk_comb(g, x), elem(1, "gx")),
    (x, elem(5, "x")),
    (c, elem(1, "c")),
    (@kernel.mk_abs(x, @kernel.mk_comb(g, x)), elem(2, "lam")),
    (@kernel.mk_comb(@kernel.mk_abs(x, x), c), elem(4, "redex")),
    (app2(h, x, y), elem(1, "hxy2")),
    (app2(h, x, y), { n: 1, s: "dup", clo: shared, }),
    (app2(h, x, y), { n: 1, s: "dup", clo: shared, }),
    (app2(h, x, y), { n: 0, s: "first", clo: shared, }),
  ]
  let build = (lconsts, ps : @list.List[(Term, Elem)]) => {
    @lib.itlist(
      (p : (Term, Elem), n) => @nets.enter(lconsts, p.0, p.1, n),
      ps,
      @nets.empty_net(),
    )
  }
  let net = build(@list.List([]), @list.List(pats))
  let net_l = build(@list.singleton(g), @list.List(pats))
  let queries : Array[(String, Term)] = [
    ("h_c_c", app2(h, c, c)),
    ("h_x_c", app2(h, x, c)),
    ("h_gc_c", app2(h, @kernel.mk_comb(g, c), c)),
    ("f_c_c", app2(f, c, c)),
    ("g_c", @kernel.mk_comb(g, c)),
    ("c", c),
    ("x", x),
    ("lam", @kernel.mk_abs(y, @kernel.mk_comb(g, y))),
    ("redex", @kernel.mk_comb(@kernel.mk_abs(y, y), c)),
  ]
  for q in queries {
    out("lookup " + q.0 + " = " + show(@nets.lookup(q.1, net)))
  }
  for q in queries {
    out("lookup_l " + q.0 + " = " + show(@nets.lookup(q.1, net_l)))
  }
  let n1 = build(@list.List([]), @list.List(pats).drop(3).rev())
  let n2 = build(
    @list.List([]),
    @list.List([
      (app2(h, x, y), elem(7, "m")),
      (c, elem(0, "m0")),
      (app2(h, x, y), elem(1, "hxy")),
    ]),
  )
  let merged = @nets.merge_nets(n1, n2)
  for q in queries {
    out("merged " + q.0 + " = " + show(@nets.lookup(q.1, merged)))
  }
  let _ = @nets.enter(
    @list.singleton(x),
    @kernel.mk_abs(x, @kernel.mk_comb(g, x)),
    elem(9, "lamlc"),
    @nets.empty_net(),
  )
  out("genvar_counter = " + stm(@basics.genvar(a)))
  inspect(
    log.buf.to_string(),
    content=(
      #|lookup h_c_c = [2hcy;0first;1dup;1hgxy;1hxy;1hxy2;1gx;3fxy;5x]
      #|lookup h_x_c = [0first;1dup;1hgxy;1hxy;1hxy2;1gx;3fxy;5x]
      #|lookup h_gc_c = [0first;1dup;1hgxy;1hxy;1hxy2;1gx;3fxy;5x]
      #|lookup f_c_c = [1gx;3fxy;5x]
      #|lookup g_c = [1gx;3fxy;5x]
      #|lookup c = [1c;1gx;3fxy;5x]
      #|lookup x = [1gx;3fxy;5x]
      #|lookup lam = [2lam;1gx;3fxy;5x]
      #|lookup redex = [4redex;1gx;3fxy;5x]
      #|lookup_l h_c_c = [2hcy;0first;1dup;1hxy;1hxy2;3fxy;5x]
      #|lookup_l h_x_c = [0first;1dup;1hxy;1hxy2;3fxy;5x]
      #|lookup_l h_gc_c = [1hgxy;0first;1dup;1hxy;1hxy2;3fxy;5x]
      #|lookup_l f_c_c = [3fxy;5x]
      #|lookup_l g_c = [1gx;3fxy;5x]
      #|lookup_l c = [1c;3fxy;5x]
      #|lookup_l x = [3fxy;5x]
      #|lookup_l lam = [2lam;3fxy;5x]
      #|lookup_l redex = [4redex;3fxy;5x]
      #|merged h_c_c = [0first;1dup;1hxy;1hxy2;7m;1gx;3fxy;5x]
      #|merged h_x_c = [0first;1dup;1hxy;1hxy2;7m;1gx;3fxy;5x]
      #|merged h_gc_c = [0first;1dup;1hxy;1hxy2;7m;1gx;3fxy;5x]
      #|merged f_c_c = [1gx;3fxy;5x]
      #|merged g_c = [1gx;3fxy;5x]
      #|merged c = [0m0;1c;1gx;3fxy;5x]
      #|merged x = [1gx;3fxy;5x]
      #|merged lam = [2lam;1gx;3fxy;5x]
      #|merged redex = [4redex;1gx;3fxy;5x]
      #|genvar_counter = _1:'A
      #|
    ),
  )
}

///|
priv struct Log {
  buf : StringBuilder
}
