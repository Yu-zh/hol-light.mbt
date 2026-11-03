// Translated from upstream Examples/prover9.ml; edit this file directly.

///|
/// prover9
fn step_1() -> Unit raise {
  prover9_c.set("prover9")
}

///|
let prover9_c : @lib.Cell[String] = @lib.Cell::new("prover9")

///|
/// `prover9`
pub fn prover9() -> String {
  prover9_c.get()
}

///|
/// prover9_debugging
fn step_2() -> Unit raise {
  prover9_debugging_c.set(Ref::{ val: false })
}

///|
let prover9_debugging_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("prover9_debugging")

///|
/// `prover9_debugging`
pub fn prover9_debugging() -> Ref[Bool] {
  prover9_debugging_c.get()
}

///|
/// prover9_options
fn step_3() -> Unit raise {
  prover9_options_c.set(Ref::{ val: ("clear(auto_inference).\n" + ("clear(auto_denials).\n" + ("clear(auto_limits).\n" + ("set(neg_binary_resolution).\n" + ("set(binary_resolution).\n" + "set(paramodulation).\n"))))) })
}

///|
let prover9_options_c : @lib.Cell[Ref[String]] = @lib.Cell::new("prover9_options")

///|
/// `prover9_options`
pub fn prover9_options() -> Ref[String] {
  prover9_options_c.get()
}

///|
/// `functions`
pub fn[TA] functions(x1 : @list.List[@kernel.Term], x2 : @kernel.Term, x3 : (@list.List[@kernel.Term], @list.List[@kernel.Term], TA)) -> ((@list.List[@kernel.Term], @list.List[@kernel.Term], TA)) raise {
  let fvs = x1
  let tm = x2
  let (vacc, facc, racc) as acc = x3
  if @kernel.is_var(tm) {
    if @lib.mem(tm, fvs) {
      (vacc, @lib.insert(tm, facc), racc)
    } else {
      (@lib.insert(tm, vacc), facc, racc)
    }
  } else {
    if @kernel.is_abs(tm) {
      acc
    } else {
      let (f, args) = @basics.strip_comb(tm)
      @lib.itlist((x4 : @kernel.Term, x5 : (@list.List[@kernel.Term], @list.List[@kernel.Term], TA)) => functions(fvs, x4, x5), args, (vacc, @lib.insert(f, facc), racc))
    }
  }
}

///|
/// `signature`
pub fn signature(x6 : @list.List[@kernel.Term], x7 : @kernel.Term, x8 : (@list.List[@kernel.Term], @list.List[@kernel.Term], @list.List[@kernel.Term])) -> ((@list.List[@kernel.Term], @list.List[@kernel.Term], @list.List[@kernel.Term])) raise {
  let fvs = x6
  let tm = x7
  let (vacc, facc, racc) as acc = x8
  if @basics.is_neg(tm) {
    signature(fvs, @kernel.rand(tm), acc)
  } else {
    if (@basics.is_conj(tm) || (@basics.is_disj(tm) || (@basics.is_imp(tm) || @bool.is_iff(tm)))) {
      let t9 = signature(fvs, @kernel.rand(tm), acc)
      signature(fvs, @equal.lhand(tm), t9)
    } else {
      if (@basics.is_forall(tm) || (@basics.is_exists(tm) || @basics.is_uexists(tm))) {
        signature(fvs, @basics.body(@kernel.rand(tm)), acc)
      } else {
        if @basics.is_eq(tm) {
          let t10 = functions(fvs, @kernel.rand(tm), acc)
          functions(fvs, @equal.lhand(tm), t10)
        } else {
          if @kernel.is_abs(tm) {
            acc
          } else {
            let (r, args) = @basics.strip_comb(tm)
            @lib.itlist((x11 : @kernel.Term, x12 : (@list.List[@kernel.Term], @list.List[@kernel.Term], @list.List[@kernel.Term])) => functions(fvs, x11, x12), args, (vacc, facc, @lib.insert(r, racc)))
          }
        }
      }
    }
  }
}

///|
/// `folterm`
#derive(Eq, Debug)
pub(all) enum Folterm {
  Variable(String)
  Function(String, @list.List[Folterm])
}

///|
pub extend Folterm with Eq::{not_equal, equal}

///|
pub extend Folterm with Debug::{to_repr}

///|
pub extend Folterm with @lib.OCompare::{ocompare}

///|
pub extend Folterm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Folterm(x : Folterm) -> Int {
  match x {
    Variable(_) => 1000000
    Function(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Folterm with fn ocompare(self, other) {
  match (self, other) {
    (Variable(a0), Variable(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Function(a0, a1), Function(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Folterm(self).compare(ocaml_rank_Folterm(other))
  }
}

///|
pub impl @lib.OHash for Folterm with fn ohash_visit(self, h) {
  match self {
    Variable(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Function(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `literal`
#derive(Eq, Debug)
pub(all) enum Literal {
  Literal(Bool, String, @list.List[Folterm])
}

///|
pub extend Literal with Eq::{not_equal, equal}

///|
pub extend Literal with Debug::{to_repr}

///|
pub extend Literal with @lib.OCompare::{ocompare}

///|
pub extend Literal with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Literal(x : Literal) -> Int {
  match x {
    Literal(_, _, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for Literal with fn ocompare(self, other) {
  match (self, other) {
    (Literal(a0, a1, a2), Literal(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ => ocaml_rank_Literal(self).compare(ocaml_rank_Literal(other))
  }
}

///|
pub impl @lib.OHash for Literal with fn ohash_visit(self, h) {
  match self {
    Literal(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `translate_term`
pub fn[TA] translate_term(x13 : (@lib.Func[@kernel.Term, String], @lib.Func[@kernel.Term, String], TA), x14 : @kernel.Term) -> Folterm raise {
  let (trans_var, trans_fun, trans_rel) as trp = x13
  let tm = x14
  let (f, args) = @basics.strip_comb(tm)
  if @lib.defined(trans_fun, f) {
    let t16 = @lib.map((x15 : @kernel.Term) => translate_term(trp, x15), args)
    Folterm::Function(@lib.apply(trans_fun, f), t16)
  } else {
    if @kernel.is_var(tm) {
      Folterm::Variable(@lib.apply(trans_var, tm))
    } else {
      raise Failure(("unknown function" + (try {
        @kernel.dest_const(tm).0
      } catch {
        Failure(_) => "??"
        e => raise e
      })))
    }
  }
}

///|
/// `translate_atom`
pub fn translate_atom(x17 : (@lib.Func[@kernel.Term, String], @lib.Func[@kernel.Term, String], @lib.Func[@kernel.Term, String]), x18 : @kernel.Term) -> Literal raise {
  let (trans_var, trans_fun, trans_rel) as trp = x17
  let tm = x18
  if @basics.is_eq(tm) {
    let t19 = translate_term(trp, @kernel.rand(tm))
    Literal::Literal(true, "=", @list.List([translate_term(trp, @equal.lhand(tm)), t19]))
  } else {
    let (r, args) = @basics.strip_comb(tm)
    let t21 = @lib.map((x20 : @kernel.Term) => translate_term(trp, x20), args)
    Literal::Literal(true, @lib.apply(trans_rel, r), t21)
  }
}

///|
/// `translate_clause`
pub fn translate_clause(x22 : (@lib.Func[@kernel.Term, String], @lib.Func[@kernel.Term, String], @lib.Func[@kernel.Term, String]), x23 : @kernel.Term) -> @list.List[Literal] raise {
  let trp = x22
  let tm = x23
  if @basics.is_disj(tm) {
    let t24 = translate_clause(trp, @kernel.rand(tm))
    translate_clause(trp, @equal.lhand(tm)).concat(t24)
  } else {
    if @basics.is_neg(tm) {
      match translate_atom(trp, @kernel.rand(tm)) {
        Literal::Literal(s, r, args) => @list.List([Literal::Literal(!s, r, args)])
      }
    } else {
      @list.List([translate_atom(trp, tm)])
    }
  }
}

///|
/// `prover9_of_term`
pub fn prover9_of_term(x25 : Folterm) -> String raise {
  let tm = x25
  match tm {
    Folterm::Variable(s) => s
    Folterm::Function(f, Empty) => f
    Folterm::Function(f_1, args) => (f_1 + ("(" + (@lib.end_itlist(fn(x26 : String, x27 : String) -> String raise {
      let s_1 = x26
      let t = x27
      (s_1 + ("," + t))
    }, @lib.map(prover9_of_term, args)) + ")")))
  }
}

///|
/// `prover9_of_literal`
pub fn prover9_of_literal(x28 : Literal) -> String raise {
  let lit = x28
  match lit {
    Literal::Literal(s, r, Empty) => {
      if s {
        r
      } else {
        ("-" + r)
      }
    }
    Literal::Literal(s_1, "=", More(l, tail=More(r_1, tail=Empty))) => {
      let t29 = (" = " + (prover9_of_term(r_1) + ")"))
      let t30 = (prover9_of_term(l) + t29)
      ((if s_1 {
        "("
      } else {
        "-("
      }) + t30)
    }
    Literal::Literal(s_2, r_2, args) => {
      let t33 = (r_2 + ("(" + (@lib.end_itlist(fn(x31 : String, x32 : String) -> String raise {
        let s_3 = x31
        let t = x32
        (s_3 + ("," + t))
      }, @lib.map(prover9_of_term, args)) + ")")))
      ((if s_2 {
        ""
      } else {
        "-"
      }) + t33)
    }
  }
}

///|
/// `prover9_of_clause`
pub fn prover9_of_clause(x34 : @list.List[Literal]) -> String raise {
  let cls = x34
  match cls {
    Empty => raise Failure("prover9_of_clause: empty clause")
    More(l, tail=Empty) => prover9_of_literal(l)
    More(l_1, tail=ls) => {
      let t35 = (" | " + prover9_of_clause(ls))
      (prover9_of_literal(l_1) + t35)
    }
  }
}

///|
/// `sexp`
#derive(Eq, Debug)
pub(all) enum Sexp {
  Atom(String)
  List(@list.List[Sexp])
}

///|
pub extend Sexp with Eq::{not_equal, equal}

///|
pub extend Sexp with Debug::{to_repr}

///|
pub extend Sexp with @lib.OCompare::{ocompare}

///|
pub extend Sexp with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Sexp(x : Sexp) -> Int {
  match x {
    Atom(_) => 1000000
    List(_) => 1000001
  }
}

///|
pub impl @lib.OCompare for Sexp with fn ocompare(self, other) {
  match (self, other) {
    (Atom(a0), Atom(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (List(a0), List(b0)) => {
      
      @lib.compare(a0, b0)
    }
    _ => ocaml_rank_Sexp(self).compare(ocaml_rank_Sexp(other))
  }
}

///|
pub impl @lib.OHash for Sexp with fn ohash_visit(self, h) {
  match self {
    Atom(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    List(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `atom`
pub fn atom(x36 : ArrayView[@lexer.Lexcode]) -> ((Sexp, ArrayView[@lexer.Lexcode])) raise {
  let inp = x36
  match inp {
    [@lexer.Lexcode::Resword("("), ..rst] => raise @parserutil.Noparse
    [@lexer.Lexcode::Resword(")"), ..rst_1] => raise @parserutil.Noparse
    [@lexer.Lexcode::Resword(s), ..rst_2] => (Sexp::Atom(s), rst_2)
    [@lexer.Lexcode::Ident(s_1), ..rst_3] => (Sexp::Atom(s_1), rst_3)
    [] => raise @parserutil.Noparse
  }
}

///|
/// `sexpression`
pub fn sexpression(x37 : ArrayView[@lexer.Lexcode]) -> ((Sexp, ArrayView[@lexer.Lexcode])) raise {
  let inp = x37
  let t39 = @parserutil.a(@lexer.Lexcode::Resword(")"))
  let t38 = @parserutil.many(sexpression)
  @parserutil.alt(atom, @parserutil.map(@parserutil.seq(@parserutil.seq(@parserutil.a(@lexer.Lexcode::Resword("(")), t38), t39), fn(x40 : ((@lexer.Lexcode, @list.List[Sexp]), @lexer.Lexcode)) -> Sexp raise {
    let ((_, l), _) = x40
    Sexp::List(l)
  }))(inp)
}

///|
/// `skipheader`
pub fn skipheader(x41 : Int64, x42 : String) -> String raise {
  let i = x41
  let s = x42
  if (@lib.string_sub(s, @lib.int63_to_int(i), 28) == ";; BEGINNING OF PROOF OBJECT") {
    let t43 = @lib.sub63(@lib.sub63(Int::to_int64(@lib.string_length(s)), i), 28L)
    @lib.string_sub(s, @lib.int63_to_int(@lib.add63(i, 28L)), @lib.int63_to_int(t43))
  } else {
    skipheader(@lib.add63(i, 1L), s)
  }
}

///|
/// `parse_proofstep`
pub fn parse_proofstep(x44 : Sexp) -> ((String, Sexp, Sexp)) raise {
  let ps = x44
  match ps {
    Sexp::List(More(Sexp::Atom(id), tail=More(just, tail=More(formula, tail=More(Sexp::Atom("NIL"), tail=Empty))))) => (id, just, formula)
    _ => raise Failure("unexpected proofstep")
  }
}

///|
/// `folterm_of_sexp`
pub fn folterm_of_sexp(x45 : Sexp) -> Folterm raise {
  let sexp = x45
  match sexp {
    Sexp::Atom(s) if (@lib.string_sub(s, 0, 1) == "v") => Folterm::Variable(s)
    Sexp::Atom(s_1) => Folterm::Function(s_1, @list.List([]))
    Sexp::List(More(Sexp::Atom(f), tail=args)) => Folterm::Function(f, @lib.map(folterm_of_sexp, args))
    _ => raise Failure("folterm_of_sexp: malformed sexpression term representation")
  }
}

///|
/// `folatom_of_sexp`
pub fn folatom_of_sexp(x46 : Sexp) -> Literal raise {
  let sexp = x46
  match sexp {
    Sexp::Atom(r) => Literal::Literal(true, r, @list.List([]))
    Sexp::List(More(Sexp::Atom(r_1), tail=args)) => Literal::Literal(true, r_1, @lib.map(folterm_of_sexp, args))
    _ => raise Failure("folatom_of_sexp: malformed sexpression atom representation")
  }
}

///|
/// `folliteral_of_sexp`
pub fn folliteral_of_sexp(x47 : Sexp) -> Literal raise {
  let sexp = x47
  match sexp {
    Sexp::List(More(Sexp::Atom("not"), tail=More(sex, tail=Empty))) => {
      match folatom_of_sexp(sex) {
        Literal::Literal(s, r, args) => Literal::Literal(!s, r, args)
      }
    }
    _ => folatom_of_sexp(sexp)
  }
}

///|
/// `folclause_of_sexp`
pub fn folclause_of_sexp(x48 : Sexp) -> @list.List[Literal] raise {
  let sexp = x48
  match sexp {
    Sexp::List(More(Sexp::Atom("or"), tail=More(sex1, tail=More(sex2, tail=Empty)))) => {
      let t49 = folclause_of_sexp(sex2)
      folclause_of_sexp(sex1).concat(t49)
    }
    _ => @list.List([folliteral_of_sexp(sexp)])
  }
}

///|
/// `hol_of_folterm`
pub fn[TA] hol_of_folterm(x50 : (@lib.Func[String, @kernel.Term], TA), x51 : @kernel.HolType, x52 : Folterm) -> @kernel.Term raise {
  let (btrans_fun, btrans_rel) as trp = x50
  let ty = x51
  let tm = x52
  match tm {
    Folterm::Variable(x) => {
      let t53 = @kernel.mk_var(x, ty)
      @kernel.variant(@lib.ran(btrans_fun), t53)
    }
    Folterm::Function(fs, args) => {
      let f = @lib.apply(btrans_fun, fs)
      let (tys, rty) = @lib.nsplit(@basics.dest_fun_ty, args, @kernel.type_of(f))
      @basics.list_mk_comb(f, @lib.map2((x54 : @kernel.HolType, x55 : Folterm) => hol_of_folterm(trp, x54, x55), tys, args))
    }
  }
}

///|
/// `hol_of_folliteral`
pub fn hol_of_folliteral(x56 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x57 : Literal) -> @kernel.Term raise {
  let (btrans_fun, btrans_rel) as trp = x56
  let lit = x57
  match lit {
    Literal::Literal(s, "false", Empty) => {
      if s {
        @kernel.mk_const("F", @list.List([]))
      } else {
        @bool.mk_neg(@kernel.mk_const("F", @list.List([])))
      }
    }
    Literal::Literal(s_1, "=", More(l, tail=More(r, tail=Empty))) => {
      let tml_prov = hol_of_folterm(trp, @kernel.aty, l)
      let tmr_prov = hol_of_folterm(trp, @kernel.aty, r)
      let ty = if (@kernel.type_of(tml_prov) != @kernel.aty) {
        @kernel.type_of(tml_prov)
      } else {
        if (@kernel.type_of(tmr_prov) != @kernel.aty) {
          @kernel.type_of(tmr_prov)
        } else {
          @kernel.aty
        }
      }
      let t58 = hol_of_folterm(trp, ty, r)
      let ptm = @basics.mk_eq(hol_of_folterm(trp, ty, l), t58)
      if s_1 {
        ptm
      } else {
        @bool.mk_neg(ptm)
      }
    }
    Literal::Literal(s_2, rs, args) => {
      let r_1 = @lib.apply(btrans_rel, rs)
      let (tys, rty) = @lib.nsplit(@basics.dest_fun_ty, args, @kernel.type_of(r_1))
      let ptm_1 = @basics.list_mk_comb(r_1, @lib.map2((x59 : @kernel.HolType, x60 : Folterm) => hol_of_folterm(trp, x59, x60), tys, args))
      if s_2 {
        ptm_1
      } else {
        @bool.mk_neg(ptm_1)
      }
    }
  }
}

///|
/// `is_truevar`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] is_truevar(x61 : (@lib.Func[TA, @kernel.Term], TB), x62 : @kernel.Term) -> Bool raise {
  let (bf, _) = x61
  let tm = x62
  (@kernel.is_var(tm) && !@lib.mem(tm, @lib.ran(bf)))
}

///|
/// `hol_of_folclause`
pub fn hol_of_folclause(x63 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x64 : @list.List[Literal]) -> @kernel.Term raise {
  let trp = x63
  let cls = x64
  match cls {
    Empty => @kernel.mk_const("F", @list.List([]))
    More(c, tail=Empty) => hol_of_folliteral(trp, c)
    More(c_1, tail=cs) => {
      let rawcls = @lib.map((x65 : Literal) => hol_of_folliteral(trp, x65), cls)
      let is_truevar_1 : (@kernel.Term) -> Bool raise = fn(x66 : @kernel.Term) -> Bool raise {
        let tm = x66
        (@kernel.is_var(tm) && (!@lib.mem(tm, @lib.ran(trp.0)) && !@lib.mem(tm, @lib.ran(trp.1))))
      }
      let (und, dec) = @lib.partition(fn(x67 : @kernel.Term) -> Bool raise {
        let t = x67
        (@basics.is_eq(t) && (is_truevar_1(@equal.lhs(t)) && is_truevar_1(@equal.rhs(t))))
      }, rawcls)
      if (@list.List::is_empty(und) || @list.List::is_empty(dec)) {
        @bool.list_mk_disj(rawcls)
      } else {
        let cxt = @lib.map(@kernel.dest_var, @lib.filter(is_truevar_1, @kernel.freesl(dec)))
        let correct : (@kernel.Term) -> @kernel.Term raise = fn(x68 : @kernel.Term) -> @kernel.Term raise {
          let t_1 = x68
          try {
            let (l, r) = @kernel.dest_eq(t_1)
            let ls = @kernel.dest_var(l).0
            let rs = @kernel.dest_var(r).0
            let ty = try {
              @lib.assoc(ls, cxt)
            } catch {
              Failure(_) => @lib.assoc(rs, cxt)
              e => raise e
            }
            let t69 = @kernel.mk_var(rs, ty)
            @basics.mk_eq(@kernel.mk_var(ls, ty), t69)
          } catch {
            Failure(_) => t_1
            e => raise e
          }
        }
        @bool.list_mk_disj(@lib.map(correct, rawcls))
      }
    }
  }
}

///|
/// `hol_of_term`
pub fn[TA] hol_of_term(x70 : (@lib.Func[String, @kernel.Term], TA), x71 : @kernel.HolType, x72 : Sexp) -> @kernel.Term raise {
  let trp = x70
  let ty = x71
  let sexp = x72
  hol_of_folterm(trp, ty, folterm_of_sexp(sexp))
}

///|
/// `hol_of_literal`
pub fn hol_of_literal(x73 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x74 : Sexp) -> @kernel.Term raise {
  let trp = x73
  let sexp = x74
  hol_of_folliteral(trp, folliteral_of_sexp(sexp))
}

///|
/// `hol_of_clause`
pub fn hol_of_clause(x75 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x76 : Sexp) -> @kernel.Term raise {
  let trp = x75
  let sexp = x76
  hol_of_folclause(trp, folclause_of_sexp(sexp))
}

///|
/// `PARA_SUBS_CONV`
pub fn para_subs_conv(x77 : @list.List[Int64], x78 : @kernel.Thm, x79 : @kernel.Term) -> @kernel.Thm raise {
  let path = x77
  let eth = x78
  let tm = x79
  match path {
    Empty => {
      if (@equal.lhs(@kernel.concl(eth)) == tm) {
        eth
      } else {
        raise Failure("PARA_SUBS_CONV")
      }
    }
    More(n, tail=rpt) => {
      let (f, args) = @basics.strip_comb(tm)
      let t84 = @equal.rand_conv((x83 : @kernel.Term) => para_subs_conv(rpt, eth, x83))
      @lib.funpow(@lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.length(args)), n)), fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s81 = @equal.rator_conv(x80)
        fn(x82 : @kernel.Term) -> @kernel.Thm raise {
          s81(x82)
        }
      }, t84)(tm)
    }
  }
}

///|
/// FRONT1_DISJ_CONV
fn step_4() -> Unit raise {
  let t87 = @simp.gen_rewrite_conv(fn(x86 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x86
  }, @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (b || a)"))]))
  front1_disj_conv_c.set(@equal.orelsec(@simp.gen_rewrite_conv(fn(x85 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x85
  }, @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) || (c : Bool)) == (b || a || c)"))])), t87))
}

///|
let front1_disj_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("FRONT1_DISJ_CONV")

///|
/// `FRONT1_DISJ_CONV`
pub fn front1_disj_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (front1_disj_conv_c.get())(x)
}

///|
/// `FRONT_DISJ_CONV`
pub fn front_disj_conv(x88 : @list.List[Sexp], x89 : @kernel.Term) -> @kernel.Thm raise {
  let l = x88
  let tm = x89
  match l {
    Empty | More(Sexp::Atom("1"), tail=_) => @kernel.refl(tm)
    More(Sexp::Atom("2"), tail=t) => @equal.thenc(@equal.rand_conv((x90 : @kernel.Term) => front_disj_conv(t, x90)), front1_disj_conv)(tm)
    _ => raise Failure("unexpected director string in clause")
  }
}

///|
/// AP_IMP
fn step_5() -> Unit raise {
  let pp : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → (∀ x : Bool, x || a → x || b)")))
  ap_imp_c.set(fn(x91 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let t = x91
    fn(x94 : @kernel.Thm) -> @kernel.Thm raise {
      ((x93 : @kernel.Thm) => @bool.spec(t, x93))(pp(x94))
    }
  })
}

///|
let ap_imp_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("AP_IMP")

///|
/// `AP_IMP`
pub fn ap_imp(x : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (ap_imp_c.get())(x)
}

///|
/// `PARA_BACK_CONV`
pub fn para_back_conv(x95 : @list.List[Sexp], x96 : @kernel.Term) -> @kernel.Thm raise {
  let eqdir = x95
  let tm = x96
  match eqdir {
    More(Sexp::Atom("1"), tail=Empty) if !@basics.is_disj(tm) => @kernel.refl(tm)
    More(Sexp::Atom("2"), tail=Empty) if !@basics.is_disj(tm) => @equal.sym_conv(tm)
    More(Sexp::Atom("2"), tail=eqs) => @equal.rand_conv((x97 : @kernel.Term) => para_back_conv(eqs, x97))(tm)
    More(Sexp::Atom("1"), tail=More(Sexp::Atom(f), tail=Empty)) if @basics.is_disj(tm) => {
      let th1 = if (f == "2") {
        @equal.land_conv(@equal.sym_conv)(tm)
      } else {
        @kernel.refl(tm)
      }
      let tm_p = @kernel.rand(@kernel.concl(th1))
      let djs = @basics.disjuncts(tm_p)
      let t98 = @list.List([@lib.hd(djs)])
      let th2 = @canon.disj_aci_rule(@basics.mk_eq(tm_p, @bool.list_mk_disj(@lib.tl(djs).concat(t98))))
      @kernel.trans(th1, th2)
    }
    _ => raise Failure("PARA_BACK_CONV")
  }
}

///|
/// RESOLVE
fn step_6() -> Unit raise {
  let t100 = @term_syntax.parse_term("(!(a : Bool) || (b : Bool)) && (a || (c : Bool)) → b || c")
  let t101 = @term_syntax.parse_term("((a : Bool) || (b : Bool)) && (!a || (c : Bool)) → b || c")
  let t102 = @term_syntax.parse_term("(!(a : Bool) || (b : Bool)) && a → b")
  let t103 = @term_syntax.parse_term("((a : Bool) || (b : Bool)) && !a → b")
  let t104 = @term_syntax.parse_term("!(a : Bool) && (a || (b : Bool)) → b")
  let t105 = @term_syntax.parse_term("(a : Bool) && (!a || (b : Bool)) → b")
  let t106 = @term_syntax.parse_term("!(a : Bool) && a → false")
  let resrules = @lib.map(fn(x99 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    @drule.match_mp(@class.taut(x99))
  }, @list.List([@term_syntax.parse_term("(a : Bool) && !a → false"), t106, t105, t104, t103, t102, t101, t100]))
  resolve_c.set(fn(x107 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let th1 = x107
    fn(x108 : @kernel.Thm) -> @kernel.Thm raise {
      let th2 = x108
      let th = @bool.conj(th1, th2)
      @lib.tryfind(fn(x109 : (@kernel.Thm) -> @kernel.Thm raise) -> @kernel.Thm raise {
        let f = x109
        f(th)
      }, resrules)
    }
  })
}

///|
let resolve_c : @lib.Cell[(@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("RESOLVE")

///|
/// `RESOLVE`
pub fn resolve(x : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (resolve_c.get())(x)
}

///|
/// `ACI_CORRECT`
pub fn aci_correct(x110 : @kernel.Thm, x111 : @kernel.Term) -> @kernel.Thm raise {
  let th = x110
  let tm = x111
  try {
    @kernel.eq_mp(@canon.disj_aci_rule(@basics.mk_eq(@kernel.concl(th), tm)), th)
  } catch {
    Failure(_) => {
      let cxt = @lib.map(@kernel.dest_var, @kernel.frees(@kernel.concl(th)))
      fn correct(x112 : @kernel.Term) -> @kernel.Term raise {
        let t = x112
        if @basics.is_disj(t) {
          let t113 = correct(@kernel.rand(t))
          @bool.mk_disj(correct(@equal.lhand(t)), t113)
        } else {
          if @basics.is_neg(t) {
            @bool.mk_neg(correct(@kernel.rand(t)))
          } else {
            try {
              let (l, r) = @kernel.dest_eq(t)
              let ls = @kernel.dest_var(l).0
              let rs = @kernel.dest_var(r).0
              let ty = try {
                @lib.assoc(ls, cxt)
              } catch {
                Failure(_) => @lib.assoc(rs, cxt)
                e => raise e
              }
              let t114 = @kernel.mk_var(rs, ty)
              @basics.mk_eq(@kernel.mk_var(ls, ty), t114)
            } catch {
              Failure(_) => t
              e => raise e
            }
          }
        }
      }
      let tm_p = correct(tm)
      @kernel.eq_mp(@canon.disj_aci_rule(@basics.mk_eq(@kernel.concl(th), tm_p)), th)
    }
    e => raise e
  }
}

///|
/// `PROVER9_PATH_CONV`
pub fn prover9_path_conv(x115 : @list.List[Sexp], x116 : (@kernel.Term) -> @kernel.Thm raise) -> @equal.Conv raise {
  let l = x115
  let conv = x116
  match l {
    More(Sexp::Atom("2"), tail=t) => @equal.rand_conv(prover9_path_conv(t, conv))
    More(Sexp::Atom("1"), tail=t_1) => @equal.land_conv(prover9_path_conv(t_1, conv))
    Empty => conv
    _ => raise Failure("PROVER9_PATH_CONV:unknown path")
  }
}

///|
/// `PROVER9_FLIP_CONV`
pub fn prover9_flip_conv(x118 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x118
  if @basics.is_neg(tm) {
    @equal.rand_conv(@equal.sym_conv)(tm)
  } else {
    @equal.sym_conv(tm)
  }
}

///|
/// `process_proofstep`
pub fn[TA] process_proofstep(x119 : @list.List[@kernel.Thm], x120 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x121 : @lib.Func[String, @kernel.Thm], x122 : (TA, Sexp, Sexp)) -> @kernel.Thm raise {
  let ths = x119
  let trp = x120
  let asms = x121
  let (lab, just, fm) = x122
  let tm = hol_of_clause(trp, fm)
  match just {
    Sexp::List(More(Sexp::Atom("input"), tail=Empty)) => {
      if (if @basics.is_eq(tm) {
        let t123 = @equal.rhs(tm)
        (@equal.lhs(tm) == t123)
      } else {
        false
      }) {
        @kernel.refl(@kernel.rand(tm))
      } else {
        @lib.tryfind(fn(x124 : @kernel.Thm) -> @kernel.Thm raise {
          let th = x124
          @drule.part_match(fn(x125 : @kernel.Term) -> @kernel.Term raise {
            x125
          }, th)(tm)
        }, ths)
      }
    }
    Sexp::List(More(Sexp::Atom("flip"), tail=More(Sexp::Atom(n), tail=More(Sexp::List(path), tail=Empty)))) => {
      let th_1 = @lib.apply(asms, n)
      let nth = @equal.conv_rule(prover9_path_conv(path, prover9_flip_conv), th_1)
      if (@kernel.concl(nth) == tm) {
        nth
      } else {
        raise Failure("Inconsistency from flip")
      }
    }
    Sexp::List(More(Sexp::Atom("instantiate"), tail=More(Sexp::Atom("0"), tail=More(Sexp::List(More(Sexp::List(More(x, tail=More(Sexp::Atom("."), tail=More(y, tail=Empty)))), tail=Empty)), tail=Empty)))) => {
      let th_2 = @kernel.refl(hol_of_term(trp, @kernel.aty, y))
      if (@kernel.concl(th_2) == tm) {
        th_2
      } else {
        raise Failure("Inconsistency from instantiation of reflexivity")
      }
    }
    Sexp::List(More(Sexp::Atom("instantiate"), tail=More(Sexp::Atom(n_1), tail=More(Sexp::List(i), tail=Empty)))) => {
      let th_3 = @lib.apply(asms, n_1)
      let ilist = @lib.map(fn(x126 : Sexp) -> (Sexp, String) raise {
        match x126 {
          Sexp::List(More(Sexp::Atom(x_1), tail=More(Sexp::Atom("."), tail=More(y_1, tail=Empty)))) => (y_1, x_1)
          _ => raise @lib.MatchFailure("tscript.ml:366")
        }
      }, i)
      let xs = @lib.map(fn(x127 : (Sexp, String)) -> @kernel.Term raise {
        let (y_2, x_2) = x127
        @basics.find_term(fn(x128 : @kernel.Term) -> Bool raise {
          let v = x128
          (@kernel.is_var(v) && (@kernel.dest_var(v).0 == x_2))
        }, @kernel.concl(th_3))
      }, ilist)
      let ys = @lib.map2(fn(x129 : (Sexp, String), x130 : @kernel.Term) -> @kernel.Term raise {
        let (y_3, x_3) = x129
        let v_1 = x130
        hol_of_term(trp, @kernel.type_of(v_1), y_3)
      }, ilist, xs)
      @kernel.inst_rule(@lib.zip(ys, xs), th_3)
    }
    Sexp::List(More(Sexp::Atom("paramod"), tail=More(Sexp::Atom(eqid), tail=More(Sexp::List(eqdir), tail=More(Sexp::Atom(tmid), tail=More(Sexp::List(dir), tail=Empty)))))) => {
      let eth = @equal.conv_rule((x131 : @kernel.Term) => para_back_conv(eqdir, x131), @lib.apply(asms, eqid))
      let tth = @lib.apply(asms, tmid)
      let path_1 = @lib.map(fn(x132 : Sexp) -> Int64 raise {
        match x132 {
          Sexp::Atom(s) => @lib.int63_of_string(s)
          _ => raise @lib.MatchFailure("tscript.ml:376")
        }
      }, dir)
      let etm = @kernel.concl(eth)
      let th_4 = if @basics.is_disj(etm) {
        let djs = @basics.disjuncts(etm)
        let eq = @lib.last(djs)
        let t133 = @kernel.assume_rule(eq)
        let fth = @equal.conv_rule((x134 : @kernel.Term) => para_subs_conv(path_1, t133, x134), tth)
        let t138 = @bool.disch(eq, fth)
        @bool.mp(@lib.itlist(fn(x135 : @kernel.Term, x136 : @kernel.Thm) -> @kernel.Thm raise {
          let s137 = ap_imp(x135)
          s137(x136)
        }, @lib.butlast(djs), t138), eth)
      } else {
        @equal.conv_rule((x139 : @kernel.Term) => para_subs_conv(path_1, eth, x139), tth)
      }
      if (@kernel.concl(th_4) == tm) {
        th_4
      } else {
        raise Failure("Inconsistency from paramodulation")
      }
    }
    Sexp::List(More(Sexp::Atom("resolve"), tail=More(Sexp::Atom(l1), tail=More(Sexp::List(path1), tail=More(Sexp::Atom(l2), tail=More(Sexp::List(path2), tail=Empty)))))) => {
      let th1 = @equal.conv_rule((x140 : @kernel.Term) => front_disj_conv(path1, x140), @lib.apply(asms, l1))
      let th2 = @equal.conv_rule((x141 : @kernel.Term) => front_disj_conv(path2, x141), @lib.apply(asms, l2))
      let th3 = resolve(th1)(th2)
      aci_correct(th3, tm)
    }
    Sexp::List(More(Sexp::Atom("propositional"), tail=More(Sexp::Atom(l), tail=Empty))) => {
      let th1_1 = @lib.apply(asms, l)
      aci_correct(th1_1, tm)
    }
    _ => raise Failure("process_proofstep: no translation")
  }
}

///|
/// `process_proofsteps`
pub fn process_proofsteps(x142 : @list.List[@kernel.Thm], x143 : (@lib.Func[String, @kernel.Term], @lib.Func[String, @kernel.Term]), x144 : @lib.Func[String, @kernel.Thm], x145 : @list.List[(String, Sexp, Sexp)]) -> ((@lib.Func[String, @kernel.Thm], @list.List[(String, Sexp, Sexp)])) raise {
  let ths = x142
  let trp = x143
  let asms = x144
  let steps = x145
  match steps {
    Empty => (asms, @list.List([]))
    More((lab, _, _) as st, tail=sts) => {
      try {
        let th = process_proofstep(ths, trp, asms, st)
        process_proofsteps(ths, trp, @lib.update(lab, th, asms), sts)
      } catch {
        _ => (asms, steps)
      }
    }
  }
}

///|
/// `PROVER9_REFUTE`
pub fn prover9_refute(x146 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let ths = x146
  let fvs = @lib.itlist(fn(x147 : @kernel.Thm, x148 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let th = x147
    let t149 = @kernel.freesl(@kernel.hyp(th))
    (fn(x151 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
      ((x150 : @list.List[@kernel.Term]) => @lib.union(t149, x150))(x151)
    })(x148)
  }, ths, @list.List([]))
  let (fovars, functions_1, relations) = signature(fvs, @lib.end_itlist((x153 : @kernel.Term, x154 : @kernel.Term) => @lib.curry(fn(x152 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    @bool.mk_conj(x152.0, x152.1)
  }, x153, x154), @lib.map(fn(x155 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x155)
  }, ths)), (@list.List([]), @list.List([]), @list.List([])))
  let trans_var = @lib.itlist2(fn(x156 : @kernel.Term, x157 : Int64, x158 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
    let f = x156
    let n = x157
    let t159 = ("x" + Int64::to_string(n))
    (fn(x161 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
      ((x160 : @lib.Func[@kernel.Term, String]) => @lib.update(f, t159, x160))(x161)
    })(x158)
  }, fovars, @lib.range(1L, Int::to_int64(@lib.length(fovars))), @lib.undefined())
  let trans_fun = @lib.itlist2(fn(x162 : @kernel.Term, x163 : Int64, x164 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
    let f_1 = x162
    let n_1 = x163
    let t165 = ("f" + Int64::to_string(n_1))
    (fn(x167 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
      ((x166 : @lib.Func[@kernel.Term, String]) => @lib.update(f_1, t165, x166))(x167)
    })(x164)
  }, functions_1, @lib.range(1L, Int::to_int64(@lib.length(functions_1))), @lib.undefined())
  let trans_rel = @lib.itlist2(fn(x168 : @kernel.Term, x169 : Int64, x170 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
    let f_2 = x168
    let n_2 = x169
    let t171 = ("R" + Int64::to_string(n_2))
    (fn(x173 : @lib.Func[@kernel.Term, String]) -> @lib.Func[@kernel.Term, String] raise {
      ((x172 : @lib.Func[@kernel.Term, String]) => @lib.update(f_2, t171, x172))(x173)
    })(x170)
  }, relations, @lib.range(1L, Int::to_int64(@lib.length(relations))), @lib.undefined())
  let cls = @lib.map(fn(x176 : @kernel.Thm) -> @list.List[Literal] raise {
    ((x174 : @kernel.Term) => translate_clause((trans_var, trans_fun, trans_rel), x174))((fn(x175 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x175)
    })(x176))
  }, ths)
  let p9cls = @lib.map(fn(x177 : @list.List[Literal]) -> String raise {
    let c = x177
    (prover9_of_clause(c) + ".\n")
  }, cls)
  let t183 = ("formulas(sos).\n" + @lib.itlist(fn(x180 : String, x181 : String) -> String raise {
    let s182 = (fn(x178 : String) -> ((String) -> String raise) raise {
      fn(x179 : String) -> String raise {
        (x178 + x179)
      }
    })(x180)
    s182(x181)
  }, p9cls, "end_of_list.\n"))
  let p9str = ("clear(bell).\n" + (prover9_options().val + t183))
  let filename_in = @lib.temp_file("prover9", ".in")
  let filename_out = @lib.temp_file("prover9", ".out")
  let _ = @lib.file_of_string(filename_in, p9str)
  let retcode = Int::to_int64(@lib.sys_command((prover9() + (" -f " + (filename_in + (" | prooftrans ivy >" + filename_out))))))
  if (retcode != 0L) {
    raise Failure("Prover9 call apparently failed")
  } else {
    let p9proof = @lib.string_of_file(filename_out)
    let _ = if prover9_debugging().val {
      ()
    } else {
      ignore(@lib.sys_remove(filename_in))
      ignore(@lib.sys_remove(filename_out))
    }
    match sexpression(@lexer.lex(skipheader(0L, p9proof))) {
      (Sexp::List(sexps), unp) => {
        let t184 = @lexer.Lexcode::Ident("OBJECT")
        let t185 = @lexer.Lexcode::Ident("PROOF")
        let t186 = @lexer.Lexcode::Ident("OF")
        let t187 = @lexer.Lexcode::Ident("END")
        if (unp != [@lexer.Lexcode::Ident(";;"), t187, t186, t185, t184]) {
          @pp.std_formatter.print_string("Unexpected proof object tail")
          {
            @pp.std_formatter.print_newline()
          }
        } else {
          ()
        }
        let btrans_fun = @lib.itlist(fn(x188 : (@kernel.Term, String), x189 : @lib.Func[String, @kernel.Term]) -> @lib.Func[String, @kernel.Term] raise {
          let (x, y) = x188
          (fn(x191 : @lib.Func[String, @kernel.Term]) -> @lib.Func[String, @kernel.Term] raise {
            ((x190 : @lib.Func[String, @kernel.Term]) => @lib.update(y, x, x190))(x191)
          })(x189)
        }, @lib.graph(trans_fun), @lib.undefined())
        let btrans_rel = @lib.itlist(fn(x192 : (@kernel.Term, String), x193 : @lib.Func[String, @kernel.Term]) -> @lib.Func[String, @kernel.Term] raise {
          let (x_1, y_1) = x192
          (fn(x195 : @lib.Func[String, @kernel.Term]) -> @lib.Func[String, @kernel.Term] raise {
            ((x194 : @lib.Func[String, @kernel.Term]) => @lib.update(y_1, x_1, x194))(x195)
          })(x193)
        }, @lib.graph(trans_rel), @lib.undefined())
        let proof = @lib.map(parse_proofstep, sexps)
        let (asms, undone) = process_proofsteps(ths, (btrans_fun, btrans_rel), @lib.undefined(), proof)
        @lib.find(fn(x196 : @kernel.Thm) -> Bool raise {
          let th_1 = x196
          let t197 = @kernel.mk_const("F", @list.List([]))
          (@kernel.concl(th_1) == t197)
        }, @lib.map(fn(x198 : (String, @kernel.Thm)) -> @kernel.Thm raise {
          x198.1
        }, @lib.graph(asms)))
      }
      _ => raise @lib.MatchFailure("tscript.ml:439")
    }
  }
}

///|
/// PROVER9
fn step_7() -> Unit raise {
  let prule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")))
  let false_tm = @term_syntax.parse_term("false")
  let true_tm = @term_syntax.parse_term("true")
  let t212 = @simp.gen_rewrite_conv(fn(x209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s210 = @equal.top_depth_conv(x209)
    fn(x211 : @kernel.Term) -> @kernel.Thm raise {
      s210(x211)
    }
  }, @list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t208 = @simp.gen_rewrite_conv(fn(x205 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s206 = @equal.top_depth_conv(x205)
    fn(x207 : @kernel.Term) -> @kernel.Thm raise {
      s206(x207)
    }
  }, @list.List([@equal.gsym(@theorems.disj_assoc())]))
  let t204 = @simp.gen_rewrite_conv(fn(x201 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s202 = @equal.redepth_conv(x201)
    fn(x203 : @kernel.Term) -> @kernel.Thm raise {
      s202(x203)
    }
  }, @list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm()]))
  let t199 = @equal.thenc(@canon.skolem_conv, @canon.prenex_conv)
  let t200 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), t199)
  let init_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.top_depth_conv(@equal.beta_conv), @canon.presimp_conv), @canon.conds_elim_conv), @canon.nnfc_conv), @canon.cnf_conv), t200), t204), t208), t212)
  prover9_v1_c.set(fn(x213 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x213
    let tm_p = @bool.mk_neg(tm)
    let ith = init_conv(tm_p)
    let itm = @kernel.rand(@kernel.concl(ith))
    if (itm == true_tm) {
      raise Failure("PROVER9: formula is trivially false")
    } else {
      if (itm == false_tm) {
        prule(@bool.eq_imp_rule(ith).0)
      } else {
        let (evs, bod) = @basics.strip_exists(itm)
        let ths = @lib.map(@bool.spec_all, @bool.conjuncts_rule(@kernel.assume_rule(bod)))
        let ths_p = @lib.end_itlist(fn(x216 : @list.List[@kernel.Thm], x217 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          let s218 = (fn(x214 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
            fn(x215 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
              x214.concat(x215)
            }
          })(x216)
          s218(x217)
        }, @lib.map(fn(x220 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
          @bool.conjuncts_rule(((x219 : @kernel.Thm) => @equal.conv_rule(@canon.cnf_conv, x219))(x220))
        }, ths))
        let rth = prover9_refute(ths_p)
        let eth = @lib.itlist(@bool.simple_choose, evs, rth)
        let sth = @bool.prove_hyp(@bool.undisch(@bool.eq_imp_rule(ith).0), eth)
        prule(@bool.disch(tm_p, sth))
      }
    }
  })
}

///|
let prover9_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("PROVER9")

///|
/// `PROVER9`
pub fn prover9_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (prover9_v1_c.get())(x)
}

///|
/// FRIEND_0
fn step_8() -> Unit raise {
  friend_0_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : P, !(friend : ((P, P)) -> Bool)((x, x))) && !((a : P) == (b : P)) && (∀ x : P, ∀ y : P, friend((x, y)) → friend((y, x))) → (∀ x : P, ∃ y : P, ∃ z : P, friend((x, y)) && !friend((x, z))) || (∀ x : P, ∃ y : P, ∃ z : P, !(y == z) && !friend((x, y)) && !friend((x, z)))")))
}

///|
let friend_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRIEND_0")

///|
/// `FRIEND_0`
pub fn friend_0() -> @kernel.Thm {
  friend_0_c.get()
}

///|
/// FRIEND_1
fn step_9() -> Unit raise {
  friend_1_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : P, !(friend : ((P, P)) -> Bool)((x, x))) && IN((a : P), (s : (P) -> Bool)) && IN((b : P), s) && !(a == b) && (∀ x : P, ∀ y : P, friend((x, y)) → friend((y, x))) → (∀ x : P, IN(x, s) → (∃ y : P, ∃ z : P, IN(y, s) && IN(z, s) && friend((x, y)) && !friend((x, z)))) || (∀ x : P, IN(x, s) → (∃ y : P, ∃ z : P, IN(y, s) && IN(z, s) && !(y == z) && !friend((x, y)) && !friend((x, z))))")))
}

///|
let friend_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRIEND_1")

///|
/// `FRIEND_1`
pub fn friend_1() -> @kernel.Thm {
  friend_1_c.get()
}

///|
/// LOS
fn step_10() -> Unit raise {
  los_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : _, ∀ y : _, ∀ z : _, (P : ((_, _)) -> Bool)((x, y)) && P((y, z)) → P((x, z))) && (∀ x : _, ∀ y : _, ∀ z : _, (Q : ((_, _)) -> Bool)((x, y)) && Q((y, z)) → Q((x, z))) && (∀ x : _, ∀ y : _, Q((x, y)) → Q((y, x))) && (∀ x : _, ∀ y : _, P((x, y)) || Q((x, y))) && !P(((a : _), (b : _))) && !Q(((c : _), (d : _))) → false")))
}

///|
let los_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOS")

///|
/// `LOS`
pub fn los() -> @kernel.Thm {
  los_c.get()
}

///|
/// CONWAY_1
fn step_11() -> Unit raise {
  conway_1_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 0 + x == x) && (∀ x : Num, ∀ y : Num, x + y == y + x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x + (y + z) == x + y + z) && (∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y * z) == x * y * z) && (∀ x : Num, 0 * x == 0) && (∀ x : Num, x * 0 == 0) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y + z) == x * y + x * z) && (∀ x : Num, ∀ y : Num, ∀ z : Num, (x + y) * z == x * z + y * z) && (∀ x : Num, ∀ y : Num, (star : (Num) -> Num)(x * y) == 1 + x * (star(y * x) * y)) && (∀ x : Num, ∀ y : Num, star(x + y) == star(star(x) * y) * star(x)) → star(star(star(1))) == star(star(1))")))
}

///|
let conway_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONWAY_1")

///|
/// `CONWAY_1`
pub fn conway_1() -> @kernel.Thm {
  conway_1_c.get()
}

///|
/// CONWAY_2
fn step_12() -> Unit raise {
  conway_2_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 0 + x == x) && (∀ x : Num, ∀ y : Num, x + y == y + x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x + (y + z) == x + y + z) && (∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y * z) == x * y * z) && (∀ x : Num, 0 * x == 0) && (∀ x : Num, x * 0 == 0) && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * (y + z) == x * y + x * z) && (∀ x : Num, ∀ y : Num, ∀ z : Num, (x + y) * z == x * z + y * z) && (∀ x : Num, ∀ y : Num, (star : (Num) -> Num)(x * y) == 1 + x * (star(y * x) * y)) && (∀ x : Num, ∀ y : Num, star(x + y) == star(star(x) * y) * star(x)) → (∀ a : Num, star(star(star(star(a)))) == star(star(star(a))))")))
}

///|
let conway_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONWAY_2")

///|
/// `CONWAY_2`
pub fn conway_2() -> @kernel.Thm {
  conway_2_c.get()
}

///|
/// ECKMAN_HILTON_1
fn step_13() -> Unit raise {
  eckman_hilton_1_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, 1 + x == x) && (∀ x : Num, x + 1 == x) && (∀ w : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, w * x + y * z == (w + y) * (x + z)) → (∀ a : Num, ∀ b : Num, a * b == a + b)")))
}

///|
let eckman_hilton_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ECKMAN_HILTON_1")

///|
/// `ECKMAN_HILTON_1`
pub fn eckman_hilton_1() -> @kernel.Thm {
  eckman_hilton_1_c.get()
}

///|
/// ECKMAN_HILTON_2
fn step_14() -> Unit raise {
  eckman_hilton_2_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, 1 + x == x) && (∀ x : Num, x + 1 == x) && (∀ w : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, w * x + y * z == (w + y) * (x + z)) → (∀ a : Num, ∀ b : Num, a * b == b * a)")))
}

///|
let eckman_hilton_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ECKMAN_HILTON_2")

///|
/// `ECKMAN_HILTON_2`
pub fn eckman_hilton_2() -> @kernel.Thm {
  eckman_hilton_2_c.get()
}

///|
/// ECKMAN_HILTON_3
fn step_15() -> Unit raise {
  eckman_hilton_3_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, 0 + x == x) && (∀ x : Num, x + 0 == x) && (∀ w : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, w * x + y * z == (w + y) * (x + z)) → (∀ a : Num, ∀ b : Num, a * b == b * a)")))
}

///|
let eckman_hilton_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ECKMAN_HILTON_3")

///|
/// `ECKMAN_HILTON_3`
pub fn eckman_hilton_3() -> @kernel.Thm {
  eckman_hilton_3_c.get()
}

///|
/// ECKMAN_HILTON_4
fn step_16() -> Unit raise {
  eckman_hilton_4_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, 1 * x == x) && (∀ x : Num, x * 1 == x) && (∀ x : Num, 0 + x == x) && (∀ x : Num, x + 0 == x) && (∀ w : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, w * x + y * z == (w + y) * (x + z)) → (∀ a : Num, ∀ b : Num, a + b == a * b)")))
}

///|
let eckman_hilton_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ECKMAN_HILTON_4")

///|
/// `ECKMAN_HILTON_4`
pub fn eckman_hilton_4() -> @kernel.Thm {
  eckman_hilton_4_c.get()
}

///|
/// DOUBLE_DISTRIB
fn step_17() -> Unit raise {
  double_distrib_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(∀ x : Num, ∀ y : Num, ∀ z : Num, x * y * z == x * z * (y * z)) && (∀ x : Num, ∀ y : Num, ∀ z : Num, z * (x * y) == z * x * (z * y)) → (∀ a : Num, ∀ b : Num, ∀ c : Num, a * b * (c * a) == a * c * (b * a))")))
}

///|
let double_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOUBLE_DISTRIB")

///|
/// `DOUBLE_DISTRIB`
pub fn double_distrib() -> @kernel.Thm {
  double_distrib_c.get()
}

///|
/// MOORE_PENROSE_PSEUDOINVERSE_UNIQUE
fn step_18() -> Unit raise {
  moore_penrose_pseudoinverse_unique_c.set(@lib.time(prover9_v1, @term_syntax.parse_term("(X : Num) * ((A : Num) * X) == X && (transpose : (Num) -> Num)(A * X) == A * X && A * (X * A) == A && transpose(X * A) == X * A && (Y : Num) * (A * Y) == Y && transpose(A * Y) == A * Y && A * (Y * A) == A && transpose(Y * A) == Y * A && (∀ x : Num, ∀ y : Num, ∀ z : Num, x * y * z == x * (y * z)) && (∀ x : Num, ∀ y : Num, transpose(x * y) == transpose(y) * transpose(x)) → X == Y")))
}

///|
let moore_penrose_pseudoinverse_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOORE_PENROSE_PSEUDOINVERSE_UNIQUE")

///|
/// `MOORE_PENROSE_PSEUDOINVERSE_UNIQUE`
pub fn moore_penrose_pseudoinverse_unique() -> @kernel.Thm {
  moore_penrose_pseudoinverse_unique_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
}
