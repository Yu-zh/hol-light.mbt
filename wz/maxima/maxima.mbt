// Translated from upstream WZ/maxima.ml; edit this file directly.

///|
/// wz_maxima_binops
fn step_1() -> Unit raise {
  let t1 = (@term_syntax.parse_term("spow"), "^")
  let t2 = (@term_syntax.parse_term("real_pow"), "^")
  let t3 = (@term_syntax.parse_term("EXP"), "^")
  let t4 = (@term_syntax.parse_term("real_div"), "/")
  let t5 = (@term_syntax.parse_term("real_mul"), "*")
  let t6 = (@term_syntax.parse_term("real_sub"), "-")
  let t7 = (@term_syntax.parse_term("real_add"), "+")
  let t8 = (@term_syntax.parse_term("(op_star : (Num, Num) -> Num)"), "*")
  let t9 = (@term_syntax.parse_term("(op_minus : (Num, Num) -> Num)"), "-")
  wz_maxima_binops_c.set(@list.List([(@term_syntax.parse_term("(op_plus : (Num, Num) -> Num)"), "+"), t9, t8, t7, t6, t5, t4, t3, t2, t1]))
}

///|
let wz_maxima_binops_c : @lib.Cell[@list.List[(@kernel.Term, String)]] = @lib.Cell::new("wz_maxima_binops")

///|
/// `wz_maxima_binops`
pub fn wz_maxima_binops() -> @list.List[(@kernel.Term, String)] {
  wz_maxima_binops_c.get()
}

///|
/// wz_maxima_real_of_num
fn step_2() -> Unit raise {
  wz_maxima_real_of_num_c.set(@term_syntax.parse_term("real_of_num"))
}

///|
let wz_maxima_real_of_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("wz_maxima_real_of_num")

///|
/// `wz_maxima_real_of_num`
pub fn wz_maxima_real_of_num() -> @kernel.Term {
  wz_maxima_real_of_num_c.get()
}

///|
/// wz_maxima_neg
fn step_3() -> Unit raise {
  wz_maxima_neg_c.set(@term_syntax.parse_term("real_neg"))
}

///|
let wz_maxima_neg_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("wz_maxima_neg")

///|
/// `wz_maxima_neg`
pub fn wz_maxima_neg() -> @kernel.Term {
  wz_maxima_neg_c.get()
}

///|
/// wz_maxima_binom
fn step_4() -> Unit raise {
  wz_maxima_binom_c.set(@term_syntax.parse_term("binom"))
}

///|
let wz_maxima_binom_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("wz_maxima_binom")

///|
/// `wz_maxima_binom`
pub fn wz_maxima_binom() -> @kernel.Term {
  wz_maxima_binom_c.get()
}

///|
/// wz_maxima_rbinom
fn step_5() -> Unit raise {
  wz_maxima_rbinom_c.set(@term_syntax.parse_term("rbinom"))
}

///|
let wz_maxima_rbinom_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("wz_maxima_rbinom")

///|
/// `wz_maxima_rbinom`
pub fn wz_maxima_rbinom() -> @kernel.Term {
  wz_maxima_rbinom_c.get()
}

///|
/// wz_maxima_fact
fn step_6() -> Unit raise {
  wz_maxima_fact_c.set(@term_syntax.parse_term("FACT"))
}

///|
let wz_maxima_fact_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("wz_maxima_fact")

///|
/// `wz_maxima_fact`
pub fn wz_maxima_fact() -> @kernel.Term {
  wz_maxima_fact_c.get()
}

///|
/// `wz_maxima_name`
pub fn wz_maxima_name(x10 : String) -> String raise {
  let s = x10
  if ((s != "") && (@lib.forall(fn(x11 : String) -> Bool raise {
    let c = x11
    (@printer.isalnum(c) || (c == "_"))
  }, @lib.explode(s)) && !@printer.isnum(@lib.hd(@lib.explode(s))))) {
    s
  } else {
    raise Failure(("wz_maxima_name: unsupported variable name " + s))
  }
}

///|
/// `wz_maxima_string_of_term`
pub fn wz_maxima_string_of_term(x12 : @kernel.Term) -> String raise {
  let tm = x12
  if @calc_int.is_ratconst(tm) {
    ("(" + (@num.string_of_num(@calc_int.rat_of_term(tm)) + ")"))
  } else {
    if @nums.is_numeral(tm) {
      @num.string_of_num(@basics.dest_numeral(tm))
    } else {
      if @kernel.is_var(tm) {
        wz_maxima_name(@kernel.dest_var(tm).0)
      } else {
        if (@kernel.is_comb(tm) && (@kernel.rator(tm) == wz_maxima_real_of_num())) {
          wz_maxima_string_of_term(@kernel.rand(tm))
        } else {
          if (@kernel.is_comb(tm) && (@kernel.rator(tm) == wz_maxima_neg())) {
            ("-(" + (wz_maxima_string_of_term(@kernel.rand(tm)) + ")"))
          } else {
            if (@kernel.is_comb(tm) && (@kernel.rator(tm) == wz_maxima_fact())) {
              ("factorial(" + (wz_maxima_string_of_term(@kernel.rand(tm)) + ")"))
            } else {
              if (@kernel.is_comb(tm) && (@kernel.rator(tm) == wz_maxima_binom())) {
                let (l, r) = @pair.dest_pair(@kernel.rand(tm))
                let t13 = ("," + (wz_maxima_string_of_term(r) + ")"))
                ("binomial(" + (wz_maxima_string_of_term(l) + t13))
              } else {
                if (@kernel.is_comb(tm) && (@kernel.rator(tm) == wz_maxima_rbinom())) {
                  let (l_1, r_1) = @pair.dest_pair(@kernel.rand(tm))
                  let t14 = ("," + (wz_maxima_string_of_term(r_1) + ")"))
                  ("binomial(" + (wz_maxima_string_of_term(l_1) + t14))
                } else {
                  @lib.tryfind(fn(x15 : (@kernel.Term, String)) -> String raise {
                    let (op, s) = x15
                    let (l_2, r_2) = @basics.dest_binop(op, tm)
                    let t16 = (s + (wz_maxima_string_of_term(r_2) + ")"))
                    ("(" + (wz_maxima_string_of_term(l_2) + t16))
                  }, wz_maxima_binops())
                }
              }
            }
          }
        }
      }
    }
  }
}

///|
/// `wz_maxima_object`
pub(all) enum WzMaximaObject {
  Wzterm(@kernel.Term)
  Wzlist(@list.List[WzMaximaObject])
} derive(Eq, Debug)

///|
pub extend WzMaximaObject with Eq::{not_equal, equal}

///|
pub extend WzMaximaObject with Debug::{to_repr}

///|
pub extend WzMaximaObject with @lib.OCompare::{ocompare}

///|
pub extend WzMaximaObject with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_WzMaximaObject(x : WzMaximaObject) -> Int {
  match x {
    Wzterm(_) => 1000000
    Wzlist(_) => 1000001
  }
}

///|
pub impl @lib.OCompare for WzMaximaObject with fn ocompare(self, other) {
  match (self, other) {
    (Wzterm(a0), Wzterm(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Wzlist(a0), Wzlist(b0)) => {
      
      @lib.compare(a0, b0)
    }
    _ => ocaml_rank_WzMaximaObject(self).compare(ocaml_rank_WzMaximaObject(other))
  }
}

///|
pub impl @lib.OHash for WzMaximaObject with fn ohash_visit(self, h) {
  match self {
    Wzterm(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Wzlist(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `wz_maxima_tokens`
pub fn wz_maxima_tokens(x17 : String) -> @list.List[String] raise {
  let s = x17
  @list.List(@lexer.lex(s).map(fn(x18 : @lexer.Lexcode) -> String raise {
    match x18 {
      @lexer.Lexcode::Ident(s_1) => s_1
      @lexer.Lexcode::Resword(s_2) => s_2
    }
  }))
}

///|
/// `wz_maxima_mk_pow`
pub fn wz_maxima_mk_pow(x19 : @kernel.Term, x20 : @kernel.Term) -> @kernel.Term raise {
  let x = x19
  let y = x20
  try {
    let (op, n) = @kernel.dest_comb(y)
    if ((op == wz_maxima_real_of_num()) && @nums.is_numeral(n)) {
      @basics.mk_binop(@term_syntax.parse_term("real_pow"), x, n)
    } else {
      @lib.failure()
    }
  } catch {
    Failure(_) => raise Failure("wz_maxima_mk_pow: non-natural exponent")
    e => raise e
  }
}

///|
/// `wz_maxima_mk_neg`
pub fn wz_maxima_mk_neg(x21 : @kernel.Term) -> @kernel.Term raise {
  let x = x21
  try {
    let (l, r) = @basics.dest_binop(@term_syntax.parse_term("real_div"), x)
    let t22 = @kernel.mk_comb(wz_maxima_neg(), l)
    @basics.mk_binop(@term_syntax.parse_term("real_div"), t22, r)
  } catch {
    Failure(_) => @kernel.mk_comb(wz_maxima_neg(), x)
    e => raise e
  }
}

///|
/// `wz_maxima_parse_expression`
pub fn wz_maxima_parse_expression(x23 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp = x23
  wz_maxima_parse_sum(inp)
}

///|
/// `wz_maxima_parse_sum`
pub fn wz_maxima_parse_sum(x24 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_1 = x24
  let (x, rst) = wz_maxima_parse_difference(inp_1)
  match rst {
    More("+", tail=rst_p) => {
      let (y, rst_p_p) = wz_maxima_parse_sum(rst_p)
      (@basics.mk_binop(@term_syntax.parse_term("real_add"), x, y), rst_p_p)
    }
    _ => (x, rst)
  }
}

///|
/// `wz_maxima_parse_difference`
pub fn wz_maxima_parse_difference(x25 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_2 = x25
  let (x_1, rst_1) = wz_maxima_parse_product(inp_2)
  wz_maxima_parse_difference_tail(x_1, rst_1)
}

///|
/// `wz_maxima_parse_difference_tail`
pub fn wz_maxima_parse_difference_tail(x26 : @kernel.Term, x27 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let x_2 = x26
  let inp_3 = x27
  match inp_3 {
    More("-", tail=rst_2) => {
      let (y_1, rst_p_1) = wz_maxima_parse_product(rst_2)
      wz_maxima_parse_difference_tail(@basics.mk_binop(@term_syntax.parse_term("real_sub"), x_2, y_1), rst_p_1)
    }
    _ => (x_2, inp_3)
  }
}

///|
/// `wz_maxima_parse_product`
pub fn wz_maxima_parse_product(x28 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_4 = x28
  let (x_3, rst_3) = wz_maxima_parse_quotient(inp_4)
  match rst_3 {
    More("*", tail=rst_p_2) => {
      let (y_2, rst_p_p_1) = wz_maxima_parse_product(rst_p_2)
      (@basics.mk_binop(@term_syntax.parse_term("real_mul"), x_3, y_2), rst_p_p_1)
    }
    _ => (x_3, rst_3)
  }
}

///|
/// `wz_maxima_parse_quotient`
pub fn wz_maxima_parse_quotient(x29 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_5 = x29
  let (x_4, rst_4) = wz_maxima_parse_unary(inp_5)
  wz_maxima_parse_quotient_tail(x_4, rst_4)
}

///|
/// `wz_maxima_parse_quotient_tail`
pub fn wz_maxima_parse_quotient_tail(x30 : @kernel.Term, x31 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let x_5 = x30
  let inp_6 = x31
  match inp_6 {
    More("/", tail=rst_5) => {
      let (y_3, rst_p_3) = wz_maxima_parse_unary(rst_5)
      wz_maxima_parse_quotient_tail(@basics.mk_binop(@term_syntax.parse_term("real_div"), x_5, y_3), rst_p_3)
    }
    _ => (x_5, inp_6)
  }
}

///|
/// `wz_maxima_parse_unary`
pub fn wz_maxima_parse_unary(x32 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_7 = x32
  match inp_7 {
    More("-", tail=rst_6) => {
      let (x_6, rst_p_4) = wz_maxima_parse_unary(rst_6)
      (wz_maxima_mk_neg(x_6), rst_p_4)
    }
    _ => wz_maxima_parse_power(inp_7)
  }
}

///|
/// `wz_maxima_parse_power`
pub fn wz_maxima_parse_power(x33 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_8 = x33
  let (x_7, rst_7) = wz_maxima_parse_atom(inp_8)
  match rst_7 {
    More("^", tail=rst_p_5) => {
      let (y_4, rst_p_p_2) = wz_maxima_parse_unary(rst_p_5)
      (wz_maxima_mk_pow(x_7, y_4), rst_p_p_2)
    }
    _ => (x_7, rst_7)
  }
}

///|
/// `wz_maxima_parse_atom`
pub fn wz_maxima_parse_atom(x34 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_9 = x34
  match inp_9 {
    More("(", tail=rst_8) => {
      let (x_8, rst_p_6) = wz_maxima_parse_expression(rst_8)
      match rst_p_6 {
        More(")", tail=rst_p_p_3) => (x_8, rst_p_p_3)
        _ => raise Failure("wz_maxima_parse_atom: expected )")
      }
    }
    More(s, tail=rst_9) if ((s != "") && @lib.forall(fn(x35 : String) -> Bool raise {
  @printer.isnum(x35)
}, @lib.explode(s))) => (@calc_int.term_of_rat(@num.num_of_string(s)), rst_9)
    More(s_1, tail=rst_10) if ((s_1 != "") && @lib.forall(fn(x36 : String) -> Bool raise {
  let c = x36
  (@printer.isalnum(c) || (c == "_"))
}, @lib.explode(s_1))) => {
      let t37 = @term_syntax.parse_type("Real")
      (@kernel.mk_var(wz_maxima_name(s_1), t37), rst_10)
    }
    _ => raise Failure("wz_maxima_parse_atom: expression expected")
  }
}

///|
/// `wz_maxima_parse_object`
pub fn wz_maxima_parse_object(x38 : @list.List[String]) -> ((WzMaximaObject, @list.List[String])) raise {
  let inp = x38
  match inp {
    More("[", tail=More("]", tail=rst)) => (WzMaximaObject::Wzlist(@list.List([])), rst)
    More("[", tail=rst_1) => {
      let (x, rst_p) = wz_maxima_parse_object(rst_1)
      wz_maxima_parse_list(@list.List([x]), rst_p)
    }
    _ => {
      let (x_1, rst_2) = wz_maxima_parse_expression(inp)
      (WzMaximaObject::Wzterm(x_1), rst_2)
    }
  }
}

///|
/// `wz_maxima_parse_list`
pub fn wz_maxima_parse_list(x39 : @list.List[WzMaximaObject], x40 : @list.List[String]) -> ((WzMaximaObject, @list.List[String])) raise {
  let acc = x39
  let inp_1 = x40
  match inp_1 {
    More(",", tail=rst_3) => {
      let (x_2, rst_p_1) = wz_maxima_parse_object(rst_3)
      wz_maxima_parse_list(acc.prepend(x_2), rst_p_1)
    }
    More("]", tail=rst_4) => (WzMaximaObject::Wzlist(@lib.rev(acc)), rst_4)
    _ => raise Failure("wz_maxima_parse_list: expected , or ]")
  }
}

///|
/// `wz_maxima_certificate_of_string`
pub fn wz_maxima_certificate_of_string(x41 : String) -> ((@kernel.Term, @list.List[@kernel.Term])) raise {
  let s = x41
  let (obj, rst) = wz_maxima_parse_object(wz_maxima_tokens(s))
  if !@list.List::is_empty(rst) {
    raise Failure("wz_maxima_certificate_of_string: trailing input")
  } else {
    match obj {
      WzMaximaObject::Wzlist(More(WzMaximaObject::Wzlist(More(WzMaximaObject::Wzterm(r), tail=More(WzMaximaObject::Wzlist(cs), tail=Empty))), tail=_)) => {
        let dest : (WzMaximaObject) -> @kernel.Term raise = fn(x42 : WzMaximaObject) -> @kernel.Term raise {
          match x42 {
            WzMaximaObject::Wzterm(c) => c
            _ => raise Failure("wz_maxima_certificate_of_string: bad coefficient")
          }
        }
        (r, @lib.map(dest, cs))
      }
      _ => raise Failure("wz_maxima_certificate_of_string: bad result")
    }
  }
}

///|
/// wz_maxima_executable
fn step_7() -> Unit raise {
  wz_maxima_executable_c.set(Ref::{ val: "maxima" })
}

///|
let wz_maxima_executable_c : @lib.Cell[Ref[String]] = @lib.Cell::new("wz_maxima_executable")

///|
/// `wz_maxima_executable`
pub fn wz_maxima_executable() -> Ref[String] {
  wz_maxima_executable_c.get()
}

///|
/// `wz_maxima_output`
pub fn wz_maxima_output(x43 : String) -> String raise {
  let input = x43
  let marker = "__HOL_LIGHT_WZ_RESULT__"
  let infile = @lib.temp_file("hol_wz", ".mac")
  let outfile = @lib.temp_file("hol_wz", ".out")
  let cleanup : (Unit) -> Unit raise = fn(x44 : Unit) -> Unit raise {
    let _ = x44
    if @lib.sys_file_exists(infile) {
      @lib.sys_remove(infile)
    } else {
      ()
    }
    if @lib.sys_file_exists(outfile) {
      @lib.sys_remove(outfile)
    } else {
      ()
    }
  }
  let marker_length = Int::to_int64(@lib.string_length(marker))
  fn extract(x45 : @list.List[String]) -> String raise {
    match x45 {
      Empty => raise Failure("wz_maxima_output: output marker not found")
      More(h, tail=t) => {
        if ((Int::to_int64(@lib.string_length(h)) >= marker_length) && (@lib.string_sub(h, 0, @lib.int63_to_int(marker_length)) == marker)) {
          @lib.string_sub(h, @lib.int63_to_int(marker_length), @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(h)), marker_length)))
        } else {
          extract(t)
        }
      }
    }
  }
  try {
    @lib.file_of_string(infile, ("display2d:false$\n" + ("linel:100000$\n" + ("load(zeilberger)$\n" + ("printf(true,\"" + (marker + ("~a~%\"," + (input + (")$\n" + "quit()$\n")))))))))
    let t46 = (" >" + (@lib.filename_quote(outfile) + " 2>&1"))
    let t47 = (" --very-quiet --batch=" + (@lib.filename_quote(infile) + t46))
    let command = (@lib.filename_quote(wz_maxima_executable().val) + t47)
    if (Int::to_int64(@lib.sys_command(command)) != 0L) {
      let output = @lib.string_of_file(outfile)
      raise Failure(("wz_maxima_output: Maxima failed\n" + output))
    } else {
      let output_1 = extract(@lib.strings_of_file(outfile))
      cleanup(())
      output_1
    }
  } catch {
    exn => {
      cleanup(())
      raise exn
    }
  }
}

///|
/// `WZ_MAXIMA_CERTIFICATE`
pub fn wz_maxima_certificate(x48 : @kernel.Term, x49 : @kernel.Term) -> ((@kernel.Term, @list.List[@kernel.Term])) raise {
  let ntm = x48
  let stm = x49
  let (ktm, bod) = @kernel.dest_abs(@kernel.rand(stm))
  let t50 = ("," + (wz_maxima_string_of_term(ntm) + ")"))
  let t51 = ("," + (wz_maxima_string_of_term(ktm) + t50))
  let command = ("Zeilberger(" + (wz_maxima_string_of_term(bod) + t51))
  let (rtm, ctm) = wz_maxima_certificate_of_string(wz_maxima_output(command))
  let variables = @lib.setify(@kernel.frees(stm).prepend(ktm))
  let instantiations = @lib.map(fn(x52 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let v = x52
    let (name, ty) = @kernel.dest_var(v)
    let replacement = if (ty == @term_syntax.parse_type("Num")) {
      @kernel.mk_comb(wz_maxima_real_of_num(), v)
    } else {
      if (ty == @term_syntax.parse_type("Real")) {
        v
      } else {
        raise Failure("WZ_MAXIMA_CERTIFICATE: unsupported variable type")
      }
    }
    (replacement, @kernel.mk_var(name, @term_syntax.parse_type("Real")))
  }, variables)
  let t54 = @lib.map((x53 : @kernel.Term) => @basics.subst(instantiations, x53), ctm)
  (@basics.subst(instantiations, rtm), t54)
}

///|
/// `WZ_MAXIMA_PROVE`
pub fn wz_maxima_prove(x55 : @kernel.Term, x56 : @kernel.Term, x57 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
  let ntm = x55
  let stm = x56
  let atm = x57
  let (rtm, ctm) = wz_maxima_certificate(ntm, stm)
  @wz.wz_prove(ntm, stm, rtm, ctm, atm)
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
}
