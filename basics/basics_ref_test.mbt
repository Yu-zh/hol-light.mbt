// Differential test against basics.ml: replays
// tools/ocaml_ref/basics_ref.ml (keep in sync). Where OCaml evaluates a
// list literal right to left, the effects are sequenced explicitly here.

///|
using @kernel {type Term, type HolType}

///|
using @list {type List}

///|
fn sty(ty : HolType) -> String {
  match ty {
    Tyvar(s) => "'" + s
    Tyapp(s, Empty) => s
    Tyapp(s, args) => s + "(" + args.map(sty).to_array().join(",") + ")"
  }
}

///|
fn stm(tm : Term) -> String {
  match tm {
    Var(s, ty) => s + ":" + sty(ty)
    Const(s, ty) => "#" + s + ":" + sty(ty)
    Comb(f, x) => "(" + stm(f) + " " + stm(x) + ")"
    Abs(v, b) => "(\\" + stm(v) + ". " + stm(b) + ")"
  }
}

///|
fn[A] sl(f : (A) -> String, l : List[A]) -> String {
  "[" + l.map(f).to_array().join("; ") + "]"
}

///|
priv struct Log {
  buf : StringBuilder
}

///|
fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    @lib.MatchFailure(_) => name + " !! Match_failure"
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.buf.write_string(line + "\n")
}

///|
test "basics matches basics.ml" {
  let log = { buf: StringBuilder(), }
  let a = @kernel.mk_vartype("A")
  let b = @kernel.mk_vartype("B")
  let fn_ = @basics.mk_fun_ty
  @kernel.new_type("num", 0)
  let num_ty = @kernel.mk_type("num", @list.List([]))
  let bb = fn_(@kernel.bool_ty, fn_(@kernel.bool_ty, @kernel.bool_ty))
  let consts : Array[(String, HolType)] = [
    ("/\\", bb),
    ("\\/", bb),
    ("==>", bb),
    ("~", fn_(@kernel.bool_ty, @kernel.bool_ty)),
    ("forall", fn_(fn_(a, @kernel.bool_ty), @kernel.bool_ty)),
    ("?", fn_(fn_(a, @kernel.bool_ty), @kernel.bool_ty)),
    ("NUMERAL", fn_(num_ty, num_ty)),
    ("BIT0", fn_(num_ty, num_ty)),
    ("BIT1", fn_(num_ty, num_ty)),
    ("_0", num_ty),
    ("GEQ", fn_(a, fn_(a, @kernel.bool_ty))),
    ("GABS", fn_(fn_(a, @kernel.bool_ty), a)),
    ("LET", fn_(fn_(a, b), fn_(a, b))),
    ("LET_END", fn_(a, a)),
    (
      "CONS",
      fn_(
        a,
        fn_(
          @kernel.mk_type("fun", @list.List([num_ty, a])),
          @kernel.mk_type("fun", @list.List([num_ty, a])),
        ),
      ),
    ),
    ("NIL", @kernel.mk_type("fun", @list.List([num_ty, a]))),
    ("SUC", fn_(num_ty, num_ty)),
  ]
  for c in consts {
    @kernel.new_constant(c.0, c.1)
  }
  let mk_var = @kernel.mk_var
  let mk_comb = @kernel.mk_comb
  let mk_abs = @kernel.mk_abs
  let mk_const = (s : String) => @kernel.mk_const(s, @list.List([]))
  let p = mk_var("p", @kernel.bool_ty)
  let q = mk_var("q", @kernel.bool_ty)
  let r = mk_var("r", @kernel.bool_ty)
  let x = mk_var("x", a)
  let y = mk_var("y", a)
  let z = mk_var("z", a)
  let f = mk_var("f", fn_(a, fn_(a, a)))
  let g = mk_var("g", fn_(a, a))
  let n = mk_var("n", num_ty)
  let m = mk_var("m", num_ty)
  let conj = (l, r) => @basics.mk_binary("/\\", l, r)
  let imp = (l, r) => @basics.mk_binary("==>", l, r)
  let disj = (l, r) => @basics.mk_binary("\\/", l, r)
  let forall = (v, t) => @basics.mk_binder("forall", v, t)
  let exists = (v, t) => @basics.mk_binder("?", v, t)
  let neg = t => mk_comb(mk_const("~"), t)
  log.attempt("genvar", () => {
    // OCaml evaluates the list literal right to left.
    let g1 = @basics.genvar(@kernel.bool_ty)
    let g0 = @basics.genvar(a)
    sl(stm, @list.List([g0, g1]))
  })
  log.attempt("dest_fun_ty", () => {
    let (t1, t2) = @basics.dest_fun_ty(fn_(a, @kernel.bool_ty))
    sty(t1) + sty(t2)
  })
  log.attempt("dest_fun_ty_bad", () => {
    let (t1, t2) = @basics.dest_fun_ty(@kernel.bool_ty)
    sty(t1) + sty(t2)
  })
  log.attempt("occurs_in", () => {
    @basics.occurs_in(a, fn_(b, fn_(a, b))).to_string() +
    @basics.occurs_in(@kernel.bool_ty, fn_(a, b)).to_string()
  })
  log.attempt("tysubst", () => {
    sty(
      @basics.tysubst(
        @list.List([(num_ty, fn_(a, a)), (b, a)]),
        fn_(fn_(a, a), fn_(a, @kernel.bool_ty)),
      ),
    )
  })
  log.attempt("list_mk_comb", () => {
    stm(@basics.list_mk_comb(f, @list.List([x, y])))
  })
  log.attempt("list_mk_comb_bad", () => {
    stm(@basics.list_mk_comb(g, @list.List([x, y])))
  })
  log.attempt("list_mk_abs", () => {
    stm(@basics.list_mk_abs(@list.List([x, y]), mk_comb(mk_comb(f, x), y)))
  })
  log.attempt("strip_comb", () => {
    let (h, args) = @basics.strip_comb(
      @basics.list_mk_comb(f, @list.List([x, y])),
    )
    stm(h) + sl(stm, args)
  })
  log.attempt("strip_abs", () => {
    let (vs, bd) = @basics.strip_abs(@basics.list_mk_abs(@list.List([x, y]), x))
    sl(stm, vs) + stm(bd)
  })
  log.attempt("variants", () => {
    sl(
      stm,
      @basics.variants(@list.List([x, mk_var("x'", a)]), @list.List([x, x, y])),
    )
  })
  log.attempt("variables", () => {
    sl(stm, @basics.variables(mk_abs(z, mk_comb(mk_comb(f, x), mk_comb(g, y)))))
  })
  let tbig = mk_abs(y, mk_comb(mk_comb(f, mk_comb(g, x)), y))
  log.attempt("subst", () => {
    stm(@basics.subst(@list.List([(y, mk_comb(g, x))]), tbig))
  })
  log.attempt("subst_capture", () => {
    stm(@basics.subst(@list.List([(mk_comb(g, y), x)]), tbig))
  })
  log.attempt("subst_noop", () => stm(@basics.subst(@list.List([(x, x)]), tbig)))
  log.attempt("alpha", () => stm(@basics.alpha(z, mk_abs(x, mk_comb(g, x)))))
  log.attempt("alpha_bad", () => {
    stm(@basics.alpha(y, mk_abs(x, mk_comb(mk_comb(f, x), y))))
  })
  let stv = (pr : (HolType, HolType)) => sty(pr.0) + "/" + sty(pr.1)
  log.attempt("type_match", () => {
    sl(
      stv,
      @basics.type_match(
        fn_(a, fn_(b, a)),
        fn_(num_ty, fn_(@kernel.bool_ty, num_ty)),
        @list.List([]),
      ),
    )
  })
  log.attempt("type_match_bad", () => {
    sl(
      stv,
      @basics.type_match(
        fn_(a, fn_(b, a)),
        fn_(num_ty, fn_(@kernel.bool_ty, @kernel.bool_ty)),
        @list.List([]),
      ),
    )
  })
  log.attempt("type_match_bad2", () => {
    sl(stv, @basics.type_match(fn_(a, a), @kernel.bool_ty, @list.List([])))
  })
  log.attempt("mk_mconst", () => {
    stm(
      @basics.mk_mconst(
        "forall",
        fn_(fn_(num_ty, @kernel.bool_ty), @kernel.bool_ty),
      ),
    )
  })
  log.attempt("mk_mconst_bad", () => {
    stm(@basics.mk_mconst("forall", fn_(num_ty, @kernel.bool_ty)))
  })
  log.attempt("mk_icomb", () => {
    stm(@basics.mk_icomb(mk_const("forall"), mk_abs(n, neg(p))))
  })
  log.attempt("mk_icomb_nonfun", () => stm(@basics.mk_icomb(mk_const("_0"), n)))
  let nil_num = @kernel.inst(@list.List([(num_ty, a)]), mk_const("NIL"))
  log.attempt("list_mk_icomb", () => {
    stm(@basics.list_mk_icomb("CONS", @list.List([n, nil_num])))
  })
  log.attempt("thm_frees", () => {
    sl(
      stm,
      @basics.thm_frees(@kernel.assume_rule(@basics.mk_eq(mk_comb(g, x), y))),
    )
  })
  log.attempt("free_in", () => {
    [
      @basics.free_in(mk_comb(g, x), tbig),
      @basics.free_in(y, tbig),
      @basics.free_in(mk_comb(g, y), mk_abs(y, mk_comb(g, y))),
    ]
    .map(v => v.to_string())
    .join(",")
  })
  log.attempt("find_term", () => {
    stm(@basics.find_term(t => @kernel.is_var(t), tbig))
  })
  log.attempt("find_term_bad", () => {
    stm(@basics.find_term(t => @kernel.is_const(t), tbig))
  })
  log.attempt("find_terms", () => {
    sl(
      stm,
      @basics.find_terms(t => @kernel.is_var(t) || @kernel.is_comb(t), tbig),
    )
  })
  let big = conj(imp(p, q), conj(disj(q, r), neg(p)))
  log.attempt("conjuncts", () => sl(stm, @basics.conjuncts(big)))
  log.attempt("disjuncts", () => {
    sl(stm, @basics.disjuncts(disj(disj(p, q), disj(r, p))))
  })
  log.attempt("binops", () => sl(stm, @basics.binops(mk_const("/\\"), big)))
  log.attempt("dest_imp", () => {
    let (l, rr) = @basics.dest_imp(imp(p, q))
    stm(l) + stm(rr)
  })
  log.attempt("dest_imp_bad", () => {
    let (l, rr) = @basics.dest_imp(p)
    stm(l) + stm(rr)
  })
  log.attempt("dest_neg", () => stm(@basics.dest_neg(neg(p))))
  log.attempt("dest_neg_bad", () => stm(@basics.dest_neg(p)))
  let qf = forall(x, exists(y, @basics.mk_eq(x, y)))
  log.attempt("strip_forall", () => {
    let (vs, bd) = @basics.strip_forall(qf)
    sl(stm, vs) + stm(bd)
  })
  log.attempt("strip_exists", () => {
    let (vs, bd) = @basics.strip_exists(@basics.dest_forall(qf).1)
    sl(stm, vs) + stm(bd)
  })
  log.attempt("is_forall", () => {
    @basics.is_forall(qf).to_string() + @basics.is_exists(qf).to_string()
  })
  let num_tm = (k : Int32) => {
    let bits = []
    let mut k = k
    while k != 0 {
      bits.push(k % 2)
      k = k / 2
    }
    let mut t = mk_const("_0")
    for i = bits.length() - 1; i >= 0; i = i - 1 {
      t = mk_comb(mk_const(if bits[i] == 0 { "BIT0" } else { "BIT1" }), t)
    }
    mk_comb(mk_const("NUMERAL"), t)
  }
  log.attempt("dest_numeral", () => {
    let out = []
    for k in [0, 1, 2, 5, 1000000] {
      out.push(@num.string_of_num(@basics.dest_numeral(num_tm(k))))
    }
    out.join(",")
  })
  log.attempt("dest_numeral_bad", () => {
    @num.string_of_num(@basics.dest_numeral(mk_comb(mk_const("NUMERAL"), n)))
  })
  let nl = @basics.list_mk_icomb(
    "CONS",
    @list.List([n, @basics.list_mk_icomb("CONS", @list.List([m, nil_num]))]),
  )
  log.attempt("dest_list", () => sl(stm, @basics.dest_list(nl)))
  log.attempt("dest_list_bad", () => sl(stm, @basics.dest_list(n)))
  log.attempt("is_list", () => {
    @basics.is_list(nl).to_string() + @basics.is_list(n).to_string()
  })
  let pr = mk_comb(mk_comb(f, x), y)
  log.attempt("mk_gabs_var", () => stm(@basics.mk_gabs(x, pr)))
  log.attempt("mk_gabs", () => stm(@basics.mk_gabs(mk_comb(g, x), pr)))
  log.attempt("dest_gabs", () => {
    let (v, bd) = @basics.dest_gabs(@basics.mk_gabs(mk_comb(g, x), pr))
    stm(v) + " | " + stm(bd)
  })
  log.attempt("dest_gabs_bad", () => {
    let (v, bd) = @basics.dest_gabs(pr)
    stm(v) + stm(bd)
  })
  log.attempt("strip_gabs", () => {
    let (vs, bd) = @basics.strip_gabs(
      @basics.list_mk_gabs(@list.List([mk_comb(g, x), y]), pr),
    )
    sl(stm, vs) + " | " + stm(bd)
  })
  let lt = @basics.mk_let(@list.List([(x, mk_comb(g, z)), (y, z)]), pr)
  log.attempt("mk_let", () => stm(lt))
  log.attempt("dest_let", () => {
    let (eqs, bd) = @basics.dest_let(lt)
    sl((e : (Term, Term)) => stm(e.0) + "=" + stm(e.1), eqs) + " in " + stm(bd)
  })
  log.attempt("dest_let_bad", () => stm(@basics.dest_let(pr).1))
  log.attempt("mk_finty_needs_types", () => {
    sty(@basics.mk_finty(@num.num_of_int(6)))
  })
  @kernel.new_type("1", 0)
  @kernel.new_type("tybit0", 1)
  @kernel.new_type("tybit1", 1)
  log.attempt("mk_finty", () => {
    let out = []
    for k in [1, 2, 6, 13] {
      out.push(sty(@basics.mk_finty(@num.num_of_int(k))))
    }
    out.join(",")
  })
  log.attempt("mk_finty_bad", () => sty(@basics.mk_finty(@num.num_of_int(0))))
  log.attempt("dest_finty", () => {
    let out = []
    for k in [1, 2, 6, 13] {
      out.push(
        @num.string_of_num(
          @basics.dest_finty(@basics.mk_finty(@num.num_of_int(k))),
        ),
      )
    }
    out.join(",")
  })
  log.attempt("make_args", () => {
    sl(
      stm,
      @basics.make_args(
        "x",
        @list.List([x, mk_var("x1", a)]),
        @list.List([a, @kernel.bool_ty, a]),
      ),
    ) +
    sl(stm, @basics.make_args("x", @list.List([x]), @list.List([a])))
  })
  log.attempt("find_path", () => @basics.find_path(t => t == y, mk_abs(z, pr)))
  log.attempt("find_path_bad", () => @basics.find_path(t => t == p, pr))
  log.attempt("follow_path", () => {
    stm(
      @basics.follow_path(
        "brr",
        mk_abs(z, mk_comb(mk_comb(f, x), mk_comb(g, y))),
      ),
    )
  })
  let prop = imp(
    conj(p, @basics.mk_eq(q, neg(r))),
    disj(@basics.mk_eq(x, y), neg(p)),
  )
  log.attempt("atoms", () => sl(stm, @basics.atoms(prop)))
  log.attempt("atoms_bad", () => sl(stm, @basics.atoms(x)))
  log.attempt("mk_eq_bad", () => stm(@basics.mk_eq(x, p)))
  log.attempt("aconv", () => {
    @basics.aconv(mk_abs(x, x), mk_abs(y, y)).to_string()
  })
  log.attempt("genvar_after", () => stm(@basics.genvar(a)))
  inspect(
    log.buf.to_string(),
    content=(
      #|genvar = [_1:'A; _0:bool]
      #|dest_fun_ty = 'Abool
      #|dest_fun_ty_bad ! dest_fun_ty
      #|occurs_in = truefalse
      #|tysubst = fun(num,fun('B,bool))
      #|list_mk_comb = ((f:fun('A,fun('A,'A)) x:'A) y:'A)
      #|list_mk_comb_bad ! mk_comb: types do not agree
      #|list_mk_abs = (\x:'A. (\y:'A. ((f:fun('A,fun('A,'A)) x:'A) y:'A)))
      #|strip_comb = f:fun('A,fun('A,'A))[x:'A; y:'A]
      #|strip_abs = [x:'A; y:'A]x:'A
      #|variants = [x'':'A; x''':'A; y:'A]
      #|variables = [y:'A; g:fun('A,'A); x:'A; f:fun('A,fun('A,'A)); z:'A]
      #|subst = (\y':'A. ((f:fun('A,fun('A,'A)) y:'A) y':'A))
      #|subst_capture = (\y':'A. ((f:fun('A,fun('A,'A)) (g:fun('A,'A) (g:fun('A,'A) y:'A))) y':'A))
      #|subst_noop = (\y:'A. ((f:fun('A,fun('A,'A)) (g:fun('A,'A) x:'A)) y:'A))
      #|alpha = (\z:'A. (g:fun('A,'A) z:'A))
      #|alpha_bad ! alpha: Invalid new variable
      #|type_match = [bool/'B; num/'A]
      #|type_match_bad ! type_match
      #|type_match_bad2 ! type_match
      #|mk_mconst = #forall:fun(fun(num,bool),bool)
      #|mk_mconst_bad ! mk_const: generic type cannot be instantiated
      #|mk_icomb = (#forall:fun(fun(num,bool),bool) (\n:num. (#~:fun(bool,bool) p:bool)))
      #|mk_icomb_nonfun !! Match_failure
      #|list_mk_icomb = ((#CONS:fun(num,fun(fun(num,num),fun(num,num))) n:num) #NIL:fun(num,num))
      #|thm_frees = [g:fun('A,'A); x:'A; y:'A]
      #|free_in = true,false,false
      #|find_term = f:fun('A,fun('A,'A))
      #|find_term_bad ! find_term
      #|find_terms = [y:'A; x:'A; g:fun('A,'A); (g:fun('A,'A) x:'A); f:fun('A,fun('A,'A)); (f:fun('A,fun('A,'A)) (g:fun('A,'A) x:'A)); ((f:fun('A,fun('A,'A)) (g:fun('A,'A) x:'A)) y:'A)]
      #|conjuncts = [((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool); ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool); (#~:fun(bool,bool) p:bool)]
      #|disjuncts = [p:bool; q:bool; r:bool; p:bool]
      #|binops = [((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool); ((#\/:fun(bool,fun(bool,bool)) q:bool) r:bool); (#~:fun(bool,bool) p:bool)]
      #|dest_imp = p:boolq:bool
      #|dest_imp_bad ! dest_binary
      #|dest_neg = p:bool
      #|dest_neg_bad ! dest_neg
      #|strip_forall = [x:'A](#?:fun(fun('A,bool),bool) (\y:'A. ((#=:fun('A,fun('A,bool)) x:'A) y:'A)))
      #|strip_exists = [y:'A]((#=:fun('A,fun('A,bool)) x:'A) y:'A)
      #|is_forall = truefalse
      #|dest_numeral = 0,1,2,5,1000000
      #|dest_numeral_bad ! dest_numeral
      #|dest_list = [n:num; m:num]
      #|dest_list_bad ! dest_list
      #|is_list = truefalse
      #|mk_gabs_var = (\x:'A. ((f:fun('A,fun('A,'A)) x:'A) y:'A))
      #|mk_gabs = (#GABS:fun(fun(fun('A,'A),bool),fun('A,'A)) (\f:fun('A,'A). (#forall:fun(fun(fun('A,'A),bool),bool) (\g:fun('A,'A). (#forall:fun(fun('A,bool),bool) (\x:'A. ((#GEQ:fun('A,fun('A,bool)) (f:fun('A,'A) (g:fun('A,'A) x:'A))) ((f:fun('A,fun('A,'A)) x:'A) y:'A))))))))
      #|dest_gabs = (g:fun('A,'A) x:'A) | ((f:fun('A,fun('A,'A)) x:'A) y:'A)
      #|dest_gabs_bad ! dest_gabs: Not a generalized abstraction
      #|strip_gabs = [(g:fun('A,'A) x:'A); y:'A] | ((f:fun('A,fun('A,'A)) x:'A) y:'A)
      #|mk_let = (((#LET:fun(fun('A,fun('A,'A)),fun('A,fun('A,'A))) (\x:'A. (\y:'A. (#LET_END:fun('A,'A) ((f:fun('A,fun('A,'A)) x:'A) y:'A))))) (g:fun('A,'A) z:'A)) z:'A)
      #|dest_let = [x:'A=(g:fun('A,'A) z:'A); y:'A=z:'A] in ((f:fun('A,fun('A,'A)) x:'A) y:'A)
      #|dest_let_bad ! dest_let: not a let-term
      #|mk_finty_needs_types ! mk_type: type 1 has not been defined
      #|mk_finty = 1,tybit0(1),tybit0(tybit1(1)),tybit1(tybit0(tybit1(1)))
      #|mk_finty_bad ! mk_finty
      #|dest_finty = 1,2,6,13
      #|make_args = [x0:'A; x1:bool; x2:'A][x':'A]
      #|find_path = br
      #|find_path_bad ! rator: Not a combination
      #|follow_path = y:'A
      #|atoms = [r:bool; ((#=:fun('A,fun('A,bool)) x:'A) y:'A); p:bool; q:bool]
      #|atoms_bad ! atoms: not Boolean
      #|mk_eq_bad ! mk_eq
      #|aconv = true
      #|genvar_after = _4:'A
      #|
    ),
  )
}
