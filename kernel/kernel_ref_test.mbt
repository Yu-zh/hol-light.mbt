// Differential test against upstream HOL Light.
//
// This replays tools/ocaml_ref/kernel_ref.ml step by step; the expected
// output was produced by running that script on the OCaml sources with
// `tools/ocaml_ref/run.sh kernel_ref.ml`. Keep the two files in sync.

///|
fn sty(ty : @kernel.HolType) -> String {
  match ty {
    Tyvar(s) => "'" + s
    Tyapp(s, Empty) => s
    Tyapp(s, args) => s + "(" + args.map(sty).to_array().join(",") + ")"
  }
}

///|
fn stm(tm : @kernel.Term) -> String {
  match tm {
    Var(s, ty) => s + ":" + sty(ty)
    Const(s, ty) => "#" + s + ":" + sty(ty)
    Comb(f, x) => "(" + stm(f) + " " + stm(x) + ")"
    Abs(v, b) => "(\\" + stm(v) + ". " + stm(b) + ")"
  }
}

///|
fn sthm(th : @kernel.Thm) -> String {
  let (asl, c) = @kernel.dest_thm(th)
  asl.map(stm).to_array().join(", ") + " |- " + stm(c)
}

///|
fn[A] slist(f : (A) -> String, l : @list.List[A]) -> String {
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
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.buf.write_string(line)
  self.buf.write_char('\n')
}

///|
test "kernel matches upstream fusion.ml" {
  let log = { buf: StringBuilder(), }
  let a = @kernel.mk_vartype("A")
  let b = @kernel.mk_vartype("B")
  let fn_ = (x, y) => @kernel.mk_type("fun", @list.List([x, y]))
  @kernel.new_type("ind", 0)
  let ind = @kernel.mk_type("ind", @list.List([]))
  log.attempt("tyvars", () => slist(sty, @kernel.tyvars(fn_(a, fn_(b, a)))))
  log.attempt("mk_type_bad", () => sty(@kernel.mk_type("fun", @list.List([a]))))
  log.attempt("mk_type_undef", () => sty(@kernel.mk_type("foo", @list.List([]))))
  log.attempt("new_type_dup", () => {
    @kernel.new_type("ind", 0)
    "ok"
  })
  log.attempt("type_subst", () => {
    sty(@kernel.type_subst(@list.List([(ind, a), (a, b)]), fn_(a, fn_(b, a))))
  })
  let x = @kernel.mk_var("x", a)
  let y = @kernel.mk_var("y", a)
  let z = @kernel.mk_var("z", a)
  let f = @kernel.mk_var("f", fn_(a, fn_(a, a)))
  let g = @kernel.mk_var("g", fn_(a, a))
  let app = @kernel.mk_comb
  let eq = (l, r) => {
    let ty = @kernel.type_of(l)
    app(app(@kernel.mk_const("=", @list.List([(ty, @kernel.aty)])), l), r)
  }
  log.attempt("mk_comb_bad", () => stm(app(x, y)))
  log.attempt("mk_abs_bad", () => stm(@kernel.mk_abs(g, x)))
  log.attempt("mk_const_bad", () => {
    stm(@kernel.mk_const("nope", @list.List([])))
  })
  let t1 = app(app(f, x), app(g, y))
  log.attempt("frees", () => {
    slist(
      stm,
      @kernel.frees(
        @kernel.mk_abs(x, app(app(f, app(g, z)), app(app(f, x), y))),
      ),
    )
  })
  log.attempt("freesl", () => {
    slist(stm, @kernel.freesl(@list.List([app(g, z), t1, x])))
  })
  log.attempt("type_vars_in_term", () => {
    slist(
      sty,
      @kernel.type_vars_in_term(
        @kernel.mk_abs(@kernel.mk_var("u", b), app(g, x)),
      ),
    )
  })
  log.attempt("variant", () => {
    stm(
      @kernel.variant(
        @list.List([
          x,
          @kernel.mk_var("x'", a),
          app(g, @kernel.mk_var("x''", a)),
        ]),
        x,
      ),
    )
  })
  log.attempt("vsubst_capture", () => {
    stm(
      @kernel.vsubst(@list.List([(y, x)]), @kernel.mk_abs(y, app(app(f, x), y))),
    )
  })
  log.attempt("vsubst_bad", () => {
    stm(@kernel.vsubst(@list.List([(@kernel.mk_var("u", b), x)]), x))
  })
  log.attempt("vsubst_bound", () => {
    stm(@kernel.vsubst(@list.List([(z, x)]), @kernel.mk_abs(x, app(g, x))))
  })
  let xb = @kernel.mk_var("x", b)
  let fab = @kernel.mk_var("f", fn_(a, fn_(b, a)))
  let tclash = @kernel.mk_abs(x, app(app(fab, x), xb))
  log.attempt("inst_clash", () => {
    stm(@kernel.inst(@list.List([(b, a)]), tclash))
  })
  log.attempt("inst_simple", () => {
    stm(@kernel.inst(@list.List([(ind, a)]), @kernel.mk_abs(x, app(g, x))))
  })
  log.attempt("alphaorder", () => {
    let mk_abs = @kernel.mk_abs
    let ao = @kernel.alphaorder
    slist(
      fn(i : Int32) { i.to_string() },
      @list.List([
        ao(mk_abs(x, x), mk_abs(y, y)),
        ao(x, y),
        ao(y, x),
        ao(@kernel.mk_const("=", @list.List([])), x),
        ao(app(g, x), mk_abs(x, x)),
        ao(mk_abs(x, y), mk_abs(y, x)),
      ]),
    )
  })
  log.attempt("compare", () => {
    let cs = @kernel.compare_string
    slist(
      fn(i : Int32) { i.to_string() },
      @list.List([
        cs("b", "aa"),
        cs("", "a"),
        cs("ab", "a"),
        x.compare(@kernel.mk_const("=", @list.List([]))),
        app(g, x).compare(@kernel.mk_abs(x, x)),
        @kernel.mk_vartype("Z").compare(ind),
        fn_(a, a).compare(fn_(a, b)),
      ]),
    )
  })
  let p = @kernel.mk_var("p", @kernel.bool_ty)
  let q = @kernel.mk_var("q", @kernel.bool_ty)
  let r = @kernel.mk_var("r", @kernel.bool_ty)
  log.attempt("REFL", () => sthm(@kernel.refl(t1)))
  log.attempt("ASSUME", () => sthm(@kernel.assume_rule(p)))
  log.attempt("ASSUME_bad", () => sthm(@kernel.assume_rule(x)))
  let hpq = @kernel.assume_rule(eq(p, q))
  let hqr = @kernel.assume_rule(eq(q, r))
  log.attempt("TRANS", () => sthm(@kernel.trans(hpq, hqr)))
  log.attempt("TRANS_bad", () => sthm(@kernel.trans(hqr, hpq)))
  log.attempt("MK_COMB", () => {
    sthm(
      @kernel.mk_comb_rule(
        @kernel.assume_rule(eq(g, g)),
        @kernel.assume_rule(eq(x, y)),
      ),
    )
  })
  log.attempt("MK_COMB_bad", () => {
    sthm(
      @kernel.mk_comb_rule(
        @kernel.assume_rule(eq(x, y)),
        @kernel.assume_rule(eq(x, y)),
      ),
    )
  })
  log.attempt("ABS", () => {
    sthm(@kernel.abs_rule(z, @kernel.assume_rule(eq(x, y))))
  })
  log.attempt("ABS_bad", () => {
    sthm(@kernel.abs_rule(x, @kernel.assume_rule(eq(x, y))))
  })
  log.attempt("BETA", () => {
    sthm(@kernel.beta(app(@kernel.mk_abs(x, app(g, x)), x)))
  })
  log.attempt("BETA_bad", () => {
    sthm(@kernel.beta(app(@kernel.mk_abs(x, app(g, x)), y)))
  })
  log.attempt("EQ_MP", () => sthm(@kernel.eq_mp(hpq, @kernel.assume_rule(p))))
  log.attempt("EQ_MP_bad", () => {
    sthm(@kernel.eq_mp(hpq, @kernel.assume_rule(q)))
  })
  log.attempt("DEDUCT_ANTISYM", () => {
    sthm(
      @kernel.deduct_antisym_rule(
        @kernel.eq_mp(hpq, @kernel.assume_rule(p)),
        @kernel.assume_rule(r),
      ),
    )
  })
  let hx = @kernel.assume_rule(eq(@kernel.mk_abs(x, app(g, x)), g))
  let hy = @kernel.assume_rule(eq(@kernel.mk_abs(y, app(g, y)), g))
  log.attempt("TRANS_alpha_mismatch", () => {
    sthm(
      @kernel.trans(
        @kernel.trans(hpq, hqr),
        @kernel.eq_mp(@kernel.assume_rule(eq(r, r)), @kernel.assume_rule(r)),
      ),
    )
  })
  log.attempt("hyp_alpha_dedup", () => sthm(@kernel.deduct_antisym_rule(hx, hy)))
  log.attempt("INST_TYPE", () => {
    sthm(
      @kernel.inst_type(
        @list.List([(ind, a)]),
        @kernel.assume_rule(eq(app(g, x), y)),
      ),
    )
  })
  log.attempt("INST", () => {
    sthm(
      @kernel.inst_rule(
        @list.List([(z, x), (x, y)]),
        @kernel.deduct_antisym_rule(
          @kernel.assume_rule(eq(x, y)),
          @kernel.assume_rule(eq(y, z)),
        ),
      ),
    )
  })
  log.attempt("INST_bad", () => {
    sthm(@kernel.inst_rule(@list.List([(p, x)]), @kernel.assume_rule(eq(x, y))))
  })
  log.attempt("INST_merge", () => {
    sthm(
      @kernel.inst_rule(
        @list.List([(x, y)]),
        @kernel.trans(
          @kernel.assume_rule(eq(x, y)),
          @kernel.assume_rule(eq(y, x)),
        ),
      ),
    )
  })
  log.attempt("new_axiom_bad", () => sthm(@kernel.new_axiom(x)))
  log.attempt("new_axiom", () => sthm(@kernel.new_axiom(eq(p, p))))
  log.attempt("axioms", () => slist(sthm, @kernel.axioms()))
  log.attempt("def_not_closed", () => {
    sthm(@kernel.new_basic_definition(eq(@kernel.mk_var("c", a), app(g, x))))
  })
  log.attempt("def_tyvars", () => {
    sthm(
      @kernel.new_basic_definition(
        eq(
          @kernel.mk_var("c", @kernel.bool_ty),
          eq(@kernel.mk_abs(x, x), @kernel.mk_abs(x, x)),
        ),
      ),
    )
  })
  log.attempt("def", () => {
    sthm(
      @kernel.new_basic_definition(
        eq(@kernel.mk_var("ID", fn_(a, a)), @kernel.mk_abs(x, x)),
      ),
    )
  })
  log.attempt("def_again", () => {
    sthm(
      @kernel.new_basic_definition(
        eq(@kernel.mk_const("ID", @list.List([])), @kernel.mk_abs(x, x)),
      ),
    )
  })
  log.attempt("def_dup_var", () => {
    sthm(
      @kernel.new_basic_definition(
        eq(@kernel.mk_var("ID", fn_(a, a)), @kernel.mk_abs(x, x)),
      ),
    )
  })
  log.attempt("definitions", () => slist(sthm, @kernel.definitions()))
  let sym = th => {
    let (l, _) = @kernel.dest_eq(@kernel.concl(th))
    let eqc = @kernel.rator(@kernel.rator(@kernel.concl(th)))
    @kernel.eq_mp(
      @kernel.mk_comb_rule(
        @kernel.mk_comb_rule(@kernel.refl(eqc), th),
        @kernel.refl(l),
      ),
      @kernel.refl(l),
    )
  }
  let fba = fn_(b, a)
  let v = @kernel.mk_var("v", fba)
  let w = @kernel.mk_var("w", fba)
  let pred = @kernel.mk_abs(v, eq(v, v))
  let pw = @kernel.eq_mp(sym(@kernel.beta(app(pred, v))), @kernel.refl(v))
  log.attempt("sym", () => sthm(sym(@kernel.assume_rule(eq(x, y)))))
  let tydef = (name, abs, rep, th) => {
    @kernel.new_basic_type_definition(name, abs, rep, th)
  }
  log.attempt("tydef_hyp", () => {
    sthm(tydef("t1", "mk", "dest", @kernel.assume_rule(p)).0)
  })
  log.attempt("tydef_noncomb", () => {
    sthm(tydef("t1", "mk", "dest", @kernel.refl(p)).0)
  })
  log.attempt("tydef_const_used", () => sthm(tydef("t1", "ID", "dest", pw).0))
  log.attempt("tydef_open", () => {
    sthm(
      tydef(
        "t1",
        "mk",
        "dest",
        @kernel.assume_rule(app(@kernel.mk_abs(v, eq(v, w)), v)),
      ).0,
    )
  })
  log.attempt("tydef_type_used", () => sthm(tydef("ind", "mk1", "dest1", pw).0))
  log.attempt("tydef", () => {
    let (th1, th2) = tydef("t1", "mk", "dest", pw)
    sthm(th1) + " ;; " + sthm(th2)
  })
  log.attempt("types", () => {
    slist((e : (String, Int64)) => e.0 + "/" + e.1.to_string(), @kernel.types())
  })
  log.attempt("constants", () => {
    slist(
      (e : (String, @kernel.HolType)) => e.0 + ":" + sty(e.1),
      @kernel.constants(),
    )
  })
  log.attempt("definitions", () => slist(sthm, @kernel.definitions()))
  inspect(
    log.buf.to_string(),
    content=(
      #|tyvars = ['B; 'A]
      #|mk_type_bad ! mk_type: wrong number of arguments to fun
      #|mk_type_undef ! mk_type: type foo has not been defined
      #|new_type_dup ! new_type: type ind has already been declared
      #|type_subst = fun(ind,fun('A,ind))
      #|mk_comb_bad ! mk_comb: types do not agree
      #|mk_abs_bad = (\g:fun('A,'A). x:'A)
      #|mk_const_bad ! mk_const: not a constant name
      #|frees = [g:fun('A,'A); z:'A; f:fun('A,fun('A,'A)); y:'A]
      #|freesl = [z:'A; f:fun('A,fun('A,'A)); g:fun('A,'A); y:'A; x:'A]
      #|type_vars_in_term = ['B; 'A]
      #|variant = x''':'A
      #|vsubst_capture = (\y':'A. ((f:fun('A,fun('A,'A)) y:'A) y':'A))
      #|vsubst_bad ! vsubst: Bad substitution list
      #|vsubst_bound = (\x:'A. (g:fun('A,'A) x:'A))
      #|inst_clash = (\x':'B. ((f:fun('B,fun('B,'B)) x':'B) x:'B))
      #|inst_simple = (\x:ind. (g:fun(ind,ind) x:ind))
      #|alphaorder = [0; -1; 1; -1; -1; 1]
      #|compare = [1; -1; 1; -1; -1; -1; -1]
      #|REFL =  |- ((#=:fun('A,fun('A,bool)) ((f:fun('A,fun('A,'A)) x:'A) (g:fun('A,'A) y:'A))) ((f:fun('A,fun('A,'A)) x:'A) (g:fun('A,'A) y:'A)))
      #|ASSUME = p:bool |- p:bool
      #|ASSUME_bad ! ASSUME: not a proposition
      #|TRANS = ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool), ((#=:fun(bool,fun(bool,bool)) q:bool) r:bool) |- ((#=:fun(bool,fun(bool,bool)) p:bool) r:bool)
      #|TRANS_bad ! TRANS
      #|MK_COMB = ((#=:fun('A,fun('A,bool)) x:'A) y:'A), ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) g:fun('A,'A)) g:fun('A,'A)) |- ((#=:fun('A,fun('A,bool)) (g:fun('A,'A) x:'A)) (g:fun('A,'A) y:'A))
      #|MK_COMB_bad ! MK_COMB: types do not agree
      #|ABS = ((#=:fun('A,fun('A,bool)) x:'A) y:'A) |- ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (\z:'A. x:'A)) (\z:'A. y:'A))
      #|ABS_bad ! ABS
      #|BETA =  |- ((#=:fun('A,fun('A,bool)) ((\x:'A. (g:fun('A,'A) x:'A)) x:'A)) (g:fun('A,'A) x:'A))
      #|BETA_bad ! BETA: not a trivial beta-redex
      #|EQ_MP = p:bool, ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool) |- q:bool
      #|EQ_MP_bad ! EQ_MP
      #|DEDUCT_ANTISYM = p:bool, r:bool, ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool) |- ((#=:fun(bool,fun(bool,bool)) q:bool) r:bool)
      #|TRANS_alpha_mismatch ! TRANS
      #|hyp_alpha_dedup =  |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (\x:'A. (g:fun('A,'A) x:'A))) g:fun('A,'A))) ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) (\y:'A. (g:fun('A,'A) y:'A))) g:fun('A,'A)))
      #|INST_TYPE = ((#=:fun(ind,fun(ind,bool)) (g:fun(ind,ind) x:ind)) y:ind) |- ((#=:fun(ind,fun(ind,bool)) (g:fun(ind,ind) x:ind)) y:ind)
      #|INST = ((#=:fun('A,fun('A,bool)) x:'A) z:'A), ((#=:fun('A,fun('A,bool)) z:'A) x:'A) |- ((#=:fun(bool,fun(bool,bool)) ((#=:fun('A,fun('A,bool)) z:'A) x:'A)) ((#=:fun('A,fun('A,bool)) x:'A) z:'A))
      #|INST_bad ! vsubst: Bad substitution list
      #|INST_merge = ((#=:fun('A,fun('A,bool)) x:'A) x:'A) |- ((#=:fun('A,fun('A,bool)) x:'A) x:'A)
      #|new_axiom_bad ! new_axiom: Not a proposition
      #|new_axiom =  |- ((#=:fun(bool,fun(bool,bool)) p:bool) p:bool)
      #|axioms = [ |- ((#=:fun(bool,fun(bool,bool)) p:bool) p:bool)]
      #|def_not_closed ! new_definition: term not closed: g, x
      #|def_tyvars ! new_definition: Type variables not reflected in constant
      #|def =  |- ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) #ID:fun('A,'A)) (\x:'A. x:'A))
      #|def_again ! new_basic_definition: 'ID' is already defined
      #|def_dup_var ! new_constant: constant ID has already been declared
      #|definitions = [ |- ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) #ID:fun('A,'A)) (\x:'A. x:'A))]
      #|sym = ((#=:fun('A,fun('A,bool)) x:'A) y:'A) |- ((#=:fun('A,fun('A,bool)) y:'A) x:'A)
      #|tydef_hyp ! new_basic_type_definition: Assumptions in theorem
      #|tydef_noncomb ! new_basic_type_definition: Predicate is not closed
      #|tydef_const_used ! new_basic_type_definition: Constant(s) already in use
      #|tydef_open ! new_basic_type_definition: Assumptions in theorem
      #|tydef_type_used ! new_basic_type_definition: Type already defined
      #|tydef =  |- ((#=:fun(t1('A,'B),fun(t1('A,'B),bool)) (#mk:fun(fun('B,'A),t1('A,'B)) (#dest:fun(t1('A,'B),fun('B,'A)) a:t1('A,'B)))) a:t1('A,'B)) ;;  |- ((#=:fun(bool,fun(bool,bool)) ((\v:fun('B,'A). ((#=:fun(fun('B,'A),fun(fun('B,'A),bool)) v:fun('B,'A)) v:fun('B,'A))) r:fun('B,'A))) ((#=:fun(fun('B,'A),fun(fun('B,'A),bool)) (#dest:fun(t1('A,'B),fun('B,'A)) (#mk:fun(fun('B,'A),t1('A,'B)) r:fun('B,'A)))) r:fun('B,'A)))
      #|types = [t1/2; ind/0; bool/0; fun/2]
      #|constants = [dest:fun(t1('A,'B),fun('B,'A)); mk:fun(fun('B,'A),t1('A,'B)); ID:fun('A,'A); =:fun('A,fun('A,bool))]
      #|definitions = [ |- ((#=:fun(fun('A,'A),fun(fun('A,'A),bool)) #ID:fun('A,'A)) (\x:'A. x:'A))]
      #|
    ),
  )
}
