// Differential test against equal.ml: replays
// tools/ocaml_ref/equal_ref.ml (keep in sync).

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
  self.buf.write_string(line + "\n")
}

///|
test "equal matches equal.ml" {
  let log = { buf: StringBuilder(), }
  @kernel.new_type("num", 0)
  @kernel.new_constant("+", @term_syntax.parse_type("(Num, Num) -> Num"))
  @printer.parse_as_infix("+", (16, "right"))
  @kernel.new_constant("forall", @term_syntax.parse_type("((A) -> Bool) -> Bool"))
  @printer.parse_as_binder("forall")
  @printer.parse_as_binder("\\")
  @printer.parse_as_infix("=", (12, "right"))
  @kernel.new_constant("c", @term_syntax.parse_type("Num"))
  let tm = @term_syntax.parse_term
  let th = (name : String, f : () -> @kernel.Thm raise) => {
    log.attempt(name, () => @printer.string_of_thm(f()))
  }
  let t = (name : String, f : () -> @kernel.Term raise) => {
    log.attempt(name, () => @printer.string_of_term(f()))
  }
  let hyp_of = (s : String) => @kernel.assume_rule(tm(s))
  let beta = @equal.beta_conv
  th("BETA_CONV", () => beta(tm("((x : Num) => x + x)(c)")))
  th("BETA_CONV_var", () => beta(tm("((x : Num) => x + (y : Num))((x : Num))")))
  th("BETA_CONV_bad", () => beta(tm("(f : (Num) -> Num)(c)")))
  th("AP_TERM", () => @equal.ap_term(tm("(f : (Num) -> Num)"), hyp_of("(x : Num) == (y : Num)")))
  th("AP_TERM_bad", () => {
    @equal.ap_term(tm("(f : (Bool) -> Num)"), hyp_of("(x : Num) == (y : Num)"))
  })
  th("AP_THM", () => @equal.ap_thm(hyp_of("(f : (Num) -> Num) == (g : (Num) -> Num)"), tm("c")))
  th("SYM", () => @equal.sym(hyp_of("(x : Num) == (y : Num) + c")))
  th("ALPHA", () => {
    @equal.alpha_rule(tm("(x : Num) => x + c"), tm("(y : Num) => y + c"))
  })
  th("ALPHA_bad", () => {
    @equal.alpha_rule(tm("(x : Num) => x + c"), tm("(y : Num) => c + y"))
  })
  th("ALPHA_CONV", () => @equal.alpha_conv(tm("(z : Num)"))(tm("(x : Num) => x + c")))
  th("GEN_ALPHA_CONV", () => {
    @equal.gen_alpha_conv(tm("(z : Num)"))(tm("∀ x : Num, x + c == c"))
  })
  th("MK_BINOP", () => {
    @equal.mk_binop_rule(
      tm("op_plus"),
      hyp_of("(a : Num) == (b : Num)"),
      hyp_of("(c' : Num) == (d : Num)"),
    )
  })
  th("THENC", () => {
    @equal.thenc(beta, beta)(tm("((x : Num) => ((y : Num) => y + x)(c))(c)"))
  })
  th("ORELSEC", () => @equal.orelsec(@equal.no_conv, beta)(tm("((x : Num) => x)(c)")))
  th("REPEATC", () => @equal.repeatc(beta)(tm("((x : Num) => ((y : Num) => y)(x))(c)")))
  th("CHANGED_CONV", () => @equal.changed_conv(@equal.all_conv)(tm("c")))
  th("TRY_CONV", () => @equal.try_conv(beta)(tm("c")))
  th("FIRST_CONV", () => {
    @equal.first_conv(@list.List([@equal.no_conv, beta, @equal.all_conv]))(
      tm("((x : Num) => x)(c)"),
    )
  })
  th("EVERY_CONV", () => {
    @equal.every_conv(@list.List([beta, @equal.all_conv]))(tm("((x : Num) => x)(c)"))
  })
  th("RATOR_CONV", () => {
    @equal.rator_conv(@equal.rand_conv(beta))(tm("((x : Num) => x)(c) + c"))
  })
  th("LAND_CONV", () => @equal.land_conv(beta)(tm("((x : Num) => x)(c) + c")))
  th("RAND_CONV_bad", () => @equal.rand_conv(beta)(tm("c")))
  th("COMB_CONV", () => {
    @equal.comb_conv(@equal.try_conv(beta))(tm("(f : (Num) -> Num)(((x : Num) => x)(c))"))
  })
  th("ABS_CONV", () => @equal.abs_conv(beta)(tm("(y : Num) => ((x : Num) => x + y)(c)")))
  th("ABS_CONV_hyp", () => {
    @equal.abs_conv(t => @kernel.assume_rule(@basics.mk_eq(t, tm("c"))))(
      tm("(x : Num) => x + c"),
    )
  })
  th("BINDER_CONV", () => {
    @equal.binder_conv(beta)(tm("∀ y : Num, ((x : Num) => x + y)(c) == c"))
  })
  th("SUB_CONV", () => {
    @equal.sub_conv(@equal.try_conv(beta))(
      tm("((x : Num) => x)(c) + ((x : Num) => x)(c)"),
    )
  })
  th("BINOP_CONV", () => {
    @equal.binop_conv(beta)(tm("((x : Num) => x)(c) + ((x : Num) => x)(c)"))
  })
  let nested = tm(
    "((f : (Num) -> Num) => f(((x : Num) => x + x)(c)))((y : Num) => ((z : Num) => z)(y))",
  )
  th("ONCE_DEPTH_CONV", () => @equal.once_depth_conv(beta)(nested))
  th("DEPTH_CONV", () => @equal.depth_conv(beta)(nested))
  th("REDEPTH_CONV", () => @equal.redepth_conv(beta)(nested))
  th("TOP_DEPTH_CONV", () => @equal.top_depth_conv(beta)(nested))
  th("TOP_SWEEP_CONV", () => @equal.top_sweep_conv(beta)(nested))
  th("DEPTH_CONV_none", () => @equal.depth_conv(beta)(tm("c + c")))
  th("DEPTH_BINOP_CONV", () => {
    @equal.depth_binop_conv(tm("op_plus"), @equal.try_conv(beta))(
      tm("((x : Num) => x)(c) + (c + ((y : Num) => y + y)(c))"),
    )
  })
  th("PATH_CONV", () => @equal.path_conv("lr", beta)(tm("((x : Num) => x)(c) + c")))
  th("PAT_CONV", () => {
    @equal.pat_conv(tm("(x : Num) => x + c"), beta)(tm("((x : Num) => x)(c) + c"))
  })
  th("SYM_CONV", () => @equal.sym_conv(tm("(x : Num) == (y : Num)")))
  th("CONV_RULE", () => {
    @equal.conv_rule(@equal.rand_conv(beta), hyp_of("(a : Num) == ((x : Num) => x)(c)"))
  })
  th("SUBS_CONV", () => {
    @equal.subs_conv(@list.List([hyp_of("(a : Num) == (b : Num)"), hyp_of("c == (d : Num)")]))(
      tm("(a : Num) + (c + ((a : Num) => a)((b : Num)))"),
    )
  })
  th("SUBS", () => {
    @equal.subs(@list.List([hyp_of("(a : Num) == (b : Num)")]), hyp_of("(a : Num) + a == c"))
  })
  th("BETA_RULE", () => {
    @equal.beta_rule(hyp_of("((x : Num) => ((y : Num) => y)(x))(c) == c"))
  })
  th("GSYM", () => @equal.gsym(hyp_of("∀ x : Num, x == c")))
  let cc = @equal.cache_conv(beta)
  th("CACHE_CONV1", () => cc(tm("((x : Num) => x + x)(c)")))
  th("CACHE_CONV2", () => cc(tm("((y : Num) => y + y)(c)")))
  th("CACHE_CONV3", () => cc(tm("((x : Num) => x + x)(c)")))
  t("mk_primed_var", () => {
    @equal.mk_primed_var(@list.List([tm("(x : Num)"), tm("(x' : Num)")]), tm("(x : Bool)"))
  })
  t("mk_primed_var_const", () => {
    let _ = @equal.mk_primed_var(@list.List([]), tm("(c' : Bool)"))
    @equal.mk_primed_var(@list.List([]), @kernel.mk_var("c", @kernel.bool_ty))
  })
  t("lhand", () => @equal.lhand(tm("(a : Num) + (b : Num)")))
  t("genvar_after", () => @basics.genvar(@kernel.bool_ty))
  th("COMB2_CONV_order", () => {
    @equal.comb2_conv(_ => raise Failure("left"), _ => raise Failure("right"))(
      tm("(f : (Num) -> Num)(c)"),
    )
  })
  th("BINOP_CONV_order", () => {
    @equal.binop_conv(t => raise Failure(@printer.string_of_term(t)))(
      tm("(a : Num) + (b : Num)"),
    )
  })
  th("BINOP2_CONV_order", () => {
    @equal.binop2_conv(_ => raise Failure("left"), _ => raise Failure("right"))(
      tm("(a : Num) + (b : Num)"),
    )
  })
  th("COMB_CONV_genvar", () => {
    @equal.comb_conv(t => {
      let v = @basics.genvar(@kernel.type_of(t))
      raise Failure(@kernel.dest_var(v).0)
    })(tm("(f : (Num) -> Num)(c)"))
  })
  inspect(
    log.buf.to_string(),
    content=(
      #|BETA_CONV = |- (\x. x + x) c = c + c
      #|BETA_CONV_var = |- (\x. x + y) x = x + y
      #|BETA_CONV_bad ! BETA_CONV: Not a beta-redex
      #|AP_TERM = x = y
      #||- f x = f y
      #|AP_TERM_bad ! AP_TERM
      #|AP_THM = f = g
      #||- f c = g c
      #|SYM = x = y + c
      #||- y + c = x
      #|ALPHA = |- (\x. x + c) = (\y. y + c)
      #|ALPHA_bad ! ALPHA
      #|ALPHA_CONV = |- (\x. x + c) = (\z. z + c)
      #|GEN_ALPHA_CONV = |- (forall x. x + c = c) = (forall z. z + c = c)
      #|MK_BINOP = a = b, c' = d
      #||- a + c' = b + d
      #|THENC = |- (\x. (\y. y + x) c) c = c + c
      #|ORELSEC = |- (\x. x) c = c
      #|REPEATC = |- (\x. (\y. y) x) c = c
      #|CHANGED_CONV ! CHANGED_CONV
      #|TRY_CONV = |- c = c
      #|FIRST_CONV = |- (\x. x) c = c
      #|EVERY_CONV = |- (\x. x) c = c
      #|RATOR_CONV = |- (\x. x) c + c = c + c
      #|LAND_CONV = |- (\x. x) c + c = c + c
      #|RAND_CONV_bad ! RAND_CONV: Not a combination
      #|COMB_CONV = |- f ((\x. x) c) = f c
      #|ABS_CONV = |- (\y. (\x. x + y) c) = (\y. c + y)
      #|ABS_CONV_hyp ! ABS
      #|BINDER_CONV ! BETA_CONV: Not a beta-redex
      #|SUB_CONV = |- (\x. x) c + (\x. x) c = (\x. x) c + c
      #|BINOP_CONV = |- (\x. x) c + (\x. x) c = c + c
      #|ONCE_DEPTH_CONV = |- (\f. f ((\x. x + x) c)) (\y. (\z. z) y) = (\y. (\z. z) y) ((\x. x + x) c)
      #|DEPTH_CONV = |- (\f. f ((\x. x + x) c)) (\y. (\z. z) y) = c + c
      #|REDEPTH_CONV = |- (\f. f ((\x. x + x) c)) (\y. (\z. z) y) = c + c
      #|TOP_DEPTH_CONV = |- (\f. f ((\x. x + x) c)) (\y. (\z. z) y) = c + c
      #|TOP_SWEEP_CONV = |- (\f. f ((\x. x + x) c)) (\y. (\z. z) y) = c + c
      #|DEPTH_CONV_none = |- c + c = c + c
      #|DEPTH_BINOP_CONV = |- (\x. x) c + c + (\y. y + y) c = c + c + c + c
      #|PATH_CONV = |- (\x. x) c + c = c + c
      #|PAT_CONV = |- (\x. x) c + c = c + c
      #|SYM_CONV = |- (x = y) = y = x
      #|CONV_RULE = a = (\x. x) c
      #||- a = c
      #|SUBS_CONV = c = d, a = b
      #||- a + c + (\a. a) b = b + d + (\a. a) b
      #|SUBS = a = b, a + a = c
      #||- b + b = c
      #|BETA_RULE = (\x. (\y. y) x) c = c
      #||- c = c
      #|GSYM = forall x. x = c
      #||- forall x. c = x
      #|CACHE_CONV1 = |- (\x. x + x) c = c + c
      #|CACHE_CONV2 = |- (\y. y + y) c = c + c
      #|CACHE_CONV3 = |- (\x. x + x) c = c + c
      #|mk_primed_var = x''
      #|mk_primed_var_const = c'
      #|lhand = a
      #|genvar_after = _7
      #|COMB2_CONV_order ! right
      #|BINOP_CONV_order ! b
      #|BINOP2_CONV_order ! right
      #|COMB_CONV_genvar ! _8
      #|

    ),
  )
}
